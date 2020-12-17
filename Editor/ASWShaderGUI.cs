using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

public class ASWShaderGUI : ShaderGUI
{
  BindingFlags bindingFlags = BindingFlags.Public |
                              BindingFlags.NonPublic |
                              BindingFlags.Instance |
                              BindingFlags.Static;


  private static class Styles
  {
      public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
      public static GUIContent sssText = new GUIContent("SSS Texture", "[Character Indentifier]_SSS");
      public static GUIContent ilmText = new GUIContent("ILM Texture", "[Character Indentifier]_ILM");
      public static GUIContent detailText = new GUIContent("Detail Texture", "[Character Indentifier]_Detail");
      public static GUIContent _MetalMatcapText = new GUIContent("Metal Texture", "metal. Only used by Frieza and Cooler from DBFZ as far as I am aware");
      public static GUIContent glowMaskText = new GUIContent("Glow Mask", "[Character Indentifier]_GlowMask. Used by few characters.");
  }

  MaterialProperty _EditorVersion = null;

  MaterialProperty _Base = null;
  MaterialProperty _SSS = null;
  MaterialProperty _ILM = null;
  MaterialProperty _Detail = null;

  MaterialProperty _EnableColorReplacer = null;
  MaterialProperty _TotalReplacements = null;

  MaterialProperty _Source1Color = null;
  MaterialProperty _Source1Fuzziness = null;
  MaterialProperty _Target1Color = null;

  MaterialProperty _Source2Color = null;
  MaterialProperty _Source2Fuzziness = null;
  MaterialProperty _Target2Color = null;

  MaterialProperty _Source3Color = null;
  MaterialProperty _Source3Fuzziness = null;
  MaterialProperty _Target3Color = null;

  MaterialProperty _Source4Color = null;
  MaterialProperty _Source4Fuzziness = null;
  MaterialProperty _Target4Color = null;

  MaterialProperty _Source5Color = null;
  MaterialProperty _Source5Fuzziness = null;
  MaterialProperty _Target5Color = null;

  MaterialProperty _ILMColorSetting = null;
  MaterialProperty _ILMColor = null;
  MaterialProperty _ILMEmissiveIntensity = null;
  MaterialProperty _EnableILMEmission = null;

  MaterialProperty _DetailColorSetting = null;
  MaterialProperty _DetailColor = null;
  MaterialProperty _DetailEmissiveIntensity = null;
  MaterialProperty _EnableDetailEmission = null;

  MaterialProperty _EnableMatcap = null;
  MaterialProperty _MetalMatcap = null;
  MaterialProperty _MetalAIntensity = null;
  MaterialProperty _MetalBIntensity = null;
  MaterialProperty _EnableGlowmask = null;
  MaterialProperty _GlowMask = null;
  MaterialProperty _GlowMaskMultSystem = null;
  MaterialProperty _GlowMaskIntensity = null;
  MaterialProperty _GlowMaskTint = null;
  MaterialProperty _FakeLightColor = null;
  MaterialProperty _FakeLightDirX = null;
  MaterialProperty _FakeLightDirY = null;
  MaterialProperty _ViewDirOffsetPitch = null;
  MaterialProperty _ViewDirOffsetYaw = null;
  //MaterialProperty _ViewDirOffsetZ = null;
  MaterialProperty _LightDirectionSetting = null;
  MaterialProperty _LightColorSetting = null;
  MaterialProperty _FakeLightFallbackDirection = null;
  MaterialProperty _GlobalIntensityMinimum = null;
  MaterialProperty _FakeLightIntensity = null;
  MaterialProperty _ShadowBrightness = null;
  MaterialProperty _ILMGShadingThreshold = null;
  MaterialProperty _ShadowLayer1Push = null;
  MaterialProperty _ShadowLayer1Fuzziness = null;
  MaterialProperty _ShadowLayer1Intensity = null;
  MaterialProperty _ShadowLayer2Push = null;
  MaterialProperty _ShadowLayer2Fuzziness = null;
  MaterialProperty _ShadowLayer2Intensity = null;
  MaterialProperty _ILMLayer1 = null;
  MaterialProperty _ILMLayer2 = null;
  MaterialProperty _VertexLayer1 = null;
  MaterialProperty _VertexLayer2 = null;
  MaterialProperty _SpecularSize = null;
  MaterialProperty _SpecularIntensity = null;
  //MaterialProperty _SpecularFuzzy = null;
  MaterialProperty _EnableFresnel = null;
  MaterialProperty _DarkHighlightMult = null;
  MaterialProperty _HighlightPower = null;
  MaterialProperty _HighlightFreselFuzzy = null;
  MaterialProperty _HighlightIntensity = null;
  MaterialProperty _HighlightScale = null;
  MaterialProperty _FresnelSystem = null;
  MaterialProperty _GranblueDarkenScale = null;
  MaterialProperty _GranblueDarkenPower = null;
  MaterialProperty _EnableOutline = null;
  MaterialProperty _OutlineThickness = null;
  MaterialProperty _DepthOffset = null;
  MaterialProperty _DepthCalculation = null;
  MaterialProperty _OutlineColor = null;
  MaterialProperty _OutlineColorIntensity = null;
  MaterialProperty _EnableLightColorMult = null;

  MaterialProperty _EnableBaseColorMult = null;
  MaterialProperty _EnableCameraDistanceMult = null;
  MaterialProperty _CameraDistanceMult = null;

  MaterialProperty _ALPHATEST = null;
  MaterialProperty _DebugColor = null;
  MaterialProperty _DebugGroup = null;
  MaterialProperty _VertexChannel = null;
  MaterialProperty _ILMChannel = null;
  MaterialProperty _BaseSSSAlphaSwap = null;

  public static Dictionary<Material, ASWToggles > foldouts = new Dictionary<Material, ASWToggles>();
  ASWToggles toggles = new ASWToggles(
  	new bool[] {
      false, // Presets
  		false, // Global
  			false,
  		true, // Main Textures
        false,
  			false,
  			false,
        false,
  			false,
  		true, // Light Settings
  			false,
  			false,
  		false, // Fresnel Settings
  			false,
  			false,
  		false, // Outline Settings
  			false,
  			false,
  		false, // Debug
  		false // Credits
  	},
  	new string[] {
  		"PRESETS",
  		"Global Settings",
  			"Fake Light Settings",
  		"Main Textures",
        "Color Replacer",
  			"ILM Body Lines Color",
  			"Detail Lines Color",
  			"Metal Matcap",
  			"Glow Mask",
  		"Light Settings",
  			"Shadow Settings",
  			"Specular Settings",
  		"Fresnel Settings",
  			"Highlight Fresnel",
  			"Granblue Darken Fresnel",
  		"Outline Settings",
  			"Thickness",
  			"Color",
  		"Debug",
  		"Credits"
  	}
  );

  public static List<string> presetsList = new List<string>();
  public static string[] presets;

  int popupIndex = 0;
  string presetText = "";
  string dirPath = "Assets/Aerthas-Unity-Shaders/Arc System Works Shader/Presets/";

  public override void OnGUI(MaterialEditor me, MaterialProperty[] props)
  {
    Material mat = (Material)me.target;

  	foreach (var property in GetType().GetFields(bindingFlags)){
        if (property.FieldType == typeof(MaterialProperty))
        {
            property.SetValue(this, FindProperty(property.Name, props));
        }
    }

    if (!foldouts.ContainsKey(mat))
		foldouts.Add(mat, toggles);

		DirectoryInfo dir = new DirectoryInfo(dirPath);
		FileInfo[] info = dir.GetFiles();
		foreach (FileInfo f in info){
			if (!f.Name.Contains(".meta") && f.Name.Contains(".mat")){
				Material candidate = (Material)AssetDatabase.LoadAssetAtPath(dirPath + f.Name, typeof(Material));
				if (candidate.shader.name == mat.shader.name){
					int indOf = f.Name.IndexOf(".");
					presetsList.Add(f.Name.Substring(0, indOf));
				}
			}
		}
		presets = presetsList.ToArray();

    //Findprops(props);              // Find props
    EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
    EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

    string[] shaderVersion = mat.shader.name.Split('v');

    if(_EditorVersion.floatValue == 1){
      ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Merged Light v" + "<color=#aa0000ff> "+shaderVersion[1]+"</color>" + "<color=#000000ff> - </color><color=#edba00ff> Advanced</color><color=#000000ff>  }</color>");
    }
    else{
		  ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Merged Light v" + "<color=#aa0000ff> "+shaderVersion[1]+"</color>" + "<color=#000000ff> - </color><color=#00aaaaff> Basic</color><color=#000000ff>  }</color>");
    }

		EditorGUI.BeginChangeCheck();
		{
      if (ASWStyles.DoFoldout(foldouts, mat, me, "PRESETS")){
        GUILayout.Space(4);
        float buttonWidth = EditorGUIUtility.labelWidth-5.0f;
        if (ASWStyles.SimpleButton("Capture", buttonWidth, 0)){
          presetText = ASWStyles.ReplaceInvalidChars(presetText);
          string filePath = dirPath + presetText + ".mat";
          Material newMat = new Material(mat);
          AssetDatabase.CreateAsset(newMat, filePath);
          AssetDatabase.Refresh();
        }
        GUILayout.Space(-17);
        Rect r = EditorGUILayout.GetControlRect();
        r.x += EditorGUIUtility.labelWidth;
        r.width = ASWStyles.GetPropertyWidth();
        presetText = EditorGUI.TextArea(r, presetText);
        if (ASWStyles.SimpleButton("Apply", buttonWidth, 0)){
          string presetPath = dirPath + presets[popupIndex] + ".mat";
          Material selectedMat = (Material)AssetDatabase.LoadAssetAtPath(presetPath, typeof(Material));
          mat.CopyPropertiesFromMaterial(selectedMat);
        }
        GUILayout.Space(-17);
        r = EditorGUILayout.GetControlRect();
        r.x += EditorGUIUtility.labelWidth;
        r.width = ASWStyles.GetPropertyWidth();
        popupIndex = EditorGUI.Popup(r, popupIndex, presets);
        GUILayout.Label("Presets are stored in:\n\""+dirPath+"\"",EditorStyles.textArea);
      }

	    // Global props
			if (ASWStyles.DoFoldout(foldouts, mat, me, "Global Settings")){
        me.ShaderProperty(_EditorVersion, _EditorVersion.displayName);
        GUILayout.BeginHorizontal ("box");
        GUILayout.FlexibleSpace();
        if(_EditorVersion.floatValue == 1){
          GUILayout.Label("                                                                 WARNING!\nAdvanced settings can allow you to fine tune settings if a preset is not close enough.\n                              Only use this if you KNOW what you are doing!",EditorStyles.boldLabel);
        }
        else{
          GUILayout.Label("Recommend loading a Preset from above!");
        }
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();
        ASWStyles.PartingLine();
        GUILayout.Label("Looking for \"Wrong Vertex Colors\"? This setting has been removed as the updated Guilty Gear Blender script solves this issue. Please use the updated script which can be found on my Discord or in the Guilty Gear Script Guide video description.", EditorStyles.textArea);
	    }
	    // Primary props
	     if (ASWStyles.DoFoldout(foldouts, mat, me, "Main Textures")){
         me.TexturePropertySingleLine(Styles.baseText, _Base);
         if(_EditorVersion.floatValue == 1){
           GUILayout.Space(-18);
           me.ShaderProperty(_EnableColorReplacer,"                                         Enable Color Replacer");
         }
         me.TexturePropertySingleLine(Styles.sssText, _SSS);
         me.TexturePropertySingleLine(Styles.ilmText, _ILM);
         if(_EditorVersion.floatValue == 1){
           GUILayout.Space(-18);
           me.ShaderProperty(_ILMColorSetting," ");
         }
         me.TexturePropertySingleLine(Styles.detailText, _Detail);
         if(_EditorVersion.floatValue == 1){
           GUILayout.Space(-18);
           me.ShaderProperty(_DetailColorSetting," ");
         }

         if ( _EnableColorReplacer.floatValue == 1){
           if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Color Replacer", Color.cyan) ){
              if (_FresnelSystem.floatValue != 0 && _EnableFresnel.floatValue == 1){
                GUILayout.Label("WARNING! PLEASE DISABLE FRESNEL WHILE WORKING ON GRANBLUE MODELS!\nTHE FRESNEL CONFLICTS WITH THE COLOR PICKER TOOL!\nENABLE FRESNEL AFTER FINISHED PICKING COLORS!", EditorStyles.textArea);
              }
              me.ShaderProperty(_TotalReplacements, _TotalReplacements.displayName);

              for (int i = 1; i <= _TotalReplacements.floatValue; ++i) {
                switch (i) {
                  case 1:
                    ASWStyles.PartingLine();
                    me.ShaderProperty(_Source1Color, _Source1Color.displayName);
                    me.ShaderProperty(_Target1Color, _Target1Color.displayName);
                    me.ShaderProperty(_Source1Fuzziness, _Source1Fuzziness.displayName);
                    break;
                  case 2:
                    ASWStyles.PartingLine();
                    me.ShaderProperty(_Source2Color, _Source2Color.displayName);
                    me.ShaderProperty(_Target2Color, _Target2Color.displayName);
                    me.ShaderProperty(_Source2Fuzziness, _Source2Fuzziness.displayName);
                    break;
                  case 3:
                    ASWStyles.PartingLine();
                    me.ShaderProperty(_Source3Color, _Source3Color.displayName);
                    me.ShaderProperty(_Target3Color, _Target3Color.displayName);
                    me.ShaderProperty(_Source3Fuzziness, _Source3Fuzziness.displayName);
                    break;
                  case 4:
                    ASWStyles.PartingLine();
                    me.ShaderProperty(_Source4Color, _Source4Color.displayName);
                    me.ShaderProperty(_Target4Color, _Target4Color.displayName);
                    me.ShaderProperty(_Source4Fuzziness, _Source4Fuzziness.displayName);
                    break;
                  case 5:
                    ASWStyles.PartingLine();
                    me.ShaderProperty(_Source5Color, _Source5Color.displayName);
                    me.ShaderProperty(_Target5Color, _Target5Color.displayName);
                    me.ShaderProperty(_Source5Fuzziness, _Source5Fuzziness.displayName);
                    break;
                }
              }
            }
          }

  				if ( _ILMColorSetting.floatValue > 0 ){
  					if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "ILM Body Lines Color", Color.cyan) ){
  						me.ShaderProperty(_ILMColor, _ILMColor.displayName);
  						me.ShaderProperty(_EnableILMEmission, "Enable ILM Lines Glow");
  						if(_EnableILMEmission.floatValue == 1){
  							me.ShaderProperty(_ILMEmissiveIntensity, _ILMEmissiveIntensity.displayName);
  						}
  					}
  				}

          if ( _DetailColorSetting.floatValue > 0 ){
  					if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Detail Lines Color", Color.cyan) ){
  						me.ShaderProperty(_DetailColor, _DetailColor.displayName);
  						me.ShaderProperty(_EnableDetailEmission, "Enable Detail Lines Glow");
  						if(_EnableDetailEmission.floatValue == 1){
  							me.ShaderProperty(_DetailEmissiveIntensity, _DetailEmissiveIntensity.displayName);
  						}
  					}
  				}

          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, _EnableMatcap, "Metal Matcap", Color.cyan) ){
          	ASWStyles.ToggleGroup(_EnableMatcap.floatValue == 0);
          	me.TexturePropertySingleLine(Styles._MetalMatcapText, _MetalMatcap);
            if(_EditorVersion.floatValue == 1){
            	me.ShaderProperty(_MetalAIntensity, _MetalAIntensity.displayName);
            	me.ShaderProperty(_MetalBIntensity, _MetalBIntensity.displayName);
            }
          	ASWStyles.ToggleGroupEnd();
          }
          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, _EnableGlowmask, "Glow Mask", Color.cyan) ){
          	ASWStyles.ToggleGroup(_EnableGlowmask.floatValue == 0);
         		me.TexturePropertySingleLine(Styles.glowMaskText, _GlowMask);
            me.ShaderProperty(_GlowMaskIntensity, _GlowMaskIntensity.displayName);
            if(_EditorVersion.floatValue == 1){
            	me.ShaderProperty(_GlowMaskMultSystem, _GlowMaskMultSystem.displayName);
            	me.ShaderProperty(_GlowMaskTint, _GlowMaskTint.displayName);
            }
            ASWStyles.ToggleGroupEnd();
          }
        }



		    //Light Layer Proprties
        if(ASWStyles.DoFoldout(foldouts, mat, me, "Light Settings")){
          me.ShaderProperty(_LightDirectionSetting, new GUIContent(_LightDirectionSetting.displayName, "Overrides the system that checks if there is a light source in the scene/world."));
		      me.ShaderProperty(_LightColorSetting, new GUIContent(_LightColorSetting.displayName, "Overrides the system that checks if there is a light source in the scene/world."));

          ASWStyles.PartingLine();
          me.ShaderProperty(_GlobalIntensityMinimum, _GlobalIntensityMinimum.displayName);
          ASWStyles.PartingLine();

          if( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Fake Light Settings", Color.yellow) ){
  					me.ShaderProperty(_FakeLightFallbackDirection, new GUIContent(_FakeLightFallbackDirection.displayName, "Toggle between different light directions if the scene/world has no light source."));
  					me.ShaderProperty(_FakeLightIntensity, _FakeLightIntensity.displayName);
  					me.ShaderProperty(_FakeLightColor, _FakeLightColor.displayName);
            if(_EditorVersion.floatValue == 1){
    					if(_FakeLightFallbackDirection.floatValue == 0){
    						me.ShaderProperty(_FakeLightDirX, _FakeLightDirX.displayName);
    						me.ShaderProperty(_FakeLightDirY, _FakeLightDirY.displayName);
    					}
    					else{
    						me.ShaderProperty(_ViewDirOffsetPitch, _ViewDirOffsetPitch.displayName);
    						me.ShaderProperty(_ViewDirOffsetYaw, _ViewDirOffsetYaw.displayName);
    						//me.ShaderProperty(_ViewDirOffsetZ, _ViewDirOffsetZ.displayName);
    						//GUILayout.Label("Note: VRChat flips the 'X' direction from what is visible here. Negate any value you put in the X to see what it will look like in game.", EditorStyles.helpBox);
    					}
            }
          }
          if( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Shadow Settings", Color.yellow) ){
  					me.ShaderProperty(_ShadowBrightness, _ShadowBrightness.displayName);
            if(_EditorVersion.floatValue == 1){
              me.ShaderProperty(_ILMGShadingThreshold, _ILMGShadingThreshold.displayName);
            }
  					ASWStyles.PartingLine();

  					me.ShaderProperty(_ShadowLayer1Push, _ShadowLayer1Push.displayName);
            if(_EditorVersion.floatValue == 1){
    					me.ShaderProperty(_ShadowLayer1Fuzziness, _ShadowLayer1Fuzziness.displayName);
    					me.ShaderProperty(_ShadowLayer1Intensity, _ShadowLayer1Intensity.displayName);
    					me.ShaderProperty(_ILMLayer1, _ILMLayer1.displayName);
    					me.ShaderProperty(_VertexLayer1, _VertexLayer1.displayName);
            }

  					ASWStyles.PartingLine();

  					me.ShaderProperty(_ShadowLayer2Push, _ShadowLayer2Push.displayName);
            if(_EditorVersion.floatValue == 1){
    					me.ShaderProperty(_ShadowLayer2Fuzziness, _ShadowLayer2Fuzziness.displayName);
    					me.ShaderProperty(_ShadowLayer2Intensity, _ShadowLayer2Intensity.displayName);
    					me.ShaderProperty(_ILMLayer2, _ILMLayer2.displayName);
    					me.ShaderProperty(_VertexLayer2, _VertexLayer2.displayName);
            }
  				}

  				//Specular Settings
  				if( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Specular Settings", Color.yellow) ){
  					me.ShaderProperty(_SpecularIntensity, _SpecularIntensity.displayName);
  					me.ShaderProperty(_SpecularSize, _SpecularSize.displayName);
  					//me.ShaderProperty(_SpecularFuzzy, _SpecularFuzzy.displayName);
  				}
        }
        if(ASWStyles.DoFoldout(foldouts, mat, me, "Fresnel Settings")){
  				me.ShaderProperty(_EnableFresnel, "Enable Fresnel");
  				ASWStyles.PartingLine();
  				ASWStyles.ToggleGroup(_EnableFresnel.floatValue == 0);
  				me.ShaderProperty(_FresnelSystem, _FresnelSystem.displayName);
          if(_EditorVersion.floatValue == 1){
    				ASWStyles.PartingLine();
    				me.ShaderProperty(_HighlightPower, _HighlightPower.displayName);
    				me.ShaderProperty(_HighlightIntensity, _HighlightIntensity.displayName);
    				me.ShaderProperty(_HighlightScale, _HighlightScale.displayName);
    				me.ShaderProperty(_HighlightFreselFuzzy, _HighlightFreselFuzzy.displayName);
    				ASWStyles.PartingLine();

    				if ( _FresnelSystem.floatValue == 1 ){
    					me.ShaderProperty(_GranblueDarkenScale, _GranblueDarkenScale.displayName);
    					me.ShaderProperty(_GranblueDarkenPower, _GranblueDarkenPower.displayName);
    				}
    				else{
    					me.ShaderProperty(_DarkHighlightMult, _DarkHighlightMult.displayName);
    				}
          }
  				ASWStyles.ToggleGroupEnd();
        }
        // Outline props
        if( ASWStyles.DoFoldout(foldouts, mat, me, "Outline Settings") ) {
  				ASWStyles.PartingLine();
  				EditorGUILayout.BeginHorizontal();
          GUILayout.FlexibleSpace();
          // if (GUILayout.Button("Looking for outlines?\nThe built-in outlines have been removed due to incompatablity with the most recent updates.\nPlease click this button to learn how to set up your outlines properly.", GUILayout.Width(550), GUILayout.Height(75)) == true){
	        // 	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
	        //     Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
	        // }
  				if (GUILayout.Button("DO NOT USE THIS UNLESS YOU ARE SUPER LAZY\nCLICK THIS TO LEARN HOW TO\nPROPERLY SET UP YOUR OUTLINES", GUILayout.Width(400), GUILayout.Height(50)) == true){
	        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
	            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
	        }
	        GUILayout.FlexibleSpace();
	        EditorGUILayout.EndHorizontal();
  				ASWStyles.PartingLine();
  				me.ShaderProperty(_EnableOutline, _EnableOutline.displayName);
  				if (_EnableOutline.floatValue == 1){
  					if (ASWStyles.DoMediumFoldout(foldouts, mat, me, "Thickness", Color.cyan)){
  						me.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
              if(_EditorVersion.floatValue == 1){
    						me.ShaderProperty(_EnableCameraDistanceMult, _EnableCameraDistanceMult.displayName);
                if(_EnableCameraDistanceMult.floatValue == 1){
    			        me.ShaderProperty(_CameraDistanceMult, _CameraDistanceMult.displayName);
                }
                ASWStyles.PartingLine();
                me.ShaderProperty(_DepthOffset, _DepthOffset.displayName);
                me.ShaderProperty(_DepthCalculation, _DepthCalculation.displayName);
              }
  					}
            if(_EditorVersion.floatValue == 1){
    					if (ASWStyles.DoMediumFoldout(foldouts, mat, me, "Color", Color.cyan)){
    						me.ShaderProperty(_EnableLightColorMult, _EnableLightColorMult.displayName);
    						me.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
    						if (_EnableBaseColorMult.floatValue == 0){
    							me.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
    						}
    						me.ShaderProperty(_OutlineColorIntensity, _OutlineColorIntensity.displayName);
    					}
            }
  				}
		    }
        if(_EditorVersion.floatValue == 1){
          if ( ASWStyles.DoFoldout(foldouts, mat, me, "Debug") ){
            ASWStyles.PartingLine();
          	me.ShaderProperty(_ALPHATEST, "Enable Debug");
          	ASWStyles.PartingLine();
            if(_ALPHATEST.floatValue == 1){
              me.ShaderProperty(_DebugGroup,_DebugGroup.displayName);
              me.ShaderProperty(_DebugColor,_DebugColor.displayName);
  	        	ASWStyles.PartingLine();
              switch(_DebugGroup.floatValue){
                case 0 :
                  me.ShaderProperty(_VertexChannel,_VertexChannel.displayName);
                  break;
                case 1 :
                  me.ShaderProperty(_ILMChannel,_ILMChannel.displayName);
                  break;
                case 2 :
                  me.ShaderProperty(_BaseSSSAlphaSwap,_BaseSSSAlphaSwap.displayName);
                  break;
              }
            }
          }
        }

  			if ( ASWStyles.DoFoldout(foldouts, mat, me, "Credits") ){
  				GUILayout.Label("»Thanks to Shamwow for the absolute first guide on the absolute first initial version of the shader.\n\n»Thanks to VCD/Velon for his constant riding of me to keep working on my shader\n\n»Thanks to Nars290 for his constant positivity and assistance with testing and debugging\n\n»Thanks to Syll for their knowledge on the outline generation.\n\n»Dolce Swenos for being a grammar nazi. \n\n»Thanks to Morioh for showing me how to use custom editor styles and letting me use his Shuriken functions. Really helped make the shader UI look a lot better!\n\n»Thanks to Mochie for his presets system. Even if it is jank and hacked together, its still fantastic.\n\n»Thanks to EdwardsVSGaming for taking a VERY old version of my shader, editing it a small ammount, claiming the entire thing as his own without credit to me, and using deceptive comparisons between that shader and mine forcing me to get off my lazy streak and actually work on my shader again. *clap* *clap* Good job.", EditorStyles.textArea);
  			}
        ASWStyles.DrawButtons();
      }
    }
}

public class ASWOutlineGUI : ShaderGUI
{
	BindingFlags bindingFlags = BindingFlags.Public |
                                BindingFlags.NonPublic |
                                BindingFlags.Instance |
                                BindingFlags.Static;
	private static class Styles
    {
        public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
    }

	public static Dictionary<Material, ASWToggles > foldouts = new Dictionary<Material, ASWToggles>();
    ASWToggles toggles = new ASWToggles(
		new bool[] {
			false, // Thickness
			true,
		},
		new string[] {
			"Thickness Settings",
			"Color Settings"
		}
	);

    MaterialProperty _OutlineColor = null;
    MaterialProperty _OutlineThickness = null;
    MaterialProperty _DepthOffset = null;
    MaterialProperty _DepthCalculation = null;
    MaterialProperty _EnableBaseColorMult = null;
    MaterialProperty _EnableCameraDistanceMult = null;
    MaterialProperty _CameraDistanceMult = null;
    MaterialProperty _OutlineColorIntensity = null;
    MaterialProperty _Base = null;
    MaterialProperty _EnableLightColorMult = null;
    MaterialProperty _GlobalIntensityMinimum = null;
    MaterialProperty _LightColorSetting = null;
    MaterialProperty _FakeLightColor = null;
    MaterialProperty _FakeLightIntensity = null;

    public override void OnGUI (MaterialEditor me, MaterialProperty[] props)
    {
    	Material mat = (Material)me.target;

		if (!foldouts.ContainsKey(mat)){
			foldouts.Add(mat, toggles);
		}

  	foreach (var property in GetType().GetFields(bindingFlags)){
        if (property.FieldType == typeof(MaterialProperty))
        {
            property.SetValue(this, FindProperty(property.Name, props));
        }
    }
    string[] shaderVersion = mat.shader.name.Split('v');
    ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Outline v" + "<color=#ff0000ff> "+shaderVersion[1]+"</color>" + "<color=#000000ff>  }</color>");

    EditorGUI.BeginChangeCheck();
		{

	        //Findprops(props);              // Find props
	        EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
	        EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

		    if (GUILayout.Button("How to properly set up your outlines") == true)
	        {
	        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
	            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
	        }

	        // Outline props
	        GUILayout.Label("Outline Settings", EditorStyles.boldLabel);

			if (ASWStyles.DoFoldout(foldouts, mat, me, "Thickness Settings")){
				me.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
				me.ShaderProperty(_EnableCameraDistanceMult, _EnableCameraDistanceMult.displayName);
        if(_EnableCameraDistanceMult.floatValue == 1){
          me.ShaderProperty(_CameraDistanceMult, _CameraDistanceMult.displayName);
        }
        ASWStyles.PartingLine();
        me.ShaderProperty(_DepthOffset, _DepthOffset.displayName);
        me.ShaderProperty(_DepthCalculation, _DepthCalculation.displayName);
			}
			if (ASWStyles.DoFoldout(foldouts, mat, me, "Color Settings")){
				me.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
				if( _EnableBaseColorMult.floatValue == 1 ) {
					 me.TexturePropertySingleLine(Styles.baseText, _Base);
				}
				else{
					me.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
				}
				me.ShaderProperty(_OutlineColorIntensity, _OutlineColorIntensity.displayName);
				ASWStyles.PartingLine();
				me.ShaderProperty(_EnableLightColorMult, _EnableLightColorMult.displayName);
				if( _EnableLightColorMult.floatValue == 1 ){
					me.ShaderProperty(_LightColorSetting, new GUIContent(_LightColorSetting.displayName, "Overrides the system that checks if there is a light source in the scene/world."));
					me.ShaderProperty(_GlobalIntensityMinimum, _GlobalIntensityMinimum.displayName);
          if(_LightColorSetting.floatValue == 1){
  					ASWStyles.PartingLine();
  					me.ShaderProperty(_FakeLightColor, _FakeLightColor.displayName);
  					me.ShaderProperty(_FakeLightIntensity, _FakeLightIntensity.displayName);
          }
				}
			}
		}
  }
}
public class ASWDecalGUI : ShaderGUI
{
	BindingFlags bindingFlags = BindingFlags.Public |
                                BindingFlags.NonPublic |
                                BindingFlags.Instance |
                                BindingFlags.Static;
	private static class Styles
  {
      public static GUIContent mainTex = new GUIContent("Decal Texture", "[Character Indentifier]_Base");
  }

  MaterialProperty _Enable = null;
  MaterialProperty _MainTex = null;
  MaterialProperty _DiscolorationModifier = null;

  public override void OnGUI (MaterialEditor me, MaterialProperty[] props)
  {
    Material mat = (Material)me.target;


  	foreach (var property in GetType().GetFields(bindingFlags)){
        if (property.FieldType == typeof(MaterialProperty))
        {
            property.SetValue(this, FindProperty(property.Name, props));
        }
    }
    string[] shaderVersion = mat.shader.name.Split('v');
    ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Decal v" + "<color=#ff0000ff> "+shaderVersion[1]+"</color><color=#000000ff>" + "  }</color>");
    EditorGUI.BeginChangeCheck();
		{
      me.ShaderProperty(_Enable, _Enable.displayName);
      me.TexturePropertySingleLine(Styles.mainTex, _MainTex);
      me.ShaderProperty(_DiscolorationModifier, _DiscolorationModifier.displayName);
		}
  }
}

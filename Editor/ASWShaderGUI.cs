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

    MaterialProperty _ForceFakeLight = null;
    MaterialProperty _FakeLightFallbackDirToggle = null;
    MaterialProperty _WrongVertexColors = null;
    MaterialProperty _Base = null;
    MaterialProperty _SSS = null;
    MaterialProperty _ILM = null;
    MaterialProperty _Detail = null;
    MaterialProperty _METALLICGLOSSMAP = null;
    MaterialProperty _MetalMatcap = null;
    MaterialProperty _MetalAIntensity = null;
    MaterialProperty _MetalBIntensity = null;
    MaterialProperty _FADE = null;
    MaterialProperty _GlowMask = null;
    MaterialProperty _GlowMaskIntensity = null;
    MaterialProperty _GlowMaskTint = null;
    MaterialProperty _FakeLightColor = null;
    MaterialProperty _FakeLightDirX = null;
    MaterialProperty _FakeLightDirY = null;
    MaterialProperty _ViewDirOffsetX = null;
    MaterialProperty _ViewDirOffsetY = null;
    MaterialProperty _FakeLightIntensity = null;
    MaterialProperty _ShadowLayer1Push = null;
    MaterialProperty _ShadowLayer1Gate = null;
    MaterialProperty _ShadowLayer1Fuzziness = null;
    MaterialProperty _ShadowLayer1Intensity = null;
    MaterialProperty _ShadowLayer2Push = null;
    MaterialProperty _ShadowLayer2Gate = null;
    MaterialProperty _ShadowLayer2Fuzziness = null;
    MaterialProperty _ShadowLayer2Intensity = null;
    MaterialProperty _ILMLayer1 = null;
    MaterialProperty _ILMLayer2 = null;
    MaterialProperty _VertexLayer1 = null;
    MaterialProperty _VertexLayer2 = null;
    MaterialProperty _ShadowBrightness = null;
    MaterialProperty _SpecularSize = null;
    MaterialProperty _SpecularIntensity = null;
    MaterialProperty _SpecularFuzzy = null;
    MaterialProperty _COLOROVERLAY = null;
    MaterialProperty _DarkHighlightMult = null;
    MaterialProperty _HighlightPower = null;
    MaterialProperty _HighlightFreselFuzzy = null;
    MaterialProperty _HighlightIntensity = null;
    MaterialProperty _HighlightScale = null;
    MaterialProperty _FresnelSystem = null;
    MaterialProperty _COLORADDSUBDIFF = null;
    MaterialProperty _GranblueDarkenScale = null;
    MaterialProperty _GranblueDarkenPower = null;
    MaterialProperty _EnableOutline = null;
    MaterialProperty _OutlineThickness = null;
    MaterialProperty _OutlineColor = null;
    MaterialProperty _EnableBaseColorMult = null;
    MaterialProperty _EnableCameraDistanceMult = null;
    //MaterialProperty _DepthScaleClamp = null;
    //MaterialProperty _CameraDepthMult = null;
    MaterialProperty _ALPHABLEND = null;
    MaterialProperty _VertexChannel = null;
    MaterialProperty _VertexDebugColor = null;
    MaterialProperty _PIXELSNAP = null;
    MaterialProperty _ILMChannel = null;
    MaterialProperty _ILMDebugColor = null;
    MaterialProperty _COLORCOLOR = null;
    MaterialProperty _BaseSSSAlphaSwap = null;
    MaterialProperty _BaseSSSAlphaColor = null;

    public static Dictionary<Material, Toggles > foldouts = new Dictionary<Material, Toggles>();
    Toggles toggles = new Toggles(
		new bool[] {
			false, // Global
				false,
			true, // Main Textures
				false,
				false,
			true, // Light Settings
				false,
			false, // Fresnel Settings
				false,
				false,
			false, // Outline Settings
			false, // Debug
				false,
				false,
				false,
			false, // Credits
			false // Presets
		},
		new string[] {
			"Global Settings", 
				"Fake Light Settings", 
			"Main Textures", 
				"Metal Matcap",
				"Glow Mask",
			"Light Settings",
				"Specular Settings",
			"Fresnel Settings",
				"Highlight Fresnel",
				"Granblue Darken Fresnel",
			"Outline Settings",
			"Debug",
				"Vertex Colors",
				"ILM Colors",
				"Base and SSS Alpha",
			"Credits",
			"PRESETS"
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

    	foreach (var property in GetType().GetFields(bindingFlags)) 
        {                                                           
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

		EditorGUI.BeginChangeCheck();
		{
			ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Merged Light v" + "<color=#ff0000ff> "+shaderVersion[1]+"</color>" + "<color=#000000ff>  }</color>");
	        // Global props
			if (ASWStyles.DoFoldout(foldouts, mat, me, "Global Settings")){
		        //me.ShaderProperty(_ForceFakeLight, _ForceFakeLight.displayName);
		        me.ShaderProperty(_WrongVertexColors, "Are your vertex colors correct?");
		        me.ShaderProperty(_ForceFakeLight, new GUIContent(_ForceFakeLight.displayName, "Overrides the system that checks if there is a light source in the scene/world."));
		        me.ShaderProperty(_FakeLightFallbackDirToggle, new GUIContent(_FakeLightFallbackDirToggle.displayName, "Toggle between different light directions if the scene/world has no light source."));
	        
				if( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Fake Light Settings", Color.yellow) ){
					me.ShaderProperty(_FakeLightIntensity, _FakeLightIntensity.displayName);
					me.ShaderProperty(_FakeLightColor, _FakeLightColor.displayName);
					if(_FakeLightFallbackDirToggle.floatValue == 0){
						me.ShaderProperty(_FakeLightDirX, _FakeLightDirX.displayName);
						me.ShaderProperty(_FakeLightDirY, _FakeLightDirY.displayName);
					}
					else{
						me.ShaderProperty(_ViewDirOffsetX, _ViewDirOffsetX.displayName);
						me.ShaderProperty(_ViewDirOffsetY, _ViewDirOffsetY.displayName);
					}
				}
	        }
	        // Primary props
	        if (ASWStyles.DoFoldout(foldouts, mat, me, "Main Textures")){
		        me.TexturePropertySingleLine(Styles.baseText, _Base);
		        me.TexturePropertySingleLine(Styles.sssText, _SSS);
		        me.TexturePropertySingleLine(Styles.ilmText, _ILM);
		        me.TexturePropertySingleLine(Styles.detailText, _Detail);

		        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, _METALLICGLOSSMAP, "Metal Matcap", Color.cyan) ){
		        	ASWStyles.ToggleGroup(_METALLICGLOSSMAP.floatValue == 0);
		        	me.TexturePropertySingleLine(Styles._MetalMatcapText, _MetalMatcap);
		        	me.ShaderProperty(_MetalAIntensity, _MetalAIntensity.displayName);
		        	me.ShaderProperty(_MetalBIntensity, _MetalBIntensity.displayName);
		        	ASWStyles.ToggleGroupEnd();
		        }

		        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, _FADE, "Glow Mask", Color.cyan) ){
		        	ASWStyles.ToggleGroup(_FADE.floatValue == 0);
		       		me.TexturePropertySingleLine(Styles.glowMaskText, _GlowMask);
		        	me.ShaderProperty(_GlowMaskTint, _MetalBIntensity.displayName);
		        	me.ShaderProperty(_GlowMaskIntensity, _MetalBIntensity.displayName);
		        	ASWStyles.ToggleGroupEnd();
		        }
	        }
	        
	        

		    //Light Layer Proprties
	        if(ASWStyles.DoFoldout(foldouts, mat, me, "Light Settings")){
				me.ShaderProperty(_ShadowBrightness, _ShadowBrightness.displayName);

				ASWStyles.PartingLine();
				
				me.ShaderProperty(_ShadowLayer1Push, _ShadowLayer1Push.displayName);
				me.ShaderProperty(_ShadowLayer1Gate, _ShadowLayer1Gate.displayName);
				me.ShaderProperty(_ShadowLayer1Fuzziness, _ShadowLayer1Fuzziness.displayName);
				me.ShaderProperty(_ShadowLayer1Intensity, _ShadowLayer1Intensity.displayName);
				me.ShaderProperty(_ILMLayer1, _ILMLayer1.displayName);
				me.ShaderProperty(_VertexLayer1, _VertexLayer1.displayName);

				ASWStyles.PartingLine();

				me.ShaderProperty(_ShadowLayer2Push, _ShadowLayer2Push.displayName);
				me.ShaderProperty(_ShadowLayer2Gate, _ShadowLayer2Gate.displayName);
				me.ShaderProperty(_ShadowLayer2Fuzziness, _ShadowLayer2Fuzziness.displayName);
				me.ShaderProperty(_ShadowLayer2Intensity, _ShadowLayer2Intensity.displayName);
				me.ShaderProperty(_ILMLayer2, _ILMLayer2.displayName);
				me.ShaderProperty(_VertexLayer2, _VertexLayer2.displayName);

				//Specular Settings
				if( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Specular Settings", Color.yellow) ){
					me.ShaderProperty(_SpecularIntensity, _SpecularIntensity.displayName);
					me.ShaderProperty(_SpecularSize, _SpecularSize.displayName);
					me.ShaderProperty(_SpecularFuzzy, _SpecularFuzzy.displayName);
				}
			}

			if(ASWStyles.DoFoldout(foldouts, mat, me, "Fresnel Settings")){
				//if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, _COLOROVERLAY, "Highlight Fresnel", Color.cyan)){
				me.ShaderProperty(_COLOROVERLAY, "Enable Fresnel");
				ASWStyles.PartingLine();
				ASWStyles.ToggleGroup(_COLOROVERLAY.floatValue == 0);
				me.ShaderProperty(_FresnelSystem, _FresnelSystem.displayName);
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
				ASWStyles.ToggleGroupEnd();
			}

	        // Outline props
			if( ASWStyles.DoFoldout(foldouts, mat, me, "Outline Settings") ) {
				ASWStyles.PartingLine();
				EditorGUILayout.BeginHorizontal();
        		GUILayout.FlexibleSpace();
				if (GUILayout.Button("DO NOT USE THIS UNLESS YOU ARE SUPER LAZY\nCLICK THIS TO LEARN HOW TO\nPROPERLY SET UP YOUR OUTLINES", GUILayout.Width(400), GUILayout.Height(50)) == true){
		        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
		            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
		        }
		        GUILayout.FlexibleSpace();
		        EditorGUILayout.EndHorizontal();
				ASWStyles.PartingLine();
				me.ShaderProperty(_EnableOutline, _EnableOutline.displayName);
				if (_EnableOutline.floatValue == 1){
					me.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
					me.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
					if (_EnableBaseColorMult.floatValue == 0){
						me.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
					}
					me.ShaderProperty(_EnableCameraDistanceMult, _EnableCameraDistanceMult.displayName);
				}
		    }

	        if ( ASWStyles.DoFoldout(foldouts, mat, me, "Debug") ){
	        	ASWStyles.PartingLine();
	        	me.ShaderProperty(_ALPHABLEND, "Enable Debug");
	        	ASWStyles.PartingLine();
	        	ASWStyles.ToggleGroup( _ALPHABLEND.floatValue == 0);
	        	if( ASWStyles.DoMediumFoldout(foldouts, mat, me, _COLORADDSUBDIFF, "Vertex Colors", Color.cyan) ){
	        		ASWStyles.ToggleGroup(_COLORADDSUBDIFF.floatValue == 0);
					me.ShaderProperty(_VertexChannel, _VertexDebugColor.displayName);
					me.ShaderProperty(_VertexDebugColor, _VertexDebugColor.displayName);
					ASWStyles.ToggleGroupEnd();
	        	}
	        	if( ASWStyles.DoMediumFoldout(foldouts, mat, me, _PIXELSNAP, "ILM Colors", Color.cyan) ){
	        		ASWStyles.ToggleGroup(_PIXELSNAP.floatValue == 0);
					me.ShaderProperty(_ILMChannel, _ILMChannel.displayName);
					me.ShaderProperty(_ILMDebugColor, _ILMDebugColor.displayName);
					ASWStyles.ToggleGroupEnd();
	        	}
	        	if( ASWStyles.DoMediumFoldout(foldouts, mat, me, _COLORCOLOR, "Base and SSS Alpha", Color.cyan) ){
	        		ASWStyles.ToggleGroup(_COLORCOLOR.floatValue == 0);
					me.ShaderProperty(_BaseSSSAlphaSwap, _BaseSSSAlphaSwap.displayName);
					me.ShaderProperty(_BaseSSSAlphaColor, _BaseSSSAlphaColor.displayName);
					ASWStyles.ToggleGroupEnd();
	        	}
	        	ASWStyles.ToggleGroupEnd();
	        }

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

			if ( ASWStyles.DoFoldout(foldouts, mat, me, "Credits") ){
				GUILayout.Label("»Thanks to Shamwow for the absolute first guide on the absolute first initial version of the shader.\n\n»Thanks to VCD/Velon for his constant riding of me to keep working on my shader\n\n»Thanks to Nars290 for his constant positivity and assistance with testing and debugging\n\n»Dolce Swenos for being a grammar nazi. \n\n»Thanks to Morioh for showing me how to use custom editor styles and letting me use his Shuriken functions. Really helped make the shader UI look a lot better!\n\n»Thanks to Mochie for his presets system. Even if it is jank and hacked together, its still fantastic.\n\n»Thanks to EdwardsVSGaming for taking a VERY old version of my shader, editing it a small ammount, claiming the entire thing as his own without credit to me, and using deceptive comparisons between that shader and mine forcing me to get off my lazy streak and actually work on my shader again. *clap* *clap* Good job.", EditorStyles.textArea);
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

    MaterialProperty _WrongVertexColors = null;
    MaterialProperty _OutlineColor = null;
    MaterialProperty _OutlineThickness = null;
    MaterialProperty _EnableBaseColorMult = null;
    MaterialProperty _EnableCameraDistanceMult = null;
	MaterialProperty _Base = null;

    public override void OnGUI (MaterialEditor me, MaterialProperty[] props)
    {
    	Material mat = (Material)me.target;

    	foreach (var property in GetType().GetFields(bindingFlags)) 
        {                                                           
            if (property.FieldType == typeof(MaterialProperty))
            {
                property.SetValue(this, FindProperty(property.Name, props));
            }
        }
        EditorGUI.BeginChangeCheck();
		{

	        //Findprops(props);              // Find props
	        EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
	        EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

		    ASWStyles.ShurikenHeaderCentered("Arc System Works Outline");
	        
		    if (GUILayout.Button("How to properly set up your outlines") == true)
	        {
	        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
	            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
	        }

	        // Outline props
	        GUILayout.Label("Outline Settings", EditorStyles.boldLabel);
	        me.ShaderProperty(_WrongVertexColors, "Are your vertex colors correct?");
	        me.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
	        me.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
			if( _EnableBaseColorMult.floatValue == 1 ) {
		         me.TexturePropertySingleLine(Styles.baseText, _Base);
		    }
		    else{
		    	me.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
		    }
			me.ShaderProperty(_EnableCameraDistanceMult, _EnableCameraDistanceMult.displayName);
		}
    }
}
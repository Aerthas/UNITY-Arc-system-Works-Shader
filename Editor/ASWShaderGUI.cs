using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System;
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
    }

    MaterialProperty _ForceFakeLight = null;
    MaterialProperty _FakeLightFallbackDirToggle = null;
    MaterialProperty _WrongVertexColors = null;
    MaterialProperty _EnableOutline = null;
    MaterialProperty _OutlineThickness = null;
    MaterialProperty _OutlineColor = null;
    MaterialProperty _EnableBaseColorMult = null;
    MaterialProperty _Base = null;
    MaterialProperty _SSS = null;
    MaterialProperty _ILM = null;
    MaterialProperty _Detail = null;
    MaterialProperty _METALLICGLOSSMAP = null;
    MaterialProperty _MetalMatcap = null;
    MaterialProperty _MetalAIntensity = null;
    MaterialProperty _MetalBIntensity = null;
    MaterialProperty _FakeLightColor = null;
    MaterialProperty _FakeLightDirX = null;
    MaterialProperty _FakeLightDirY = null;
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
    MaterialProperty _FADING = null;
    MaterialProperty _GranblueFresnelScale = null;
    MaterialProperty _GranblueFresnelPower = null;

    static bool showGlobalSettings = false;
    static bool showMainTextures = true;
    static bool showMatcap = false;
    static bool showLightSettings = true;
    static bool showFakeLightSettings = false;
    static bool showSpecularSettings = false;
    static bool showHighlightFresnelSettings = false;
    static bool showHighlightFresnel = false;
    static bool showGranblueFresnel = false;
    static bool showOutlineSettings = false;
    static bool showCredits = false;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
        Material mat = (Material)materialEditor.target;

    	foreach (var property in GetType().GetFields(bindingFlags)) 
        {                                                           
            if (property.FieldType == typeof(MaterialProperty))
            {
                property.SetValue(this, FindProperty(property.Name, props));
            }
        }

        //Findprops(props);              // Find props
        EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
        EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

		EditorGUI.BeginChangeCheck();
		{
			ASWstyles.ShurikenHeaderCentered("{  Arc System Works - Merged Light v" + "<color=#ff0000ff> 6.5.0</color>" + "<color=#000000ff>  }</color>");
	        // Global props
	        showGlobalSettings = ASWstyles.Foldout("Global Settings", showGlobalSettings, materialEditor, Color.white);
	        //if (showGlobalSettings) {
			if (showGlobalSettings){
		        //materialEditor.ShaderProperty(_ForceFakeLight, _ForceFakeLight.displayName);
		        materialEditor.ShaderProperty(_WrongVertexColors, "Are your vertex colors correct?");
		        materialEditor.ShaderProperty(_ForceFakeLight, new GUIContent(_ForceFakeLight.displayName, "Overrides the system that checks if there is a light source in the scene/world."));
		        materialEditor.ShaderProperty(_FakeLightFallbackDirToggle, new GUIContent(_FakeLightFallbackDirToggle.displayName, "Toggle between different light directions if the scene/world has no light source."));
	        
	        	showFakeLightSettings = ASWstyles.MediumFoldout("Fake Light Settings", showFakeLightSettings, materialEditor, Color.yellow);
	        	GUILayout.Space(24);
				if( showFakeLightSettings == true ){
					materialEditor.ShaderProperty(_FakeLightIntensity, _FakeLightIntensity.displayName);
					materialEditor.ShaderProperty(_FakeLightColor, _FakeLightColor.displayName);
					if(_FakeLightFallbackDirToggle.floatValue == 0){
						materialEditor.ShaderProperty(_FakeLightDirX, _FakeLightDirX.displayName);
						materialEditor.ShaderProperty(_FakeLightDirY, _FakeLightDirY.displayName);
					}
				}
	        }
	        // Primary props
	        showMainTextures = ASWstyles.Foldout("Main Textures", showMainTextures, materialEditor, Color.white);
	        if (showMainTextures){
		        materialEditor.TexturePropertySingleLine(Styles.baseText, _Base);
		        materialEditor.TexturePropertySingleLine(Styles.sssText, _SSS);
		        materialEditor.TexturePropertySingleLine(Styles.ilmText, _ILM);
		        materialEditor.TexturePropertySingleLine(Styles.detailText, _Detail);

		        showMatcap = ASWstyles.MediumFoldout("Metal Matcap", showMatcap, materialEditor, Color.cyan);
	        	GUILayout.Space(1);
				materialEditor.ShaderProperty(_METALLICGLOSSMAP, " ");
	        	GUILayout.Space(2);
		        if ( showMatcap ){
		        	materialEditor.TexturePropertySingleLine(Styles._MetalMatcapText, _MetalMatcap);
		        	materialEditor.ShaderProperty(_MetalAIntensity, _MetalAIntensity.displayName);
		        	materialEditor.ShaderProperty(_MetalBIntensity, _MetalBIntensity.displayName);
		        }
	        }
	        
	        

		    //Light Layer Proprties
	        showLightSettings = ASWstyles.Foldout("Light Settings", showLightSettings, materialEditor, Color.white);
	        if(showLightSettings){
				materialEditor.ShaderProperty(_ShadowBrightness, _ShadowBrightness.displayName);
				
				materialEditor.ShaderProperty(_ShadowLayer1Push, _ShadowLayer1Push.displayName);
				materialEditor.ShaderProperty(_ShadowLayer1Gate, _ShadowLayer1Gate.displayName);
				materialEditor.ShaderProperty(_ShadowLayer1Fuzziness, _ShadowLayer1Fuzziness.displayName);
				materialEditor.ShaderProperty(_ShadowLayer1Intensity, _ShadowLayer1Intensity.displayName);
				materialEditor.ShaderProperty(_ILMLayer1, _ILMLayer1.displayName);
				materialEditor.ShaderProperty(_VertexLayer1, _VertexLayer1.displayName);

				ASWstyles.PartingLine();

				materialEditor.ShaderProperty(_ShadowLayer2Push, _ShadowLayer2Push.displayName);
				materialEditor.ShaderProperty(_ShadowLayer2Gate, _ShadowLayer2Gate.displayName);
				materialEditor.ShaderProperty(_ShadowLayer2Fuzziness, _ShadowLayer2Fuzziness.displayName);
				materialEditor.ShaderProperty(_ShadowLayer2Intensity, _ShadowLayer2Intensity.displayName);
				materialEditor.ShaderProperty(_ILMLayer2, _ILMLayer2.displayName);
				materialEditor.ShaderProperty(_VertexLayer2, _VertexLayer2.displayName);

				//Specular Settings
				showSpecularSettings = ASWstyles.MediumFoldout("Specular Settings", showSpecularSettings, materialEditor, new Color(1,1,0));
	        	GUILayout.Space(24);
				if( showSpecularSettings == true ){
					materialEditor.ShaderProperty(_SpecularIntensity, _SpecularIntensity.displayName);
					materialEditor.ShaderProperty(_SpecularSize, _SpecularSize.displayName);
					materialEditor.ShaderProperty(_SpecularFuzzy, _SpecularFuzzy.displayName);
				}
			}

			showHighlightFresnelSettings = ASWstyles.Foldout("Highlight Fresnel Settings", showHighlightFresnelSettings, materialEditor, Color.white);
			if(showHighlightFresnelSettings){
				showHighlightFresnel = ASWstyles.MediumFoldout("Highlight Fresnel", showHighlightFresnel, materialEditor, Color.cyan);
	        	GUILayout.Space(1);
				materialEditor.ShaderProperty(_COLOROVERLAY, " ");
	        	GUILayout.Space(2);
				if ( showHighlightFresnel){
					materialEditor.ShaderProperty(_DarkHighlightMult, _DarkHighlightMult.displayName);
					materialEditor.ShaderProperty(_HighlightPower, _HighlightPower.displayName);
					materialEditor.ShaderProperty(_HighlightFreselFuzzy, _HighlightFreselFuzzy.displayName);
					materialEditor.ShaderProperty(_HighlightIntensity, _HighlightIntensity.displayName);
					materialEditor.ShaderProperty(_HighlightScale, _HighlightScale.displayName);
				}
				showGranblueFresnel = ASWstyles.MediumFoldout("Granblue Darken Fresnel", showGranblueFresnel, materialEditor, Color.cyan);
	        	GUILayout.Space(1);
				materialEditor.ShaderProperty(_FADING, " ");
	        	GUILayout.Space(2);
				if ( showGranblueFresnel ){
					materialEditor.ShaderProperty(_GranblueFresnelScale, _GranblueFresnelScale.displayName);
					materialEditor.ShaderProperty(_GranblueFresnelPower, _GranblueFresnelPower.displayName);
				}
			}

	        // Outline props
	        showOutlineSettings = ASWstyles.Foldout("Outline Settings", showOutlineSettings, materialEditor, Color.white);
			//showOutlineSettings = GUILayout.Toggle(showOutlineSettings, "Looking for outline settings? They're removed.");
			if( showOutlineSettings == true ) {
				ASWstyles.PartingLine();
				EditorGUILayout.BeginHorizontal();
        		GUILayout.FlexibleSpace();
				if (GUILayout.Button("DO NOT USE THIS UNLESS YOU ARE SUPER LAZY\nCLICK THIS TO LEARN HOW TO\nPROPERLY SET UP YOUR OUTLINES", GUILayout.Width(400), GUILayout.Height(50)) == true){
		        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
		            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
		        }
		        GUILayout.FlexibleSpace();
		        EditorGUILayout.EndHorizontal();
				ASWstyles.PartingLine();
				materialEditor.ShaderProperty(_EnableOutline, _EnableOutline.displayName);
				if (_EnableOutline.floatValue == 1){
					materialEditor.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
					materialEditor.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
					materialEditor.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
				}
		    }

			showCredits = ASWstyles.Foldout("Credits", showCredits, materialEditor, Color.white);
			if ( showCredits == true){
				GUILayout.Label("»Thanks to Shamwow for the absolute first guide on the absolute first initial version of the shader.\n\n»Thanks to VCD/Velon for his constant riding of me to keep working on my shader\n\n»Thanks to Nars290 for his constant positivity and assistance with testing and debugging\n\n»Thanks to EdwardsVSGaming for taking an old version of my shader, editing it a small ammount, claiming the entire thing as his own without credit to me, and using deceptive comparisons between that shader and mine forcing me to get off my lazy streak and actually work on my shader again. *clap* *clap* Good job.\n\n»Dolce Swenos for being a grammar nazi. \n\n»Thanks to Morioh for showing me how to use custom editor styles and letting me use his Shuriken functions. Really helped make the shader UI look a lot better!", EditorStyles.textArea);
			}
			ASWstyles.DrawButtons();
		}
    }
}
/*
public class ASWShaderTransparentGUI : ShaderGUI
{
	private static class Styles
    {
        public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
        public static GUIContent sssText = new GUIContent("SSS Texture", "[Character Indentifier]_SSS");
        public static GUIContent ilmText = new GUIContent("ILM Texture", "[Character Indentifier]_ILM");
        public static GUIContent detailText = new GUIContent("Detail Texture", "[Character Indentifier]_Detail");
        public static GUIContent _MetalMatcapText = new GUIContent("Metal Texture  |  A Intensity  |  B Intensity", "metal. Only used by Frieza and Cooler from DBFZ as far as I am aware");
    }

    bool showFakeLightSettings = false;
    bool showSpecularSettings = false;
    bool showCredits = false;

    public override void OnGUI (MaterialEditor materialEditor, MaterialProperty[] props)
    {
    	//foreach (MaterialProperty property in props)
        	//materialEditor.ShaderProperty(property, property.displayName);
		// Renders the default GUI
        //base.OnGUI (materialEditor, props);

        //Findprops(props);              // Find props
        EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
        EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

	    MaterialProperty _ForceFakeLight = ShaderGUI.FindProperty("_ForceFakeLight",props);
	    MaterialProperty _WrongVertexColors = ShaderGUI.FindProperty("_WrongVertexColors",props);
	    MaterialProperty _Opacity = ShaderGUI.FindProperty("_Opacity",props);
	    MaterialProperty _Base = ShaderGUI.FindProperty("_Base",props);
	    MaterialProperty _SSS = ShaderGUI.FindProperty("_SSS",props);
	    MaterialProperty _ILM = ShaderGUI.FindProperty("_ILM",props);
	    MaterialProperty _Detail = ShaderGUI.FindProperty("_Detail",props);
	    MaterialProperty _METALLICGLOSSMAP = ShaderGUI.FindProperty("_METALLICGLOSSMAP",props);
	    MaterialProperty _MetalMatcap = ShaderGUI.FindProperty("_MetalMatcap",props);
	    MaterialProperty _MetalAIntensity = ShaderGUI.FindProperty("_MetalAIntensity",props);
	    MaterialProperty _MetalBIntensity = ShaderGUI.FindProperty("_MetalBIntensity",props);
	    MaterialProperty _FakeLightColor = ShaderGUI.FindProperty("_FakeLightColor",props);
	    MaterialProperty _FakeLightDirX = ShaderGUI.FindProperty("_FakeLightDirX",props);
	    MaterialProperty _FakeLightDirY = ShaderGUI.FindProperty("_FakeLightDirY",props);
	    MaterialProperty _FakeLightIntensity = ShaderGUI.FindProperty("_FakeLightIntensity",props);
	    MaterialProperty _ShadowLayer1Push = ShaderGUI.FindProperty("_ShadowLayer1Push",props);
	    MaterialProperty _ShadowLayer1Fuzziness = ShaderGUI.FindProperty("_ShadowLayer1Fuzziness",props);
	    MaterialProperty _ShadowLayer1Intensity = ShaderGUI.FindProperty("_ShadowLayer1Intensity",props);
	    MaterialProperty _ShadowLayer2Push = ShaderGUI.FindProperty("_ShadowLayer2Push",props);
	    MaterialProperty _ShadowLayer2Fuzziness = ShaderGUI.FindProperty("_ShadowLayer2Fuzziness",props);
	    MaterialProperty _ShadowLayer2Intensity = ShaderGUI.FindProperty("_ShadowLayer2Intensity",props);
	    MaterialProperty _ILMLayer1 = ShaderGUI.FindProperty("_ILMLayer1",props);
	    MaterialProperty _ILMLayer2 = ShaderGUI.FindProperty("_ILMLayer2",props);
	    MaterialProperty _VertexLayer1 = ShaderGUI.FindProperty("_VertexLayer1",props);
	    MaterialProperty _VertexLayer2 = ShaderGUI.FindProperty("_VertexLayer2",props);
	    MaterialProperty _ShadowBrightness = ShaderGUI.FindProperty("_ShadowBrightness",props);
	    MaterialProperty _SpecularSize = ShaderGUI.FindProperty("_SpecularSize",props);
	    MaterialProperty _SpecularIntensity = ShaderGUI.FindProperty("_SpecularIntensity",props);
	    MaterialProperty _SpecularFuzzy = ShaderGUI.FindProperty("_SpecularFuzzy",props);
	    MaterialProperty _COLOROVERLAY = ShaderGUI.FindProperty("_COLOROVERLAY",props);
	    MaterialProperty _DarkHighlightMult = ShaderGUI.FindProperty("_DarkHighlightMult",props);
	    MaterialProperty _HighlightPower = ShaderGUI.FindProperty("_HighlightPower",props);
	    MaterialProperty _HighlightFreselFuzzy = ShaderGUI.FindProperty("_HighlightFreselFuzzy",props);
	    MaterialProperty _HighlightIntensity = ShaderGUI.FindProperty("_HighlightIntensity",props);
	    MaterialProperty _HighlightScale = ShaderGUI.FindProperty("_HighlightScale",props);
	    MaterialProperty _EnableGranblueBlackFresnel = ShaderGUI.FindProperty("_EnableGranblueBlackFresnel",props);
	    MaterialProperty _GranblueFresnelScale = ShaderGUI.FindProperty("_GranblueFresnelScale",props);
	    MaterialProperty _GranblueFresnelPower = ShaderGUI.FindProperty("_GranblueFresnelPower",props);

        // Global props
        GUILayout.Label("Global Settings", EditorStyles.boldLabel);
        materialEditor.ShaderProperty(_ForceFakeLight, _ForceFakeLight.displayName);
        materialEditor.ShaderProperty(_WrongVertexColors, _WrongVertexColors.displayName);
        materialEditor.ShaderProperty(_Opacity, _Opacity.displayName);

        // Primary props
        GUILayout.Label("Main Textures", EditorStyles.boldLabel);

        materialEditor.TexturePropertySingleLine(Styles.baseText, _Base);
        materialEditor.TexturePropertySingleLine(Styles.sssText, _SSS);
        materialEditor.TexturePropertySingleLine(Styles.ilmText, _ILM);
        materialEditor.TexturePropertySingleLine(Styles.detailText, _Detail);
        materialEditor.ShaderProperty(_METALLICGLOSSMAP, _METALLICGLOSSMAP.displayName);
        if ( _METALLICGLOSSMAP.floatValue == 1)
        {
        	materialEditor.TexturePropertySingleLine(Styles._MetalMatcapText, _MetalMatcap, _MetalAIntensity, _MetalBIntensity);
        }

	    //Light Layer Proprties
        GUILayout.Label("Light Settings", EditorStyles.boldLabel);
		showFakeLightSettings = GUILayout.Toggle(showFakeLightSettings, "Show Fake Light Settings");
		if( showFakeLightSettings == true ){
			materialEditor.ShaderProperty(_FakeLightIntensity, _FakeLightIntensity.displayName);
			materialEditor.ShaderProperty(_FakeLightColor, _FakeLightColor.displayName);
			materialEditor.ShaderProperty(_FakeLightDirX, _FakeLightDirX.displayName);
			materialEditor.ShaderProperty(_FakeLightDirY, _FakeLightDirX.displayName);
		}
		materialEditor.ShaderProperty(_ShadowBrightness, _ShadowBrightness.displayName);
		
		materialEditor.ShaderProperty(_ShadowLayer1Push, _ShadowLayer1Push.displayName);
		materialEditor.ShaderProperty(_ShadowLayer1Fuzziness, _ShadowLayer1Fuzziness.displayName);
		materialEditor.ShaderProperty(_ShadowLayer1Intensity, _ShadowLayer1Intensity.displayName);

		materialEditor.ShaderProperty(_ShadowLayer2Push, _ShadowLayer2Push.displayName);
		materialEditor.ShaderProperty(_ShadowLayer2Fuzziness, _ShadowLayer2Fuzziness.displayName);
		materialEditor.ShaderProperty(_ShadowLayer2Intensity, _ShadowLayer2Intensity.displayName);

		materialEditor.ShaderProperty(_ILMLayer1, _ILMLayer1.displayName);
		materialEditor.ShaderProperty(_ILMLayer2, _ILMLayer2.displayName);

		materialEditor.ShaderProperty(_VertexLayer1, _VertexLayer1.displayName);
		materialEditor.ShaderProperty(_VertexLayer2, _VertexLayer2.displayName);


		//Specular Settings
		GUILayout.Label("Specular Settings", EditorStyles.boldLabel);
		showSpecularSettings = GUILayout.Toggle(showSpecularSettings, "Show Specular Settings");
		if( showSpecularSettings == true ){
			materialEditor.ShaderProperty(_SpecularIntensity, _SpecularIntensity.displayName);
			materialEditor.ShaderProperty(_SpecularSize, _SpecularSize.displayName);
			materialEditor.ShaderProperty(_SpecularFuzzy, _SpecularFuzzy.displayName);
		}

		GUILayout.Label("Highlight Fresnel Settings", EditorStyles.boldLabel);
        materialEditor.ShaderProperty(_COLOROVERLAY, _COLOROVERLAY.displayName);
		if ( _COLOROVERLAY.floatValue == 1){
			materialEditor.ShaderProperty(_DarkHighlightMult, _DarkHighlightMult.displayName);
			materialEditor.ShaderProperty(_HighlightPower, _HighlightPower.displayName);
			materialEditor.ShaderProperty(_HighlightFreselFuzzy, _HighlightFreselFuzzy.displayName);
			materialEditor.ShaderProperty(_HighlightIntensity, _HighlightIntensity.displayName);
			materialEditor.ShaderProperty(_HighlightScale, _HighlightScale.displayName);
		}
		materialEditor.ShaderProperty(_EnableGranblueBlackFresnel, _EnableGranblueBlackFresnel.displayName);
		if ( _EnableGranblueBlackFresnel.floatValue == 1){
			materialEditor.ShaderProperty(_GranblueFresnelScale, _GranblueFresnelScale.displayName);
			materialEditor.ShaderProperty(_GranblueFresnelPower, _GranblueFresnelPower.displayName);
		}

		GUILayout.Label("Credits", EditorStyles.boldLabel);
		showCredits = GUILayout.Toggle(showCredits,"Show credits");
		if ( showCredits == true){
			if (GUILayout.Button("My Discord about about this shader") == true)
	        {
	        	Application.OpenURL("https://discord.gg/EkCSZg8");
	            Debug.Log("Opened external url: https://discord.gg/EkCSZg8");
	        }
			GUILayout.Label("»Thanks to Shamwow for the absolute first guide on the absolute first initial version of the shader.\n\n»Thanks to VCD/Velon for his constant riding of me to keep working on my shader\n\n»Thanks to Nars290 for his constant positivity and assistance with testing and debugging\n\n»Thanks to EdwardsVSGaming for taking an old version of my shader, editing it a small ammount, claiming the entire thing as his own without credit to me, and using deceptive comparisons between that shader and mine forcing me to get off my lazy streak and actually work on my shader again. *clap* *clap* Good job.", EditorStyles.textArea);
		}
    }
}


*/
public class ASWOutlineGUI : ShaderGUI
{
	private static class Styles
    {
        public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
    }

    public override void OnGUI (MaterialEditor materialEditor, MaterialProperty[] props)
    {
    	//foreach (MaterialProperty property in props)
        	//materialEditor.ShaderProperty(property, property.displayName);
		// Renders the default GUI
        //base.OnGUI (materialEditor, props);

        //Findprops(props);              // Find props
        EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
        EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

	    MaterialProperty _WrongVertexColors = ShaderGUI.FindProperty("_WrongVertexColors",props);
	    MaterialProperty _OutlineColor = ShaderGUI.FindProperty("_OutlineColor",props);
	    MaterialProperty _OutlineThickness = ShaderGUI.FindProperty("_OutlineThickness",props);
	    MaterialProperty _EnableBaseColorMult = ShaderGUI.FindProperty("_EnableBaseColorMult",props);
	    MaterialProperty _Base = ShaderGUI.FindProperty("_Base",props);

	    ASWstyles.ShurikenHeaderCentered("Arc System Works Outline");
        
	    if (GUILayout.Button("How to properly set up your outlines") == true)
        {
        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
        }

        // Outline props
        GUILayout.Label("Outline Settings", EditorStyles.boldLabel);
        materialEditor.ShaderProperty(_WrongVertexColors, "Are your vertex colors correct?");
        materialEditor.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
        materialEditor.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
        materialEditor.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
		if( _EnableBaseColorMult.floatValue == 1 ) {
	        materialEditor.ShaderProperty(_Base, _Base.displayName);
	    }
    }
}
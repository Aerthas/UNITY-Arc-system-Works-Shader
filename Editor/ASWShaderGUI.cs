using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;
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
        public static GUIContent _MetalMatcapText = new GUIContent("Metal Texture  |  A Intensity  |  B Intensity", "metal. Only used by Frieza and Cooler from DBFZ as far as I am aware");
        public static GUIContent _FakeLightText = new GUIContent("Color  |  X Dir  |  Y Dir  |  Intensity", "");
    }

    MaterialProperty _ForceFakeLight = null;
    MaterialProperty _ENABLETHISFORGUILTYGEAR = null;
    MaterialProperty _Base = null;
    MaterialProperty _SSS = null;
    MaterialProperty _ILM = null;
    MaterialProperty _Detail = null;
    MaterialProperty _EnableMetalMatcap = null;
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
    MaterialProperty _EnableFresnelHighlight = null;
    MaterialProperty _DarkHighlightMult = null;
    MaterialProperty _HighlightPower = null;
    MaterialProperty _HighlightFreselFuzzy = null;
    MaterialProperty _HighlightIntensity = null;
    MaterialProperty _HighlightScale = null;
    MaterialProperty _EnableGranblueBlackFresnel = null;
    MaterialProperty _GranblueFresnelScale = null;
    MaterialProperty _GranblueFresnelPower = null;


    bool showOutlineSettings = false;
    bool showFakeLightSettings = false;
    bool showSpecularSettings = false;
    bool showCredits = false;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
    	//foreach (MaterialProperty property in props)
        //	materialEditor.ShaderProperty(property, property.displayName);
		// Renders the default GUI
        //base.OnGUI (materialEditor, props);

        Material material = materialEditor.target as Material;
		Shader shader = material.shader;

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
	        // Global props
	        GUILayout.Label("Global Settings", EditorStyles.boldLabel);
	        materialEditor.ShaderProperty(_ForceFakeLight, _ForceFakeLight.displayName);
	        materialEditor.ShaderProperty(_ENABLETHISFORGUILTYGEAR, _ENABLETHISFORGUILTYGEAR.displayName);

	        // Primary props
	        GUILayout.Label("Main Textures", EditorStyles.boldLabel);

	        materialEditor.TexturePropertySingleLine(Styles.baseText, _Base);
	        materialEditor.TexturePropertySingleLine(Styles.sssText, _SSS);
	        materialEditor.TexturePropertySingleLine(Styles.ilmText, _ILM);
	        materialEditor.TexturePropertySingleLine(Styles.detailText, _Detail);
	        materialEditor.ShaderProperty(_EnableMetalMatcap, _EnableMetalMatcap.displayName);
	        if ( _EnableMetalMatcap.floatValue == 1)
	        {
	        	materialEditor.TexturePropertySingleLine(Styles._MetalMatcapText, _MetalMatcap, _MetalAIntensity, _MetalBIntensity);
	        }
	        
	        // Outline props
	        GUILayout.Label("Outline Settings", EditorStyles.boldLabel);

			showOutlineSettings = GUILayout.Toggle(showOutlineSettings, "Looking for outline settings? They're removed.");
			if( showOutlineSettings == true ) {
				GUILayout.Label("I have removed the outline settings as there is no way to properly do the outlines as they should look without frayed points, and broken tips of hair.\nTo reduce the render load caused by still having an inverted hull mesh even if it is set to 0, I've just decided to remove it.\nClick the button below for a guide on how to properly set up your outlines.",EditorStyles.helpBox);
		        if (GUILayout.Button("How to properly set up your outlines") == true)
		        {
		        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
		            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
		        }
		    }

		    //Light Layer Proprties
	        GUILayout.Label("Light Settings", EditorStyles.boldLabel);
			showFakeLightSettings = GUILayout.Toggle(showFakeLightSettings, "Show Fake Light Settings");
			if( showFakeLightSettings == true ){
				materialEditor.ShaderProperty(_FakeLightIntensity, _FakeLightIntensity.displayName);
				materialEditor.ShaderProperty(_FakeLightColor, _FakeLightColor.displayName);
				materialEditor.ShaderProperty(_FakeLightDirX, _FakeLightDirX.displayName);
				materialEditor.ShaderProperty(_FakeLightDirY, _FakeLightDirY.displayName);
			}
			materialEditor.ShaderProperty(_ShadowBrightness, _ShadowBrightness.displayName);
			
			materialEditor.ShaderProperty(_ShadowLayer1Push, _ShadowLayer1Push.displayName);
			materialEditor.ShaderProperty(_ShadowLayer1Gate, _ShadowLayer1Gate.displayName);
			materialEditor.ShaderProperty(_ShadowLayer1Fuzziness, _ShadowLayer1Fuzziness.displayName);
			materialEditor.ShaderProperty(_ShadowLayer1Intensity, _ShadowLayer1Intensity.displayName);

			materialEditor.ShaderProperty(_ShadowLayer2Push, _ShadowLayer2Push.displayName);
			materialEditor.ShaderProperty(_ShadowLayer2Gate, _ShadowLayer2Gate.displayName);
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
	        materialEditor.ShaderProperty(_EnableFresnelHighlight, _EnableFresnelHighlight.displayName);
			if ( _EnableFresnelHighlight.floatValue == 1){
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
	    MaterialProperty _ENABLETHISFORGUILTYGEAR = ShaderGUI.FindProperty("_ENABLETHISFORGUILTYGEAR",props);
	    MaterialProperty _Opacity = ShaderGUI.FindProperty("_Opacity",props);
	    MaterialProperty _Base = ShaderGUI.FindProperty("_Base",props);
	    MaterialProperty _SSS = ShaderGUI.FindProperty("_SSS",props);
	    MaterialProperty _ILM = ShaderGUI.FindProperty("_ILM",props);
	    MaterialProperty _Detail = ShaderGUI.FindProperty("_Detail",props);
	    MaterialProperty _EnableMetalMatcap = ShaderGUI.FindProperty("_EnableMetalMatcap",props);
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
	    MaterialProperty _EnableFresnelHighlight = ShaderGUI.FindProperty("_EnableFresnelHighlight",props);
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
        materialEditor.ShaderProperty(_ENABLETHISFORGUILTYGEAR, _ENABLETHISFORGUILTYGEAR.displayName);
        materialEditor.ShaderProperty(_Opacity, _Opacity.displayName);

        // Primary props
        GUILayout.Label("Main Textures", EditorStyles.boldLabel);

        materialEditor.TexturePropertySingleLine(Styles.baseText, _Base);
        materialEditor.TexturePropertySingleLine(Styles.sssText, _SSS);
        materialEditor.TexturePropertySingleLine(Styles.ilmText, _ILM);
        materialEditor.TexturePropertySingleLine(Styles.detailText, _Detail);
        materialEditor.ShaderProperty(_EnableMetalMatcap, _EnableMetalMatcap.displayName);
        if ( _EnableMetalMatcap.floatValue == 1)
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
        materialEditor.ShaderProperty(_EnableFresnelHighlight, _EnableFresnelHighlight.displayName);
		if ( _EnableFresnelHighlight.floatValue == 1){
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

	    MaterialProperty _ENABLETHISFORGUILTYGEAR = ShaderGUI.FindProperty("_ENABLETHISFORGUILTYGEAR",props);
	    MaterialProperty _OutlineColor = ShaderGUI.FindProperty("_OutlineColor",props);
	    MaterialProperty _OutlineThickness = ShaderGUI.FindProperty("_OutlineThickness",props);
	    MaterialProperty _EnableBaseColorMult = ShaderGUI.FindProperty("_EnableBaseColorMult",props);
	    MaterialProperty _Base = ShaderGUI.FindProperty("_Base",props);
        
        materialEditor.ShaderProperty(_ENABLETHISFORGUILTYGEAR, _ENABLETHISFORGUILTYGEAR.displayName);
	    if (GUILayout.Button("How to properly set up your outlines") == true)
        {
        	Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
        }

        // Outline props
        GUILayout.Label("Outline Settings", EditorStyles.boldLabel);
        materialEditor.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
        materialEditor.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
        materialEditor.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
		if( _EnableBaseColorMult.floatValue == 1 ) {
	        materialEditor.ShaderProperty(_Base, _Base.displayName);
	    }
    }
}
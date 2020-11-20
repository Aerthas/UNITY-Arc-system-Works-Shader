// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light v6.10.0"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_CameraDistanceMult("Camera Distance Mult", Float) = 1
		[Enum(Automatic,0,Forced Fake,1)]_LightColorSetting("Light Color Setting", Float) = 0
		[Enum(Automatic,0,Forced Fake,1)]_LightDirectionSetting("Light Direction Setting", Float) = 0
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 1
		[Enum(Directional Light,0,View Direction,1)]_FakeLightFallbackDirection("Fake Light Fallback Direction", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[Enum(Vertex Colors,0,ILM Channels,1,Base and SSS Alpha,2)]_DebugGroup("Debug Group", Float) = 0
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[NoScaleOffset]_Detail("Detail", 2D) = "white" {}
		[NoScaleOffset]_GlowMask("Glow Mask", 2D) = "black" {}
		[NoScaleOffset]_MetalMatcap("Metal Matcap", 2D) = "white" {}
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 10
		[Enum(Linear,0,Square,1)]_DepthCalculation("Depth Calculation", Float) = 1
		_ILMGShadingThreshold("ILMG Shading Threshold", Range( 0 , 1)) = 0.7
		_FakeLightIntensity("Fake Light Intensity", Range( 0 , 1)) = 1
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_FakeLightDirY("Fake Light Dir Y", Float) = -135
		_ShadowBrightness("Shadow Brightness", Range( 0 , 2)) = 1
		_ShadowLayer1Push("Shadow Layer 1 Push", Range( -1 , 1)) = 0
		_ShadowLayer1Fuzziness("Shadow Layer 1 Fuzziness", Range( 0 , 10)) = 0
		_ShadowLayer1Intensity("Shadow Layer 1 Intensity", Range( 0 , 5)) = 1
		_ShadowLayer2Push("Shadow Layer 2 Push", Range( -1 , 1)) = -0.3
		_ShadowLayer2Fuzziness("Shadow Layer 2 Fuzziness", Range( 0 , 10)) = 0
		_ShadowLayer2Intensity("Shadow Layer 2 Intensity", Range( 0 , 5)) = 1
		_ILMLayer1("ILM Layer 1", Range( 0 , 1)) = 0.6
		_ILMLayer2("ILM Layer 2", Range( 0 , 1)) = 0.3
		_VertexLayer1("Vertex Layer 1", Range( 0 , 1)) = 0.31
		_SpecularIntensity("Specular Intensity", Float) = 1
		_VertexLayer2("Vertex Layer 2", Range( 0 , 1)) = 0.51
		_SpecularSize("Specular Size", Range( -1 , 1)) = -0.15
		[Enum(FighterZ  Guilty Gear Xrd,0,Granblue,1,Strive WIP,2)]_FresnelSystem("Fresnel System", Float) = 0
		_HighlightPower("Highlight Power", Float) = 5
		_HighlightFreselFuzzy("Highlight Fresel Fuzzy", Float) = 0.01
		_HighlightIntensity("Highlight Intensity", Float) = 1
		_HighlightScale("Highlight Scale", Float) = 1
		_DarkHighlightMult("Dark Highlight Mult", Color) = (0.2392157,0.2392157,0.5294118,0)
		_GranblueDarkenPower("Granblue Darken Power", Float) = 1
		_GranblueDarkenScale("Granblue Darken Scale", Float) = 1
		_ViewDirOffsetY("View Dir Offset Y", Float) = 0
		_ViewDirOffsetZ("View Dir Offset Z", Float) = 0
		[Toggle(_ALPHATEST_ON)] _ALPHATEST("Enable Debug", Float) = 0
		[Enum(All Channels,0,Red   Occlusion Shading,1,Green   Scales the Outline based on Camera distance to vertex,2,Blue   Shift the Outline away from the Camera in the ZDepth direction,3,Alpha   Outline Base Thickness,4)]_VertexChannel("Vertex Channel", Float) = 0
		_DebugColor("Debug Color", Color) = (1,1,1,0)
		[Enum(Red   Specular Intensity,0,Green   Shading Occlusion,1,Blue   Specular Mask,2,Alpha   Diffuse Mult for body lines,3)]_ILMChannel("ILM Channel", Float) = 0
		[Enum(Base Alpha   Highlight Fresnel Scale,0,SSS Alpha   Shadow Fresnel Scale,1)]_BaseSSSAlphaSwap("Base SSS Alpha Swap", Float) = 0
		[Toggle]_EnableOutline("Enable Outline", Float) = 0
		[Toggle]_EnableLightColorMult("Enable Light Color Mult", Float) = 1
		[Toggle]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		[Toggle]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_GlowMaskIntensity("Glow Mask Intensity", Float) = 1
		_GlowMaskTint("Glow Mask Tint", Color) = (1,1,1,0)
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		_GlobalIntensityMinimum("Global Intensity Minimum", Range( 0 , 1)) = 0.1
		[Enum(Mask Color,0,Base Color Lerped from Mask,1)]_GlowMaskMultSystem("Glow Mask Mult System", Float) = 0
		_ILMColor("ILM Color", Color) = (1,0,0,0)
		[Enum(Default Black,0,Shadow Priority,1,ILM Priority,2)]_ILMColorSetting("ILM Color Setting", Float) = 0
		[Enum(Default,0,Shadow Priority,1,Detail Priority,2)]_DetailColorSetting("Detail Color Setting", Float) = 0
		_ILMEmissiveIntensity("ILM Emissive Intensity", Float) = 0
		_DetailColor("Detail Color", Color) = (0,1,0,0)
		_DetailEmissiveIntensity("Detail Emissive Intensity", Float) = 0
		[Toggle]_EnableDetailEmission("Enable Detail Emission", Float) = 0
		[Toggle]_EnableILMEmission("Enable ILM Emission", Float) = 0
		[Toggle]_EnableGlowmask("Enable Glowmask", Float) = 0
		[Toggle]_EnableMatcap("EnableMatcap", Float) = 0
		[Toggle]_EnableFresnel("Enable Fresnel", Float) = 1
		_FakeLightDirX("Fake Light Dir X", Float) = 35
		_Target2Color("Target 2 Color", Color) = (1,1,1,1)
		_Target1Color("Target 1 Color", Color) = (1,1,1,1)
		_Source1Color("Source 1 Color", Color) = (1,1,1,1)
		_Source2Color("Source 2 Color", Color) = (1,1,1,1)
		_Source1Fuzziness("Source 1 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Source2Fuzziness("Source 2 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Source3Color("Source 3 Color", Color) = (1,1,1,1)
		_Source3Fuzziness("Source 3 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target3Color("Target 3 Color", Color) = (1,1,1,1)
		_Source4Color("Source 4 Color", Color) = (1,1,1,1)
		_Source4Fuzziness("Source 4 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target4Color("Target 4 Color", Color) = (1,1,1,1)
		_Source5Fuzziness("Source 5 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Source5Color("Source 5 Color", Color) = (1,1,1,1)
		_Target5Color("Target 5 Color", Color) = (1,1,1,1)
		_DepthOffset("Depth Offset", Float) = 1
		[Toggle(_ALPHABLEND_ON)] _ALPHABLEND("_ALPHABLEND", Float) = 0
		[IntRange]_TotalReplacements("Total Replacements", Range( 1 , 5)) = 1
		[Enum(Basic,0,Advanced,1)]_EditorVersion("Editor Version", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0"}
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline nofog  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float eyeDepth = -UnityObjectToViewPos( v.vertex.xyz ).z;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 objectSpaceViewDir66_g865 = ObjSpaceViewDir( float4( ase_vertex3Pos , 0.0 ) );
			float3 normalizeResult68_g865 = normalize( objectSpaceViewDir66_g865 );
			float temp_output_100_0_g865 = ( 1.0 - v.color.b );
			float saferPower104_g865 = max( temp_output_100_0_g865 , 0.0001 );
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_60_0_g865 = ( _OutlineThickness * v.color.a );
			float3 outlineVar = ( ( _DepthOffset * normalizeResult68_g865 * ( -0.001 * (( _DepthCalculation == 0.0 ) ? temp_output_100_0_g865 :  pow( saferPower104_g865 , 2.0 ) ) ) ) + ( ase_vertexNormal * ( 1E-05 * (( _EnableCameraDistanceMult == 0.0 ) ? temp_output_60_0_g865 :  ( temp_output_60_0_g865 + ( v.color.g * eyeDepth * _CameraDistanceMult ) ) ) ) ) );
			v.vertex.xyz += outlineVar;
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float DetailColorSetting1686 = _DetailColorSetting;
			float4 DetailColor1688 = _DetailColor;
			float ILMColorSetting1655 = _ILMColorSetting;
			float4 ILMColor1656 = _ILMColor;
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float temp_output_52_0_g1 = _TotalReplacements;
			float4 break8_g9 = _Target5Color;
			float4 break8_g8 = _Target4Color;
			float4 break8_g7 = _Target3Color;
			float4 break8_g10 = _Target2Color;
			float4 break8_g11 = _Target1Color;
			float4 temp_output_13_0_g11 = tex2DNode182;
			float4 break6_g11 = temp_output_13_0_g11;
			float4 appendResult3_g11 = (float4(break8_g11.r , break8_g11.g , break8_g11.b , break6_g11.a));
			float4 appendResult7_g11 = (float4(break6_g11.r , break6_g11.g , break6_g11.b , 1.0));
			float smoothstepResult5_g11 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g11 , _Source1Color ));
			float4 lerpResult4_g11 = lerp( appendResult3_g11 , temp_output_13_0_g11 , smoothstepResult5_g11);
			float4 temp_output_51_0_g1 = lerpResult4_g11;
			float4 temp_output_13_0_g10 = temp_output_51_0_g1;
			float4 break6_g10 = temp_output_13_0_g10;
			float4 appendResult3_g10 = (float4(break8_g10.r , break8_g10.g , break8_g10.b , break6_g10.a));
			float4 appendResult7_g10 = (float4(break6_g10.r , break6_g10.g , break6_g10.b , 1.0));
			float smoothstepResult5_g10 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g10 , _Source2Color ));
			float4 lerpResult4_g10 = lerp( appendResult3_g10 , temp_output_13_0_g10 , smoothstepResult5_g10);
			float4 temp_output_50_0_g1 = lerpResult4_g10;
			float4 temp_output_13_0_g7 = temp_output_50_0_g1;
			float4 break6_g7 = temp_output_13_0_g7;
			float4 appendResult3_g7 = (float4(break8_g7.r , break8_g7.g , break8_g7.b , break6_g7.a));
			float4 appendResult7_g7 = (float4(break6_g7.r , break6_g7.g , break6_g7.b , 1.0));
			float smoothstepResult5_g7 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g7 , _Source3Color ));
			float4 lerpResult4_g7 = lerp( appendResult3_g7 , temp_output_13_0_g7 , smoothstepResult5_g7);
			float4 temp_output_49_0_g1 = lerpResult4_g7;
			float4 temp_output_13_0_g8 = temp_output_49_0_g1;
			float4 break6_g8 = temp_output_13_0_g8;
			float4 appendResult3_g8 = (float4(break8_g8.r , break8_g8.g , break8_g8.b , break6_g8.a));
			float4 appendResult7_g8 = (float4(break6_g8.r , break6_g8.g , break6_g8.b , 1.0));
			float smoothstepResult5_g8 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g8 , _Source4Color ));
			float4 lerpResult4_g8 = lerp( appendResult3_g8 , temp_output_13_0_g8 , smoothstepResult5_g8);
			float4 temp_output_48_0_g1 = lerpResult4_g8;
			float4 temp_output_13_0_g9 = temp_output_48_0_g1;
			float4 break6_g9 = temp_output_13_0_g9;
			float4 appendResult3_g9 = (float4(break8_g9.r , break8_g9.g , break8_g9.b , break6_g9.a));
			float4 appendResult7_g9 = (float4(break6_g9.r , break6_g9.g , break6_g9.b , 1.0));
			float smoothstepResult5_g9 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g9 , _Source5Color ));
			float4 lerpResult4_g9 = lerp( appendResult3_g9 , temp_output_13_0_g9 , smoothstepResult5_g9);
			#ifdef _ALPHABLEND_ON
				float4 staticSwitch1952 = (( temp_output_52_0_g1 == 5.0 ) ? lerpResult4_g9 :  (( temp_output_52_0_g1 == 4.0 ) ? temp_output_48_0_g1 :  (( temp_output_52_0_g1 == 3.0 ) ? temp_output_49_0_g1 :  (( temp_output_52_0_g1 == 2.0 ) ? temp_output_50_0_g1 :  (( temp_output_52_0_g1 == 1.0 ) ? temp_output_51_0_g1 :  float4( 0,0,0,0 ) ) ) ) ) );
			#else
				float4 staticSwitch1952 = tex2DNode182;
			#endif
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMA118 = tex2DNode113.a;
			float4 lerpResult1658 = lerp( ILMColor1656 , staticSwitch1952 , ILMA118);
			float4 temp_output_1654_0 = (( ILMColorSetting1655 == 1.0 ) ? lerpResult1658 :  ( ILMA118 * staticSwitch1952 ) );
			float4 tex2DNode215 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 lerpResult1724 = lerp( DetailColor1688 , temp_output_1654_0 , tex2DNode215);
			float4 temp_output_1722_0 = (( DetailColorSetting1686 == 1.0 ) ? lerpResult1724 :  ( temp_output_1654_0 * tex2DNode215 ) );
			float4 Base183 = temp_output_1722_0;
			float4 temp_output_13_0_g865 = max( float4( 0,0,0,0 ) , ( 0.2 * Base183 ) );
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float clampResult128_g884 = clamp( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) , 0.0 , 1.0 );
			float4 temp_cast_13 = (_GlobalIntensityMinimum).xxxx;
			float4 temp_cast_14 = (1.0).xxxx;
			float4 clampResult123_g884 = clamp( (( (( _LightColorSetting > 0.0 ) ? 0.0 :  clampResult128_g884 ) > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) ) , temp_cast_13 , temp_cast_14 );
			float4 LightColorOut457 = clampResult123_g884;
			o.Emission = ( ( (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_13_0_g865 * temp_output_13_0_g865 ) :  _OutlineColor ) * _OutlineColorIntensity ) * (( _EnableLightColorMult > 0.0 ) ? LightColorOut457 :  float4( 1,1,1,0 ) ) ).rgb;
			clip( _EnableOutline - _Cutoff );
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Lighting.cginc"
		#pragma target 4.6
		#pragma shader_feature _ALPHABLEND_ON
		#pragma shader_feature _ALPHATEST_ON
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
			float3 worldPos;
			float3 worldNormal;
			float4 vertexColor : COLOR;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _EditorVersion;
		uniform float _EnableGlowmask;
		uniform float _GlowMaskMultSystem;
		uniform sampler2D _GlowMask;
		uniform float _DetailColorSetting;
		uniform float4 _DetailColor;
		uniform float _ILMColorSetting;
		uniform float4 _ILMColor;
		uniform sampler2D _Base;
		uniform float _TotalReplacements;
		uniform float4 _Target5Color;
		uniform float4 _Target4Color;
		uniform float4 _Target3Color;
		uniform float4 _Target2Color;
		uniform float4 _Target1Color;
		uniform float _Source1Fuzziness;
		uniform float4 _Source1Color;
		uniform float _Source2Fuzziness;
		uniform float4 _Source2Color;
		uniform float _Source3Fuzziness;
		uniform float4 _Source3Color;
		uniform float _Source4Fuzziness;
		uniform float4 _Source4Color;
		uniform float _Source5Fuzziness;
		uniform float4 _Source5Color;
		uniform sampler2D _ILM;
		uniform sampler2D _Detail;
		uniform float _GlowMaskIntensity;
		uniform float4 _GlowMaskTint;
		uniform float _EnableILMEmission;
		uniform float _ILMEmissiveIntensity;
		uniform float _EnableDetailEmission;
		uniform float _DetailEmissiveIntensity;
		uniform float _LightColorSetting;
		uniform float4 _FakeLightColor;
		uniform float _FakeLightIntensity;
		uniform float _GlobalIntensityMinimum;
		uniform float _EnableMatcap;
		uniform float _MetalAIntensity;
		uniform sampler2D _MetalMatcap;
		uniform float _MetalBIntensity;
		uniform float _FresnelSystem;
		uniform float _ShadowLayer2Intensity;
		uniform float _ShadowBrightness;
		uniform sampler2D _SSS;
		uniform float4 _DarkHighlightMult;
		uniform float _HighlightIntensity;
		uniform float _EnableFresnel;
		uniform float _HighlightScale;
		uniform float _HighlightPower;
		uniform float _HighlightFreselFuzzy;
		uniform float _GranblueDarkenScale;
		uniform float _GranblueDarkenPower;
		uniform float _ShadowLayer1Intensity;
		uniform float _ShadowLayer1Fuzziness;
		uniform float _ILMGShadingThreshold;
		uniform float _LightDirectionSetting;
		uniform float _FakeLightFallbackDirection;
		uniform float _ViewDirOffsetY;
		uniform float _ViewDirOffsetZ;
		uniform float _FakeLightDirX;
		uniform float _FakeLightDirY;
		uniform float _ShadowLayer1Push;
		uniform float _ILMLayer1;
		uniform float _VertexLayer1;
		uniform float _ShadowLayer2Fuzziness;
		uniform float _ShadowLayer2Push;
		uniform float _ILMLayer2;
		uniform float _VertexLayer2;
		uniform float _SpecularSize;
		uniform float _SpecularIntensity;
		uniform float _DebugGroup;
		uniform float _VertexChannel;
		uniform float4 _DebugColor;
		uniform float _ILMChannel;
		uniform float _BaseSSSAlphaSwap;
		uniform float _DepthOffset;
		uniform float _DepthCalculation;
		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _CameraDistanceMult;
		uniform float _EnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;
		uniform float _EnableLightColorMult;
		uniform float _EnableOutline;
		uniform float _Cutoff = 0.5;


		float3 StereoCameraViewDirection10_g858( float3 worldPos )
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
			#else
			float3 cameraPos = _WorldSpaceCameraPos;
			#endif
			float3 worldViewDir = normalize((cameraPos - worldPos));
			return worldViewDir;
		}


		float3 StereoCameraViewDirection152_g884( float3 worldPos )
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
			#else
			float3 cameraPos = _WorldSpaceCameraPos;
			#endif
			float3 worldViewDir = (cameraPos - worldPos);
			return worldViewDir;
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			v.vertex.xyz += 0;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float clampResult128_g884 = clamp( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) , 0.0 , 1.0 );
			float4 temp_cast_14 = (_GlobalIntensityMinimum).xxxx;
			float4 temp_cast_15 = (1.0).xxxx;
			float4 clampResult123_g884 = clamp( (( (( _LightColorSetting > 0.0 ) ? 0.0 :  clampResult128_g884 ) > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) ) , temp_cast_14 , temp_cast_15 );
			float4 LightColorOut457 = clampResult123_g884;
			float DetailColorSetting1686 = _DetailColorSetting;
			float4 DetailColor1688 = _DetailColor;
			float ILMColorSetting1655 = _ILMColorSetting;
			float4 ILMColor1656 = _ILMColor;
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float temp_output_52_0_g1 = _TotalReplacements;
			float4 break8_g9 = _Target5Color;
			float4 break8_g8 = _Target4Color;
			float4 break8_g7 = _Target3Color;
			float4 break8_g10 = _Target2Color;
			float4 break8_g11 = _Target1Color;
			float4 temp_output_13_0_g11 = tex2DNode182;
			float4 break6_g11 = temp_output_13_0_g11;
			float4 appendResult3_g11 = (float4(break8_g11.r , break8_g11.g , break8_g11.b , break6_g11.a));
			float4 appendResult7_g11 = (float4(break6_g11.r , break6_g11.g , break6_g11.b , 1.0));
			float smoothstepResult5_g11 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g11 , _Source1Color ));
			float4 lerpResult4_g11 = lerp( appendResult3_g11 , temp_output_13_0_g11 , smoothstepResult5_g11);
			float4 temp_output_51_0_g1 = lerpResult4_g11;
			float4 temp_output_13_0_g10 = temp_output_51_0_g1;
			float4 break6_g10 = temp_output_13_0_g10;
			float4 appendResult3_g10 = (float4(break8_g10.r , break8_g10.g , break8_g10.b , break6_g10.a));
			float4 appendResult7_g10 = (float4(break6_g10.r , break6_g10.g , break6_g10.b , 1.0));
			float smoothstepResult5_g10 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g10 , _Source2Color ));
			float4 lerpResult4_g10 = lerp( appendResult3_g10 , temp_output_13_0_g10 , smoothstepResult5_g10);
			float4 temp_output_50_0_g1 = lerpResult4_g10;
			float4 temp_output_13_0_g7 = temp_output_50_0_g1;
			float4 break6_g7 = temp_output_13_0_g7;
			float4 appendResult3_g7 = (float4(break8_g7.r , break8_g7.g , break8_g7.b , break6_g7.a));
			float4 appendResult7_g7 = (float4(break6_g7.r , break6_g7.g , break6_g7.b , 1.0));
			float smoothstepResult5_g7 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g7 , _Source3Color ));
			float4 lerpResult4_g7 = lerp( appendResult3_g7 , temp_output_13_0_g7 , smoothstepResult5_g7);
			float4 temp_output_49_0_g1 = lerpResult4_g7;
			float4 temp_output_13_0_g8 = temp_output_49_0_g1;
			float4 break6_g8 = temp_output_13_0_g8;
			float4 appendResult3_g8 = (float4(break8_g8.r , break8_g8.g , break8_g8.b , break6_g8.a));
			float4 appendResult7_g8 = (float4(break6_g8.r , break6_g8.g , break6_g8.b , 1.0));
			float smoothstepResult5_g8 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g8 , _Source4Color ));
			float4 lerpResult4_g8 = lerp( appendResult3_g8 , temp_output_13_0_g8 , smoothstepResult5_g8);
			float4 temp_output_48_0_g1 = lerpResult4_g8;
			float4 temp_output_13_0_g9 = temp_output_48_0_g1;
			float4 break6_g9 = temp_output_13_0_g9;
			float4 appendResult3_g9 = (float4(break8_g9.r , break8_g9.g , break8_g9.b , break6_g9.a));
			float4 appendResult7_g9 = (float4(break6_g9.r , break6_g9.g , break6_g9.b , 1.0));
			float smoothstepResult5_g9 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g9 , _Source5Color ));
			float4 lerpResult4_g9 = lerp( appendResult3_g9 , temp_output_13_0_g9 , smoothstepResult5_g9);
			#ifdef _ALPHABLEND_ON
				float4 staticSwitch1952 = (( temp_output_52_0_g1 == 5.0 ) ? lerpResult4_g9 :  (( temp_output_52_0_g1 == 4.0 ) ? temp_output_48_0_g1 :  (( temp_output_52_0_g1 == 3.0 ) ? temp_output_49_0_g1 :  (( temp_output_52_0_g1 == 2.0 ) ? temp_output_50_0_g1 :  (( temp_output_52_0_g1 == 1.0 ) ? temp_output_51_0_g1 :  float4( 0,0,0,0 ) ) ) ) ) );
			#else
				float4 staticSwitch1952 = tex2DNode182;
			#endif
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMA118 = tex2DNode113.a;
			float4 lerpResult1658 = lerp( ILMColor1656 , staticSwitch1952 , ILMA118);
			float4 temp_output_1654_0 = (( ILMColorSetting1655 == 1.0 ) ? lerpResult1658 :  ( ILMA118 * staticSwitch1952 ) );
			float4 tex2DNode215 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 lerpResult1724 = lerp( DetailColor1688 , temp_output_1654_0 , tex2DNode215);
			float4 temp_output_1722_0 = (( DetailColorSetting1686 == 1.0 ) ? lerpResult1724 :  ( temp_output_1654_0 * tex2DNode215 ) );
			float4 Base183 = temp_output_1722_0;
			float3 ase_worldNormal = i.worldNormal;
			float3 worldToViewDir98 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode103 = tex2D( _MetalMatcap, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir98).xy ) ) );
			float4 MetalMatCap111 = ( Base183 * ( ( _MetalAIntensity * tex2DNode103.r ) + ( tex2DNode103.b * _MetalBIntensity ) ) );
			float FresnelSystem1380 = _FresnelSystem;
			float2 uv_SSS152 = i.uv_texcoord;
			float4 tex2DNode152 = tex2D( _SSS, uv_SSS152 );
			float4 temp_output_517_0 = ( _ShadowBrightness * tex2DNode152 );
			float4 temp_output_449_0 = ( temp_output_517_0 * temp_output_1722_0 );
			float4 SSS2448 = ( _ShadowLayer2Intensity * temp_output_517_0 * temp_output_449_0 );
			float4 temp_output_43_0_g863 = SSS2448;
			float4 DarkHighlightColor1376 = ( _DarkHighlightMult + SSS2448 );
			float temp_output_67_0_g858 = _HighlightIntensity;
			float temp_output_68_0_g858 = _EnableFresnel;
			float3 worldPos10_g858 = ase_worldPos;
			float3 localStereoCameraViewDirection10_g858 = StereoCameraViewDirection10_g858( worldPos10_g858 );
			float temp_output_70_0_g858 = _HighlightScale;
			float SSSAlpha987 = tex2DNode152.a;
			float temp_output_62_0_g858 = SSSAlpha987;
			float temp_output_71_0_g858 = _HighlightPower;
			float fresnelNdotV19_g858 = dot( ase_worldNormal, localStereoCameraViewDirection10_g858 );
			float fresnelNode19_g858 = ( -0.180914 + ( temp_output_70_0_g858 * temp_output_62_0_g858 ) * pow( 1.0 - fresnelNdotV19_g858, temp_output_71_0_g858 ) );
			float temp_output_69_0_g858 = _HighlightFreselFuzzy;
			float clampResult34_g858 = clamp( ( temp_output_68_0_g858 * pow( saturate( fresnelNode19_g858 ) , temp_output_69_0_g858 ) ) , 0.0 , 1.0 );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float fresnelNdotV21_g858 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode21_g858 = ( 0.0 + ( temp_output_62_0_g858 * _GranblueDarkenScale ) * pow( 1.0 - fresnelNdotV21_g858, _GranblueDarkenPower ) );
			float clampResult27_g858 = clamp( saturate( fresnelNode21_g858 ) , 0.0 , 1.0 );
			float DarkenHighlight538 = (( _FresnelSystem == 0.0 ) ? ( temp_output_67_0_g858 * clampResult34_g858 * temp_output_62_0_g858 ) :  (( temp_output_68_0_g858 == 0.0 ) ? 1.0 :  ( 1.0 - clampResult27_g858 ) ) );
			float temp_output_106_0_g863 = DarkenHighlight538;
			float4 lerpResult122_g863 = lerp( temp_output_43_0_g863 , DarkHighlightColor1376 , temp_output_106_0_g863);
			float4 BaseSSS451 = ( temp_output_449_0 * _ShadowLayer1Intensity );
			float4 temp_output_42_0_g863 = BaseSSS451;
			float4 temp_output_41_0_g863 = Base183;
			float4 SSS440 = temp_output_517_0;
			float4 blendOpSrc548 = SSS440;
			float4 blendOpDest548 = Base183;
			float4 HighlightColor1381 = ( Base183 + ( saturate( ( blendOpDest548/ max( 1.0 - blendOpSrc548, 0.00001 ) ) )) );
			float4 temp_output_111_0_g863 = HighlightColor1381;
			float BaseAlpha850 = tex2DNode182.a;
			float temp_output_60_0_g858 = BaseAlpha850;
			float fresnelNdotV13_g858 = dot( ase_worldNormal, localStereoCameraViewDirection10_g858 );
			float fresnelNode13_g858 = ( -0.180914 + ( temp_output_60_0_g858 * temp_output_70_0_g858 ) * pow( 1.0 - fresnelNdotV13_g858, temp_output_71_0_g858 ) );
			float clampResult31_g858 = clamp( ( pow( saturate( fresnelNode13_g858 ) , temp_output_69_0_g858 ) * temp_output_68_0_g858 ) , 0.0 , 1.0 );
			float Highlight555 = ( temp_output_60_0_g858 * clampResult31_g858 * temp_output_67_0_g858 );
			float temp_output_97_0_g863 = Highlight555;
			float4 lerpResult110_g863 = lerp( temp_output_41_0_g863 , temp_output_111_0_g863 , temp_output_97_0_g863);
			float3 linearToGamma2005 = LinearToGammaSpace( tex2DNode113.rgb );
			float3 break2006 = linearToGamma2005;
			float ILMG360 = break2006.y;
			float temp_output_191_0_g886 = radians( _ViewDirOffsetY );
			float cosY208_g886 = cos( temp_output_191_0_g886 );
			float temp_output_212_0_g886 = radians( _ViewDirOffsetZ );
			float cosZ214_g886 = cos( temp_output_212_0_g886 );
			float temp_output_192_0_g886 = radians( 0.0 );
			float cosX204_g886 = cos( temp_output_192_0_g886 );
			float sinZ213_g886 = sin( temp_output_212_0_g886 );
			float sinX201_g886 = sin( temp_output_192_0_g886 );
			float sinY207_g886 = sin( temp_output_191_0_g886 );
			float4 appendResult223_g886 = (float4(( cosY208_g886 * cosZ214_g886 ) , ( ( cosX204_g886 * sinZ213_g886 ) + ( sinX201_g886 * sinY207_g886 * cosZ214_g886 ) ) , ( ( sinX201_g886 * sinZ213_g886 ) - ( cosX204_g886 * sinY207_g886 * cosZ214_g886 ) ) , 0.0));
			float4 xAxis249_g886 = appendResult223_g886;
			float3 worldPos152_g884 = ase_worldPos;
			float3 localStereoCameraViewDirection152_g884 = StereoCameraViewDirection152_g884( worldPos152_g884 );
			float4 break195_g886 = float4( localStereoCameraViewDirection152_g884 , 0.0 );
			float4 temp_output_282_0_g886 = ( xAxis249_g886 * break195_g886.x );
			float4 appendResult224_g886 = (float4(( -cosY208_g886 * sinZ213_g886 ) , ( ( cosX204_g886 * cosZ214_g886 ) - ( sinX201_g886 * sinY207_g886 * sinZ213_g886 ) ) , ( ( sinX201_g886 * cosZ214_g886 ) + ( cosX204_g886 * sinY207_g886 * sinZ213_g886 ) ) , 0.0));
			float4 yAxis266_g886 = appendResult224_g886;
			float4 temp_output_285_0_g886 = ( yAxis266_g886 * break195_g886.y );
			float4 appendResult226_g886 = (float4(sinY207_g886 , ( -sinX201_g886 * cosY208_g886 ) , ( cosX204_g886 * cosY208_g886 ) , 0.0));
			float4 zAxis277_g886 = appendResult226_g886;
			float4 temp_output_287_0_g886 = ( zAxis277_g886 * break195_g886.z );
			float4 appendResult278_g886 = (float4(0.0 , 0.0 , 0.0 , 1.0));
			float4 wAxis279_g886 = appendResult278_g886;
			float4 temp_output_289_0_g886 = ( wAxis279_g886 * break195_g886.w );
			float4 normalizeResult291_g886 = normalize( ( temp_output_282_0_g886 + temp_output_285_0_g886 + temp_output_287_0_g886 + temp_output_289_0_g886 ) );
			float3 appendResult15_g885 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
			float3 normalizeResult2_g885 = normalize( appendResult15_g885 );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult28_g884 = dot( (( (( _LightDirectionSetting > 0.0 ) ? 0.0 :  clampResult128_g884 ) > 0.0 ) ? float4( ase_worldlightDir , 0.0 ) :  (( _FakeLightFallbackDirection > 0.0 ) ? normalizeResult291_g886 :  float4( normalizeResult2_g885 , 0.0 ) ) ) , float4( ase_normWorldNormal , 0.0 ) );
			float ifLocalVar164_g884 = 0;
			UNITY_BRANCH 
			if( ILMG360 >= _ILMGShadingThreshold )
				ifLocalVar164_g884 = 1.0;
			else
				ifLocalVar164_g884 = dotResult28_g884;
			float DefaultDot14 = ifLocalVar164_g884;
			float temp_output_37_0_g863 = DefaultDot14;
			float temp_output_8_0_g868 = ( 1.0 - _ILMLayer1 );
			float temp_output_1_0_g868 = ILMG360;
			float temp_output_20_0_g868 = ( 1.0 - temp_output_1_0_g868 );
			float ILMB117 = break2006.z;
			float4 color12_g868 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 temp_cast_34 = (Highlight555).xxxx;
			float4 temp_output_34_0_g868 = temp_cast_34;
			float4 temp_output_22_0_g868 = ( ( ILMB117 * 0.4 ) + ( color12_g868 + temp_output_34_0_g868 ) );
			float4 ifLocalVar24_g868 = 0;
			if( temp_output_8_0_g868 >= temp_output_20_0_g868 )
				ifLocalVar24_g868 = temp_output_22_0_g868;
			float4 clampResult26_g868 = clamp( ifLocalVar24_g868 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_44_0_g868 = ( 1.0 - i.vertexColor.r );
			float4 color39_g868 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_46_0_g868 = ( ( temp_output_1_0_g868 * 0.4 ) + ( temp_output_34_0_g868 + color39_g868 ) );
			float4 ifLocalVar49_g868 = 0;
			if( _VertexLayer1 >= temp_output_44_0_g868 )
				ifLocalVar49_g868 = temp_output_46_0_g868;
			float4 clampResult51_g868 = clamp( ifLocalVar49_g868 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_38_0_g863 = ( clampResult26_g868.r * clampResult51_g868.x );
			float smoothstepResult23_g863 = smoothstep( 0.0 , ( _ShadowLayer1Fuzziness * 0.01 ) , ( ( ( -1.0 + i.vertexColor.r + temp_output_37_0_g863 ) - _ShadowLayer1Push ) * temp_output_38_0_g863 ));
			float PrimaryDot127_g863 = smoothstepResult23_g863;
			float4 lerpResult26_g863 = lerp( temp_output_42_0_g863 , lerpResult110_g863 , PrimaryDot127_g863);
			float temp_output_13_0_g868 = ( 1.0 - _ILMLayer2 );
			float4 ifLocalVar23_g868 = 0;
			if( temp_output_13_0_g868 >= temp_output_20_0_g868 )
				ifLocalVar23_g868 = temp_output_22_0_g868;
			float4 clampResult25_g868 = clamp( ifLocalVar23_g868 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ifLocalVar50_g868 = 0;
			if( _VertexLayer2 >= temp_output_44_0_g868 )
				ifLocalVar50_g868 = temp_output_46_0_g868;
			float4 clampResult52_g868 = clamp( ifLocalVar50_g868 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float temp_output_39_0_g863 = ( clampResult25_g868.r * clampResult52_g868.x );
			float smoothstepResult25_g863 = smoothstep( 0.0 , ( _ShadowLayer2Fuzziness * 0.01 ) , ( ( temp_output_37_0_g863 - _ShadowLayer2Push ) * temp_output_39_0_g863 ));
			float SecondaryDot129_g863 = smoothstepResult25_g863;
			float4 lerpResult28_g863 = lerp( lerpResult122_g863 , lerpResult26_g863 , SecondaryDot129_g863);
			float4 blendOpSrc659 = SSS440;
			float4 blendOpDest659 = Base183;
			float4 SpecularColor924 = ( Base183 + ( saturate( ( blendOpDest659/ max( 1.0 - blendOpSrc659, 0.00001 ) ) )) );
			float4 temp_output_91_0_g863 = SpecularColor924;
			float temp_output_92_0_g863 = ILMB117;
			float lerpResult152_g863 = lerp( 0.0 , temp_output_37_0_g863 , ceil( temp_output_92_0_g863 ));
			float temp_output_86_0_g863 = _SpecularSize;
			float lerpResult155_g863 = lerp( 0.0 , temp_output_37_0_g863 , temp_output_92_0_g863);
			float ILMR119 = break2006.x;
			float TertiaryDot131_g863 = ( (( lerpResult152_g863 > ( ( 1.0 - temp_output_86_0_g863 ) - lerpResult155_g863 ) ) ? 1.0 :  0.0 ) * ILMR119 * _SpecularIntensity );
			float4 lerpResult58_g863 = lerp( lerpResult28_g863 , temp_output_91_0_g863 , TertiaryDot131_g863);
			float4 lerpResult142_g863 = lerp( temp_output_42_0_g863 , temp_output_41_0_g863 , PrimaryDot127_g863);
			float4 lerpResult143_g863 = lerp( temp_output_43_0_g863 , lerpResult142_g863 , SecondaryDot129_g863);
			float4 lerpResult144_g863 = lerp( lerpResult143_g863 , temp_output_91_0_g863 , TertiaryDot131_g863);
			float4 lerpResult145_g863 = lerp( ( temp_output_106_0_g863 * lerpResult144_g863 ) , temp_output_111_0_g863 , ( temp_output_97_0_g863 * i.vertexColor.r ));
			float4 clampResult33_g863 = clamp( (( FresnelSystem1380 == 0.0 ) ? lerpResult58_g863 :  lerpResult145_g863 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 temp_output_2016_0 = clampResult33_g863;
			float4 Detail443 = tex2DNode215;
			float4 lerpResult1707 = lerp( DetailColor1688 , temp_output_2016_0 , Detail443);
			float4 temp_output_1712_0 = (( DetailColorSetting1686 < 2.0 ) ? temp_output_2016_0 :  lerpResult1707 );
			float4 lerpResult1663 = lerp( ILMColor1656 , temp_output_1712_0 , ILMA118);
			float temp_output_48_0_g864 = _DebugGroup;
			float temp_output_47_0_g864 = _VertexChannel;
			float4 temp_output_59_0_g864 = _DebugColor;
			float temp_output_50_0_g864 = _ILMChannel;
			float3 ILM1231 = linearToGamma2005;
			float4 break7_g864 = float4( ILM1231 , 0.0 );
			float temp_output_57_0_g864 = _BaseSSSAlphaSwap;
			float4 Debug1214 = (( temp_output_48_0_g864 == 0.0 ) ? (( temp_output_47_0_g864 == 0.0 ) ? i.vertexColor :  (( temp_output_47_0_g864 == 1.0 ) ? ( i.vertexColor.r * temp_output_59_0_g864 ) :  (( temp_output_47_0_g864 == 2.0 ) ? ( i.vertexColor.g * temp_output_59_0_g864 ) :  (( temp_output_47_0_g864 == 3.0 ) ? ( i.vertexColor.b * temp_output_59_0_g864 ) :  (( temp_output_47_0_g864 == 4.0 ) ? ( i.vertexColor.a * temp_output_59_0_g864 ) :  float4( 0,0,0,0 ) ) ) ) ) ) :  (( temp_output_48_0_g864 == 1.0 ) ? (( temp_output_50_0_g864 == 0.0 ) ? ( break7_g864.r * temp_output_59_0_g864 ) :  (( temp_output_50_0_g864 == 1.0 ) ? ( break7_g864.g * temp_output_59_0_g864 ) :  (( temp_output_50_0_g864 == 2.0 ) ? ( break7_g864.b * temp_output_59_0_g864 ) :  (( temp_output_50_0_g864 == 3.0 ) ? ( break7_g864.a * temp_output_59_0_g864 ) :  float4( 0,0,0,0 ) ) ) ) ) :  (( temp_output_48_0_g864 == 2.0 ) ? (( temp_output_57_0_g864 == 0.0 ) ? ( BaseAlpha850 * temp_output_59_0_g864 ) :  (( temp_output_57_0_g864 == 1.0 ) ? ( SSSAlpha987 * temp_output_59_0_g864 ) :  float4( 0,0,0,0 ) ) ) :  float4( 0,0,0,0 ) ) ) );
			#ifdef _ALPHATEST_ON
				float4 staticSwitch1175 = Debug1214;
			#else
				float4 staticSwitch1175 = ( LightColorOut457 * (( _EnableMatcap > 0.0 ) ? MetalMatCap111 :  (( ILMColorSetting1655 < 2.0 ) ? temp_output_1712_0 :  lerpResult1663 ) ) );
			#endif
			c.rgb = staticSwitch1175.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 uv_GlowMask1461 = i.uv_texcoord;
			float4 tex2DNode1461 = tex2D( _GlowMask, uv_GlowMask1461 );
			float DetailColorSetting1686 = _DetailColorSetting;
			float4 DetailColor1688 = _DetailColor;
			float ILMColorSetting1655 = _ILMColorSetting;
			float4 ILMColor1656 = _ILMColor;
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float temp_output_52_0_g1 = _TotalReplacements;
			float4 break8_g9 = _Target5Color;
			float4 break8_g8 = _Target4Color;
			float4 break8_g7 = _Target3Color;
			float4 break8_g10 = _Target2Color;
			float4 break8_g11 = _Target1Color;
			float4 temp_output_13_0_g11 = tex2DNode182;
			float4 break6_g11 = temp_output_13_0_g11;
			float4 appendResult3_g11 = (float4(break8_g11.r , break8_g11.g , break8_g11.b , break6_g11.a));
			float4 appendResult7_g11 = (float4(break6_g11.r , break6_g11.g , break6_g11.b , 1.0));
			float smoothstepResult5_g11 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g11 , _Source1Color ));
			float4 lerpResult4_g11 = lerp( appendResult3_g11 , temp_output_13_0_g11 , smoothstepResult5_g11);
			float4 temp_output_51_0_g1 = lerpResult4_g11;
			float4 temp_output_13_0_g10 = temp_output_51_0_g1;
			float4 break6_g10 = temp_output_13_0_g10;
			float4 appendResult3_g10 = (float4(break8_g10.r , break8_g10.g , break8_g10.b , break6_g10.a));
			float4 appendResult7_g10 = (float4(break6_g10.r , break6_g10.g , break6_g10.b , 1.0));
			float smoothstepResult5_g10 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g10 , _Source2Color ));
			float4 lerpResult4_g10 = lerp( appendResult3_g10 , temp_output_13_0_g10 , smoothstepResult5_g10);
			float4 temp_output_50_0_g1 = lerpResult4_g10;
			float4 temp_output_13_0_g7 = temp_output_50_0_g1;
			float4 break6_g7 = temp_output_13_0_g7;
			float4 appendResult3_g7 = (float4(break8_g7.r , break8_g7.g , break8_g7.b , break6_g7.a));
			float4 appendResult7_g7 = (float4(break6_g7.r , break6_g7.g , break6_g7.b , 1.0));
			float smoothstepResult5_g7 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g7 , _Source3Color ));
			float4 lerpResult4_g7 = lerp( appendResult3_g7 , temp_output_13_0_g7 , smoothstepResult5_g7);
			float4 temp_output_49_0_g1 = lerpResult4_g7;
			float4 temp_output_13_0_g8 = temp_output_49_0_g1;
			float4 break6_g8 = temp_output_13_0_g8;
			float4 appendResult3_g8 = (float4(break8_g8.r , break8_g8.g , break8_g8.b , break6_g8.a));
			float4 appendResult7_g8 = (float4(break6_g8.r , break6_g8.g , break6_g8.b , 1.0));
			float smoothstepResult5_g8 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g8 , _Source4Color ));
			float4 lerpResult4_g8 = lerp( appendResult3_g8 , temp_output_13_0_g8 , smoothstepResult5_g8);
			float4 temp_output_48_0_g1 = lerpResult4_g8;
			float4 temp_output_13_0_g9 = temp_output_48_0_g1;
			float4 break6_g9 = temp_output_13_0_g9;
			float4 appendResult3_g9 = (float4(break8_g9.r , break8_g9.g , break8_g9.b , break6_g9.a));
			float4 appendResult7_g9 = (float4(break6_g9.r , break6_g9.g , break6_g9.b , 1.0));
			float smoothstepResult5_g9 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g9 , _Source5Color ));
			float4 lerpResult4_g9 = lerp( appendResult3_g9 , temp_output_13_0_g9 , smoothstepResult5_g9);
			#ifdef _ALPHABLEND_ON
				float4 staticSwitch1952 = (( temp_output_52_0_g1 == 5.0 ) ? lerpResult4_g9 :  (( temp_output_52_0_g1 == 4.0 ) ? temp_output_48_0_g1 :  (( temp_output_52_0_g1 == 3.0 ) ? temp_output_49_0_g1 :  (( temp_output_52_0_g1 == 2.0 ) ? temp_output_50_0_g1 :  (( temp_output_52_0_g1 == 1.0 ) ? temp_output_51_0_g1 :  float4( 0,0,0,0 ) ) ) ) ) );
			#else
				float4 staticSwitch1952 = tex2DNode182;
			#endif
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMA118 = tex2DNode113.a;
			float4 lerpResult1658 = lerp( ILMColor1656 , staticSwitch1952 , ILMA118);
			float4 temp_output_1654_0 = (( ILMColorSetting1655 == 1.0 ) ? lerpResult1658 :  ( ILMA118 * staticSwitch1952 ) );
			float4 tex2DNode215 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 lerpResult1724 = lerp( DetailColor1688 , temp_output_1654_0 , tex2DNode215);
			float4 temp_output_1722_0 = (( DetailColorSetting1686 == 1.0 ) ? lerpResult1724 :  ( temp_output_1654_0 * tex2DNode215 ) );
			float4 Base183 = temp_output_1722_0;
			float4 lerpResult1529 = lerp( float4( 0,0,0,0 ) , Base183 , tex2DNode1461);
			float4 lerpResult1675 = lerp( ILMColor1656 , float4( 0,0,0,0 ) , ILMA118);
			float4 Detail443 = tex2DNode215;
			float4 lerpResult1689 = lerp( DetailColor1688 , float4( 0,0,0,0 ) , Detail443);
			float4 Emission1454 = ( ( _EnableGlowmask * ( (( _GlowMaskMultSystem == 0.0 ) ? tex2DNode1461 :  lerpResult1529 ) * _GlowMaskIntensity * _GlowMaskTint * Base183 ) ) + (( _EnableILMEmission > 0.0 ) ? ( lerpResult1675 * _ILMEmissiveIntensity ) :  float4( 0,0,0,0 ) ) + (( DetailColorSetting1686 > 0.0 ) ? ( _EnableDetailEmission * ( lerpResult1689 * _DetailEmissiveIntensity ) ) :  float4( 0,0,0,0 ) ) );
			o.Emission = Emission1454.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows exclude_path:deferred vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 4.6
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.customPack1.zw = customInputData.uv2_texcoord2;
				o.customPack1.zw = v.texcoord1;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				surfIN.uv2_texcoord2 = IN.customPack1.zw;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				surfIN.vertexColor = IN.color;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}

	Dependency "RenderType"="Opaque"
	Fallback "Diffuse"
	CustomEditor "ASWShaderGUI"
}
/*ASEBEGIN
Version=17800
2722;149;2296;1092;7584.678;3757.848;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;516;-5145.481,-3364.228;Inherit;False;5374.686;2198.42;;51;451;871;870;448;447;850;543;987;449;183;938;440;1729;517;1722;1723;152;518;1728;1724;1725;1654;1669;1658;1657;1688;512;444;1687;1659;1656;1631;112;1900;182;1899;1897;1907;1908;1909;1911;1912;1913;1914;1915;1916;1917;1918;1919;1952;1954;Color Information;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;112;-2477.4,-1744.9;Inherit;False;1253.479;522.9945;ILM Information;10;113;1231;119;360;117;1655;118;1639;2006;2005;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;113;-2472.002,-1659.167;Inherit;True;Property;_ILM;ILM;8;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;7948155db19842242b512f97e874b992;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1907;-4864,-2608;Inherit;False;Property;_Source2Color;Source 2 Color;74;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1913;-4864,-1920;Inherit;False;Property;_Target3Color;Target 3 Color;79;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1915;-4928,-1568;Inherit;False;Property;_Source4Fuzziness;Source 4 Fuzziness;81;0;Create;True;0;0;False;0;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1897;-4864,-2784;Inherit;False;Property;_Target1Color;Target 1 Color;72;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1918;-4502.52,-1333.407;Inherit;False;Property;_Source5Fuzziness;Source 5 Fuzziness;83;0;Create;True;0;0;False;0;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1908;-4864,-2352;Inherit;False;Property;_Target2Color;Target 2 Color;71;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1911;-4864,-2176;Inherit;False;Property;_Source3Color;Source 3 Color;77;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;182;-4960,-3232;Inherit;True;Property;_Base;Base;6;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;3fb2a23df9f88244a9ab2d8484aae955;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1912;-4928,-2000;Inherit;False;Property;_Source3Fuzziness;Source 3 Fuzziness;78;0;Create;True;0;0;False;0;0.01;0;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1909;-4928,-2432;Inherit;False;Property;_Source2Fuzziness;Source 2 Fuzziness;76;0;Create;True;0;0;False;0;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1914;-4864,-1744;Inherit;False;Property;_Source4Color;Source 4 Color;80;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1631;-348.0558,-3217.669;Inherit;False;Property;_ILMColor;ILM Color;59;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1917;-4466.52,-1493.407;Inherit;False;Property;_Source5Color;Source 5 Color;84;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1900;-4928,-2864;Inherit;False;Property;_Source1Fuzziness;Source 1 Fuzziness;75;0;Create;True;0;0;False;0;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1899;-4864,-3040;Inherit;False;Property;_Source1Color;Source 1 Color;73;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1919;-4140.52,-1437.407;Inherit;False;Property;_Target5Color;Target 5 Color;85;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1916;-4864,-1488;Inherit;False;Property;_Target4Color;Target 4 Color;82;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1954;-4896,-3312;Inherit;False;Property;_TotalReplacements;Total Replacements;88;1;[IntRange];Create;True;5;1;1;2;2;3;3;4;4;5;5;0;False;0;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1656;-73.48386,-3209.888;Inherit;False;ILMColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-1439.202,-1395.948;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1956;-3648.928,-2745.058;Inherit;False;Color Replacer;-1;;1;3bf8a732171ac6840bcd0b4c21fcee62;0;17;52;FLOAT;0;False;1;COLOR;0,0,0,0;False;16;COLOR;0,0,0,1;False;17;FLOAT;0;False;13;COLOR;0,0,0,0;False;31;COLOR;0,0,0,1;False;32;FLOAT;0;False;30;COLOR;0,0,0,0;False;36;COLOR;0,0,0,1;False;38;FLOAT;0;False;37;COLOR;0,0,0,0;False;40;COLOR;0,0,0,1;False;42;FLOAT;0;False;41;COLOR;0,0,0,0;False;44;COLOR;0,0,0,1;False;46;FLOAT;0;False;45;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1639;-1685.908,-1317.844;Inherit;False;Property;_ILMColorSetting;ILM Color Setting;60;1;[Enum];Create;True;3;Default Black;0;Shadow Priority;1;ILM Priority;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1952;-3046.165,-2827.333;Inherit;False;Property;_ALPHABLEND;_ALPHABLEND;87;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1659;-2489.318,-2897.35;Inherit;False;1656;ILMColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-2473.329,-2808.501;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1687;-345.9919,-3002.965;Inherit;False;Property;_DetailColor;Detail Color;63;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;444;-2379.714,-2592.922;Inherit;False;855.0317;397.3198;Detail;5;1685;1686;443;215;216;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1655;-1457.577,-1318.215;Inherit;False;ILMColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1669;-2168.194,-2766.631;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1658;-2177.914,-2901.068;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-2329.714,-2526.885;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1688;-105.9919,-2998.965;Inherit;False;DetailColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1685;-2083.927,-2304.372;Inherit;False;Property;_DetailColorSetting;Detail Color Setting;61;1;[Enum];Create;True;3;Default;0;Shadow Priority;1;Detail Priority;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1657;-2194.721,-2997.867;Inherit;False;1655;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;215;-2089.467,-2539.601;Inherit;True;Property;_Detail;Detail;10;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;a5bbaf07092aaf7408573c61d67adb44;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareEqual;1654;-1931.392,-2881.509;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1686;-1786.236,-2302.947;Inherit;False;DetailColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-2738.113,-3195.975;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;20;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;152;-2823.373,-3103.122;Inherit;True;Property;_SSS;SSS;9;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;de8dc23fa59bab04caa6c08d65663cdc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1725;-1877.329,-2973.833;Inherit;False;1688;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1723;-1642.332,-3018.833;Inherit;False;1686;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1728;-1596.332,-2778.833;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1724;-1602.332,-2916.833;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-2422.813,-3100.151;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;1729;-919.9938,-3026.659;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1722;-1337.332,-2944.833;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;2005;-2072.926,-1578.469;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-886.8157,-2950.411;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-1183.609,-3236.277;Inherit;False;Property;_ShadowLayer2Intensity;Shadow Layer 2 Intensity;26;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;96;-5054.192,866.7242;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;0,1,0.1342869,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;-2505.206,-2988.392;Inherit;False;SSSAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1754;-5175.667,1449.593;Inherit;False;2314.223;885;;23;1753;555;538;578;1340;685;1706;604;701;553;1427;1429;1378;1380;547;548;546;944;1381;1392;859;1393;1376;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;-4626.499,-3053.024;Inherit;False;BaseAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1429;-4031.442,2139.594;Inherit;False;Property;_GranblueDarkenPower;Granblue Darken Power;40;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-3967.442,1899.594;Inherit;False;Property;_HighlightScale;Highlight Scale;38;0;Create;True;0;0;False;0;1;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-734.8527,-3141.758;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1706;-3983.442,1739.593;Inherit;False;Property;_EnableFresnel;Enable Fresnel;69;1;[Toggle];Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-3999.442,1659.593;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;37;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-1123.412,-3000.84;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2006;-1761.471,-1579.767;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;1340;-3983.442,1579.593;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;553;-3983.442,1979.594;Inherit;False;Property;_HighlightPower;Highlight Power;35;0;Create;True;0;0;False;0;5;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1427;-4031.442,2059.594;Inherit;False;Property;_GranblueDarkenScale;Granblue Darken Scale;41;0;Create;True;0;0;False;0;1;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;97;-5004.193,1085.924;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;938;-1159.162,-1604.617;Inherit;False;1255.028;381.48;Specular Color;5;924;921;659;657;658;;1,1,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-2233.175,-3166.145;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-4015.442,1819.593;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;36;0;Create;True;0;0;False;0;0.01;0.93;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-3983.442,1499.593;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1378;-3983.442,2219.594;Inherit;False;Property;_FresnelSystem;Fresnel System;34;1;[Enum];Create;True;3;FighterZ  Guilty Gear Xrd;0;Granblue;1;Strive WIP;2;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-1116.163,-1564.734;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1015;-6998.597,-3471.728;Inherit;False;1594.771;1244.756;;16;1116;2034;457;14;1508;975;1750;217;1122;1629;2033;947;1057;1513;1016;1683;Automatic Light System;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-1103.361,-1349.837;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-1438.34,-1546.655;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-5120.865,1896.956;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TransformDirectionNode;98;-4813.252,1081.426;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-572.4819,-3138.33;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1753;-3567.442,1739.593;Inherit;False;Fresnel System;-1;;858;811554b0cdf882345bcf8f25bedebacd;0;10;60;FLOAT;0;False;62;FLOAT;0;False;67;FLOAT;0;False;68;FLOAT;0;False;69;FLOAT;0;False;70;FLOAT;0;False;71;FLOAT;0;False;72;FLOAT;0;False;73;FLOAT;0;False;74;FLOAT;0;False;2;FLOAT;57;FLOAT;59
Node;AmplifyShaderEditor.GetLocalVarNode;546;-5125.667,1780.059;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2034;-6896,-3328;Inherit;False;Property;_ILMGShadingThreshold;ILMG Shading Threshold;16;0;Create;True;0;0;False;0;0.7;0.7;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-1167.811,-2794.723;Inherit;False;Property;_ShadowLayer1Intensity;Shadow Layer 1 Intensity;23;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;859;-5059.478,2025.973;Inherit;False;Property;_DarkHighlightMult;Dark Highlight Mult;39;0;Create;True;0;0;False;0;0.2392157,0.2392157,0.5294118,0;0.2392151,0.2392151,0.5294118,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;998;-6049.245,-332.7801;Inherit;False;1127.255;736.3494;;7;490;482;501;790;508;477;483;Permanent Shadows;0.6037736,0.5895336,0.5895336,1;0;0
Node;AmplifyShaderEditor.BlendOpsNode;548;-4880.729,1862.426;Inherit;False;ColorDodge;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-3119.442,1691.593;Inherit;False;Highlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1392;-5018.203,2214.853;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;659;-757.2196,-1398.367;Inherit;False;ColorDodge;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-1442.497,-1473.751;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;100;-4585.199,1081.924;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;2033;-6800,-3408;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1513;-6864,-2336;Inherit;False;Property;_GlobalIntensityMinimum;Global Intensity Minimum;57;0;Create;True;0;0;False;0;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-6864,-3168;Inherit;False;Property;_LightDirectionSetting;Light Direction Setting;2;1;[Enum];Create;True;2;Automatic;0;Forced Fake;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1683;-6608,-2592;Inherit;False;Constant;_Float2;Float 2;71;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;-6800,-2656;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;19;0;Create;True;0;0;False;0;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1750;-6800,-2736;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;70;0;Create;True;0;0;False;0;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1508;-6832,-3248;Inherit;False;Property;_LightColorSetting;Light Color Setting;1;1;[Enum];Create;True;2;Automatic;0;Forced Fake;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-6800,-2496;Inherit;False;Property;_ViewDirOffsetY;View Dir Offset Y;43;0;Create;True;0;0;False;0;0;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1629;-6800,-2416;Inherit;False;Property;_ViewDirOffsetZ;View Dir Offset Z;44;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-6864,-2992;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;17;0;Create;True;0;0;False;0;1;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1057;-6896,-3072;Inherit;False;Property;_FakeLightFallbackDirection;Fake Light Fallback Direction;5;1;[Enum];Create;True;2;Directional Light;0;View Direction;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-6800,-2912;Float;False;Property;_FakeLightColor;Fake Light Color;18;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;501;-5999.245,-122.7799;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;29;0;Create;True;0;0;False;0;0.31;0.254;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;921;-416.1237,-1513.94;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-5999.245,-282.7801;Inherit;False;Property;_ILMLayer1;ILM Layer 1;27;0;Create;True;0;0;False;0;0.6;0.335;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-4360.195,1064.924;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;871;-718.4967,-2874.935;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-5999.245,-42.77975;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;31;0;Create;True;0;0;False;0;0.51;0.51;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-5920,32;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2039;-6131.979,-3038.043;Inherit;False;Merged Light Function;-1;;884;6a9b492f5059fcf4aa61bcbd0dc72ff9;0;13;159;FLOAT;0;False;166;FLOAT;0.7;False;126;FLOAT;0;False;46;FLOAT;0;False;71;FLOAT;0;False;42;FLOAT;0;False;41;FLOAT4;0,0,0,0;False;38;FLOAT;0;False;39;FLOAT;0;False;99;FLOAT;0;False;100;FLOAT;0;False;157;FLOAT;0;False;121;COLOR;0,0,0,0;False;2;COLOR;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;790;-5920,192;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1393;-4770.203,2083.853;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;944;-4626.051,1800.717;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-5999.245,-202.7802;Inherit;False;Property;_ILMLayer2;ILM Layer 2;28;0;Create;True;0;0;False;0;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-5920,112;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-3119.442,1803.593;Inherit;False;DarkenHighlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2031;-5458.611,-117.5838;Inherit;False;Permanent Shadows;-1;;868;1ce4709ce3667c2438e413e9b79be23a;0;7;3;FLOAT;0;False;4;FLOAT;0;False;58;FLOAT;0;False;59;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;34;FLOAT4;0,0,0,0;False;2;FLOAT;0;FLOAT;35
Node;AmplifyShaderEditor.RegisterLocalVarNode;1380;-3727.442,2219.594;Inherit;False;FresnelSystem;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1381;-4339.555,1779.829;Inherit;False;HighlightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-4207.196,1049.924;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1376;-4626.855,2050.869;Inherit;False;DarkHighlightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;924;-112.1017,-1503.309;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1006;-4881.321,-1090.758;Inherit;False;1758.411;1891.205;;21;1395;1263;848;1396;1385;935;463;1290;467;465;734;455;1321;832;834;926;1320;460;625;918;635;Shading System;0.4313726,0,0.7843137,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-551.7488,-2861.912;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-1441.539,-1626.558;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-5733.575,-2920.082;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1396;-4716.429,646.8701;Inherit;False;538;DarkenHighlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;848;-4716.429,566.8701;Inherit;False;1381;HighlightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-1729.684,-2479.921;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1784;-3004.417,-620.1951;Inherit;False;682.1055;415.9123;;5;1707;1712;1710;1708;514;Detail Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-4380.954,-1017.758;Inherit;False;Property;_SpecularIntensity;Specular Intensity;30;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;918;-4672,-784;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-4772.261,-550.7559;Inherit;False;Property;_ShadowLayer1Fuzziness;Shadow Layer 1 Fuzziness;22;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1534;-2886.696,79.5379;Inherit;False;2180.807;1326.282;;30;1682;1454;1679;1680;1703;1696;1697;1702;1455;1699;1678;1700;1456;1458;1675;1462;1698;1533;1693;1677;1689;1676;1674;1529;1694;1527;1692;1461;1690;1528;Glow Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1395;-4736,720;Inherit;False;1376;DarkHighlightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-4768,-624;Inherit;False;Property;_ShadowLayer1Push;Shadow Layer 1 Push;21;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1320;-4569.519,-74.59047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-4694.261,-227.7558;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;-4672,-704;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4676.261,249.2441;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;1321;-4584.935,-115.7036;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-3980.895,1235.422;Float;False;Property;_MetalBIntensity;Metal B Intensity;14;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1385;-4716.429,406.8701;Inherit;False;1380;FresnelSystem;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4676.261,89.24409;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4676.261,329.2442;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1263;-4684.429,486.8701;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-4772.261,-470.7559;Inherit;False;Property;_ShadowLayer2Push;Shadow Layer 2 Push;24;0;Create;True;0;0;False;0;-0.3;-0.393;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4772.261,-310.7558;Inherit;False;Property;_ShadowLayer2Fuzziness;Shadow Layer 2 Fuzziness;25;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-4001.195,918.8229;Float;False;Property;_MetalAIntensity;Metal A Intensity;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;103;-4062.197,1009.924;Inherit;True;Property;_MetalMatcap;Metal Matcap;12;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;926;-4708.261,-870.7552;Inherit;False;924;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-4772.261,-1030.755;Inherit;False;Property;_SpecularSize;Specular Size;32;0;Create;True;0;0;False;0;-0.15;-0.15;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1692;-2483.914,1114.913;Inherit;False;1688;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-2933.939,-319.283;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1708;-2936.746,-435.8792;Inherit;False;1688;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1690;-2494.914,1227.912;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1461;-2836.696,145.6849;Inherit;True;Property;_GlowMask;Glow Mask;11;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;b5f95137f8572da49a151061f4620224;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2016;-3615.629,-477.5756;Inherit;False;Shading System;-1;;863;1670eb1c79b726744983c09eed1d95d8;0;21;163;FLOAT;0;False;86;FLOAT;0;False;87;FLOAT;0;False;91;COLOR;0,0,0,0;False;159;FLOAT;0;False;92;FLOAT;0;False;35;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;48;FLOAT;0;False;37;FLOAT;0;False;38;FLOAT;0;False;39;FLOAT;0;False;41;FLOAT4;0,0,0,0;False;42;COLOR;0,0,0,0;False;43;COLOR;0,0,0,0;False;105;FLOAT;0;False;97;FLOAT;0;False;111;COLOR;0,0,0,0;False;106;FLOAT;0;False;112;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1528;-2696.588,415.5968;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-3725.19,1183.622;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-3729.896,1016.023;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1676;-2490.952,792.5399;Inherit;False;1656;ILMColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1783;-2249.917,-615.7203;Inherit;False;731.8361;419.9959;;5;1670;1663;1665;1664;1661;ILM Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1674;-2489.532,885.0188;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1710;-2954.417,-570.1951;Inherit;False;1686;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-3669.282,916.725;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-3565.997,1086.024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1707;-2728.36,-377.4365;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1694;-2284.914,1313.913;Inherit;False;Property;_DetailEmissiveIntensity;Detail Emissive Intensity;64;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1527;-2387.924,129.5379;Inherit;False;Property;_GlowMaskMultSystem;Glow Mask Mult System;58;1;[Enum];Create;True;2;Mask Color;0;Base Color Lerped from Mask;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1529;-2403.665,363.4089;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1689;-2197.914,1168.913;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1458;-2086.131,555.507;Inherit;False;Property;_GlowMaskTint;Glow Mask Tint;55;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareEqual;1533;-2066.207,266.4449;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1456;-2081.93,460.9078;Inherit;False;Property;_GlowMaskIntensity;Glow Mask Intensity;54;0;Create;True;0;0;False;0;1;0.36;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1768;-6926.15,-2155.982;Inherit;False;1130.771;939.9232;;9;1755;1245;1227;1259;1255;1258;1214;1218;1758;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1462;-2060.123,739.9843;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1693;-1938.913,1223.912;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1698;-1994.812,1123.307;Inherit;False;Property;_EnableDetailEmission;Enable Detail Emission;65;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1665;-2194.768,-444.8345;Inherit;False;1656;ILMColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1675;-2201.052,844.9407;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1677;-2261.851,986.9398;Inherit;False;Property;_ILMEmissiveIntensity;ILM Emissive Intensity;62;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1664;-2199.917,-317.735;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareLower;1712;-2557.312,-531.3476;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1231;-1444.228,-1699.715;Inherit;False;ILM;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-3399.995,1033.624;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1785;-1493.567,-656.7839;Inherit;False;591.438;303;;3;1704;521;1705;Enable Matcap;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1661;-2149.376,-565.7203;Inherit;False;1655;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1245;-6811.505,-1660.021;Inherit;False;Property;_ILMChannel;ILM Channel;48;1;[Enum];Create;True;4;Red   Specular Intensity;0;Green   Shading Occlusion;1;Blue   Specular Mask;2;Alpha   Diffuse Mult for body lines;3;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1758;-6816,-2000;Inherit;False;Property;_DebugGroup;Debug Group;7;1;[Enum];Create;True;3;Vertex Colors;0;ILM Channels;1;Base and SSS Alpha;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1678;-1953.951,909.4398;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1755;-6843.505,-1740.021;Inherit;False;Property;_VertexChannel;Vertex Channel;46;1;[Enum];Create;True;5;All Channels;0;Red   Occlusion Shading;1;Green   Scales the Outline based on Camera distance to vertex;2;Blue   Shift the Outline away from the Camera in the ZDepth direction;3;Alpha   Outline Base Thickness;4;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1258;-6827.505,-1340.021;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1697;-1709.812,1127.307;Inherit;False;1686;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1700;-1903.435,818.1229;Inherit;False;Property;_EnableILMEmission;Enable ILM Emission;66;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1702;-1649.198,423.5128;Inherit;False;Property;_EnableGlowmask;Enable Glowmask;67;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1663;-1947.04,-351.7242;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1218;-6848,-1920;Inherit;False;Property;_DebugColor;Debug Color;47;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1255;-6843.505,-1420.021;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1699;-1674.812,1201.306;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-3246.866,1034.442;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1227;-6827.505,-1580.021;Inherit;False;1231;ILM;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1259;-6875.505,-1500.021;Inherit;False;Property;_BaseSSSAlphaSwap;Base SSS Alpha Swap;49;1;[Enum];Create;True;2;Base Alpha   Highlight Fresnel Scale;0;SSS Alpha   Shadow Fresnel Scale;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1455;-1744.128,518.5138;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1961;-6407.913,-1803.873;Inherit;False;Debug;-1;;864;6f93fc90e278e9a449a8e28c4cbb4ee4;0;8;48;FLOAT;0;False;59;COLOR;0,0,0,0;False;47;FLOAT;0;False;50;FLOAT;0;False;54;COLOR;0,0,0,0;False;57;FLOAT;0;False;55;FLOAT;0;False;56;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-1443.567,-530.0103;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareLower;1670;-1753.083,-497.1063;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1696;-1431.912,1154.913;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1680;-1411.578,838.1898;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1704;-1419.129,-606.7839;Inherit;False;Property;_EnableMatcap;EnableMatcap;68;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1092;-606.2374,-50.83687;Inherit;False;1444.359;1207.485;;15;1958;1518;1085;1082;1517;1089;1466;1171;1882;1161;1087;1943;1965;1966;1970;Outline;0.9075414,0.5613208,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1703;-1427.198,519.5128;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-5617.575,-3024.082;Inherit;False;LightColorOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1786;-820.6483,-662.3871;Inherit;False;462.5835;290.3257;;2;515;513;Apply Light Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1085;-512,816;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;52;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1882;-512,320;Inherit;False;Property;_CameraDistanceMult;Camera Distance Mult;0;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1679;-1151.763,804.901;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1958;-480,480;Inherit;False;Property;_DepthCalculation;Depth Calculation;15;1;[Enum];Create;True;2;Linear;0;Square;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1518;-480,1056;Inherit;False;457;LightColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-774.957,-588.7665;Inherit;False;457;LightColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1087;-480,80;Inherit;False;Property;_EnableOutline;Enable Outline;50;1;[Toggle];Create;True;2;Disable;0;Yes I am lazy and want ugly outlines;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1705;-1137.129,-532.7839;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1264;-277.4289,-604.8836;Inherit;False;571.0603;277.1415;Debug System Toggle;2;1175;1209;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1161;-496,160;Inherit;False;Property;_OutlineThickness;Outline Thickness;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1517;-512,976;Inherit;False;Property;_EnableLightColorMult;Enable Light Color Mult;51;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1214;-6072.779,-1808.42;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1466;-512,736;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;56;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1089;-448,896;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1943;-448,400;Inherit;False;Property;_DepthOffset;Depth Offset;86;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1082;-480,560;Inherit;False;Property;_OutlineColor;Outline Color;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1171;-560,240;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;53;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-537.8973,-541.1583;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1454;-996.9287,791.7059;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1970;-71.2798,361.1895;Inherit;False;ASWOutline;-1;;865;ea9f2d47913480c4f9e91454af7efa45;0;11;33;FLOAT;0;False;32;FLOAT;0;False;47;FLOAT;0;False;76;FLOAT;0;False;107;FLOAT;0;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;40;FLOAT;0;False;98;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT3;109
Node;AmplifyShaderEditor.GetLocalVarNode;1209;-227.429,-442.3427;Inherit;False;1214;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;246;334.7231,-828.4818;Inherit;False;554.1174;504.4;;2;0;1459;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;1966;299.9233,307.2884;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-4772.261,-950.7552;Inherit;False;Property;_SpecularFuzzy;Specular Fuzzy;33;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1116;-6800,-2576;Inherit;False;Property;_ViewDirOffsetX;View Dir Offset X;42;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1682;-1716.434,720.3392;Inherit;False;1655;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1459;378.3992,-739.9838;Inherit;False;1454;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1973;46.66198,-734.6013;Inherit;False;myVarName;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1972;301.2159,-622.4536;Inherit;False;1973;myVarName;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1175;29.63205,-554.8836;Inherit;False;Property;_ALPHATEST;Enable Debug;45;0;Create;False;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;1965;378.1976,319.6412;Inherit;False;2;True;Masked;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1963;943.7737,-822.5781;Inherit;False;Property;_EditorVersion;Editor Version;89;1;[Enum];Create;True;2;Basic;0;Advanced;1;0;True;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;624.8439,-778.4818;Float;False;True;-1;6;ASWShaderGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light v6.10.0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;0;0;False;1;RenderType=Opaque;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1656;0;1631;0
WireConnection;118;0;113;4
WireConnection;1956;52;1954;0
WireConnection;1956;1;182;0
WireConnection;1956;16;1899;0
WireConnection;1956;17;1900;0
WireConnection;1956;13;1897;0
WireConnection;1956;31;1907;0
WireConnection;1956;32;1909;0
WireConnection;1956;30;1908;0
WireConnection;1956;36;1911;0
WireConnection;1956;38;1912;0
WireConnection;1956;37;1913;0
WireConnection;1956;40;1914;0
WireConnection;1956;42;1915;0
WireConnection;1956;41;1916;0
WireConnection;1956;44;1917;0
WireConnection;1956;46;1918;0
WireConnection;1956;45;1919;0
WireConnection;1952;1;182;0
WireConnection;1952;0;1956;0
WireConnection;1655;0;1639;0
WireConnection;1669;0;512;0
WireConnection;1669;1;1952;0
WireConnection;1658;0;1659;0
WireConnection;1658;1;1952;0
WireConnection;1658;2;512;0
WireConnection;1688;0;1687;0
WireConnection;215;1;216;0
WireConnection;1654;0;1657;0
WireConnection;1654;2;1658;0
WireConnection;1654;3;1669;0
WireConnection;1686;0;1685;0
WireConnection;1728;0;1654;0
WireConnection;1728;1;215;0
WireConnection;1724;0;1725;0
WireConnection;1724;1;1654;0
WireConnection;1724;2;215;0
WireConnection;517;0;518;0
WireConnection;517;1;152;0
WireConnection;1729;0;517;0
WireConnection;1722;0;1723;0
WireConnection;1722;2;1724;0
WireConnection;1722;3;1728;0
WireConnection;2005;0;113;0
WireConnection;449;0;1729;0
WireConnection;449;1;1722;0
WireConnection;987;0;152;4
WireConnection;850;0;182;4
WireConnection;447;0;543;0
WireConnection;447;1;517;0
WireConnection;447;2;449;0
WireConnection;183;0;1722;0
WireConnection;2006;0;2005;0
WireConnection;440;0;517;0
WireConnection;360;0;2006;1
WireConnection;98;0;97;0
WireConnection;448;0;447;0
WireConnection;1753;60;578;0
WireConnection;1753;62;1340;0
WireConnection;1753;67;685;0
WireConnection;1753;68;1706;0
WireConnection;1753;69;604;0
WireConnection;1753;70;701;0
WireConnection;1753;71;553;0
WireConnection;1753;72;1427;0
WireConnection;1753;73;1429;0
WireConnection;1753;74;1378;0
WireConnection;548;0;547;0
WireConnection;548;1;546;0
WireConnection;555;0;1753;57
WireConnection;659;0;657;0
WireConnection;659;1;658;0
WireConnection;117;0;2006;2
WireConnection;100;0;98;0
WireConnection;921;0;658;0
WireConnection;921;1;659;0
WireConnection;101;1;100;0
WireConnection;871;0;449;0
WireConnection;871;1;870;0
WireConnection;2039;159;2033;0
WireConnection;2039;166;2034;0
WireConnection;2039;126;1508;0
WireConnection;2039;46;1016;0
WireConnection;2039;71;1057;0
WireConnection;2039;42;947;0
WireConnection;2039;41;217;0
WireConnection;2039;38;1750;0
WireConnection;2039;39;975;0
WireConnection;2039;99;1683;0
WireConnection;2039;100;1122;0
WireConnection;2039;157;1629;0
WireConnection;2039;121;1513;0
WireConnection;1393;0;859;0
WireConnection;1393;1;1392;0
WireConnection;944;0;546;0
WireConnection;944;1;548;0
WireConnection;538;0;1753;59
WireConnection;2031;3;482;0
WireConnection;2031;4;490;0
WireConnection;2031;58;501;0
WireConnection;2031;59;508;0
WireConnection;2031;1;477;0
WireConnection;2031;2;483;0
WireConnection;2031;34;790;0
WireConnection;1380;0;1378;0
WireConnection;1381;0;944;0
WireConnection;102;1;101;0
WireConnection;1376;0;1393;0
WireConnection;924;0;921;0
WireConnection;451;0;871;0
WireConnection;119;0;2006;0
WireConnection;14;0;2039;2
WireConnection;443;0;215;0
WireConnection;1320;0;2031;35
WireConnection;1321;0;2031;0
WireConnection;103;1;102;0
WireConnection;2016;163;635;0
WireConnection;2016;86;625;0
WireConnection;2016;91;926;0
WireConnection;2016;159;918;0
WireConnection;2016;92;1290;0
WireConnection;2016;35;460;0
WireConnection;2016;49;834;0
WireConnection;2016;50;467;0
WireConnection;2016;48;832;0
WireConnection;2016;37;734;0
WireConnection;2016;38;1321;0
WireConnection;2016;39;1320;0
WireConnection;2016;41;455;0
WireConnection;2016;42;463;0
WireConnection;2016;43;465;0
WireConnection;2016;105;1385;0
WireConnection;2016;97;1263;0
WireConnection;2016;111;848;0
WireConnection;2016;106;1396;0
WireConnection;2016;112;1395;0
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;1707;0;1708;0
WireConnection;1707;1;2016;0
WireConnection;1707;2;514;0
WireConnection;1529;1;1528;0
WireConnection;1529;2;1461;0
WireConnection;1689;0;1692;0
WireConnection;1689;2;1690;0
WireConnection;1533;0;1527;0
WireConnection;1533;2;1461;0
WireConnection;1533;3;1529;0
WireConnection;1693;0;1689;0
WireConnection;1693;1;1694;0
WireConnection;1675;0;1676;0
WireConnection;1675;2;1674;0
WireConnection;1712;0;1710;0
WireConnection;1712;2;2016;0
WireConnection;1712;3;1707;0
WireConnection;1231;0;2005;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;1678;0;1675;0
WireConnection;1678;1;1677;0
WireConnection;1663;0;1665;0
WireConnection;1663;1;1712;0
WireConnection;1663;2;1664;0
WireConnection;1699;0;1698;0
WireConnection;1699;1;1693;0
WireConnection;111;0;110;0
WireConnection;1455;0;1533;0
WireConnection;1455;1;1456;0
WireConnection;1455;2;1458;0
WireConnection;1455;3;1462;0
WireConnection;1961;48;1758;0
WireConnection;1961;59;1218;0
WireConnection;1961;47;1755;0
WireConnection;1961;50;1245;0
WireConnection;1961;54;1227;0
WireConnection;1961;57;1259;0
WireConnection;1961;55;1255;0
WireConnection;1961;56;1258;0
WireConnection;1670;0;1661;0
WireConnection;1670;2;1712;0
WireConnection;1670;3;1663;0
WireConnection;1696;0;1697;0
WireConnection;1696;2;1699;0
WireConnection;1680;0;1700;0
WireConnection;1680;2;1678;0
WireConnection;1703;0;1702;0
WireConnection;1703;1;1455;0
WireConnection;457;0;2039;1
WireConnection;1679;0;1703;0
WireConnection;1679;1;1680;0
WireConnection;1679;2;1696;0
WireConnection;1705;0;1704;0
WireConnection;1705;2;521;0
WireConnection;1705;3;1670;0
WireConnection;1214;0;1961;0
WireConnection;513;0;515;0
WireConnection;513;1;1705;0
WireConnection;1454;0;1679;0
WireConnection;1970;33;1161;0
WireConnection;1970;32;1171;0
WireConnection;1970;47;1882;0
WireConnection;1970;76;1943;0
WireConnection;1970;107;1958;0
WireConnection;1970;35;1082;0
WireConnection;1970;37;1466;0
WireConnection;1970;36;1085;0
WireConnection;1970;31;1089;0
WireConnection;1970;40;1517;0
WireConnection;1970;98;1518;0
WireConnection;1966;0;1087;0
WireConnection;1175;1;513;0
WireConnection;1175;0;1209;0
WireConnection;1965;0;1970;0
WireConnection;1965;2;1966;0
WireConnection;1965;1;1970;109
WireConnection;0;2;1459;0
WireConnection;0;13;1175;0
WireConnection;0;11;1965;0
ASEEND*/
//CHKSM=5FE243DDBCBCF4ABF1DA565A7CCD54A32519215B
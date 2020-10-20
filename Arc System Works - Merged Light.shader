// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light v6.8.0"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_CameraDistanceMult("Camera Distance Mult", Float) = 1
		[Enum(Automatic,0,Forced Fake,1)]_LightColor("Light Color", Float) = 0
		[Enum(Automatic,0,Forced Fake,1)]_LightDirection("Light Direction", Float) = 0
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
		_FakeLightIntensity("Fake Light Intensity", Range( 0 , 1)) = 1
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_FakeLightDirY("Fake Light Dir Y", Float) = -135
		_ShadowBrightness("Shadow Brightness", Range( 0 , 2)) = 1
		_ShadowLayer1Push("Shadow Layer 1 Push", Range( -1 , 1)) = 0
		_ShadowLayer1Gate("Shadow Layer 1 Gate", Range( 0 , 1)) = 1
		_ShadowLayer1Fuzziness("Shadow Layer 1 Fuzziness", Range( 0 , 10)) = 0
		_ShadowLayer1Intensity("Shadow Layer 1 Intensity", Range( 0 , 5)) = 1
		_ShadowLayer2Push("Shadow Layer 2 Push", Range( -1 , 1)) = -0.3
		_ShadowLayer2Gate("Shadow Layer 2 Gate", Range( 0 , 1)) = 0.91
		_ShadowLayer2Fuzziness("Shadow Layer 2 Fuzziness", Range( 0 , 10)) = 0
		_ShadowLayer2Intensity("Shadow Layer 2 Intensity", Range( 0 , 5)) = 1
		_ILMLayer1("ILM Layer 1", Range( 0 , 1)) = 0.6
		_ILMLayer2("ILM Layer 2", Range( 0 , 1)) = 0.3
		_VertexLayer1("Vertex Layer 1", Range( 0 , 1)) = 0.31
		_SpecularIntensity("Specular Intensity", Float) = 1
		_VertexLayer2("Vertex Layer 2", Range( 0 , 1)) = 0.51
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.46
		_SpecularFuzzy("Specular Fuzzy", Range( 0 , 10)) = 0
		[Enum(FighterZ  Guilty Gear Xrd,0,Granblue,1,Strive WIP,2)]_FresnelSystem("Fresnel System", Float) = 0
		_HighlightPower("Highlight Power", Float) = 5
		_HighlightFreselFuzzy("Highlight Fresel Fuzzy", Float) = 0.01
		_HighlightIntensity("Highlight Intensity", Float) = 1
		_HighlightScale("Highlight Scale", Float) = 1
		_DarkHighlightMult("Dark Highlight Mult", Color) = (0.2392157,0.2392157,0.5294118,0)
		_GranblueDarkenPower("Granblue Darken Power", Float) = 1
		_GranblueDarkenScale("Granblue Darken Scale", Float) = 1
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		_ViewDirOffsetY("View Dir Offset Y", Float) = 0
		_ViewDirOffsetZ("View Dir Offset Z", Float) = 0
		[Toggle(_ALPHATEST_ON)] _ALPHATEST("Enable Debug", Float) = 0
		[Enum(All Channels,0,Red   Occlusion Shading,1,Green   Outline Camera Scale Mult,2,Blue   Outline Thickness base value,3,Alpha   Outline Thickness Coefficient,4)]_VertexChannel("Vertex Channel", Float) = 0
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
			float4 appendResult231 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 VertexColors441 = (( _WrongVertexColors > 0.0 ) ? appendResult231 :  v.color );
			float4 break8_g765 = VertexColors441;
			float temp_output_23_0_g765 = ( 2.5E-05 * _OutlineThickness * break8_g765.b * break8_g765.a );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float outlineVar = (( _EnableCameraDistanceMult == 0.0 ) ? temp_output_23_0_g765 :  ( temp_output_23_0_g765 + ( 2.5E-05 * break8_g765.g * break8_g765.a * _CameraDistanceMult * distance( ase_worldPos , _WorldSpaceCameraPos ) ) ) );
			v.vertex.xyz += ( v.normal * outlineVar );
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
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMA118 = tex2DNode113.a;
			float4 lerpResult1658 = lerp( ILMColor1656 , tex2DNode182 , ILMA118);
			float4 temp_output_1654_0 = (( ILMColorSetting1655 == 1.0 ) ? lerpResult1658 :  ( ILMA118 * tex2DNode182 ) );
			float4 tex2DNode215 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 lerpResult1724 = lerp( DetailColor1688 , temp_output_1654_0 , tex2DNode215);
			float4 temp_output_1722_0 = (( DetailColorSetting1686 == 1.0 ) ? lerpResult1724 :  ( temp_output_1654_0 * tex2DNode215 ) );
			float4 Base183 = temp_output_1722_0;
			float4 temp_output_13_0_g765 = max( float4( 0,0,0,0 ) , ( 0.2 * Base183 ) );
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
			float clampResult128_g746 = clamp( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) , 0.0 , 1.0 );
			float4 temp_cast_3 = (_GlobalIntensityMinimum).xxxx;
			float4 clampResult123_g746 = clamp( (( (( _LightColor > 0.0 ) ? 0.0 :  clampResult128_g746 ) > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) ) , temp_cast_3 , float4( 1,1,1,1 ) );
			float4 LightColorOut457 = clampResult123_g746;
			o.Emission = ( ( (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_13_0_g765 * temp_output_13_0_g765 ) :  _OutlineColor ) * _OutlineColorIntensity ) * (( _EnableLightColorMult > 0.0 ) ? LightColorOut457 :  float4( 1,1,1,0 ) ) ).rgb;
			clip( (( _EnableOutline > 0.0 ) ? 1.0 :  0.0 ) - _Cutoff );
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature _ALPHATEST_ON
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
			float3 worldNormal;
			float3 worldPos;
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

		uniform float _EnableGlowmask;
		uniform float _GlowMaskMultSystem;
		uniform sampler2D _GlowMask;
		uniform float _DetailColorSetting;
		uniform float4 _DetailColor;
		uniform float _ILMColorSetting;
		uniform float4 _ILMColor;
		uniform sampler2D _Base;
		uniform sampler2D _ILM;
		uniform sampler2D _Detail;
		uniform float _GlowMaskIntensity;
		uniform float4 _GlowMaskTint;
		uniform float _EnableILMEmission;
		uniform float _ILMEmissiveIntensity;
		uniform float _EnableDetailEmission;
		uniform float _DetailEmissiveIntensity;
		uniform float _EnableMatcap;
		uniform float _MetalAIntensity;
		uniform sampler2D _MetalMatcap;
		uniform float _MetalBIntensity;
		uniform float _LightColor;
		uniform float4 _FakeLightColor;
		uniform float _FakeLightIntensity;
		uniform float _GlobalIntensityMinimum;
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
		uniform float _WrongVertexColors;
		uniform float _LightDirection;
		uniform float _FakeLightFallbackDirection;
		uniform float _ViewDirOffsetY;
		uniform float _ViewDirOffsetZ;
		uniform float _FakeLightDirX;
		uniform float _FakeLightDirY;
		uniform float _ShadowLayer1Push;
		uniform float _ShadowLayer1Gate;
		uniform float _ILMLayer1;
		uniform float _VertexLayer1;
		uniform float _ShadowLayer2Fuzziness;
		uniform float _ShadowLayer2Push;
		uniform float _ShadowLayer2Gate;
		uniform float _ILMLayer2;
		uniform float _VertexLayer2;
		uniform float _SpecularIntensity;
		uniform float _SpecularFuzzy;
		uniform float _SpecularSize;
		uniform float _DebugGroup;
		uniform float _VertexChannel;
		uniform float4 _DebugColor;
		uniform float _ILMChannel;
		uniform float _BaseSSSAlphaSwap;
		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _CameraDistanceMult;
		uniform float _EnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;
		uniform float _EnableLightColorMult;
		uniform float _EnableOutline;
		uniform float _Cutoff = 0.5;


		float3 StereoCameraViewDirection10_g739( float3 worldPos )
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
			#else
			float3 cameraPos = _WorldSpaceCameraPos;
			#endif
			float3 worldViewDir = normalize((cameraPos - worldPos));
			return worldViewDir;
		}


		float3 StereoCameraViewDirection152_g746( float3 worldPos )
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
			float DetailColorSetting1686 = _DetailColorSetting;
			float4 DetailColor1688 = _DetailColor;
			float ILMColorSetting1655 = _ILMColorSetting;
			float4 ILMColor1656 = _ILMColor;
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMA118 = tex2DNode113.a;
			float4 lerpResult1658 = lerp( ILMColor1656 , tex2DNode182 , ILMA118);
			float4 temp_output_1654_0 = (( ILMColorSetting1655 == 1.0 ) ? lerpResult1658 :  ( ILMA118 * tex2DNode182 ) );
			float4 tex2DNode215 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 lerpResult1724 = lerp( DetailColor1688 , temp_output_1654_0 , tex2DNode215);
			float4 temp_output_1722_0 = (( DetailColorSetting1686 == 1.0 ) ? lerpResult1724 :  ( temp_output_1654_0 * tex2DNode215 ) );
			float4 Base183 = temp_output_1722_0;
			float3 ase_worldNormal = i.worldNormal;
			float3 worldToViewDir98 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode103 = tex2D( _MetalMatcap, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir98).xy ) ) );
			float4 MetalMatCap111 = ( Base183 * ( ( _MetalAIntensity * tex2DNode103.r ) + ( tex2DNode103.b * _MetalBIntensity ) ) );
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
			float clampResult128_g746 = clamp( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) , 0.0 , 1.0 );
			float4 temp_cast_4 = (_GlobalIntensityMinimum).xxxx;
			float4 clampResult123_g746 = clamp( (( (( _LightColor > 0.0 ) ? 0.0 :  clampResult128_g746 ) > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) ) , temp_cast_4 , float4( 1,1,1,1 ) );
			float4 LightColorOut457 = clampResult123_g746;
			float FresnelSystem1380 = _FresnelSystem;
			float2 uv_SSS152 = i.uv_texcoord;
			float4 tex2DNode152 = tex2D( _SSS, uv_SSS152 );
			float4 temp_output_517_0 = ( _ShadowBrightness * tex2DNode152 );
			float4 temp_output_449_0 = ( temp_output_517_0 * temp_output_1722_0 );
			float4 SSS2448 = ( _ShadowLayer2Intensity * temp_output_517_0 * temp_output_449_0 );
			float4 temp_output_43_0_g750 = SSS2448;
			float4 DarkHighlightColor1376 = ( _DarkHighlightMult + SSS2448 );
			float temp_output_67_0_g739 = _HighlightIntensity;
			float temp_output_68_0_g739 = _EnableFresnel;
			float3 worldPos10_g739 = ase_worldPos;
			float3 localStereoCameraViewDirection10_g739 = StereoCameraViewDirection10_g739( worldPos10_g739 );
			float temp_output_70_0_g739 = _HighlightScale;
			float SSSAlpha987 = tex2DNode152.a;
			float temp_output_62_0_g739 = SSSAlpha987;
			float temp_output_71_0_g739 = _HighlightPower;
			float fresnelNdotV19_g739 = dot( ase_worldNormal, localStereoCameraViewDirection10_g739 );
			float fresnelNode19_g739 = ( -0.180914 + ( temp_output_70_0_g739 * temp_output_62_0_g739 ) * pow( 1.0 - fresnelNdotV19_g739, temp_output_71_0_g739 ) );
			float temp_output_69_0_g739 = _HighlightFreselFuzzy;
			float clampResult34_g739 = clamp( ( temp_output_68_0_g739 * pow( saturate( fresnelNode19_g739 ) , temp_output_69_0_g739 ) ) , 0.0 , 1.0 );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float fresnelNdotV21_g739 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode21_g739 = ( 0.0 + ( temp_output_62_0_g739 * _GranblueDarkenScale ) * pow( 1.0 - fresnelNdotV21_g739, _GranblueDarkenPower ) );
			float clampResult27_g739 = clamp( saturate( fresnelNode21_g739 ) , 0.0 , 1.0 );
			float DarkenHighlight538 = (( _FresnelSystem == 0.0 ) ? ( temp_output_67_0_g739 * clampResult34_g739 * temp_output_62_0_g739 ) :  (( temp_output_68_0_g739 == 0.0 ) ? 1.0 :  ( 1.0 - clampResult27_g739 ) ) );
			float temp_output_106_0_g750 = DarkenHighlight538;
			float4 lerpResult122_g750 = lerp( temp_output_43_0_g750 , DarkHighlightColor1376 , temp_output_106_0_g750);
			float4 BaseSSS451 = ( temp_output_449_0 * _ShadowLayer1Intensity );
			float4 temp_output_42_0_g750 = BaseSSS451;
			float4 temp_output_41_0_g750 = Base183;
			float4 SSS440 = temp_output_517_0;
			float4 blendOpSrc548 = Base183;
			float4 blendOpDest548 = SSS440;
			float4 HighlightColor1381 = ( Base183 + ( Base183 + ( saturate( (( blendOpSrc548 > 0.5 ) ? max( blendOpDest548, 2.0 * ( blendOpSrc548 - 0.5 ) ) : min( blendOpDest548, 2.0 * blendOpSrc548 ) ) )) ) );
			float4 temp_output_111_0_g750 = HighlightColor1381;
			float BaseAlpha850 = tex2DNode182.a;
			float temp_output_60_0_g739 = BaseAlpha850;
			float fresnelNdotV13_g739 = dot( ase_worldNormal, localStereoCameraViewDirection10_g739 );
			float fresnelNode13_g739 = ( -0.180914 + ( temp_output_60_0_g739 * temp_output_70_0_g739 ) * pow( 1.0 - fresnelNdotV13_g739, temp_output_71_0_g739 ) );
			float clampResult31_g739 = clamp( ( pow( saturate( fresnelNode13_g739 ) , temp_output_69_0_g739 ) * temp_output_68_0_g739 ) , 0.0 , 1.0 );
			float Highlight555 = ( temp_output_60_0_g739 * clampResult31_g739 * temp_output_67_0_g739 );
			float temp_output_97_0_g750 = Highlight555;
			float4 lerpResult110_g750 = lerp( temp_output_41_0_g750 , temp_output_111_0_g750 , temp_output_97_0_g750);
			float4 appendResult231 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 VertexColors441 = (( _WrongVertexColors > 0.0 ) ? appendResult231 :  i.vertexColor );
			float temp_output_191_0_g747 = radians( _ViewDirOffsetY );
			float cosY208_g747 = cos( temp_output_191_0_g747 );
			float temp_output_212_0_g747 = radians( _ViewDirOffsetZ );
			float cosZ214_g747 = cos( temp_output_212_0_g747 );
			float temp_output_192_0_g747 = radians( 0.0 );
			float cosX204_g747 = cos( temp_output_192_0_g747 );
			float sinZ213_g747 = sin( temp_output_212_0_g747 );
			float sinX201_g747 = sin( temp_output_192_0_g747 );
			float sinY207_g747 = sin( temp_output_191_0_g747 );
			float4 appendResult223_g747 = (float4(( cosY208_g747 * cosZ214_g747 ) , ( ( cosX204_g747 * sinZ213_g747 ) + ( sinX201_g747 * sinY207_g747 * cosZ214_g747 ) ) , ( ( sinX201_g747 * sinZ213_g747 ) - ( cosX204_g747 * sinY207_g747 * cosZ214_g747 ) ) , 0.0));
			float4 xAxis249_g747 = appendResult223_g747;
			float3 worldPos152_g746 = ase_worldPos;
			float3 localStereoCameraViewDirection152_g746 = StereoCameraViewDirection152_g746( worldPos152_g746 );
			float4 break195_g747 = float4( localStereoCameraViewDirection152_g746 , 0.0 );
			float4 temp_output_282_0_g747 = ( xAxis249_g747 * break195_g747.x );
			float4 appendResult224_g747 = (float4(( -cosY208_g747 * sinZ213_g747 ) , ( ( cosX204_g747 * cosZ214_g747 ) - ( sinX201_g747 * sinY207_g747 * sinZ213_g747 ) ) , ( ( sinX201_g747 * cosZ214_g747 ) + ( cosX204_g747 * sinY207_g747 * sinZ213_g747 ) ) , 0.0));
			float4 yAxis266_g747 = appendResult224_g747;
			float4 temp_output_285_0_g747 = ( yAxis266_g747 * break195_g747.y );
			float4 appendResult226_g747 = (float4(sinY207_g747 , ( -sinX201_g747 * cosY208_g747 ) , ( cosX204_g747 * cosY208_g747 ) , 0.0));
			float4 zAxis277_g747 = appendResult226_g747;
			float4 temp_output_287_0_g747 = ( zAxis277_g747 * break195_g747.z );
			float4 appendResult278_g747 = (float4(0.0 , 0.0 , 0.0 , 1.0));
			float4 wAxis279_g747 = appendResult278_g747;
			float4 temp_output_289_0_g747 = ( wAxis279_g747 * break195_g747.w );
			float4 normalizeResult291_g747 = normalize( ( temp_output_282_0_g747 + temp_output_285_0_g747 + temp_output_287_0_g747 + temp_output_289_0_g747 ) );
			float3 appendResult15_g748 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
			float3 normalizeResult2_g748 = normalize( appendResult15_g748 );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult28_g746 = dot( (( (( _LightDirection > 0.0 ) ? 0.0 :  clampResult128_g746 ) > 0.0 ) ? float4( ase_worldlightDir , 0.0 ) :  (( _FakeLightFallbackDirection > 0.0 ) ? normalizeResult291_g747 :  float4( normalizeResult2_g748 , 0.0 ) ) ) , float4( ase_normWorldNormal , 0.0 ) );
			float DefaultDot14 = dotResult28_g746;
			float temp_output_37_0_g750 = DefaultDot14;
			float temp_output_40_0_g750 = SSSAlpha987;
			float ifLocalVar5_g751 = 0;
			if( temp_output_40_0_g750 >= ( 1.0 - _ShadowLayer1Gate ) )
				ifLocalVar5_g751 = 1.0;
			float lerpResult8_g751 = lerp( 1.0 , ( ( -1.0 + VertexColors441.x + temp_output_37_0_g750 ) - _ShadowLayer1Push ) , ifLocalVar5_g751);
			float ILMG360 = tex2DNode113.g;
			float temp_output_1_0_g749 = ILMG360;
			float temp_output_20_0_g749 = ( 1.0 - ( 0.62 * temp_output_1_0_g749 ) );
			float ILMB117 = tex2DNode113.b;
			float4 color12_g749 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 temp_cast_12 = (Highlight555).xxxx;
			float4 temp_output_34_0_g749 = temp_cast_12;
			float4 temp_output_22_0_g749 = ( ( ILMB117 * 0.4 ) + ( color12_g749 + temp_output_34_0_g749 ) );
			float4 ifLocalVar24_g749 = 0;
			if( ( ( ( 1.0 - _ILMLayer1 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g749 )
				ifLocalVar24_g749 = temp_output_22_0_g749;
			float4 clampResult26_g749 = clamp( ifLocalVar24_g749 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_44_0_g749 = ( 1.0 - VertexColors441.x );
			float4 color39_g749 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_46_0_g749 = ( ( temp_output_1_0_g749 * 0.4 ) + ( temp_output_34_0_g749 + color39_g749 ) );
			float4 ifLocalVar49_g749 = 0;
			if( _VertexLayer1 >= temp_output_44_0_g749 )
				ifLocalVar49_g749 = temp_output_46_0_g749;
			float4 clampResult51_g749 = clamp( ifLocalVar49_g749 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_38_0_g750 = ( clampResult26_g749.r * clampResult51_g749.x );
			float smoothstepResult23_g750 = smoothstep( 0.0 , ( _ShadowLayer1Fuzziness * 0.01 ) , ( lerpResult8_g751 * temp_output_38_0_g750 ));
			float PrimaryDot127_g750 = smoothstepResult23_g750;
			float4 lerpResult26_g750 = lerp( temp_output_42_0_g750 , lerpResult110_g750 , PrimaryDot127_g750);
			float ifLocalVar5_g752 = 0;
			if( temp_output_40_0_g750 >= ( 1.0 - _ShadowLayer2Gate ) )
				ifLocalVar5_g752 = 1.0;
			float lerpResult8_g752 = lerp( 1.0 , ( temp_output_37_0_g750 - _ShadowLayer2Push ) , ifLocalVar5_g752);
			float4 ifLocalVar23_g749 = 0;
			if( ( ( ( 1.0 - _ILMLayer2 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g749 )
				ifLocalVar23_g749 = temp_output_22_0_g749;
			float4 clampResult25_g749 = clamp( ifLocalVar23_g749 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ifLocalVar50_g749 = 0;
			if( _VertexLayer2 >= temp_output_44_0_g749 )
				ifLocalVar50_g749 = temp_output_46_0_g749;
			float4 clampResult52_g749 = clamp( ifLocalVar50_g749 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float temp_output_39_0_g750 = ( clampResult25_g749.r * clampResult52_g749.x );
			float smoothstepResult25_g750 = smoothstep( 0.0 , ( _ShadowLayer2Fuzziness * 0.01 ) , ( lerpResult8_g752 * temp_output_39_0_g750 ));
			float SecondaryDot129_g750 = smoothstepResult25_g750;
			float4 lerpResult28_g750 = lerp( lerpResult122_g750 , lerpResult26_g750 , SecondaryDot129_g750);
			float4 blendOpSrc659 = Base183;
			float4 blendOpDest659 = SSS440;
			float ILMR119 = tex2DNode113.r;
			float4 SpecularColor924 = ( Base183 + ( _SpecularIntensity * ( Base183 + ( saturate( (( blendOpSrc659 > 0.5 ) ? max( blendOpDest659, 2.0 * ( blendOpSrc659 - 0.5 ) ) : min( blendOpDest659, 2.0 * blendOpSrc659 ) ) )) ) * ILMR119 ) );
			float4 temp_output_91_0_g750 = SpecularColor924;
			float smoothstepResult82_g750 = smoothstep( 0.0 , ( _SpecularFuzzy * 0.01 ) , ( ( ( 1.0 - ( ( _SpecularSize * 4.0 ) - 2.0 ) ) * -0.2 ) + ( ILMB117 * temp_output_37_0_g750 * temp_output_38_0_g750 * temp_output_39_0_g750 ) ));
			float TertiaryDot131_g750 = smoothstepResult82_g750;
			float4 lerpResult58_g750 = lerp( lerpResult28_g750 , temp_output_91_0_g750 , TertiaryDot131_g750);
			float4 lerpResult142_g750 = lerp( temp_output_42_0_g750 , temp_output_41_0_g750 , PrimaryDot127_g750);
			float4 lerpResult143_g750 = lerp( temp_output_43_0_g750 , lerpResult142_g750 , SecondaryDot129_g750);
			float4 lerpResult144_g750 = lerp( lerpResult143_g750 , temp_output_91_0_g750 , TertiaryDot131_g750);
			float4 lerpResult145_g750 = lerp( ( temp_output_106_0_g750 * lerpResult144_g750 ) , temp_output_111_0_g750 , ( temp_output_97_0_g750 * VertexColors441.x ));
			float4 clampResult33_g750 = clamp( (( FresnelSystem1380 == 0.0 ) ? lerpResult58_g750 :  lerpResult145_g750 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 temp_output_513_0 = ( LightColorOut457 * clampResult33_g750 );
			float4 Detail443 = tex2DNode215;
			float4 lerpResult1707 = lerp( DetailColor1688 , temp_output_513_0 , Detail443);
			float4 temp_output_1712_0 = (( DetailColorSetting1686 < 2.0 ) ? temp_output_513_0 :  lerpResult1707 );
			float4 lerpResult1663 = lerp( ILMColor1656 , temp_output_1712_0 , ILMA118);
			float temp_output_48_0_g753 = _DebugGroup;
			float temp_output_47_0_g753 = _VertexChannel;
			float4 temp_output_61_0_g753 = VertexColors441;
			float4 break62_g753 = temp_output_61_0_g753;
			float4 temp_output_59_0_g753 = _DebugColor;
			float temp_output_50_0_g753 = _ILMChannel;
			float4 ILM1231 = tex2DNode113;
			float4 break7_g753 = ILM1231;
			float temp_output_57_0_g753 = _BaseSSSAlphaSwap;
			float4 Debug1214 = (( temp_output_48_0_g753 == 0.0 ) ? (( temp_output_47_0_g753 == 0.0 ) ? temp_output_61_0_g753 :  (( temp_output_47_0_g753 == 1.0 ) ? ( break62_g753.r * temp_output_59_0_g753 ) :  (( temp_output_47_0_g753 == 2.0 ) ? ( break62_g753.g * temp_output_59_0_g753 ) :  (( temp_output_47_0_g753 == 3.0 ) ? ( break62_g753.b * temp_output_59_0_g753 ) :  (( temp_output_47_0_g753 == 4.0 ) ? ( break62_g753.a * temp_output_59_0_g753 ) :  float4( 0,0,0,0 ) ) ) ) ) ) :  (( temp_output_48_0_g753 == 1.0 ) ? (( temp_output_50_0_g753 == 0.0 ) ? ( break7_g753.r * temp_output_59_0_g753 ) :  (( temp_output_50_0_g753 == 1.0 ) ? ( break7_g753.g * temp_output_59_0_g753 ) :  (( temp_output_50_0_g753 == 2.0 ) ? ( break7_g753.b * temp_output_59_0_g753 ) :  (( temp_output_50_0_g753 == 3.0 ) ? ( break7_g753.a * temp_output_59_0_g753 ) :  float4( 0,0,0,0 ) ) ) ) ) :  (( temp_output_48_0_g753 == 2.0 ) ? (( temp_output_57_0_g753 == 0.0 ) ? ( BaseAlpha850 * temp_output_59_0_g753 ) :  (( temp_output_57_0_g753 == 1.0 ) ? ( SSSAlpha987 * temp_output_59_0_g753 ) :  float4( 0,0,0,0 ) ) ) :  float4( 0,0,0,0 ) ) ) );
			#ifdef _ALPHATEST_ON
				float4 staticSwitch1175 = Debug1214;
			#else
				float4 staticSwitch1175 = (( _EnableMatcap > 0.0 ) ? MetalMatCap111 :  (( ILMColorSetting1655 < 2.0 ) ? temp_output_1712_0 :  lerpResult1663 ) );
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
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMA118 = tex2DNode113.a;
			float4 lerpResult1658 = lerp( ILMColor1656 , tex2DNode182 , ILMA118);
			float4 temp_output_1654_0 = (( ILMColorSetting1655 == 1.0 ) ? lerpResult1658 :  ( ILMA118 * tex2DNode182 ) );
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
			#pragma target 3.0
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
2787;274;2201;1028;4914.159;-1358.985;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;516;-5159.689,-2321.539;Inherit;False;3064.604;1228.404;;34;448;451;871;447;444;870;543;449;987;938;112;440;183;517;518;152;850;182;512;1631;1656;1657;1654;1658;1659;1669;1687;1688;1722;1723;1725;1728;1724;1729;Color Information;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;112;-4076.43,-1621.316;Inherit;False;573.4785;505.9945;ILM Information;8;1655;1639;118;360;117;119;1231;113;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;113;-4052.032,-1498.583;Inherit;True;Property;_ILM;ILM;8;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;853ac78659dac774398d8bf23c6a1fca;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1631;-2637.353,-2208.845;Inherit;False;Property;_ILMColor;ILM Color;60;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1639;-3964.938,-1194.26;Inherit;False;Property;_ILMColorSetting;ILM Color Setting;61;1;[Enum];Create;True;3;Default Black;0;Shadow Priority;1;ILM Priority;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1656;-2362.781,-2201.064;Inherit;False;ILMColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-3718.232,-1272.364;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;444;-5135.906,-1541.948;Inherit;False;855.0317;397.3198;Detail;5;1685;1686;443;215;216;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;1687;-2635.289,-1994.141;Inherit;False;Property;_DetailColor;Detail Color;64;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;182;-5132.002,-1757.595;Inherit;True;Property;_Base;Base;6;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;d2da38049713df04cb2842b6ce906495;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1655;-3736.607,-1194.63;Inherit;False;ILMColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1659;-4778.619,-1888.526;Inherit;False;1656;ILMColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-4762.63,-1799.677;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1658;-4467.214,-1892.244;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-5085.906,-1475.912;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1657;-4484.021,-1989.043;Inherit;False;1655;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1688;-2395.289,-1990.141;Inherit;False;DetailColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1685;-4840.119,-1253.398;Inherit;False;Property;_DetailColorSetting;Detail Color Setting;62;1;[Enum];Create;True;3;Default;0;Shadow Priority;1;Detail Priority;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1669;-4457.494,-1757.807;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1725;-4166.629,-1965.009;Inherit;False;1688;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1686;-4542.429,-1251.973;Inherit;False;DetailColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;215;-4845.659,-1488.627;Inherit;True;Property;_Detail;Detail;10;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareEqual;1654;-4220.692,-1872.685;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1724;-3891.629,-1908.009;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1723;-3931.629,-2010.009;Inherit;False;1686;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;152;-5112.674,-2094.298;Inherit;True;Property;_SSS;SSS;9;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;3469f53e7d1befe49a63b70614962e6f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;518;-5027.414,-2187.151;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;18;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1728;-3885.629,-1770.009;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-4712.114,-2091.327;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1722;-3626.629,-1936.009;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-3412.709,-1992.016;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-4522.475,-2157.321;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;938;-3450.517,-1574.561;Inherit;False;1255.028;381.48;Specular Color;9;924;1306;928;921;635;918;659;657;658;;1,1,0,1;0;0
Node;AmplifyShaderEditor.WireNode;1729;-3209.291,-2017.835;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;304;-1336.599,-3266.74;Inherit;False;978.1387;333.6884;;5;441;231;142;1062;1067;Vertex Colors fix;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-3407.518,-1534.678;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;-4794.507,-1979.568;Inherit;False;SSSAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;142;-1285.693,-3133.779;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1754;-5175.667,1449.593;Inherit;False;2314.223;885;;24;1753;555;538;578;1340;685;1706;604;701;553;1427;1429;1378;1380;547;548;546;944;1387;1381;1392;859;1393;1376;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-3394.716,-1319.781;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-3472.906,-2227.453;Inherit;False;Property;_ShadowLayer2Intensity;Shadow Layer 2 Intensity;26;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;-4817.8,-1654.2;Inherit;False;BaseAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-3176.113,-1941.587;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1340;-3983.442,1579.593;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1429;-4031.442,2139.594;Inherit;False;Property;_GranblueDarkenPower;Granblue Darken Power;40;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-4015.442,1819.593;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;36;0;Create;True;0;0;False;0;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;546;-5125.667,1780.059;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;553;-3983.442,1979.594;Inherit;False;Property;_HighlightPower;Highlight Power;35;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-3983.442,1499.593;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;231;-1066.535,-3091.794;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-3967.442,1899.594;Inherit;False;Property;_HighlightScale;Highlight Scale;38;0;Create;True;0;0;False;0;1;0.31;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;659;-3162.575,-1356.311;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-5120.865,1896.956;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1062;-1236.92,-3226.946;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;42;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-3999.442,1659.593;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;37;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1427;-4031.442,2059.594;Inherit;False;Property;_GranblueDarkenScale;Granblue Darken Scale;41;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1378;-3983.442,2219.594;Inherit;False;Property;_FresnelSystem;Fresnel System;34;1;[Enum];Create;True;3;FighterZ  Guilty Gear Xrd;0;Granblue;1;Strive WIP;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-3720.569,-1502.974;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-3024.15,-2132.934;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1706;-3983.442,1739.593;Inherit;False;Property;_EnableFresnel;Enable Fresnel;70;1;[Toggle];Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;96;-5054.192,866.7242;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;0,1,0.1342869,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-3033.608,-1481.561;Inherit;False;Property;_SpecularIntensity;Specular Intensity;30;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1015;-5118.424,-3471.728;Inherit;False;1418.569;1059.632;;15;14;457;1683;1513;1750;975;1116;1122;1629;217;947;1016;1508;1057;1844;Automatic Light System;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-2861.779,-2129.506;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;97;-5004.193,1085.924;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;921;-2938.479,-1412.884;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;918;-2964.86,-1302.023;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1067;-877.9203,-3179.946;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;1753;-3567.442,1739.593;Inherit;False;Fresnel System;-1;;739;811554b0cdf882345bcf8f25bedebacd;0;10;60;FLOAT;0;False;62;FLOAT;0;False;67;FLOAT;0;False;68;FLOAT;0;False;69;FLOAT;0;False;70;FLOAT;0;False;71;FLOAT;0;False;72;FLOAT;0;False;73;FLOAT;0;False;74;FLOAT;0;False;2;FLOAT;57;FLOAT;59
Node;AmplifyShaderEditor.BlendOpsNode;548;-4880.729,1862.426;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-3457.108,-1785.899;Inherit;False;Property;_ShadowLayer1Intensity;Shadow Layer 1 Intensity;22;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;928;-2750.517,-1460.49;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-3717.37,-1423.071;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1392;-5018.203,2214.853;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-3119.442,1691.593;Inherit;False;Highlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1513;-4958.629,-2509.786;Inherit;False;Property;_GlobalIntensityMinimum;Global Intensity Minimum;58;0;Create;True;0;0;False;0;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;944;-4626.051,1800.717;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;998;-6049.245,-332.7801;Inherit;False;1127.255;736.3494;;9;1007;496;490;482;501;790;508;477;483;Permanent Shadows;0.6037736,0.5895336,0.5895336,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-585.6714,-3189.245;Inherit;False;VertexColors;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;975;-4894.629,-2829.786;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;17;0;Create;True;0;0;False;0;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;859;-5059.478,2025.973;Inherit;False;Property;_DarkHighlightMult;Dark Highlight Mult;39;0;Create;True;0;0;False;0;0.2392157,0.2392157,0.5294118,0;0.2392155,0.2392155,0.5294118,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1016;-4894.629,-3325.786;Inherit;False;Property;_LightDirection;Light Direction;2;1;[Enum];Create;True;2;Automatic;0;Forced Fake;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1508;-4878.629,-3405.786;Inherit;False;Property;_LightColor;Light Color;1;1;[Enum];Create;True;2;Automatic;0;Forced Fake;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1629;-4894.629,-2589.786;Inherit;False;Property;_ViewDirOffsetZ;View Dir Offset Z;45;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-4958.629,-3165.786;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;15;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1683;-4699.562,-2762.139;Inherit;False;Constant;_Float2;Float 2;71;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1750;-4898.629,-2907.786;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;71;0;Create;True;0;0;False;0;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-4894.629,-3085.786;Float;False;Property;_FakeLightColor;Fake Light Color;16;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformDirectionNode;98;-4813.252,1081.426;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1122;-4894.629,-2669.786;Inherit;False;Property;_ViewDirOffsetY;View Dir Offset Y;44;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-3721.527,-1350.167;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1057;-4990.629,-3245.786;Inherit;False;Property;_FakeLightFallbackDirection;Fake Light Fallback Direction;5;1;[Enum];Create;True;2;Directional Light;0;View Direction;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-5999.245,-122.7799;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;29;0;Create;True;0;0;False;0;0.31;0.31;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1306;-2587.076,-1520.276;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-5999.245,-202.7802;Inherit;False;Property;_ILMLayer2;ILM Layer 2;28;0;Create;True;0;0;False;0;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-5999.245,-42.77975;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;31;0;Create;True;0;0;False;0;0.51;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-5903.245,117.2209;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;871;-3007.794,-1866.111;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-5999.245,-282.7801;Inherit;False;Property;_ILMLayer1;ILM Layer 1;27;0;Create;True;0;0;False;0;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1387;-4447.232,1770.949;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;790;-5919.245,277.2211;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1393;-4770.203,2083.853;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-5935.245,197.221;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-5903.245,37.22066;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1844;-4487.448,-3005.487;Inherit;False;Merged Light Function;-1;;746;6a9b492f5059fcf4aa61bcbd0dc72ff9;0;11;126;FLOAT;0;False;46;FLOAT;0;False;71;FLOAT;0;False;42;FLOAT;0;False;41;FLOAT4;0,0,0,0;False;38;FLOAT;0;False;39;FLOAT;0;False;99;FLOAT;0;False;100;FLOAT;0;False;157;FLOAT;0;False;121;COLOR;0,0,0,0;False;2;COLOR;1;FLOAT;2
Node;AmplifyShaderEditor.ComponentMaskNode;100;-4585.199,1081.924;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1376;-4626.855,2050.869;Inherit;False;DarkHighlightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-2841.046,-1853.088;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1380;-3727.442,2219.594;Inherit;False;FresnelSystem;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;924;-2419.457,-1512.253;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1381;-4239.555,1778.829;Inherit;False;HighlightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-3119.442,1803.593;Inherit;False;DarkenHighlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1007;-5458.611,-117.5838;Inherit;False;Permanent Shadows;-1;;749;1ce4709ce3667c2438e413e9b79be23a;0;8;3;FLOAT;0;False;4;FLOAT;0;False;58;FLOAT;0;False;59;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;57;FLOAT4;0,0,0,0;False;34;FLOAT4;0,0,0,0;False;2;FLOAT;0;FLOAT;35
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-4360.195,1064.924;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1006;-4881.321,-1090.758;Inherit;False;1758.411;1891.205;;23;1395;1263;848;1396;1385;935;463;990;1290;471;467;465;989;734;455;1321;832;834;1000;926;1320;460;625;Shading System;0.4313726,0,0.7843137,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-4014.63,-2941.786;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1263;-4684.429,486.8701;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4676.261,89.24409;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;1320;-4569.519,-74.59047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;990;-4772.261,-390.7559;Inherit;False;Property;_ShadowLayer2Gate;Shadow Layer 2 Gate;24;0;Create;True;0;0;False;0;0.91;0.91;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;926;-4708.261,-870.7552;Inherit;False;924;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4772.261,-310.7558;Inherit;False;Property;_ShadowLayer2Fuzziness;Shadow Layer 2 Fuzziness;25;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-4708.261,9.244186;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-4772.261,-710.7552;Inherit;False;Property;_ShadowLayer1Push;Shadow Layer 1 Push;19;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-4772.261,-550.7559;Inherit;False;Property;_ShadowLayer1Fuzziness;Shadow Layer 1 Fuzziness;21;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1534;-1305.382,-2816.472;Inherit;False;2180.807;1326.282;;30;1682;1454;1679;1680;1703;1696;1697;1702;1455;1699;1678;1700;1456;1458;1675;1462;1698;1533;1693;1677;1689;1676;1674;1529;1694;1527;1692;1461;1690;1528;Glow Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1396;-4716.429,646.8701;Inherit;False;538;DarkenHighlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;-4676.261,-790.7552;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-4772.261,-950.7552;Inherit;False;Property;_SpecularFuzzy;Specular Fuzzy;33;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1321;-4584.935,-115.7036;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-4772.261,-470.7559;Inherit;False;Property;_ShadowLayer2Push;Shadow Layer 2 Push;23;0;Create;True;0;0;False;0;-0.3;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-4485.875,-1428.947;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4676.261,249.2441;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4676.261,329.2442;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-4694.261,-227.7558;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-4772.261,-1030.755;Inherit;False;Property;_SpecularSize;Specular Size;32;0;Create;True;0;0;False;0;0.46;0.583;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-4207.196,1049.924;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1385;-4716.429,406.8701;Inherit;False;1380;FresnelSystem;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;848;-4716.429,566.8701;Inherit;False;1381;HighlightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;989;-4676.261,169.2441;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-4014.63,-3037.786;Inherit;False;LightColorOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1786;-2998.765,-591.8958;Inherit;False;462.5835;277.4739;;2;515;513;Apply Light Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1000;-4772.261,-630.7555;Inherit;False;Property;_ShadowLayer1Gate;Shadow Layer 1 Gate;20;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1395;-4736,720;Inherit;False;1376;DarkHighlightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-4001.195,918.8229;Float;False;Property;_MetalAIntensity;Metal A Intensity;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1528;-1115.274,-2480.413;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1784;-2403.588,-639.4731;Inherit;False;682.1055;415.9123;;5;1707;1712;1710;1708;514;Detail Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-2973.192,-538.155;Inherit;False;457;LightColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1690;-913.5999,-1668.097;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1803;-3615.629,-477.5756;Inherit;False;Shading System;-1;;750;1670eb1c79b726744983c09eed1d95d8;0;23;86;FLOAT;0;False;87;FLOAT;0;False;91;COLOR;0,0,0,0;False;92;FLOAT;0;False;35;FLOAT;0;False;46;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;47;FLOAT;0;False;48;FLOAT;0;False;37;FLOAT;0;False;38;FLOAT;0;False;39;FLOAT;0;False;36;FLOAT4;0,0,0,0;False;41;FLOAT4;0,0,0,0;False;40;FLOAT;0;False;42;COLOR;0,0,0,0;False;43;COLOR;0,0,0,0;False;105;FLOAT;0;False;97;FLOAT;0;False;111;COLOR;0,0,0,0;False;106;FLOAT;0;False;112;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1692;-902.5999,-1781.097;Inherit;False;1688;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;103;-4062.197,1009.924;Inherit;True;Property;_MetalMatcap;Metal Matcap;12;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;105;-3980.895,1235.422;Float;False;Property;_MetalBIntensity;Metal B Intensity;14;0;Create;True;0;0;False;0;10;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1461;-1255.382,-2750.325;Inherit;True;Property;_GlowMask;Glow Mask;11;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-3729.896,1016.023;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1694;-703.5999,-1582.096;Inherit;False;Property;_DetailEmissiveIntensity;Detail Emissive Intensity;65;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-3725.19,1183.622;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1689;-616.6,-1727.097;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-2704.737,-480.2164;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-2333.11,-338.561;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1529;-822.3518,-2532.601;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1527;-806.6108,-2766.472;Inherit;False;Property;_GlowMaskMultSystem;Glow Mask Mult System;59;1;[Enum];Create;True;2;Mask Color;0;Base Color Lerped from Mask;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1676;-909.6378,-2103.47;Inherit;False;1656;ILMColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1708;-2335.917,-455.1572;Inherit;False;1688;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1674;-908.2179,-2010.991;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1693;-357.5999,-1672.097;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1231;-3723.258,-1576.131;Inherit;False;ILM;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1698;-413.4992,-1772.703;Inherit;False;Property;_EnableDetailEmission;Enable Detail Emission;66;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1456;-500.6161,-2435.102;Inherit;False;Property;_GlowMaskIntensity;Glow Mask Intensity;55;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-3669.282,916.725;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1707;-2127.531,-396.7145;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-3565.997,1086.024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1768;-6514.645,-2111.961;Inherit;False;1130.771;939.9232;;11;1864;1755;1245;1227;1259;1255;1258;1865;1214;1218;1758;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;1675;-619.739,-2051.069;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1783;-1649.087,-634.9982;Inherit;False;731.8361;419.9959;;5;1670;1663;1665;1664;1661;ILM Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1677;-680.537,-1909.07;Inherit;False;Property;_ILMEmissiveIntensity;ILM Emissive Intensity;63;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1462;-478.8101,-2156.026;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1710;-2353.588,-589.4731;Inherit;False;1686;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1458;-504.8171,-2340.503;Inherit;False;Property;_GlowMaskTint;Glow Mask Tint;56;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareEqual;1533;-484.894,-2629.565;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1245;-6400,-1616;Inherit;False;Property;_ILMChannel;ILM Channel;49;1;[Enum];Create;True;4;Red   Specular Intensity;0;Green   Shading Occlusion;1;Blue   Specular Mask;2;Alpha   Diffuse Mult for body lines;3;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1758;-6400,-2032;Inherit;False;Property;_DebugGroup;Debug Group;7;1;[Enum];Create;True;3;Vertex Colors;0;ILM Channels;1;Base and SSS Alpha;2;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1218;-6432,-1952;Inherit;False;Property;_DebugColor;Debug Color;48;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1678;-372.6379,-1986.57;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1697;-128.4992,-1768.703;Inherit;False;1686;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-3399.995,1033.624;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1702;-67.88461,-2472.497;Inherit;False;Property;_EnableGlowmask;Enable Glowmask;68;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1258;-6416,-1296;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1864;-6432,-1776;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1255;-6432,-1376;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareLower;1712;-1956.482,-550.6256;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1455;-162.8155,-2377.496;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1227;-6416,-1536;Inherit;False;1231;ILM;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1700;-322.122,-2077.887;Inherit;False;Property;_EnableILMEmission;Enable ILM Emission;67;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1699;-93.49917,-1694.703;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1664;-1599.087,-337.013;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1259;-6464,-1456;Inherit;False;Property;_BaseSSSAlphaSwap;Base SSS Alpha Swap;50;1;[Enum];Create;True;2;Base Alpha   Highlight Fresnel Scale;0;SSS Alpha   Shadow Fresnel Scale;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1755;-6432,-1696;Inherit;False;Property;_VertexChannel;Vertex Channel;47;1;[Enum];Create;True;5;All Channels;0;Red   Occlusion Shading;1;Green   Outline Camera Scale Mult;2;Blue   Outline Thickness base value;3;Alpha   Outline Thickness Coefficient;4;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1665;-1593.938,-464.1125;Inherit;False;1656;ILMColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1663;-1346.209,-371.0022;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1703;154.1154,-2376.497;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1661;-1548.547,-584.9982;Inherit;False;1655;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1696;149.4005,-1741.097;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1680;169.7347,-2057.82;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-3246.866,1034.442;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1785;-892.7359,-676.0619;Inherit;False;591.438;303;;3;1704;521;1705;Enable Matcap;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;1865;-5996.408,-1759.852;Inherit;False;Debug;-1;;753;6f93fc90e278e9a449a8e28c4cbb4ee4;0;9;48;FLOAT;0;False;59;COLOR;0,0,0,0;False;61;COLOR;1,1,1,0;False;47;FLOAT;0;False;50;FLOAT;0;False;54;COLOR;0,0,0,0;False;57;FLOAT;0;False;55;FLOAT;0;False;56;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-842.7357,-549.2883;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareLower;1670;-1152.252,-516.3843;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1092;-998.8157,-41.54727;Inherit;False;1385.024;1074.321;;11;1882;1082;1161;1089;1466;1518;1085;1174;1087;1171;1517;Outline;0.9075414,0.5613208,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1704;-818.2977,-626.0619;Inherit;False;Property;_EnableMatcap;EnableMatcap;69;1;[Toggle];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1679;429.5504,-2091.109;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1214;-5661.274,-1764.399;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1264;-277.4289,-604.8836;Inherit;False;571.0603;277.1415;Debug System Toggle;2;1175;1209;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1089;-864,96;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1161;-896,336;Inherit;False;Property;_OutlineThickness;Outline Thickness;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1082;-880,496;Inherit;False;Property;_OutlineColor;Outline Color;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1454;584.3846,-2104.304;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1518;-880,896;Inherit;False;457;LightColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1209;-227.429,-442.3427;Inherit;False;1214;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;246;334.7231,-828.4818;Inherit;False;554.1174;504.4;;2;0;1459;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1882;-912,256;Inherit;False;Property;_CameraDistanceMult;Camera Distance Mult;0;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1085;-912,672;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;53;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1517;-912,816;Inherit;False;Property;_EnableLightColorMult;Enable Light Color Mult;52;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1174;-896,416;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1087;-880,16;Inherit;False;Property;_EnableOutline;Enable Outline;51;1;[Toggle];Create;True;2;Disable;0;Yes I am lazy and want ugly outlines;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1705;-536.2982,-552.0619;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1466;-912,752;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;57;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1171;-960,176;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;54;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1895;-172.1828,229.2521;Inherit;False;ASWOutline;-1;;765;ea9f2d47913480c4f9e91454af7efa45;0;11;30;FLOAT;0;False;31;COLOR;0,0,0,0;False;32;FLOAT;0;False;47;FLOAT;0;False;33;FLOAT;0;False;34;COLOR;0,0,0,0;False;35;COLOR;0,0,0,0;False;36;FLOAT;0;False;37;FLOAT;0;False;40;FLOAT;0;False;41;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1116;-4894.629,-2749.786;Inherit;False;Property;_ViewDirOffsetX;View Dir Offset X;43;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1682;-135.1208,-2175.671;Inherit;False;1655;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1459;378.3992,-739.9838;Inherit;False;1454;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1175;29.63205,-554.8836;Inherit;False;Property;_ALPHATEST;Enable Debug;46;0;Create;False;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;624.8439,-778.4818;Float;False;True;-1;2;ASWShaderGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light v6.8.0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;1;RenderType=Opaque;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1656;0;1631;0
WireConnection;118;0;113;4
WireConnection;1655;0;1639;0
WireConnection;1658;0;1659;0
WireConnection;1658;1;182;0
WireConnection;1658;2;512;0
WireConnection;1688;0;1687;0
WireConnection;1669;0;512;0
WireConnection;1669;1;182;0
WireConnection;1686;0;1685;0
WireConnection;215;1;216;0
WireConnection;1654;0;1657;0
WireConnection;1654;2;1658;0
WireConnection;1654;3;1669;0
WireConnection;1724;0;1725;0
WireConnection;1724;1;1654;0
WireConnection;1724;2;215;0
WireConnection;1728;0;1654;0
WireConnection;1728;1;215;0
WireConnection;517;0;518;0
WireConnection;517;1;152;0
WireConnection;1722;0;1723;0
WireConnection;1722;2;1724;0
WireConnection;1722;3;1728;0
WireConnection;183;0;1722;0
WireConnection;440;0;517;0
WireConnection;1729;0;517;0
WireConnection;987;0;152;4
WireConnection;850;0;182;4
WireConnection;449;0;1729;0
WireConnection;449;1;1722;0
WireConnection;231;0;142;3
WireConnection;231;1;142;2
WireConnection;231;2;142;1
WireConnection;231;3;142;4
WireConnection;659;0;658;0
WireConnection;659;1;657;0
WireConnection;119;0;113;1
WireConnection;447;0;543;0
WireConnection;447;1;517;0
WireConnection;447;2;449;0
WireConnection;448;0;447;0
WireConnection;921;0;658;0
WireConnection;921;1;659;0
WireConnection;1067;0;1062;0
WireConnection;1067;2;231;0
WireConnection;1067;3;142;0
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
WireConnection;548;0;546;0
WireConnection;548;1;547;0
WireConnection;928;0;635;0
WireConnection;928;1;921;0
WireConnection;928;2;918;0
WireConnection;360;0;113;2
WireConnection;555;0;1753;57
WireConnection;944;0;546;0
WireConnection;944;1;548;0
WireConnection;441;0;1067;0
WireConnection;98;0;97;0
WireConnection;117;0;113;3
WireConnection;1306;0;658;0
WireConnection;1306;1;928;0
WireConnection;871;0;449;0
WireConnection;871;1;870;0
WireConnection;1387;0;546;0
WireConnection;1387;1;944;0
WireConnection;1393;0;859;0
WireConnection;1393;1;1392;0
WireConnection;1844;126;1508;0
WireConnection;1844;46;1016;0
WireConnection;1844;71;1057;0
WireConnection;1844;42;947;0
WireConnection;1844;41;217;0
WireConnection;1844;38;1750;0
WireConnection;1844;39;975;0
WireConnection;1844;99;1683;0
WireConnection;1844;100;1122;0
WireConnection;1844;157;1629;0
WireConnection;1844;121;1513;0
WireConnection;100;0;98;0
WireConnection;1376;0;1393;0
WireConnection;451;0;871;0
WireConnection;1380;0;1378;0
WireConnection;924;0;1306;0
WireConnection;1381;0;1387;0
WireConnection;538;0;1753;59
WireConnection;1007;3;482;0
WireConnection;1007;4;490;0
WireConnection;1007;58;501;0
WireConnection;1007;59;508;0
WireConnection;1007;1;477;0
WireConnection;1007;2;483;0
WireConnection;1007;57;496;0
WireConnection;1007;34;790;0
WireConnection;101;1;100;0
WireConnection;14;0;1844;2
WireConnection;1320;0;1007;35
WireConnection;1321;0;1007;0
WireConnection;443;0;215;0
WireConnection;102;1;101;0
WireConnection;457;0;1844;1
WireConnection;1803;86;625;0
WireConnection;1803;87;935;0
WireConnection;1803;91;926;0
WireConnection;1803;92;1290;0
WireConnection;1803;35;460;0
WireConnection;1803;46;1000;0
WireConnection;1803;49;834;0
WireConnection;1803;50;467;0
WireConnection;1803;47;990;0
WireConnection;1803;48;832;0
WireConnection;1803;37;734;0
WireConnection;1803;38;1321;0
WireConnection;1803;39;1320;0
WireConnection;1803;36;471;0
WireConnection;1803;41;455;0
WireConnection;1803;40;989;0
WireConnection;1803;42;463;0
WireConnection;1803;43;465;0
WireConnection;1803;105;1385;0
WireConnection;1803;97;1263;0
WireConnection;1803;111;848;0
WireConnection;1803;106;1396;0
WireConnection;1803;112;1395;0
WireConnection;103;1;102;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;1689;0;1692;0
WireConnection;1689;2;1690;0
WireConnection;513;0;515;0
WireConnection;513;1;1803;0
WireConnection;1529;1;1528;0
WireConnection;1529;2;1461;0
WireConnection;1693;0;1689;0
WireConnection;1693;1;1694;0
WireConnection;1231;0;113;0
WireConnection;1707;0;1708;0
WireConnection;1707;1;513;0
WireConnection;1707;2;514;0
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;1675;0;1676;0
WireConnection;1675;2;1674;0
WireConnection;1533;0;1527;0
WireConnection;1533;2;1461;0
WireConnection;1533;3;1529;0
WireConnection;1678;0;1675;0
WireConnection;1678;1;1677;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;1712;0;1710;0
WireConnection;1712;2;513;0
WireConnection;1712;3;1707;0
WireConnection;1455;0;1533;0
WireConnection;1455;1;1456;0
WireConnection;1455;2;1458;0
WireConnection;1455;3;1462;0
WireConnection;1699;0;1698;0
WireConnection;1699;1;1693;0
WireConnection;1663;0;1665;0
WireConnection;1663;1;1712;0
WireConnection;1663;2;1664;0
WireConnection;1703;0;1702;0
WireConnection;1703;1;1455;0
WireConnection;1696;0;1697;0
WireConnection;1696;2;1699;0
WireConnection;1680;0;1700;0
WireConnection;1680;2;1678;0
WireConnection;111;0;110;0
WireConnection;1865;48;1758;0
WireConnection;1865;59;1218;0
WireConnection;1865;61;1864;0
WireConnection;1865;47;1755;0
WireConnection;1865;50;1245;0
WireConnection;1865;54;1227;0
WireConnection;1865;57;1259;0
WireConnection;1865;55;1255;0
WireConnection;1865;56;1258;0
WireConnection;1670;0;1661;0
WireConnection;1670;2;1712;0
WireConnection;1670;3;1663;0
WireConnection;1679;0;1703;0
WireConnection;1679;1;1680;0
WireConnection;1679;2;1696;0
WireConnection;1214;0;1865;0
WireConnection;1454;0;1679;0
WireConnection;1705;0;1704;0
WireConnection;1705;2;521;0
WireConnection;1705;3;1670;0
WireConnection;1895;30;1087;0
WireConnection;1895;31;1089;0
WireConnection;1895;32;1171;0
WireConnection;1895;47;1882;0
WireConnection;1895;33;1161;0
WireConnection;1895;34;1174;0
WireConnection;1895;35;1082;0
WireConnection;1895;36;1085;0
WireConnection;1895;37;1466;0
WireConnection;1895;40;1517;0
WireConnection;1895;41;1518;0
WireConnection;1175;1;1705;0
WireConnection;1175;0;1209;0
WireConnection;0;2;1459;0
WireConnection;0;13;1175;0
WireConnection;0;11;1895;0
ASEEND*/
//CHKSM=D3C978A13A724FC773443362E2C3DA7DC9032803
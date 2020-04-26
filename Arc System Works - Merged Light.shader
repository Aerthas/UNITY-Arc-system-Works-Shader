// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light v6.7.2"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[Enum(No,0,Yes,1)]_ForceFakeLight("Force Fake Light", Float) = 0
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 0.5
		[Enum(Fake Light Direction,0,View Direction,1)]_FakeLightFallbackDirToggle("Fake Light Fallback Dir Toggle", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[NoScaleOffset]_Detail("Detail", 2D) = "white" {}
		[NoScaleOffset]_GlowMask("Glow Mask", 2D) = "black" {}
		[NoScaleOffset]_MetalMatcap("Metal Matcap", 2D) = "white" {}
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 10
		_FakeLightIntensity("Fake Light Intensity", Float) = 1
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_FakeLightDirX("Fake Light Dir X", Float) = 35
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
		[Enum(FighterZ,0,Granblue,1)]_FresnelSystem("Fresnel System", Float) = 0
		_HighlightPower("Highlight Power", Float) = 5
		_HighlightFreselFuzzy("Highlight Fresel Fuzzy", Float) = 0.01
		_HighlightIntensity("Highlight Intensity", Float) = 1
		_HighlightScale("Highlight Scale", Float) = 1
		_DarkHighlightMult("Dark Highlight Mult", Color) = (0.2392157,0.2392157,0.5294118,0)
		_GranblueDarkenPower("Granblue Darken Power", Float) = 1
		_GranblueDarkenScale("Granblue Darken Scale", Float) = 1
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[Toggle]_METALLICGLOSSMAP("_METALLICGLOSSMAP", Float) = 0
		_ViewDirOffsetX("View Dir Offset X", Float) = 0
		_ViewDirOffsetY("View Dir Offset Y", Float) = 0
		[Toggle(_ALPHABLEND_ON)] _ALPHABLEND("Enable Debug", Float) = 0
		[Toggle]_COLORADDSUBDIFF("_COLORADDSUBDIFF", Float) = 0
		[Enum(Red   Occlusion Shading,0,Green   Outline Thickness mask for Camera Distance Mult,1,Blue   Outline Mask,2,Alpha   Outline Thickness,3)]_VertexChannel("Vertex Channel", Float) = 0
		_VertexDebugColor("Vertex Debug Color", Color) = (1,1,1,0)
		[Toggle]_COLOROVERLAY("_COLOROVERLAY", Float) = 1
		[Enum(Red   Specular Intensity,0,Green   Shading Occlusion,1,Blue   Specular Mask,2,Alpha   Diffuse Mult for body lines,3)]_ILMChannel("ILM Channel", Float) = 0
		_ILMDebugColor("ILM Debug Color", Color) = (1,1,1,0)
		[Toggle]_PIXELSNAP("PIXELSNAP", Float) = 0
		[Toggle]_COLORCOLOR("_COLORCOLOR", Float) = 0
		[Enum(Base Alpha   Fresnel Mask,0,SSS Alpha   Shadow Threshold,1)]_BaseSSSAlphaSwap("Base SSS Alpha Swap", Float) = 0
		_BaseSSSAlphaColor("Base SSS Alpha Color", Color) = (1,1,1,0)
		[Enum(Disable,0,Yes I am lazy and want ugly outlines,1)]_EnableOutline("Enable Outline", Float) = 0
		[Enum(Disable,0,Enable,1)]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		[Enum(Disable,0,Enable,1)]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_GlowMaskIntensity("Glow Mask Intensity", Float) = 1
		[Toggle]_FADE("_FADE", Float) = 0
		_GlowMaskTint("Glow Mask Tint", Color) = (1,1,1,0)
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
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
			float temp_output_32_0_g491 = _EnableCameraDistanceMult;
			float temp_output_33_0_g491 = _OutlineThickness;
			float4 appendResult231 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 VertexColors441 = (( _WrongVertexColors > 0.0 ) ? appendResult231 :  v.color );
			float4 break8_g491 = VertexColors441;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float outlineVar = (( temp_output_32_0_g491 > 0.0 ) ? ( 0.0001 * temp_output_33_0_g491 * break8_g491.a * min( ( break8_g491.g * distance( ase_worldPos , _WorldSpaceCameraPos ) ) , 1.0 ) * (( break8_g491.b > 0.1 ) ? 1.0 :  0.0 ) ) :  ( (( temp_output_32_0_g491 > 0.0 ) ? 0.0 :  5.0 ) * 1E-05 * temp_output_33_0_g491 * break8_g491.b * break8_g491.a ) );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float4 Base183 = tex2DNode182;
			float4 temp_output_13_0_g491 = max( float4( 0,0,0,0 ) , ( 0.2 * Base183 ) );
			o.Emission = ( (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_13_0_g491 * temp_output_13_0_g491 ) :  _OutlineColor ) * _OutlineColorIntensity ).rgb;
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
		#pragma shader_feature _ALPHABLEND_ON
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			float4 vertexColor : COLOR;
			float2 uv2_texcoord2;
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

		uniform float _FADE;
		uniform sampler2D _GlowMask;
		uniform float _GlowMaskIntensity;
		uniform float4 _GlowMaskTint;
		uniform sampler2D _Base;
		uniform float _METALLICGLOSSMAP;
		uniform float _ForceFakeLight;
		uniform float4 _FakeLightColor;
		uniform float _FakeLightIntensity;
		uniform float _FresnelSystem;
		uniform float _ShadowLayer2Intensity;
		uniform float _ShadowBrightness;
		uniform sampler2D _SSS;
		uniform float4 _DarkHighlightMult;
		uniform float _HighlightIntensity;
		uniform float _COLOROVERLAY;
		uniform float _HighlightScale;
		uniform float _HighlightPower;
		uniform float _HighlightFreselFuzzy;
		uniform float _GranblueDarkenScale;
		uniform float _GranblueDarkenPower;
		uniform float _ShadowLayer1Intensity;
		uniform float _ShadowLayer1Fuzziness;
		uniform float _WrongVertexColors;
		uniform float _FakeLightFallbackDirToggle;
		uniform float _ViewDirOffsetX;
		uniform float _ViewDirOffsetY;
		uniform float _FakeLightDirX;
		uniform float _FakeLightDirY;
		uniform float _ShadowLayer1Push;
		uniform float _ShadowLayer1Gate;
		uniform float _ILMLayer1;
		uniform sampler2D _ILM;
		uniform float _VertexLayer1;
		uniform float _ShadowLayer2Fuzziness;
		uniform float _ShadowLayer2Push;
		uniform float _ShadowLayer2Gate;
		uniform float _ILMLayer2;
		uniform float _VertexLayer2;
		uniform float _SpecularIntensity;
		uniform float _SpecularFuzzy;
		uniform float _SpecularSize;
		uniform sampler2D _Detail;
		uniform float _MetalAIntensity;
		uniform sampler2D _MetalMatcap;
		uniform float _MetalBIntensity;
		uniform float _COLORADDSUBDIFF;
		uniform float _VertexChannel;
		uniform float4 _VertexDebugColor;
		uniform float _PIXELSNAP;
		uniform float _ILMChannel;
		uniform float4 _ILMDebugColor;
		uniform float _COLORCOLOR;
		uniform float _BaseSSSAlphaSwap;
		uniform float4 _BaseSSSAlphaColor;
		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _EnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;
		uniform float _EnableOutline;
		uniform float _Cutoff = 0.5;


		float3 StereoCameraViewDirection1499( float3 worldPos )
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
			#else
			float3 cameraPos = _WorldSpaceCameraPos;
			#endif
			float3 worldViewDir = normalize((cameraPos - worldPos));
			return worldViewDir;
		}


		float3 StereoCameraViewDirection194_g482( float3 worldPos )
		{
			#if UNITY_SINGLE_PASS_STEREO
			float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
			#else
			float3 cameraPos = _WorldSpaceCameraPos;
			#endif
			float3 worldViewDir = normalize((cameraPos - worldPos));
			return worldViewDir;
		}


		float3 MyCustomExpression184_g482( float3 rotation , float inX , float inY , float inZ )
		{
			float sinX = sin(rotation.x);
			float cosX = cos(rotation.x);
			float sinY = sin(rotation.y);
			float cosY = cos(rotation.y);
			float sinZ = sin(rotation.z);
			float cosZ = cos(rotation.z);
			float3 xAxis = float3(
				cosY * cosZ,
				cosX * sinZ + sinX * sinY * cosZ,
				sinX * sinZ - cosX * sinY * cosZ
			);
			float3 yAxis = float3(
				-cosY * sinZ,
				cosX * cosZ - sinX * sinY * sinZ,
				sinX * cosZ + cosX * sinY * sinZ
			);
			float3 zAxis = float3(
				sinY,
				-sinX * cosY,
				cosX * cosY
			);
			return xAxis * inX + yAxis * inY + zAxis * inZ;
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
			float temp_output_73_0_g480 = (( _ForceFakeLight > 0.0 ) ? 0.0 :  (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 ) );
			float4 LightColor457 = (( temp_output_73_0_g480 > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) );
			float FresnelSystem1380 = _FresnelSystem;
			float2 uv_SSS152 = i.uv_texcoord;
			float4 tex2DNode152 = tex2D( _SSS, uv_SSS152 );
			float4 SSS440 = ( _ShadowBrightness * tex2DNode152 );
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float4 Base183 = tex2DNode182;
			float4 temp_output_449_0 = ( SSS440 * Base183 );
			float4 SSS2448 = ( _ShadowLayer2Intensity * SSS440 * temp_output_449_0 );
			float4 temp_output_43_0_g488 = SSS2448;
			float4 DarkHighlightColor1376 = ( _DarkHighlightMult + SSS2448 );
			float3 worldPos1499 = ase_worldPos;
			float3 localStereoCameraViewDirection1499 = StereoCameraViewDirection1499( worldPos1499 );
			float3 ase_worldNormal = i.worldNormal;
			float SSSAlpha987 = tex2DNode152.a;
			float fresnelNdotV1334 = dot( ase_worldNormal, localStereoCameraViewDirection1499 );
			float fresnelNode1334 = ( -0.180914 + ( _HighlightScale * SSSAlpha987 ) * pow( 1.0 - fresnelNdotV1334, _HighlightPower ) );
			float clampResult545 = clamp( ( (( _COLOROVERLAY )?( 1.0 ):( 0.0 )) * pow( saturate( fresnelNode1334 ) , _HighlightFreselFuzzy ) ) , 0.0 , 1.0 );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float fresnelNdotV1430 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode1430 = ( 0.0 + ( SSSAlpha987 * _GranblueDarkenScale ) * pow( 1.0 - fresnelNdotV1430, _GranblueDarkenPower ) );
			float clampResult1432 = clamp( saturate( fresnelNode1430 ) , 0.0 , 1.0 );
			float DarkenHighlight538 = (( _FresnelSystem == 0.0 ) ? ( _HighlightIntensity * clampResult545 * SSSAlpha987 ) :  (( (( _COLOROVERLAY )?( 1.0 ):( 0.0 )) == 0.0 ) ? 1.0 :  ( 1.0 - clampResult1432 ) ) );
			float temp_output_106_0_g488 = DarkenHighlight538;
			float4 lerpResult122_g488 = lerp( temp_output_43_0_g488 , DarkHighlightColor1376 , temp_output_106_0_g488);
			float4 BaseSSS451 = ( temp_output_449_0 * _ShadowLayer1Intensity );
			float4 temp_output_42_0_g488 = BaseSSS451;
			float4 temp_output_41_0_g488 = Base183;
			float4 blendOpSrc548 = Base183;
			float4 blendOpDest548 = SSS440;
			float4 HighlightColor1381 = ( Base183 + ( Base183 + ( saturate( (( blendOpSrc548 > 0.5 ) ? max( blendOpDest548, 2.0 * ( blendOpSrc548 - 0.5 ) ) : min( blendOpDest548, 2.0 * blendOpSrc548 ) ) )) ) );
			float4 temp_output_111_0_g488 = HighlightColor1381;
			float BaseAlpha850 = tex2DNode182.a;
			float fresnelNdotV550 = dot( ase_worldNormal, localStereoCameraViewDirection1499 );
			float fresnelNode550 = ( -0.180914 + ( BaseAlpha850 * _HighlightScale ) * pow( 1.0 - fresnelNdotV550, _HighlightPower ) );
			float clampResult573 = clamp( ( (( _COLOROVERLAY )?( 1.0 ):( 0.0 )) * pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ) , 0.0 , 1.0 );
			float Highlight555 = ( BaseAlpha850 * clampResult573 * _HighlightIntensity );
			float temp_output_97_0_g488 = Highlight555;
			float4 lerpResult110_g488 = lerp( temp_output_41_0_g488 , temp_output_111_0_g488 , temp_output_97_0_g488);
			float4 appendResult231 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 VertexColors441 = (( _WrongVertexColors > 0.0 ) ? appendResult231 :  i.vertexColor );
			float3 appendResult186_g482 = (float3(radians( _ViewDirOffsetX ) , radians( _ViewDirOffsetY ) , 0.0));
			float3 rotation184_g482 = appendResult186_g482;
			float3 worldPos194_g482 = ase_worldPos;
			float3 localStereoCameraViewDirection194_g482 = StereoCameraViewDirection194_g482( worldPos194_g482 );
			float3 break195_g482 = localStereoCameraViewDirection194_g482;
			float inX184_g482 = break195_g482.x;
			float inY184_g482 = break195_g482.y;
			float inZ184_g482 = break195_g482.z;
			float3 localMyCustomExpression184_g482 = MyCustomExpression184_g482( rotation184_g482 , inX184_g482 , inY184_g482 , inZ184_g482 );
			float3 normalizeResult2_g482 = normalize( localMyCustomExpression184_g482 );
			float3 appendResult15_g481 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
			float3 normalizeResult2_g481 = normalize( appendResult15_g481 );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult28_g480 = dot( (( temp_output_73_0_g480 > 0.0 ) ? ase_worldlightDir :  (( _FakeLightFallbackDirToggle > 0.0 ) ? normalizeResult2_g482 :  normalizeResult2_g481 ) ) , ase_normWorldNormal );
			float DefaultDot14 = dotResult28_g480;
			float temp_output_37_0_g488 = DefaultDot14;
			float temp_output_40_0_g488 = SSSAlpha987;
			float ifLocalVar5_g490 = 0;
			if( temp_output_40_0_g488 >= ( 1.0 - _ShadowLayer1Gate ) )
				ifLocalVar5_g490 = 1.0;
			float lerpResult8_g490 = lerp( 1.0 , ( ( -1.0 + VertexColors441.x + temp_output_37_0_g488 ) - _ShadowLayer1Push ) , ifLocalVar5_g490);
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMG360 = tex2DNode113.g;
			float temp_output_1_0_g483 = ILMG360;
			float temp_output_20_0_g483 = ( 1.0 - ( 0.62 * temp_output_1_0_g483 ) );
			float ILMB117 = tex2DNode113.b;
			float4 color12_g483 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 temp_cast_8 = (Highlight555).xxxx;
			float4 temp_output_34_0_g483 = temp_cast_8;
			float4 temp_output_22_0_g483 = ( ( ILMB117 * 0.4 ) + ( color12_g483 + temp_output_34_0_g483 ) );
			float4 ifLocalVar24_g483 = 0;
			if( ( ( ( 1.0 - _ILMLayer1 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g483 )
				ifLocalVar24_g483 = temp_output_22_0_g483;
			float4 clampResult26_g483 = clamp( ifLocalVar24_g483 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_44_0_g483 = ( 1.0 - VertexColors441.x );
			float4 color39_g483 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_46_0_g483 = ( ( temp_output_1_0_g483 * 0.4 ) + ( temp_output_34_0_g483 + color39_g483 ) );
			float4 ifLocalVar49_g483 = 0;
			if( _VertexLayer1 >= temp_output_44_0_g483 )
				ifLocalVar49_g483 = temp_output_46_0_g483;
			float4 clampResult51_g483 = clamp( ifLocalVar49_g483 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_38_0_g488 = ( clampResult26_g483.r * clampResult51_g483.x );
			float smoothstepResult23_g488 = smoothstep( 0.0 , ( _ShadowLayer1Fuzziness * 0.01 ) , ( lerpResult8_g490 * temp_output_38_0_g488 ));
			float PrimaryDot127_g488 = smoothstepResult23_g488;
			float4 lerpResult26_g488 = lerp( temp_output_42_0_g488 , lerpResult110_g488 , PrimaryDot127_g488);
			float ifLocalVar5_g489 = 0;
			if( temp_output_40_0_g488 >= ( 1.0 - _ShadowLayer2Gate ) )
				ifLocalVar5_g489 = 1.0;
			float lerpResult8_g489 = lerp( 1.0 , ( temp_output_37_0_g488 - _ShadowLayer2Push ) , ifLocalVar5_g489);
			float4 ifLocalVar23_g483 = 0;
			if( ( ( ( 1.0 - _ILMLayer2 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g483 )
				ifLocalVar23_g483 = temp_output_22_0_g483;
			float4 clampResult25_g483 = clamp( ifLocalVar23_g483 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ifLocalVar50_g483 = 0;
			if( _VertexLayer2 >= temp_output_44_0_g483 )
				ifLocalVar50_g483 = temp_output_46_0_g483;
			float4 clampResult52_g483 = clamp( ifLocalVar50_g483 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float temp_output_39_0_g488 = ( clampResult25_g483.r * clampResult52_g483.x );
			float smoothstepResult25_g488 = smoothstep( 0.0 , ( _ShadowLayer2Fuzziness * 0.01 ) , ( lerpResult8_g489 * temp_output_39_0_g488 ));
			float SecondaryDot129_g488 = smoothstepResult25_g488;
			float4 lerpResult28_g488 = lerp( lerpResult122_g488 , lerpResult26_g488 , SecondaryDot129_g488);
			float4 blendOpSrc659 = Base183;
			float4 blendOpDest659 = SSS440;
			float ILMR119 = tex2DNode113.r;
			float4 SpecularColor924 = ( Base183 + ( _SpecularIntensity * ( Base183 + ( saturate( (( blendOpSrc659 > 0.5 ) ? max( blendOpDest659, 2.0 * ( blendOpSrc659 - 0.5 ) ) : min( blendOpDest659, 2.0 * blendOpSrc659 ) ) )) ) * ILMR119 ) );
			float4 temp_output_91_0_g488 = SpecularColor924;
			float smoothstepResult82_g488 = smoothstep( 0.0 , ( _SpecularFuzzy * 0.01 ) , ( ( ( 1.0 - ( ( _SpecularSize * 4.0 ) - 2.0 ) ) * -0.2 ) + ( ILMB117 * temp_output_37_0_g488 * temp_output_38_0_g488 * temp_output_39_0_g488 ) ));
			float TertiaryDot131_g488 = smoothstepResult82_g488;
			float4 lerpResult58_g488 = lerp( lerpResult28_g488 , temp_output_91_0_g488 , TertiaryDot131_g488);
			float4 lerpResult142_g488 = lerp( temp_output_42_0_g488 , temp_output_41_0_g488 , PrimaryDot127_g488);
			float4 lerpResult143_g488 = lerp( temp_output_43_0_g488 , lerpResult142_g488 , SecondaryDot129_g488);
			float4 lerpResult144_g488 = lerp( lerpResult143_g488 , temp_output_91_0_g488 , TertiaryDot131_g488);
			float4 lerpResult145_g488 = lerp( ( temp_output_106_0_g488 * lerpResult144_g488 ) , temp_output_111_0_g488 , ( temp_output_97_0_g488 * VertexColors441.x ));
			float4 clampResult33_g488 = clamp( (( FresnelSystem1380 == 0.0 ) ? lerpResult58_g488 :  lerpResult145_g488 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float ILMA118 = tex2DNode113.a;
			float4 Detail443 = tex2D( _Detail, i.uv2_texcoord2 );
			float3 worldToViewDir98 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode103 = tex2D( _MetalMatcap, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir98).xy ) ) );
			float4 MetalMatCap111 = ( Base183 * ( ( _MetalAIntensity * tex2DNode103.r ) + ( tex2DNode103.b * _MetalBIntensity ) ) );
			float4 break1223 = VertexColors441;
			float4 ILM1231 = tex2DNode113;
			float4 break1232 = ILM1231;
			float4 Debug1214 = ( (( _COLORADDSUBDIFF )?( (( _VertexChannel == 0.0 ) ? ( break1223.x * _VertexDebugColor ) :  (( _VertexChannel == 1.0 ) ? ( break1223.y * _VertexDebugColor ) :  (( _VertexChannel == 2.0 ) ? ( break1223.z * _VertexDebugColor ) :  (( _VertexChannel == 3.0 ) ? ( break1223.w * _VertexDebugColor ) :  float4( 0,0,0,0 ) ) ) ) ) ):( float4( 0,0,0,0 ) )) + (( _PIXELSNAP )?( (( _ILMChannel == 0.0 ) ? ( break1232.r * _ILMDebugColor ) :  (( _ILMChannel == 1.0 ) ? ( break1232.g * _ILMDebugColor ) :  (( _ILMChannel == 2.0 ) ? ( break1232.b * _ILMDebugColor ) :  (( _ILMChannel == 3.0 ) ? ( break1232.a * _ILMDebugColor ) :  float4( 0,0,0,0 ) ) ) ) ) ):( float4( 0,0,0,0 ) )) + (( _COLORCOLOR )?( (( _BaseSSSAlphaSwap == 0.0 ) ? ( BaseAlpha850 * _BaseSSSAlphaColor ) :  (( _BaseSSSAlphaSwap == 1.0 ) ? ( SSSAlpha987 * _BaseSSSAlphaColor ) :  float4( 0,0,0,0 ) ) ) ):( float4( 0,0,0,0 ) )) );
			#ifdef _ALPHABLEND_ON
				float4 staticSwitch1175 = Debug1214;
			#else
				float4 staticSwitch1175 = (( _METALLICGLOSSMAP )?( MetalMatCap111 ):( ( LightColor457 * clampResult33_g488 * ILMA118 * Detail443 ) ));
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
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float4 Base183 = tex2DNode182;
			float4 GlowMask1454 = (( _FADE )?( ( tex2D( _GlowMask, uv_GlowMask1461 ) * _GlowMaskIntensity * _GlowMaskTint * Base183 ) ):( float4( 0,0,0,0 ) ));
			o.Emission = GlowMask1454.rgb;
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
434.4;172;1532;825;6259.044;1133.287;3.154158;True;True
Node;AmplifyShaderEditor.CommentaryNode;516;-5159.689,-2321.539;Inherit;False;3064.604;1228.404;;25;448;451;871;447;444;870;543;449;987;938;112;440;183;517;518;152;850;182;1454;1455;1456;1457;1458;1461;1462;Color Information;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1298;-5148.033,1436.031;Inherit;False;2615.82;1308.131;;7;801;805;553;604;685;701;1327;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;182;-5034.406,-1859.533;Inherit;True;Property;_Base;Base;4;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;3fb2a23df9f88244a9ab2d8484aae955;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;-4730.653,-1734.601;Inherit;False;BaseAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;304;-3469.42,-2781.076;Inherit;False;978.1387;333.6884;;5;441;231;142;1062;1067;Vertex Colors fix;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;801;-5057.826,1536.031;Inherit;False;2427.208;540.8108;Highlight;12;578;554;683;550;700;555;686;573;549;1443;1499;1500;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;152;-5112.674,-2094.298;Inherit;True;Property;_SSS;SSS;6;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;de8dc23fa59bab04caa6c08d65663cdc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;805;-5021.656,2223.557;Inherit;False;2406.616;454.556;Darken Highlight;9;1340;1339;1338;1336;1334;718;545;537;1444;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-4988.627,2040.868;Inherit;False;Property;_HighlightScale;Highlight Scale;36;0;Create;True;0;0;False;0;1;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;-4794.507,-1979.568;Inherit;False;SSSAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-4943.539,1629.837;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1500;-5021.197,1868.378;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.VertexColorNode;142;-3418.514,-2648.115;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1426;-4514.254,2936.633;Inherit;False;1434.534;438.8455;Granblue Black Fresnel;8;1433;1432;1431;1430;1429;1428;1427;1452;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1340;-4975.183,2529.451;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1062;-3369.741,-2741.282;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;40;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;112;-4076.43,-1621.316;Inherit;False;585.331;428.9513;ILM Information;6;113;118;117;119;360;1231;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;700;-4708.019,1829.503;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;231;-3199.356,-2606.13;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;553;-5010.875,2121.062;Inherit;False;Property;_HighlightPower;Highlight Power;33;0;Create;True;0;0;False;0;5;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1499;-4777.743,1968.021;Inherit;False;#if UNITY_SINGLE_PASS_STEREO$float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5)@ $#else$float3 cameraPos = _WorldSpaceCameraPos@$#endif$float3 worldViewDir = normalize((cameraPos - worldPos))@$return worldViewDir@;3;False;1;True;worldPos;FLOAT3;0,0,0;In;;Float;False;Stereo Camera View Direction;True;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;96;-5054.192,866.7242;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1427;-4473.219,3118.824;Inherit;False;Property;_GranblueDarkenScale;Granblue Darken Scale;39;0;Create;True;0;0;False;0;1;1.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;113;-4052.032,-1498.583;Inherit;True;Property;_ILM;ILM;5;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;7948155db19842242b512f97e874b992;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareGreater;1067;-3010.741,-2694.282;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-5027.414,-2187.151;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;16;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;550;-4467.189,1768.982;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;-0.180914;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1339;-4758.193,2418.373;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1327;-3936.457,2032.083;Inherit;False;301;186.0001;Enable Highlight;1;1094;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;97;-5004.193,1085.924;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;1334;-4500.526,2377.1;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;-0.180914;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1428;-4163.545,3116.864;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1265;-8229.099,-3194.344;Inherit;False;2977.094;1938.203;;40;1262;1253;1252;1214;1250;1260;1239;1249;1248;1261;1221;1229;1256;1241;1247;1222;1255;1234;1257;1259;1242;1244;1254;1258;1246;1236;1215;1216;1237;1245;1240;1238;1232;1218;1223;1227;1193;1330;1331;1332;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-2718.492,-2703.581;Inherit;False;VertexColors;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-4712.114,-2091.327;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1429;-4426.142,3242.497;Inherit;False;Property;_GranblueDarkenPower;Granblue Darken Power;38;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;683;-4193.154,1783.736;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1231;-3723.258,-1576.131;Inherit;False;ILM;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-4415.528,2109.793;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;34;0;Create;True;0;0;False;0;0.01;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-4634.885,-1859.921;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-4327.364,-2092.458;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1227;-8179.099,-2227.627;Inherit;False;1231;ILM;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TransformDirectionNode;98;-4813.252,1081.426;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;1094;-3894.344,2091.039;Inherit;False;Property;_COLOROVERLAY;_COLOROVERLAY;48;0;Create;True;0;0;False;0;1;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;1430;-3980.771,3090.923;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1336;-4229.604,2375.552;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;938;-3450.517,-1574.561;Inherit;False;1255.028;381.48;Specular Color;9;924;1306;928;921;635;918;659;657;658;;1,1,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1193;-8171.414,-2797.975;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;554;-3990.392,1793.329;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1218;-7924.091,-2592.703;Inherit;False;Property;_VertexDebugColor;Vertex Debug Color;47;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;657;-3394.716,-1319.781;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-4216.623,-1866.634;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-4250.695,-2232.29;Inherit;False;Property;_ShadowLayer2Intensity;Shadow Layer 2 Intensity;24;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-3566.5,1741.062;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1431;-3748.426,3090.76;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1238;-7905.327,-2020.835;Inherit;False;Property;_ILMDebugColor;ILM Debug Color;50;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;100;-4585.199,1081.924;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-3407.518,-1534.678;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1232;-7913.632,-2218.188;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;1223;-7921.209,-2792.862;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.PowerNode;1338;-4005.128,2375.552;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-3916.939,-2123.771;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-3720.569,-1502.974;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;1432;-3603.877,3084.961;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1443;-3144.45,1675.794;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1245;-7292.611,-2432.858;Inherit;False;Property;_ILMChannel;ILM Channel;49;1;[Enum];Create;True;4;Red   Specular Intensity;0;Green   Shading Occlusion;1;Blue   Specular Mask;2;Alpha   Diffuse Mult for body lines;3;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1216;-7435.122,-2550.857;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-2475.279,1863.806;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;537;-3509.678,2400.686;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;659;-3162.575,-1356.311;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-4360.195,1064.924;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;546;-2480.081,1746.909;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1240;-7449.178,-3144.344;Inherit;False;Property;_VertexChannel;Vertex Channel;46;1;[Enum];Create;True;4;Red   Occlusion Shading;0;Green   Outline Thickness mask for Camera Distance Mult;1;Blue   Outline Mask;2;Alpha   Outline Thickness;3;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-3560.759,2056.873;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;35;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1237;-7308.985,-1930.435;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;573;-3301.125,1748.617;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1254;-8063.622,-1592.649;Inherit;False;Property;_BaseSSSAlphaColor;Base SSS Alpha Color;54;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;918;-2964.86,-1302.023;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-3033.608,-1481.561;Inherit;False;Property;_SpecularIntensity;Specular Intensity;28;0;Create;True;0;0;False;0;1;9.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1215;-7421.817,-2665.694;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1244;-7245.837,-2627.787;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;3;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;545;-3324.899,2402.813;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;686;-3032.073,1768.109;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1433;-3443.037,3103.77;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1015;-5095.98,-3260.473;Inherit;False;1426.213;820.0032;;10;457;14;217;1057;975;1116;1016;947;1122;974;Automatic Light System;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-3665.568,-2133.343;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-4207.196,1049.924;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;1444;-3177.603,2563.481;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1246;-7090.271,-1916.302;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;3;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;921;-2938.479,-1412.884;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1258;-8004.998,-1374.011;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;548;-2235.142,1829.276;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1236;-7312.042,-2063.13;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1057;-5070.71,-3211.54;Inherit;False;Property;_FakeLightFallbackDirToggle;Fake Light Fallback Dir Toggle;3;1;[Enum];Create;True;2;Fake Light Direction;0;View Direction;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-5006.71,-3051.54;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;12;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-3717.37,-1423.071;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-4367.617,-1749.946;Inherit;False;Property;_ShadowLayer1Intensity;Shadow Layer 1 Intensity;20;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-3980.895,1235.422;Float;False;Property;_MetalBIntensity;Metal B Intensity;11;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1242;-6975.938,-2825.787;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;928;-2750.517,-1460.49;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1259;-7663.72,-1726.337;Inherit;False;Property;_BaseSSSAlphaSwap;Base SSS Alpha Swap;53;1;[Enum];Create;True;2;Base Alpha   Fresnel Mask;0;SSS Alpha   Shadow Threshold;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1392;-2441.952,2500.288;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1116;-4976.409,-2631.839;Inherit;False;Property;_ViewDirOffsetX;View Dir Offset X;42;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-4976.409,-2551.839;Inherit;False;Property;_ViewDirOffsetY;View Dir Offset Y;43;0;Create;True;0;0;False;0;0;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;944;-1980.465,1767.567;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;998;-6033.309,-93.72997;Inherit;False;1127.255;736.3494;;9;1007;496;490;482;501;790;508;477;483;Permanent Shadows;0.6037736,0.5895336,0.5895336,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;444;-5007.134,-1530.948;Inherit;False;854.0317;283.3198;Detail;3;216;215;443;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;975;-4977.31,-2706.54;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;15;0;Create;True;0;0;False;0;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1378;-3145.5,2953.073;Inherit;False;Property;_FresnelSystem;Fresnel System;32;1;[Enum];Create;True;2;FighterZ;0;Granblue;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1452;-3221.655,3049.106;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;859;-2483.226,2311.408;Inherit;False;Property;_DarkHighlightMult;Dark Highlight Mult;37;0;Create;True;0;0;False;0;0.2392157,0.2392157,0.5294118,0;0.2392153,0.2392153,0.5294118,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1234;-7310.854,-2169.65;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1257;-7628.455,-1407.911;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-2863.6,1764.578;Inherit;False;Highlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-4990.71,-3131.54;Inherit;False;Property;_ForceFakeLight;Force Fake Light;0;1;[Enum];Create;True;2;No;0;Yes;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;718;-3123.113,2389.652;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;974;-4977.31,-2786.54;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;14;0;Create;True;0;0;False;0;35;38.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;103;-4062.197,1009.924;Inherit;True;Property;_MetalMatcap;Metal Matcap;9;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;104;-4001.195,918.8229;Float;False;Property;_MetalAIntensity;Metal A Intensity;10;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-3721.527,-1350.167;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1222;-7418.618,-2770.395;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1247;-6820.371,-2114.301;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;217;-4995.108,-2969.741;Float;False;Property;_FakeLightColor;Fake Light Color;13;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1255;-8048.644,-1691.727;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1306;-2587.076,-1520.276;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-5919.309,436.2713;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1248;-6614.073,-2248.501;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1241;-6769.64,-2959.987;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1256;-7609.085,-1625.846;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-5983.309,116.2702;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;27;0;Create;True;0;0;False;0;0.31;0.103;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-4957.134,-1464.912;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;790;-5903.309,516.2714;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1393;-2193.952,2369.288;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1229;-7311.575,-2277.698;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-5983.309,196.2703;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;29;0;Create;True;0;0;False;0;0.51;0.51;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1221;-7416.828,-2887.159;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;871;-3911.303,-1846.158;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-5983.309,-43.72997;Inherit;False;Property;_ILMLayer1;ILM Layer 1;25;0;Create;True;0;0;False;0;0.6;0.335;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1261;-7393.569,-1461.184;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1498;-4483.778,-3027.155;Inherit;False;Merged Light Function;-1;;480;6a9b492f5059fcf4aa61bcbd0dc72ff9;0;8;71;FLOAT;0;False;46;FLOAT;0;False;42;FLOAT;0;False;41;FLOAT4;0,0,0,0;False;38;FLOAT;0;False;39;FLOAT;0;False;99;FLOAT;0;False;100;FLOAT;0;False;2;COLOR;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-3725.19,1183.622;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-3729.896,1016.023;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1436;-2770.08,3003.912;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1387;-1801.646,1737.799;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-5887.309,356.2712;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-5887.309,276.2708;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-5983.309,36.26994;Inherit;False;Property;_ILMLayer2;ILM Layer 2;26;0;Create;True;0;0;False;0;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-3669.282,916.725;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1006;-4881.321,-1090.758;Inherit;False;1758.411;1891.205;;23;1395;1263;848;1396;1385;935;463;990;1290;471;467;465;989;734;455;1321;832;834;1000;926;1320;460;625;Shading System;0.4313726,0,0.7843137,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-3565.997,1086.024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-4039.617,-2954.416;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1381;-1593.97,1745.679;Inherit;False;HighlightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-3658.556,-1824.135;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1376;-2050.605,2336.304;Inherit;False;DarkHighlightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1380;-2876.849,2859.163;Inherit;False;FresnelSystem;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-2511.421,2993.542;Inherit;False;DarkenHighlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1249;-6344.514,-2403.277;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;924;-2419.457,-1512.253;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1239;-6500.081,-3114.763;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1260;-7138.102,-1621.003;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1007;-5442.675,121.4663;Inherit;False;Permanent Shadows;-1;;483;1ce4709ce3667c2438e413e9b79be23a;0;8;3;FLOAT;0;False;4;FLOAT;0;False;58;FLOAT;0;False;59;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;57;FLOAT4;0,0,0,0;False;34;FLOAT4;0,0,0,0;False;2;FLOAT;0;FLOAT;35
Node;AmplifyShaderEditor.SamplerNode;215;-4716.887,-1477.627;Inherit;True;Property;_Detail;Detail;7;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;a5bbaf07092aaf7408573c61d67adb44;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1385;-4716.429,406.8701;Inherit;False;1380;FresnelSystem;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4676.261,249.2441;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-4772.261,-470.7559;Inherit;False;Property;_ShadowLayer2Push;Shadow Layer 2 Push;21;0;Create;True;0;0;False;0;-0.3;-0.712;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1320;-4569.519,-74.59047;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1461;-3464.753,-2214.02;Inherit;True;Property;_GlowMask;Glow Mask;8;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1290;-4676.261,-790.7552;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1456;-3417.626,-2029.12;Inherit;False;Property;_GlowMaskIntensity;Glow Mask Intensity;58;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;848;-4716.429,566.8701;Inherit;False;1381;HighlightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4676.261,89.24409;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1253;-5975.554,-2470.118;Inherit;False;Property;_PIXELSNAP;PIXELSNAP;51;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-4772.261,-550.7559;Inherit;False;Property;_ShadowLayer1Fuzziness;Shadow Layer 1 Fuzziness;19;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;926;-4708.261,-870.7552;Inherit;False;924;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1395;-4736,720;Inherit;False;1376;DarkHighlightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-4772.261,-1030.755;Inherit;False;Property;_SpecularSize;Specular Size;30;0;Create;True;0;0;False;0;0.46;0.688;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-3399.995,1033.624;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;990;-4772.261,-390.7559;Inherit;False;Property;_ShadowLayer2Gate;Shadow Layer 2 Gate;22;0;Create;True;0;0;False;0;0.91;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;784;-3027.352,-538.8565;Inherit;False;593.0671;443.9203;Get those detail lines in and apply light color;4;513;512;515;514;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;1458;-3421.827,-1934.521;Inherit;False;Property;_GlowMaskTint;Glow Mask Tint;60;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-4058.203,-3045.825;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-4772.261,-710.7552;Inherit;False;Property;_ShadowLayer1Push;Shadow Layer 1 Push;17;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1396;-4716.429,646.8701;Inherit;False;538;DarkenHighlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1262;-6009.548,-1640.113;Inherit;False;Property;_COLORCOLOR;_COLORCOLOR;52;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4676.261,329.2442;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-3718.232,-1272.364;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1000;-4772.261,-630.7555;Inherit;False;Property;_ShadowLayer1Gate;Shadow Layer 1 Gate;18;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1321;-4584.935,-115.7036;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-4377.103,-1480.947;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-4692.261,-230.7558;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1462;-3395.82,-1750.044;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1252;-6112.622,-3053.384;Inherit;False;Property;_COLORADDSUBDIFF;_COLORADDSUBDIFF;45;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-4708.261,9.244186;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-4772.261,-950.7552;Inherit;False;Property;_SpecularFuzzy;Specular Fuzzy;31;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;989;-4676.261,169.2441;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4772.261,-310.7558;Inherit;False;Property;_ShadowLayer2Fuzziness;Shadow Layer 2 Fuzziness;23;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1263;-4684.429,486.8701;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-2966.352,-350.9365;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-2966,-270.0417;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-2976.077,-488.8565;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1455;-3079.826,-1951.121;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;785;-2389.593,-509.1195;Inherit;False;550.6119;260.1823;Enable Metal Matcap;2;1095;521;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1250;-5661.549,-2495.223;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-3246.866,1034.442;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1501;-3616.629,-476.5756;Inherit;False;Shading System;-1;;488;1670eb1c79b726744983c09eed1d95d8;0;23;86;FLOAT;0;False;87;FLOAT;0;False;91;COLOR;0,0,0,0;False;92;FLOAT;0;False;35;FLOAT;0;False;46;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;47;FLOAT;0;False;48;FLOAT;0;False;37;FLOAT;0;False;38;FLOAT;0;False;39;FLOAT;0;False;36;FLOAT4;0,0,0,0;False;41;FLOAT4;0,0,0,0;False;40;FLOAT;0;False;42;COLOR;0,0,0,0;False;43;COLOR;0,0,0,0;False;105;FLOAT;0;False;97;FLOAT;0;False;111;COLOR;0,0,0,0;False;106;FLOAT;0;False;112;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-2624.087,-436.2752;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1457;-2818.427,-1972.121;Inherit;False;Property;_FADE;_FADE;59;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1214;-5503.616,-2500.24;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-2368.178,-362.6326;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1264;-1317.37,-495.1135;Inherit;False;571.0603;277.1415;Debug System Toggle;2;1175;1209;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1092;-1938.243,58.57975;Inherit;False;1288.648;811.6423;;8;1087;1089;1171;1161;1174;1082;1085;1466;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1161;-1831.337,381.867;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1095;-2146.107,-437.1112;Inherit;False;Property;_METALLICGLOSSMAP;_METALLICGLOSSMAP;41;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;246;-700.1695,-714.7246;Inherit;False;554.1174;504.4;;2;0;1459;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1171;-1892.36,305.2689;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;57;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1454;-2555.626,-1968.321;Inherit;False;GlowMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1089;-1808.403,212.1572;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1174;-1826.94,468.1592;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1085;-1559.027,659.215;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;56;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1466;-1555.319,736.544;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;61;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1209;-1267.37,-332.572;Inherit;False;1214;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1087;-1597.742,107.4359;Inherit;False;Property;_EnableOutline;Enable Outline;55;1;[Enum];Create;True;2;Disable;0;Yes I am lazy and want ugly outlines;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1082;-1828.447,547.4781;Inherit;False;Property;_OutlineColor;Outline Color;1;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1459;-656.4932,-626.2266;Inherit;False;1454;GlowMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1175;-1010.309,-445.1135;Inherit;False;Property;_ALPHABLEND;Enable Debug;44;0;Create;False;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1468;-1111.61,329.3792;Inherit;False;ASWOutline;-1;;491;ea9f2d47913480c4f9e91454af7efa45;0;8;30;FLOAT;0;False;31;COLOR;0,0,0,0;False;32;FLOAT;0;False;33;FLOAT;0;False;34;COLOR;0,0,0,0;False;35;COLOR;0,0,0,0;False;36;FLOAT;0;False;37;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-410.0485,-664.7245;Float;False;True;-1;2;ASWShaderGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light v6.7.2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;1;RenderType=Opaque;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;1331;-6025.554,-2520.118;Inherit;False;279;188;Enable ILM Color Debug;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1332;-6059.548,-1690.113;Inherit;False;292;188;Enable Base SSS Alpha Debug;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1330;-6162.622,-3103.384;Inherit;False;332;188;Enable Vertex Color Debug;0;;1,1,1,1;0;0
WireConnection;850;0;182;4
WireConnection;987;0;152;4
WireConnection;700;0;578;0
WireConnection;700;1;701;0
WireConnection;231;0;142;3
WireConnection;231;1;142;2
WireConnection;231;2;142;1
WireConnection;231;3;142;4
WireConnection;1499;0;1500;0
WireConnection;1067;0;1062;0
WireConnection;1067;2;231;0
WireConnection;1067;3;142;0
WireConnection;550;4;1499;0
WireConnection;550;2;700;0
WireConnection;550;3;553;0
WireConnection;1339;0;701;0
WireConnection;1339;1;1340;0
WireConnection;1334;4;1499;0
WireConnection;1334;2;1339;0
WireConnection;1334;3;553;0
WireConnection;1428;0;1340;0
WireConnection;1428;1;1427;0
WireConnection;441;0;1067;0
WireConnection;517;0;518;0
WireConnection;517;1;152;0
WireConnection;683;0;550;0
WireConnection;1231;0;113;0
WireConnection;183;0;182;0
WireConnection;440;0;517;0
WireConnection;98;0;97;0
WireConnection;1430;2;1428;0
WireConnection;1430;3;1429;0
WireConnection;1336;0;1334;0
WireConnection;554;0;683;0
WireConnection;554;1;604;0
WireConnection;449;0;440;0
WireConnection;449;1;183;0
WireConnection;549;0;1094;0
WireConnection;549;1;554;0
WireConnection;1431;0;1430;0
WireConnection;100;0;98;0
WireConnection;1232;0;1227;0
WireConnection;1223;0;1193;0
WireConnection;1338;0;1336;0
WireConnection;1338;1;604;0
WireConnection;447;0;543;0
WireConnection;447;1;440;0
WireConnection;447;2;449;0
WireConnection;119;0;113;1
WireConnection;1432;0;1431;0
WireConnection;1443;0;578;0
WireConnection;1216;0;1223;3
WireConnection;1216;1;1218;0
WireConnection;537;0;1094;0
WireConnection;537;1;1338;0
WireConnection;659;0;658;0
WireConnection;659;1;657;0
WireConnection;101;1;100;0
WireConnection;1237;0;1232;3
WireConnection;1237;1;1238;0
WireConnection;573;0;549;0
WireConnection;1215;0;1223;2
WireConnection;1215;1;1218;0
WireConnection;1244;0;1240;0
WireConnection;1244;2;1216;0
WireConnection;545;0;537;0
WireConnection;686;0;1443;0
WireConnection;686;1;573;0
WireConnection;686;2;685;0
WireConnection;1433;0;1432;0
WireConnection;448;0;447;0
WireConnection;102;1;101;0
WireConnection;1444;0;1340;0
WireConnection;1246;0;1245;0
WireConnection;1246;2;1237;0
WireConnection;921;0;658;0
WireConnection;921;1;659;0
WireConnection;548;0;546;0
WireConnection;548;1;547;0
WireConnection;1236;0;1232;2
WireConnection;1236;1;1238;0
WireConnection;360;0;113;2
WireConnection;1242;0;1240;0
WireConnection;1242;2;1215;0
WireConnection;1242;3;1244;0
WireConnection;928;0;635;0
WireConnection;928;1;921;0
WireConnection;928;2;918;0
WireConnection;944;0;546;0
WireConnection;944;1;548;0
WireConnection;1452;0;1094;0
WireConnection;1452;3;1433;0
WireConnection;1234;0;1232;1
WireConnection;1234;1;1238;0
WireConnection;1257;0;1258;0
WireConnection;1257;1;1254;0
WireConnection;555;0;686;0
WireConnection;718;0;685;0
WireConnection;718;1;545;0
WireConnection;718;2;1444;0
WireConnection;103;1;102;0
WireConnection;117;0;113;3
WireConnection;1222;0;1223;1
WireConnection;1222;1;1218;0
WireConnection;1247;0;1245;0
WireConnection;1247;2;1236;0
WireConnection;1247;3;1246;0
WireConnection;1306;0;658;0
WireConnection;1306;1;928;0
WireConnection;1248;0;1245;0
WireConnection;1248;2;1234;0
WireConnection;1248;3;1247;0
WireConnection;1241;0;1240;0
WireConnection;1241;2;1222;0
WireConnection;1241;3;1242;0
WireConnection;1256;0;1255;0
WireConnection;1256;1;1254;0
WireConnection;1393;0;859;0
WireConnection;1393;1;1392;0
WireConnection;1229;0;1232;0
WireConnection;1229;1;1238;0
WireConnection;1221;0;1223;0
WireConnection;1221;1;1218;0
WireConnection;871;0;449;0
WireConnection;871;1;870;0
WireConnection;1261;0;1259;0
WireConnection;1261;2;1257;0
WireConnection;1498;71;1057;0
WireConnection;1498;46;1016;0
WireConnection;1498;42;947;0
WireConnection;1498;41;217;0
WireConnection;1498;38;974;0
WireConnection;1498;39;975;0
WireConnection;1498;99;1116;0
WireConnection;1498;100;1122;0
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;1436;0;1378;0
WireConnection;1436;2;718;0
WireConnection;1436;3;1452;0
WireConnection;1387;0;546;0
WireConnection;1387;1;944;0
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;14;0;1498;2
WireConnection;1381;0;1387;0
WireConnection;451;0;871;0
WireConnection;1376;0;1393;0
WireConnection;1380;0;1378;0
WireConnection;538;0;1436;0
WireConnection;1249;0;1245;0
WireConnection;1249;2;1229;0
WireConnection;1249;3;1248;0
WireConnection;924;0;1306;0
WireConnection;1239;0;1240;0
WireConnection;1239;2;1221;0
WireConnection;1239;3;1241;0
WireConnection;1260;0;1259;0
WireConnection;1260;2;1256;0
WireConnection;1260;3;1261;0
WireConnection;1007;3;482;0
WireConnection;1007;4;490;0
WireConnection;1007;58;501;0
WireConnection;1007;59;508;0
WireConnection;1007;1;477;0
WireConnection;1007;2;483;0
WireConnection;1007;57;496;0
WireConnection;1007;34;790;0
WireConnection;215;1;216;0
WireConnection;1320;0;1007;35
WireConnection;1253;1;1249;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;457;0;1498;1
WireConnection;1262;1;1260;0
WireConnection;118;0;113;4
WireConnection;1321;0;1007;0
WireConnection;443;0;215;0
WireConnection;1252;1;1239;0
WireConnection;1455;0;1461;0
WireConnection;1455;1;1456;0
WireConnection;1455;2;1458;0
WireConnection;1455;3;1462;0
WireConnection;1250;0;1252;0
WireConnection;1250;1;1253;0
WireConnection;1250;2;1262;0
WireConnection;111;0;110;0
WireConnection;1501;86;625;0
WireConnection;1501;87;935;0
WireConnection;1501;91;926;0
WireConnection;1501;92;1290;0
WireConnection;1501;35;460;0
WireConnection;1501;46;1000;0
WireConnection;1501;49;834;0
WireConnection;1501;50;467;0
WireConnection;1501;47;990;0
WireConnection;1501;48;832;0
WireConnection;1501;37;734;0
WireConnection;1501;38;1321;0
WireConnection;1501;39;1320;0
WireConnection;1501;36;471;0
WireConnection;1501;41;455;0
WireConnection;1501;40;989;0
WireConnection;1501;42;463;0
WireConnection;1501;43;465;0
WireConnection;1501;105;1385;0
WireConnection;1501;97;1263;0
WireConnection;1501;111;848;0
WireConnection;1501;106;1396;0
WireConnection;1501;112;1395;0
WireConnection;513;0;515;0
WireConnection;513;1;1501;0
WireConnection;513;2;512;0
WireConnection;513;3;514;0
WireConnection;1457;1;1455;0
WireConnection;1214;0;1250;0
WireConnection;1095;0;513;0
WireConnection;1095;1;521;0
WireConnection;1454;0;1457;0
WireConnection;1175;1;1095;0
WireConnection;1175;0;1209;0
WireConnection;1468;30;1087;0
WireConnection;1468;31;1089;0
WireConnection;1468;32;1171;0
WireConnection;1468;33;1161;0
WireConnection;1468;34;1174;0
WireConnection;1468;35;1082;0
WireConnection;1468;36;1085;0
WireConnection;1468;37;1466;0
WireConnection;0;2;1459;0
WireConnection;0;13;1175;0
WireConnection;0;11;1468;0
ASEEND*/
//CHKSM=B5383CBBDA313E5BBDFCD5BB8821263295BC7D4C
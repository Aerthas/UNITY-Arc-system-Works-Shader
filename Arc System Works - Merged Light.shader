// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light v6.5.2"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[Enum(No,0,Yes,1)]_ForceFakeLight("Force Fake Light", Float) = 0
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 2
		[Enum(Fake Light Direction,0,View Direction,1)]_FakeLightFallbackDirToggle("Fake Light Fallback Dir Toggle", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[Enum(Disable,0,Enable,1)]_EnableBaseColorMult("Enable Base Color Mult", Float) = 0
		[Enum(Disable,0,Enable,1)]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 0
		_DepthMultClamp("Depth Mult Clamp", Float) = 2
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		_CameraDepthMult("Camera Depth Mult", Float) = 2
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[NoScaleOffset]_Detail("Detail", 2D) = "white" {}
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
		_HighlightPower("Highlight Power", Float) = 5
		_HighlightFreselFuzzy("Highlight Fresel Fuzzy", Float) = 0.01
		_HighlightIntensity("Highlight Intensity", Float) = 1
		_HighlightScale("Highlight Scale", Float) = 1
		_GranblueFresnelPower("Granblue Fresnel Power", Float) = 1.77
		_GranblueFresnelScale("Granblue Fresnel Scale", Float) = 1.77
		_DarkHighlightMult("Dark Highlight Mult", Color) = (0.2392157,0.2392157,0.5294118,0)
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[Enum(Disable,0,Yes I am lazy and want ugly outlines,1)]_EnableOutline("Enable Outline", Float) = 0
		[Toggle]_FADING("_FADING", Float) = 1
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
			float4 appendResult231 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 VertexColors441 = (( _WrongVertexColors > 0.0 ) ? appendResult231 :  v.color );
			float4 break1163 = VertexColors441;
			float temp_output_1164_0 = ( (( _EnableCameraDistanceMult == 1.0 ) ? 5.0 :  1.0 ) * 1E-05 * _OutlineThickness * break1163.z * break1163.w );
			float clampResult1170 = clamp( ( eyeDepth * _CameraDepthMult * temp_output_1164_0 * break1163.y ) , 0.0 , ( _DepthMultClamp * temp_output_1164_0 ) );
			float outlineVar = (( _EnableCameraDistanceMult > 0.0 ) ? clampResult1170 :  temp_output_1164_0 );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float4 Base183 = tex2DNode182;
			o.Emission = (( _EnableBaseColorMult > 0.0 ) ? ( _OutlineColor * Base183 ) :  _OutlineColor ).rgb;
			clip( (( _EnableOutline > 0.0 ) ? 1.0 :  0.0 ) - _Cutoff );
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
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
			float3 worldPos;
			float3 worldNormal;
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float3 viewDir;
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

		uniform float _METALLICGLOSSMAP;
		uniform float _ForceFakeLight;
		uniform float4 _FakeLightColor;
		uniform float _FakeLightIntensity;
		uniform float _HighlightIntensity;
		uniform float _COLOROVERLAY;
		uniform float _HighlightScale;
		uniform sampler2D _Base;
		uniform float _HighlightPower;
		uniform float _HighlightFreselFuzzy;
		uniform float4 _DarkHighlightMult;
		uniform float _ShadowLayer2Intensity;
		uniform sampler2D _SSS;
		uniform float _ShadowBrightness;
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
		uniform float _FADING;
		uniform float _GranblueFresnelScale;
		uniform float _GranblueFresnelPower;
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
		uniform float _CameraDepthMult;
		uniform float _OutlineThickness;
		uniform float _DepthMultClamp;
		uniform float _EnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform float _EnableOutline;
		uniform float _Cutoff = 0.5;

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
			float temp_output_73_0_g250 = (( _ForceFakeLight > 0.0 ) ? 0.0 :  (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 ) );
			float4 LightColor457 = (( temp_output_73_0_g250 > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float BaseAlpha850 = tex2DNode182.a;
			float fresnelNdotV550 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode550 = ( -0.180914 + ( _HighlightScale * BaseAlpha850 ) * pow( 1.0 - fresnelNdotV550, _HighlightPower ) );
			float4 clampResult545 = clamp( ( (( _COLOROVERLAY )?( pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ):( 0.0 )) * _DarkHighlightMult * LightColor457 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ShadowHighlight538 = ( _HighlightIntensity * clampResult545 );
			float2 uv_SSS152 = i.uv_texcoord;
			float4 tex2DNode152 = tex2D( _SSS, uv_SSS152 );
			float4 SSS440 = ( tex2DNode152 * _ShadowBrightness );
			float4 Base183 = tex2DNode182;
			float4 temp_output_449_0 = ( SSS440 * Base183 );
			float4 SSS2448 = ( ShadowHighlight538 + ( _ShadowLayer2Intensity * SSS440 * temp_output_449_0 ) );
			float4 BaseSSS451 = ( temp_output_449_0 * _ShadowLayer1Intensity );
			float4 appendResult231 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 VertexColors441 = (( _WrongVertexColors > 0.0 ) ? appendResult231 :  i.vertexColor );
			float2 appendResult15_g252 = (float2(( cos( ( ( _ViewDirOffsetX / 180.0 ) * UNITY_PI ) ) * sin( ( ( ( _ViewDirOffsetY + 180.0 ) / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _ViewDirOffsetX / 180.0 ) * UNITY_PI ) )));
			float3 normalizeResult2_g252 = normalize( (i.viewDir*( cos( ( ( _ViewDirOffsetX / 180.0 ) * UNITY_PI ) ) * cos( ( ( ( _ViewDirOffsetY + 180.0 ) / 180.0 ) * UNITY_PI ) ) * -1.0 ) + float3( appendResult15_g252 ,  0.0 )) );
			float3 appendResult15_g251 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
			float3 normalizeResult2_g251 = normalize( appendResult15_g251 );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult28_g250 = dot( (( temp_output_73_0_g250 > 0.0 ) ? ase_worldlightDir :  (( _FakeLightFallbackDirToggle > 0.0 ) ? normalizeResult2_g252 :  normalizeResult2_g251 ) ) , ase_normWorldNormal );
			float DefaultDot14 = dotResult28_g250;
			float temp_output_37_0_g327 = DefaultDot14;
			float SSSAlpha987 = tex2DNode152.a;
			float temp_output_40_0_g327 = SSSAlpha987;
			float ifLocalVar5_g329 = 0;
			if( temp_output_40_0_g327 >= ( 1.0 - _ShadowLayer1Gate ) )
				ifLocalVar5_g329 = 1.0;
			float lerpResult8_g329 = lerp( 1.0 , ( ( -1.0 + VertexColors441.x + temp_output_37_0_g327 ) - _ShadowLayer1Push ) , ifLocalVar5_g329);
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMG360 = tex2DNode113.g;
			float temp_output_1_0_g249 = ILMG360;
			float temp_output_20_0_g249 = ( 1.0 - ( 0.62 * temp_output_1_0_g249 ) );
			float ILMB117 = tex2DNode113.b;
			float4 color12_g249 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 blendOpSrc548 = Base183;
			float4 blendOpDest548 = SSS440;
			float4 clampResult573 = clamp( ( ( Base183 + ( saturate( (( blendOpSrc548 > 0.5 ) ? max( blendOpDest548, 2.0 * ( blendOpSrc548 - 0.5 ) ) : min( blendOpDest548, 2.0 * blendOpSrc548 ) ) )) ) * (( _COLOROVERLAY )?( pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ):( 0.0 )) * LightColor457 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 Highlight555 = ( clampResult573 * _HighlightIntensity );
			float4 temp_output_34_0_g249 = Highlight555;
			float4 temp_output_22_0_g249 = ( ( ILMB117 * 0.4 ) + ( color12_g249 + temp_output_34_0_g249 ) );
			float4 ifLocalVar24_g249 = 0;
			if( ( ( ( 1.0 - _ILMLayer1 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g249 )
				ifLocalVar24_g249 = temp_output_22_0_g249;
			float4 clampResult26_g249 = clamp( ifLocalVar24_g249 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_44_0_g249 = ( 1.0 - VertexColors441.x );
			float4 color39_g249 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_46_0_g249 = ( ( temp_output_1_0_g249 * 0.4 ) + ( temp_output_34_0_g249 + color39_g249 ) );
			float4 ifLocalVar49_g249 = 0;
			if( _VertexLayer1 >= temp_output_44_0_g249 )
				ifLocalVar49_g249 = temp_output_46_0_g249;
			float4 clampResult51_g249 = clamp( ifLocalVar49_g249 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_38_0_g327 = ( clampResult26_g249.r * clampResult51_g249.x );
			float smoothstepResult23_g327 = smoothstep( 0.0 , ( _ShadowLayer1Fuzziness * 0.01 ) , ( lerpResult8_g329 * temp_output_38_0_g327 ));
			float4 lerpResult26_g327 = lerp( BaseSSS451 , Base183 , smoothstepResult23_g327);
			float ifLocalVar5_g328 = 0;
			if( temp_output_40_0_g327 >= ( 1.0 - _ShadowLayer2Gate ) )
				ifLocalVar5_g328 = 1.0;
			float lerpResult8_g328 = lerp( 1.0 , ( temp_output_37_0_g327 - _ShadowLayer2Push ) , ifLocalVar5_g328);
			float4 ifLocalVar23_g249 = 0;
			if( ( ( ( 1.0 - _ILMLayer2 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g249 )
				ifLocalVar23_g249 = temp_output_22_0_g249;
			float4 clampResult25_g249 = clamp( ifLocalVar23_g249 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ifLocalVar50_g249 = 0;
			if( _VertexLayer2 >= temp_output_44_0_g249 )
				ifLocalVar50_g249 = temp_output_46_0_g249;
			float4 clampResult52_g249 = clamp( ifLocalVar50_g249 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float temp_output_39_0_g327 = ( clampResult25_g249.r * clampResult52_g249.x );
			float smoothstepResult25_g327 = smoothstep( 0.0 , ( _ShadowLayer2Fuzziness * 0.01 ) , ( lerpResult8_g328 * temp_output_39_0_g327 ));
			float4 lerpResult28_g327 = lerp( SSS2448 , lerpResult26_g327 , smoothstepResult25_g327);
			float4 blendOpSrc659 = Base183;
			float4 blendOpDest659 = SSS440;
			float ILMR119 = tex2DNode113.r;
			float4 SpecularColor924 = ( Base183 + ( _SpecularIntensity * ( Base183 + ( saturate( (( blendOpSrc659 > 0.5 ) ? max( blendOpDest659, 2.0 * ( blendOpSrc659 - 0.5 ) ) : min( blendOpDest659, 2.0 * blendOpSrc659 ) ) )) ) * ILMR119 ) );
			float smoothstepResult82_g327 = smoothstep( 0.0 , ( _SpecularFuzzy * 0.01 ) , ( ( ( 1.0 - ( ( _SpecularSize * 4.0 ) - 2.0 ) ) * -0.2 ) + ( ILMB117 * temp_output_37_0_g327 * temp_output_38_0_g327 * temp_output_39_0_g327 ) ));
			float4 lerpResult58_g327 = lerp( lerpResult28_g327 , SpecularColor924 , smoothstepResult82_g327);
			float4 clampResult33_g327 = clamp( lerpResult58_g327 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float ILMA118 = tex2DNode113.a;
			float4 Detail443 = tex2D( _Detail, i.uv2_texcoord2 );
			float fresnelNdotV841 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode841 = ( 0.0 + ( BaseAlpha850 * _GranblueFresnelScale ) * pow( 1.0 - fresnelNdotV841, _GranblueFresnelPower ) );
			float clampResult858 = clamp( saturate( fresnelNode841 ) , 0.0 , 1.0 );
			float GranblueFresnel846 = (( _FADING )?( ( 1.0 - clampResult858 ) ):( 1.0 ));
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
				float4 staticSwitch1175 = ( (( _METALLICGLOSSMAP )?( MetalMatCap111 ):( ( LightColor457 * clampResult33_g327 * ILMA118 * Detail443 * GranblueFresnel846 ) )) + Highlight555 );
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
				surfIN.viewDir = worldViewDir;
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
2291;72;1598;839;2947.955;-126.2121;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;516;-5124.283,-2233.023;Inherit;False;3064.604;1228.404;;20;448;451;574;871;447;575;444;870;543;449;987;938;112;440;183;517;518;152;850;182;Color Information;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1298;-5123.827,1429.115;Inherit;False;2612.388;1915.041;;3;578;860;806;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;182;-4999,-1771.017;Inherit;True;Property;_Base;Base;4;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;94f62562165c70445bd0baf0d45e8ffb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;806;-5045.57,1479.115;Inherit;False;2502.946;1228.72;Highlight Fresnel;12;805;685;554;683;604;801;550;553;551;700;701;1094;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;-4695.247,-1646.085;Inherit;False;BaseAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-4995.57,2136.772;Inherit;False;Property;_HighlightScale;Highlight Scale;38;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-5073.827,2533.884;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1015;-5095.98,-3260.473;Inherit;False;1426.213;820.0032;;11;1146;457;14;217;1057;975;1116;1016;947;1122;974;Automatic Light System;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;152;-5101.268,-2088.782;Inherit;True;Property;_SSS;SSS;10;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;ddbf52e1b320f55488bba42278293a3d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;518;-5087.396,-1888.258;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;19;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-4684.077,1966.998;Inherit;False;Constant;_HighlightBias;Highlight Bias;28;0;Create;True;0;0;False;0;-0.180914;-0.180914;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;553;-4676.179,2195.397;Inherit;False;Property;_HighlightPower;Highlight Power;35;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;700;-4648.57,2047.772;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-4995.108,-2969.741;Float;False;Property;_FakeLightColor;Fake Light Color;16;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-4775.708,-2008.811;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1116;-4976.409,-2631.839;Inherit;False;Property;_ViewDirOffsetX;View Dir Offset X;46;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;974;-4977.31,-2786.54;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;17;0;Create;True;0;0;False;0;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-4976.409,-2551.839;Inherit;False;Property;_ViewDirOffsetY;View Dir Offset Y;47;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-4990.71,-3131.54;Inherit;False;Property;_ForceFakeLight;Force Fake Light;0;1;[Enum];Create;True;2;No;0;Yes;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;-4977.31,-2706.54;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;18;0;Create;True;0;0;False;0;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;550;-4407.74,1987.251;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;304;-3469.42,-2781.076;Inherit;False;978.1387;333.6884;;5;441;231;142;1062;1067;Vertex Colors fix;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1057;-5070.71,-3211.54;Inherit;False;Property;_FakeLightFallbackDirToggle;Fake Light Fallback Dir Toggle;3;1;[Enum];Create;True;2;Fake Light Direction;0;View Direction;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-5006.71,-3051.54;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;15;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-4633.958,-1998.942;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;801;-4240.025,1529.115;Inherit;False;1633.612;401.5834;Fresnel for Lit areas;9;549;573;555;686;944;548;546;547;1313;;1,1,1,1;0;0
Node;AmplifyShaderEditor.VertexColorNode;142;-3418.514,-2648.115;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-4663.479,-1769.405;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-4179.576,2072.659;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;36;0;Create;True;0;0;False;0;0.01;0.93;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1146;-4483.778,-3027.155;Inherit;False;Merged Light Function;-1;;250;6a9b492f5059fcf4aa61bcbd0dc72ff9;0;8;71;FLOAT;0;False;46;FLOAT;0;False;42;FLOAT;0;False;41;FLOAT4;0,0,0,0;False;38;FLOAT;0;False;39;FLOAT;0;False;99;FLOAT;0;False;100;FLOAT;0;False;2;COLOR;1;FLOAT;2
Node;AmplifyShaderEditor.SaturateNode;683;-4133.704,2002.005;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;805;-3860.723,2216.641;Inherit;False;1269.888;457.5711;Fresnel for Darker areas;5;538;718;545;537;859;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;231;-3199.356,-2606.13;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;112;-4041.024,-1532.8;Inherit;False;585.331;428.9513;ILM Information;6;113;118;117;119;360;1231;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-4058.203,-3045.825;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;96;-5050.922,771.8759;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1062;-3369.741,-2741.282;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;42;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;546;-4190.025,1579.115;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-4185.222,1696.012;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;554;-3930.942,2011.598;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;113;-4016.626,-1410.067;Inherit;True;Property;_ILM;ILM;8;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;432249f8f3a302c44ab7f503f89027c3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;1094;-3764.252,1990.622;Inherit;False;Property;_COLOROVERLAY;_COLOROVERLAY;52;0;Create;True;0;0;False;0;1;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1067;-3010.741,-2694.282;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldNormalVector;97;-5000.923,991.0759;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;859;-3767.785,2482.9;Inherit;False;Property;_DarkHighlightMult;Dark Highlight Mult;41;0;Create;True;0;0;False;0;0.2392157,0.2392157,0.5294118,0;0.2392139,0.2392139,0.5294118,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1313;-3828.039,1825.301;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;548;-3945.083,1661.482;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;860;-4615.432,2813.54;Inherit;False;1792.148;420.865;Granblue Black Fresnel;9;844;849;842;841;857;858;856;846;1093;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;944;-3713.406,1601.773;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;537;-3485.473,2393.77;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-2718.492,-2703.581;Inherit;False;VertexColors;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TransformDirectionNode;98;-4809.982,986.5779;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;1265;-8229.099,-3194.344;Inherit;False;2968.486;1935.334;;37;1227;1238;1232;1245;1237;1246;1236;1234;1247;1248;1229;1249;1253;1250;1214;1216;1193;1218;1223;1240;1244;1215;1242;1222;1241;1221;1239;1252;1254;1258;1259;1257;1255;1261;1256;1260;1262;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;844;-4567.397,2967.731;Inherit;False;Property;_GranblueFresnelScale;Granblue Fresnel Scale;40;0;Create;True;0;0;False;0;1.77;1.77;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;938;-3415.111,-1486.045;Inherit;False;1255.028;381.48;Specular Color;9;924;1306;928;921;635;918;659;657;658;;1,1,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1231;-3687.852,-1487.615;Inherit;False;ILM;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-3445.029,2022.613;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;37;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;100;-4581.928,987.0759;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-4527.32,3119.404;Inherit;False;Property;_GranblueFresnelPower;Granblue Fresnel Power;39;0;Create;True;0;0;False;0;1.77;1.77;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-3372.112,-1446.162;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1227;-8179.099,-2227.627;Inherit;False;1231;ILM;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;545;-3300.693,2395.897;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-3359.31,-1231.265;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1193;-8171.414,-2797.975;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-3487.058,1646.899;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;849;-4247.723,2946.771;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-4356.925,970.076;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-3685.163,-1414.458;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1218;-7924.091,-2592.703;Inherit;False;Property;_VertexDebugColor;Vertex Debug Color;51;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;841;-4081.95,2967.83;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1232;-7913.632,-2218.188;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;1223;-7921.209,-2792.862;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BlendOpsNode;659;-3127.169,-1267.795;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;718;-3098.907,2382.736;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;573;-3171.678,1720.953;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1238;-7905.327,-2020.835;Inherit;False;Property;_ILMDebugColor;ILM Debug Color;54;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-4203.926,955.076;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;921;-2903.073,-1324.368;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1245;-7292.611,-2432.858;Inherit;False;Property;_ILMChannel;ILM Channel;53;1;[Enum];Create;True;4;Red   Specular Intensity;0;Green   Shading Occlusion;1;Blue   Specular Mask;2;Alpha   Diffuse Mult for body lines;3;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;686;-3005.857,1720.996;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1237;-7308.985,-1930.435;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;918;-2929.454,-1213.507;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;857;-3849.605,2967.667;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1240;-7449.178,-3144.344;Inherit;False;Property;_VertexChannel;Vertex Channel;50;1;[Enum];Create;True;4;Red   Occlusion Shading;0;Green   Outline Thickness mask for Camera Distance Mult;1;Blue   Outline Mask;2;Alpha   Outline Thickness;3;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-2828.847,2377.282;Inherit;False;ShadowHighlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-2998.202,-1393.045;Inherit;False;Property;_SpecularIntensity;Specular Intensity;31;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-4181.217,-1778.118;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1216;-7435.122,-2550.857;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;-4762.101,-1878.052;Inherit;False;SSSAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-4467.289,-2088.774;Inherit;False;Property;_ShadowLayer2Intensity;Shadow Layer 2 Intensity;27;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1246;-7090.271,-1916.302;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;3;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-2823.317,1713.445;Inherit;False;Highlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;998;-6033.309,-93.72997;Inherit;False;1127.255;736.3494;;9;1007;496;490;482;501;790;508;477;483;Permanent Shadows;0.6037736,0.5895336,0.5895336,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-3686.121,-1261.651;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-4332.211,-1661.43;Inherit;False;Property;_ShadowLayer1Intensity;Shadow Layer 1 Intensity;23;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;858;-3705.056,2961.868;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-3681.964,-1334.555;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;103;-4058.926,915.0759;Inherit;True;Property;_MetalMatcap;Metal Matcap;12;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;104;-3997.924,823.9747;Float;False;Property;_MetalAIntensity;Metal A Intensity;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-3881.533,-2035.255;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;575;-3901.365,-2123.991;Inherit;False;538;ShadowHighlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1236;-7312.042,-2063.13;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1244;-7245.837,-2627.787;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;3;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;928;-2715.111,-1371.974;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1254;-8063.622,-1592.649;Inherit;False;Property;_BaseSSSAlphaColor;Base SSS Alpha Color;58;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1215;-7421.817,-2665.694;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-3977.624,1140.574;Float;False;Property;_MetalBIntensity;Metal B Intensity;14;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1258;-8004.998,-1374.011;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;444;-4971.728,-1442.432;Inherit;False;854.0317;283.3198;Detail;3;216;215;443;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-5983.309,-43.72997;Inherit;False;Property;_ILMLayer1;ILM Layer 1;28;0;Create;True;0;0;False;0;0.6;0.335;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;790;-5903.309,516.2714;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1092;-2725.68,60.91675;Inherit;False;2300.723;961.4541;;23;1269;1266;1169;1167;1268;1267;1171;1164;1165;1168;1081;1086;1172;1088;1085;1170;1087;1084;1089;1082;1161;1163;1174;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-5887.309,356.2712;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1234;-7310.854,-2169.65;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-5919.309,436.2713;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1247;-6820.371,-2114.301;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-5887.309,276.2708;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-5983.309,36.26994;Inherit;False;Property;_ILMLayer2;ILM Layer 2;29;0;Create;True;0;0;False;0;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-5983.309,116.2702;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;30;0;Create;True;0;0;False;0;0.31;0.254;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1257;-7628.455,-1407.911;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1255;-8048.644,-1691.727;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1259;-7663.72,-1726.337;Inherit;False;Property;_BaseSSSAlphaSwap;Base SSS Alpha Swap;57;1;[Enum];Create;True;2;Base Alpha   Fresnel Mask;0;SSS Alpha   Shadow Threshold;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;856;-3563.73,2962.52;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;574;-3553.805,-2046.046;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1306;-2551.67,-1431.76;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1222;-7418.618,-2770.395;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-3721.92,1088.774;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;871;-3990.897,-1763.642;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-4921.728,-1376.396;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareEqual;1242;-6975.938,-2825.787;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-5983.309,196.2703;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;32;0;Create;True;0;0;False;0;0.51;0.51;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-3726.626,921.1748;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-3801.15,-1777.619;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-4039.617,-2954.416;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1007;-5442.675,121.4663;Inherit;False;Permanent Shadows;-1;;249;1ce4709ce3667c2438e413e9b79be23a;0;8;3;FLOAT;0;False;4;FLOAT;0;False;58;FLOAT;0;False;59;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;57;FLOAT4;0,0,0,0;False;34;FLOAT4;0,0,0,0;False;2;FLOAT;0;FLOAT;35
Node;AmplifyShaderEditor.GetLocalVarNode;108;-3666.012,821.8768;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1248;-6614.073,-2248.501;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1241;-6769.64,-2959.987;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;924;-2384.051,-1423.737;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1174;-2654.25,810.576;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1171;-2683.5,495.6471;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;6;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1093;-3372.913,2933.607;Inherit;False;Property;_FADING;_FADING;44;0;Create;True;0;0;False;0;1;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1256;-7609.085,-1625.846;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1221;-7416.828,-2887.159;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1261;-7393.569,-1461.184;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1229;-7311.575,-2277.698;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1006;-4845.06,-892.002;Inherit;False;1341.668;1515.196;;16;465;625;935;926;1290;1000;832;834;989;467;734;471;463;990;455;460;Shading System;0.4313726,0,0.7843137,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-3391.162,-2036.827;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;215;-4681.481,-1389.111;Inherit;True;Property;_Detail;Detail;11;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;f3f85fc8914e5b14e95f6eb51da0aeb3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-3562.726,991.1758;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1260;-7138.102,-1621.003;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-4736,-832;Inherit;False;Property;_SpecularSize;Specular Size;33;0;Create;True;0;0;False;0;0.46;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-4736,-512;Inherit;False;Property;_ShadowLayer1Push;Shadow Layer 1 Push;20;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-4672,208;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4640,288;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4736,-112;Inherit;False;Property;_ShadowLayer2Fuzziness;Shadow Layer 2 Fuzziness;26;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1290;-4640,-592;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1000;-4736,-432;Inherit;False;Property;_ShadowLayer1Gate;Shadow Layer 1 Gate;21;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4640,448;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;1320;-4533.258,124.1653;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-4341.697,-1392.431;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;990;-4736,-192;Inherit;False;Property;_ShadowLayer2Gate;Shadow Layer 2 Gate;25;0;Create;True;0;0;False;0;0.91;0.91;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-4656,-32;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1321;-4548.674,83.05215;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1161;-2412.119,734.038;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-3396.724,938.7759;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-3682.826,-1183.848;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;846;-3114.071,2905.807;Inherit;False;GranblueFresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-4736,-752;Inherit;False;Property;_SpecularFuzzy;Specular Fuzzy;34;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1267;-2387.772,588.439;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;5;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;784;-3027.352,-538.8565;Inherit;False;593.0671;443.9203;Get those detail lines in and apply light color;5;848;513;512;515;514;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1249;-6344.514,-2403.277;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;926;-4672,-672;Inherit;False;924;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4640,528;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;989;-4640,368;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareEqual;1239;-6500.081,-3114.763;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1163;-2436.601,816.522;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;467;-4736,-272;Inherit;False;Property;_ShadowLayer2Push;Shadow Layer 2 Push;24;0;Create;True;0;0;False;0;-0.3;-0.393;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-4736,-352;Inherit;False;Property;_ShadowLayer1Fuzziness;Shadow Layer 1 Fuzziness;22;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1165;-1807.098,699.896;Inherit;False;Property;_DepthMultClamp;Depth Mult Clamp;7;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-2966.352,-350.9365;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;785;-2394.593,-504.1195;Inherit;False;549.6119;259.1823;Bro are you using Matcap?;2;1095;521;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1253;-5975.554,-2470.118;Inherit;False;Property;_PIXELSNAP;PIXELSNAP;55;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1164;-2030.741,803.521;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1252;-6112.622,-3053.384;Inherit;False;Property;_COLORADDSUBDIFF;_COLORADDSUBDIFF;49;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1319;-4011.061,-442.0017;Inherit;False;Shading System;-1;;327;1670eb1c79b726744983c09eed1d95d8;0;18;86;FLOAT;0;False;87;FLOAT;0;False;91;FLOAT4;0,0,0,0;False;92;FLOAT;0;False;35;FLOAT;0;False;46;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;47;FLOAT;0;False;48;FLOAT;0;False;37;FLOAT;0;False;38;FLOAT;0;False;39;FLOAT;0;False;36;FLOAT4;0,0,0,0;False;41;FLOAT4;0,0,0,0;False;40;FLOAT;0;False;42;FLOAT4;0,0,0,0;False;43;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-2966,-270.0417;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-2976.077,-488.8565;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;848;-2994.706,-187.6474;Inherit;False;846;GranblueFresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-3243.596,939.5938;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SurfaceDepthNode;1266;-2027.907,509.507;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1167;-2042.473,598.4709;Inherit;False;Property;_CameraDepthMult;Camera Depth Mult;9;0;Create;True;0;0;False;0;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1262;-6009.548,-1640.113;Inherit;False;Property;_COLORCOLOR;_COLORCOLOR;56;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1169;-1610.376,551.215;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0.001;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1082;-2152.5,138.0603;Inherit;False;Property;_OutlineColor;Outline Color;1;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;985;-1804.71,-488.4925;Inherit;False;459.2842;271.1678;Add Highlight;2;984;1263;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1089;-2136.307,328.8138;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-2377.178,-349.6326;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1168;-1568.488,702.433;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-2624.087,-436.2752;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;1268;-1996.799,458.0006;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1250;-5661.549,-2495.223;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1084;-1866.985,287.7655;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1214;-5503.616,-2500.24;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;1170;-1380.793,614.0601;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1095;-2148.107,-448.1112;Inherit;False;Property;_METALLICGLOSSMAP;_METALLICGLOSSMAP;45;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1263;-1745.284,-333.1993;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1264;-1317.37,-495.1135;Inherit;False;571.0603;277.1415;Debug System Toggle;2;1175;1209;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1087;-1371.417,134.1184;Inherit;False;Property;_EnableOutline;Enable Outline;43;1;[Enum];Create;True;2;Disable;0;Yes I am lazy and want ugly outlines;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1085;-1901.334,110.9168;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;5;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1269;-1325.84,464.7781;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1088;-1151.817,141.3185;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1172;-1033.745,682.233;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1209;-1267.37,-332.572;Inherit;False;1214;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;1086;-1632.565,213.9963;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;984;-1499.427,-438.4923;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1175;-1010.309,-445.1135;Inherit;False;Property;_ALPHABLEND;Enable Debug;48;0;Create;False;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;1081;-927.6135,389.945;Inherit;False;0;True;Masked;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;246;-700.1695,-714.7246;Inherit;False;554.1174;504.4;;1;0;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-410.0485,-664.7245;Float;False;True;-1;2;ASWShaderGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light v6.5.2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;1;RenderType=Opaque;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;850;0;182;4
WireConnection;700;0;701;0
WireConnection;700;1;578;0
WireConnection;517;0;152;0
WireConnection;517;1;518;0
WireConnection;550;1;551;0
WireConnection;550;2;700;0
WireConnection;550;3;553;0
WireConnection;440;0;517;0
WireConnection;183;0;182;0
WireConnection;1146;71;1057;0
WireConnection;1146;46;1016;0
WireConnection;1146;42;947;0
WireConnection;1146;41;217;0
WireConnection;1146;38;974;0
WireConnection;1146;39;975;0
WireConnection;1146;99;1116;0
WireConnection;1146;100;1122;0
WireConnection;683;0;550;0
WireConnection;231;0;142;3
WireConnection;231;1;142;2
WireConnection;231;2;142;1
WireConnection;231;3;142;4
WireConnection;457;0;1146;1
WireConnection;554;0;683;0
WireConnection;554;1;604;0
WireConnection;1094;1;554;0
WireConnection;1067;0;1062;0
WireConnection;1067;2;231;0
WireConnection;1067;3;142;0
WireConnection;548;0;546;0
WireConnection;548;1;547;0
WireConnection;944;0;546;0
WireConnection;944;1;548;0
WireConnection;537;0;1094;0
WireConnection;537;1;859;0
WireConnection;537;2;1313;0
WireConnection;441;0;1067;0
WireConnection;98;0;97;0
WireConnection;1231;0;113;0
WireConnection;100;0;98;0
WireConnection;545;0;537;0
WireConnection;549;0;944;0
WireConnection;549;1;1094;0
WireConnection;549;2;1313;0
WireConnection;849;0;578;0
WireConnection;849;1;844;0
WireConnection;101;1;100;0
WireConnection;119;0;113;1
WireConnection;841;2;849;0
WireConnection;841;3;842;0
WireConnection;1232;0;1227;0
WireConnection;1223;0;1193;0
WireConnection;659;0;658;0
WireConnection;659;1;657;0
WireConnection;718;0;685;0
WireConnection;718;1;545;0
WireConnection;573;0;549;0
WireConnection;102;1;101;0
WireConnection;921;0;658;0
WireConnection;921;1;659;0
WireConnection;686;0;573;0
WireConnection;686;1;685;0
WireConnection;1237;0;1232;3
WireConnection;1237;1;1238;0
WireConnection;857;0;841;0
WireConnection;538;0;718;0
WireConnection;449;0;440;0
WireConnection;449;1;183;0
WireConnection;1216;0;1223;3
WireConnection;1216;1;1218;0
WireConnection;987;0;152;4
WireConnection;1246;0;1245;0
WireConnection;1246;2;1237;0
WireConnection;555;0;686;0
WireConnection;117;0;113;3
WireConnection;858;0;857;0
WireConnection;360;0;113;2
WireConnection;103;1;102;0
WireConnection;447;0;543;0
WireConnection;447;1;440;0
WireConnection;447;2;449;0
WireConnection;1236;0;1232;2
WireConnection;1236;1;1238;0
WireConnection;1244;0;1240;0
WireConnection;1244;2;1216;0
WireConnection;928;0;635;0
WireConnection;928;1;921;0
WireConnection;928;2;918;0
WireConnection;1215;0;1223;2
WireConnection;1215;1;1218;0
WireConnection;1234;0;1232;1
WireConnection;1234;1;1238;0
WireConnection;1247;0;1245;0
WireConnection;1247;2;1236;0
WireConnection;1247;3;1246;0
WireConnection;1257;0;1258;0
WireConnection;1257;1;1254;0
WireConnection;856;0;858;0
WireConnection;574;0;575;0
WireConnection;574;1;447;0
WireConnection;1306;0;658;0
WireConnection;1306;1;928;0
WireConnection;1222;0;1223;1
WireConnection;1222;1;1218;0
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;871;0;449;0
WireConnection;871;1;870;0
WireConnection;1242;0;1240;0
WireConnection;1242;2;1215;0
WireConnection;1242;3;1244;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;451;0;871;0
WireConnection;14;0;1146;2
WireConnection;1007;3;482;0
WireConnection;1007;4;490;0
WireConnection;1007;58;501;0
WireConnection;1007;59;508;0
WireConnection;1007;1;477;0
WireConnection;1007;2;483;0
WireConnection;1007;57;496;0
WireConnection;1007;34;790;0
WireConnection;1248;0;1245;0
WireConnection;1248;2;1234;0
WireConnection;1248;3;1247;0
WireConnection;1241;0;1240;0
WireConnection;1241;2;1222;0
WireConnection;1241;3;1242;0
WireConnection;924;0;1306;0
WireConnection;1093;1;856;0
WireConnection;1256;0;1255;0
WireConnection;1256;1;1254;0
WireConnection;1221;0;1223;0
WireConnection;1221;1;1218;0
WireConnection;1261;0;1259;0
WireConnection;1261;2;1257;0
WireConnection;1229;0;1232;0
WireConnection;1229;1;1238;0
WireConnection;448;0;574;0
WireConnection;215;1;216;0
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;1260;0;1259;0
WireConnection;1260;2;1256;0
WireConnection;1260;3;1261;0
WireConnection;1320;0;1007;35
WireConnection;443;0;215;0
WireConnection;1321;0;1007;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;118;0;113;4
WireConnection;846;0;1093;0
WireConnection;1267;0;1171;0
WireConnection;1249;0;1245;0
WireConnection;1249;2;1229;0
WireConnection;1249;3;1248;0
WireConnection;1239;0;1240;0
WireConnection;1239;2;1221;0
WireConnection;1239;3;1241;0
WireConnection;1163;0;1174;0
WireConnection;1253;1;1249;0
WireConnection;1164;0;1267;0
WireConnection;1164;2;1161;0
WireConnection;1164;3;1163;2
WireConnection;1164;4;1163;3
WireConnection;1252;1;1239;0
WireConnection;1319;86;625;0
WireConnection;1319;87;935;0
WireConnection;1319;91;926;0
WireConnection;1319;92;1290;0
WireConnection;1319;35;460;0
WireConnection;1319;46;1000;0
WireConnection;1319;49;834;0
WireConnection;1319;50;467;0
WireConnection;1319;47;990;0
WireConnection;1319;48;832;0
WireConnection;1319;37;734;0
WireConnection;1319;38;1321;0
WireConnection;1319;39;1320;0
WireConnection;1319;36;471;0
WireConnection;1319;41;455;0
WireConnection;1319;40;989;0
WireConnection;1319;42;463;0
WireConnection;1319;43;465;0
WireConnection;111;0;110;0
WireConnection;1262;1;1260;0
WireConnection;1169;0;1266;0
WireConnection;1169;1;1167;0
WireConnection;1169;2;1164;0
WireConnection;1169;3;1163;1
WireConnection;1168;0;1165;0
WireConnection;1168;1;1164;0
WireConnection;513;0;515;0
WireConnection;513;1;1319;0
WireConnection;513;2;512;0
WireConnection;513;3;514;0
WireConnection;513;4;848;0
WireConnection;1268;0;1171;0
WireConnection;1250;0;1252;0
WireConnection;1250;1;1253;0
WireConnection;1250;2;1262;0
WireConnection;1084;0;1082;0
WireConnection;1084;1;1089;0
WireConnection;1214;0;1250;0
WireConnection;1170;0;1169;0
WireConnection;1170;2;1168;0
WireConnection;1095;0;513;0
WireConnection;1095;1;521;0
WireConnection;1269;0;1268;0
WireConnection;1088;0;1087;0
WireConnection;1172;0;1269;0
WireConnection;1172;2;1170;0
WireConnection;1172;3;1164;0
WireConnection;1086;0;1085;0
WireConnection;1086;2;1084;0
WireConnection;1086;3;1082;0
WireConnection;984;0;1095;0
WireConnection;984;1;1263;0
WireConnection;1175;1;984;0
WireConnection;1175;0;1209;0
WireConnection;1081;0;1086;0
WireConnection;1081;2;1088;0
WireConnection;1081;1;1172;0
WireConnection;0;13;1175;0
WireConnection;0;11;1081;0
ASEEND*/
//CHKSM=2CCBC84CED79A91C880617AF99E6F7B7EE9ADECF
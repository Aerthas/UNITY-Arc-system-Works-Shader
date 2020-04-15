// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light v6.4.0"
{
	Properties
	{
		[Toggle]_ENABLETHISFORGUILTYGEAR("ENABLE THIS FOR GUILTY GEAR", Float) = 0
		[Enum(No,0,Yes,1)]_ForceFakeLight("Force Fake Light", Float) = 0
		[Enum(Fake Light Direction,0,View Direction,1)]_FakeLightFallbackDirToggle("Fake Light Fallback Dir Toggle", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[NoScaleOffset]_Detail("Detail", 2D) = "white" {}
		[NoScaleOffset]_MetalMatcap("Metal Matcap", 2D) = "white" {}
		[Toggle]_EnableMetalMatcap("Enable Metal Matcap", Float) = 0
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
		_VertexLayer2("Vertex Layer 2", Range( 0 , 1)) = 0.51
		_SpecularIntensity("Specular Intensity", Float) = 1
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.46
		_SpecularFuzzy("Specular Fuzzy", Range( 0 , 10)) = 0
		[Toggle]_EnableFresnelHighlight("Enable Fresnel Highlight", Float) = 1
		_HighlightPower("Highlight Power", Float) = 5
		_HighlightFreselFuzzy("Highlight Fresel Fuzzy", Float) = 0.01
		_HighlightIntensity("Highlight Intensity", Float) = 1
		_HighlightScale("Highlight Scale", Float) = 1
		_GranblueFresnelPower("Granblue Fresnel Power", Float) = 1.77
		_GranblueFresnelScale("Granblue Fresnel Scale", Float) = 1.12
		[Toggle]_EnableGranblueBlackFresnel("Enable Granblue Black Fresnel", Float) = 1
		_DarkHighlightMult("Dark Highlight Mult", Color) = (0.2392157,0.2392157,0.5294118,0)
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float2 uv_texcoord;
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

		uniform float _EnableMetalMatcap;
		uniform float _ForceFakeLight;
		uniform float4 _FakeLightColor;
		uniform float _FakeLightIntensity;
		uniform float _HighlightIntensity;
		uniform float _EnableFresnelHighlight;
		uniform sampler2D _Base;
		uniform float _HighlightScale;
		uniform float _HighlightPower;
		uniform float _HighlightFreselFuzzy;
		uniform float4 _DarkHighlightMult;
		uniform float _ShadowLayer2Intensity;
		uniform sampler2D _SSS;
		uniform float _ShadowBrightness;
		uniform float _ShadowLayer1Intensity;
		uniform float _ShadowLayer1Fuzziness;
		uniform float _ENABLETHISFORGUILTYGEAR;
		uniform float _FakeLightFallbackDirToggle;
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
		uniform float _EnableGranblueBlackFresnel;
		uniform float _GranblueFresnelScale;
		uniform float _GranblueFresnelPower;
		uniform float _MetalAIntensity;
		uniform sampler2D _MetalMatcap;
		uniform float _MetalBIntensity;

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
			float temp_output_73_0_g139 = (( _ForceFakeLight > 0.0 ) ? 0.0 :  (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 ) );
			float4 LightColor457 = (( temp_output_73_0_g139 > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) );
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float BaseAlpha850 = tex2DNode182.a;
			float fresnelNdotV550 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode550 = ( -0.180914 + ( BaseAlpha850 * _HighlightScale ) * pow( 1.0 - fresnelNdotV550, _HighlightPower ) );
			float4 clampResult545 = clamp( ( (( _EnableFresnelHighlight )?( pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ):( 0.0 )) * _DarkHighlightMult ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ShadowHighlight538 = ( _HighlightIntensity * clampResult545 );
			float2 uv_SSS152 = i.uv_texcoord;
			float4 tex2DNode152 = tex2D( _SSS, uv_SSS152 );
			float4 SSS440 = ( tex2DNode152 * _ShadowBrightness );
			float4 Base183 = tex2DNode182;
			float4 temp_output_449_0 = ( SSS440 * Base183 );
			float4 SSS2448 = ( ShadowHighlight538 + ( _ShadowLayer2Intensity * SSS440 * temp_output_449_0 ) );
			float4 BaseSSS451 = ( temp_output_449_0 * _ShadowLayer1Intensity );
			float4 appendResult231 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 VertexColors441 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult231 ):( i.vertexColor ));
			float3 appendResult15_g140 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
			float3 normalizeResult2_g140 = normalize( appendResult15_g140 );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult28_g139 = dot( (( temp_output_73_0_g139 > 0.0 ) ? ase_worldlightDir :  (( _FakeLightFallbackDirToggle > 0.0 ) ? ase_worldViewDir :  normalizeResult2_g140 ) ) , ase_normWorldNormal );
			float DefaultDot14 = dotResult28_g139;
			float temp_output_37_0_g141 = DefaultDot14;
			float SSSAlpha987 = tex2DNode152.a;
			float temp_output_40_0_g141 = SSSAlpha987;
			float ifLocalVar5_g142 = 0;
			if( temp_output_40_0_g141 >= ( 1.0 - _ShadowLayer1Gate ) )
				ifLocalVar5_g142 = 1.0;
			float lerpResult8_g142 = lerp( 1.0 , ( ( -1.0 + VertexColors441.x + temp_output_37_0_g141 ) - _ShadowLayer1Push ) , ifLocalVar5_g142);
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMG360 = tex2DNode113.g;
			float temp_output_1_0_g138 = ILMG360;
			float temp_output_20_0_g138 = ( 1.0 - ( 0.62 * temp_output_1_0_g138 ) );
			float ILMB117 = tex2DNode113.b;
			float4 color12_g138 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 blendOpSrc548 = Base183;
			float4 blendOpDest548 = SSS440;
			float4 temp_cast_8 = (0.0).xxxx;
			float4 clampResult573 = clamp( ( ( Base183 + ( saturate( (( blendOpSrc548 > 0.5 ) ? max( blendOpDest548, 2.0 * ( blendOpSrc548 - 0.5 ) ) : min( blendOpDest548, 2.0 * blendOpSrc548 ) ) )) ) * (( _EnableFresnelHighlight )?( pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ):( 0.0 )) ) , temp_cast_8 , float4( 1,1,1,0 ) );
			float4 Highlight555 = ( clampResult573 * _HighlightIntensity );
			float4 temp_output_34_0_g138 = Highlight555;
			float4 temp_output_22_0_g138 = ( ( ILMB117 * 0.4 ) + ( color12_g138 + temp_output_34_0_g138 ) );
			float4 ifLocalVar24_g138 = 0;
			if( ( ( ( 1.0 - _ILMLayer1 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g138 )
				ifLocalVar24_g138 = temp_output_22_0_g138;
			float4 clampResult26_g138 = clamp( ifLocalVar24_g138 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_44_0_g138 = ( 1.0 - VertexColors441.x );
			float4 color39_g138 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_46_0_g138 = ( ( temp_output_1_0_g138 * 0.4 ) + ( temp_output_34_0_g138 + color39_g138 ) );
			float4 ifLocalVar49_g138 = 0;
			if( _VertexLayer1 >= temp_output_44_0_g138 )
				ifLocalVar49_g138 = temp_output_46_0_g138;
			float4 clampResult51_g138 = clamp( ifLocalVar49_g138 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float PrimaryDotPermanentShadows809 = ( clampResult26_g138.r * clampResult51_g138.x );
			float smoothstepResult23_g141 = smoothstep( 0.0 , ( _ShadowLayer1Fuzziness * 0.01 ) , ( lerpResult8_g142 * PrimaryDotPermanentShadows809 ));
			float4 lerpResult26_g141 = lerp( BaseSSS451 , Base183 , smoothstepResult23_g141);
			float ifLocalVar5_g143 = 0;
			if( temp_output_40_0_g141 >= ( 1.0 - _ShadowLayer2Gate ) )
				ifLocalVar5_g143 = 1.0;
			float lerpResult8_g143 = lerp( 1.0 , ( temp_output_37_0_g141 - _ShadowLayer2Push ) , ifLocalVar5_g143);
			float4 ifLocalVar23_g138 = 0;
			if( ( ( ( 1.0 - _ILMLayer2 ) * 0.1 ) + 0.9 ) >= temp_output_20_0_g138 )
				ifLocalVar23_g138 = temp_output_22_0_g138;
			float4 clampResult25_g138 = clamp( ifLocalVar23_g138 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ifLocalVar50_g138 = 0;
			if( _VertexLayer2 >= temp_output_44_0_g138 )
				ifLocalVar50_g138 = temp_output_46_0_g138;
			float4 clampResult52_g138 = clamp( ifLocalVar50_g138 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float SecondaryDotPermanentShadows811 = ( clampResult25_g138.r * clampResult52_g138.x );
			float smoothstepResult25_g141 = smoothstep( 0.0 , ( _ShadowLayer2Fuzziness * 0.01 ) , ( lerpResult8_g143 * SecondaryDotPermanentShadows811 ));
			float4 lerpResult28_g141 = lerp( SSS2448 , lerpResult26_g141 , smoothstepResult25_g141);
			float4 blendOpSrc659 = Base183;
			float4 blendOpDest659 = SSS440;
			float ILMR119 = tex2DNode113.r;
			float4 SpecularColor924 = ( _SpecularIntensity * ( Base183 + ( saturate( (( blendOpSrc659 > 0.5 ) ? max( blendOpDest659, 2.0 * ( blendOpSrc659 - 0.5 ) ) : min( blendOpDest659, 2.0 * blendOpSrc659 ) ) )) ) * ILMR119 );
			float smoothstepResult932 = smoothstep( 0.0 , ( _SpecularFuzzy * 0.01 ) , ( ( ( 1.0 - ( ( _SpecularSize * 4.0 ) - 2.0 ) ) * -0.2 ) + ( DefaultDot14 * ILMB117 * PrimaryDotPermanentShadows809 * SecondaryDotPermanentShadows811 ) ));
			float SpecularDot937 = smoothstepResult932;
			float4 lerpResult32_g141 = lerp( lerpResult28_g141 , ( lerpResult28_g141 + SpecularColor924 ) , SpecularDot937);
			float4 clampResult33_g141 = clamp( lerpResult32_g141 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float ILMA118 = tex2DNode113.a;
			float4 Detail443 = tex2D( _Detail, i.uv2_texcoord2 );
			float fresnelNdotV841 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode841 = ( 0.0 + ( _GranblueFresnelScale * BaseAlpha850 ) * pow( 1.0 - fresnelNdotV841, _GranblueFresnelPower ) );
			float clampResult858 = clamp( saturate( fresnelNode841 ) , 0.0 , 1.0 );
			float GranblueFresnel846 = (( _EnableGranblueBlackFresnel )?( ( 1.0 - clampResult858 ) ):( 1.0 ));
			float3 worldToViewDir98 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode103 = tex2D( _MetalMatcap, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir98).xy ) ) );
			float4 MetalMatCap111 = ( Base183 * ( ( _MetalAIntensity * tex2DNode103.r ) + ( tex2DNode103.b * _MetalBIntensity ) ) );
			float4 FinalCustomLight202 = ( (( _EnableMetalMatcap )?( MetalMatCap111 ):( ( LightColor457 * clampResult33_g141 * ILMA118 * Detail443 * GranblueFresnel846 ) )) + Highlight555 );
			c.rgb = FinalCustomLight202.rgb;
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
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows exclude_path:deferred 

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
-1617;100;1385;670;6145.81;2671.818;2.248923;True;True
Node;AmplifyShaderEditor.CommentaryNode;516;-5196.627,1726.136;Inherit;False;1962.548;1180.316;;19;444;448;451;574;871;447;575;870;449;543;850;183;440;517;182;152;518;112;987;Color Information;0,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;182;-5071.347,2188.143;Inherit;True;Property;_Base;Base;3;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;94f62562165c70445bd0baf0d45e8ffb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;806;-2545.577,1245.347;Inherit;False;2502.946;1228.72;;13;805;685;829;554;683;604;801;550;553;551;700;578;701;Highlight Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;-4767.593,2313.074;Inherit;False;BaseAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-2495.577,1903.004;Inherit;False;Property;_HighlightScale;Highlight Scale;35;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-2434.275,1726.168;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-5159.741,2070.902;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;15;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;152;-5173.614,1870.377;Inherit;True;Property;_SSS;SSS;5;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;ddbf52e1b320f55488bba42278293a3d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;700;-2148.577,1814.004;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-4848.055,1950.349;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;553;-2243.185,1961.629;Inherit;False;Property;_HighlightPower;Highlight Power;32;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-2184.084,1733.23;Inherit;False;Constant;_HighlightBias;Highlight Bias;28;0;Create;True;0;0;False;0;-0.180914;-0.180914;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-4735.825,2189.755;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FresnelNode;550;-1907.747,1753.483;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;801;-1740.031,1295.347;Inherit;False;1633.612;401.5834;Fresnel for Lit areas;9;549;571;573;555;686;944;548;546;547;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-4706.305,1960.217;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-1683.229,1450.244;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;683;-1633.711,1768.237;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;546;-1690.031,1345.347;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-1679.583,1838.891;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;33;0;Create;True;0;0;False;0;0.01;0.93;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;554;-1430.948,1777.83;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;548;-1444.09,1421.714;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;944;-1213.413,1368.005;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;829;-1279.506,1748.22;Inherit;False;Property;_EnableFresnelHighlight;Enable Fresnel Highlight;31;0;Create;True;0;0;False;0;1;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;304;-4806.963,-1432.188;Inherit;False;978.1387;333.6884;Vertex Colors fix;4;441;230;231;142;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-987.0652,1413.131;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;571;-976.1075,1508.706;Float;False;Constant;_Minthathastobeamin;Min that has to be a min;20;1;[HideInInspector];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;142;-4761.057,-1319.227;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;112;-4113.369,2426.359;Inherit;False;585.331;428.9513;ILM Information;5;113;118;117;119;360;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;573;-671.6855,1487.185;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;231;-4535.899,-1266.244;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-945.0359,1788.845;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;34;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;686;-505.864,1487.228;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;230;-4387.216,-1330.694;Inherit;False;Property;_ENABLETHISFORGUILTYGEAR;ENABLE THIS FOR GUILTY GEAR;0;0;Create;True;0;0;False;0;0;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;945;-6943.392,205.1044;Inherit;False;1632.617;1153.819;;2;939;938;Specular System;1,1,0,1;0;0
Node;AmplifyShaderEditor.SamplerNode;113;-4088.972,2549.092;Inherit;True;Property;_ILM;ILM;4;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;432249f8f3a302c44ab7f503f89027c3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-3761.308,2574.604;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;939;-6893.392,255.1044;Inherit;False;1532.617;669.3203;Specular Dot;15;826;823;625;627;626;631;937;932;936;935;873;629;822;976;978;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;805;-1985.174,1982.873;Inherit;False;1894.332;469.0499;Fresnel for Darker areas;14;859;796;793;803;795;804;802;797;794;792;538;718;545;537;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-4049.036,-1339.693;Inherit;False;VertexColors;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;1015;-5098.588,-2182.364;Inherit;False;1288.864;723.4758;Automatic Light System;8;1057;1016;947;974;217;975;457;14;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-323.3239,1479.677;Inherit;False;Highlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;998;-4946.785,794.7893;Inherit;False;1586.633;724.9999;;10;482;508;477;483;496;790;501;490;809;811;Permanent Shadows;0.6037736,0.5895336,0.5895336,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;96;-2589.34,681.1819;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-3765.466,2647.509;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;97;-2539.342,900.3812;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;790;-4816.785,1404.789;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;975;-4953.341,-1738.69;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;14;0;Create;True;0;0;False;0;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1057;-5056,-2080;Inherit;False;Property;_FakeLightFallbackDirToggle;Fake Light Fallback Dir Toggle;2;1;[Enum];Create;True;2;Fake Light Direction;0;View Direction;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-4956.1,-2000.434;Inherit;False;Property;_ForceFakeLight;Force Fake Light;1;1;[Enum];Create;True;2;No;0;Yes;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-6878.582,299.1044;Inherit;False;Property;_SpecularSize;Specular Size;29;0;Create;True;0;0;False;0;0.46;0.46;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;860;-2290.833,2576.47;Inherit;False;1792.148;420.865;;10;844;851;849;842;841;857;858;856;854;846;Granblue Black Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-4896.785,844.7893;Inherit;False;Property;_ILMLayer1;ILM Layer 1;24;0;Create;True;0;0;False;0;0.6;0.335;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-4983.988,-1907.775;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;11;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-4800.785,1244.789;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-4800.785,1164.789;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-4832.785,1324.789;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;859;-1267.792,2249.132;Inherit;False;Property;_DarkHighlightMult;Dark Highlight Mult;39;0;Create;True;0;0;False;0;0.2392157,0.2392157,0.5294118,0;0.239215,0.239215,0.5294118,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;501;-4896.785,1004.789;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;26;0;Create;True;0;0;False;0;0.31;0.254;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;974;-4953.341,-1824.69;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;13;0;Create;True;0;0;False;0;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-4896.785,924.7893;Inherit;False;Property;_ILMLayer2;ILM Layer 2;25;0;Create;True;0;0;False;0;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-4896.785,1084.789;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;27;0;Create;True;0;0;False;0;0.51;0.51;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-4958.106,-1650.689;Float;False;Property;_FakeLightColor;Fake Light Color;12;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;844;-2240.833,2703.143;Inherit;False;Property;_GranblueFresnelScale;Granblue Fresnel Scale;37;0;Create;True;0;0;False;0;1.12;1.77;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;851;-2207.213,2787.584;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1007;-4356.151,1009.985;Inherit;False;Permanent Shadows;-1;;138;1ce4709ce3667c2438e413e9b79be23a;0;8;3;FLOAT;0;False;4;FLOAT;0;False;58;FLOAT;0;False;59;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;57;FLOAT4;0,0,0,0;False;34;FLOAT4;0,0,0,0;False;2;FLOAT;0;FLOAT;35
Node;AmplifyShaderEditor.TransformDirectionNode;98;-2348.401,895.8831;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;978;-6603.048,314.443;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1061;-4486.384,-1949.047;Inherit;False;Merged Light Function;-1;;139;6a9b492f5059fcf4aa61bcbd0dc72ff9;0;6;71;FLOAT;0;False;46;FLOAT;0;False;42;FLOAT;0;False;38;FLOAT;0;False;39;FLOAT;0;False;41;FLOAT4;0,0,0,0;False;2;COLOR;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;537;-985.4807,2160.002;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-4042.223,-1876.307;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;938;-6863.416,956.6733;Inherit;False;1113.028;370.48;Specular Color;8;657;658;659;921;918;928;924;635;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;100;-2120.347,896.3812;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;849;-1923.124,2709.701;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;545;-800.6999,2162.129;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-2202.722,2882.335;Inherit;False;Property;_GranblueFresnelPower;Granblue Fresnel Power;36;0;Create;True;0;0;False;0;1.77;1.77;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;809;-3732.15,993.9847;Inherit;False;PrimaryDotPermanentShadows;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;811;-3732.15,1089.985;Inherit;False;SecondaryDotPermanentShadows;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;976;-6461.048,322.443;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;626;-6352.266,322.9732;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-1895.344,879.3812;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;826;-6723.976,717.6897;Inherit;False;811;SecondaryDotPermanentShadows;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;841;-1755.09,2660.648;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;873;-6632.314,556.9776;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;-6634.544,469.4019;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;718;-598.9145,2148.968;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;823;-6711.851,635.5366;Inherit;False;809;PrimaryDotPermanentShadows;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-6807.616,1211.453;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-6816.417,1103.556;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-4539.634,1870.385;Inherit;False;Property;_ShadowLayer2Intensity;Shadow Layer 2 Intensity;23;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;627;-6197.119,341.5543;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;822;-6315.676,555.9198;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-6165.434,651.3436;Inherit;False;Property;_SpecularFuzzy;Specular Fuzzy;30;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-328.8549,2143.514;Inherit;False;ShadowHighlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;857;-1522.746,2660.485;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;659;-6575.474,1174.923;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-1742.345,864.3812;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-4253.562,2181.042;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-3764.508,2494.701;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-1536.343,733.2808;Float;False;Property;_MetalAIntensity;Metal A Intensity;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;575;-3973.709,1835.168;Inherit;False;538;ShadowHighlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;858;-1378.197,2654.686;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-3953.878,1923.904;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-4404.558,2297.729;Inherit;False;Property;_ShadowLayer1Intensity;Shadow Layer 1 Intensity;19;0;Create;True;0;0;False;0;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-1516.042,1049.88;Float;False;Property;_MetalBIntensity;Metal B Intensity;10;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;631;-6071.016,533.5999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;918;-6355.381,1212.153;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;444;-5044.073,2516.728;Inherit;False;854.0317;283.3198;Detail;3;216;215;443;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;936;-5888.434,657.3436;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-6418.509,1006.673;Inherit;False;Property;_SpecularIntensity;Specular Intensity;28;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;103;-1597.345,824.3812;Inherit;True;Property;_MetalMatcap;Metal Matcap;7;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;921;-6322.379,1110.35;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-1260.338,998.0796;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;856;-1236.871,2655.338;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;928;-6163.416,1070.744;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;932;-5739.203,574.0404;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-1265.044,830.4803;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;871;-4063.243,2195.518;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;574;-3626.149,1913.114;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-4994.073,2582.764;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-3463.505,1922.332;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;924;-5993.386,1094.443;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-1101.144,900.4813;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;854;-1077.775,2626.47;Inherit;False;Property;_EnableGranblueBlackFresnel;Enable Granblue Black Fresnel;38;0;Create;True;0;0;False;0;1;2;0;FLOAT;1;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-1204.431,731.1829;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;-4834.446,2081.108;Inherit;False;SSSAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;937;-5567.775,576.3353;Inherit;False;SpecularDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-3873.494,2181.541;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1006;-4845.06,-892.002;Inherit;False;1289;1365;;17;820;734;460;989;926;1000;471;757;465;463;455;832;990;813;834;467;1005;Shading System;0.4313726,0,0.7843137,1;0;0
Node;AmplifyShaderEditor.SamplerNode;215;-4753.827,2570.048;Inherit;True;Property;_Detail;Detail;6;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;f3f85fc8914e5b14e95f6eb51da0aeb3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;926;-4683.06,357.9984;Inherit;False;924;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;989;-4635.06,37.99825;Inherit;False;987;SSSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-4651.06,-362.0016;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4635.06,117.9983;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4731.06,-442.0017;Inherit;False;Property;_ShadowLayer2Fuzziness;Shadow Layer 2 Fuzziness;22;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;990;-4731.06,-522.0017;Inherit;False;Property;_ShadowLayer2Gate;Shadow Layer 2 Gate;21;0;Create;True;0;0;False;0;0.91;0.91;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-4731.06,-602.002;Inherit;False;Property;_ShadowLayer2Push;Shadow Layer 2 Push;20;0;Create;True;0;0;False;0;-0.3;-0.393;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;813;-4795.06,-202.0016;Inherit;False;811;SecondaryDotPermanentShadows;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-3762.17,2725.312;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4635.06,197.9983;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;757;-4667.06,277.9984;Inherit;False;937;SpecularDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-4414.041,2566.728;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-935.1429,848.0811;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-4060.809,-1967.716;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-4667.06,-122.0017;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;820;-4779.06,-282.0016;Inherit;False;809;PrimaryDotPermanentShadows;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1000;-4731.06,-762.002;Inherit;False;Property;_ShadowLayer1Gate;Shadow Layer 1 Gate;17;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;784;-3027.352,-538.8565;Inherit;False;593.0671;443.9203;Get those detail lines in and apply light color;5;848;513;512;515;514;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-4731.06,-842.002;Inherit;False;Property;_ShadowLayer1Push;Shadow Layer 1 Push;16;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4635.06,-42.00175;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;846;-759.6849,2630.188;Inherit;False;GranblueFresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-4731.06,-682.002;Inherit;False;Property;_ShadowLayer1Fuzziness;Shadow Layer 1 Fuzziness;18;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1005;-4011.061,-442.0017;Inherit;False;Shading System;-1;;141;1670eb1c79b726744983c09eed1d95d8;0;16;35;FLOAT;0;False;46;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;47;FLOAT;0;False;48;FLOAT;0;False;37;FLOAT;0;False;38;FLOAT;0;False;39;FLOAT;0;False;36;FLOAT4;0,0,0,0;False;41;FLOAT4;0,0,0,0;False;40;FLOAT;0;False;42;FLOAT4;0,0,0,0;False;43;FLOAT4;0,0,0,0;False;45;FLOAT;0;False;44;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-2966,-270.0417;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-2976.077,-488.8565;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;785;-2378.993,-479.4202;Inherit;False;557.4119;264.3823;Bro are you using Matcap?;2;520;521;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;848;-2994.706,-187.6474;Inherit;False;846;GranblueFresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-2966.352,-350.9365;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-782.0149,848.8992;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-2357.677,-339.2333;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;985;-1768.032,-474.2351;Inherit;False;459.2842;271.1678;Add Highlight;2;984;557;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-2624.087,-436.2752;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;520;-2155.582,-436.4204;Inherit;False;Property;_EnableMetalMatcap;Enable Metal Matcap;8;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;557;-1718.032,-318.0672;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;984;-1462.748,-424.235;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;786;-1221.097,-487.752;Inherit;False;289.6;166;Finally output;1;202;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;246;-2536.632,-1491.87;Inherit;False;554.1174;504.4;;3;0;18;878;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;202;-1185.868,-430.2276;Inherit;False;FinalCustomLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;793;-1731.623,2241.321;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.WireNode;804;-1763.67,2215.135;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;796;-1259.404,2123.447;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;794;-1502.707,2070.861;Inherit;False;Difference;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;802;-1547.67,2032.135;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;878;-2499.595,-1342.348;Inherit;False;TestingOutput;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;803;-1547.67,2197.135;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;18;-2505.132,-1202.021;Inherit;False;202;FinalCustomLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;795;-1744.69,2066.087;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;797;-1969.9,2191.053;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;792;-1933.693,2014.219;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-2246.512,-1441.87;Float;False;True;-1;2;ASWShaderGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light v6.4.0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;1;RenderType=Opaque;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;850;0;182;4
WireConnection;700;0;578;0
WireConnection;700;1;701;0
WireConnection;517;0;152;0
WireConnection;517;1;518;0
WireConnection;183;0;182;0
WireConnection;550;1;551;0
WireConnection;550;2;700;0
WireConnection;550;3;553;0
WireConnection;440;0;517;0
WireConnection;683;0;550;0
WireConnection;554;0;683;0
WireConnection;554;1;604;0
WireConnection;548;0;546;0
WireConnection;548;1;547;0
WireConnection;944;0;546;0
WireConnection;944;1;548;0
WireConnection;829;1;554;0
WireConnection;549;0;944;0
WireConnection;549;1;829;0
WireConnection;573;0;549;0
WireConnection;573;1;571;0
WireConnection;231;0;142;3
WireConnection;231;1;142;2
WireConnection;231;2;142;1
WireConnection;231;3;142;4
WireConnection;686;0;573;0
WireConnection;686;1;685;0
WireConnection;230;0;142;0
WireConnection;230;1;231;0
WireConnection;360;0;113;2
WireConnection;441;0;230;0
WireConnection;555;0;686;0
WireConnection;117;0;113;3
WireConnection;1007;3;482;0
WireConnection;1007;4;490;0
WireConnection;1007;58;501;0
WireConnection;1007;59;508;0
WireConnection;1007;1;477;0
WireConnection;1007;2;483;0
WireConnection;1007;57;496;0
WireConnection;1007;34;790;0
WireConnection;98;0;97;0
WireConnection;978;0;625;0
WireConnection;1061;71;1057;0
WireConnection;1061;46;1016;0
WireConnection;1061;42;947;0
WireConnection;1061;38;974;0
WireConnection;1061;39;975;0
WireConnection;1061;41;217;0
WireConnection;537;0;829;0
WireConnection;537;1;859;0
WireConnection;14;0;1061;2
WireConnection;100;0;98;0
WireConnection;849;0;844;0
WireConnection;849;1;851;0
WireConnection;545;0;537;0
WireConnection;809;0;1007;0
WireConnection;811;0;1007;35
WireConnection;976;0;978;0
WireConnection;626;0;976;0
WireConnection;101;1;100;0
WireConnection;841;2;849;0
WireConnection;841;3;842;0
WireConnection;718;0;685;0
WireConnection;718;1;545;0
WireConnection;627;0;626;0
WireConnection;822;0;629;0
WireConnection;822;1;873;0
WireConnection;822;2;823;0
WireConnection;822;3;826;0
WireConnection;538;0;718;0
WireConnection;857;0;841;0
WireConnection;659;0;658;0
WireConnection;659;1;657;0
WireConnection;102;1;101;0
WireConnection;449;0;440;0
WireConnection;449;1;183;0
WireConnection;119;0;113;1
WireConnection;858;0;857;0
WireConnection;447;0;543;0
WireConnection;447;1;440;0
WireConnection;447;2;449;0
WireConnection;631;0;627;0
WireConnection;631;1;822;0
WireConnection;936;0;935;0
WireConnection;103;1;102;0
WireConnection;921;0;658;0
WireConnection;921;1;659;0
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;856;0;858;0
WireConnection;928;0;635;0
WireConnection;928;1;921;0
WireConnection;928;2;918;0
WireConnection;932;0;631;0
WireConnection;932;2;936;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;871;0;449;0
WireConnection;871;1;870;0
WireConnection;574;0;575;0
WireConnection;574;1;447;0
WireConnection;448;0;574;0
WireConnection;924;0;928;0
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;854;1;856;0
WireConnection;987;0;152;4
WireConnection;937;0;932;0
WireConnection;451;0;871;0
WireConnection;215;1;216;0
WireConnection;118;0;113;4
WireConnection;443;0;215;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;457;0;1061;1
WireConnection;846;0;854;0
WireConnection;1005;35;460;0
WireConnection;1005;46;1000;0
WireConnection;1005;49;834;0
WireConnection;1005;50;467;0
WireConnection;1005;47;990;0
WireConnection;1005;48;832;0
WireConnection;1005;37;734;0
WireConnection;1005;38;820;0
WireConnection;1005;39;813;0
WireConnection;1005;36;471;0
WireConnection;1005;41;455;0
WireConnection;1005;40;989;0
WireConnection;1005;42;463;0
WireConnection;1005;43;465;0
WireConnection;1005;45;757;0
WireConnection;1005;44;926;0
WireConnection;111;0;110;0
WireConnection;513;0;515;0
WireConnection;513;1;1005;0
WireConnection;513;2;512;0
WireConnection;513;3;514;0
WireConnection;513;4;848;0
WireConnection;520;0;513;0
WireConnection;520;1;521;0
WireConnection;984;0;520;0
WireConnection;984;1;557;0
WireConnection;202;0;984;0
WireConnection;793;0;797;0
WireConnection;804;0;797;0
WireConnection;796;0;794;0
WireConnection;796;1;793;2
WireConnection;796;2;795;3
WireConnection;794;0;802;0
WireConnection;794;1;803;0
WireConnection;802;0;792;0
WireConnection;803;0;804;0
WireConnection;795;0;792;0
WireConnection;0;13;18;0
ASEEND*/
//CHKSM=8956580E831F9C00843A00C668544FC3E3CEB7DC
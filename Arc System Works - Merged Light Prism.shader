// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light v6.2.0 - Prism"
{
	Properties
	{
		[Toggle]_ForceFakeLight("Force Fake Light", Float) = 0
		[Toggle]_ENABLETHISFORGUILTYGEAR("ENABLE THIS FOR GUILTY GEAR", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[NoScaleOffset]_Detail("Detail", 2D) = "white" {}
		[NoScaleOffset]_MetalMatcap("Metal Matcap", 2D) = "white" {}
		[Toggle]_EnableMetalMatcap("Enable Metal Matcap", Float) = 1
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 10
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 3
		[Toggle]_OutlineDiffuseMultEnable("Outline Diffuse Mult Enable", Float) = 0
		_FakeLightIntensity("Fake Light Intensity", Float) = 1
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_FakeLightDir("Fake Light Dir", Vector) = (1,1,1,0)
		_ShadowBrightness("Shadow Brightness", Range( 0 , 2)) = 1
		_ShadowLayer1Push("Shadow Layer 1 Push", Range( -1 , 1)) = 0
		_ShadowLayer1Fuzziness("Shadow Layer 1 Fuzziness", Range( 0 , 10)) = 0
		_ShadowLayer1Intensity("Shadow Layer 1 Intensity", Range( 0 , 2)) = 1
		_ShadowLayer2Push("Shadow Layer 2 Push", Range( -1 , 1)) = -0.3
		_ShadowLayer2Fuzziness("Shadow Layer 2 Fuzziness", Range( 0 , 10)) = 0
		_ShadowLayer2Intensity("Shadow Layer 2 Intensity", Range( 0 , 2)) = 1
		_ILMLayer1("ILM Layer 1", Range( 0 , 1)) = 0.6
		_ILMLayer2("ILM Layer 2", Range( 0 , 1)) = 0.3
		_VertexLayer1("Vertex Layer 1", Range( 0 , 1)) = 0.31
		_VertexLayer2("Vertex Layer 2", Range( 0 , 1)) = 0.51
		_SpecularIntensity("Specular Intensity", Float) = 1
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.7
		_SpecularFuzzy("Specular Fuzzy", Range( 0 , 10)) = 0
		[Toggle]_EnableFresnelHighlight("Enable Fresnel Highlight", Float) = 0
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
		Tags{ }
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 appendResult231 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 VertexColors441 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult231 ):( v.color ));
			float4 break442 = VertexColors441;
			float outlineVar = ( 1E-05 * _OutlineThickness * break442.z * break442.w );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float4 Base183 = tex2DNode182;
			o.Emission = (( _OutlineDiffuseMultEnable )?( ( _OutlineColor * Base183 ) ):( _OutlineColor )).rgb;
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
		uniform sampler2D _ILM;
		uniform float _HighlightScale;
		uniform float _HighlightPower;
		uniform float _HighlightFreselFuzzy;
		uniform float4 _DarkHighlightMult;
		uniform float _ShadowLayer2Intensity;
		uniform sampler2D _SSS;
		uniform float _ShadowBrightness;
		uniform sampler2D _Base;
		uniform float _ShadowLayer1Intensity;
		uniform float _ShadowLayer1Fuzziness;
		uniform float _ENABLETHISFORGUILTYGEAR;
		uniform float4 _FakeLightDir;
		uniform float _ShadowLayer1Push;
		uniform float _ILMLayer1;
		uniform float _VertexLayer1;
		uniform float _ShadowLayer2Fuzziness;
		uniform float _ShadowLayer2Push;
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
		uniform float _OutlineThickness;
		uniform float _OutlineDiffuseMultEnable;
		uniform float4 _OutlineColor;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 Outline129 = 0;
			v.vertex.xyz += Outline129;
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
			float HasWorldLight87 = (( _ForceFakeLight )?( 0.0 ):( (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 ) ));
			float4 LightColor457 = (( HasWorldLight87 > 0.0 ) ? ase_lightColor :  ( _FakeLightColor * _FakeLightIntensity ) );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMR119 = tex2DNode113.r;
			float fresnelNdotV550 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode550 = ( -0.180914 + ( ILMR119 * _HighlightScale ) * pow( 1.0 - fresnelNdotV550, _HighlightPower ) );
			float4 clampResult545 = clamp( ( (( _EnableFresnelHighlight )?( pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ):( 0.0 )) * _DarkHighlightMult ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ShadowHighlight538 = ( _HighlightIntensity * clampResult545 );
			float2 uv_SSS152 = i.uv_texcoord;
			float4 SSS440 = ( tex2D( _SSS, uv_SSS152 ) * _ShadowBrightness );
			float2 uv_Base182 = i.uv_texcoord;
			float4 tex2DNode182 = tex2D( _Base, uv_Base182 );
			float4 Base183 = tex2DNode182;
			float4 temp_output_449_0 = ( SSS440 * Base183 );
			float4 SSS2448 = ( ShadowHighlight538 + ( _ShadowLayer2Intensity * SSS440 * temp_output_449_0 ) );
			float4 BaseSSS451 = ( temp_output_449_0 * _ShadowLayer1Intensity );
			float4 blendOpSrc548 = Base183;
			float4 blendOpDest548 = SSS440;
			float4 temp_cast_1 = (0.0).xxxx;
			float4 clampResult573 = clamp( ( ( Base183 + ( saturate( (( blendOpSrc548 > 0.5 ) ? max( blendOpDest548, 2.0 * ( blendOpSrc548 - 0.5 ) ) : min( blendOpDest548, 2.0 * blendOpSrc548 ) ) )) ) * (( _EnableFresnelHighlight )?( pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy ) ):( 0.0 )) ) , temp_cast_1 , float4( 1,1,1,0 ) );
			float4 Highlight555 = ( clampResult573 * _HighlightIntensity );
			float4 appendResult231 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 VertexColors441 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult231 ):( i.vertexColor ));
			float4 appendResult728 = (float4(_FakeLightDir.y , _FakeLightDir.x , _FakeLightDir.z , _FakeLightDir.w));
			float4 normalizeResult729 = normalize( appendResult728 );
			float4 MergedRealFakeLightDir86 = (( HasWorldLight87 > 0.0 ) ? float4( ase_worldlightDir , 0.0 ) :  normalizeResult729 );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult3 = dot( MergedRealFakeLightDir86 , float4( ase_normWorldNormal , 0.0 ) );
			float DefaultDot14 = dotResult3;
			float ILMG360 = tex2DNode113.g;
			float temp_output_480_0 = ( 1.0 - ( 0.62 * ILMG360 ) );
			float ILMB117 = tex2DNode113.b;
			float4 color745 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 temp_output_486_0 = ( ( ILMB117 * 0.4 ) + ( color745 + Highlight555 ) );
			float4 ifLocalVar481 = 0;
			if( ( ( ( 1.0 - _ILMLayer1 ) * 0.1 ) + 0.9 ) >= temp_output_480_0 )
				ifLocalVar481 = temp_output_486_0;
			float4 clampResult830 = clamp( ifLocalVar481 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float ILMPrimaryDot809 = clampResult830.r;
			float temp_output_498_0 = ( 1.0 - VertexColors441.x );
			float4 color772 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_504_0 = ( ( ILMG360 * 0.4 ) + ( color772 + Highlight555 ) );
			float4 ifLocalVar500 = 0;
			if( _VertexLayer1 >= temp_output_498_0 )
				ifLocalVar500 = temp_output_504_0;
			float4 clampResult831 = clamp( ifLocalVar500 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float VertexPrimaryDot816 = clampResult831.r;
			float smoothstepResult731 = smoothstep( 0.0 , ( _ShadowLayer1Fuzziness * 0.01 ) , ( ( ( -1.0 + VertexColors441.x + DefaultDot14 ) - _ShadowLayer1Push ) * ILMPrimaryDot809 * VertexPrimaryDot816 ));
			float4 lerpResult732 = lerp( BaseSSS451 , ( Highlight555 + Base183 ) , smoothstepResult731);
			float4 ifLocalVar488 = 0;
			if( ( ( ( 1.0 - _ILMLayer2 ) * 0.1 ) + 0.9 ) >= temp_output_480_0 )
				ifLocalVar488 = temp_output_486_0;
			float4 clampResult775 = clamp( ifLocalVar488 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float ILMSecondaryDot811 = clampResult775.r;
			float4 ifLocalVar507 = 0;
			if( _VertexLayer2 >= temp_output_498_0 )
				ifLocalVar507 = temp_output_504_0;
			float4 clampResult774 = clamp( ifLocalVar507 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float VertexSecondaryDot817 = clampResult774.r;
			float smoothstepResult754 = smoothstep( 0.0 , ( _ShadowLayer2Fuzziness * 0.01 ) , ( ( DefaultDot14 - _ShadowLayer2Push ) * ILMSecondaryDot811 * VertexSecondaryDot817 ));
			float4 lerpResult751 = lerp( SSS2448 , lerpResult732 , smoothstepResult754);
			float4 blendOpSrc659 = Base183;
			float4 blendOpDest659 = SSS440;
			float4 SpecularColor924 = ( _SpecularIntensity * ( Base183 + ( saturate( (( blendOpSrc659 > 0.5 ) ? max( blendOpDest659, 2.0 * ( blendOpSrc659 - 0.5 ) ) : min( blendOpDest659, 2.0 * blendOpSrc659 ) ) )) ) * ILMR119 );
			float smoothstepResult932 = smoothstep( 0.0 , ( _SpecularFuzzy * 0.01 ) , ( ( ( 1.0 - _SpecularSize ) * -0.2 ) + ( DefaultDot14 * ILMB117 * ILMPrimaryDot809 * ILMSecondaryDot811 * VertexPrimaryDot816 * VertexSecondaryDot817 ) ));
			float SpecularDot937 = smoothstepResult932;
			float4 lerpResult925 = lerp( lerpResult751 , ( lerpResult751 + SpecularColor924 ) , SpecularDot937);
			float4 clampResult776 = clamp( lerpResult925 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float ILMA118 = tex2DNode113.a;
			float4 Detail443 = tex2D( _Detail, i.uv2_texcoord2 );
			float BaseAlpha850 = tex2DNode182.a;
			float fresnelNdotV841 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode841 = ( 0.0 + ( _GranblueFresnelScale * BaseAlpha850 ) * pow( 1.0 - fresnelNdotV841, _GranblueFresnelPower ) );
			float clampResult858 = clamp( saturate( fresnelNode841 ) , 0.0 , 1.0 );
			float GranblueFresnel846 = (( _EnableGranblueBlackFresnel )?( ( 1.0 - clampResult858 ) ):( 1.0 ));
			float3 worldToViewDir98 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode103 = tex2D( _MetalMatcap, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir98).xy ) ) );
			float4 MetalMatCap111 = ( Base183 * ( ( _MetalAIntensity * tex2DNode103.r ) + ( tex2DNode103.b * _MetalBIntensity ) ) );
			float4 FinalCustomLight202 = (( _EnableMetalMatcap )?( MetalMatCap111 ):( ( LightColor457 * clampResult776 * ILMA118 * Detail443 * GranblueFresnel846 ) ));
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
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows vertex:vertexDataFunc 

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
	Fallback "Diffuse"
	CustomEditor "ASWShaderGUI"
}
/*ASEBEGIN
Version=17800
-1596;88;1529;880;2649.861;193.4848;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;516;-5196.627,1726.136;Inherit;False;1962.548;1180.316;;18;444;448;451;574;871;447;575;870;449;543;850;183;440;517;182;152;518;112;Color Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;112;-4113.369,2426.359;Inherit;False;585.331;428.9513;ILM Information;5;113;118;117;119;360;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;113;-4088.972,2549.092;Inherit;True;Property;_ILM;ILM;3;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;806;-2545.577,1245.347;Inherit;False;2502.946;1228.72;;13;805;685;829;554;683;604;801;550;553;551;700;578;701;Highlight Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-3764.508,2494.701;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-2495.577,1903.004;Inherit;False;Property;_HighlightScale;Highlight Scale;34;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;152;-5173.614,1870.377;Inherit;True;Property;_SSS;SSS;4;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;518;-5159.741,2070.902;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;16;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-2434.275,1726.168;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;182;-5071.347,2188.143;Inherit;True;Property;_Base;Base;2;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;96908c8406c170e4fa2ac4b1e3baf420;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;553;-2243.185,1961.629;Inherit;False;Property;_HighlightPower;Highlight Power;31;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-2184.084,1733.23;Inherit;False;Constant;_HighlightBias;Highlight Bias;28;0;Create;True;0;0;False;0;-0.180914;-0.180914;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;273;-5747.856,-1981.202;Inherit;False;2991.892;1080.933;;4;17;73;304;456;World Toggles;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;700;-2148.577,1814.004;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-4848.055,1950.349;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;801;-1740.031,1295.347;Inherit;False;1633.612;401.5834;Fresnel for Lit areas;9;549;571;573;555;686;944;548;546;547;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FresnelNode;550;-1907.747,1753.483;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-4735.825,2189.755;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;73;-5718.816,-1926.272;Inherit;False;2305.884;576.6858;Real or Fake light;15;730;86;727;729;728;87;85;83;82;80;77;78;76;75;74;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-4706.305,1960.217;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;74;-5668.816,-1869.316;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;683;-1633.711,1768.237;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-1679.583,1838.891;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;32;0;Create;True;0;0;False;0;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;546;-1690.031,1345.347;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-1683.229,1450.244;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;76;-5618.127,-1684.169;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.AbsOpNode;75;-5427.324,-1867.215;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;304;-4778.546,-1290.103;Inherit;False;978.1387;333.6884;Vertex Color Information;4;441;230;231;142;;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;554;-1430.948,1777.83;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;548;-1444.09,1421.714;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;829;-1279.506,1748.22;Inherit;False;Property;_EnableFresnelHighlight;Enable Fresnel Highlight;30;0;Create;True;0;0;False;0;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;944;-1213.413,1368.005;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;142;-4732.639,-1177.142;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareGreater;77;-5296.547,-1658.718;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;78;-5300.446,-1862.536;Inherit;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;571;-976.1075,1508.706;Float;False;Constant;_Minthathastobeamin;Min that has to be a min;20;1;[HideInInspector];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-5040.684,-1796.875;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;231;-4482.7,-1122.61;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-987.0652,1413.131;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;573;-671.6855,1487.185;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;727;-4837.125,-1540.641;Inherit;False;Property;_FakeLightDir;Fake Light Dir;15;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareGreater;83;-4865.404,-1796.889;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-945.0359,1788.845;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;33;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;230;-4358.799,-1188.609;Inherit;False;Property;_ENABLETHISFORGUILTYGEAR;ENABLE THIS FOR GUILTY GEAR;1;0;Create;True;0;0;False;0;0;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;509;-5144.814,1007.749;Inherit;False;1977.643;624.8688;;20;917;817;816;916;774;831;500;507;840;508;504;501;787;498;503;772;497;502;788;496;Vertex Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;686;-505.864,1487.228;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;728;-4608.728,-1511.241;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;781;-5180.908,193.7039;Inherit;False;1805.828;649.2972;;26;811;809;914;915;775;830;481;488;480;864;861;486;789;862;758;484;863;745;866;790;477;865;483;479;482;490;ILM Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-4020.619,-1197.607;Inherit;False;VertexColors;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;730;-4607.142,-1818.346;Float;False;Property;_ForceFakeLight;Force Fake Light;0;0;Create;True;0;0;False;0;0;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-4961.202,237.8481;Inherit;False;Property;_ILMLayer1;ILM Layer 1;23;0;Create;True;0;0;False;0;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;729;-4468.932,-1513.64;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;87;-4341.59,-1817.27;Float;False;HasWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-3761.308,2574.604;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-4923.676,698.4321;Inherit;False;Property;_ILMLayer2;ILM Layer 2;24;0;Create;True;0;0;False;0;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;82;-4651.999,-1722.361;Inherit;True;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-3765.466,2647.509;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-5094.814,1158.875;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-323.3239,1479.677;Inherit;False;Highlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;790;-5136.745,705.7369;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;497;-4859.646,1156.117;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode;772;-4892.764,1382.721;Inherit;False;Constant;_Color1;Color 1;32;0;Create;True;0;0;False;0;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;788;-4856.927,1548.902;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;502;-4833.68,1307.354;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-5138.946,367.5111;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;479;-5135.154,277.2052;Inherit;False;Constant;_ILMScale;ILM Scale;29;0;Create;True;0;0;False;0;0.62;0.62;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;85;-4037.583,-1787.401;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;866;-4658.927,702.3415;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;745;-5141.267,536.0786;Inherit;False;Constant;_Color0;Color 0;32;0;Create;True;0;0;False;0;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;483;-5130.715,454.6813;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;865;-4690.961,241.3391;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;787;-4599.927,1411.902;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;86;-3741.558,-1797.928;Float;False;MergedRealFakeLightDir;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;503;-4622.478,1311.871;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;789;-4894.967,562.0364;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;862;-4509.03,695.0379;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;758;-4910.877,328.7775;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-4899.956,444.5013;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;17;-5661.608,-1342.502;Inherit;False;802.052;397.3087;Default Dot;4;2;3;14;88;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;805;-1985.174,1982.873;Inherit;False;1894.332;469.0499;Fresnel for Darker areas;14;859;796;793;803;795;804;802;797;794;792;538;718;545;537;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;498;-4609.339,1161.58;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;863;-4542.082,246.8273;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;480;-4755.874,348.1973;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;864;-4415.111,271.2444;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.9;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;840;-4386.092,1403.441;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-4476.512,1507.751;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;26;0;Create;True;0;0;False;0;0.51;0.51;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;859;-1267.792,2249.132;Inherit;False;Property;_DarkHighlightMult;Dark Highlight Mult;38;0;Create;True;0;0;False;0;0.2392157,0.2392157,0.5294118,0;0.2941175,0.2941175,0.7411765,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;486;-4736.558,443.3616;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;2;-5591.746,-1128.192;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;501;-4437.868,1084.394;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;25;0;Create;True;0;0;False;0;0.31;0.138;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;88;-5623.734,-1261.455;Inherit;False;86;MergedRealFakeLightDir;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;861;-4356.938,674.9269;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.9;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;504;-4422.637,1293.872;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;481;-4247.297,313.4268;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;3;-5329.369,-1228.396;Inherit;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;519;-5798.133,-751.0599;Inherit;False;2447.437;817.1572;;32;926;757;927;925;776;751;465;754;732;463;833;812;731;556;470;832;813;818;455;753;557;735;738;820;467;821;834;882;460;473;734;471;Normal Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.ConditionalIfNode;488;-4212.909,622.1038;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;507;-4125.936,1442.768;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;500;-4109.59,1137.701;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;537;-985.4807,2160.002;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-5097.618,-1232.905;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;830;-4049.45,315.6122;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;775;-4029.637,633.5625;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;945;-6943.392,205.1044;Inherit;False;1632.617;1153.819;;2;939;938;Specular System;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;545;-800.6999,2162.129;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;774;-3848.44,1467.916;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-5764.607,-475.6553;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;831;-3845.689,1133.629;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;96;-2589.34,681.1819;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.BreakToComponentsNode;473;-5551.323,-473.6998;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.WorldNormalVector;97;-2539.342,900.3812;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;915;-3884.822,640.0362;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;914;-3903.571,314.5519;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;916;-3685.288,1138.569;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;938;-6863.416,956.6733;Inherit;False;1113.028;370.48;Specular Color;8;657;658;659;921;918;928;924;635;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;-4767.593,2313.074;Inherit;False;BaseAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;718;-598.9145,2148.968;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-5508.415,-312.0804;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;917;-3708.972,1470.595;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;939;-6893.392,255.1044;Inherit;False;1532.617;669.3203;Specular Dot;15;825;824;826;823;625;627;626;631;937;932;936;935;873;629;822;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;860;-2290.833,2576.47;Inherit;False;1792.148;420.865;;10;844;851;849;842;841;857;858;856;854;846;Granblue Black Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;817;-3438.984,1472.221;Inherit;False;VertexSecondaryDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;844;-2240.833,2703.143;Inherit;False;Property;_GranblueFresnelScale;Granblue Fresnel Scale;36;0;Create;True;0;0;False;0;1.12;1.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;816;-3404.705,1137.178;Inherit;False;VertexPrimaryDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-4404.558,2297.729;Inherit;False;Property;_ShadowLayer1Intensity;Shadow Layer 1 Intensity;19;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-4253.562,2181.042;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;882;-5262.058,-501.5515;Inherit;False;3;3;0;FLOAT;-1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;809;-3658.161,315.7819;Inherit;False;ILMPrimaryDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;851;-2248.213,2784.584;Inherit;False;850;BaseAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;811;-3642.163,639.6971;Inherit;False;ILMSecondaryDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-328.8549,2143.514;Inherit;False;ShadowHighlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TransformDirectionNode;98;-2348.401,895.8831;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;543;-4539.634,1870.385;Inherit;False;Property;_ShadowLayer2Intensity;Shadow Layer 2 Intensity;22;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-6857.582,303.1044;Inherit;False;Property;_SpecularSize;Specular Size;28;0;Create;True;0;0;False;0;0.7;0.7;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-5355.416,-651.422;Inherit;False;Property;_ShadowLayer1Push;Shadow Layer 1 Push;17;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-6807.616,1211.453;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-6816.417,1103.556;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;824;-6798.754,735.8627;Inherit;False;816;VertexPrimaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;823;-6790.851,569.5366;Inherit;False;809;ILMPrimaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;849;-1923.124,2709.701;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-5078.889,-220.1733;Inherit;False;Property;_ShadowLayer2Push;Shadow Layer 2 Push;20;0;Create;True;0;0;False;0;-0.3;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;871;-4063.243,2195.518;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;826;-6802.976,651.6897;Inherit;False;811;ILMSecondaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;626;-6571.266,304.9732;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;834;-5012.16,-369.6496;Inherit;False;Property;_ShadowLayer1Fuzziness;Shadow Layer 1 Fuzziness;18;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;100;-2120.347,896.3812;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;-6565.544,421.4019;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;820;-5074.359,-513.0326;Inherit;False;809;ILMPrimaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;575;-3973.709,1835.168;Inherit;False;538;ShadowHighlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;821;-5097.415,-439.8851;Inherit;False;816;VertexPrimaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-3953.878,1923.904;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;738;-4927.353,-668.0898;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;873;-6559.314,516.9776;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;659;-6575.474,1174.923;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-2202.722,2882.335;Inherit;False;Property;_GranblueFresnelPower;Granblue Fresnel Power;35;0;Create;True;0;0;False;0;1.77;1.77;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;825;-6809.509,831.3528;Inherit;False;817;VertexSecondaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;918;-6355.381,1212.153;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;470;-4714.576,-389.7451;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4642.577,-599.8917;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;557;-4644.004,-670.4045;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;813;-5042.924,-143.9889;Inherit;False;811;ILMSecondaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;735;-4804.448,-510.0687;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-1895.344,879.3812;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;627;-6291.119,320.5543;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;822;-6315.676,555.9198;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-6418.509,1006.673;Inherit;False;Property;_SpecularIntensity;Specular Intensity;27;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;921;-6322.379,1110.35;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;574;-3626.149,1913.114;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;832;-4681.333,-75.96187;Inherit;False;Property;_ShadowLayer2Fuzziness;Shadow Layer 2 Fuzziness;21;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-6165.434,651.3436;Inherit;False;Property;_SpecularFuzzy;Specular Fuzzy;29;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;818;-5063.609,-69.72266;Inherit;False;817;VertexSecondaryDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;841;-1755.09,2660.648;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;753;-4775.739,-238.9221;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-3873.494,2181.541;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;631;-6071.016,533.5999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;456;-3718.006,-1333.825;Inherit;False;933.4979;419.9273;Light Color;7;457;220;218;219;946;947;217;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;833;-4398.333,-135.9619;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;928;-6163.416,1070.744;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-1742.345,864.3812;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;556;-4428.501,-582.2267;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;936;-5888.434,657.3436;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-3463.505,1922.332;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;731;-4571.943,-477.3665;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;812;-4594.424,-213.9889;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;857;-1522.746,2660.485;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4440.927,-664.8166;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-1536.343,733.2808;Float;False;Property;_MetalAIntensity;Metal A Intensity;8;0;Create;True;0;0;False;0;1;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-3502.97,-996.9728;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-3700.971,-1094.962;Float;False;Property;_FakeLightColor;Fake Light Color;14;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;754;-4262.114,-236.636;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-1516.042,1049.88;Float;False;Property;_MetalBIntensity;Metal B Intensity;9;0;Create;True;0;0;False;0;10;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;444;-5044.073,2516.728;Inherit;False;854.0317;283.3198;Detail;3;216;215;443;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;103;-1597.345,824.3812;Inherit;True;Property;_MetalMatcap;Metal Matcap;6;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;96908c8406c170e4fa2ac4b1e3baf420;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4248.011,-627.9604;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;858;-1378.197,2654.686;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;732;-4248.857,-536.285;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;932;-5739.203,574.0404;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;924;-5993.386,1094.443;Inherit;False;SpecularColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;856;-1236.871,2655.338;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;946;-3305.584,-1091.112;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;218;-3675.721,-1209.72;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;219;-3693.002,-1288.019;Inherit;False;87;HasWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;926;-4107.417,-419.7226;Inherit;False;924;SpecularColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-1265.044,830.4803;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;751;-4033.589,-579.7823;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-1260.338,998.0796;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-4994.073,2582.764;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;937;-5567.775,576.3353;Inherit;False;SpecularDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;757;-3931.586,-322.1501;Inherit;False;937;SpecularDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;854;-1077.775,2626.47;Inherit;False;Property;_EnableGranblueBlackFresnel;Enable Granblue Black Fresnel;37;0;Create;True;0;0;False;0;1;2;0;FLOAT;1;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-1101.144,900.4813;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;220;-3184.522,-1190.58;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;215;-4753.827,2570.048;Inherit;True;Property;_Detail;Detail;5;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;927;-3856.659,-503.7805;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-1204.431,731.1829;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;120;-2814.559,23.83143;Inherit;False;1512.901;563.9084;;11;129;128;126;127;123;442;125;124;122;234;121;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;-2695.387,270.6572;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-2981.558,-1178.593;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;784;-3026.052,-597.3561;Inherit;False;593.0671;443.9203;Get those detail lines in and apply light color;5;848;513;512;515;514;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;925;-3676.866,-550.2042;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-935.1429,848.0811;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-4414.041,2566.728;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;846;-759.6849,2630.188;Inherit;False;GranblueFresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-3762.17,2725.312;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;121;-2764.559,89.66434;Float;False;Property;_OutlineColor;Outline Color;10;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;234;-2714.412,420.4786;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-2965.052,-409.4363;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-782.0149,848.8992;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-2964.7,-328.5415;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-2974.777,-547.3562;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;776;-3501.434,-545.3652;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-2345.944,251.8743;Float;False;Constant;_Float46;Float 46;17;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;785;-2366.763,-518.5573;Inherit;False;557.4119;264.3823;Bro are you using Matcap?;2;520;521;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-2450.868,330.8223;Float;False;Property;_OutlineThickness;Outline Thickness;11;0;Create;True;0;0;False;0;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;124;-2411.392,133.8314;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;442;-2478.175,415.3618;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;848;-2993.406,-246.1475;Inherit;False;846;GranblueFresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-2168.808,257.0703;Inherit;False;4;4;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;126;-2214.029,89.09244;Inherit;False;Property;_OutlineDiffuseMultEnable;Outline Diffuse Mult Enable;12;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-2316.763,-370.1753;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-2601.986,-458.3754;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;786;-1745.467,-515.8891;Inherit;False;289.6;166;Finally output;1;202;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OutlineNode;128;-1930.924,225.1133;Inherit;False;0;False;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;520;-2092.352,-460.5576;Inherit;False;Property;_EnableMetalMatcap;Enable Metal Matcap;7;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;246;-2589.132,-1491.87;Inherit;False;730.6176;504;;4;130;0;18;878;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;129;-1657.742,221.4483;Inherit;False;Outline;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;202;-1710.238,-458.3649;Inherit;False;FinalCustomLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;794;-1502.707,2070.861;Inherit;False;Difference;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;796;-1259.404,2123.447;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;795;-1744.69,2066.087;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;792;-1933.693,2014.219;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;802;-1547.67,2032.135;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;803;-1547.67,2197.135;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;793;-1731.623,2241.321;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;18;-2448.132,-1236.021;Inherit;False;202;FinalCustomLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;878;-2436.167,-1374.369;Inherit;False;TestingOutput;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;130;-2507.519,-1114.241;Inherit;False;129;Outline;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;797;-1969.9,2191.053;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;804;-1763.67,2215.135;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-2129.512,-1442.87;Float;False;True;-1;2;ASWShaderGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light v6.2.0 - Prism;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;1;False;-1;255;False;-1;255;False;-1;3;False;-1;3;False;-1;2;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;119;0;113;1
WireConnection;700;0;578;0
WireConnection;700;1;701;0
WireConnection;517;0;152;0
WireConnection;517;1;518;0
WireConnection;550;1;551;0
WireConnection;550;2;700;0
WireConnection;550;3;553;0
WireConnection;183;0;182;0
WireConnection;440;0;517;0
WireConnection;683;0;550;0
WireConnection;75;0;74;0
WireConnection;554;0;683;0
WireConnection;554;1;604;0
WireConnection;548;0;546;0
WireConnection;548;1;547;0
WireConnection;829;1;554;0
WireConnection;944;0;546;0
WireConnection;944;1;548;0
WireConnection;77;0;76;2
WireConnection;78;0;75;0
WireConnection;80;0;78;0
WireConnection;80;1;77;0
WireConnection;231;0;142;3
WireConnection;231;1;142;2
WireConnection;231;2;142;1
WireConnection;231;3;142;4
WireConnection;549;0;944;0
WireConnection;549;1;829;0
WireConnection;573;0;549;0
WireConnection;573;1;571;0
WireConnection;83;0;80;0
WireConnection;230;0;142;0
WireConnection;230;1;231;0
WireConnection;686;0;573;0
WireConnection;686;1;685;0
WireConnection;728;0;727;2
WireConnection;728;1;727;1
WireConnection;728;2;727;3
WireConnection;728;3;727;4
WireConnection;441;0;230;0
WireConnection;730;0;83;0
WireConnection;729;0;728;0
WireConnection;87;0;730;0
WireConnection;360;0;113;2
WireConnection;117;0;113;3
WireConnection;555;0;686;0
WireConnection;497;0;496;0
WireConnection;85;0;87;0
WireConnection;85;2;82;0
WireConnection;85;3;729;0
WireConnection;866;0;490;0
WireConnection;865;0;482;0
WireConnection;787;0;772;0
WireConnection;787;1;788;0
WireConnection;86;0;85;0
WireConnection;503;0;502;0
WireConnection;789;0;745;0
WireConnection;789;1;790;0
WireConnection;862;0;866;0
WireConnection;758;0;479;0
WireConnection;758;1;477;0
WireConnection;484;0;483;0
WireConnection;498;0;497;0
WireConnection;863;0;865;0
WireConnection;480;0;758;0
WireConnection;864;0;863;0
WireConnection;840;0;498;0
WireConnection;486;0;484;0
WireConnection;486;1;789;0
WireConnection;861;0;862;0
WireConnection;504;0;503;0
WireConnection;504;1;787;0
WireConnection;481;0;864;0
WireConnection;481;1;480;0
WireConnection;481;2;486;0
WireConnection;481;3;486;0
WireConnection;3;0;88;0
WireConnection;3;1;2;0
WireConnection;488;0;861;0
WireConnection;488;1;480;0
WireConnection;488;2;486;0
WireConnection;488;3;486;0
WireConnection;507;0;508;0
WireConnection;507;1;840;0
WireConnection;507;2;504;0
WireConnection;507;3;504;0
WireConnection;500;0;501;0
WireConnection;500;1;498;0
WireConnection;500;2;504;0
WireConnection;500;3;504;0
WireConnection;537;0;829;0
WireConnection;537;1;859;0
WireConnection;14;0;3;0
WireConnection;830;0;481;0
WireConnection;775;0;488;0
WireConnection;545;0;537;0
WireConnection;774;0;507;0
WireConnection;831;0;500;0
WireConnection;473;0;471;0
WireConnection;915;0;775;0
WireConnection;914;0;830;0
WireConnection;916;0;831;0
WireConnection;850;0;182;4
WireConnection;718;0;685;0
WireConnection;718;1;545;0
WireConnection;917;0;774;0
WireConnection;817;0;917;0
WireConnection;816;0;916;0
WireConnection;449;0;440;0
WireConnection;449;1;183;0
WireConnection;882;1;473;0
WireConnection;882;2;734;0
WireConnection;809;0;914;0
WireConnection;811;0;915;0
WireConnection;538;0;718;0
WireConnection;98;0;97;0
WireConnection;849;0;844;0
WireConnection;849;1;851;0
WireConnection;871;0;449;0
WireConnection;871;1;870;0
WireConnection;626;0;625;0
WireConnection;100;0;98;0
WireConnection;447;0;543;0
WireConnection;447;1;440;0
WireConnection;447;2;449;0
WireConnection;738;0;882;0
WireConnection;738;1;460;0
WireConnection;659;0;658;0
WireConnection;659;1;657;0
WireConnection;470;0;834;0
WireConnection;735;0;738;0
WireConnection;735;1;820;0
WireConnection;735;2;821;0
WireConnection;101;1;100;0
WireConnection;627;0;626;0
WireConnection;822;0;629;0
WireConnection;822;1;873;0
WireConnection;822;2;823;0
WireConnection;822;3;826;0
WireConnection;822;4;824;0
WireConnection;822;5;825;0
WireConnection;921;0;658;0
WireConnection;921;1;659;0
WireConnection;574;0;575;0
WireConnection;574;1;447;0
WireConnection;841;2;849;0
WireConnection;841;3;842;0
WireConnection;753;0;734;0
WireConnection;753;1;467;0
WireConnection;451;0;871;0
WireConnection;631;0;627;0
WireConnection;631;1;822;0
WireConnection;833;0;832;0
WireConnection;928;0;635;0
WireConnection;928;1;921;0
WireConnection;928;2;918;0
WireConnection;102;1;101;0
WireConnection;556;0;557;0
WireConnection;556;1;455;0
WireConnection;936;0;935;0
WireConnection;448;0;574;0
WireConnection;731;0;735;0
WireConnection;731;2;470;0
WireConnection;812;0;753;0
WireConnection;812;1;813;0
WireConnection;812;2;818;0
WireConnection;857;0;841;0
WireConnection;754;0;812;0
WireConnection;754;2;833;0
WireConnection;103;1;102;0
WireConnection;858;0;857;0
WireConnection;732;0;463;0
WireConnection;732;1;556;0
WireConnection;732;2;731;0
WireConnection;932;0;631;0
WireConnection;932;2;936;0
WireConnection;924;0;928;0
WireConnection;856;0;858;0
WireConnection;946;0;217;0
WireConnection;946;1;947;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;751;0;465;0
WireConnection;751;1;732;0
WireConnection;751;2;754;0
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;937;0;932;0
WireConnection;854;1;856;0
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;220;0;219;0
WireConnection;220;2;218;0
WireConnection;220;3;946;0
WireConnection;215;1;216;0
WireConnection;927;0;751;0
WireConnection;927;1;926;0
WireConnection;457;0;220;0
WireConnection;925;0;751;0
WireConnection;925;1;927;0
WireConnection;925;2;757;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;443;0;215;0
WireConnection;846;0;854;0
WireConnection;118;0;113;4
WireConnection;111;0;110;0
WireConnection;776;0;925;0
WireConnection;124;0;121;0
WireConnection;124;1;122;0
WireConnection;442;0;234;0
WireConnection;127;0;123;0
WireConnection;127;1;125;0
WireConnection;127;2;442;2
WireConnection;127;3;442;3
WireConnection;126;0;121;0
WireConnection;126;1;124;0
WireConnection;513;0;515;0
WireConnection;513;1;776;0
WireConnection;513;2;512;0
WireConnection;513;3;514;0
WireConnection;513;4;848;0
WireConnection;128;0;126;0
WireConnection;128;1;127;0
WireConnection;520;0;513;0
WireConnection;520;1;521;0
WireConnection;129;0;128;0
WireConnection;202;0;520;0
WireConnection;794;0;802;0
WireConnection;794;1;803;0
WireConnection;796;0;794;0
WireConnection;796;1;793;2
WireConnection;796;2;795;3
WireConnection;795;0;792;0
WireConnection;802;0;792;0
WireConnection;803;0;804;0
WireConnection;793;0;797;0
WireConnection;804;0;797;0
WireConnection;0;13;18;0
WireConnection;0;11;130;0
ASEEND*/
//CHKSM=6B75C90F5F75BEC4145D6D996FB18A0F6D03D37D
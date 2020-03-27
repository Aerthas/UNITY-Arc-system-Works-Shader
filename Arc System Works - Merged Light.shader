// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light - Version 6.0.0"
{
	Properties
	{
		[Toggle]_AutomaticLight0FakeLightonly1("Automatic Light = 0  Fake Light only = 1", Float) = 0
		[Toggle]_ENABLETHISFORGUILTYGEAR("ENABLE THIS FOR GUILTY GEAR", Float) = 1
		_FakeLightDir("Fake Light Dir", Vector) = (1,1,1,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[NoScaleOffset]_Detail("Detail", 2D) = "white" {}
		[NoScaleOffset]_MetalMatcap("Metal Matcap", 2D) = "white" {}
		[Toggle]_EnableMetalMatcap("Enable Metal Matcap", Float) = 0
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 10
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 2
		[Toggle]_OutlineDiffuseMultEnable("Outline Diffuse Mult Enable", Float) = 0
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_LightLayer1("Light Layer 1", Range( -1 , 1)) = 0
		_LightLayer2("Light Layer 2", Range( -1 , 1)) = -0.3
		_ILMLayer1("ILM Layer 1", Range( 0 , 1)) = 0.92
		_ILMLayer2("ILM Layer 2", Range( 0 , 1)) = 0.93
		_VertexLayer1("Vertex Layer 1", Range( 0 , 1)) = 0.18
		_VertexLayer2("Vertex Layer 2", Range( 0 , 1)) = 0.3
		_ShadowBrightness("Shadow Brightness", Range( 0 , 1)) = 1
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.18
		_SpecularIntensity("Specular Intensity", Float) = 0.5
		_SpecularFuzzySolid("Specular Fuzzy <-> Solid", Range( -1 , 1)) = 0
		_HighlightPower("Highlight Power", Float) = 5
		_HighlightFreselFuzzy("Highlight Fresel Fuzzy", Float) = 0.01
		_HighlightIntensity("Highlight Intensity", Float) = 1
		_HighlightScale("Highlight Scale", Float) = 1
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
		#pragma surface outlineSurf Outline nofog  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 appendResult231 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 VertexColors441 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult231 ):( v.color ));
			float outlineVar = ( 1E-05 * _OutlineThickness * VertexColors441.z );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base182 = i.uv_texcoord;
			float4 Base183 = tex2D( _Base, uv_Base182 );
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
			float2 uv2_texcoord2;
			float2 uv_texcoord;
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

		uniform float _EnableMetalMatcap;
		uniform float4 _FakeLightColor;
		uniform sampler2D _Detail;
		uniform float _ILMLayer2;
		uniform sampler2D _ILM;
		uniform float _ILMLayer1;
		uniform float _HighlightIntensity;
		uniform sampler2D _Base;
		uniform sampler2D _SSS;
		uniform float _ShadowBrightness;
		uniform float _HighlightScale;
		uniform float _HighlightPower;
		uniform float _HighlightFreselFuzzy;
		uniform float _VertexLayer2;
		uniform float _ENABLETHISFORGUILTYGEAR;
		uniform float _VertexLayer1;
		uniform float _AutomaticLight0FakeLightonly1;
		uniform float4 _FakeLightDir;
		uniform float _LightLayer1;
		uniform float _LightLayer2;
		uniform float _SpecularIntensity;
		uniform float _SpecularSize;
		uniform float _SpecularFuzzySolid;
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
			float temp_output_83_0 = (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 );
			float HasWorldLight87 = temp_output_83_0;
			float4 LightColor457 = (( HasWorldLight87 > 0.0 ) ? ase_lightColor :  _FakeLightColor );
			float4 Detail443 = tex2D( _Detail, i.uv2_texcoord2 );
			float2 uv_ILM113 = i.uv_texcoord;
			float4 tex2DNode113 = tex2D( _ILM, uv_ILM113 );
			float ILMG360 = tex2DNode113.g;
			float temp_output_480_0 = ( 1.0 - ( 0.62 * ILMG360 ) );
			float ILMB117 = tex2DNode113.b;
			float4 color745 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float2 uv_Base182 = i.uv_texcoord;
			float4 Base183 = tex2D( _Base, uv_Base182 );
			float2 uv_SSS152 = i.uv_texcoord;
			float4 SSS440 = ( tex2D( _SSS, uv_SSS152 ) * _ShadowBrightness );
			float4 blendOpSrc548 = Base183;
			float4 blendOpDest548 = SSS440;
			float4 clampResult563 = clamp( ( saturate( (( blendOpSrc548 > 0.5 ) ? max( blendOpDest548, 2.0 * ( blendOpSrc548 - 0.5 ) ) : min( blendOpDest548, 2.0 * blendOpSrc548 ) ) )) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float ILMR119 = tex2DNode113.r;
			float fresnelNdotV550 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode550 = ( -0.180914 + ( ILMR119 * _HighlightScale ) * pow( 1.0 - fresnelNdotV550, _HighlightPower ) );
			float temp_output_554_0 = pow( saturate( fresnelNode550 ) , _HighlightFreselFuzzy );
			float4 temp_cast_1 = (0.0).xxxx;
			float4 clampResult573 = clamp( ( clampResult563 * temp_output_554_0 ) , temp_cast_1 , float4( 1,1,1,0 ) );
			float4 Highlight555 = ( _HighlightIntensity * clampResult573 );
			float4 temp_output_486_0 = ( ( ILMB117 * 0.4 ) + ( color745 + Highlight555 ) );
			float4 temp_output_449_0 = ( SSS440 * Base183 );
			float4 BaseSSS451 = temp_output_449_0;
			float4 ifLocalVar481 = 0;
			if( _ILMLayer1 >= temp_output_480_0 )
				ifLocalVar481 = temp_output_486_0;
			else
				ifLocalVar481 = BaseSSS451;
			float4 blendOpSrc794 = SSS440;
			float4 blendOpDest794 = Base183;
			float4 temp_cast_2 = (Base183.b).xxxx;
			float4 lerpResult796 = lerp( ( saturate( abs( blendOpSrc794 - blendOpDest794 ) )) , temp_cast_2 , SSS440.a);
			float4 clampResult545 = clamp( ( temp_output_554_0 * lerpResult796 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 ShadowHighlight538 = ( _HighlightIntensity * clampResult545 );
			float4 temp_output_447_0 = ( SSS440 * temp_output_449_0 * 1.5 );
			float4 SSS2448 = ( ShadowHighlight538 + temp_output_447_0 );
			float4 ifLocalVar488 = 0;
			if( _ILMLayer2 >= temp_output_480_0 )
				ifLocalVar488 = ifLocalVar481;
			else
				ifLocalVar488 = SSS2448;
			float4 clampResult775 = clamp( ifLocalVar488 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 appendResult231 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 VertexColors441 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult231 ):( i.vertexColor ));
			float temp_output_499_0 = ( ( 1.0 - VertexColors441.x ) * 0.6 );
			float4 color772 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_output_504_0 = ( ( ILMG360 * 0.4 ) + ( color772 + Highlight555 ) );
			float4 ifLocalVar500 = 0;
			if( _VertexLayer1 >= temp_output_499_0 )
				ifLocalVar500 = temp_output_504_0;
			else
				ifLocalVar500 = BaseSSS451;
			float4 ifLocalVar507 = 0;
			if( _VertexLayer2 >= temp_output_499_0 )
				ifLocalVar507 = ifLocalVar500;
			else
				ifLocalVar507 = SSS2448;
			float4 clampResult774 = clamp( ifLocalVar507 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 lerpResult765 = lerp( clampResult775 , clampResult774 , clampResult775);
			float4 appendResult728 = (float4(_FakeLightDir.y , _FakeLightDir.x , _FakeLightDir.z , _FakeLightDir.w));
			float4 normalizeResult729 = normalize( appendResult728 );
			float4 MergedRealFakeLightDir86 = (( _AutomaticLight0FakeLightonly1 )?( normalizeResult729 ):( (( temp_output_83_0 > 0.0 ) ? float4( ase_worldlightDir , 0.0 ) :  normalizeResult729 ) ));
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult3 = dot( MergedRealFakeLightDir86 , float4( ase_normWorldNormal , 0.0 ) );
			float DefaultDot14 = dotResult3;
			float smoothstepResult731 = smoothstep( 0.0 , 0.0 , ( ( DefaultDot14 - _LightLayer1 ) * VertexColors441.x ));
			float4 lerpResult732 = lerp( BaseSSS451 , ( Highlight555 + Base183 ) , smoothstepResult731);
			float smoothstepResult754 = smoothstep( 0.0 , 0.0 , ( VertexColors441.x * ( DefaultDot14 - _LightLayer2 ) ));
			float4 lerpResult751 = lerp( SSS2448 , lerpResult732 , smoothstepResult754);
			float ifLocalVar778 = 0;
			if( HasWorldLight87 <= 0.0 )
				ifLocalVar778 = 1.0;
			else
				ifLocalVar778 = ase_lightColor.a;
			float4 blendOpSrc659 = Base183;
			float4 blendOpDest659 = SSS440;
			float4 clampResult660 = clamp( ( saturate( (( blendOpSrc659 > 0.5 ) ? max( blendOpDest659, 2.0 * ( blendOpSrc659 - 0.5 ) ) : min( blendOpDest659, 2.0 * blendOpSrc659 ) ) )) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float smoothstepResult640 = smoothstep( 0.0 , 0.05 , ( ( ( ( 1.0 - _SpecularSize ) * -2.0 ) + DefaultDot14 + ILMB117 ) * ILMB117 ));
			float smoothstepResult642 = smoothstep( smoothstepResult640 , ( _SpecularFuzzySolid * 0.01 ) , 0.0);
			float4 lerpResult644 = lerp( float4( 0,0,0,0 ) , ( ifLocalVar778 * _SpecularIntensity * LightColor457 * clampResult660 * ILMR119 ) , smoothstepResult642);
			float4 SpecularAdd645 = lerpResult644;
			float4 clampResult776 = clamp( ( lerpResult751 + SpecularAdd645 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 lerpResult766 = lerp( lerpResult765 , clampResult776 , lerpResult765);
			float ILMA118 = tex2DNode113.a;
			float3 worldToViewDir98 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode103 = tex2D( _MetalMatcap, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir98).xy ) ) );
			float4 MetalMatCap111 = ( Base183 * ( ( _MetalAIntensity * tex2DNode103.r ) + ( tex2DNode103.b * _MetalBIntensity ) ) );
			float4 FinalCustomLight202 = (( _EnableMetalMatcap )?( MetalMatCap111 ):( ( LightColor457 * Detail443 * lerpResult766 * ILMA118 ) ));
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
				o.customPack1.xy = customInputData.uv2_texcoord2;
				o.customPack1.xy = v.texcoord1;
				o.customPack1.zw = customInputData.uv_texcoord;
				o.customPack1.zw = v.texcoord;
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
				surfIN.uv2_texcoord2 = IN.customPack1.xy;
				surfIN.uv_texcoord = IN.customPack1.zw;
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
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17700
-1570;76;1522;836;5111.85;758.4448;1.680686;True;True
Node;AmplifyShaderEditor.CommentaryNode;273;-4844.569,-1909.259;Inherit;False;2400.949;1069.005;;3;17;304;73;World Toggles;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;73;-4815.529,-1854.329;Inherit;False;2305.884;576.6858;Real or Fake light;15;730;86;727;729;728;87;85;83;82;80;77;78;76;75;74;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;74;-4765.529,-1797.373;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;76;-4714.84,-1612.226;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.AbsOpNode;75;-4524.036,-1795.272;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;516;-5041.632,1495.488;Inherit;False;2300.792;1213.049;;17;574;444;448;600;451;575;447;449;543;456;440;517;152;518;183;182;112;Color Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector4Node;727;-3933.837,-1468.698;Inherit;False;Property;_FakeLightDir;Fake Light Dir;2;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;112;-3772.885,2217.535;Inherit;False;585.331;428.9513;ILM Information;5;113;118;117;119;360;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCCompareGreater;77;-4393.26,-1586.775;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;78;-4397.158,-1790.593;Inherit;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;113;-3748.489,2340.267;Inherit;True;Property;_ILM;ILM;4;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;801fb10f5ba77004c843502f33f7c6ef;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;152;-5018.619,1639.73;Inherit;True;Property;_SSS;SSS;5;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;33c266f0a4ad68d4ba4cd125438746fd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;182;-4916.352,1957.496;Inherit;True;Property;_Base;Base;3;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;997b3c17f36210a48a88b113ba1cc12f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;806;-2545.577,1245.347;Inherit;False;2487.473;1209.379;;12;805;801;701;578;553;551;700;550;683;554;685;604;Highlight Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;728;-3705.44,-1439.298;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-4137.396,-1724.932;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-5004.746,1840.254;Inherit;False;Property;_ShadowBrightness;Shadow Brightness;21;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-4580.83,1959.108;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-3424.025,2285.877;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;805;-1875.876,1994.624;Inherit;False;1767.772;460.1012;Fresnel for Darker areas;13;796;794;802;795;803;804;793;797;792;537;545;718;538;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NormalizeNode;729;-3565.644,-1441.697;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;82;-3748.711,-1650.418;Inherit;True;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCCompareGreater;83;-3962.116,-1724.946;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;517;-4693.06,1719.702;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;-4551.31,1729.57;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;797;-1825.876,2221.458;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;85;-3363.098,-1728.458;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-2434.275,1726.168;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-2495.577,1903.004;Inherit;False;Property;_HighlightScale;Highlight Scale;29;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;730;-3114.153,-1724.806;Float;False;Property;_AutomaticLight0FakeLightonly1;Automatic Light = 0  Fake Light only = 1;0;0;Create;True;0;0;False;0;0;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;801;-1740.031,1295.347;Inherit;False;1596.707;403.89;Fresnel for Lit areas;10;546;547;548;563;549;573;686;555;687;571;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-2184.084,1733.23;Inherit;False;Constant;_HighlightBias;Highlight Bias;28;0;Create;True;0;0;False;0;-0.180914;-0.180914;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;700;-2148.577,1814.004;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;553;-2243.185,1961.629;Inherit;False;Property;_HighlightPower;Highlight Power;25;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;792;-1789.669,2044.624;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;804;-1619.646,2245.54;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;547;-1683.229,1450.244;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FresnelNode;550;-1907.747,1753.483;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;546;-1690.031,1345.347;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;803;-1403.646,2227.54;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;802;-1403.646,2062.54;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;86;-2766.385,-1737.58;Float;False;MergedRealFakeLightDir;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;17;-4809.321,-1267.559;Inherit;False;802.052;397.3087;Default Dot;4;2;3;14;88;;1,1,1,1;0;0
Node;AmplifyShaderEditor.BreakToComponentsNode;795;-1600.666,2096.492;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BlendOpsNode;548;-1435.09,1388.714;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;683;-1633.711,1768.237;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;794;-1358.683,2101.266;Inherit;False;Difference;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;793;-1587.599,2271.726;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;604;-1679.583,1838.891;Inherit;False;Property;_HighlightFreselFuzzy;Highlight Fresel Fuzzy;26;0;Create;True;0;0;False;0;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;2;-4739.458,-1053.249;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;88;-4771.447,-1186.512;Inherit;False;86;MergedRealFakeLightDir;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;304;-3875.258,-1218.16;Inherit;False;978.1387;333.6884;Vertex Color Information;4;441;230;231;142;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;782;-8322.245,-460.6229;Inherit;False;2461.622;911.0243;;33;677;625;682;626;629;678;679;628;627;658;631;657;659;636;780;779;656;633;660;634;640;639;635;777;778;637;642;644;645;649;646;647;648;Specular System;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;796;-1147.6,2204.726;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;563;-1155.616,1474.635;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;554;-1459.948,1772.83;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-8093.073,-135.1645;Inherit;False;Property;_SpecularSize;Specular Size;22;0;Create;True;0;0;False;0;0.18;0.527;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;142;-3829.351,-1105.199;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;3;-4477.081,-1153.453;Inherit;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;626;-7761.995,-134.0085;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;87;-3719.102,-1797.329;Float;False;HasWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-993.9851,1476.562;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;537;-973.7297,2171.753;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;571;-973.8009,1577.904;Float;False;Constant;_Minthathastobeamin;Min that has to be a min;20;1;[HideInInspector];Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-4234.614,-1160.382;Inherit;False;DefaultDot;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;231;-3579.412,-1050.667;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;456;-3532.638,1610.492;Inherit;False;759.8096;487.8899;Light Color;5;220;219;217;218;457;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-3424.983,2438.684;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;628;-7466.263,69.18845;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;-8056.477,-18.79244;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-3482.638,1877.382;Float;False;Property;_FakeLightColor;Fake Light Color;14;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;573;-648.6193,1540.237;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;545;-788.9489,2173.88;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;96;-1978.026,658.3291;Inherit;False;2074.331;483.6988;;14;111;110;109;108;107;106;105;104;103;102;101;100;98;97;Metal Matcap Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.LightColorNode;218;-3461.002,1745.079;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;685;-945.0359,1788.845;Inherit;False;Property;_HighlightIntensity;Highlight Intensity;28;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;230;-3455.511,-1116.666;Inherit;False;Property;_ENABLETHISFORGUILTYGEAR;ENABLE THIS FOR GUILTY GEAR;1;0;Create;True;0;0;False;0;1;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;219;-3471.994,1660.491;Inherit;False;87;HasWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;627;-7448.75,-131.8295;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-7173.205,-305.7258;Inherit;False;440;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-7180.006,-410.6229;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;97;-1928.028,877.5284;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;509;-5191.932,731.2692;Inherit;False;1570.753;612.2599;;17;774;507;511;500;508;504;501;506;499;772;498;503;497;502;496;787;788;Vertex Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-3117.332,-1125.664;Inherit;False;VertexColors;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;718;-587.1635,2160.719;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;519;-5643.775,-751.0599;Inherit;False;2076.594;676.3238;;22;776;756;751;754;732;465;556;463;470;731;557;455;753;735;461;473;467;738;471;460;734;757;Normal Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;631;-7253.321,-73.88255;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;220;-3235.829,1748.007;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;686;-505.864,1487.228;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-5141.932,882.3936;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-5496.236,-389.6715;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;781;-5200.594,-24.91051;Inherit;False;1345.668;645.637;;16;483;477;479;745;484;758;487;480;486;482;490;489;481;488;775;789;ILM Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-3420.825,2365.779;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;659;-6925.065,-367.2559;Inherit;False;PinLight;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-4387.542,1832.104;Inherit;False;Constant;_Float4;Float 4;30;0;Create;True;0;0;False;0;1.5;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;449;-4345.558,1947.694;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;538;-317.1039,2155.265;Inherit;False;ShadowHighlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-5372.312,-494.4302;Inherit;False;Property;_LightLayer1;Light Layer 1;15;0;Create;True;0;0;False;0;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-367.3239,1496.677;Inherit;False;Highlight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;734;-5277.062,-642.5864;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;98;-1737.087,873.0303;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;656;-7028.67,-217.7988;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;633;-7423.81,293.2136;Inherit;False;Property;_SpecularFuzzySolid;Specular Fuzzy <-> Solid;24;0;Create;True;0;0;False;0;0;0.01;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-3031.976,1747.099;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;779;-6895.955,-231.3038;Inherit;False;87;HasWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;636;-7101.147,80.23246;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;780;-6834.955,-136.3038;Inherit;False;Constant;_Float1;Float 1;32;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-5149.062,308.4297;Inherit;False;117;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;461;-4998.223,-301.9738;Inherit;False;14;DefaultDot;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;473;-5262.771,-388.2926;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;634;-7001.736,-11.49856;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;479;-5145.463,25.08949;Inherit;False;Constant;_ILMScale;ILM Scale;28;0;Create;True;0;0;False;0;0.62;0.62;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;772;-4939.882,1106.24;Inherit;False;Constant;_Color1;Color 1;32;0;Create;True;0;0;False;0;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;639;-7018.799,296.1055;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;778;-6682.955,-201.3038;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-4220.749,1742.324;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;788;-4904.044,1272.421;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-5150.594,112.7152;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;745;-5190.453,387.7265;Inherit;False;Constant;_Color0;Color 0;32;0;Create;True;0;0;False;0;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;635;-6992.808,-86.44852;Inherit;False;Property;_SpecularIntensity;Specular Intensity;23;0;Create;True;0;0;False;0;0.5;31.39;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;790;-5109.333,559.324;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;777;-6758.955,16.69617;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;738;-5062.486,-500.6893;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;100;-1509.033,873.5284;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;467;-5065.469,-211.9394;Inherit;False;Property;_LightLayer2;Light Layer 2;16;0;Create;True;0;0;False;0;-0.3;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;660;-6653.591,-333.3348;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;497;-4929.763,892.6357;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;502;-4880.798,1030.873;Inherit;False;360;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;575;-4311.938,1643.478;Inherit;False;538;ShadowHighlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;640;-6933.227,125.2145;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;557;-4913.259,-629.8105;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;787;-4647.044,1135.421;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;503;-4669.595,1035.39;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;637;-6528.522,-85.54362;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;753;-4676.97,-270.727;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;735;-4904.206,-463.3876;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;498;-4663.456,894.099;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-4957.162,294.2296;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;789;-4917.333,390.324;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;642;-6672.175,122.1025;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-4910.107,-544.0972;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;574;-4029.938,1611.478;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;758;-4938.603,71.30158;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-4113.9,1932.393;Inherit;False;BaseSSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-1284.031,856.5284;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-1131.032,841.5284;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;504;-4487.754,1035.391;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;486;-4780.362,287.7296;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;487;-4768.76,452.1862;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;556;-4684.352,-581.6284;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;506;-4494.534,1134.78;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-4800.861,-707.4179;Inherit;False;451;BaseSSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;644;-6313.035,-42.72445;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-3782.089,1725.73;Inherit;False;SSS2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;731;-4683.425,-464.6692;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;499;-4482.016,895.5625;Inherit;False;2;2;0;FLOAT;0.6;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;470;-4498.81,-316.6044;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;482;-5105.63,208.9185;Inherit;False;Property;_ILMLayer1;ILM Layer 1;17;0;Create;True;0;0;False;0;0.92;0.92;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-4607.184,788.4127;Inherit;False;Property;_VertexLayer1;Vertex Layer 1;19;0;Create;True;0;0;False;0;0.18;0.18;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;480;-4796.999,101.4419;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-4563.679,53.43783;Inherit;False;Property;_ILMLayer2;ILM Layer 2;18;0;Create;True;0;0;False;0;0.93;0.93;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;444;-4889.078,2286.081;Inherit;False;854.0317;283.3198;Detail;3;216;215;443;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;103;-986.032,801.5284;Inherit;True;Property;_MetalMatcap;Metal Matcap;7;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;754;-4310.093,-323.8022;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;732;-4469.688,-587.9323;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4254.945,-654.2634;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;481;-4554.705,199.8382;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;500;-4259.606,885.3194;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-904.7292,1027.027;Float;False;Property;_MetalBIntensity;Metal B Intensity;10;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;645;-6099.945,-35.69054;Inherit;False;SpecularAdd;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;511;-4245.595,1123.176;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;489;-4445.876,388.0388;Inherit;False;448;SSS2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-925.03,710.428;Float;False;Property;_MetalAIntensity;Metal A Intensity;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-4294.629,781.2692;Inherit;False;Property;_VertexLayer2;Vertex Layer 2;20;0;Create;True;0;0;False;0;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;757;-4081.274,-256.1195;Inherit;False;645;SpecularAdd;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-653.7307,807.6275;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;751;-4047.777,-430.5883;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;216;-4839.078,2352.117;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-649.0247,975.2268;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;507;-3986.016,825.3818;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;488;-4234.676,169.1311;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;756;-3779.608,-391.2134;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;783;-3786.804,175.1237;Inherit;False;475.8857;224.1721;Combie all the colors;2;766;765;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;120;-3206.012,-652.2151;Inherit;False;1290.521;562.2363;;11;442;234;125;129;128;126;127;124;123;122;121;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-593.1174,708.3301;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;775;-4025.926,173.8155;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-489.8304,877.6285;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;215;-4598.832,2339.401;Inherit;True;Property;_Detail;Detail;6;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;e6ae45325e647f7499b6c011ba799941;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;774;-3800.41,834.436;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;-3086.84,-405.3894;Inherit;False;183;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;765;-3736.804,240.2957;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;443;-4259.046,2336.081;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;776;-3571.943,-260.8017;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;234;-3105.865,-255.5679;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;784;-3250.706,44.06178;Inherit;False;586.0671;378.9203;Get those detail lines in and apply light color;4;514;512;515;513;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;118;-3421.687,2516.487;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;121;-3156.012,-586.3822;Float;False;Property;_OutlineColor;Outline Color;11;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;110;-323.8294,825.2283;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;766;-3492.919,225.1237;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;124;-2802.845,-542.2152;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;785;-2641.699,139.6215;Inherit;False;557.4119;264.3823;Bro are you using Matcap?;2;520;521;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-172.7013,830.0464;Float;False;MetalMatCap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-2737.396,-424.1723;Float;False;Constant;_Float46;Float 46;17;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;442;-2869.628,-260.6847;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;514;-3196.354,175.8768;Inherit;False;443;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-3199.43,94.06178;Inherit;False;457;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-3200.706,306.9821;Inherit;False;118;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-2842.321,-345.2242;Float;False;Property;_OutlineThickness;Outline Thickness;12;0;Create;True;0;0;False;0;2;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-2560.261,-418.9763;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;513;-2826.639,183.0429;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;126;-2605.482,-586.9541;Inherit;False;Property;_OutlineDiffuseMultEnable;Outline Diffuse Mult Enable;13;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-2591.699,288.0038;Inherit;False;111;MetalMatCap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;128;-2322.377,-450.9333;Inherit;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;786;-2020.402,142.2895;Inherit;False;288;166;Finally output;1;202;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;520;-2339.287,189.6215;Inherit;False;Property;_EnableMetalMatcap;Enable Metal Matcap;8;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;246;725.793,118.3265;Inherit;False;549.6176;501;;4;0;130;18;684;Output Shader;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;129;-2124.594,-444.1983;Inherit;False;Outline;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;202;-1970.402,192.2895;Inherit;False;FinalCustomLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;678;-8065.216,81.03187;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;647;-6548.517,315.4014;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;679;-7803.731,42.29185;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;684;812.2227,230.3635;Inherit;False;555;Highlight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;18;751.7928,370.1755;Inherit;False;202;FinalCustomLight;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;130;801.4058,476.9549;Inherit;False;129;Outline;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;677;-8272.245,73.55177;Inherit;False;441;VertexColors;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;682;-8072.793,259.0435;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;649;-6100.624,141.1085;Inherit;False;SpecularEmission;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;687;-753.8641,1439.228;Inherit;False;119;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;648;-6369.539,150.1656;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;646;-6826.517,318.4014;Inherit;False;Property;_SpecularEmissionIntensity;Specular Emission Intensity;27;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;600;-3978.173,1733.722;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1011.411,168.3264;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light - Version 6.0.0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;75;0;74;0
WireConnection;77;0;76;2
WireConnection;78;0;75;0
WireConnection;728;0;727;2
WireConnection;728;1;727;1
WireConnection;728;2;727;3
WireConnection;728;3;727;4
WireConnection;80;0;78;0
WireConnection;80;1;77;0
WireConnection;183;0;182;0
WireConnection;119;0;113;1
WireConnection;729;0;728;0
WireConnection;83;0;80;0
WireConnection;517;0;152;0
WireConnection;517;1;518;0
WireConnection;440;0;517;0
WireConnection;85;0;83;0
WireConnection;85;2;82;0
WireConnection;85;3;729;0
WireConnection;730;0;85;0
WireConnection;730;1;729;0
WireConnection;700;0;578;0
WireConnection;700;1;701;0
WireConnection;804;0;797;0
WireConnection;550;1;551;0
WireConnection;550;2;700;0
WireConnection;550;3;553;0
WireConnection;803;0;804;0
WireConnection;802;0;792;0
WireConnection;86;0;730;0
WireConnection;795;0;792;0
WireConnection;548;0;546;0
WireConnection;548;1;547;0
WireConnection;683;0;550;0
WireConnection;794;0;802;0
WireConnection;794;1;803;0
WireConnection;793;0;797;0
WireConnection;796;0;794;0
WireConnection;796;1;793;2
WireConnection;796;2;795;3
WireConnection;563;0;548;0
WireConnection;554;0;683;0
WireConnection;554;1;604;0
WireConnection;3;0;88;0
WireConnection;3;1;2;0
WireConnection;626;0;625;0
WireConnection;87;0;83;0
WireConnection;549;0;563;0
WireConnection;549;1;554;0
WireConnection;537;0;554;0
WireConnection;537;1;796;0
WireConnection;14;0;3;0
WireConnection;231;0;142;3
WireConnection;231;1;142;2
WireConnection;231;2;142;1
WireConnection;231;3;142;4
WireConnection;117;0;113;3
WireConnection;573;0;549;0
WireConnection;573;1;571;0
WireConnection;545;0;537;0
WireConnection;230;0;142;0
WireConnection;230;1;231;0
WireConnection;627;0;626;0
WireConnection;441;0;230;0
WireConnection;718;0;685;0
WireConnection;718;1;545;0
WireConnection;631;0;627;0
WireConnection;631;1;629;0
WireConnection;631;2;628;0
WireConnection;220;0;219;0
WireConnection;220;2;218;0
WireConnection;220;3;217;0
WireConnection;686;0;685;0
WireConnection;686;1;573;0
WireConnection;360;0;113;2
WireConnection;659;0;658;0
WireConnection;659;1;657;0
WireConnection;449;0;440;0
WireConnection;449;1;183;0
WireConnection;538;0;718;0
WireConnection;555;0;686;0
WireConnection;98;0;97;0
WireConnection;457;0;220;0
WireConnection;636;0;631;0
WireConnection;636;1;628;0
WireConnection;473;0;471;0
WireConnection;639;0;633;0
WireConnection;778;0;779;0
WireConnection;778;2;656;2
WireConnection;778;3;780;0
WireConnection;778;4;780;0
WireConnection;447;0;440;0
WireConnection;447;1;449;0
WireConnection;447;2;543;0
WireConnection;738;0;734;0
WireConnection;738;1;460;0
WireConnection;100;0;98;0
WireConnection;660;0;659;0
WireConnection;497;0;496;0
WireConnection;640;0;636;0
WireConnection;787;0;772;0
WireConnection;787;1;788;0
WireConnection;503;0;502;0
WireConnection;637;0;778;0
WireConnection;637;1;635;0
WireConnection;637;2;777;0
WireConnection;637;3;660;0
WireConnection;637;4;634;0
WireConnection;753;0;461;0
WireConnection;753;1;467;0
WireConnection;735;0;738;0
WireConnection;735;1;473;0
WireConnection;498;0;497;0
WireConnection;484;0;483;0
WireConnection;789;0;745;0
WireConnection;789;1;790;0
WireConnection;642;1;640;0
WireConnection;642;2;639;0
WireConnection;574;0;575;0
WireConnection;574;1;447;0
WireConnection;758;0;479;0
WireConnection;758;1;477;0
WireConnection;451;0;449;0
WireConnection;101;1;100;0
WireConnection;102;1;101;0
WireConnection;504;0;503;0
WireConnection;504;1;787;0
WireConnection;486;0;484;0
WireConnection;486;1;789;0
WireConnection;556;0;557;0
WireConnection;556;1;455;0
WireConnection;644;1;637;0
WireConnection;644;2;642;0
WireConnection;448;0;574;0
WireConnection;731;0;735;0
WireConnection;499;0;498;0
WireConnection;470;0;473;0
WireConnection;470;1;753;0
WireConnection;480;0;758;0
WireConnection;103;1;102;0
WireConnection;754;0;470;0
WireConnection;732;0;463;0
WireConnection;732;1;556;0
WireConnection;732;2;731;0
WireConnection;481;0;482;0
WireConnection;481;1;480;0
WireConnection;481;2;486;0
WireConnection;481;3;486;0
WireConnection;481;4;487;0
WireConnection;500;0;501;0
WireConnection;500;1;499;0
WireConnection;500;2;504;0
WireConnection;500;3;504;0
WireConnection;500;4;506;0
WireConnection;645;0;644;0
WireConnection;106;0;104;0
WireConnection;106;1;103;1
WireConnection;751;0;465;0
WireConnection;751;1;732;0
WireConnection;751;2;754;0
WireConnection;107;0;103;3
WireConnection;107;1;105;0
WireConnection;507;0;508;0
WireConnection;507;1;499;0
WireConnection;507;2;500;0
WireConnection;507;3;500;0
WireConnection;507;4;511;0
WireConnection;488;0;490;0
WireConnection;488;1;480;0
WireConnection;488;2;481;0
WireConnection;488;3;481;0
WireConnection;488;4;489;0
WireConnection;756;0;751;0
WireConnection;756;1;757;0
WireConnection;775;0;488;0
WireConnection;109;0;106;0
WireConnection;109;1;107;0
WireConnection;215;1;216;0
WireConnection;774;0;507;0
WireConnection;765;0;775;0
WireConnection;765;1;774;0
WireConnection;765;2;775;0
WireConnection;443;0;215;0
WireConnection;776;0;756;0
WireConnection;118;0;113;4
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;766;0;765;0
WireConnection;766;1;776;0
WireConnection;766;2;765;0
WireConnection;124;0;121;0
WireConnection;124;1;122;0
WireConnection;111;0;110;0
WireConnection;442;0;234;0
WireConnection;127;0;123;0
WireConnection;127;1;125;0
WireConnection;127;2;442;2
WireConnection;513;0;515;0
WireConnection;513;1;514;0
WireConnection;513;2;766;0
WireConnection;513;3;512;0
WireConnection;126;0;121;0
WireConnection;126;1;124;0
WireConnection;128;0;126;0
WireConnection;128;1;127;0
WireConnection;520;0;513;0
WireConnection;520;1;521;0
WireConnection;129;0;128;0
WireConnection;202;0;520;0
WireConnection;678;0;677;0
WireConnection;647;0;634;0
WireConnection;647;1;646;0
WireConnection;679;1;678;0
WireConnection;649;0;648;0
WireConnection;648;1;647;0
WireConnection;648;2;642;0
WireConnection;600;0;447;0
WireConnection;600;1;575;0
WireConnection;600;2;575;0
WireConnection;0;13;18;0
WireConnection;0;11;130;0
ASEEND*/
//CHKSM=EB2ECC8F010DD8697252C95C00257B7206366C62
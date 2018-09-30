// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Arc System Works/Amplify/Real Light"
{
	Properties
	{
		_Diffuse("Diffuse", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_Emission("Emission", 2D) = "white" {}
		_DiffuseTint("Diffuse Tint", Color) = (0.8745098,0.8745098,0.8745098,1)
		_EmissionIntensity("Emission Intensity", Float) = 0
		_LightIntensity("Light Intensity", Float) = 0.5
		_AmbMin("AmbMin", Float) = 0.2
		_AmbMax("AmbMax", Float) = 1
		_OutlineThickness("Outline Thickness", Float) = 2
		_OutlineIntensity("Outline Intensity", Float) = 1
		_OutlineColor("Outline Color", Color) = (0,0,0,1)
		_BodyLinesIntensity("Body Lines Intensity", Float) = 1
		_BodyLinesColor("Body Lines Color", Color) = (0,0,0,1)
		_ShadowPush("Shadow Push", Float) = 700
		_ShadowIntensity("Shadow Intensity", Float) = 0.03
		_ShadowTint("Shadow Tint", Color) = (0.5073529,0.5073529,0.5073529,1)
		_ShinePush("Shine Push", Float) = 2.03
		_ShineIntensity("Shine Intensity", Float) = 0.5
		[Toggle]_EnableMetal("Enable Metal", Float) = 0
		_Metal("Metal", 2D) = "white" {}
		_MetalAIntensity("Metal A Intensity", Float) = 4
		_MetalBIntensity("Metal B Intensity", Float) = 20
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ }
		Stencil
		{
			Ref 1
			PassFront Replace
			PassBack Replace
		}
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline nofog  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float outlineVar = ( _OutlineThickness * 1E-05 );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode43 = tex2D( _ILM, uv_ILM );
			float temp_output_170_0 = floor( tex2DNode43.a );
			float4 lerpResult317 = lerp( float4(1,1,1,1) , float4(0,0,0,0) , temp_output_170_0);
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 tex2DNode51 = tex2D( _Diffuse, uv_Diffuse );
			float4 lerpResult322 = lerp( ( lerpResult317 * _BodyLinesColor * _BodyLinesIntensity ) , tex2DNode51 , temp_output_170_0);
			float4 temp_output_53_0 = ( lerpResult322 * _DiffuseTint );
			o.Emission = ( temp_output_53_0 * _OutlineColor * _OutlineIntensity ).rgb;
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"   }
		Cull Off
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
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

		uniform float _AmbMin;
		uniform float _AmbMax;
		uniform float4 _ShadowTint;
		uniform sampler2D _ILM;
		uniform float4 _ILM_ST;
		uniform float4 _BodyLinesColor;
		uniform float _BodyLinesIntensity;
		uniform sampler2D _Diffuse;
		uniform float4 _Diffuse_ST;
		uniform float4 _DiffuseTint;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _EmissionIntensity;
		uniform float _EnableMetal;
		uniform float _ShadowIntensity;
		uniform sampler2D _SSS;
		uniform float4 _SSS_ST;
		uniform float _LightIntensity;
		uniform float _ShadowPush;
		uniform float _ShineIntensity;
		uniform float _ShinePush;
		uniform float _MetalAIntensity;
		uniform sampler2D _Metal;
		uniform float _MetalBIntensity;
		uniform float _OutlineThickness;
		uniform float4 _OutlineColor;
		uniform float _OutlineIntensity;

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
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode43 = tex2D( _ILM, uv_ILM );
			float2 uv_SSS = i.uv_texcoord * _SSS_ST.xy + _SSS_ST.zw;
			float4 temp_cast_3 = (_LightIntensity).xxxx;
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 ase_worldNormal = i.worldNormal;
			float dotResult101 = dot( ase_worldlightDir , ase_worldNormal );
			float temp_output_98_0 = ( ase_lightAtten * dotResult101 );
			float clampResult21 = clamp( ( _ShadowPush * temp_output_98_0 ) , 0.0 , 1.0 );
			float clampResult26 = clamp( floor( clampResult21 ) , 0.0 , 1.0 );
			float4 lerpResult38 = lerp( ( _ShadowIntensity * tex2D( _SSS, uv_SSS ) ) , temp_cast_3 , clampResult26);
			float clampResult23 = clamp( ( temp_output_98_0 * _ShinePush ) , 0.0 , 2.0 );
			float clampResult27 = clamp( floor( clampResult23 ) , 0.0 , 1.0 );
			float lerpResult39 = lerp( 0.0 , _ShineIntensity , clampResult27);
			float4 temp_output_42_0 = ( lerpResult38 + lerpResult39 );
			float3 worldToViewDir326 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode328 = tex2D( _Metal, (float3( 1,0,0 ) + (worldToViewDir326 - float3( -1,-1,-1 )) * (float3( 0,1,0 ) - float3( 1,0,0 )) / (float3( 1,1,1 ) - float3( -1,-1,-1 ))).xy );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float temp_output_170_0 = floor( tex2DNode43.a );
			float4 lerpResult317 = lerp( float4(1,1,1,1) , float4(0,0,0,0) , temp_output_170_0);
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 tex2DNode51 = tex2D( _Diffuse, uv_Diffuse );
			float4 lerpResult322 = lerp( ( lerpResult317 * _BodyLinesColor * _BodyLinesIntensity ) , tex2DNode51 , temp_output_170_0);
			float4 temp_output_53_0 = ( lerpResult322 * _DiffuseTint );
			c.rgb = ( ( ( ( 1.0 * tex2DNode43.g ) + lerp(temp_output_42_0,( temp_output_42_0 * ( ( _MetalAIntensity * tex2DNode328.r ) + ( tex2DNode328.b * _MetalBIntensity ) ) ),_EnableMetal) ) * ase_lightColor ) * temp_output_53_0 ).rgb;
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
			float4 temp_cast_0 = (_AmbMin).xxxx;
			float4 temp_cast_1 = (_AmbMax).xxxx;
			float4 clampResult59 = clamp( UNITY_LIGHTMODEL_AMBIENT , temp_cast_0 , temp_cast_1 );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode43 = tex2D( _ILM, uv_ILM );
			float temp_output_170_0 = floor( tex2DNode43.a );
			float4 lerpResult317 = lerp( float4(1,1,1,1) , float4(0,0,0,0) , temp_output_170_0);
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 tex2DNode51 = tex2D( _Diffuse, uv_Diffuse );
			float4 lerpResult322 = lerp( ( lerpResult317 * _BodyLinesColor * _BodyLinesIntensity ) , tex2DNode51 , temp_output_170_0);
			float4 temp_output_53_0 = ( lerpResult322 * _DiffuseTint );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 lerpResult359 = lerp( float4( 0,0,0,0 ) , tex2DNode51 , ( tex2D( _Emission, uv_Emission ).r * _EmissionIntensity ));
			o.Emission = ( ( ( clampResult59 * _ShadowTint ) * temp_output_53_0 ) + lerpResult359 ).rgb;
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
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
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
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
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
Version=15401
-1456;158;1300;565;1808.184;-520.8445;1.091293;True;True
Node;AmplifyShaderEditor.WorldNormalVector;96;-1672.89,883.3976;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;99;-1693.921,694.1051;Float;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;101;-1386.549,783.0592;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;97;-1506.794,607.8111;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1202.769,1037.786;Float;False;Property;_ShinePush;Shine Push;17;0;Create;True;0;0;False;0;2.03;1.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1247.034,531.5924;Float;False;Property;_ShadowPush;Shadow Push;14;0;Create;True;0;0;False;0;700;700;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-1182.474,752.5203;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-942.8862,736.9381;Float;False;Constant;_Float3;Float 3;3;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-936.9491,611.861;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-929.8331,987.3353;Float;False;Constant;_Float1;Float 1;20;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-936.9491,872.3585;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;21;-709.6049,614.3971;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;326;-1204.483,1213.134;Float;True;World;View;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;23;-707.5851,876.0385;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;25;-525.5837,873.4376;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-495.3429,231.3038;Float;False;Property;_ShadowIntensity;Shadow Intensity;15;0;Create;True;0;0;False;0;0.03;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;24;-529.4839,625.138;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-540.3676,770.5099;Float;False;Constant;_Float4;Float 4;3;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;34;-633.2492,324.7911;Float;True;Property;_SSS;SSS;2;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;327;-941.842,1230.618;Float;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;-1,-1,-1;False;2;FLOAT3;1,1,1;False;3;FLOAT3;1,0,0;False;4;FLOAT3;0,1,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;344;-496.6256,1327.123;Float;False;Property;_MetalBIntensity;Metal B Intensity;22;0;Create;True;0;0;False;0;20;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-257.3337,730.4879;Float;False;Constant;_Float6;Float 6;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;346;-540.6257,1053.123;Float;False;Property;_MetalAIntensity;Metal A Intensity;21;0;Create;True;0;0;False;0;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;328;-659.7034,1138.626;Float;True;Property;_Metal;Metal;20;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-261.6078,388.3927;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-277.3335,805.4877;Float;False;Property;_ShineIntensity;Shine Intensity;18;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;27;-353.9847,892.9376;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;26;-366.9848,627.7381;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;43;-3100.6,848.875;Float;True;Property;_ILM;ILM;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;63;-391.4419,524.7326;Float;False;Property;_LightIntensity;Light Intensity;6;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;319;-2625.492,735.7336;Float;False;Constant;_Color1;Color 1;20;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;38;-55.7511,584.9819;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FloorOpNode;170;-2652.429,1185.107;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;343;-277.626,1212.123;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;347;-272.626,1075.123;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;318;-2621.492,557.7343;Float;False;Constant;_Color0;Color 0;20;0;Create;True;0;0;False;0;1,1,1,1;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;39;-36.44666,757.6232;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;308;-2424.708,958.9725;Float;False;Property;_BodyLinesColor;Body Lines Color;13;0;Create;True;0;0;False;0;0,0,0,1;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;317;-2366.301,728.6636;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-2428.046,1138.657;Float;False;Property;_BodyLinesIntensity;Body Lines Intensity;12;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;152.4576,735.0953;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RelayNode;320;-2664.417,427.4819;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;345;-127.6257,1159.123;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;51;-2610.077,1698.877;Float;True;Property;_Diffuse;Diffuse;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;118;679.3026,1379.119;Float;False;UNITY_LIGHTMODEL_AMBIENT;0;1;COLOR;0
Node;AmplifyShaderEditor.RelayNode;316;-419.7785,123.8997;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;780.5223,1444.335;Float;False;Property;_AmbMin;AmbMin;7;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;321;-2052.667,996.3027;Float;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;357;239.3232,943.9535;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;62;790.9448,1513.666;Float;False;Property;_AmbMax;AmbMax;8;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;49.16431,166.5611;Float;False;Constant;_Float8;Float 8;5;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;90;750.7014,1584.665;Float;False;Property;_ShadowTint;Shadow Tint;16;0;Create;True;0;0;False;0;0.5073529,0.5073529,0.5073529,1;0.5073529,0.5073529,0.5073529,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;59;995.486,1486.482;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;217.094,271.5081;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;322;-1866.292,1459.798;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;71;-2454.867,2390.341;Float;True;Property;_Emission;Emission;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;355;322.2327,726.5402;Float;False;Property;_EnableMetal;Enable Metal;19;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-2404.404,2608.734;Float;False;Property;_EmissionIntensity;Emission Intensity;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;92;-2138.73,1799.928;Float;False;Property;_DiffuseTint;Diffuse Tint;4;0;Create;True;0;0;False;0;0.8745098,0.8745098,0.8745098,1;0.8745098,0.8745098,0.8745098,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;70;1124.421,2207.477;Float;False;Constant;_Float5;Float 5;10;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-1850.852,2122.537;Float;False;Property;_OutlineIntensity;Outline Intensity;10;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;91;-1815.347,1911.857;Float;False;Property;_OutlineColor;Outline Color;11;0;Create;True;0;0;False;0;0,0,0,1;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;1152.825,1575.225;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;6;1085.016,2128.133;Float;False;Property;_OutlineThickness;Outline Thickness;9;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-2095.732,2402.219;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;56;400.9094,899.2203;Float;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-1582.63,1691.08;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;46;537.781,765.9744;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;359;-1912.546,2258.037;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;1304.594,1686.377;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;1302.061,2120.117;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;659.9302,888.0365;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-1541.934,1887.079;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;360;1521.276,1673.318;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;4;1377.978,1943.661;Float;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;410.3314,1306.08;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;2392.29,1042.533;Float;False;True;2;Float;ASEMaterialInspector;0;0;CustomLighting;Arc System Works/Amplify/New Real Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;5;False;-1;1;False;-1;False;1;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;True;1;False;-1;255;False;-1;255;False;-1;0;False;-1;3;False;-1;0;False;-1;0;False;-1;0;False;-1;3;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;2;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;1;=Stencil { Ref 5 Pass Replace Comp Always };False;0;0;False;-1;-1;0;False;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;101;0;99;0
WireConnection;101;1;96;0
WireConnection;98;0;97;0
WireConnection;98;1;101;0
WireConnection;19;0;11;0
WireConnection;19;1;98;0
WireConnection;20;0;98;0
WireConnection;20;1;17;0
WireConnection;21;0;19;0
WireConnection;21;2;22;0
WireConnection;326;0;96;0
WireConnection;23;0;20;0
WireConnection;23;2;103;0
WireConnection;25;0;23;0
WireConnection;24;0;21;0
WireConnection;327;0;326;0
WireConnection;328;1;327;0
WireConnection;37;0;29;0
WireConnection;37;1;34;0
WireConnection;27;0;25;0
WireConnection;27;2;28;0
WireConnection;26;0;24;0
WireConnection;26;2;28;0
WireConnection;38;0;37;0
WireConnection;38;1;63;0
WireConnection;38;2;26;0
WireConnection;170;0;43;4
WireConnection;343;0;328;3
WireConnection;343;1;344;0
WireConnection;347;0;346;0
WireConnection;347;1;328;1
WireConnection;39;0;40;0
WireConnection;39;1;41;0
WireConnection;39;2;27;0
WireConnection;317;0;318;0
WireConnection;317;1;319;0
WireConnection;317;2;170;0
WireConnection;42;0;38;0
WireConnection;42;1;39;0
WireConnection;320;0;43;2
WireConnection;345;0;347;0
WireConnection;345;1;343;0
WireConnection;316;0;320;0
WireConnection;321;0;317;0
WireConnection;321;1;308;0
WireConnection;321;2;311;0
WireConnection;357;0;42;0
WireConnection;357;1;345;0
WireConnection;59;0;118;0
WireConnection;59;1;60;0
WireConnection;59;2;62;0
WireConnection;45;0;44;0
WireConnection;45;1;316;0
WireConnection;322;0;321;0
WireConnection;322;1;51;0
WireConnection;322;2;170;0
WireConnection;355;0;42;0
WireConnection;355;1;357;0
WireConnection;64;0;59;0
WireConnection;64;1;90;0
WireConnection;73;0;71;1
WireConnection;73;1;72;0
WireConnection;53;0;322;0
WireConnection;53;1;92;0
WireConnection;46;0;45;0
WireConnection;46;1;355;0
WireConnection;359;1;51;0
WireConnection;359;2;73;0
WireConnection;77;0;64;0
WireConnection;77;1;53;0
WireConnection;69;0;6;0
WireConnection;69;1;70;0
WireConnection;50;0;46;0
WireConnection;50;1;56;0
WireConnection;65;0;53;0
WireConnection;65;1;91;0
WireConnection;65;2;68;0
WireConnection;360;0;77;0
WireConnection;360;1;359;0
WireConnection;4;0;65;0
WireConnection;4;1;69;0
WireConnection;54;0;50;0
WireConnection;54;1;53;0
WireConnection;2;2;360;0
WireConnection;2;13;54;0
WireConnection;2;11;4;0
ASEEND*/
//CHKSM=B5480921D83B1A6F693B9DEE52AFE8D86E1DBB6B
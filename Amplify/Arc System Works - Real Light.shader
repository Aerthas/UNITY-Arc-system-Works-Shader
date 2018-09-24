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
		_EmissionTint("Emission Tint", Color) = (1,1,1,1)
		_LightIntensity("Light Intensity", Float) = 1
		_AmbMin("AmbMin", Float) = 0.2
		_AmbMax("AmbMax", Float) = 1
		_OutlineThickness("Outline Thickness", Float) = 2
		_OutlineBrightness("Outline Brightness", Float) = 1
		_OutlineColor("Outline Color", Color) = (0,0,0,1)
		_BodyLinesBrightness("Body Lines Brightness", Float) = 1
		_BodyLinesColor("Body Lines Color", Color) = (0,0,0,1)
		_ShadowPush("Shadow Push", Float) = 700
		_ShadowBrightness("Shadow Brightness", Float) = 0.03
		_ShadowTint("Shadow Tint", Color) = (0.5073529,0.5073529,0.5073529,1)
		_ShinePush("Shine Push", Float) = 1.02
		_ShineBrightness("Shine Brightness", Float) = 0.5
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
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 temp_output_53_0 = ( tex2D( _Diffuse, uv_Diffuse ) * _DiffuseTint );
			float4 temp_output_65_0 = ( temp_output_53_0 * _OutlineColor * _OutlineBrightness );
			o.Emission = temp_output_65_0.rgb;
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

		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _EmissionIntensity;
		uniform float4 _EmissionTint;
		uniform float _AmbMin;
		uniform float _AmbMax;
		uniform float4 _ShadowTint;
		uniform sampler2D _Diffuse;
		uniform float4 _Diffuse_ST;
		uniform float4 _DiffuseTint;
		uniform float4 _OutlineColor;
		uniform float _OutlineBrightness;
		uniform sampler2D _ILM;
		uniform float4 _ILM_ST;
		uniform float4 _BodyLinesColor;
		uniform float _BodyLinesBrightness;
		uniform float _ShadowBrightness;
		uniform sampler2D _SSS;
		uniform float4 _SSS_ST;
		uniform float _LightIntensity;
		uniform float _ShadowPush;
		uniform float _ShineBrightness;
		uniform float _ShinePush;
		uniform float _OutlineThickness;

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
			float4 temp_cast_4 = (_LightIntensity).xxxx;
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
			float clampResult26 = clamp( floor( clampResult21 ) , 0.0 , 5.0 );
			float4 lerpResult38 = lerp( ( _ShadowBrightness * tex2D( _SSS, uv_SSS ) ) , temp_cast_4 , clampResult26);
			float clampResult23 = clamp( ( temp_output_98_0 * _ShinePush ) , 0.0 , 2.0 );
			float clampResult27 = clamp( floor( clampResult23 ) , 0.0 , 5.0 );
			float lerpResult39 = lerp( 0.0 , _ShineBrightness , clampResult27);
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 temp_output_53_0 = ( tex2D( _Diffuse, uv_Diffuse ) * _DiffuseTint );
			c.rgb = ( ( ( ( tex2DNode43.g * 2.0 ) + ( lerpResult38 + lerpResult39 ) ) * ase_lightColor ) * temp_output_53_0 ).rgb;
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
			float4 temp_cast_0 = (-1.0).xxxx;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 temp_cast_1 = (_AmbMin).xxxx;
			float4 temp_cast_2 = (_AmbMax).xxxx;
			float4 clampResult59 = clamp( UNITY_LIGHTMODEL_AMBIENT , temp_cast_1 , temp_cast_2 );
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 temp_output_53_0 = ( tex2D( _Diffuse, uv_Diffuse ) * _DiffuseTint );
			float4 temp_output_65_0 = ( temp_output_53_0 * _OutlineColor * _OutlineBrightness );
			float4 temp_output_76_0 = ( ( ( tex2D( _Emission, uv_Emission ) * _EmissionIntensity ) * _EmissionTint ) + ( ( clampResult59 * _ShadowTint ) * temp_output_65_0 ) );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode43 = tex2D( _ILM, uv_ILM );
			float4 lerpResult78 = lerp( temp_cast_0 , temp_output_76_0 , tex2DNode43.a);
			o.Emission = ( lerpResult78 + ( ( ( lerpResult78 - temp_output_76_0 ) * -1.0 * _BodyLinesColor ) * _BodyLinesBrightness ) ).rgb;
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
-1455;57;1384;726;2560.853;340.6913;1.410041;True;True
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;99;-1916.521,112.0477;Float;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;96;-1895.49,301.3408;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;101;-1609.15,201.0022;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;97;-1729.394,25.75408;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;62;52.29208,479.5914;Float;False;Property;_AmbMax;AmbMax;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;92;-957.9514,825.0204;Float;False;Property;_DiffuseTint;Diffuse Tint;4;0;Create;True;0;0;False;0;0.8745098,0.8745098,0.8745098,1;0.8745098,0.8745098,0.8745098,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-1423.276,189.963;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;40.26208,407.0443;Float;False;Property;_AmbMin;AmbMin;8;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1469.635,-50.46503;Float;False;Property;_ShadowPush;Shadow Push;15;0;Create;True;0;0;False;0;700;700;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;51;-1036.34,610.7299;Float;True;Property;_Diffuse;Diffuse;0;0;Create;True;0;0;False;0;None;36b217c97c765d245904f7fcbb4b0d88;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;17;-1425.37,455.7297;Float;False;Property;_ShinePush;Shine Push;18;0;Create;True;0;0;False;0;1.02;1.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;102;-36.67222,276.4886;Float;False;UNITY_LIGHTMODEL_AMBIENT;0;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;91;-708.9514,852.0204;Float;False;Property;_OutlineColor;Outline Color;12;0;Create;True;0;0;False;0;0,0,0,1;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;71;378.0378,91.42363;Float;True;Property;_Emission;Emission;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;90;12.04865,557.0204;Float;False;Property;_ShadowTint;Shadow Tint;17;0;Create;True;0;0;False;0;0.5073529,0.5073529,0.5073529,1;0.5073529,0.5073529,0.5073529,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-1159.55,290.3021;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1159.55,29.80363;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-686.5705,730.1006;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-1152.434,405.2783;Float;False;Constant;_Float1;Float 1;20;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-744.4561,1062.7;Float;False;Property;_OutlineBrightness;Outline Brightness;11;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;59;239.1488,362.3845;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;72;425.2224,289.488;Float;False;Property;_EmissionIntensity;Emission Intensity;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-1165.487,154.881;Float;False;Constant;_Float3;Float 3;3;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;694.2224,193.4881;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;21;-932.2062,32.33999;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;410.4038,448.1249;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;94;647.8975,336.163;Float;False;Property;_EmissionTint;Emission Tint;6;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-437.7761,827.2423;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;23;-930.1862,293.9813;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;24;-752.0845,43.08074;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;34;-930.2001,-309.7488;Float;True;Property;_SSS;SSS;2;0;Create;True;0;0;False;0;None;6e9b5f7d083374e41b0fcb4cdf3d2dc3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;678.2224,539.488;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FloorOpNode;25;-748.1844,291.3811;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;75;863.2224,274.488;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-860.0826,-383.5554;Float;False;Property;_ShadowBrightness;Shadow Brightness;16;0;Create;True;0;0;False;0;0.03;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-762.9683,188.4529;Float;False;Constant;_Float4;Float 4;3;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;26;-589.5849,45.68088;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-499.9336,223.4307;Float;False;Property;_ShineBrightness;Shine Brightness;19;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-839.2784,-114.1809;Float;False;Property;_LightIntensity;Light Intensity;7;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-479.9337,148.4307;Float;False;Constant;_Float6;Float 6;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;80;1009.347,503.4034;Float;False;Constant;_Float0;Float 0;17;0;Create;True;0;0;False;0;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;76;1031.222,352.488;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;43;-386.4052,-720.1819;Float;True;Property;_ILM;ILM;1;0;Create;True;0;0;False;0;None;19eb58a22528de244a69c368159c7373;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-569.4911,-335.8047;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;27;-576.5848,310.8811;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-267.4052,-521.1819;Float;False;Constant;_Float8;Float 8;5;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;78;1215.347,393.4034;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;39;-259.047,175.5661;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;38;-276.1646,-296.6617;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;82;1325.74,659.7876;Float;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;89;1175.629,830.805;Float;False;Property;_BodyLinesColor;Body Lines Color;14;0;Create;True;0;0;False;0;0,0,0,1;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-84.57971,-48.44806;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-33.40521,-597.1819;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;70;494.67,1538.674;Float;False;Constant;_Float5;Float 5;10;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;455.2648,1459.329;Float;False;Property;_OutlineThickness;Outline Thickness;10;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;56;80.32359,-51.5174;Float;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;1491.74,785.7876;Float;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;87;1290.347,1028.984;Float;False;Property;_BodyLinesBrightness;Body Lines Brightness;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;46;116.1583,-242.942;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;85;1646.347,831.9836;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;297.6891,-172.5467;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;672.3099,1451.313;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OutlineNode;4;838.1496,1371.954;Float;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;81;1830.805,621.379;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;-302.5439,588.5003;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;2006.807,938.9863;Float;False;True;2;Float;ASEMaterialInspector;0;0;CustomLighting;Arc System Works/Amplify/Real Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;5;False;-1;1;False;-1;False;1;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;True;1;False;-1;255;False;-1;255;False;-1;0;False;-1;3;False;-1;0;False;-1;0;False;-1;0;False;-1;3;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;2;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;1;=Stencil { Ref 5 Pass Replace Comp Always };False;0;0;False;-1;-1;0;False;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;101;0;99;0
WireConnection;101;1;96;0
WireConnection;98;0;97;0
WireConnection;98;1;101;0
WireConnection;20;0;98;0
WireConnection;20;1;17;0
WireConnection;19;0;11;0
WireConnection;19;1;98;0
WireConnection;53;0;51;0
WireConnection;53;1;92;0
WireConnection;59;0;102;0
WireConnection;59;1;60;0
WireConnection;59;2;62;0
WireConnection;73;0;71;0
WireConnection;73;1;72;0
WireConnection;21;0;19;0
WireConnection;21;2;22;0
WireConnection;64;0;59;0
WireConnection;64;1;90;0
WireConnection;65;0;53;0
WireConnection;65;1;91;0
WireConnection;65;2;68;0
WireConnection;23;0;20;0
WireConnection;23;2;103;0
WireConnection;24;0;21;0
WireConnection;77;0;64;0
WireConnection;77;1;65;0
WireConnection;25;0;23;0
WireConnection;75;0;73;0
WireConnection;75;1;94;0
WireConnection;26;0;24;0
WireConnection;26;2;28;0
WireConnection;76;0;75;0
WireConnection;76;1;77;0
WireConnection;37;0;29;0
WireConnection;37;1;34;0
WireConnection;27;0;25;0
WireConnection;27;2;28;0
WireConnection;78;0;80;0
WireConnection;78;1;76;0
WireConnection;78;2;43;4
WireConnection;39;0;40;0
WireConnection;39;1;41;0
WireConnection;39;2;27;0
WireConnection;38;0;37;0
WireConnection;38;1;63;0
WireConnection;38;2;26;0
WireConnection;82;0;78;0
WireConnection;82;1;76;0
WireConnection;42;0;38;0
WireConnection;42;1;39;0
WireConnection;45;0;43;2
WireConnection;45;1;44;0
WireConnection;83;0;82;0
WireConnection;83;1;80;0
WireConnection;83;2;89;0
WireConnection;46;0;45;0
WireConnection;46;1;42;0
WireConnection;85;0;83;0
WireConnection;85;1;87;0
WireConnection;50;0;46;0
WireConnection;50;1;56;0
WireConnection;69;0;6;0
WireConnection;69;1;70;0
WireConnection;4;0;65;0
WireConnection;4;1;69;0
WireConnection;81;0;78;0
WireConnection;81;1;85;0
WireConnection;54;0;50;0
WireConnection;54;1;53;0
WireConnection;2;2;81;0
WireConnection;2;13;54;0
WireConnection;2;11;4;0
ASEEND*/
//CHKSM=756779F46495EB2FB3A40F3D9AF8A46BDECC3FFD
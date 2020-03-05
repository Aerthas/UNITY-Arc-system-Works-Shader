// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light"
{
	Properties
	{
		_ShadowTint("Shadow Tint", Color) = (0.4485294,0.4485294,0.4485294,0)
		_AmbMin("AmbMin", Float) = 0.2
		_AmbMax("AmbMax", Float) = 0.7
		_OutlineThickness("Outline Thickness", Float) = 2
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_Base("Base", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_Detail("Detail", 2D) = "white" {}
		_ILMDetail("ILM Detail", Float) = 1
		_BodyShineBrightness("Body Shine Brightness", Range( 0 , 1)) = 0.5
		_LightColor("Light Color", Color) = (1,1,1,0)
		_LightDir("Light Dir", Color) = (1,1,1,0)
		_LightIntensity("Light Intensity", Float) = 1.33
		_VertexPaintBrightness("Vertex Paint Brightness ", Float) = 1.3
		_VertexPaintBrightnessColor("Vertex Paint Brightness Color", Float) = 1.3
		[Toggle]_MetalEnable("Metal Enable", Float) = 0
		_Metal("Metal", 2D) = "white" {}
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 1
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
			float outlineVar = ( 1E-05 * _OutlineThickness );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			o.Emission = _OutlineColor.rgb;
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
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
			float4 vertexColor : COLOR;
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

		uniform sampler2D _Base;
		uniform float4 _Base_ST;
		uniform sampler2D _ILM;
		uniform float4 _ILM_ST;
		uniform sampler2D _Detail;
		uniform float _AmbMin;
		uniform float _AmbMax;
		uniform float4 _ShadowTint;
		uniform float _VertexPaintBrightnessColor;
		uniform sampler2D _SSS;
		uniform float4 _SSS_ST;
		uniform float _LightIntensity;
		uniform float _VertexPaintBrightness;
		uniform float4 _LightDir;
		uniform float _ILMDetail;
		uniform float _BodyShineBrightness;
		uniform float4 _LightColor;
		uniform float _MetalEnable;
		uniform float _MetalAIntensity;
		uniform sampler2D _Metal;
		uniform float _MetalBIntensity;
		uniform float _OutlineThickness;
		uniform float4 _OutlineColor;

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
			float2 uv_SSS = i.uv_texcoord * _SSS_ST.xy + _SSS_ST.zw;
			float4 temp_cast_2 = (_LightIntensity).xxxx;
			float temp_output_29_0 = ( i.vertexColor.r * i.vertexColor.r );
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float hasWorldLight115 = (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 );
			float4 mergedRealFakeLightDir142 = (( hasWorldLight115 > 0.0 ) ? float4( ase_worldlightDir , 0.0 ) :  _LightDir );
			float3 ase_worldNormal = i.worldNormal;
			float dotResult4 = dot( ( 700.0 * mergedRealFakeLightDir142 ) , float4( ase_worldNormal , 0.0 ) );
			float clampResult9 = clamp( ( 700.0 * dotResult4 ) , 0.0 , 1.0 );
			float dotResult26 = dot( float4( ase_worldNormal , 0.0 ) , ( mergedRealFakeLightDir142 * 444.0 ) );
			float clampResult7 = clamp( floor( ( dotResult26 * 444.0 ) ) , 0.0 , 1.0 );
			float lerpResult18 = lerp( -0.9 , floor( clampResult9 ) , clampResult7);
			float dotResult14 = dot( ( mergedRealFakeLightDir142 * 2.0 ) , float4( ase_worldNormal , 0.0 ) );
			float clampResult25 = clamp( ( dotResult14 * 2.0 ) , 0.0 , 1.0 );
			float clampResult23 = clamp( floor( clampResult25 ) , 0.0 , 1.0 );
			float lightDotProduct127 = ( lerpResult18 + clampResult23 + 2.0 );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode58 = tex2D( _ILM, uv_ILM );
			float ILMG133 = ( _ILMDetail * tex2DNode58.g );
			float temp_output_28_0 = ( temp_output_29_0 * temp_output_29_0 * lightDotProduct127 * ILMG133 );
			float temp_output_31_0 = ( temp_output_28_0 * temp_output_28_0 );
			float temp_output_104_0 = ( _VertexPaintBrightness * temp_output_31_0 * temp_output_31_0 );
			float temp_output_105_0 = ( temp_output_104_0 * temp_output_104_0 );
			float blendOpSrc43 = ( temp_output_105_0 * temp_output_105_0 );
			float blendOpDest43 = i.vertexColor.g;
			float vertexColorShading135 = ( saturate(  round( 0.5 * ( blendOpSrc43 + blendOpDest43 ) ) ));
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult37 = dot( float4( ase_normWorldNormal , 0.0 ) , mergedRealFakeLightDir142 );
			float clampResult42 = clamp( ( dotResult37 * ( 7.4 * 100000.0 ) ) , 0.0 , 1.0 );
			float blendOpSrc48 = ( tex2DNode58.b * ( 0.5 * _BodyShineBrightness ) );
			float blendOpDest48 = 0.15;
			float ILMBBodyShine147 = ( ( saturate( 	max( blendOpSrc48, blendOpDest48 ) )) * 1.0 );
			float4 lerpResult61 = lerp( ( _VertexPaintBrightnessColor * tex2D( _SSS, uv_SSS ) ) , temp_cast_2 , ( vertexColorShading135 * lightDotProduct127 * clampResult42 * ILMBBodyShine147 ));
			float4 temp_output_63_0 = ( ( lerpResult61 * clampResult42 ) * (( hasWorldLight115 > 0.0 ) ? ase_lightColor :  _LightColor ) );
			float3 worldToViewDir106 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode75 = tex2D( _Metal, ( 0.5 + ( 0.5 * (worldToViewDir106).xy ) ) );
			float metalMatCap126 = ( lightDotProduct127 * ( ( _MetalAIntensity * tex2DNode75.r ) + ( tex2DNode75.b * _MetalBIntensity ) ) );
			float4 temp_cast_9 = (metalMatCap126).xxxx;
			float4 temp_cast_10 = (-1.0).xxxx;
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float ILMA149 = tex2DNode58.a;
			float4 lerpResult66 = lerp( temp_cast_10 , tex2D( _Base, uv_Base ) , ILMA149);
			float4 tex2DNode83 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 finalCustomLighting101 = ( temp_output_63_0 * lerp(temp_output_63_0,temp_cast_9,_MetalEnable) * lerpResult66 * tex2DNode83 );
			c.rgb = finalCustomLighting101.rgb;
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
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode58 = tex2D( _ILM, uv_ILM );
			float ILMA149 = tex2DNode58.a;
			float4 lerpResult66 = lerp( temp_cast_0 , tex2D( _Base, uv_Base ) , ILMA149);
			float4 tex2DNode83 = tex2D( _Detail, i.uv2_texcoord2 );
			float clampResult87 = clamp( 0.0 , _AmbMin , _AmbMax );
			float4 shadowTinting123 = ( clampResult87 * _ShadowTint );
			float4 FinalEmission99 = ( lerpResult66 * tex2DNode83 * shadowTinting123 );
			o.Emission = FinalEmission99.rgb;
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
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
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
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
-1506;63;1478;746;9366.785;4564.851;4.772708;True;True
Node;AmplifyShaderEditor.CommentaryNode;107;-7657.716,-4022.945;Float;False;1346.424;476.0435;Is there a light source?;8;115;114;113;112;111;110;109;108;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;108;-7607.716,-3972.945;Float;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.AbsOpNode;110;-7367.222,-3970.844;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;109;-7558.027,-3787.799;Float;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCCompareGreater;112;-7236.448,-3762.346;Float;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;111;-7240.346,-3966.165;Float;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;113;-7001.94,-3785.878;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;145;-7482.25,-3530.034;Float;False;920.5117;456.4358;Real or Fake light direction;5;96;8;116;142;117;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCCompareGreater;114;-6832.408,-3777.918;Float;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;115;-6583.295,-3776.901;Float;True;hasWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;96;-7432.25,-3280.598;Float;False;Property;_LightDir;Light Dir;12;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;8;-7425.267,-3409.515;Float;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;117;-7418.25,-3480.034;Float;False;115;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;116;-7084.765,-3338.656;Float;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;146;-7601.251,-3002.261;Float;False;2292.773;828.1161;Dot Light Direction;26;17;15;143;5;22;1;4;26;2;11;14;12;20;10;25;9;6;3;13;23;7;18;16;27;24;127;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;-7551.251,-2654.622;Float;False;142;0;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;142;-6874.739,-3330.107;Float;False;mergedRealFakeLightDir;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-7298.539,-2289.145;Float;False;Constant;_Float25;Float 25;0;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-7329.433,-2952.261;Float;False;Constant;_Float24;Float 24;0;0;Create;True;0;0;False;0;700;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-7330.811,-2531.914;Float;False;Constant;_Float26;Float 26;0;0;Create;True;0;0;False;0;444;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-7120.254,-2385.202;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-7146.275,-2853.669;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;17;-7131.167,-2753.754;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-7156.135,-2621.523;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;26;-6895.608,-2715.927;Float;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;4;-6936.118,-2808.616;Float;False;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;14;-6899.144,-2485.319;Float;False;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-6753.359,-2615.358;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-6763.731,-2439.131;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-6790.939,-2867.147;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;9;-6645.922,-2872.975;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;25;-6614.73,-2438.993;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;3;-6590.167,-2611.385;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;13;-6453.871,-2435.426;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-6343.06,-2807.57;Float;False;Constant;_Float27;Float 27;1;0;Create;True;0;0;False;0;-0.9;-0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;6;-6467.44,-2882.234;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;7;-6446.511,-2618.504;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;151;-7498.249,-2003.577;Float;False;1383.827;553.8374;ILM Information;14;58;53;46;44;45;51;50;52;133;47;48;49;147;149;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;23;-6298.728,-2439.391;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;141;-5039.773,-3517.448;Float;False;1816.283;595.5828;Vertex Color Shading;6;140;128;134;43;135;30;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;18;-6224.762,-2680.771;Float;True;3;0;FLOAT;-0.9;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;58;-7373.528,-1847.412;Float;True;Property;_ILM;ILM;6;0;Create;True;0;0;False;0;None;9585efa57d8d51347aad3d8462c409fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;53;-7238.274,-1953.577;Float;False;Property;_ILMDetail;ILM Detail;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-6080.154,-2437.32;Float;False;Constant;_Float28;Float 28;0;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-7042.42,-1866.771;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;140;-4810.299,-3451.563;Float;False;1032.721;329.0178;Why does this even work?;7;28;32;31;104;105;33;29;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-5840.587,-2638.583;Float;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;30;-4989.773,-3319.128;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;-5562.479,-2635.762;Float;False;lightDotProduct;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-4760.299,-3288.596;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;-4933.319,-3036.865;Float;False;133;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;-4955.763,-3122.943;Float;False;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-6840.645,-1871.413;Float;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-4604.696,-3301.545;Float;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;153;-7623.107,-1035.123;Float;False;2074.331;483.6988;Metal Matcap;15;69;106;71;73;72;74;75;79;78;76;77;80;81;131;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;69;-7573.107,-815.9243;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;32;-4512.7,-3401.563;Float;False;Property;_VertexPaintBrightness;Vertex Paint Brightness ;14;0;Create;True;0;0;False;0;1.3;1.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-4455.049,-3309.916;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-7448.249,-1564.74;Float;False;Property;_BodyShineBrightness;Body Shine Brightness;10;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-7391.751,-1645.81;Float;False;Constant;_Float32;Float 32;1;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-7174.602,-1618.054;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;-4263.896,-3335.022;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;106;-7382.161,-820.4224;Float;True;World;View;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;152;-5301.695,-2000.201;Float;False;1324.477;614.4137;Apply Vertex Colors and Body Shine;12;41;39;37;38;55;130;42;103;144;40;148;136;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-5045.218,-1500.787;Float;False;Constant;_Float31;Float 31;1;0;Create;True;0;0;False;0;100000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-6992.59,-1683.172;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;105;-4101.819,-3337.49;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;103;-5220.474,-1889.307;Float;True;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;40;-5046.519,-1590.912;Float;False;Constant;_Float30;Float 30;1;0;Create;True;0;0;False;0;7.4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-7024.079,-1578.376;Float;False;Constant;_Float35;Float 35;2;0;Create;True;0;0;False;0;0.15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;71;-7154.107,-819.9243;Float;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;144;-5251.695,-1686.67;Float;False;142;0;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-7092.107,-902.9243;Float;False;Constant;_Float41;Float 41;8;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;37;-4841.788,-1753.113;Float;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-6765.588,-1572.673;Float;False;Constant;_Float34;Float 34;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-4802.218,-1584.787;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;48;-6824.454,-1686.981;Float;False;Lighten;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-6929.107,-836.9243;Float;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-3946.577,-3330.447;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;74;-6772.107,-864.9243;Float;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-6576.092,-1664.772;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;155;-3607.532,-2378.565;Float;False;705.627;599.2079;Lighting Mult Information;5;57;56;60;59;61;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-4614.218,-1743.787;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;43;-3739.297,-3277.21;Float;False;HardMix;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-3544.684,-2328.565;Float;False;Property;_VertexPaintBrightnessColor;Vertex Paint Brightness Color;15;0;Create;True;0;0;False;0;1.3;1.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-6549.803,-666.4241;Float;False;Property;_MetalBIntensity;Metal B Intensity;19;0;Create;True;0;0;False;0;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;130;-4467.085,-1853.562;Float;False;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;42;-4416.218,-1751.787;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;147;-6366.422,-1669.185;Float;False;ILMBBodyShine;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;136;-4480.458,-1950.201;Float;False;135;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;148;-4462.74,-1611.996;Float;False;147;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;57;-3557.532,-2206.893;Float;True;Property;_SSS;SSS;7;0;Create;True;0;0;False;0;None;5b0e261d551e404468bac5b4012a0f3e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;77;-6570.104,-983.0246;Float;False;Property;_MetalAIntensity;Metal A Intensity;18;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;75;-6631.107,-891.9243;Float;True;Property;_Metal;Metal;17;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;135;-3505.491,-3268.985;Float;False;vertexColorShading;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-3177.659,-2232.194;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-6294.099,-718.2242;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-3312.659,-1924.194;Float;False;Property;_LightIntensity;Light Intensity;13;0;Create;True;0;0;False;0;1.33;1.33;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;156;-3669.929,-1662.93;Float;False;1638.934;917.7206;Final Color Information;19;118;64;120;62;121;63;66;68;82;132;150;90;83;124;84;67;65;99;101;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;125;-4960.829,-4061.116;Float;False;984.3339;450.8289;Shadow Tinting;6;86;85;88;87;89;123;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-4146.218,-1854.592;Float;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;76;-6298.805,-885.8248;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;85;-4910.829,-4011.116;Float;False;Property;_AmbMin;AmbMin;1;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-4896.839,-3910.073;Float;False;Property;_AmbMax;AmbMax;2;0;Create;True;0;0;False;0;0.7;0.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-6134.905,-815.8244;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;64;-3557.574,-1361.654;Float;False;Property;_LightColor;Light Color;11;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightColorNode;120;-3595.937,-1465.959;Float;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;131;-6238.191,-985.1229;Float;False;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;118;-3619.929,-1532.546;Float;False;115;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;-3085.905,-1935.357;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-5978.903,-834.2245;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;87;-4599.564,-4008.288;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;88;-4877.564,-3817.287;Float;False;Property;_ShadowTint;Shadow Tint;0;0;Create;True;0;0;False;0;0.4485294,0.4485294,0.4485294,0;0.7803922,0.7803922,0.7803922,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareGreater;121;-3372.825,-1508.629;Float;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;62;-3216.494,-1612.93;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;89;-4396.565,-3980.288;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;149;-6923.788,-1762.726;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;157;-1532.098,-1398.906;Float;False;974.5815;812.8878;Output;8;92;93;91;94;95;97;100;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;126;-5791.776,-832.4055;Float;False;metalMatCap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-2970.11,-1593.148;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;65;-3293.521,-1241.152;Float;True;Property;_Base;Base;5;0;Create;True;0;0;False;0;None;ccd650210bdbf6d42885ca1c3a2810d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;132;-3047.609,-1395.711;Float;False;126;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;150;-3230.168,-1036.337;Float;False;149;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-3108.578,-1316.781;Float;False;Constant;_Float40;Float 40;8;0;Create;True;0;0;False;0;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;84;-3193.787,-952.6073;Float;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;83;-2899.59,-1047.386;Float;True;Property;_Detail;Detail;8;0;Create;True;0;0;False;0;None;da64de99bcb4ba546859b45e0ac43dac;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;124;-2833.499,-860.2095;Float;False;123;0;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;82;-2823.45,-1405.037;Float;False;Property;_MetalEnable;Metal Enable;16;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;123;-4224.495,-3975.423;Float;False;shadowTinting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;66;-2921.717,-1278.618;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-1468.466,-803.8782;Float;False;Constant;_Float46;Float 46;17;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-1482.098,-701.0182;Float;False;Property;_OutlineThickness;Outline Thickness;3;0;Create;True;0;0;False;0;2;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-1290.011,-802.6382;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-2491.704,-1404.097;Float;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;90;-2520.017,-1079.315;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;91;-1425.09,-1007.701;Float;False;Property;_OutlineColor;Outline Color;4;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;99;-2339.238,-1084.754;Float;False;FinalEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;101;-2311.994,-1408.356;Float;False;finalCustomLighting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;100;-1120.932,-1124.92;Float;False;101;0;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-1078.361,-1301.952;Float;False;99;0;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;95;-1152.452,-992.2514;Float;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-820.5165,-1348.906;Float;False;True;2;Float;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;110;0;108;0
WireConnection;112;0;109;2
WireConnection;111;0;110;0
WireConnection;113;0;111;0
WireConnection;113;1;112;0
WireConnection;114;0;113;0
WireConnection;115;0;114;0
WireConnection;116;0;117;0
WireConnection;116;2;8;0
WireConnection;116;3;96;0
WireConnection;142;0;116;0
WireConnection;15;0;143;0
WireConnection;15;1;10;0
WireConnection;22;0;1;0
WireConnection;22;1;143;0
WireConnection;2;0;143;0
WireConnection;2;1;11;0
WireConnection;26;0;17;0
WireConnection;26;1;2;0
WireConnection;4;0;22;0
WireConnection;4;1;17;0
WireConnection;14;0;15;0
WireConnection;14;1;17;0
WireConnection;12;0;26;0
WireConnection;12;1;11;0
WireConnection;20;0;14;0
WireConnection;20;1;10;0
WireConnection;5;0;1;0
WireConnection;5;1;4;0
WireConnection;9;0;5;0
WireConnection;25;0;20;0
WireConnection;3;0;12;0
WireConnection;13;0;25;0
WireConnection;6;0;9;0
WireConnection;7;0;3;0
WireConnection;23;0;13;0
WireConnection;18;0;16;0
WireConnection;18;1;6;0
WireConnection;18;2;7;0
WireConnection;52;0;53;0
WireConnection;52;1;58;2
WireConnection;27;0;18;0
WireConnection;27;1;23;0
WireConnection;27;2;24;0
WireConnection;127;0;27;0
WireConnection;29;0;30;1
WireConnection;29;1;30;1
WireConnection;133;0;52;0
WireConnection;28;0;29;0
WireConnection;28;1;29;0
WireConnection;28;2;128;0
WireConnection;28;3;134;0
WireConnection;31;0;28;0
WireConnection;31;1;28;0
WireConnection;45;0;44;0
WireConnection;45;1;46;0
WireConnection;104;0;32;0
WireConnection;104;1;31;0
WireConnection;104;2;31;0
WireConnection;106;0;69;0
WireConnection;47;0;58;3
WireConnection;47;1;45;0
WireConnection;105;0;104;0
WireConnection;105;1;104;0
WireConnection;71;0;106;0
WireConnection;37;0;103;0
WireConnection;37;1;144;0
WireConnection;39;0;40;0
WireConnection;39;1;41;0
WireConnection;48;0;47;0
WireConnection;48;1;51;0
WireConnection;72;0;73;0
WireConnection;72;1;71;0
WireConnection;33;0;105;0
WireConnection;33;1;105;0
WireConnection;74;0;73;0
WireConnection;74;1;72;0
WireConnection;49;0;48;0
WireConnection;49;1;50;0
WireConnection;38;0;37;0
WireConnection;38;1;39;0
WireConnection;43;0;33;0
WireConnection;43;1;30;2
WireConnection;42;0;38;0
WireConnection;147;0;49;0
WireConnection;75;1;74;0
WireConnection;135;0;43;0
WireConnection;60;0;56;0
WireConnection;60;1;57;0
WireConnection;78;0;75;3
WireConnection;78;1;79;0
WireConnection;55;0;136;0
WireConnection;55;1;130;0
WireConnection;55;2;42;0
WireConnection;55;3;148;0
WireConnection;76;0;77;0
WireConnection;76;1;75;1
WireConnection;80;0;76;0
WireConnection;80;1;78;0
WireConnection;61;0;60;0
WireConnection;61;1;59;0
WireConnection;61;2;55;0
WireConnection;81;0;131;0
WireConnection;81;1;80;0
WireConnection;87;1;85;0
WireConnection;87;2;86;0
WireConnection;121;0;118;0
WireConnection;121;2;120;0
WireConnection;121;3;64;0
WireConnection;62;0;61;0
WireConnection;62;1;42;0
WireConnection;89;0;87;0
WireConnection;89;1;88;0
WireConnection;149;0;58;4
WireConnection;126;0;81;0
WireConnection;63;0;62;0
WireConnection;63;1;121;0
WireConnection;83;1;84;0
WireConnection;82;0;63;0
WireConnection;82;1;132;0
WireConnection;123;0;89;0
WireConnection;66;0;67;0
WireConnection;66;1;65;0
WireConnection;66;2;150;0
WireConnection;94;0;92;0
WireConnection;94;1;93;0
WireConnection;68;0;63;0
WireConnection;68;1;82;0
WireConnection;68;2;66;0
WireConnection;68;3;83;0
WireConnection;90;0;66;0
WireConnection;90;1;83;0
WireConnection;90;2;124;0
WireConnection;99;0;90;0
WireConnection;101;0;68;0
WireConnection;95;0;91;0
WireConnection;95;1;94;0
WireConnection;0;2;97;0
WireConnection;0;13;100;0
WireConnection;0;11;95;0
ASEEND*/
//CHKSM=96A2538A32EB3EDA3E1FD5C88CEA8AE160A76F94
// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light"
{
	Properties
	{
		_Base("Base", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_Detail("Detail", 2D) = "white" {}
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 2
		[Toggle]_MetalEnable("Metal Enable", Float) = 0
		_Metal("Metal", 2D) = "white" {}
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 5
		_AmbMin("AmbMin", Float) = 0.2
		_AmbMax("AmbMax", Float) = 0.7
		_BodyShineBrightness("Body Shine Brightness", Range( 0 , 1)) = 0.5
		_LightColor("Light Color", Color) = (1,1,1,0)
		_LightDir("Light Dir", Color) = (1,1,1,0)
		_LightIntensity("Light Intensity", Float) = 1.33
		_ShadowTint("Shadow Tint", Color) = (0.4485294,0.4485294,0.4485294,0)
		_VertexPaintBrightnessColor("Vertex Paint Brightness Color", Float) = 1.3
		_VertexColorOpacity("Vertex Color Opacity", Range( 0 , 1)) = 0.5
		_VertexColorScale("Vertex Color Scale", Range( 0 , 0.9999)) = 0.75
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
		uniform float _VertexColorOpacity;
		uniform float _VertexColorScale;
		uniform float4 _LightDir;
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
			float3 outline159 = 0;
			v.vertex.xyz += outline159;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_SSS = i.uv_texcoord * _SSS_ST.xy + _SSS_ST.zw;
			float4 temp_cast_2 = (_LightIntensity).xxxx;
			float blendOpSrc210 = ( 1.0 - _VertexColorOpacity );
			float blendOpDest210 = i.vertexColor.g;
			float temp_output_3_0_g1 = ( _VertexColorScale - i.vertexColor.r );
			float lerpBlendMode210 = lerp(blendOpDest210,min( blendOpSrc210 , blendOpDest210 ),saturate( ( temp_output_3_0_g1 / fwidth( temp_output_3_0_g1 ) ) ));
			float vertexColorShading205 = ( saturate( lerpBlendMode210 ));
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
			float temp_output_27_0 = ( lerpResult18 + clampResult23 + 2.0 );
			float lightDotProduct127 = temp_output_27_0;
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float dotResult37 = dot( float4( ase_normWorldNormal , 0.0 ) , mergedRealFakeLightDir142 );
			float clampResult42 = clamp( ( dotResult37 * ( 7.4 * 100000.0 ) ) , 0.0 , 1.0 );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode58 = tex2D( _ILM, uv_ILM );
			float blendOpSrc48 = ( tex2DNode58.b * ( 0.5 * _BodyShineBrightness ) );
			float blendOpDest48 = 0.15;
			float ILMBBodyShine147 = ( ( saturate( 	max( blendOpSrc48, blendOpDest48 ) )) * 1.0 );
			float temp_output_55_0 = ( vertexColorShading205 * lightDotProduct127 * clampResult42 * ILMBBodyShine147 );
			float4 lerpResult61 = lerp( ( _VertexPaintBrightnessColor * tex2D( _SSS, uv_SSS ) ) , temp_cast_2 , temp_output_55_0);
			float lerpResult190 = lerp( temp_output_55_0 , clampResult42 , vertexColorShading205);
			float4 temp_output_63_0 = ( ( lerpResult61 * ( lerpResult190 + 0.0 ) ) * (( hasWorldLight115 > 0.0 ) ? ase_lightColor :  _LightColor ) );
			float3 worldToViewDir106 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode75 = tex2D( _Metal, ( 0.5 + ( 0.5 * (worldToViewDir106).xy ) ) );
			float metalMatCap126 = ( lightDotProduct127 * ( ( _MetalAIntensity * tex2DNode75.r ) + ( tex2DNode75.b * _MetalBIntensity ) ) );
			float4 temp_cast_9 = (metalMatCap126).xxxx;
			float4 temp_cast_10 = (-1.0).xxxx;
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float ILMA149 = tex2DNode58.a;
			float4 lerpResult66 = lerp( temp_cast_10 , tex2D( _Base, uv_Base ) , ILMA149);
			float4 tex2DNode83 = tex2D( _Detail, i.uv2_texcoord2 );
			float4 finalCustomLighting101 = ( temp_output_63_0 * (( _MetalEnable )?( temp_cast_9 ):( temp_output_63_0 )) * lerpResult66 * tex2DNode83 );
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
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17700
-1506;41;1478;747;6027.88;2137.075;1.780108;True;True
Node;AmplifyShaderEditor.CommentaryNode;107;-7657.716,-4022.945;Inherit;False;1346.424;476.0435;Is there a light source?;8;115;114;113;112;111;110;109;108;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;108;-7607.716,-3972.945;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.AbsOpNode;110;-7367.222,-3970.844;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;109;-7558.027,-3787.799;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCCompareGreater;112;-7236.448,-3762.346;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;111;-7240.346,-3966.165;Inherit;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;113;-7001.94,-3785.878;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;114;-6832.408,-3777.918;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;115;-6583.295,-3776.901;Float;True;hasWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;145;-7482.25,-3530.034;Inherit;False;920.5117;456.4358;Real or Fake light direction;5;96;8;116;142;117;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;117;-7418.25,-3480.034;Inherit;False;115;hasWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;8;-7425.267,-3409.515;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;96;-7432.25,-3280.598;Float;False;Property;_LightDir;Light Dir;15;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareGreater;116;-7084.765,-3338.656;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;146;-7601.251,-3002.261;Inherit;False;2292.773;828.1161;Dot Light Direction;28;17;15;143;5;22;1;4;26;2;11;14;12;20;10;25;9;6;3;13;23;7;18;16;27;24;127;187;188;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;142;-6874.739,-3330.107;Float;False;mergedRealFakeLightDir;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-7330.811,-2531.914;Float;False;Constant;_Float26;Float 26;0;0;Create;True;0;0;False;0;444;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;-7551.251,-2654.622;Inherit;False;142;mergedRealFakeLightDir;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-7298.539,-2289.145;Float;False;Constant;_Float25;Float 25;0;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-7329.433,-2952.261;Float;False;Constant;_Float24;Float 24;0;0;Create;True;0;0;False;0;700;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;17;-7131.167,-2753.754;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-7146.275,-2853.669;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-7156.135,-2621.523;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-7120.254,-2385.202;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;151;-7536.478,-1589.418;Inherit;False;1383.827;553.8374;ILM Information;14;58;53;46;44;45;51;50;52;133;47;48;49;147;149;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DotProductOpNode;4;-6936.118,-2808.616;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;14;-6899.144,-2485.319;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;26;-6895.608,-2715.927;Inherit;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;153;-7559.391,-2118.31;Inherit;False;2074.331;483.6988;Metal Matcap;15;69;106;71;73;72;74;75;79;78;76;77;80;81;131;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-7429.98,-1231.651;Float;False;Constant;_Float32;Float 32;1;0;Create;True;0;0;False;0;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-7486.478,-1150.581;Float;False;Property;_BodyShineBrightness;Body Shine Brightness;12;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-6763.731,-2439.131;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-6790.939,-2867.147;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-6753.359,-2615.358;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;69;-7509.391,-1899.111;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;25;-6614.73,-2438.993;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;3;-6590.167,-2611.385;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;218;-7502.693,-977.0074;Inherit;False;1274.417;550.1586;Vertex Color Shading;10;193;215;210;196;195;213;214;205;208;220;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;9;-6645.922,-2872.975;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-7212.831,-1203.895;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;58;-7411.757,-1433.253;Inherit;True;Property;_ILM;ILM;1;0;Create;True;0;0;False;0;-1;None;9585efa57d8d51347aad3d8462c409fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;193;-7452.693,-825.1117;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;214;-7275.602,-752.4644;Inherit;False;Property;_VertexColorScale;Vertex Color Scale;20;0;Create;True;0;0;False;0;0.75;0.75;0;0.9999;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-7062.308,-1164.217;Float;False;Constant;_Float35;Float 35;2;0;Create;True;0;0;False;0;0.15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;106;-7318.445,-1903.609;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FloorOpNode;13;-6453.871,-2435.426;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;7;-6446.511,-2618.504;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-6343.06,-2807.57;Float;False;Constant;_Float27;Float 27;1;0;Create;True;0;0;False;0;-0.9;-0.9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;219;-5621.21,-1587.612;Inherit;False;1408.959;619.3519;Apply Vertex Colors and Body Shine;13;40;144;41;103;39;37;38;136;42;148;130;55;190;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-7030.819,-1269.013;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;6;-6467.44,-2882.234;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;208;-7310.943,-919.0074;Inherit;False;Property;_VertexColorOpacity;Vertex Color Opacity;19;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-6080.154,-2437.32;Float;False;Constant;_Float28;Float 28;0;0;Create;True;0;0;False;0;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;213;-6996.601,-779.4645;Inherit;False;Step Antialiasing;-1;;1;2a825e80dfb3290468194f83380797bd;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-5366.035,-1174.386;Float;False;Constant;_Float30;Float 30;1;0;Create;True;0;0;False;0;7.4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;23;-6298.728,-2439.391;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;48;-6862.683,-1272.822;Inherit;False;Lighten;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-5364.734,-1084.26;Float;False;Constant;_Float31;Float 31;1;0;Create;True;0;0;False;0;100000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;103;-5539.991,-1472.781;Inherit;True;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;144;-5571.21,-1270.144;Inherit;False;142;mergedRealFakeLightDir;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-6803.817,-1158.514;Float;False;Constant;_Float34;Float 34;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;215;-6985.282,-891.5028;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-7028.391,-1986.111;Float;False;Constant;_Float41;Float 41;8;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;71;-7090.391,-1903.111;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;18;-6224.762,-2680.771;Inherit;True;3;0;FLOAT;-0.9;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-5840.587,-2638.583;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;37;-5161.305,-1336.587;Inherit;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;210;-6739.163,-729.5045;Inherit;False;Darken;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-5121.734,-1168.261;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-6865.391,-1920.111;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-6614.321,-1250.613;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;-5434.479,-2605.762;Float;False;lightDotProduct;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;147;-6404.651,-1255.026;Float;False;ILMBBodyShine;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;74;-6708.391,-1948.111;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-4933.734,-1327.261;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;-6486.276,-730.0935;Float;False;vertexColorShading;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-6486.087,-1749.611;Float;False;Property;_MetalBIntensity;Metal B Intensity;9;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-6506.388,-2066.212;Float;False;Property;_MetalAIntensity;Metal A Intensity;8;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;130;-4880.708,-1467.181;Inherit;False;127;lightDotProduct;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;75;-6567.391,-1975.111;Inherit;True;Property;_Metal;Metal;7;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;148;-4782.257,-1195.47;Inherit;False;147;ILMBBodyShine;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;155;-3904.087,-1985.457;Inherit;False;705.627;599.2079;Lighting Mult Information;5;57;56;60;59;61;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;42;-4735.733,-1335.261;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;136;-4901.037,-1537.612;Inherit;False;205;vertexColorShading;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;57;-3854.087,-1813.785;Inherit;True;Property;_SSS;SSS;2;0;Create;True;0;0;False;0;-1;None;5b0e261d551e404468bac5b4012a0f3e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;76;-6235.089,-1969.012;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-3841.24,-1935.457;Float;False;Property;_VertexPaintBrightnessColor;Vertex Paint Brightness Color;18;0;Create;True;0;0;False;0;1.3;1.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-6230.383,-1801.411;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-4550.738,-1445.066;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;125;-6503.099,-3538.119;Inherit;False;984.3339;450.8289;Shadow Tinting;6;86;85;88;87;89;123;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;131;-6174.475,-2068.31;Inherit;False;127;lightDotProduct;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;156;-3966.484,-1269.822;Inherit;False;1638.934;917.7206;Final Color Information;20;118;64;120;62;121;63;66;68;82;132;150;90;83;124;84;67;65;99;101;191;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-3609.214,-1531.086;Float;False;Property;_LightIntensity;Light Intensity;16;0;Create;True;0;0;False;0;1.33;1.33;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-3474.214,-1839.087;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-6439.109,-3387.076;Float;False;Property;_AmbMax;AmbMax;11;0;Create;True;0;0;False;0;0.7;0.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;85;-6453.099,-3488.119;Float;False;Property;_AmbMin;AmbMin;10;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;190;-4394.251,-1391.867;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-6071.188,-1899.011;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;191;-3741.302,-1240.929;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;-3382.46,-1542.249;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;88;-6419.834,-3294.291;Float;False;Property;_ShadowTint;Shadow Tint;17;0;Create;True;0;0;False;0;0.4485294,0.4485294,0.4485294,0;0.4485292,0.4485292,0.4485292,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;87;-6141.834,-3485.292;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;118;-3916.484,-1139.438;Inherit;False;115;hasWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-5915.187,-1917.411;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;64;-3854.129,-968.546;Float;False;Property;_LightColor;Light Color;14;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightColorNode;120;-3892.492,-1072.851;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;89;-5938.835,-3457.292;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;160;-7492.996,-365.9431;Inherit;False;832.2299;472.6832;Outline;6;92;93;94;91;95;159;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;126;-5728.06,-1915.593;Float;False;metalMatCap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;121;-3669.38,-1115.521;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;149;-6962.017,-1348.567;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;62;-3513.049,-1219.822;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;84;-3490.343,-559.4992;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;123;-5766.765,-3452.427;Float;False;shadowTinting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;65;-3590.076,-848.0439;Inherit;True;Property;_Base;Base;0;0;Create;True;0;0;False;0;-1;None;ccd650210bdbf6d42885ca1c3a2810d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;67;-3405.133,-923.673;Float;False;Constant;_Float40;Float 40;8;0;Create;True;0;0;False;0;-1;-1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-3266.666,-1200.04;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;-3344.164,-1002.603;Inherit;False;126;metalMatCap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-7429.363,-112.1202;Float;False;Constant;_Float46;Float 46;17;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;150;-3526.723,-643.2289;Inherit;False;149;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-7442.996,-9.259876;Float;False;Property;_OutlineThickness;Outline Thickness;5;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-7250.909,-110.8803;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;83;-3196.146,-654.2778;Inherit;True;Property;_Detail;Detail;3;0;Create;True;0;0;False;0;-1;None;da64de99bcb4ba546859b45e0ac43dac;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;91;-7385.987,-315.9431;Float;False;Property;_OutlineColor;Outline Color;4;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;66;-3218.272,-885.5099;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;82;-3123.005,-1025.929;Float;False;Property;_MetalEnable;Metal Enable;6;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;124;-3130.054,-467.1014;Inherit;False;123;shadowTinting;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;95;-7113.35,-300.4934;Inherit;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-2788.26,-1010.989;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;90;-2816.573,-686.2068;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;161;-6163.351,-4123.444;Inherit;False;564.9398;497;Output;4;97;0;158;100;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;99;-2635.793,-691.6459;Float;False;FinalEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;159;-6884.766,-302.7587;Inherit;False;outline;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;101;-2608.549,-1015.248;Float;False;finalCustomLighting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;195;-7396.239,-542.8488;Inherit;False;133;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;-7418.685,-628.9269;Inherit;False;127;lightDotProduct;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-6878.874,-1457.254;Float;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;100;-6113.351,-3847.209;Inherit;False;101;finalCustomLighting;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-5823.25,-2377.026;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;188;-5581.25,-2546.026;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-7276.503,-1540.418;Float;False;Property;_ILMDetailScale;ILM Detail Scale;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;220;-7150.617,-654.4296;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-6111.256,-4026.489;Inherit;False;99;FinalEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-6092.331,-3764.245;Inherit;False;159;outline;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-7080.649,-1452.612;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-5853.41,-4073.443;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
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
WireConnection;22;0;1;0
WireConnection;22;1;143;0
WireConnection;2;0;143;0
WireConnection;2;1;11;0
WireConnection;15;0;143;0
WireConnection;15;1;10;0
WireConnection;4;0;22;0
WireConnection;4;1;17;0
WireConnection;14;0;15;0
WireConnection;14;1;17;0
WireConnection;26;0;17;0
WireConnection;26;1;2;0
WireConnection;20;0;14;0
WireConnection;20;1;10;0
WireConnection;5;0;1;0
WireConnection;5;1;4;0
WireConnection;12;0;26;0
WireConnection;12;1;11;0
WireConnection;25;0;20;0
WireConnection;3;0;12;0
WireConnection;9;0;5;0
WireConnection;45;0;44;0
WireConnection;45;1;46;0
WireConnection;106;0;69;0
WireConnection;13;0;25;0
WireConnection;7;0;3;0
WireConnection;47;0;58;3
WireConnection;47;1;45;0
WireConnection;6;0;9;0
WireConnection;213;1;193;1
WireConnection;213;2;214;0
WireConnection;23;0;13;0
WireConnection;48;0;47;0
WireConnection;48;1;51;0
WireConnection;215;0;208;0
WireConnection;71;0;106;0
WireConnection;18;0;16;0
WireConnection;18;1;6;0
WireConnection;18;2;7;0
WireConnection;27;0;18;0
WireConnection;27;1;23;0
WireConnection;27;2;24;0
WireConnection;37;0;103;0
WireConnection;37;1;144;0
WireConnection;210;0;215;0
WireConnection;210;1;193;2
WireConnection;210;2;213;0
WireConnection;39;0;40;0
WireConnection;39;1;41;0
WireConnection;72;0;73;0
WireConnection;72;1;71;0
WireConnection;49;0;48;0
WireConnection;49;1;50;0
WireConnection;127;0;27;0
WireConnection;147;0;49;0
WireConnection;74;0;73;0
WireConnection;74;1;72;0
WireConnection;38;0;37;0
WireConnection;38;1;39;0
WireConnection;205;0;210;0
WireConnection;75;1;74;0
WireConnection;42;0;38;0
WireConnection;76;0;77;0
WireConnection;76;1;75;1
WireConnection;78;0;75;3
WireConnection;78;1;79;0
WireConnection;55;0;136;0
WireConnection;55;1;130;0
WireConnection;55;2;42;0
WireConnection;55;3;148;0
WireConnection;60;0;56;0
WireConnection;60;1;57;0
WireConnection;190;0;55;0
WireConnection;190;1;42;0
WireConnection;190;2;136;0
WireConnection;80;0;76;0
WireConnection;80;1;78;0
WireConnection;191;0;190;0
WireConnection;61;0;60;0
WireConnection;61;1;59;0
WireConnection;61;2;55;0
WireConnection;87;1;85;0
WireConnection;87;2;86;0
WireConnection;81;0;131;0
WireConnection;81;1;80;0
WireConnection;89;0;87;0
WireConnection;89;1;88;0
WireConnection;126;0;81;0
WireConnection;121;0;118;0
WireConnection;121;2;120;0
WireConnection;121;3;64;0
WireConnection;149;0;58;4
WireConnection;62;0;61;0
WireConnection;62;1;191;0
WireConnection;123;0;89;0
WireConnection;63;0;62;0
WireConnection;63;1;121;0
WireConnection;94;0;92;0
WireConnection;94;1;93;0
WireConnection;83;1;84;0
WireConnection;66;0;67;0
WireConnection;66;1;65;0
WireConnection;66;2;150;0
WireConnection;82;0;63;0
WireConnection;82;1;132;0
WireConnection;95;0;91;0
WireConnection;95;1;94;0
WireConnection;68;0;63;0
WireConnection;68;1;82;0
WireConnection;68;2;66;0
WireConnection;68;3;83;0
WireConnection;90;0;66;0
WireConnection;90;1;83;0
WireConnection;90;2;124;0
WireConnection;99;0;90;0
WireConnection;159;0;95;0
WireConnection;101;0;68;0
WireConnection;133;0;52;0
WireConnection;188;0;27;0
WireConnection;188;1;187;0
WireConnection;220;0;193;1
WireConnection;220;1;196;0
WireConnection;220;2;195;0
WireConnection;52;0;53;0
WireConnection;52;1;58;2
WireConnection;0;2;97;0
WireConnection;0;13;100;0
WireConnection;0;11;158;0
ASEEND*/
//CHKSM=30A2E98EF04B9ED16570BF1022AEAB1791FCAAD7
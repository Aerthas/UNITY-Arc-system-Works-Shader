// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Merged Light"
{
	Properties
	{
		_Base("Base", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_DetailRequiresUVtobeonasecondUVChannel("Detail (Requires UV to be on a second UV Channel)", 2D) = "white" {}
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineThickness("Outline Thickness", Float) = 3
		[Toggle]_OutlineDiffuseMultEnable("Outline Diffuse Mult Enable", Float) = 0
		[Toggle]_MetalEnable("Metal Enable", Float) = 0
		_Metal("Metal", 2D) = "white" {}
		_MetalAIntensity("Metal A Intensity", Float) = 1
		_MetalBIntensity("Metal B Intensity", Float) = 5
		_AmbMin("AmbMin", Float) = 0.2
		_AmbMax("AmbMax", Float) = 0.7
		_LightColor("Light Color", Color) = (1,1,1,0)
		_LightDir("Light Dir", Color) = (1,1,1,0)
		_LightIntensity("Light Intensity", Float) = 1.33
		_LightLayer1Push("Light Layer 1 Push", Range( 0 , 1)) = 0
		_LightLayer2Push("Light Layer 2 Push", Range( 0 , 1)) = 0
		_ShineSize("Shine Size", Float) = 4
		_ShineIntensity("Shine Intensity", Float) = 1
		_SpecularMult("Specular Mult", Float) = 0
		_ShadowIntensity("Shadow Intensity", Float) = 2
		_ShadowTint("Shadow Tint", Color) = (0,0,0,0)
		_FinalColorIntensity("Final Color Intensity", Float) = 3
		_VertexColorOpacity("Vertex Color Opacity", Range( 0 , 1)) = 1
		_VertexColorScale("Vertex Color Scale", Range( 0 , 0.9999)) = 0.7
		_ILMDetailScale("ILM Detail Scale", Float) = 5
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
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float4 Diffuse315 = tex2D( _Base, uv_Base );
			o.Emission = (( _OutlineDiffuseMultEnable )?( ( _OutlineColor * Diffuse315 ) ):( _OutlineColor )).rgb;
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
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

		uniform sampler2D _Base;
		uniform float4 _Base_ST;
		uniform sampler2D _ILM;
		uniform float4 _ILM_ST;
		uniform sampler2D _DetailRequiresUVtobeonasecondUVChannel;
		uniform float _AmbMin;
		uniform float _AmbMax;
		uniform float4 _ShadowTint;
		uniform sampler2D _SSS;
		uniform float4 _SSS_ST;
		uniform float _LightIntensity;
		uniform float _LightLayer2Push;
		uniform float _SpecularMult;
		uniform float4 _LightDir;
		uniform float _VertexColorOpacity;
		uniform float _ILMDetailScale;
		uniform float _VertexColorScale;
		uniform float _ShadowIntensity;
		uniform float _LightLayer1Push;
		uniform float _FinalColorIntensity;
		uniform float _ShineSize;
		uniform float _ShineIntensity;
		uniform float4 _LightColor;
		uniform float _MetalEnable;
		uniform float _MetalAIntensity;
		uniform sampler2D _Metal;
		uniform float _MetalBIntensity;
		uniform float _OutlineThickness;
		uniform float _OutlineDiffuseMultEnable;
		uniform float4 _OutlineColor;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 outline325 = 0;
			v.vertex.xyz += outline325;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_SSS = i.uv_texcoord * _SSS_ST.xy + _SSS_ST.zw;
			float4 temp_cast_3 = (_LightIntensity).xxxx;
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float temp_output_222_0 = ( 2.0 - (( ase_lightColor.a > 1.1 ) ? 0.5 :  ( 1.0 - _LightLayer2Push ) ) );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode58 = tex2D( _ILM, uv_ILM );
			float ILMB255 = tex2DNode58.b;
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float temp_output_114_0 = (( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) > 0.0 ) ? 1.0 :  0.0 );
			float4 mergedRealFakeLightDir142 = (( temp_output_114_0 > 0.0 ) ? float4( ase_worldlightDir , 0.0 ) :  ( _LightDir * 0.57 ) );
			float dotResult4 = dot( float4( ase_worldNormal , 0.0 ) , ( temp_output_222_0 * mergedRealFakeLightDir142 ) );
			float ILMG133 = ( _ILMDetailScale * tex2DNode58.g );
			float blendOpSrc210 = ( 1.0 - _VertexColorOpacity );
			float blendOpDest210 = ( i.vertexColor.g * ILMG133 );
			float temp_output_3_0_g1 = ( _VertexColorScale - i.vertexColor.r );
			float lerpBlendMode210 = lerp(blendOpDest210,min( blendOpSrc210 , blendOpDest210 ),saturate( ( temp_output_3_0_g1 / fwidth( temp_output_3_0_g1 ) ) ));
			float vertexColorShading205 = ( saturate( lerpBlendMode210 ));
			float clampResult9 = clamp( ( temp_output_222_0 * ( ( ILMB255 * _SpecularMult ) + dotResult4 ) * vertexColorShading205 ) , 0.0 , 1.0 );
			float temp_output_224_0 = ( 2.0 - _LightLayer1Push );
			float dotResult26 = dot( float4( ase_worldNormal , 0.0 ) , ( mergedRealFakeLightDir142 * temp_output_224_0 ) );
			float clampResult7 = clamp( floor( ( dotResult26 * temp_output_224_0 * vertexColorShading205 ) ) , 0.0 , 1.0 );
			float lerpResult18 = lerp( -_ShadowIntensity , 1.0 , clampResult7);
			float dotResult14 = dot( float4( ase_worldNormal , 0.0 ) , mergedRealFakeLightDir142 );
			float blendOpSrc270 = ILMB255;
			float blendOpDest270 = 1.0;
			float clampResult25 = clamp( ( dotResult14 * vertexColorShading205 * ( ( saturate( ( blendOpSrc270 + blendOpDest270 - 1.0 ) )) * _ShineSize ) ) , 0.0 , 1.0 );
			float clampResult23 = clamp( floor( clampResult25 ) , 0.0 , 1.0 );
			float lightDotProduct127 = ( ( floor( clampResult9 ) + lerpResult18 ) + _FinalColorIntensity + ( clampResult23 * _ShineIntensity ) );
			float4 lerpResult61 = lerp( ( 1.3 * tex2D( _SSS, uv_SSS ) ) , temp_cast_3 , ( lightDotProduct127 * 0.15 ));
			float4 LightMultInformation273 = lerpResult61;
			float hasWorldLight115 = temp_output_114_0;
			float4 temp_output_63_0 = ( LightMultInformation273 * (( hasWorldLight115 > 0.0 ) ? ase_lightColor :  _LightColor ) );
			float3 worldToViewDir106 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float4 tex2DNode75 = tex2D( _Metal, ( 0.5 + ( 0.5 * (worldToViewDir106).xy ) ) );
			float metalMatCap126 = ( lightDotProduct127 * ( ( _MetalAIntensity * tex2DNode75.r ) + ( tex2DNode75.b * _MetalBIntensity ) ) );
			float4 temp_cast_10 = (metalMatCap126).xxxx;
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float4 Diffuse315 = tex2D( _Base, uv_Base );
			float ILMA149 = tex2DNode58.a;
			float4 temp_output_305_0 = ( Diffuse315 * ILMA149 );
			float4 tex2DNode83 = tex2D( _DetailRequiresUVtobeonasecondUVChannel, i.uv2_texcoord2 );
			float4 clampResult327 = clamp( ( temp_output_63_0 * (( _MetalEnable )?( temp_cast_10 ):( temp_output_63_0 )) * temp_output_305_0 * tex2DNode83 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 finalCustomLighting101 = clampResult327;
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
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float4 Diffuse315 = tex2D( _Base, uv_Base );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode58 = tex2D( _ILM, uv_ILM );
			float ILMA149 = tex2DNode58.a;
			float4 temp_output_305_0 = ( Diffuse315 * ILMA149 );
			float4 tex2DNode83 = tex2D( _DetailRequiresUVtobeonasecondUVChannel, i.uv2_texcoord2 );
			float4 temp_cast_0 = (_AmbMin).xxxx;
			float4 temp_cast_1 = (_AmbMax).xxxx;
			float4 clampResult290 = clamp( UNITY_LIGHTMODEL_AMBIENT , temp_cast_0 , temp_cast_1 );
			float4 shadowTinting292 = ( clampResult290 * _ShadowTint );
			float4 clampResult328 = clamp( ( temp_output_305_0 * tex2DNode83 * shadowTinting292 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 FinalEmission99 = clampResult328;
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
-1734;53;1624;725;8068.268;2492.157;4.051178;True;True
Node;AmplifyShaderEditor.CommentaryNode;313;-7803.274,-3757.166;Inherit;False;1945.843;576.6858;Real or Fake light;14;108;109;110;111;112;113;96;8;114;303;116;142;115;302;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;108;-7753.274,-3700.209;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.AbsOpNode;110;-7511.781,-3698.109;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;109;-7702.585,-3515.063;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.CommentaryNode;279;-7605.157,-1564.997;Inherit;False;982.6313;443.6515;ILM Information;7;260;149;255;133;52;53;58;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCCompareGreater;112;-7381.007,-3489.611;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;111;-7384.905,-3693.429;Inherit;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;58;-7555.157,-1378.742;Inherit;True;Property;_ILM;ILM;1;0;Create;True;0;0;False;0;-1;None;9585efa57d8d51347aad3d8462c409fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;53;-7235.167,-1433.154;Float;False;Property;_ILMDetailScale;ILM Detail Scale;26;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;96;-6886.624,-3397.237;Float;False;Property;_LightDir;Light Dir;14;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;113;-7146.498,-3513.143;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;312;-7825.248,-3118.974;Inherit;False;2564.235;927.9548;Light DOT Production;42;221;269;307;306;223;143;222;265;224;17;225;2;270;22;266;26;14;4;187;20;12;16;25;3;13;250;7;18;254;23;264;268;24;27;127;6;9;5;311;310;309;308;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;302;-6666.685,-3296.48;Inherit;False;Constant;_Float1;Float 1;25;0;Create;True;0;0;False;0;0.57;0.57;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-7041.501,-1428.543;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;114;-6980.867,-3533.782;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;303;-6486.904,-3336.124;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;8;-6672.406,-3539.769;Inherit;True;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;218;-7588.31,-1044.95;Inherit;False;1274.417;550.1586;Vertex Color Shading;9;193;215;210;195;213;214;205;208;220;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;221;-7775.248,-2996.923;Float;False;Property;_LightLayer2Push;Light Layer 2 Push;17;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-6891.525,-1430.891;Float;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;116;-6358.849,-3494.294;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;193;-7519.31,-893.0539;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;214;-7492.97,-615.8685;Inherit;False;Property;_VertexColorScale;Vertex Color Scale;25;0;Create;True;0;0;False;0;0.7;0.75;0;0.9999;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;195;-7208.855,-791.791;Inherit;False;133;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;208;-7396.56,-986.9496;Inherit;False;Property;_VertexColorOpacity;Vertex Color Opacity;24;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;269;-7486.973,-2989.892;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;307;-7751.569,-2920.903;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCCompareGreater;306;-7504.415,-2882.248;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1.1;False;2;FLOAT;0.5;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;213;-7148.394,-638.3175;Inherit;False;Step Antialiasing;-1;;1;2a825e80dfb3290468194f83380797bd;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;220;-7013.233,-851.3719;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;142;-6133.431,-3500.948;Float;False;mergedRealFakeLightDir;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;223;-7713.494,-2553.947;Float;False;Property;_LightLayer1Push;Light Layer 1 Push;16;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;215;-7070.898,-959.445;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;255;-7051.354,-1321.749;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;265;-7355.052,-2425.698;Inherit;False;255;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;-7598.698,-2691.833;Inherit;False;142;mergedRealFakeLightDir;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;224;-7350.198,-2587.769;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;222;-7314.146,-2997.794;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;210;-6824.779,-797.4468;Inherit;False;Darken;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;308;-6966.946,-3005.424;Inherit;False;Property;_SpecularMult;Specular Mult;20;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;309;-6969.217,-3068.974;Inherit;False;255;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-7159.805,-2645.126;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;17;-7290.96,-2785.384;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;225;-7326.887,-2307.019;Float;False;Property;_ShineSize;Shine Size;18;0;Create;True;0;0;False;0;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;-6532.069,-799.5192;Float;False;vertexColorShading;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-7183.771,-2913.367;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;270;-7171.842,-2422.426;Inherit;False;LinearBurn;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-7081.223,-2824.566;Inherit;False;205;vertexColorShading;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;26;-6957.104,-2724.625;Inherit;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;14;-7003.406,-2548.996;Inherit;True;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;310;-6764.552,-3015.727;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;4;-7005.614,-2923.314;Inherit;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;266;-6972.489,-2365.163;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-6787.647,-2521.918;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;311;-6634.623,-2942.562;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-6758.854,-2708.056;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-6622.252,-2800.265;Float;False;Property;_ShadowIntensity;Shadow Intensity;21;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-6474.833,-2947.645;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;3;-6627.663,-2671.083;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;153;-7546.502,-2148.382;Inherit;False;2074.331;483.6988;Metal Matcap;15;69;106;71;73;72;74;75;79;78;76;77;80;81;131;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;25;-6644.226,-2514.691;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;250;-6394.717,-2789.08;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;9;-6279.119,-2957.374;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;13;-6474.367,-2508.124;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;7;-6484.007,-2678.202;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;69;-7496.502,-1929.183;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;23;-6328.224,-2508.089;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;-6284.384,-2352.753;Inherit;False;Property;_ShineIntensity;Shine Intensity;19;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;18;-6174.156,-2827.569;Inherit;True;3;0;FLOAT;-0.9;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;6;-6107.136,-2940.632;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;106;-7305.556,-1933.681;Inherit;True;World;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;268;-5887.586,-2892.105;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;71;-7077.502,-1933.183;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-7015.502,-2016.183;Float;False;Constant;_Float41;Float 41;8;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;264;-6033.35,-2507.847;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-6042.225,-2654.667;Float;False;Property;_FinalColorIntensity;Final Color Intensity;23;0;Create;True;0;0;False;0;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-5752.143,-2710.514;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-6852.502,-1950.183;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;74;-6695.502,-1978.183;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;-5490.013,-2616.672;Float;False;lightDotProduct;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;274;-7529.822,-366.0286;Inherit;False;961.1257;648.75;Lighting Mult Information;9;57;56;263;130;55;59;60;61;273;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;57;-7474.608,-194.3565;Inherit;True;Property;_SSS;SSS;2;0;Create;True;0;0;False;0;-1;None;5b0e261d551e404468bac5b4012a0f3e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;130;-7479.822,50.84399;Inherit;False;127;lightDotProduct;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-7461.761,-316.0286;Float;False;Constant;_ShadeOffsetMult;Shade Offset Mult;25;0;Create;True;0;0;False;0;1.3;1.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;75;-6554.502,-2005.183;Inherit;True;Property;_Metal;Metal;8;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;77;-6493.5,-2096.284;Float;False;Property;_MetalAIntensity;Metal A Intensity;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-7341.684,166.7201;Inherit;False;Constant;_Float0;Float 0;25;0;Create;True;0;0;False;0;0.15;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-6473.198,-1779.683;Float;False;Property;_MetalBIntensity;Metal B Intensity;10;0;Create;True;0;0;False;0;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-7223.832,11.59293;Float;False;Property;_LightIntensity;Light Intensity;15;0;Create;True;0;0;False;0;1.33;1.33;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;76;-6222.2,-1999.084;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-7094.735,-219.6584;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-6217.494,-1831.483;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;294;-6256.882,-1026.133;Inherit;False;947.6294;460.1959;Shadow Tinting;7;289;290;291;292;287;288;293;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-7169.837,128.3541;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;-7002.981,77.17896;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;115;-6720.853,-3707.166;Float;False;hasWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-6058.299,-1929.083;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;287;-6201.597,-840.722;Float;False;Property;_AmbMax;AmbMax;12;0;Create;True;0;0;False;0;0.7;0.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;131;-6161.586,-2098.382;Inherit;False;127;lightDotProduct;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;288;-6203.587,-910.765;Float;False;Property;_AmbMin;AmbMin;11;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;278;-6457.77,-407.2737;Inherit;False;1904.024;885.2387;Final Color Information;21;99;101;68;90;82;83;305;299;132;63;84;150;121;275;120;118;315;64;65;328;327;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;293;-6206.882,-976.133;Inherit;False;UNITY_LIGHTMODEL_AMBIENT;0;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;65;-6175.364,-99.8774;Inherit;True;Property;_Base;Base;0;0;Create;True;0;0;False;0;-1;None;ccd650210bdbf6d42885ca1c3a2810d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;273;-6800.848,78.36243;Inherit;False;LightMultInformation;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;290;-5908.322,-968.938;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;64;-6413.414,-109.7797;Float;False;Property;_LightColor;Light Color;13;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;289;-6198.322,-767.9371;Float;False;Property;_ShadowTint;Shadow Tint;22;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-5902.298,-1947.483;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;118;-6402.77,-326.6714;Inherit;False;115;hasWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;120;-6391.778,-242.0845;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;126;-5715.171,-1945.665;Float;False;metalMatCap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;121;-6160.665,-272.7544;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;291;-5705.323,-940.938;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;316;-6545.156,-1556.944;Inherit;False;1304.221;434.9897;Outline;9;325;324;323;321;320;319;318;317;326;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;275;-6075.593,-368.128;Inherit;False;273;LightMultInformation;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;315;-5870.082,-75.46481;Inherit;False;Diffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;149;-7167.359,-1232.846;Float;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;317;-6495.156,-1491.111;Float;False;Property;_OutlineColor;Outline Color;4;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;318;-6425.984,-1310.118;Inherit;False;315;Diffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;292;-5533.253,-936.0731;Float;False;shadowTinting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;150;-6084.213,89.8374;Inherit;False;149;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;84;-5981.628,283.2672;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-5757.951,-357.2736;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;-5835.449,-159.8366;Inherit;False;126;metalMatCap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;82;-5614.29,-183.1625;Float;False;Property;_MetalEnable;Metal Enable;7;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;305;-5658.491,-32.22625;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;299;-5379.044,247.1225;Inherit;False;292;shadowTinting;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;83;-5687.431,188.4887;Inherit;True;Property;_DetailRequiresUVtobeonasecondUVChannel;Detail (Requires UV to be on a second UV Channel);3;0;Create;True;0;0;False;0;-1;None;da64de99bcb4ba546859b45e0ac43dac;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;319;-6072.463,-1237.954;Float;False;Property;_OutlineThickness;Outline Thickness;5;0;Create;True;0;0;False;0;3;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;320;-6141.988,-1446.944;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-6024.538,-1332.901;Float;False;Constant;_Float46;Float 46;17;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;323;-5847.403,-1327.705;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;326;-5944.624,-1491.683;Inherit;False;Property;_OutlineDiffuseMultEnable;Outline Diffuse Mult Enable;6;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-5279.545,-168.2226;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;90;-5127.634,143.7891;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;327;-5078.605,-168.1105;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;328;-4954.605,146.8895;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;324;-5661.519,-1355.662;Inherit;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;325;-5464.935,-1348.927;Inherit;False;outline;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;101;-4928.638,-172.4815;Float;False;finalCustomLighting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;99;-4781.54,145.5787;Float;False;FinalEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;161;-5148.352,-1322.828;Inherit;False;564.9398;497;Output;4;97;0;158;100;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;260;-7248.599,-1514.997;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;100;-5098.352,-1046.593;Inherit;False;101;finalCustomLighting;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-5096.257,-1225.873;Inherit;False;99;FinalEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-5077.332,-963.6299;Inherit;False;325;outline;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-4838.412,-1272.827;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Merged Light;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;110;0;108;0
WireConnection;112;0;109;2
WireConnection;111;0;110;0
WireConnection;113;0;111;0
WireConnection;113;1;112;0
WireConnection;52;0;53;0
WireConnection;52;1;58;2
WireConnection;114;0;113;0
WireConnection;303;0;96;0
WireConnection;303;1;302;0
WireConnection;133;0;52;0
WireConnection;116;0;114;0
WireConnection;116;2;8;0
WireConnection;116;3;303;0
WireConnection;269;0;221;0
WireConnection;306;0;307;2
WireConnection;306;3;269;0
WireConnection;213;1;193;1
WireConnection;213;2;214;0
WireConnection;220;0;193;2
WireConnection;220;1;195;0
WireConnection;142;0;116;0
WireConnection;215;0;208;0
WireConnection;255;0;58;3
WireConnection;224;1;223;0
WireConnection;222;1;306;0
WireConnection;210;0;215;0
WireConnection;210;1;220;0
WireConnection;210;2;213;0
WireConnection;2;0;143;0
WireConnection;2;1;224;0
WireConnection;205;0;210;0
WireConnection;22;0;222;0
WireConnection;22;1;143;0
WireConnection;270;0;265;0
WireConnection;26;0;17;0
WireConnection;26;1;2;0
WireConnection;14;0;17;0
WireConnection;14;1;143;0
WireConnection;310;0;309;0
WireConnection;310;1;308;0
WireConnection;4;0;17;0
WireConnection;4;1;22;0
WireConnection;266;0;270;0
WireConnection;266;1;225;0
WireConnection;20;0;14;0
WireConnection;20;1;187;0
WireConnection;20;2;266;0
WireConnection;311;0;310;0
WireConnection;311;1;4;0
WireConnection;12;0;26;0
WireConnection;12;1;224;0
WireConnection;12;2;187;0
WireConnection;5;0;222;0
WireConnection;5;1;311;0
WireConnection;5;2;187;0
WireConnection;3;0;12;0
WireConnection;25;0;20;0
WireConnection;250;0;16;0
WireConnection;9;0;5;0
WireConnection;13;0;25;0
WireConnection;7;0;3;0
WireConnection;23;0;13;0
WireConnection;18;0;250;0
WireConnection;18;2;7;0
WireConnection;6;0;9;0
WireConnection;106;0;69;0
WireConnection;268;0;6;0
WireConnection;268;1;18;0
WireConnection;71;0;106;0
WireConnection;264;0;23;0
WireConnection;264;1;254;0
WireConnection;27;0;268;0
WireConnection;27;1;24;0
WireConnection;27;2;264;0
WireConnection;72;0;73;0
WireConnection;72;1;71;0
WireConnection;74;0;73;0
WireConnection;74;1;72;0
WireConnection;127;0;27;0
WireConnection;75;1;74;0
WireConnection;76;0;77;0
WireConnection;76;1;75;1
WireConnection;60;0;56;0
WireConnection;60;1;57;0
WireConnection;78;0;75;3
WireConnection;78;1;79;0
WireConnection;55;0;130;0
WireConnection;55;1;263;0
WireConnection;61;0;60;0
WireConnection;61;1;59;0
WireConnection;61;2;55;0
WireConnection;115;0;114;0
WireConnection;80;0;76;0
WireConnection;80;1;78;0
WireConnection;273;0;61;0
WireConnection;290;0;293;0
WireConnection;290;1;288;0
WireConnection;290;2;287;0
WireConnection;81;0;131;0
WireConnection;81;1;80;0
WireConnection;126;0;81;0
WireConnection;121;0;118;0
WireConnection;121;2;120;0
WireConnection;121;3;64;0
WireConnection;291;0;290;0
WireConnection;291;1;289;0
WireConnection;315;0;65;0
WireConnection;149;0;58;4
WireConnection;292;0;291;0
WireConnection;63;0;275;0
WireConnection;63;1;121;0
WireConnection;82;0;63;0
WireConnection;82;1;132;0
WireConnection;305;0;315;0
WireConnection;305;1;150;0
WireConnection;83;1;84;0
WireConnection;320;0;317;0
WireConnection;320;1;318;0
WireConnection;323;0;321;0
WireConnection;323;1;319;0
WireConnection;326;0;317;0
WireConnection;326;1;320;0
WireConnection;68;0;63;0
WireConnection;68;1;82;0
WireConnection;68;2;305;0
WireConnection;68;3;83;0
WireConnection;90;0;305;0
WireConnection;90;1;83;0
WireConnection;90;2;299;0
WireConnection;327;0;68;0
WireConnection;328;0;90;0
WireConnection;324;0;326;0
WireConnection;324;1;323;0
WireConnection;325;0;324;0
WireConnection;101;0;327;0
WireConnection;99;0;328;0
WireConnection;260;0;58;1
WireConnection;0;2;97;0
WireConnection;0;13;100;0
WireConnection;0;11;158;0
ASEEND*/
//CHKSM=D6C04F87F04EB87495A8EF293571B5412E8E0C5A
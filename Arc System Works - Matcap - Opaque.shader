// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Utils/Matcap/Opaque v1.1.0"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Base("Base", 2D) = "white" {}
		_Metal("Metal", 2D) = "white" {}
		[Enum(Automatic RECOMMENDED,0,Forced Fake,1)]_LightColorSetting("Light Color Setting", Float) = 0
		_FakeGlobalLightColor("Fake Global Light Color", Color) = (1,1,1,0)
		_FakeGlobalLightIntensity("Fake Global Light Intensity", Float) = 0.4
		_MinimumGlobalLightIntensity("Minimum Global Light Intensity", Range( 0 , 1)) = 0.4
		_Intensity("Intensity", Float) = 1
		_Tint("Tint", Color) = (1,1,1,0)
		_Saturation("Saturation", Range( 0 , 4)) = 1
		_DepthOffset("Depth Offset", Float) = 1
		[ToggleUI]_EnableOutline("Enable Outline", Float) = 0
		_OutlineThickness("Outline Thickness", Float) = 0
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_OutlineEnableBaseColorMult("Outline Enable Base Color Mult", Float) = 1
		[IntRange]_Reference("Reference", Range( 0 , 255)) = 0
		[IntRange]_ReadMask("Read Mask", Range( 0 , 255)) = 255
		[IntRange]_WriteMask("Write Mask", Range( 0 , 255)) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_Comparison("Comparison", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_PassFront("Pass Front", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_FailFront("Fail Front", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_ZFailFront("ZFail Front", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode("ZTest Mode", Float) = 4
		[Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Float) = 1
		_Factor("Factor", Float) = 0
		_Units("Units", Float) = 0
		_Opacity("Opacity", Range( 0 , 1)) = 1
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
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_33_0_g1419 = _OutlineThickness;
			float3 temp_output_135_0_g1419 = ( ( ase_vertexNormal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.color.g * temp_output_33_0_g1419 ) + temp_output_33_0_g1419 ) * v.color.a ) );
			float3 objectSpaceViewDir136_g1419 = ObjSpaceViewDir( float4( temp_output_135_0_g1419 , 0.0 ) );
			float4 ase_vertex4Pos = v.vertex;
			float4 normalizeResult142_g1419 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g1419 , 0.0 ) - ase_vertex4Pos ) );
			float clampResult141_g1419 = clamp( ( v.color.b + _DepthOffset ) , 0.0 , 1.0 );
			float4 lerpResult145_g1419 = lerp( float4( temp_output_135_0_g1419 , 0.0 ) , -normalizeResult142_g1419 , ( 1.0 - clampResult141_g1419 ));
			float3 outlineVar = lerpResult145_g1419.xyz;
			v.vertex.xyz += outlineVar;
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float4 tex2DNode11 = tex2D( _Base, uv_Base );
			float4 Base66 = tex2DNode11;
			float4 temp_output_13_0_g1419 = max( float4( 0,0,0,0 ) , ( 0.2 * Base66 ) );
			o.Emission = ( ( _OutlineEnableBaseColorMult > 0.0 ? ( temp_output_13_0_g1419 * temp_output_13_0_g1419 ) : _OutlineColor ) * _OutlineColorIntensity ).rgb;
			clip( _EnableOutline - _Cutoff );
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		Offset  [_Factor] , [_Units]
		Stencil
		{
			Ref [_Reference]
			ReadMask [_ReadMask]
			WriteMask [_WriteMask]
			Comp [_Comparison]
			Pass [_PassFront]
			Fail [_FailFront]
			ZFail [_ZFailFront]
		}
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float3 worldNormal;
			float2 uv_texcoord;
			float3 worldPos;
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

		uniform float _Factor;
		uniform float _Reference;
		uniform float _Opacity;
		uniform float _WriteMask;
		uniform float _Units;
		uniform float _Comparison;
		uniform float _PassFront;
		uniform float _ZTestMode;
		uniform float _ZWriteMode;
		uniform float _ZFailFront;
		uniform float _ReadMask;
		uniform float _FailFront;
		uniform sampler2D _Metal;
		uniform sampler2D _Base;
		uniform float4 _Base_ST;
		uniform float _LightColorSetting;
		uniform float _MinimumGlobalLightIntensity;
		uniform float4 _FakeGlobalLightColor;
		uniform float _FakeGlobalLightIntensity;
		uniform float _Intensity;
		uniform float4 _Tint;
		uniform float _Saturation;
		uniform float _OutlineEnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;
		uniform float _EnableOutline;
		uniform float _Cutoff = 0.5;
		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _DepthOffset;


		inline float4 ASESafeNormalize(float4 inVec)
		{
			float dp3 = max( 0.001f , dot( inVec , inVec ) );
			return inVec* rsqrt( dp3);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			v.vertex.xyz += 0;
			v.vertex.w = 1;
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
			float3 ase_worldNormal = i.worldNormal;
			float3 worldToViewDir17 = mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz;
			float3 linearToGamma27 = LinearToGammaSpace( tex2D( _Metal, ( float2( 0.5,0.5 ) + ( float2( -0.5,0.5 ) * (worldToViewDir17).xy ) ) ).rgb );
			float3 break28 = linearToGamma27;
			float4 temp_cast_2 = (break28.x).xxxx;
			float4 temp_cast_3 = (( ( 1.0 + break28.x ) + break28.z )).xxxx;
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float4 tex2DNode11 = tex2D( _Base, uv_Base );
			float4 blendOpSrc14 = temp_cast_3;
			float4 blendOpDest14 = tex2DNode11;
			float4 lerpBlendMode14 = lerp(blendOpDest14,( blendOpSrc14 * blendOpDest14 ),0.8);
			float4 blendOpSrc15 = temp_cast_2;
			float4 blendOpDest15 = ( saturate( lerpBlendMode14 ));
			float4 lerpBlendMode15 = lerp(blendOpDest15,( blendOpSrc15 * blendOpDest15 ),0.8);
			float LightColorSetting9 = _LightColorSetting;
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
			float clampResult7_g824 = clamp( ( ( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
			float4 color14_g824 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
			float4 color8_g824 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
			#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g824 = color8_g824;
			#else
				float4 staticSwitch9_g824 = ( clampResult7_g824 * color14_g824 );
			#endif
			float4 break10_g824 = staticSwitch9_g824;
			float IsThereWorldLight6 = break10_g824.r;
			float ifLocalVar13_g993 = 0;
			if( LightColorSetting9 == 1.0 )
				ifLocalVar13_g993 = 0.0;
			else if( LightColorSetting9 < 1.0 )
				ifLocalVar13_g993 = IsThereWorldLight6;
			float4 temp_cast_5 = (_MinimumGlobalLightIntensity).xxxx;
			float4 temp_cast_6 = (5.0).xxxx;
			float4 clampResult18_g993 = clamp( ase_lightColor , temp_cast_5 , temp_cast_6 );
			float4 temp_output_11_0_g993 = ( ase_lightAtten * clampResult18_g993 );
			float4 temp_output_8_0_g993 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
			float4 ifLocalVar3_g993 = 0;
			if( ifLocalVar13_g993 > 0.0 )
				ifLocalVar3_g993 = temp_output_11_0_g993;
			else if( ifLocalVar13_g993 == 0.0 )
				ifLocalVar3_g993 = temp_output_8_0_g993;
			#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g993 = max( float4( 0,0,0,0 ) , temp_output_11_0_g993 );
			#else
				float4 staticSwitch9_g993 = ifLocalVar3_g993;
			#endif
			float4 GlobalLightColor40 = staticSwitch9_g993;
			float3 desaturateInitialColor9_g1420 = ( ( ( saturate( lerpBlendMode15 )) + ( break28.z * 0.8 ) ) * GlobalLightColor40 * _Intensity * _Tint ).rgb;
			float desaturateDot9_g1420 = dot( desaturateInitialColor9_g1420, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar9_g1420 = lerp( desaturateInitialColor9_g1420, desaturateDot9_g1420.xxx, ( 1.0 - _Saturation ) );
			c.rgb = desaturateVar9_g1420;
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
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
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
	CustomEditor "ASWUtilsMatcapGUI"
}
/*ASEBEGIN
Version=18900
84;367;2298;1011;-189.7356;-961.4341;1;True;True
Node;AmplifyShaderEditor.WorldNormalVector;16;-2340.312,713.9574;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformDirectionNode;17;-2149.371,709.4595;Inherit;True;World;View;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;18;-1921.32,709.9574;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1696.315,692.9574;Inherit;False;2;2;0;FLOAT2;-0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;20;-1543.316,677.9574;Inherit;False;2;2;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;12;-1327.72,651.3152;Inherit;True;Property;_Metal;Metal;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LinearToGammaNode;27;-1000.965,657.1893;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1;-1590.659,-353.1543;Inherit;False;671.0927;363.6688;;5;10;6;9;2;8;Light Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.BreakToComponentsNode;28;-753.6112,653.1176;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.FunctionNode;2;-1513.053,-264.7341;Inherit;False;Is There A Light;-1;;824;65e24b0fdfa2e3146a301178490755c7;0;0;2;FLOAT;0;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;8;-1530.311,-118.7893;Inherit;False;Property;_LightColorSetting;Light Color Setting;2;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;29;-699.2307,-459.989;Inherit;False;1052.858;655.9132;;9;41;40;39;34;35;37;38;36;42;Light Color Calculation;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6;-1250.464,-303.1543;Inherit;False;IsThereWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;9;-1266.311,-119.7893;Inherit;False;LightColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;21;-598.5375,561.3295;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-709.3527,327.1878;Inherit;True;Property;_Base;Base;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightAttenuation;37;-648.5547,-406.6365;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;34;-672.3737,-153.007;Inherit;False;Property;_FakeGlobalLightColor;Fake Global Light Color;3;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;35;-682.0737,102.492;Inherit;False;Property;_MinimumGlobalLightIntensity;Minimum Global Light Intensity;5;0;Create;True;0;0;0;False;0;False;0.4;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;-659.0897,-323.2093;Inherit;False;6;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;-656.0156,-235.9232;Inherit;False;9;LightColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-402.7587,575.3317;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-680.6427,21.29572;Inherit;False;Property;_FakeGlobalLightIntensity;Fake Global Light Intensity;4;0;Create;True;0;0;0;False;0;False;0.4;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;39;-361.3055,-272.1302;Inherit;False;Light Color Calculation;-1;;993;5b8f5c3f2a647dc4d89d921c89ebb0e5;0;7;25;FLOAT;0;False;10;FLOAT;0;False;5;FLOAT;0;False;14;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;19;FLOAT;0;False;2;COLOR;0;COLOR;16
Node;AmplifyShaderEditor.BlendOpsNode;14;-181.0528,447.214;Inherit;False;Multiply;True;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0.8;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-345.2195,301.9114;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;55;758.104,1267.901;Inherit;False;1125;709;;10;65;63;62;61;60;59;58;57;56;67;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;61;808.104,1774.901;Inherit;False;Property;_OutlineEnableBaseColorMult;Outline Enable Base Color Mult;15;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;211.4439,766.6136;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;15;185.0042,587.004;Inherit;False;Multiply;True;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0.8;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;62;806.104,1379.901;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;12;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;60;912.104,1846.901;Inherit;False;66;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;58;909.104,1455.901;Inherit;False;Property;_DepthOffset;Depth Offset;9;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;57;884.104,1534.901;Inherit;False;Property;_OutlineColor;Outline Color;13;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;59;886.104,1315.901;Inherit;False;Property;_OutlineThickness;Outline Thickness;11;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;846.104,1699.901;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;14;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;40;91.43224,-303.6062;Inherit;False;GlobalLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;23;468.2543,661.1307;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;847.2232,772.5473;Inherit;False;40;GlobalLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;46;870.336,857.7238;Inherit;False;Property;_Intensity;Intensity;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;800.8899,1145.333;Inherit;False;Property;_Saturation;Saturation;8;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;69;775.821,-474.2028;Inherit;False;253;357;;4;79;77;74;72;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;67;1200.311,1512.958;Inherit;False;ASWOutline;-1;;1419;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.CommentaryNode;68;391.8212,-474.2028;Inherit;False;352;549;;7;80;78;76;75;73;71;70;Stencil Buffer;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;47;838.3362,979.424;Inherit;False;Property;_Tint;Tint;7;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;63;1323.279,1338.914;Inherit;False;Property;_EnableOutline;Enable Outline;10;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;823.821,-346.2028;Inherit;False;Property;_ZTestMode;ZTest Mode;23;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;439.8212,-106.2027;Inherit;False;Property;_FailFront;Fail Front;21;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;70;439.8212,-362.2028;Inherit;False;Property;_ReadMask;Read Mask;17;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;439.8212,-42.20271;Inherit;False;Property;_ZFailFront;ZFail Front;22;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;81.89404,-207.1283;Inherit;False;EmissionLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;72;823.821,-410.2028;Inherit;False;Property;_ZWriteMode;ZWrite Mode;24;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;439.8212,-170.2027;Inherit;False;Property;_PassFront;Pass Front;20;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;75;440.8212,-298.2028;Inherit;False;Property;_WriteMask;Write Mask;18;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;823.821,-218.2028;Inherit;False;Property;_Units;Units;26;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OutlineNode;65;1671.104,1427.901;Inherit;False;2;True;Masked;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;10;-1248.929,-215.8281;Inherit;False;IsTherePointLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;53;1252.797,696.0854;Inherit;False;Apply Light Modifications;-1;;1420;127e5aac38cd51149b16b32c73e59440;0;5;1;COLOR;1,1,1,0;False;2;COLOR;1,1,1,0;False;3;FLOAT;1;False;4;COLOR;1,1,1,0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;80;439.8212,-426.2028;Inherit;False;Property;_Reference;Reference;16;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;823.821,-282.2028;Inherit;False;Property;_Factor;Factor;25;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;71;439.8212,-234.2028;Inherit;False;Property;_Comparison;Comparison;19;1;[Enum];Create;True;0;9;Default;0;Greater;1;Greater or Equal;2;Less;3;Less or Equal;4;Equal;5;Not Equal;6;Always;7;Never;8;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;1082.111,436.6716;Inherit;False;Property;_Opacity;Opacity;27;0;Create;True;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2023.679,469.5851;Float;False;True;-1;2;ASWUtilsMatcapGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Utils/Matcap/Opaque v1.1.0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;True;72;0;True;77;True;0;True;74;0;True;79;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;True;0;True;80;255;True;70;255;True;75;0;True;71;0;True;76;0;True;78;0;True;73;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;17;0;16;0
WireConnection;18;0;17;0
WireConnection;19;1;18;0
WireConnection;20;1;19;0
WireConnection;12;1;20;0
WireConnection;27;0;12;0
WireConnection;28;0;27;0
WireConnection;6;0;2;0
WireConnection;9;0;8;0
WireConnection;21;1;28;0
WireConnection;22;0;21;0
WireConnection;22;1;28;2
WireConnection;39;10;37;0
WireConnection;39;5;42;0
WireConnection;39;14;36;0
WireConnection;39;6;34;0
WireConnection;39;7;38;0
WireConnection;39;19;35;0
WireConnection;14;0;22;0
WireConnection;14;1;11;0
WireConnection;66;0;11;0
WireConnection;25;0;28;2
WireConnection;15;0;28;0
WireConnection;15;1;14;0
WireConnection;40;0;39;0
WireConnection;23;0;15;0
WireConnection;23;1;25;0
WireConnection;67;33;59;0
WireConnection;67;47;62;0
WireConnection;67;127;58;0
WireConnection;67;35;57;0
WireConnection;67;37;56;0
WireConnection;67;36;61;0
WireConnection;67;31;60;0
WireConnection;41;0;39;16
WireConnection;65;0;67;0
WireConnection;65;2;63;0
WireConnection;65;1;67;109
WireConnection;10;0;2;15
WireConnection;53;1;23;0
WireConnection;53;2;44;0
WireConnection;53;3;46;0
WireConnection;53;4;47;0
WireConnection;53;5;51;0
WireConnection;0;13;53;0
WireConnection;0;11;65;0
ASEEND*/
//CHKSM=8FE3D776605983EBC913FC8108BFEBCCD580DB12
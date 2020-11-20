// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Outline v4.1.2"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_CameraDistanceMult("Camera Distance Mult", Float) = 1
		[Enum(Automatic,0,Forced Fake,1)]_LightColorSetting("Light Color Setting", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[Toggle]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[Toggle]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		[Toggle]_EnableLightColorMult("Enable Light Color Mult", Float) = 1
		_FakeLightIntensity("Fake Light Intensity", Float) = 1
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_GlobalIntensityMinimum("Global Intensity Minimum", Range( 0 , 1)) = 0.1
		_DepthOffset("Depth Offset", Float) = 1
		[Enum(Linear,0,Square,1)]_DepthCalculation("Depth Calculation", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Front
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
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

		uniform float _DepthOffset;
		uniform float _DepthCalculation;
		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _CameraDistanceMult;
		uniform float _EnableBaseColorMult;
		uniform sampler2D _Base;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;
		uniform float _EnableLightColorMult;
		uniform float _LightColorSetting;
		uniform float _GlobalIntensityMinimum;
		uniform float _FakeLightIntensity;
		uniform float4 _FakeLightColor;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float eyeDepth = -UnityObjectToViewPos( v.vertex.xyz ).z;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 objectSpaceViewDir66_g16 = ObjSpaceViewDir( float4( ase_vertex3Pos , 0.0 ) );
			float3 normalizeResult68_g16 = normalize( objectSpaceViewDir66_g16 );
			float temp_output_100_0_g16 = ( 1.0 - v.color.b );
			float saferPower104_g16 = max( temp_output_100_0_g16 , 0.0001 );
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_60_0_g16 = ( _OutlineThickness * v.color.a );
			v.vertex.xyz += ( ( _DepthOffset * normalizeResult68_g16 * ( -0.001 * (( _DepthCalculation == 0.0 ) ? temp_output_100_0_g16 :  pow( saferPower104_g16 , 2.0 ) ) ) ) + ( ase_vertexNormal * ( 1E-05 * (( _EnableCameraDistanceMult == 0.0 ) ? temp_output_60_0_g16 :  ( temp_output_60_0_g16 + ( v.color.g * eyeDepth * _CameraDistanceMult ) ) ) ) ) );
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_Base16 = i.uv_texcoord;
			float4 temp_output_13_0_g16 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
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
			float clampResult241 = clamp( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) , 0.0 , 1.0 );
			float4 temp_cast_1 = (_GlobalIntensityMinimum).xxxx;
			float4 clampResult243 = clamp( ase_lightColor , temp_cast_1 , float4( 1,1,1,1 ) );
			c.rgb = ( ( (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_13_0_g16 * temp_output_13_0_g16 ) :  _OutlineColor ) * _OutlineColorIntensity ) * (( _EnableLightColorMult > 0.0 ) ? (( (( _LightColorSetting > 0.0 ) ? 0.0 :  clampResult241 ) > 0.0 ) ? clampResult243 :  ( _FakeLightIntensity * _FakeLightColor ) ) :  float4( 1,1,1,0 ) ) ).rgb;
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
	}
	Fallback "Diffuse"
	CustomEditor "ASWOutlineGUI"
}
/*ASEBEGIN
Version=17800
2722;149;2296;1092;3679.807;589.4325;1.982036;True;True
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;235;-3789.231,937.539;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;237;-3738.542,1122.685;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.AbsOpNode;236;-3547.74,939.6401;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCCompareGreater;246;-3420.861,944.319;Inherit;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;238;-3416.961,1148.136;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;239;-3161.101,1009.98;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;155;-2672.414,1299.293;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;9;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;153;-2785.801,1190.6;Inherit;False;Property;_GlobalIntensityMinimum;Global Intensity Minimum;11;0;Create;True;0;0;False;0;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;154;-2645.11,1423.031;Float;False;Property;_FakeLightColor;Fake Light Color;10;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightColorNode;240;-2670.686,1057.696;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;152;-2981.22,821.6367;Inherit;False;Property;_LightColorSetting;Light Color Setting;2;1;[Enum];Create;True;2;Automatic;0;Forced Fake;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;241;-2930.177,968.8843;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;243;-2417.255,1138.454;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;242;-2223.24,1262.121;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;244;-2555.888,890.7581;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;245;-2051.198,1107.001;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;20;-1392,224;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;29;-1440,480;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;5;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-1440,752;Inherit;False;Property;_EnableLightColorMult;Enable Light Color Mult;8;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;-1360,32;Inherit;False;Property;_DepthOffset;Depth Offset;12;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-1440,400;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;6;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;269;-1392,128;Inherit;False;Property;_DepthCalculation;Depth Calculation;13;1;[Enum];Create;True;2;Linear;0;Square;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1472,-128;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;7;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1392,-208;Inherit;False;Property;_OutlineThickness;Outline Thickness;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;160;-1424,-48;Inherit;False;Property;_CameraDistanceMult;Camera Distance Mult;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;248;-1054.201,866.9087;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;16;-1488,560;Inherit;True;Property;_Base;Base;3;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;3fb2a23df9f88244a9ab2d8484aae955;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;286;-744.9083,28.20754;Inherit;False;ASWOutline;-1;;16;ea9f2d47913480c4f9e91454af7efa45;0;11;33;FLOAT;0;False;32;FLOAT;0;False;47;FLOAT;0;False;76;FLOAT;0;False;107;FLOAT;0;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;40;FLOAT;0;False;98;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT3;109
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;122.2955,-190.0922;Float;False;True;-1;2;ASWOutlineGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Outline v4.1.2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Front;0;False;-1;0;False;-1;False;0;False;-1;1;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;236;0;235;0
WireConnection;246;0;236;0
WireConnection;238;0;237;2
WireConnection;239;0;246;0
WireConnection;239;1;238;0
WireConnection;241;0;239;0
WireConnection;243;0;240;0
WireConnection;243;1;153;0
WireConnection;242;0;155;0
WireConnection;242;1;154;0
WireConnection;244;0;152;0
WireConnection;244;3;241;0
WireConnection;245;0;244;0
WireConnection;245;2;243;0
WireConnection;245;3;242;0
WireConnection;248;0;245;0
WireConnection;286;33;34;0
WireConnection;286;32;41;0
WireConnection;286;47;160;0
WireConnection;286;76;217;0
WireConnection;286;107;269;0
WireConnection;286;35;20;0
WireConnection;286;37;107;0
WireConnection;286;36;29;0
WireConnection;286;31;16;0
WireConnection;286;40;125;0
WireConnection;286;98;248;0
WireConnection;0;13;286;0
WireConnection;0;11;286;109
ASEEND*/
//CHKSM=79788E2502A81F1C95E9D9F4DD0A6DCB474A1010
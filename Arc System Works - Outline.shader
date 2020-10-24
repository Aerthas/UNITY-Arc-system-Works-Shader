// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Outline"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_CameraDistanceMult("Camera Distance Mult", Float) = 1
		[Enum(Automatic,0,Forced Fake,1)]_LightColorSetting("Light Color Setting", Float) = 0
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[Toggle]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[Toggle]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		[Toggle]_EnableLightColorMult("Enable Light Color Mult", Float) = 1
		_FakeLightIntensity("Fake Light Intensity", Float) = 1
		_FakeLightColor("Fake Light Color", Color) = (1,1,1,0)
		_GlobalIntensityMinimum("Global Intensity Minimum", Range( 0 , 1)) = 0.1
		_DepthOffset("Depth Offset", Float) = 1
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
		
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		
		
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};
		uniform float _DepthOffset;
		uniform float _WrongVertexColors;
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
		uniform float _Cutoff = 0.5;
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float eyeDepth = -UnityObjectToViewPos( v.vertex.xyz ).z;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 objectSpaceViewDir66_g1 = ObjSpaceViewDir( float4( ase_vertex3Pos , 0.0 ) );
			float3 normalizeResult68_g1 = normalize( objectSpaceViewDir66_g1 );
			float4 appendResult24 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 break59_g1 = (( _WrongVertexColors > 0.0 ) ? appendResult24 :  v.color );
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_60_0_g1 = ( _OutlineThickness * break59_g1.a );
			float3 outlineVar = ( ( _DepthOffset * normalizeResult68_g1 * ( -0.001 * break59_g1.b ) ) + ( ase_vertexNormal * ( 1E-05 * (( _EnableCameraDistanceMult == 0.0 ) ? temp_output_60_0_g1 :  ( temp_output_60_0_g1 + ( break59_g1.g * eyeDepth * _CameraDistanceMult ) ) ) ) ) );
			v.vertex.xyz += outlineVar;
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base16 = i.uv_texcoord;
			float4 temp_output_13_0_g1 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float clampResult241 = clamp( ( (( abs( ase_worldlightDir ).x > float3( 0,0,0 ) ) ? 1.0 :  0.0 ) + (( ase_lightColor.a > 0.0 ) ? 1.0 :  0.0 ) ) , 0.0 , 1.0 );
			float4 temp_cast_1 = (_GlobalIntensityMinimum).xxxx;
			float4 clampResult243 = clamp( ase_lightColor , temp_cast_1 , float4( 1,1,1,1 ) );
			o.Emission = ( ( (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_13_0_g1 * temp_output_13_0_g1 ) :  _OutlineColor ) * _OutlineColorIntensity ) * (( _EnableLightColorMult > 0.0 ) ? (( (( _LightColorSetting > 0.0 ) ? 0.0 :  clampResult241 ) > 0.0 ) ? clampResult243 :  ( _FakeLightIntensity * _FakeLightColor ) ) :  float4( 1,1,1,0 ) ) ).rgb;
			clip( (( 1.0 > 0.0 ) ? 1.0 :  0.0 ) - _Cutoff );
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Front
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
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
			c.rgb = 0;
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
-2452;173;2259;952;2563.707;53.07373;1;True;True
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;235;-3789.231,937.539;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;237;-3738.542,1122.685;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.AbsOpNode;236;-3547.74,939.6401;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCCompareGreater;246;-3420.861,944.319;Inherit;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;238;-3416.961,1148.136;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;239;-3161.101,1009.98;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;155;-2672.414,1299.293;Inherit;False;Property;_FakeLightIntensity;Fake Light Intensity;10;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;154;-2645.11,1423.031;Float;False;Property;_FakeLightColor;Fake Light Color;11;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;153;-2785.801,1190.6;Inherit;False;Property;_GlobalIntensityMinimum;Global Intensity Minimum;12;0;Create;True;0;0;False;0;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;241;-2930.177,968.8843;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;240;-2670.686,1057.696;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;152;-2981.22,821.6367;Inherit;False;Property;_LightColorSetting;Light Color Setting;2;1;[Enum];Create;True;2;Automatic;0;Forced Fake;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;244;-2555.888,890.7581;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;243;-2417.255,1138.454;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;242;-2223.24,1262.121;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;23;-1778.719,-412.3403;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-1729.947,-505.507;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;7;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;245;-2051.198,1107.001;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-1559.565,-370.3562;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;248;-1054.201,866.9087;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;16;-1488,448;Inherit;True;Property;_Base;Base;3;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;63ca6c08f2180a944b3599d6f3229619;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;231;-1328,-288;Inherit;False;Constant;_Enable;Enable;14;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;26;-1395.651,-435.1072;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-1440,288;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;6;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1392,-208;Inherit;False;Property;_OutlineThickness;Outline Thickness;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1472,-128;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;8;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;160;-1424,-48;Inherit;False;Property;_CameraDistanceMult;Camera Distance Mult;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;-1360,32;Inherit;False;Property;_DepthOffset;Depth Offset;13;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-1392,112;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;125;-1440,640;Inherit;False;Property;_EnableLightColorMult;Enable Light Color Mult;9;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1440,368;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;5;1;[Toggle];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;249;-832.9083,9.207541;Inherit;False;ASWOutline;-1;;1;ea9f2d47913480c4f9e91454af7efa45;0;12;75;COLOR;0,0,0,0;False;30;FLOAT;0;False;33;FLOAT;0;False;32;FLOAT;0;False;47;FLOAT;0;False;76;FLOAT;0;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;40;FLOAT;0;False;98;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;122.2955,-190.0922;Float;False;True;-1;2;ASWOutlineGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Outline;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Front;0;False;-1;0;False;-1;False;0;False;-1;1;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;236;0;235;0
WireConnection;246;0;236;0
WireConnection;238;0;237;2
WireConnection;239;0;246;0
WireConnection;239;1;238;0
WireConnection;241;0;239;0
WireConnection;244;0;152;0
WireConnection;244;3;241;0
WireConnection;243;0;240;0
WireConnection;243;1;153;0
WireConnection;242;0;155;0
WireConnection;242;1;154;0
WireConnection;245;0;244;0
WireConnection;245;2;243;0
WireConnection;245;3;242;0
WireConnection;24;0;23;3
WireConnection;24;1;23;2
WireConnection;24;2;23;1
WireConnection;24;3;23;4
WireConnection;248;0;245;0
WireConnection;26;0;25;0
WireConnection;26;2;24;0
WireConnection;26;3;23;0
WireConnection;249;75;26;0
WireConnection;249;30;231;0
WireConnection;249;33;34;0
WireConnection;249;32;41;0
WireConnection;249;47;160;0
WireConnection;249;76;217;0
WireConnection;249;35;20;0
WireConnection;249;37;107;0
WireConnection;249;36;29;0
WireConnection;249;31;16;0
WireConnection;249;40;125;0
WireConnection;249;98;248;0
WireConnection;0;11;249;0
ASEEND*/
//CHKSM=F5914EA8C5EC5B5BBBF8A503335529752F79751F
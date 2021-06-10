// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Utils/Outline/Opaque v5.1.0"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[Toggle]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_DepthOffset("Depth Offset", Float) = 0.45
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull Front
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
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

		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _DepthOffset;
		uniform float _EnableBaseColorMult;
		uniform sampler2D _Base;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;


		inline float4 ASESafeNormalize(float4 inVec)
		{
			float dp3 = max( 0.001f , dot( inVec , inVec ) );
			return inVec* rsqrt( dp3);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float eyeDepth = -UnityObjectToViewPos( v.vertex.xyz ).z;
			float3 ase_vertexNormal = v.normal.xyz;
			float temp_output_33_0_g18 = _OutlineThickness;
			float3 temp_output_135_0_g18 = ( ( ase_vertexNormal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.color.g * temp_output_33_0_g18 ) + temp_output_33_0_g18 ) * v.color.a ) );
			float3 objectSpaceViewDir136_g18 = ObjSpaceViewDir( float4( temp_output_135_0_g18 , 0.0 ) );
			float4 ase_vertex4Pos = v.vertex;
			float4 normalizeResult142_g18 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g18 , 0.0 ) - ase_vertex4Pos ) );
			float clampResult141_g18 = clamp( ( v.color.b + _DepthOffset ) , 0.0 , 1.0 );
			float4 lerpResult145_g18 = lerp( float4( temp_output_135_0_g18 , 0.0 ) , -normalizeResult142_g18 , ( 1.0 - clampResult141_g18 ));
			v.vertex.xyz += lerpResult145_g18.xyz;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_Base16 = i.uv_texcoord;
			float4 temp_output_13_0_g18 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
			c.rgb = ( ( _EnableBaseColorMult > 0.0 ? ( temp_output_13_0_g18 * temp_output_13_0_g18 ) : _OutlineColor ) * _OutlineColorIntensity ).rgb;
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
	CustomEditor "ASWUtilsOutlineGUI"
}
/*ASEBEGIN
Version=18900
-1668;104;1438;1017;1247.179;524.8943;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;34;-1392,-192;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1460,-66;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;5;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-1398,127;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;29;-1446,383;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[Toggle];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-1446,303;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1494,463;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;5b0e76698c1d91e4c823b39944d30c55;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;217;-1360,32;Inherit;False;Property;_DepthOffset;Depth Offset;6;0;Create;True;0;0;0;False;0;False;0.45;0.45;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;397;-744.9083,27.20754;Inherit;False;ASWOutline;-1;;18;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;398;173.8397,-235.3656;Float;False;True;-1;2;ASWUtilsOutlineGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Utils/Outline/Opaque v5.1.0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Front;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;1;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;397;33;34;0
WireConnection;397;47;41;0
WireConnection;397;127;217;0
WireConnection;397;35;20;0
WireConnection;397;37;107;0
WireConnection;397;36;29;0
WireConnection;397;31;16;0
WireConnection;398;13;397;0
WireConnection;398;11;397;109
ASEEND*/
//CHKSM=9B7CE48D3AC5111FC85ADEC5C52BFE3C6CB19306
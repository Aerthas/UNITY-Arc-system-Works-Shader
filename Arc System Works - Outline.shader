// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Outline"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[Enum(Disable,0,Enable,1)]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[Enum(Disable,0,Enable,1)]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
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
		
		#include "UnityShaderVariables.cginc"
		
		
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
		};
		uniform float _EnableCameraDistanceMult;
		uniform float _OutlineThickness;
		uniform float _WrongVertexColors;
		uniform float _EnableBaseColorMult;
		uniform sampler2D _Base;
		uniform float4 _OutlineColor;
		uniform float _OutlineColorIntensity;
		uniform float _Cutoff = 0.5;
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float temp_output_32_0_g1 = _EnableCameraDistanceMult;
			float temp_output_33_0_g1 = _OutlineThickness;
			float4 appendResult24 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 break8_g1 = (( _WrongVertexColors > 0.0 ) ? appendResult24 :  v.color );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float outlineVar = (( temp_output_32_0_g1 > 0.0 ) ? ( 0.0001 * temp_output_33_0_g1 * break8_g1.a * min( ( break8_g1.g * distance( ase_worldPos , _WorldSpaceCameraPos ) ) , 1.0 ) * (( break8_g1.b > 0.1 ) ? 1.0 :  0.0 ) ) :  ( (( temp_output_32_0_g1 > 0.0 ) ? 0.0 :  5.0 ) * 1E-05 * temp_output_33_0_g1 * break8_g1.b * break8_g1.a ) );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base16 = i.uv_texcoord;
			float4 temp_output_13_0_g1 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
			o.Emission = ( (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_13_0_g1 * temp_output_13_0_g1 ) :  _OutlineColor ) * _OutlineColorIntensity ).rgb;
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
-1552;109;1532;824;1566.932;-240.0941;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;23;-1557.283,402.4721;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-1508.511,309.3056;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;5;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-1338.128,444.4563;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1030.519,127.5547;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;6;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-982.2171,235.4819;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;26;-1149.514,356.3055;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;20;-1015.165,500.3227;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;29;-999.3376,715.5227;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1064.777,-113.3311;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;94f62562165c70445bd0baf0d45e8ffb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;107;-974.5676,852.1502;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;106;-525.2107,121.0489;Inherit;False;ASWOutline;-1;;1;ea9f2d47913480c4f9e91454af7efa45;0;8;30;FLOAT;1;False;31;COLOR;0,0,0,0;False;32;FLOAT;0;False;33;FLOAT;0;False;34;COLOR;0,0,0,0;False;35;COLOR;0,0,0,0;False;36;FLOAT;0;False;37;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;122.2955,-190.0922;Float;False;True;-1;2;ASWOutlineGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Outline;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Front;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;24;0;23;3
WireConnection;24;1;23;2
WireConnection;24;2;23;1
WireConnection;24;3;23;4
WireConnection;26;0;25;0
WireConnection;26;2;24;0
WireConnection;26;3;23;0
WireConnection;106;31;16;0
WireConnection;106;32;41;0
WireConnection;106;33;34;0
WireConnection;106;34;26;0
WireConnection;106;35;20;0
WireConnection;106;36;29;0
WireConnection;106;37;107;0
WireConnection;0;11;106;0
ASEEND*/
//CHKSM=662054903536470BB99A594BC46EBB77D370459C
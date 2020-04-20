// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Outline"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 2
		[Enum(Disable,0,Enable,1)]_EnableBaseColorMult("Enable Base Color Mult", Float) = 0
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[Enum(Disable,0,Enable,1)]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 0
		_DepthMultClamp("Depth Mult Clamp", Float) = 2
		_CameraDepthMult("Camera Depth Mult", Float) = 2
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
		
		
		
		struct Input
		{
			float2 uv_texcoord;
		};
		uniform float _EnableCameraDistanceMult;
		uniform float _CameraDepthMult;
		uniform float _OutlineThickness;
		uniform float _WrongVertexColors;
		uniform float _DepthMultClamp;
		uniform float _EnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform sampler2D _Base;
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float eyeDepth = -UnityObjectToViewPos( v.vertex.xyz ).z;
			float4 appendResult24 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 break54 = (( _WrongVertexColors > 0.0 ) ? appendResult24 :  v.color );
			float temp_output_53_0 = ( (( _EnableCameraDistanceMult == 1.0 ) ? 5.0 :  1.0 ) * 1E-05 * _OutlineThickness * break54.z * break54.w );
			float clampResult43 = clamp( ( eyeDepth * _CameraDepthMult * temp_output_53_0 ) , 0.0 , ( _DepthMultClamp * temp_output_53_0 ) );
			float outlineVar = (( _EnableCameraDistanceMult > 0.0 ) ? clampResult43 :  temp_output_53_0 );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base16 = i.uv_texcoord;
			o.Emission = (( _EnableBaseColorMult > 0.0 ) ? ( _OutlineColor * tex2D( _Base, uv_Base16 ) ) :  _OutlineColor ).rgb;
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
2291;72;1598;839;2733.719;54.1337;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;23;-2639.78,703.9919;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-2591.007,610.8254;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;4;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-2420.624,745.976;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-2275.794,252.4747;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;5;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;26;-2232.01,657.8253;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCCompareEqual;80;-1887.327,393.6734;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;5;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1869.514,567.4017;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;54;-1915.579,658.6542;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SurfaceDepthNode;68;-1360.82,222.6401;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1382.397,436.3202;Inherit;False;Property;_DepthMultClamp;Depth Mult Clamp;6;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-1333.473,313.7483;Inherit;False;Property;_CameraDepthMult;Camera Depth Mult;7;0;Create;True;0;0;False;0;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-1456.147,572.3866;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-998.572,304.352;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.001;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-1175.443,-221.2659;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-1035.576,441.586;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1218.658,-43.81373;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;84;-1791.602,197.59;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-929.1378,-277.5771;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;83;-644.2812,239.709;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;43;-765.1199,370.1731;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-889.9263,-71.5607;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCCompareGreater;45;-434.0702,455.745;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;28;-626.9064,-154.4299;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;69;-179.2451,173.8988;Inherit;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;122.2955,-190.0922;Float;False;True;-1;2;ASWOutlineGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Outline;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Front;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;24;0;23;3
WireConnection;24;1;23;2
WireConnection;24;2;23;1
WireConnection;24;3;23;4
WireConnection;26;0;25;0
WireConnection;26;2;24;0
WireConnection;26;3;23;0
WireConnection;80;0;41;0
WireConnection;54;0;26;0
WireConnection;53;0;80;0
WireConnection;53;2;34;0
WireConnection;53;3;54;2
WireConnection;53;4;54;3
WireConnection;46;0;68;0
WireConnection;46;1;48;0
WireConnection;46;2;53;0
WireConnection;51;0;36;0
WireConnection;51;1;53;0
WireConnection;84;0;41;0
WireConnection;83;0;84;0
WireConnection;43;0;46;0
WireConnection;43;2;51;0
WireConnection;21;0;20;0
WireConnection;21;1;16;0
WireConnection;45;0;83;0
WireConnection;45;2;43;0
WireConnection;45;3;53;0
WireConnection;28;0;29;0
WireConnection;28;2;21;0
WireConnection;28;3;20;0
WireConnection;69;0;28;0
WireConnection;69;1;45;0
WireConnection;0;11;69;0
ASEEND*/
//CHKSM=35B03B2FAF5818E8BA68E4780052A561DF49BCFA
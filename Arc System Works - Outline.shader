// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Outline"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[Enum(Disable,0,Enable,1)]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[Enum(Disable,0,Enable,1)]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
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
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 appendResult24 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 break54 = (( _WrongVertexColors > 0.0 ) ? appendResult24 :  v.color );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float outlineVar = (( _EnableCameraDistanceMult > 0.0 ) ? ( 0.0001 * _OutlineThickness * break54.w * min( ( break54.y * distance( ase_worldPos , _WorldSpaceCameraPos ) ) , 1.0 ) * (( break54.z > 0.1 ) ? 1.0 :  0.0 ) ) :  ( (( _EnableCameraDistanceMult > 0.0 ) ? 0.0 :  5.0 ) * 1E-05 * _OutlineThickness * break54.z * break54.w ) );
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_Base16 = i.uv_texcoord;
			float4 temp_output_94_0 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
			o.Emission = (( _EnableBaseColorMult > 0.0 ) ? ( temp_output_94_0 * temp_output_94_0 ) :  _OutlineColor ).rgb;
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
2306;104;1532;824;3195.701;929.8683;3.435434;True;True
Node;AmplifyShaderEditor.VertexColorNode;23;-2639.78,703.9919;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-2591.007,610.8254;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;4;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-2420.624,745.976;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;98;-1816.379,876.2268;Inherit;False;1110.714;400.5961;Camera Scale;7;105;104;103;102;101;100;99;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCCompareGreater;26;-2232.01,657.8253;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;100;-1775.727,1104.834;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;99;-1728.379,934.823;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;54;-1915.579,658.6542;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DistanceOpNode;101;-1442.016,994.125;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1687.79,-152.9015;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;94f62562165c70445bd0baf0d45e8ffb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;91;-1565.325,-262.0159;Inherit;False;Constant;_Float0;Float 0;57;0;Create;True;0;0;False;0;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;93;-1231.556,-151.224;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-2026.615,317.0744;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;5;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;102;-1281.82,957.4929;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;103;-1244.739,1074.043;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0.1;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;94;-1065.904,-142.7357;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1869.514,567.4017;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;104;-1127.384,964.823;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;97;-1682.294,423.313;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;95;-899.9048,-150.7358;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-929.1378,-277.5771;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;105;-874.665,926.227;Inherit;False;5;5;0;FLOAT;0.0001;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-1447.734,622.0529;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;1E-05;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-1131.966,58.7224;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCCompareGreater;45;-431.4702,525.9448;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
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
WireConnection;54;0;26;0
WireConnection;101;0;99;0
WireConnection;101;1;100;0
WireConnection;93;0;91;0
WireConnection;93;1;16;0
WireConnection;102;0;54;1
WireConnection;102;1;101;0
WireConnection;103;0;54;2
WireConnection;94;1;93;0
WireConnection;104;0;102;0
WireConnection;97;0;41;0
WireConnection;95;0;94;0
WireConnection;95;1;94;0
WireConnection;105;1;34;0
WireConnection;105;2;54;3
WireConnection;105;3;104;0
WireConnection;105;4;103;0
WireConnection;53;0;97;0
WireConnection;53;2;34;0
WireConnection;53;3;54;2
WireConnection;53;4;54;3
WireConnection;45;0;41;0
WireConnection;45;2;105;0
WireConnection;45;3;53;0
WireConnection;28;0;29;0
WireConnection;28;2;95;0
WireConnection;28;3;20;0
WireConnection;69;0;28;0
WireConnection;69;1;45;0
WireConnection;0;11;69;0
ASEEND*/
//CHKSM=7471A069B0365C1C48B78B6C926FE1360E70BEEC
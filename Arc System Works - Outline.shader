// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Outline"
{
	Properties
	{
		_OutlineThickness("Outline Thickness", Float) = 2
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_Base("Base", 2D) = "white" {}
		[Enum(Disable,0,Enable,1)]_EnableBaseColorMult("Enable Base Color Mult", Float) = 0
		[Enum(Yes they are,0,No they arent,1)]_WrongVertexColors("WrongVertexColors", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Front
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
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

		uniform float _OutlineThickness;
		uniform float _WrongVertexColors;
		uniform float _EnableBaseColorMult;
		uniform float4 _OutlineColor;
		uniform sampler2D _Base;
		uniform float4 _Base_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertexNormal = v.normal.xyz;
			float4 appendResult24 = (float4(v.color.b , v.color.g , v.color.r , v.color.a));
			float4 break15 = (( _WrongVertexColors > 0.0 ) ? appendResult24 :  v.color );
			v.vertex.xyz += ( 1E-05 * ase_vertexNormal * _OutlineThickness * break15.z * break15.w );
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			c.rgb = (( _EnableBaseColorMult > 0.0 ) ? ( _OutlineColor * tex2D( _Base, uv_Base ) ) :  _OutlineColor ).rgb;
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
-1549;350;1385;670;1263.322;-27.88008;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;23;-1431.937,443.0015;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;24;-1212.779,484.9857;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-1383.164,349.8346;Inherit;False;Property;_WrongVertexColors;WrongVertexColors;4;1;[Enum];Create;True;2;Yes they are;0;No they arent;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;26;-1024.164,396.8346;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;20;-1175.443,-221.2659;Inherit;False;Property;_OutlineColor;Outline Color;1;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;16;-1218.658,-43.81373;Inherit;True;Property;_Base;Base;2;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalVertexDataNode;7;-583.0516,179.7834;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;15;-735.1193,399.416;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;4;-391.0516,140.7834;Inherit;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;False;0;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-524.301,329.0881;Inherit;False;Property;_OutlineThickness;Outline Thickness;0;0;Create;True;0;0;False;0;2;2.78;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-889.9263,-71.5607;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-929.1378,-277.5771;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[Enum];Create;True;2;Disable;0;Enable;1;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-172.0516,240.7834;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCCompareGreater;28;-626.9064,-154.4299;Inherit;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;122.2955,-190.0922;Float;False;True;-1;2;ASWOutlineGUI;0;0;CustomLighting;.Aerthas/Arc System Works/Outline;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Front;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;24;0;23;3
WireConnection;24;1;23;2
WireConnection;24;2;23;1
WireConnection;24;3;23;4
WireConnection;26;0;25;0
WireConnection;26;2;24;0
WireConnection;26;3;23;0
WireConnection;15;0;26;0
WireConnection;21;0;20;0
WireConnection;21;1;16;0
WireConnection;3;0;4;0
WireConnection;3;1;7;0
WireConnection;3;2;5;0
WireConnection;3;3;15;2
WireConnection;3;4;15;3
WireConnection;28;0;29;0
WireConnection;28;2;21;0
WireConnection;28;3;20;0
WireConnection;0;13;28;0
WireConnection;0;11;3;0
ASEEND*/
//CHKSM=F75BE04AD3C4A24F28D1FB618AE28D338D628502
// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Vertex and ILM Testing"
{
	Properties
	{
		[Toggle]_NegateVertexColors("Negate Vertex Colors", Float) = 0
		[Toggle]_ShowVertexRed("Show Vertex Red", Float) = 0
		_VertexRed("Vertex Red", Color) = (1,0,0,0)
		[Toggle]_ShowVertexGreen("Show Vertex Green", Float) = 0
		_VertexGreen("Vertex Green", Color) = (0,1,0,0)
		[Toggle]_ShowVertexBlue("Show Vertex Blue", Float) = 0
		_VertexBlue("Vertex Blue", Color) = (0,0,1,0)
		_ILM("ILM", 2D) = "white" {}
		[Toggle]_NegateILMColors("Negate ILM Colors", Float) = 0
		[Toggle]_ShowILMRed("Show ILM Red", Float) = 0
		_ILMRed("ILM Red", Color) = (1,0,0,0)
		[Toggle]_ShowILMGreen("Show ILM Green", Float) = 0
		_ILMGreen("ILM Green", Color) = (0,1,0,0)
		[Toggle]_ShowILMBlue("Show ILM Blue", Float) = 0
		_ILMBlue("ILM Blue", Color) = (0,0,1,0)
		[Toggle]_ShowILMAlpha("Show ILM Alpha", Float) = 0
		_ILMAlpha("ILM Alpha", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 vertexColor : COLOR;
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

		uniform float _NegateVertexColors;
		uniform float _ShowVertexRed;
		uniform float4 _VertexRed;
		uniform float _ShowVertexGreen;
		uniform float4 _VertexGreen;
		uniform float _ShowVertexBlue;
		uniform float4 _VertexBlue;
		uniform float _NegateILMColors;
		uniform float _ShowILMRed;
		uniform sampler2D _ILM;
		uniform float4 _ILM_ST;
		uniform float4 _ILMRed;
		uniform float _ShowILMGreen;
		uniform float4 _ILMGreen;
		uniform float _ShowILMBlue;
		uniform float4 _ILMBlue;
		uniform float _ShowILMAlpha;
		uniform float4 _ILMAlpha;

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
			float4 temp_output_28_0 = ( (( _ShowVertexRed )?( ( i.vertexColor.r * _VertexRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexGreen )?( ( i.vertexColor.g * _VertexGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexBlue )?( ( i.vertexColor.b * _VertexBlue ) ):( float4( 0,0,0,0 ) )) );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode42 = tex2D( _ILM, uv_ILM );
			float4 temp_output_52_0 = ( (( _ShowILMRed )?( ( tex2DNode42.r * _ILMRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMGreen )?( ( tex2DNode42.g * _ILMGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMBlue )?( ( tex2DNode42.b * _ILMBlue ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMAlpha )?( ( tex2DNode42.a * _ILMAlpha ) ):( float4( 0,0,0,0 ) )) );
			o.Emission = ( (( _NegateVertexColors )?( ( 1.0 - temp_output_28_0 ) ):( temp_output_28_0 )) + (( _NegateILMColors )?( ( 1.0 - temp_output_52_0 ) ):( temp_output_52_0 )) ).rgb;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17700
2144;128;1816;788;2508.781;-417.1434;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;1;-1456.052,-312.0725;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;36;-994.2482,363.4127;Inherit;False;Property;_VertexBlue;Vertex Blue;6;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;45;-1083.675,866.7972;Inherit;False;Property;_ILMRed;ILM Red;10;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-1075.816,1331.33;Inherit;False;Property;_ILMBlue;ILM Blue;14;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;30;-1002.107,-101.1198;Inherit;False;Property;_VertexRed;Vertex Red;2;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;42;-1479.882,721.5238;Inherit;True;Property;_ILM;ILM;7;0;Create;True;0;0;False;0;-1;None;a3305d71b40ac3a47a0a610eb6f22383;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;32;-990.3479,106.0129;Inherit;False;Property;_VertexGreen;Vertex Green;4;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;-1071.916,1073.93;Inherit;False;Property;_ILMGreen;ILM Green;12;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;57;-1045.016,1584.738;Inherit;False;Property;_ILMAlpha;ILM Alpha;16;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-753.9761,1461.473;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-791.635,751.5323;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-710.0674,-216.3847;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-783.7762,1216.065;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-702.2086,248.148;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-779.8759,958.665;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-698.3083,-9.251968;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;35;-424.4283,212.1805;Inherit;False;Property;_ShowVertexBlue;Show Vertex Blue;5;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;56;-476.1958,1425.506;Inherit;False;Property;_ShowILMAlpha;Show ILM Alpha;15;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;49;-503.3957,952.5974;Inherit;False;Property;_ShowILMGreen;Show ILM Green;11;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;27;-377.83,-151.7263;Inherit;False;Property;_ShowVertexRed;Show Vertex Red;1;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;51;-459.3976,816.1907;Inherit;False;Property;_ShowILMRed;Show ILM Red;9;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;34;-421.8281,-15.31957;Inherit;False;Property;_ShowVertexGreen;Show Vertex Green;3;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;50;-505.9959,1180.098;Inherit;False;Property;_ShowILMBlue;Show ILM Blue;13;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;-234.8976,851.5907;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;28;-159.83,-152.7263;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;53;-82.19656,920.0974;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;41;-0.6289272,-47.81958;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;54;67.30347,806.9974;Inherit;False;Property;_NegateILMColors;Negate ILM Colors;8;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;38;148.8711,-160.9196;Inherit;False;Property;_NegateVertexColors;Negate Vertex Colors;0;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;58;638.2355,530.6969;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1008.198,264.7511;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Vertex and ILM Testing;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;55;0;42;4
WireConnection;55;1;57;0
WireConnection;48;0;42;1
WireConnection;48;1;45;0
WireConnection;31;0;1;1
WireConnection;31;1;30;0
WireConnection;46;0;42;3
WireConnection;46;1;43;0
WireConnection;37;0;1;3
WireConnection;37;1;36;0
WireConnection;47;0;42;2
WireConnection;47;1;44;0
WireConnection;33;0;1;2
WireConnection;33;1;32;0
WireConnection;35;1;37;0
WireConnection;56;1;55;0
WireConnection;49;1;47;0
WireConnection;27;1;31;0
WireConnection;51;1;48;0
WireConnection;34;1;33;0
WireConnection;50;1;46;0
WireConnection;52;0;51;0
WireConnection;52;1;49;0
WireConnection;52;2;50;0
WireConnection;52;3;56;0
WireConnection;28;0;27;0
WireConnection;28;1;34;0
WireConnection;28;2;35;0
WireConnection;53;0;52;0
WireConnection;41;0;28;0
WireConnection;54;0;52;0
WireConnection;54;1;53;0
WireConnection;38;0;28;0
WireConnection;38;1;41;0
WireConnection;58;0;38;0
WireConnection;58;1;54;0
WireConnection;0;2;58;0
ASEEND*/
//CHKSM=75009FFD4D6AB4B5CEE6528853C00DF6B2E96D36
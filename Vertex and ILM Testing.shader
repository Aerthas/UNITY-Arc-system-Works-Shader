// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Color Testing"
{
	Properties
	{
		[Toggle]_ENABLETHISFORGUILTYGEAR("ENABLE THIS FOR GUILTY GEAR", Float) = 0
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
		_SSS("SSS", 2D) = "white" {}
		[Toggle]_NegateSSSColors("Negate SSS Colors", Float) = 0
		[Toggle]_ShowSSSRed("Show SSS Red", Float) = 0
		_SSSRed("SSS Red", Color) = (1,0,0,0)
		[Toggle]_ShowSSSGreen("Show SSS Green", Float) = 0
		_SSSGreen("SSS Green", Color) = (0,1,0,0)
		[Toggle]_ShowSSSBlue("Show SSS Blue", Float) = 0
		_SSSBlue("SSS Blue", Color) = (0,0,1,0)
		[Toggle]_ShowSSSAlpha("Show SSS Alpha", Float) = 1
		_SSSAlpha("SSS Alpha", Color) = (1,1,1,0)
		_Base("Base", 2D) = "white" {}
		[Toggle]_NegateBaseColors("Negate Base Colors", Float) = 0
		[Toggle]_ShowBaseRed("Show Base Red", Float) = 0
		_BaseRed("Base Red", Color) = (1,0,0,0)
		[Toggle]_ShowBaseBlue("Show Base Blue", Float) = 0
		_BaseBlue("Base Blue", Color) = (0,0,1,0)
		[Toggle]_ShowBaseGreen("Show Base Green", Float) = 0
		_BaseGreen("Base Green", Color) = (0,1,0,0)
		[Toggle]_ShowBaseAlpha("Show Base Alpha", Float) = 1
		_BaseAlpha("Base Alpha", Color) = (1,1,1,0)
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
		uniform float _ENABLETHISFORGUILTYGEAR;
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
		uniform float _NegateSSSColors;
		uniform float _ShowSSSRed;
		uniform sampler2D _SSS;
		uniform float4 _SSS_ST;
		uniform float4 _SSSRed;
		uniform float _ShowSSSGreen;
		uniform float4 _SSSGreen;
		uniform float _ShowSSSBlue;
		uniform float4 _SSSBlue;
		uniform float _ShowSSSAlpha;
		uniform float4 _SSSAlpha;
		uniform float _NegateBaseColors;
		uniform float _ShowBaseRed;
		uniform sampler2D _Base;
		uniform float4 _Base_ST;
		uniform float4 _BaseRed;
		uniform float _ShowBaseGreen;
		uniform float4 _BaseGreen;
		uniform float _ShowBaseBlue;
		uniform float4 _BaseBlue;
		uniform float _ShowBaseAlpha;
		uniform float4 _BaseAlpha;

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
			float4 appendResult61 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 break64 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult61 ):( i.vertexColor ));
			float4 temp_output_28_0 = ( (( _ShowVertexRed )?( ( break64.x * _VertexRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexGreen )?( ( break64.y * _VertexGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexBlue )?( ( break64.z * _VertexBlue ) ):( float4( 0,0,0,0 ) )) );
			float2 uv_ILM = i.uv_texcoord * _ILM_ST.xy + _ILM_ST.zw;
			float4 tex2DNode42 = tex2D( _ILM, uv_ILM );
			float4 temp_output_52_0 = ( (( _ShowILMRed )?( ( tex2DNode42.r * _ILMRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMGreen )?( ( tex2DNode42.g * _ILMGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMBlue )?( ( tex2DNode42.b * _ILMBlue ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMAlpha )?( ( tex2DNode42.a * _ILMAlpha ) ):( float4( 0,0,0,0 ) )) );
			float2 uv_SSS = i.uv_texcoord * _SSS_ST.xy + _SSS_ST.zw;
			float4 tex2DNode67 = tex2D( _SSS, uv_SSS );
			float4 temp_output_78_0 = ( (( _ShowSSSRed )?( ( tex2DNode67.r * _SSSRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowSSSGreen )?( ( tex2DNode67.g * _SSSGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowSSSBlue )?( ( tex2DNode67.b * _SSSBlue ) ):( float4( 0,0,0,0 ) )) + (( _ShowSSSAlpha )?( ( tex2DNode67.a * _SSSAlpha ) ):( float4( 0,0,0,0 ) )) );
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			float4 tex2DNode85 = tex2D( _Base, uv_Base );
			float4 temp_output_94_0 = ( (( _ShowBaseRed )?( ( tex2DNode85.r * _BaseRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowBaseGreen )?( ( tex2DNode85.g * _BaseGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowBaseBlue )?( ( tex2DNode85.b * _BaseBlue ) ):( float4( 0,0,0,0 ) )) + (( _ShowBaseAlpha )?( ( tex2DNode85.a * _BaseAlpha ) ):( float4( 0,0,0,0 ) )) );
			o.Emission = ( (( _NegateVertexColors )?( ( 1.0 - temp_output_28_0 ) ):( temp_output_28_0 )) + (( _NegateILMColors )?( ( 1.0 - temp_output_52_0 ) ):( temp_output_52_0 )) + (( _NegateSSSColors )?( ( 1.0 - temp_output_78_0 ) ):( temp_output_78_0 )) + (( _NegateBaseColors )?( ( 1.0 - temp_output_94_0 ) ):( temp_output_94_0 )) ).rgb;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17700
-1879;112;1552;843;3578.83;-1927.074;2.174462;True;True
Node;AmplifyShaderEditor.VertexColorNode;60;-2071.81,-185.3204;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;61;-1821.872,-130.7885;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;62;-1697.971,-196.7875;Inherit;False;Property;_ENABLETHISFORGUILTYGEAR;ENABLE THIS FOR GUILTY GEAR;0;0;Create;True;0;0;False;0;0;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;83;-1183.295,4024.733;Inherit;False;Property;_BaseAlpha;Base Alpha;37;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;81;-1214.095,3771.325;Inherit;False;Property;_BaseBlue;Base Blue;33;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;82;-1210.195,3513.925;Inherit;False;Property;_BaseGreen;Base Green;35;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;84;-1221.954,3306.792;Inherit;False;Property;_BaseRed;Base Red;31;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;85;-1618.161,3161.519;Inherit;True;Property;_Base;Base;28;0;Create;True;0;0;False;0;-1;None;33c266f0a4ad68d4ba4cd125438746fd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;67;-1505.736,1870.95;Inherit;True;Property;_SSS;SSS;18;0;Create;True;0;0;False;0;-1;None;33c266f0a4ad68d4ba4cd125438746fd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;68;-1109.529,2016.223;Inherit;False;Property;_SSSRed;SSS Red;21;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;65;-1070.87,2734.164;Inherit;False;Property;_SSSAlpha;SSS Alpha;27;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;66;-1097.77,2223.356;Inherit;False;Property;_SSSGreen;SSS Green;23;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;69;-1101.67,2480.756;Inherit;False;Property;_SSSBlue;SSS Blue;25;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;42;-1479.882,721.5238;Inherit;True;Property;_ILM;ILM;8;0;Create;True;0;0;False;0;-1;None;801fb10f5ba77004c843502f33f7c6ef;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;45;-1083.675,866.7972;Inherit;False;Property;_ILMRed;ILM Red;11;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-1075.816,1331.33;Inherit;False;Property;_ILMBlue;ILM Blue;15;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;36;-994.2482,363.4127;Inherit;False;Property;_VertexBlue;Vertex Blue;7;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;64;-1379.441,-163.7522;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode;57;-1045.016,1584.738;Inherit;False;Property;_ILMAlpha;ILM Alpha;17;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;32;-990.3479,106.0129;Inherit;False;Property;_VertexGreen;Vertex Green;5;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;-1071.916,1073.93;Inherit;False;Property;_ILMGreen;ILM Green;13;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;30;-1002.107,-101.1198;Inherit;False;Property;_VertexRed;Vertex Red;3;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;-805.7294,2108.091;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-779.8295,2610.899;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;-918.1542,3398.66;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-809.6296,2365.491;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;87;-892.2543,3901.468;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;-929.9133,3191.527;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;89;-922.0544,3656.06;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-779.8759,958.665;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-783.7762,1216.065;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-817.4885,1900.958;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-702.2086,248.148;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-791.635,751.5323;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-753.9761,1461.473;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-698.3083,-9.251968;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-710.0674,-216.3847;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;49;-503.3957,952.5974;Inherit;False;Property;_ShowILMGreen;Show ILM Green;12;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;56;-476.1958,1425.506;Inherit;False;Property;_ShowILMAlpha;Show ILM Alpha;16;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;51;-459.3976,816.1907;Inherit;False;Property;_ShowILMRed;Show ILM Red;10;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;34;-421.8281,-15.31957;Inherit;False;Property;_ShowVertexGreen;Show Vertex Green;4;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;92;-641.6743,3392.592;Inherit;False;Property;_ShowBaseGreen;Show Base Green;34;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;90;-614.4742,3865.5;Inherit;False;Property;_ShowBaseAlpha;Show Base Alpha;36;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;75;-531.8497,2329.524;Inherit;False;Property;_ShowSSSBlue;Show SSS Blue;24;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;91;-597.676,3256.186;Inherit;False;Property;_ShowBaseRed;Show Base Red;30;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;77;-485.2513,1965.617;Inherit;False;Property;_ShowSSSRed;Show SSS Red;20;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;76;-502.0495,2574.932;Inherit;False;Property;_ShowSSSAlpha;Show SSS Alpha;26;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;27;-377.83,-151.7263;Inherit;False;Property;_ShowVertexRed;Show Vertex Red;2;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;35;-424.4283,212.1805;Inherit;False;Property;_ShowVertexBlue;Show Vertex Blue;6;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;50;-505.9959,1180.098;Inherit;False;Property;_ShowILMBlue;Show ILM Blue;14;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;93;-643.2744,3620.093;Inherit;False;Property;_ShowBaseBlue;Show Base Blue;32;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;74;-529.2495,2102.023;Inherit;False;Property;_ShowSSSGreen;Show SSS Green;22;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;-234.8976,851.5907;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;28;-159.83,-152.7263;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;94;-373.1761,3291.586;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;78;-260.7514,2001.017;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;79;-108.0504,2069.523;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;95;-220.4753,3360.092;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;53;-82.19656,920.0974;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;41;-0.6289272,-47.81958;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;80;41.44969,1956.423;Inherit;False;Property;_NegateSSSColors;Negate SSS Colors;19;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;38;148.8711,-160.9196;Inherit;False;Property;_NegateVertexColors;Negate Vertex Colors;1;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;54;67.30347,806.9974;Inherit;False;Property;_NegateILMColors;Negate ILM Colors;9;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;96;-70.97523,3246.991;Inherit;False;Property;_NegateBaseColors;Negate Base Colors;29;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;58;658.153,1466.825;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1028.116,1200.879;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Color Testing;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;61;0;60;3
WireConnection;61;1;60;2
WireConnection;61;2;60;1
WireConnection;61;3;60;4
WireConnection;62;0;60;0
WireConnection;62;1;61;0
WireConnection;64;0;62;0
WireConnection;70;0;67;2
WireConnection;70;1;66;0
WireConnection;73;0;67;4
WireConnection;73;1;65;0
WireConnection;86;0;85;2
WireConnection;86;1;82;0
WireConnection;71;0;67;3
WireConnection;71;1;69;0
WireConnection;87;0;85;4
WireConnection;87;1;83;0
WireConnection;88;0;85;1
WireConnection;88;1;84;0
WireConnection;89;0;85;3
WireConnection;89;1;81;0
WireConnection;47;0;42;2
WireConnection;47;1;44;0
WireConnection;46;0;42;3
WireConnection;46;1;43;0
WireConnection;72;0;67;1
WireConnection;72;1;68;0
WireConnection;37;0;64;2
WireConnection;37;1;36;0
WireConnection;48;0;42;1
WireConnection;48;1;45;0
WireConnection;55;0;42;4
WireConnection;55;1;57;0
WireConnection;33;0;64;1
WireConnection;33;1;32;0
WireConnection;31;0;64;0
WireConnection;31;1;30;0
WireConnection;49;1;47;0
WireConnection;56;1;55;0
WireConnection;51;1;48;0
WireConnection;34;1;33;0
WireConnection;92;1;86;0
WireConnection;90;1;87;0
WireConnection;75;1;71;0
WireConnection;91;1;88;0
WireConnection;77;1;72;0
WireConnection;76;1;73;0
WireConnection;27;1;31;0
WireConnection;35;1;37;0
WireConnection;50;1;46;0
WireConnection;93;1;89;0
WireConnection;74;1;70;0
WireConnection;52;0;51;0
WireConnection;52;1;49;0
WireConnection;52;2;50;0
WireConnection;52;3;56;0
WireConnection;28;0;27;0
WireConnection;28;1;34;0
WireConnection;28;2;35;0
WireConnection;94;0;91;0
WireConnection;94;1;92;0
WireConnection;94;2;93;0
WireConnection;94;3;90;0
WireConnection;78;0;77;0
WireConnection;78;1;74;0
WireConnection;78;2;75;0
WireConnection;78;3;76;0
WireConnection;79;0;78;0
WireConnection;95;0;94;0
WireConnection;53;0;52;0
WireConnection;41;0;28;0
WireConnection;80;0;78;0
WireConnection;80;1;79;0
WireConnection;38;0;28;0
WireConnection;38;1;41;0
WireConnection;54;0;52;0
WireConnection;54;1;53;0
WireConnection;96;0;94;0
WireConnection;96;1;95;0
WireConnection;58;0;38;0
WireConnection;58;1;54;0
WireConnection;58;2;80;0
WireConnection;58;3;96;0
WireConnection;0;2;58;0
ASEEND*/
//CHKSM=2E659DD22A1356610BD0A607C52BF9BA57219C49
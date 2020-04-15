// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Color Testing"
{
	Properties
	{
		[Toggle]_ENABLETHISFORGUILTYGEAR("ENABLE THIS FOR GUILTY GEAR", Float) = 0
		[Toggle]_NegateVertexColors("Negate Vertex Colors", Float) = 0
		[Toggle]_ShowVertexRedVertexOcclusionShading("Show Vertex Red (Vertex Occlusion Shading)", Float) = 0
		_VertexRed("Vertex Red", Color) = (1,0,0,0)
		[Toggle]_ShowVertexGreenCoefficientoutlinesizetocameradistance("Show Vertex Green (Coefficient outline size to camera distance)", Float) = 0
		_VertexGreen("Vertex Green", Color) = (0,1,0,0)
		[Toggle]_ShowVertexBlueWhatCANgetanoutline("Show Vertex Blue (What CAN get an outline)", Float) = 0
		_VertexBlue("Vertex Blue", Color) = (0,0,1,0)
		[Toggle]_ShowVertexAlphaScalemultofoutline("Show Vertex Alpha (Scale mult of outline)", Float) = 0
		_VertexAlpha("Vertex Alpha", Color) = (1,1,1,0)
		[NoScaleOffset]_ILM("ILM", 2D) = "white" {}
		[Toggle]_NegateILMColors("Negate ILM Colors", Float) = 0
		[Toggle]_ShowILMRedSpecularIntensity("Show ILM Red (Specular Intensity)", Float) = 0
		_ILMRed("ILM Red", Color) = (1,0,0,0)
		[Toggle]_ShowILMGreenILMOcclusionshading("Show ILM Green (ILM Occlusion shading)", Float) = 0
		_ILMGreen("ILM Green", Color) = (0,1,0,0)
		[Toggle]_ShowILMBlueSpecularSize("Show ILM Blue (Specular Size)", Float) = 0
		_ILMBlue("ILM Blue", Color) = (0,0,1,0)
		[Toggle]_ShowILMAlphaBodyLines("Show ILM Alpha (Body Lines)", Float) = 0
		_ILMAlpha("ILM Alpha", Color) = (1,1,1,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		[Toggle]_NegateBaseColors("Negate Base Colors", Float) = 0
		[Toggle]_ShowBaseAlphaFresnelScale("Show Base Alpha (Fresnel Scale)", Float) = 0
		_BaseAlpha("Base Alpha", Color) = (1,1,1,0)
		[NoScaleOffset]_SSS("SSS", 2D) = "white" {}
		[Toggle]_NegateSSSColors("Negate SSS Colors", Float) = 0
		[Toggle]_ShowSSSAlphaUnknown("Show SSS Alpha (Unknown)", Float) = 0
		_SSSAlpha("SSS Alpha", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
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
		uniform float _ShowVertexRedVertexOcclusionShading;
		uniform float _ENABLETHISFORGUILTYGEAR;
		uniform float4 _VertexRed;
		uniform float _ShowVertexGreenCoefficientoutlinesizetocameradistance;
		uniform float4 _VertexGreen;
		uniform float _ShowVertexBlueWhatCANgetanoutline;
		uniform float4 _VertexBlue;
		uniform float _ShowVertexAlphaScalemultofoutline;
		uniform float4 _VertexAlpha;
		uniform float _NegateILMColors;
		uniform float _ShowILMRedSpecularIntensity;
		uniform sampler2D _ILM;
		uniform float4 _ILMRed;
		uniform float _ShowILMGreenILMOcclusionshading;
		uniform float4 _ILMGreen;
		uniform float _ShowILMBlueSpecularSize;
		uniform float4 _ILMBlue;
		uniform float _ShowILMAlphaBodyLines;
		uniform float4 _ILMAlpha;
		uniform float _NegateBaseColors;
		uniform float _ShowBaseAlphaFresnelScale;
		uniform sampler2D _Base;
		uniform float4 _BaseAlpha;
		uniform float _NegateSSSColors;
		uniform float _ShowSSSAlphaUnknown;
		uniform sampler2D _SSS;
		uniform float4 _SSSAlpha;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float4 appendResult61 = (float4(i.vertexColor.b , i.vertexColor.g , i.vertexColor.r , i.vertexColor.a));
			float4 break64 = (( _ENABLETHISFORGUILTYGEAR )?( appendResult61 ):( i.vertexColor ));
			float4 temp_output_28_0 = ( (( _ShowVertexRedVertexOcclusionShading )?( ( break64.x * _VertexRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexGreenCoefficientoutlinesizetocameradistance )?( ( break64.y * _VertexGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexBlueWhatCANgetanoutline )?( ( break64.z * _VertexBlue ) ):( float4( 0,0,0,0 ) )) + (( _ShowVertexAlphaScalemultofoutline )?( ( break64.w * _VertexAlpha ) ):( float4( 0,0,0,0 ) )) );
			float2 uv_ILM42 = i.uv_texcoord;
			float4 tex2DNode42 = tex2D( _ILM, uv_ILM42 );
			float4 temp_output_52_0 = ( (( _ShowILMRedSpecularIntensity )?( ( tex2DNode42.r * _ILMRed ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMGreenILMOcclusionshading )?( ( tex2DNode42.g * _ILMGreen ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMBlueSpecularSize )?( ( tex2DNode42.b * _ILMBlue ) ):( float4( 0,0,0,0 ) )) + (( _ShowILMAlphaBodyLines )?( ( tex2DNode42.a * _ILMAlpha ) ):( float4( 0,0,0,0 ) )) );
			float2 uv_Base85 = i.uv_texcoord;
			float2 uv_SSS67 = i.uv_texcoord;
			c.rgb = ( (( _NegateVertexColors )?( ( 1.0 - temp_output_28_0 ) ):( temp_output_28_0 )) + (( _NegateILMColors )?( ( 1.0 - temp_output_52_0 ) ):( temp_output_52_0 )) + (( _NegateBaseColors )?( ( 1.0 - (( _ShowBaseAlphaFresnelScale )?( ( tex2D( _Base, uv_Base85 ).a * _BaseAlpha ) ):( float4( 0,0,0,0 ) )) ) ):( (( _ShowBaseAlphaFresnelScale )?( ( tex2D( _Base, uv_Base85 ).a * _BaseAlpha ) ):( float4( 0,0,0,0 ) )) )) + (( _NegateSSSColors )?( ( 1.0 - (( _ShowSSSAlphaUnknown )?( ( tex2D( _SSS, uv_SSS67 ).a * _SSSAlpha ) ):( float4( 0,0,0,0 ) )) ) ):( (( _ShowSSSAlphaUnknown )?( ( tex2D( _SSS, uv_SSS67 ).a * _SSSAlpha ) ):( float4( 0,0,0,0 ) )) )) ).rgb;
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
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17800
119.2;304.8;1385;685;3615.4;735.3506;3.159688;True;True
Node;AmplifyShaderEditor.VertexColorNode;60;-2071.81,-185.3204;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;61;-1821.872,-130.7885;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;62;-1697.971,-196.7875;Inherit;False;Property;_ENABLETHISFORGUILTYGEAR;ENABLE THIS FOR GUILTY GEAR;0;0;Create;True;0;0;False;0;0;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;36;-994.2482,363.4127;Inherit;False;Property;_VertexBlue;Vertex Blue;7;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;45;-1083.675,866.7972;Inherit;False;Property;_ILMRed;ILM Red;13;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;97;-994.3762,571.5011;Inherit;False;Property;_VertexAlpha;Vertex Alpha;9;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;57;-1045.016,1584.738;Inherit;False;Property;_ILMAlpha;ILM Alpha;19;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;42;-1479.882,721.5238;Inherit;True;Property;_ILM;ILM;10;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;a3305d71b40ac3a47a0a610eb6f22383;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;32;-990.3479,106.0129;Inherit;False;Property;_VertexGreen;Vertex Green;5;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;-1071.916,1073.93;Inherit;False;Property;_ILMGreen;ILM Green;15;0;Create;True;0;0;False;0;0,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-1075.816,1331.33;Inherit;False;Property;_ILMBlue;ILM Blue;17;0;Create;True;0;0;False;0;0,0,1,0;0,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;30;-1002.107,-101.1198;Inherit;False;Property;_VertexRed;Vertex Red;3;0;Create;True;0;0;False;0;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;64;-1379.441,-163.7522;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;67;-1292.018,2307.844;Inherit;True;Property;_SSS;SSS;24;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;2042a78391260c944b982f99c34b9298;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;85;-1290.724,1833.794;Inherit;True;Property;_Base;Base;20;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;f527e23ef6fd0e645a3818a274d691fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-698.3083,-9.251968;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-779.8759,958.665;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-703.3362,448.2366;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;83;-1197.113,2072.831;Inherit;False;Property;_BaseAlpha;Base Alpha;23;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-702.2086,248.148;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-753.9761,1461.473;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-710.0674,-216.3847;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-791.635,751.5323;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;65;-1169.04,2532.902;Inherit;False;Property;_SSSAlpha;SSS Alpha;27;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-783.7762,1216.065;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;34;-421.8281,-15.31957;Inherit;False;Property;_ShowVertexGreenCoefficientoutlinesizetocameradistance;Show Vertex Green (Coefficient outline size to camera distance);4;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;99;-425.5554,412.2696;Inherit;False;Property;_ShowVertexAlphaScalemultofoutline;Show Vertex Alpha (Scale mult of outline);8;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;49;-503.3957,952.5974;Inherit;False;Property;_ShowILMGreenILMOcclusionshading;Show ILM Green (ILM Occlusion shading);14;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;50;-505.9959,1180.098;Inherit;False;Property;_ShowILMBlueSpecularSize;Show ILM Blue (Specular Size);16;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-877.9999,2409.637;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;27;-470.83,-151.7263;Inherit;False;Property;_ShowVertexRedVertexOcclusionShading;Show Vertex Red (Vertex Occlusion Shading);2;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;56;-476.1958,1425.506;Inherit;False;Property;_ShowILMAlphaBodyLines;Show ILM Alpha (Body Lines);18;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;35;-460.4283,215.1805;Inherit;False;Property;_ShowVertexBlueWhatCANgetanoutline;Show Vertex Blue (What CAN get an outline);6;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;87;-906.0724,1949.566;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;51;-459.3976,816.1907;Inherit;False;Property;_ShowILMRedSpecularIntensity;Show ILM Red (Specular Intensity);12;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;90;-628.2923,1913.598;Inherit;False;Property;_ShowBaseAlphaFresnelScale;Show Base Alpha (Fresnel Scale);22;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;-234.8976,851.5907;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;28;-129.3786,-101.974;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;76;-600.2198,2373.67;Inherit;False;Property;_ShowSSSAlphaUnknown;Show SSS Alpha (Unknown);26;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;95;-283.1563,2002.359;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;79;-215.3212,2487.109;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;41;-0.6289272,-47.81958;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;53;-82.19656,920.0974;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;38;148.8711,-160.9196;Inherit;False;Property;_NegateVertexColors;Negate Vertex Colors;1;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;96;-133.6561,1889.257;Inherit;False;Property;_NegateBaseColors;Negate Base Colors;21;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;54;67.30347,806.9974;Inherit;False;Property;_NegateILMColors;Negate ILM Colors;11;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;80;-65.82101,2374.01;Inherit;False;Property;_NegateSSSColors;Negate SSS Colors;25;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;58;658.153,1466.825;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1028.116,1200.879;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;.Aerthas/Arc System Works/Color Testing;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;61;0;60;3
WireConnection;61;1;60;2
WireConnection;61;2;60;1
WireConnection;61;3;60;4
WireConnection;62;0;60;0
WireConnection;62;1;61;0
WireConnection;64;0;62;0
WireConnection;33;0;64;1
WireConnection;33;1;32;0
WireConnection;47;0;42;2
WireConnection;47;1;44;0
WireConnection;98;0;64;3
WireConnection;98;1;97;0
WireConnection;37;0;64;2
WireConnection;37;1;36;0
WireConnection;55;0;42;4
WireConnection;55;1;57;0
WireConnection;31;0;64;0
WireConnection;31;1;30;0
WireConnection;48;0;42;1
WireConnection;48;1;45;0
WireConnection;46;0;42;3
WireConnection;46;1;43;0
WireConnection;34;1;33;0
WireConnection;99;1;98;0
WireConnection;49;1;47;0
WireConnection;50;1;46;0
WireConnection;73;0;67;4
WireConnection;73;1;65;0
WireConnection;27;1;31;0
WireConnection;56;1;55;0
WireConnection;35;1;37;0
WireConnection;87;0;85;4
WireConnection;87;1;83;0
WireConnection;51;1;48;0
WireConnection;90;1;87;0
WireConnection;52;0;51;0
WireConnection;52;1;49;0
WireConnection;52;2;50;0
WireConnection;52;3;56;0
WireConnection;28;0;27;0
WireConnection;28;1;34;0
WireConnection;28;2;35;0
WireConnection;28;3;99;0
WireConnection;76;1;73;0
WireConnection;95;0;90;0
WireConnection;79;0;76;0
WireConnection;41;0;28;0
WireConnection;53;0;52;0
WireConnection;38;0;28;0
WireConnection;38;1;41;0
WireConnection;96;0;90;0
WireConnection;96;1;95;0
WireConnection;54;0;52;0
WireConnection;54;1;53;0
WireConnection;80;0;76;0
WireConnection;80;1;79;0
WireConnection;58;0;38;0
WireConnection;58;1;54;0
WireConnection;58;2;96;0
WireConnection;58;3;80;0
WireConnection;0;13;58;0
ASEEND*/
//CHKSM=1E8511D3E8C8EBFC0A7FF26B43CF70858E950E79
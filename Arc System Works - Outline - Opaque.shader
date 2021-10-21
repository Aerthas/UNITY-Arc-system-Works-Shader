// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Utils/Outline/Opaque v5.2.1"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[ToggleUI]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_DepthOffset("Depth Offset", Float) = 0.45
		[IntRange]_Reference("Reference", Range( 0 , 255)) = 0
		[IntRange]_ReadMask("Read Mask", Range( 0 , 255)) = 255
		[IntRange]_WriteMask("Write Mask", Range( 0 , 255)) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)]_Comparison("Comparison", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_PassFront("Pass Front", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_FailFront("Fail Front", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_ZFailFront("ZFail Front", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode("ZTest Mode", Float) = 4
		[Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Float) = 1
		_Factor("Factor", Float) = 0
		[ASEEnd]_Units("Units", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Front
		ColorMask RGBA
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		Offset [_Factor] , [_Units]
		Stencil
		{
			Ref [_Reference]
			ReadMask [_ReadMask]
			WriteMask [_WriteMask]
			Comp [_Comparison]
			Pass [_PassFront]
			Fail [_FailFront]
			ZFail [_ZFailFront]
		}
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_COLOR


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _Reference;
			uniform float _WriteMask;
			uniform float _Units;
			uniform float _Factor;
			uniform float _FailFront;
			uniform float _ZFailFront;
			uniform float _ZWriteMode;
			uniform float _Comparison;
			uniform float _ZTestMode;
			uniform float _ReadMask;
			uniform float _PassFront;
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
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 objectToViewPos = UnityObjectToViewPos(v.vertex.xyz);
				float eyeDepth = -objectToViewPos.z;
				float temp_output_33_0_g18 = _OutlineThickness;
				float3 temp_output_135_0_g18 = ( ( v.ase_normal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.color.g * temp_output_33_0_g18 ) + temp_output_33_0_g18 ) * v.color.a ) );
				float3 objectSpaceViewDir136_g18 = ObjSpaceViewDir( float4( temp_output_135_0_g18 , 0.0 ) );
				float4 normalizeResult142_g18 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g18 , 0.0 ) - v.vertex ) );
				float clampResult141_g18 = clamp( ( v.color.b + _DepthOffset ) , 0.0 , 1.0 );
				float4 lerpResult145_g18 = lerp( float4( temp_output_135_0_g18 , 0.0 ) , -normalizeResult142_g18 , ( 1.0 - clampResult141_g18 ));
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = lerpResult145_g18.xyz;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float2 uv_Base16 = i.ase_texcoord1.xy;
				float4 temp_output_13_0_g18 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
				
				
				finalColor = ( ( _EnableBaseColorMult > 0.0 ? ( temp_output_13_0_g18 * temp_output_13_0_g18 ) : _OutlineColor ) * _OutlineColorIntensity );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASWUtilsOutlineGUI"
	
	
}
/*ASEBEGIN
Version=18900
104;227;1939;816;1433.146;604.4758;1.172217;True;True
Node;AmplifyShaderEditor.ColorNode;20;-1398,127;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;401;-568.9204,-791.3371;Inherit;False;253;357;;4;411;409;406;405;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1446,383;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-1446,303;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;402;-952.9209,-791.3371;Inherit;False;352;549;;7;413;412;410;408;407;404;403;Stencil Buffer;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1460,-66;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;5;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;-1360,32;Inherit;False;Property;_DepthOffset;Depth Offset;6;0;Create;True;0;0;0;False;0;False;0.45;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1494,463;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;7e71c72d65d01be48b27ce7c7f549afc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;34;-1392,-192;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;411;-520.9204,-663.337;Inherit;False;Property;_ZTestMode;ZTest Mode;14;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;409;-520.9204,-727.337;Inherit;False;Property;_ZWriteMode;ZWrite Mode;15;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;405;-520.9204,-535.3367;Inherit;False;Property;_Units;Units;17;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;407;-904.9203,-423.3366;Inherit;False;Property;_FailFront;Fail Front;12;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;413;-904.9203,-487.3366;Inherit;False;Property;_PassFront;Pass Front;11;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;408;-904.9203,-359.3366;Inherit;False;Property;_ZFailFront;ZFail Front;13;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;399;-623.179,310.1057;Inherit;False;ASWOutline - Strive;-1;;19;45e68a0e07691604398d794ebf3282a2;0;8;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;155;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.RangedFloatNode;403;-904.9203,-743.337;Inherit;False;Property;_Reference;Reference;7;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;-520.9204,-599.3369;Inherit;False;Property;_Factor;Factor;16;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;410;-904.9203,-551.3369;Inherit;False;Property;_Comparison;Comparison;10;1;[Enum];Create;True;0;9;Default;0;Greater;1;Greater or Equal;2;Less;3;Less or Equal;4;Equal;5;Not Equal;6;Always;7;Never;8;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;397;-744.9083,27.20754;Inherit;False;ASWOutline;-1;;18;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.RangedFloatNode;404;-903.9203,-615.3369;Inherit;False;Property;_WriteMask;Write Mask;9;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;412;-904.9203,-679.337;Inherit;False;Property;_ReadMask;Read Mask;8;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;400;45.83971,25.6344;Float;False;True;-1;2;ASWUtilsOutlineGUI;100;1;.Aerthas/Arc System Works/Utils/Outline/Opaque v5.2.1;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;1;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;True;True;True;255;True;403;255;True;412;255;True;404;7;True;410;1;True;413;1;True;407;1;True;408;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;409;True;3;True;411;True;True;0;True;406;0;True;405;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;397;33;34;0
WireConnection;397;47;41;0
WireConnection;397;127;217;0
WireConnection;397;35;20;0
WireConnection;397;37;107;0
WireConnection;397;36;29;0
WireConnection;397;31;16;0
WireConnection;400;0;397;0
WireConnection;400;1;397;109
ASEEND*/
//CHKSM=437F4A8903F9E25B6D5FBFFC0E8A1B9688B0F012
// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Utils/Outline v5.0.1"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[Toggle]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		[ASEEnd]_DepthOffset("Depth Offset", Float) = 0.45
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
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
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
				float temp_output_33_0_g17 = _OutlineThickness;
				float3 temp_output_135_0_g17 = ( ( v.ase_normal * 2E-05 ) * ( ( _EnableCameraDistanceMult * eyeDepth * v.color.g * temp_output_33_0_g17 ) + ( v.color.a * temp_output_33_0_g17 ) ) );
				float3 objectSpaceViewDir136_g17 = ObjSpaceViewDir( float4( temp_output_135_0_g17 , 0.0 ) );
				float4 normalizeResult142_g17 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g17 , 0.0 ) - v.vertex ) );
				float clampResult141_g17 = clamp( ( v.color.b + _DepthOffset ) , 0.0 , 1.0 );
				float4 lerpResult145_g17 = lerp( float4( temp_output_135_0_g17 , 0.0 ) , -normalizeResult142_g17 , ( 1.0 - clampResult141_g17 ));
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = lerpResult145_g17.xyz;
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
				float4 temp_output_13_0_g17 = max( float4( 0,0,0,0 ) , ( 0.2 * tex2D( _Base, uv_Base16 ) ) );
				
				
				finalColor = ( ( _EnableBaseColorMult > 0.0 ? ( temp_output_13_0_g17 * temp_output_13_0_g17 ) : _OutlineColor ) * _OutlineColorIntensity );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASWUtilsOutlineGUI"
	
	
}
/*ASEBEGIN
Version=18900
-2067;215;1776;843;1530.397;211.2802;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;34;-1392,-192;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;0;False;0;False;1;8.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1460,-66;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;5;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-1398,127;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;29;-1446,383;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[Toggle];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-1446,303;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1494,463;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;72ec7e5fb8db9a64090e6520468b394a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;217;-1360,32;Inherit;False;Property;_DepthOffset;Depth Offset;6;0;Create;True;0;0;0;False;0;False;0.45;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;396;-744.9083,28.20754;Inherit;False;ASWOutline;-1;;17;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;393;-156.1603,34.63445;Float;False;True;-1;2;ASWUtilsOutlineGUI;100;1;.Aerthas/Arc System Works/Utils/Outline v5.0.1;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;1;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;396;33;34;0
WireConnection;396;47;41;0
WireConnection;396;127;217;0
WireConnection;396;35;20;0
WireConnection;396;37;107;0
WireConnection;396;36;29;0
WireConnection;396;31;16;0
WireConnection;393;0;396;0
WireConnection;393;1;396;109
ASEEND*/
//CHKSM=239FB1193E2B0104297CD1D0F3E6F9EC14B64741
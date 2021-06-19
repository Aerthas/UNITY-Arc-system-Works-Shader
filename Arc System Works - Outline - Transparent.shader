// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Utils/Outline/Transparent v5.2.0"
{
	Properties
	{
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		[NoScaleOffset]_Base("Base", 2D) = "white" {}
		_OutlineThickness("Outline Thickness", Float) = 1
		[ToggleUI]_EnableBaseColorMult("Enable Base Color Mult", Float) = 1
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		[ASEEnd]_DepthOffset("Depth Offset", Float) = 0.45
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		LOD 0

		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
		
		Pass
		{
			
			Name "First"
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			AlphaToMask Off
			Cull Back
			ColorMask 0
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			

			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				
			};

			
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				
				
				v.vertex.xyz +=  float3(0,0,0) ;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				fixed4 finalColor;
				
				
				finalColor = fixed4(1,1,1,1);
				return finalColor;
			}
			ENDCG
		}

		
		Pass
		{
			Name "Second"
			
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
			
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#define ASE_NEEDS_VERT_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
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
				float3 objectToViewPos = UnityObjectToViewPos(v.vertex.xyz);
				float eyeDepth = -objectToViewPos.z;
				float temp_output_33_0_g18 = _OutlineThickness;
				float3 temp_output_135_0_g18 = ( ( v.ase_normal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.ase_color.g * temp_output_33_0_g18 ) + temp_output_33_0_g18 ) * v.ase_color.a ) );
				float3 objectSpaceViewDir136_g18 = ObjSpaceViewDir( float4( temp_output_135_0_g18 , 0.0 ) );
				float4 normalizeResult142_g18 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g18 , 0.0 ) - v.vertex ) );
				float clampResult141_g18 = clamp( ( v.ase_color.b + _DepthOffset ) , 0.0 , 1.0 );
				float4 lerpResult145_g18 = lerp( float4( temp_output_135_0_g18 , 0.0 ) , -normalizeResult142_g18 , ( 1.0 - clampResult141_g18 ));
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				
				v.vertex.xyz += lerpResult145_g18.xyz;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				fixed4 finalColor;
				float2 uv_Base16 = i.ase_texcoord.xy;
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
-2375;195;2298;1017;2201.336;527.4727;1.379509;True;True
Node;AmplifyShaderEditor.RangedFloatNode;34;-1392,-192;Inherit;False;Property;_OutlineThickness;Outline Thickness;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1460,-66;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;5;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-1398,127;Inherit;False;Property;_OutlineColor;Outline Color;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;107;-1446,303;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1494,463;Inherit;True;Property;_Base;Base;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;63ca6c08f2180a944b3599d6f3229619;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;217;-1360,32;Inherit;False;Property;_DepthOffset;Depth Offset;6;0;Create;True;0;0;0;False;0;False;0.45;0.45;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1446,383;Inherit;False;Property;_EnableBaseColorMult;Enable Base Color Mult;3;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;397;-737.9083,177.2076;Inherit;False;ASWOutline;-1;;18;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;408;-25.1603,165.6344;Float;False;False;-1;2;ASEMaterialInspector;0;11;New Amplify Shader;003dfa9c16768d048b74f75c088119d8;True;Second;0;1;Second;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;1;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;407;-25.1603,35.6344;Float;False;True;-1;2;ASWUtilsOutlineGUI;0;11;.Aerthas/Arc System Works/Utils/Outline/Transparent v5.2.0;003dfa9c16768d048b74f75c088119d8;True;First;0;0;First;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;False;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;True;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;True;2;0;;0;0;Standard;0;0;2;True;True;False;;False;0
WireConnection;397;33;34;0
WireConnection;397;47;41;0
WireConnection;397;127;217;0
WireConnection;397;35;20;0
WireConnection;397;37;107;0
WireConnection;397;36;29;0
WireConnection;397;31;16;0
WireConnection;408;0;397;0
WireConnection;408;1;397;109
ASEEND*/
//CHKSM=C548144108B8075A7FE0462D94B059A8915B3066
// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Game Select/Guilty Gear Strive/Opaque v7.2.2"
{
	Properties
	{
		[Enum(Basic,0,Advanced,1)]_EditorVersion("Editor Version", Float) = 0
		_Base("Base", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		[Enum(Default,0,Shadow Priority,1,ILM Priority,2)]_ILMColorSetting("ILM Color Setting", Float) = 0
		_ILMAlphaColor("ILM Alpha Color", Color) = (1,0,0,0)
		_FakeGlobalLightColor("Fake Global Light Color", Color) = (1,1,1,0)
		_FakeGlobalLightIntensity("Fake Global Light Intensity", Float) = 0.4
		[Enum(Default,0,Shadow Priority,1,Detail Priority,2)]_DetailColorSetting("Detail Color Setting", Float) = 0
		_FakeLightDirX("Fake Light Dir X", Float) = 35
		_FakeLightDirY("Fake Light Dir Y", Float) = -135
		_ViewDirOffsetPitch("View Dir Offset Pitch", Range( -90 , 90)) = 0
		_ViewDirOffsetYaw("View Dir Offset Yaw", Range( -90 , 90)) = 0
		_MinimumGlobalLightIntensity("Minimum Global Light Intensity", Range( 0 , 1)) = 0.4
		[Enum(Automatic RECOMMENDED,0,Forced Fake,1)]_LightColorSetting("Light Color Setting", Float) = 0
		[Enum(Automatic RECOMMENDED,0,Forced Fake,1)]_LightDirectionSetting("Light Direction Setting", Float) = 0
		[Enum(Fake Light Direction,0,View Direction,1)]_FallbackLightDirection("Fallback Light Direction", Float) = 0
		_GlobalLightPush("Global Light Push", Range( -1 , 3)) = 1
		_LightColor("Light Color", Color) = (1,1,1,0)
		_AmbientColor("Ambient Color", Color) = (1,1,1,0)
		_EmissionIntensity("Emission Intensity", Float) = 1
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.2
		_Shadow1Push("Shadow 1 Push", Range( -1 , 1)) = 0.5
		_Shadow1VertexRThreshold("Shadow 1 VertexR Threshold", Range( 0 , 1)) = 0.5
		_Shadow2Push("Shadow 2 Push", Range( -1 , 1)) = -1
		_Shadow2VertexRThreshold("Shadow 2 VertexR Threshold", Range( 0 , 1)) = 0.1
		_PermanentShadowThreshold("Permanent Shadow Threshold", Range( 0 , 1)) = 0.1
		_RimlightSize("Rimlight Size", Range( 0 , 1)) = 0.4
		[ToggleUI]_EnableRimlight("Enable Rimlight", Float) = 1
		[ToggleUI]_EnableColorReplacer("Enable Color Replacer", Float) = 0
		[IntRange]_TotalReplacements("Total Replacements", Range( 1 , 5)) = 1
		_Source1Color("Source 1 Color", Color) = (1,1,1,0)
		_Source1Fuzziness("Source 1 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target1Color("Target 1 Color", Color) = (1,1,1,0)
		_SSSHueShift1("SSS Hue Shift 1", Range( -1 , 1)) = 0
		_Source2Color("Source 2 Color", Color) = (1,1,1,0)
		_Source2Fuzziness("Source 2 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target2Color("Target 2 Color", Color) = (1,1,1,0)
		_SSSHueShift2("SSS Hue Shift 2", Range( -1 , 1)) = 0
		_Source3Color("Source 3 Color", Color) = (1,1,1,0)
		_Source3Fuzziness("Source 3 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target3Color("Target 3 Color", Color) = (1,1,1,0)
		_SSSHueShift3("SSS Hue Shift 3", Range( -1 , 1)) = 0
		_Source4Color("Source 4 Color", Color) = (1,1,1,0)
		_Source4Fuzziness("Source 4 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target4Color("Target 4 Color", Color) = (1,1,1,0)
		_SSSHueShift4("SSS Hue Shift 4", Range( -1 , 1)) = 0
		_Source5Color("Source 5 Color", Color) = (1,1,1,0)
		_Source5Fuzziness("Source 5 Fuzziness", Range( 0.01 , 1)) = 0.01
		_Target5Color("Target 5 Color", Color) = (1,1,1,0)
		[Enum(All Channels,0,Red,1,Green,2,Blue,3,Alpha,4)]_VertexChannel("Vertex Channel", Float) = 0
		_DebugColor("Debug Color", Color) = (1,1,1,0)
		_SSSHueShift5("SSS Hue Shift 5", Range( -1 , 1)) = 0
		_RimlightIntensity("Rimlight Intensity", Float) = 0.1
		_RimlightTint("Rimlight Tint", Color) = (1,1,1,0)
		_RimlightSaturation("Rimlight Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_RimlightEmissiveToggle("Rimlight Emissive Toggle", Float) = 0
		_RimlightEmissionIntensity("Rimlight Emission Intensity", Float) = 1
		_SpecularIntensity("Specular Intensity", Float) = 1
		_SpecularTint("Specular Tint", Color) = (1,1,1,0)
		_SpecularSaturation("Specular Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_SpecularEmissiveToggle("Specular Emissive Toggle", Float) = 0
		_SpecularEmissionIntensity("Specular Emission Intensity", Float) = 1
		_BaseIntensity("Base Intensity", Float) = 1
		_BaseTint("Base Tint", Color) = (1,1,1,0)
		_BaseSaturation("Base Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_BaseEmissiveToggle("Base Emissive Toggle", Float) = 0
		_BaseEmissionIntensity("Base Emission Intensity", Float) = 1
		_Shadow1Intensity("Shadow 1 Intensity", Float) = 1
		_Shadow1Tint("Shadow 1 Tint", Color) = (1,1,1,0)
		_Shadow1Saturation("Shadow 1 Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_Shadow1EmissiveToggle("Shadow 1 Emissive Toggle", Float) = 0
		_Shadow1EmissionIntensity("Shadow 1 Emission Intensity", Float) = 1
		_Shadow2Intensity("Shadow 2 Intensity", Float) = 1
		_Shadow2Tint("Shadow 2 Tint", Color) = (1,1,1,0)
		_Shadow2Saturation("Shadow 2 Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_Shadow2EmissiveToggle("Shadow 2 Emissive Toggle", Float) = 0
		_Shadow2EmissionIntensity("Shadow 2 Emission Intensity", Float) = 1
		[ToggleUI]_EnableOutline("Enable Outline", Float) = 0
		_OutlineThickness("Outline Thickness", Float) = 0
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_DepthOffset("Depth Offset", Range( 0 , 1)) = 0.5
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_OutlineEnableBaseColorMult("Outline Enable Base Color Mult", Float) = 1
		[ToggleUI]_EnableDebug("Enable Debug", Float) = 0
		[Enum(Vertex Colors,0,ILM Channels,1,Base and SSS Alpha,2)]_DebugGroup("Debug Group", Float) = 0
		[Enum(All Channels,0,Red,1,Green,2,Blue,3,Alpha,4)]_ILMChannel("ILM Channel", Float) = 0
		_ILMAlphaEmissionIntensity("ILM Alpha Emission Intensity", Float) = 1
		[ToggleUI]_ILMAlphaLinesEmissionToggle("ILM Alpha Lines Emission Toggle", Float) = 0
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
		_Units("Units", Float) = 0
		_Opacity("Opacity", Range( 0 , 1)) = 1
		_Detail("Detail", 2D) = "white" {}
		_BodyLinesColor("Body Lines Color", Color) = (1,1,0,0)
		_OLM("OLM", 2D) = "black" {}
		[Enum(Base Alpha,0,SSS Alpha,1)]_BaseSSSAlphaSwap("BaseSSSAlphaSwap", Float) = 0
		[ToggleUI]_SSSAlphaEmissiveToggle("SSS Alpha Emissive Toggle", Float) = 0
		[ASEEnd]_SSSAlphaEmissiveIntensity("SSS Alpha Emissive Intensity", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
	LOD 100

		Cull Off
		CGINCLUDE
		#pragma target 3.0
		ENDCG

		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			AlphaToMask Off
			Cull Back
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
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"
			#include "UnityStandardBRDF.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_SHADOWS 1

			//This is a late directive
			
			uniform float _PassFront;
			uniform float _ZTestMode;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _Comparison;
			uniform float _ZFailFront;
			uniform float _Units;
			uniform float _EditorVersion;
			uniform float _Opacity;
			uniform float _FailFront;
			uniform float _WriteMask;
			uniform float _ZWriteMode;
			uniform float _Reference;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableColorReplacer;
			uniform sampler2D _Base;
			uniform float4 _Base_ST;
			uniform sampler2D _SSS;
			uniform float4 _SSS_ST;
			uniform float _TotalReplacements;
			uniform float4 _Target5Color;
			uniform float4 _Target4Color;
			uniform float4 _Target3Color;
			uniform float4 _Target2Color;
			uniform float4 _Target1Color;
			uniform float _Source1Fuzziness;
			uniform float4 _Source1Color;
			uniform float _Source2Fuzziness;
			uniform float4 _Source2Color;
			uniform float _Source3Fuzziness;
			uniform float4 _Source3Color;
			uniform float _Source4Fuzziness;
			uniform float4 _Source4Color;
			uniform float _Source5Fuzziness;
			uniform float4 _Source5Color;
			uniform float _SSSHueShift5;
			uniform float _SSSHueShift4;
			uniform float _SSSHueShift3;
			uniform float _SSSHueShift2;
			uniform float _SSSHueShift1;
			uniform sampler2D _Detail;
			uniform float4 _Detail_ST;
			uniform sampler2D _OLM;
			uniform float4 _OLM_ST;
			uniform float _LightDirectionSetting;
			uniform float _FallbackLightDirection;
			uniform float _ViewDirOffsetPitch;
			uniform float _ViewDirOffsetYaw;
			uniform float _FakeLightDirX;
			uniform float _FakeLightDirY;
			uniform float _SpecularSize;
			uniform float _SpecularIntensity;
			uniform float4 _SpecularTint;
			uniform float _SpecularSaturation;
			uniform float4 _LightColor;
			uniform float _BaseIntensity;
			uniform float4 _BaseTint;
			uniform float _BaseSaturation;
			uniform float4 _AmbientColor;
			uniform float _Shadow1Intensity;
			uniform float4 _Shadow1Tint;
			uniform float _Shadow1Saturation;
			uniform float _Shadow2Intensity;
			uniform float4 _Shadow2Tint;
			uniform float _Shadow2Saturation;
			uniform float _Shadow1VertexRThreshold;
			uniform float _GlobalLightPush;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _PermanentShadowThreshold;
			uniform float _EnableRimlight;
			uniform float _RimlightSize;
			uniform float _RimlightIntensity;
			uniform float4 _RimlightTint;
			uniform float _RimlightSaturation;
			uniform float _LightColorSetting;
			uniform float _MinimumGlobalLightIntensity;
			uniform float4 _FakeGlobalLightColor;
			uniform float _FakeGlobalLightIntensity;
			uniform float _EmissionIntensity;
			uniform float _RimlightEmissiveToggle;
			uniform float _RimlightEmissionIntensity;
			uniform float _SpecularEmissiveToggle;
			uniform float _SpecularEmissionIntensity;
			uniform float _BaseEmissiveToggle;
			uniform float _BaseEmissionIntensity;
			uniform float _Shadow1EmissiveToggle;
			uniform float _Shadow1EmissionIntensity;
			uniform float _Shadow2EmissiveToggle;
			uniform float _Shadow2EmissionIntensity;
			uniform float _ILMAlphaEmissionIntensity;
			uniform float _ILMAlphaLinesEmissionToggle;
			uniform float _SSSAlphaEmissiveToggle;
			uniform float _SSSAlphaEmissiveIntensity;
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
			uniform float _BaseSSSAlphaSwap;
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 ViewMatrix0375_g1667(  )
			{
				return UNITY_MATRIX_V[0];
			}
			
			float3 ViewMatrix1373_g1667(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 StereoCameraViewPosition30_g1665(  )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				return cameraPos;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 StereoCameraViewDirection32_g1665( float3 worldPos )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				float3 worldViewDir = normalize((cameraPos - worldPos));
				return worldViewDir;
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_SHADOW_COORDS(4)
			};

			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord1.zw = v.ase_texcoord1.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float ILMColorSetting1007 = _ILMColorSetting;
				float4 ILMAColor1005 = _ILMAlphaColor;
				float DetailColorSetting1070 = _DetailColorSetting;
				float4 DetailColor1072 = _BodyLinesColor;
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float ILMColorSetting60_g1669 = ILMColorSetting1007;
				float4 ILMAColor54_g1669 = ILMAColor1005;
				float DetailColorSetting44_g1669 = DetailColorSetting1070;
				float4 DetailColor41_g1669 = DetailColor1072;
				float2 uv_Base = i.ase_texcoord1.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1659 = _TotalReplacements;
				float4 break8_g1664 = _Target5Color;
				float4 break8_g1660 = _Target4Color;
				float4 break8_g1662 = _Target3Color;
				float4 break8_g1661 = _Target2Color;
				float4 break8_g1663 = _Target1Color;
				float3x3 temp_output_67_0_g1659 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1663 = float4( temp_output_67_0_g1659[0] , 0.0 );
				float4 break6_g1663 = temp_output_13_0_g1663;
				float4 appendResult3_g1663 = (float4(break8_g1663.r , break8_g1663.g , break8_g1663.b , break6_g1663.a));
				float4 appendResult7_g1663 = (float4(break6_g1663.r , break6_g1663.g , break6_g1663.b , 1.0));
				float smoothstepResult5_g1663 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1663 , _Source1Color ));
				float4 lerpResult4_g1663 = lerp( appendResult3_g1663 , temp_output_13_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_106_0_g1659 = lerpResult4_g1663;
				float4 temp_output_13_0_g1661 = temp_output_106_0_g1659;
				float4 break6_g1661 = temp_output_13_0_g1661;
				float4 appendResult3_g1661 = (float4(break8_g1661.r , break8_g1661.g , break8_g1661.b , break6_g1661.a));
				float4 appendResult7_g1661 = (float4(break6_g1661.r , break6_g1661.g , break6_g1661.b , 1.0));
				float smoothstepResult5_g1661 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1661 , _Source2Color ));
				float4 lerpResult4_g1661 = lerp( appendResult3_g1661 , temp_output_13_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_102_0_g1659 = lerpResult4_g1661;
				float4 temp_output_13_0_g1662 = temp_output_102_0_g1659;
				float4 break6_g1662 = temp_output_13_0_g1662;
				float4 appendResult3_g1662 = (float4(break8_g1662.r , break8_g1662.g , break8_g1662.b , break6_g1662.a));
				float4 appendResult7_g1662 = (float4(break6_g1662.r , break6_g1662.g , break6_g1662.b , 1.0));
				float smoothstepResult5_g1662 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1662 , _Source3Color ));
				float4 lerpResult4_g1662 = lerp( appendResult3_g1662 , temp_output_13_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_104_0_g1659 = lerpResult4_g1662;
				float4 temp_output_13_0_g1660 = temp_output_104_0_g1659;
				float4 break6_g1660 = temp_output_13_0_g1660;
				float4 appendResult3_g1660 = (float4(break8_g1660.r , break8_g1660.g , break8_g1660.b , break6_g1660.a));
				float4 appendResult7_g1660 = (float4(break6_g1660.r , break6_g1660.g , break6_g1660.b , 1.0));
				float smoothstepResult5_g1660 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1660 , _Source4Color ));
				float4 lerpResult4_g1660 = lerp( appendResult3_g1660 , temp_output_13_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_105_0_g1659 = lerpResult4_g1660;
				float4 temp_output_13_0_g1664 = temp_output_105_0_g1659;
				float4 break6_g1664 = temp_output_13_0_g1664;
				float4 appendResult3_g1664 = (float4(break8_g1664.r , break8_g1664.g , break8_g1664.b , break6_g1664.a));
				float4 appendResult7_g1664 = (float4(break6_g1664.r , break6_g1664.g , break6_g1664.b , 1.0));
				float smoothstepResult5_g1664 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1664 , _Source5Color ));
				float4 lerpResult4_g1664 = lerp( appendResult3_g1664 , temp_output_13_0_g1664 , smoothstepResult5_g1664);
				float4 temp_output_15_0_g1663 = float4( temp_output_67_0_g1659[1] , 0.0 );
				float3 hsvTorgb25_g1663 = RGBToHSV( temp_output_15_0_g1663.rgb );
				float3 hsvTorgb26_g1663 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1663.x ),hsvTorgb25_g1663.y,hsvTorgb25_g1663.z) );
				float4 appendResult18_g1663 = (float4(hsvTorgb26_g1663 , temp_output_15_0_g1663.a));
				float4 lerpResult19_g1663 = lerp( appendResult18_g1663 , temp_output_15_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_15_0_g1661 = lerpResult19_g1663;
				float3 hsvTorgb25_g1661 = RGBToHSV( temp_output_15_0_g1661.rgb );
				float3 hsvTorgb26_g1661 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1661.x ),hsvTorgb25_g1661.y,hsvTorgb25_g1661.z) );
				float4 appendResult18_g1661 = (float4(hsvTorgb26_g1661 , temp_output_15_0_g1661.a));
				float4 lerpResult19_g1661 = lerp( appendResult18_g1661 , temp_output_15_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_15_0_g1662 = lerpResult19_g1661;
				float3 hsvTorgb25_g1662 = RGBToHSV( temp_output_15_0_g1662.rgb );
				float3 hsvTorgb26_g1662 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1662.x ),hsvTorgb25_g1662.y,hsvTorgb25_g1662.z) );
				float4 appendResult18_g1662 = (float4(hsvTorgb26_g1662 , temp_output_15_0_g1662.a));
				float4 lerpResult19_g1662 = lerp( appendResult18_g1662 , temp_output_15_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_15_0_g1660 = lerpResult19_g1662;
				float3 hsvTorgb25_g1660 = RGBToHSV( temp_output_15_0_g1660.rgb );
				float3 hsvTorgb26_g1660 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1660.x ),hsvTorgb25_g1660.y,hsvTorgb25_g1660.z) );
				float4 appendResult18_g1660 = (float4(hsvTorgb26_g1660 , temp_output_15_0_g1660.a));
				float4 lerpResult19_g1660 = lerp( appendResult18_g1660 , temp_output_15_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_15_0_g1664 = lerpResult19_g1660;
				float3 hsvTorgb25_g1664 = RGBToHSV( temp_output_15_0_g1664.rgb );
				float3 hsvTorgb26_g1664 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1664.x ),hsvTorgb25_g1664.y,hsvTorgb25_g1664.z) );
				float4 appendResult18_g1664 = (float4(hsvTorgb26_g1664 , temp_output_15_0_g1664.a));
				float4 lerpResult19_g1664 = lerp( appendResult18_g1664 , temp_output_15_0_g1664 , smoothstepResult5_g1664);
				float3x3 temp_output_24_0_g1669 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1659 == 5.0 ? lerpResult4_g1664 : ( temp_output_52_0_g1659 == 4.0 ? temp_output_105_0_g1659 : ( temp_output_52_0_g1659 == 3.0 ? temp_output_104_0_g1659 : ( temp_output_52_0_g1659 == 2.0 ? temp_output_102_0_g1659 : ( temp_output_52_0_g1659 == 1.0 ? temp_output_106_0_g1659 : float4( temp_output_67_0_g1659[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1664.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1066 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1669 = Detail1066;
				float4 lerpResult10_g1669 = lerp( DetailColor41_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float3 SSS50_g1669 = temp_output_24_0_g1669[1];
				float2 uv_OLM = i.ase_texcoord1.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1117 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1669 = OLM1117;
				float4 SSSOLM63_g1669 = ( float4( SSS50_g1669 , 0.0 ) * OLM47_g1669 );
				float4 lerpResult36_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float4 temp_output_20_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult10_g1669 : lerpResult36_g1669 );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1669 = ILMA357;
				float4 lerpResult12_g1669 = lerp( ILMAColor54_g1669 , temp_output_20_0_g1669 , ILMA57_g1669);
				float4 lerpResult65_g1669 = lerp( SSSOLM63_g1669 , temp_output_20_0_g1669 , ILMA57_g1669);
				float4 Base339 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult12_g1669 : lerpResult65_g1669 );
				float4 Base12_g1677 = Base339;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix0375_g1667 = ViewMatrix0375_g1667();
				float3 normalizeResult384_g1667 = normalize( localViewMatrix0375_g1667 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 temp_output_380_0_g1667 = ( float3( 0,0,0 ) + ase_worldPos );
				float3 localViewMatrix1373_g1667 = ViewMatrix1373_g1667();
				float3 normalizeResult376_g1667 = normalize( localViewMatrix1373_g1667 );
				float3 localStereoCameraViewPosition30_g1665 = StereoCameraViewPosition30_g1665();
				float3 rotatedValue385_g1667 = RotateAroundAxis( temp_output_380_0_g1667, localStereoCameraViewPosition30_g1665, normalizeResult376_g1667, radians( ( _ViewDirOffsetYaw * -1.0 ) ) );
				float3 rotatedValue387_g1667 = RotateAroundAxis( temp_output_380_0_g1667, rotatedValue385_g1667, normalize( normalizeResult384_g1667 ), radians( ( _ViewDirOffsetPitch * 1.0 ) ) );
				float3 normalizeResult389_g1667 = normalize( ( rotatedValue387_g1667 - temp_output_380_0_g1667 ) );
				float3 normalizeResult38_g1665 = normalize( normalizeResult389_g1667 );
				float3 appendResult15_g1666 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1666 = normalize( appendResult15_g1666 );
				float3 normalizeResult26_g1665 = normalize( normalizeResult2_g1666 );
				float3 ifLocalVar3_g1665 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1665 = normalizeResult38_g1665;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1665 = normalizeResult26_g1665;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1631 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1631 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1631 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1631 = color8_g1631;
				#else
				float4 staticSwitch9_g1631 = ( clampResult7_g1631 * color14_g1631 );
				#endif
				float4 break10_g1631 = staticSwitch9_g1631;
				float IsThereWorldLight450 = break10_g1631.r;
				float3 ifLocalVar8_g1665 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1665 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1665 = ifLocalVar3_g1665;
				float3 ifLocalVar9_g1665 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1665 = ifLocalVar3_g1665;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1665 = ifLocalVar8_g1665;
				float3 normalizeResult48_g1665 = normalize( ifLocalVar9_g1665 );
				float3 worldPos32_g1665 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1665 = StereoCameraViewDirection32_g1665( worldPos32_g1665 );
				float3 normalizeResult51_g1665 = normalize( ( normalizeResult48_g1665 + localStereoCameraViewDirection32_g1665 ) );
				float dotResult50_g1665 = dot( normalizedWorldNormal , normalizeResult51_g1665 );
				float blendOpSrc34_g1668 = ILMB576;
				float blendOpDest34_g1668 = dotResult50_g1665;
				float clampResult87_g1670 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1668) / max( blendOpSrc34_g1668, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_29 = (clampResult87_g1670).xxxx;
				float4 blendOpSrc30_g1677 = Base12_g1677;
				float4 blendOpDest30_g1677 = temp_cast_29;
				float4 lerpBlendMode30_g1677 = lerp(blendOpDest30_g1677,min( blendOpSrc30_g1677 , blendOpDest30_g1677 ),0.9);
				float3 desaturateInitialColor9_g1680 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1677 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1680 = dot( desaturateInitialColor9_g1680, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1680 = lerp( desaturateInitialColor9_g1680, desaturateDot9_g1680.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 temp_output_95_0_g1677 = ( float4( desaturateVar9_g1680 , 0.0 ) + Base12_g1677 );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1678 = ( temp_output_95_0_g1677 * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1678 = dot( desaturateInitialColor9_g1678, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1678 = lerp( desaturateInitialColor9_g1678, desaturateDot9_g1678.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 Base52_g1669 = temp_output_24_0_g1669[0];
				float3 blendOpSrc31_g1669 = Base52_g1669;
				float3 blendOpDest31_g1669 = temp_output_24_0_g1669[1];
				float4 lerpResult7_g1669 = lerp( ( DetailColor41_g1669 * float4( ( saturate( abs( blendOpSrc31_g1669 - blendOpDest31_g1669 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 lerpResult69_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 temp_output_8_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult7_g1669 : lerpResult69_g1669 );
				float4 blendOpSrc32_g1669 = temp_output_20_0_g1669;
				float4 blendOpDest32_g1669 = temp_output_8_0_g1669;
				float4 lerpResult17_g1669 = lerp( ( ILMAColor54_g1669 * ( saturate( abs( blendOpSrc32_g1669 - blendOpDest32_g1669 ) )) ) , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 lerpResult67_g1669 = lerp( SSSOLM63_g1669 , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 SSS578 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult17_g1669 : lerpResult67_g1669 );
				float4 SSS14_g1677 = SSS578;
				float3 desaturateInitialColor9_g1681 = ( SSS14_g1677 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1681 = dot( desaturateInitialColor9_g1681, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1681 = lerp( desaturateInitialColor9_g1681, desaturateDot9_g1681.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc51_g1677 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1677 = ( temp_output_95_0_g1677 * SSS14_g1677 );
				float4 lerpBlendMode51_g1677 = lerp(blendOpDest51_g1677,2.0f*blendOpDest51_g1677*blendOpSrc51_g1677 + blendOpDest51_g1677*blendOpDest51_g1677*(1.0f - 2.0f*blendOpSrc51_g1677),0.5);
				float3 desaturateInitialColor9_g1679 = ( ( saturate( lerpBlendMode51_g1677 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1679 = dot( desaturateInitialColor9_g1679, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1679 = lerp( desaturateInitialColor9_g1679, desaturateDot9_g1679.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1670 = i.ase_color.r;
				float dotResult46_g1665 = dot( ifLocalVar9_g1665 , normalizedWorldNormal );
				float temp_output_36_0_g1668 = ( ( dotResult46_g1665 + _GlobalLightPush ) * i.ase_color.r );
				float ILMG574 = break292.y;
				float temp_output_1_0_g1668 = ILMG574;
				float NdL20_g1670 = ( temp_output_36_0_g1668 * temp_output_1_0_g1668 );
				float temp_output_9_0_g1670 = _Shadow1Push;
				float temp_output_11_0_g1670 = _Shadow2Push;
				float clampResult15_g1670 = clamp( temp_output_9_0_g1670 , temp_output_11_0_g1670 , temp_output_9_0_g1670 );
				float RealShadow1Push16_g1670 = clampResult15_g1670;
				float clampResult17_g1670 = clamp( temp_output_11_0_g1670 , temp_output_11_0_g1670 , temp_output_9_0_g1670 );
				float RealShadow2Push18_g1670 = clampResult17_g1670;
				float temp_output_42_0_g1670 = max( max( ( 1.0 - ( VertexR33_g1670 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , ( NdL20_g1670 < RealShadow2Push18_g1670 ? 1.0 : 0.0 ) ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1670 = ( max( ( 1.0 - ( VertexR33_g1670 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( ( NdL20_g1670 < RealShadow1Push16_g1670 ? 1.0 : 0.0 ) , ( RealShadow1Push16_g1670 >= RealShadow2Push18_g1670 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1670 );
				float3 lerpResult100_g1677 = lerp( desaturateVar9_g1681 , desaturateVar9_g1679 , ( 1.0 - temp_output_43_0_g1670 ));
				float clampResult90_g1670 = clamp( ( 1.0 - ( temp_output_43_0_g1670 + temp_output_42_0_g1670 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1677 = clampResult90_g1670;
				float4 lerpResult101_g1677 = lerp( float4( desaturateVar9_g1678 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1677 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1677 ));
				float EnableRimlight82_g1670 = _EnableRimlight;
				float dotResult31_g1665 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1665 );
				float BaseA580 = tex2DNode296.a;
				float NdV48_g1670 = ( ( 1.0 - ( dotResult31_g1665 + ( 1.0 - _RimlightSize ) ) ) * BaseA580 );
				float clampResult91_g1670 = clamp( temp_output_42_0_g1670 , 0.0 , 1.0 );
				float clampResult88_g1670 = clamp( ( ceil( ( ( NdV48_g1670 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1670 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1670 = ( EnableRimlight82_g1670 == 1.0 ? clampResult88_g1670 : 0.0 );
				float3 desaturateInitialColor9_g1682 = ( ( Base12_g1677 * temp_output_94_0_g1670 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1682 = dot( desaturateInitialColor9_g1682, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1682 = lerp( desaturateInitialColor9_g1682, desaturateDot9_g1682.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1677 + float4( desaturateVar9_g1682 , 0.0 ) );
				float4 temp_output_1_0_g1686 = ColorOut1025;
				float4 lerpResult8_g1686 = lerp( DetailColor1072 , temp_output_1_0_g1686 , Detail1066);
				float4 temp_output_9_0_g1686 = ( DetailColorSetting1070 == 2.0 ? lerpResult8_g1686 : temp_output_1_0_g1686 );
				float4 lerpResult10_g1686 = lerp( ILMAColor1005 , temp_output_9_0_g1686 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1683 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1683 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1683 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_43 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_44 = (5.0).xxxx;
				float4 clampResult18_g1683 = clamp( ase_lightColor , temp_cast_43 , temp_cast_44 );
				float4 temp_output_11_0_g1683 = ( ase_atten * clampResult18_g1683 );
				float4 temp_output_8_0_g1683 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1683 = 0;
				if( ifLocalVar13_g1683 > 0.0 )
				ifLocalVar3_g1683 = temp_output_11_0_g1683;
				else if( ifLocalVar13_g1683 == 0.0 )
				ifLocalVar3_g1683 = temp_output_8_0_g1683;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1683 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1683 );
				#else
				float4 staticSwitch9_g1683 = ifLocalVar3_g1683;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1683;
				float temp_output_12_0_g1676 = ( ( ( temp_output_94_0_g1670 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1670 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1670 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1670 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1670 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float SSSA581 = tex2DNode297.a;
				float temp_output_28_0_g1676 = ( _SSSAlphaEmissiveToggle * ( SSSA581 >= 0.5 ? _SSSAlphaEmissiveIntensity : 0.0 ) );
				float clampResult30_g1676 = clamp( ( temp_output_12_0_g1676 - temp_output_28_0_g1676 ) , 0.0 , temp_output_12_0_g1676 );
				float EmissionRampMask920 = ( clampResult30_g1676 + temp_output_28_0_g1676 );
				float4 temp_cast_45 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1683 = 0;
				if( ifLocalVar13_g1683 > 0.0 )
				ifLocalVar17_g1683 = clampResult18_g1683;
				else if( ifLocalVar13_g1683 == 0.0 )
				ifLocalVar17_g1683 = temp_output_8_0_g1683;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1683 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1683 = max( temp_cast_45 , ifLocalVar17_g1683 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1683;
				float4 lerpResult1169 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult10_g1686 : temp_output_9_0_g1686 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1687 = _DebugGroup;
				float temp_output_47_0_g1687 = _VertexChannel;
				float4 temp_output_59_0_g1687 = _DebugColor;
				float temp_output_50_0_g1687 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1687 = appendResult1031;
				float4 break7_g1687 = temp_output_54_0_g1687;
				float temp_output_57_0_g1687 = _BaseSSSAlphaSwap;
				float4 Debug987 = ( temp_output_48_0_g1687 == 0.0 ? ( temp_output_47_0_g1687 == 0.0 ? i.ase_color : ( temp_output_47_0_g1687 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1687 == 1.0 ? ( temp_output_50_0_g1687 == 0.0 ? temp_output_54_0_g1687 : ( temp_output_50_0_g1687 == 1.0 ? ( break7_g1687.r * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 2.0 ? ( break7_g1687.g * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 3.0 ? ( break7_g1687.b * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 4.0 ? ( break7_g1687.a * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1687 == 2.0 ? ( temp_output_57_0_g1687 == 0.0 ? ( BaseA580 * temp_output_59_0_g1687 ) : ( temp_output_57_0_g1687 == 1.0 ? ( SSSA581 * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1169 : Debug987 ).rgb;
				outAlpha = 1;
				clip(outAlpha);
				return float4(outColor,outAlpha);
			}
			ENDCG
		}

		
		Pass
		{
			Name "ForwardAdd"
			Tags { "LightMode"="ForwardAdd" }
			ZWrite Off
			Blend One One
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdadd_fullshadows
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"
			#include "UnityStandardBRDF.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_SHADOWS 1

			//This is a late directive
			
			uniform float _PassFront;
			uniform float _ZTestMode;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _Comparison;
			uniform float _ZFailFront;
			uniform float _Units;
			uniform float _EditorVersion;
			uniform float _Opacity;
			uniform float _FailFront;
			uniform float _WriteMask;
			uniform float _ZWriteMode;
			uniform float _Reference;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableColorReplacer;
			uniform sampler2D _Base;
			uniform float4 _Base_ST;
			uniform sampler2D _SSS;
			uniform float4 _SSS_ST;
			uniform float _TotalReplacements;
			uniform float4 _Target5Color;
			uniform float4 _Target4Color;
			uniform float4 _Target3Color;
			uniform float4 _Target2Color;
			uniform float4 _Target1Color;
			uniform float _Source1Fuzziness;
			uniform float4 _Source1Color;
			uniform float _Source2Fuzziness;
			uniform float4 _Source2Color;
			uniform float _Source3Fuzziness;
			uniform float4 _Source3Color;
			uniform float _Source4Fuzziness;
			uniform float4 _Source4Color;
			uniform float _Source5Fuzziness;
			uniform float4 _Source5Color;
			uniform float _SSSHueShift5;
			uniform float _SSSHueShift4;
			uniform float _SSSHueShift3;
			uniform float _SSSHueShift2;
			uniform float _SSSHueShift1;
			uniform sampler2D _Detail;
			uniform float4 _Detail_ST;
			uniform sampler2D _OLM;
			uniform float4 _OLM_ST;
			uniform float _LightDirectionSetting;
			uniform float _FallbackLightDirection;
			uniform float _ViewDirOffsetPitch;
			uniform float _ViewDirOffsetYaw;
			uniform float _FakeLightDirX;
			uniform float _FakeLightDirY;
			uniform float _SpecularSize;
			uniform float _SpecularIntensity;
			uniform float4 _SpecularTint;
			uniform float _SpecularSaturation;
			uniform float4 _LightColor;
			uniform float _BaseIntensity;
			uniform float4 _BaseTint;
			uniform float _BaseSaturation;
			uniform float4 _AmbientColor;
			uniform float _Shadow1Intensity;
			uniform float4 _Shadow1Tint;
			uniform float _Shadow1Saturation;
			uniform float _Shadow2Intensity;
			uniform float4 _Shadow2Tint;
			uniform float _Shadow2Saturation;
			uniform float _Shadow1VertexRThreshold;
			uniform float _GlobalLightPush;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _PermanentShadowThreshold;
			uniform float _EnableRimlight;
			uniform float _RimlightSize;
			uniform float _RimlightIntensity;
			uniform float4 _RimlightTint;
			uniform float _RimlightSaturation;
			uniform float _LightColorSetting;
			uniform float _MinimumGlobalLightIntensity;
			uniform float4 _FakeGlobalLightColor;
			uniform float _FakeGlobalLightIntensity;
			uniform float _EmissionIntensity;
			uniform float _RimlightEmissiveToggle;
			uniform float _RimlightEmissionIntensity;
			uniform float _SpecularEmissiveToggle;
			uniform float _SpecularEmissionIntensity;
			uniform float _BaseEmissiveToggle;
			uniform float _BaseEmissionIntensity;
			uniform float _Shadow1EmissiveToggle;
			uniform float _Shadow1EmissionIntensity;
			uniform float _Shadow2EmissiveToggle;
			uniform float _Shadow2EmissionIntensity;
			uniform float _ILMAlphaEmissionIntensity;
			uniform float _ILMAlphaLinesEmissionToggle;
			uniform float _SSSAlphaEmissiveToggle;
			uniform float _SSSAlphaEmissiveIntensity;
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
			uniform float _BaseSSSAlphaSwap;
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 ViewMatrix0375_g1667(  )
			{
				return UNITY_MATRIX_V[0];
			}
			
			float3 ViewMatrix1373_g1667(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 StereoCameraViewPosition30_g1665(  )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				return cameraPos;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 StereoCameraViewDirection32_g1665( float3 worldPos )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				float3 worldViewDir = normalize((cameraPos - worldPos));
				return worldViewDir;
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_SHADOW_COORDS(4)
			};

			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord1.zw = v.ase_texcoord1.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				#if ASE_SHADOWS
					#if UNITY_VERSION >= 560
						UNITY_TRANSFER_SHADOW( o, v.texcoord );
					#else
						TRANSFER_SHADOW( o );
					#endif
				#endif
				return o;
			}

			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float ILMColorSetting1007 = _ILMColorSetting;
				float4 ILMAColor1005 = _ILMAlphaColor;
				float DetailColorSetting1070 = _DetailColorSetting;
				float4 DetailColor1072 = _BodyLinesColor;
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float ILMColorSetting60_g1669 = ILMColorSetting1007;
				float4 ILMAColor54_g1669 = ILMAColor1005;
				float DetailColorSetting44_g1669 = DetailColorSetting1070;
				float4 DetailColor41_g1669 = DetailColor1072;
				float2 uv_Base = i.ase_texcoord1.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1659 = _TotalReplacements;
				float4 break8_g1664 = _Target5Color;
				float4 break8_g1660 = _Target4Color;
				float4 break8_g1662 = _Target3Color;
				float4 break8_g1661 = _Target2Color;
				float4 break8_g1663 = _Target1Color;
				float3x3 temp_output_67_0_g1659 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1663 = float4( temp_output_67_0_g1659[0] , 0.0 );
				float4 break6_g1663 = temp_output_13_0_g1663;
				float4 appendResult3_g1663 = (float4(break8_g1663.r , break8_g1663.g , break8_g1663.b , break6_g1663.a));
				float4 appendResult7_g1663 = (float4(break6_g1663.r , break6_g1663.g , break6_g1663.b , 1.0));
				float smoothstepResult5_g1663 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1663 , _Source1Color ));
				float4 lerpResult4_g1663 = lerp( appendResult3_g1663 , temp_output_13_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_106_0_g1659 = lerpResult4_g1663;
				float4 temp_output_13_0_g1661 = temp_output_106_0_g1659;
				float4 break6_g1661 = temp_output_13_0_g1661;
				float4 appendResult3_g1661 = (float4(break8_g1661.r , break8_g1661.g , break8_g1661.b , break6_g1661.a));
				float4 appendResult7_g1661 = (float4(break6_g1661.r , break6_g1661.g , break6_g1661.b , 1.0));
				float smoothstepResult5_g1661 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1661 , _Source2Color ));
				float4 lerpResult4_g1661 = lerp( appendResult3_g1661 , temp_output_13_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_102_0_g1659 = lerpResult4_g1661;
				float4 temp_output_13_0_g1662 = temp_output_102_0_g1659;
				float4 break6_g1662 = temp_output_13_0_g1662;
				float4 appendResult3_g1662 = (float4(break8_g1662.r , break8_g1662.g , break8_g1662.b , break6_g1662.a));
				float4 appendResult7_g1662 = (float4(break6_g1662.r , break6_g1662.g , break6_g1662.b , 1.0));
				float smoothstepResult5_g1662 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1662 , _Source3Color ));
				float4 lerpResult4_g1662 = lerp( appendResult3_g1662 , temp_output_13_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_104_0_g1659 = lerpResult4_g1662;
				float4 temp_output_13_0_g1660 = temp_output_104_0_g1659;
				float4 break6_g1660 = temp_output_13_0_g1660;
				float4 appendResult3_g1660 = (float4(break8_g1660.r , break8_g1660.g , break8_g1660.b , break6_g1660.a));
				float4 appendResult7_g1660 = (float4(break6_g1660.r , break6_g1660.g , break6_g1660.b , 1.0));
				float smoothstepResult5_g1660 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1660 , _Source4Color ));
				float4 lerpResult4_g1660 = lerp( appendResult3_g1660 , temp_output_13_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_105_0_g1659 = lerpResult4_g1660;
				float4 temp_output_13_0_g1664 = temp_output_105_0_g1659;
				float4 break6_g1664 = temp_output_13_0_g1664;
				float4 appendResult3_g1664 = (float4(break8_g1664.r , break8_g1664.g , break8_g1664.b , break6_g1664.a));
				float4 appendResult7_g1664 = (float4(break6_g1664.r , break6_g1664.g , break6_g1664.b , 1.0));
				float smoothstepResult5_g1664 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1664 , _Source5Color ));
				float4 lerpResult4_g1664 = lerp( appendResult3_g1664 , temp_output_13_0_g1664 , smoothstepResult5_g1664);
				float4 temp_output_15_0_g1663 = float4( temp_output_67_0_g1659[1] , 0.0 );
				float3 hsvTorgb25_g1663 = RGBToHSV( temp_output_15_0_g1663.rgb );
				float3 hsvTorgb26_g1663 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1663.x ),hsvTorgb25_g1663.y,hsvTorgb25_g1663.z) );
				float4 appendResult18_g1663 = (float4(hsvTorgb26_g1663 , temp_output_15_0_g1663.a));
				float4 lerpResult19_g1663 = lerp( appendResult18_g1663 , temp_output_15_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_15_0_g1661 = lerpResult19_g1663;
				float3 hsvTorgb25_g1661 = RGBToHSV( temp_output_15_0_g1661.rgb );
				float3 hsvTorgb26_g1661 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1661.x ),hsvTorgb25_g1661.y,hsvTorgb25_g1661.z) );
				float4 appendResult18_g1661 = (float4(hsvTorgb26_g1661 , temp_output_15_0_g1661.a));
				float4 lerpResult19_g1661 = lerp( appendResult18_g1661 , temp_output_15_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_15_0_g1662 = lerpResult19_g1661;
				float3 hsvTorgb25_g1662 = RGBToHSV( temp_output_15_0_g1662.rgb );
				float3 hsvTorgb26_g1662 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1662.x ),hsvTorgb25_g1662.y,hsvTorgb25_g1662.z) );
				float4 appendResult18_g1662 = (float4(hsvTorgb26_g1662 , temp_output_15_0_g1662.a));
				float4 lerpResult19_g1662 = lerp( appendResult18_g1662 , temp_output_15_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_15_0_g1660 = lerpResult19_g1662;
				float3 hsvTorgb25_g1660 = RGBToHSV( temp_output_15_0_g1660.rgb );
				float3 hsvTorgb26_g1660 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1660.x ),hsvTorgb25_g1660.y,hsvTorgb25_g1660.z) );
				float4 appendResult18_g1660 = (float4(hsvTorgb26_g1660 , temp_output_15_0_g1660.a));
				float4 lerpResult19_g1660 = lerp( appendResult18_g1660 , temp_output_15_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_15_0_g1664 = lerpResult19_g1660;
				float3 hsvTorgb25_g1664 = RGBToHSV( temp_output_15_0_g1664.rgb );
				float3 hsvTorgb26_g1664 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1664.x ),hsvTorgb25_g1664.y,hsvTorgb25_g1664.z) );
				float4 appendResult18_g1664 = (float4(hsvTorgb26_g1664 , temp_output_15_0_g1664.a));
				float4 lerpResult19_g1664 = lerp( appendResult18_g1664 , temp_output_15_0_g1664 , smoothstepResult5_g1664);
				float3x3 temp_output_24_0_g1669 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1659 == 5.0 ? lerpResult4_g1664 : ( temp_output_52_0_g1659 == 4.0 ? temp_output_105_0_g1659 : ( temp_output_52_0_g1659 == 3.0 ? temp_output_104_0_g1659 : ( temp_output_52_0_g1659 == 2.0 ? temp_output_102_0_g1659 : ( temp_output_52_0_g1659 == 1.0 ? temp_output_106_0_g1659 : float4( temp_output_67_0_g1659[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1664.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1066 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1669 = Detail1066;
				float4 lerpResult10_g1669 = lerp( DetailColor41_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float3 SSS50_g1669 = temp_output_24_0_g1669[1];
				float2 uv_OLM = i.ase_texcoord1.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1117 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1669 = OLM1117;
				float4 SSSOLM63_g1669 = ( float4( SSS50_g1669 , 0.0 ) * OLM47_g1669 );
				float4 lerpResult36_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float4 temp_output_20_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult10_g1669 : lerpResult36_g1669 );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1669 = ILMA357;
				float4 lerpResult12_g1669 = lerp( ILMAColor54_g1669 , temp_output_20_0_g1669 , ILMA57_g1669);
				float4 lerpResult65_g1669 = lerp( SSSOLM63_g1669 , temp_output_20_0_g1669 , ILMA57_g1669);
				float4 Base339 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult12_g1669 : lerpResult65_g1669 );
				float4 Base12_g1677 = Base339;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix0375_g1667 = ViewMatrix0375_g1667();
				float3 normalizeResult384_g1667 = normalize( localViewMatrix0375_g1667 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 temp_output_380_0_g1667 = ( float3( 0,0,0 ) + ase_worldPos );
				float3 localViewMatrix1373_g1667 = ViewMatrix1373_g1667();
				float3 normalizeResult376_g1667 = normalize( localViewMatrix1373_g1667 );
				float3 localStereoCameraViewPosition30_g1665 = StereoCameraViewPosition30_g1665();
				float3 rotatedValue385_g1667 = RotateAroundAxis( temp_output_380_0_g1667, localStereoCameraViewPosition30_g1665, normalizeResult376_g1667, radians( ( _ViewDirOffsetYaw * -1.0 ) ) );
				float3 rotatedValue387_g1667 = RotateAroundAxis( temp_output_380_0_g1667, rotatedValue385_g1667, normalize( normalizeResult384_g1667 ), radians( ( _ViewDirOffsetPitch * 1.0 ) ) );
				float3 normalizeResult389_g1667 = normalize( ( rotatedValue387_g1667 - temp_output_380_0_g1667 ) );
				float3 normalizeResult38_g1665 = normalize( normalizeResult389_g1667 );
				float3 appendResult15_g1666 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1666 = normalize( appendResult15_g1666 );
				float3 normalizeResult26_g1665 = normalize( normalizeResult2_g1666 );
				float3 ifLocalVar3_g1665 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1665 = normalizeResult38_g1665;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1665 = normalizeResult26_g1665;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1631 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1631 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1631 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1631 = color8_g1631;
				#else
				float4 staticSwitch9_g1631 = ( clampResult7_g1631 * color14_g1631 );
				#endif
				float4 break10_g1631 = staticSwitch9_g1631;
				float IsThereWorldLight450 = break10_g1631.r;
				float3 ifLocalVar8_g1665 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1665 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1665 = ifLocalVar3_g1665;
				float3 ifLocalVar9_g1665 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1665 = ifLocalVar3_g1665;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1665 = ifLocalVar8_g1665;
				float3 normalizeResult48_g1665 = normalize( ifLocalVar9_g1665 );
				float3 worldPos32_g1665 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1665 = StereoCameraViewDirection32_g1665( worldPos32_g1665 );
				float3 normalizeResult51_g1665 = normalize( ( normalizeResult48_g1665 + localStereoCameraViewDirection32_g1665 ) );
				float dotResult50_g1665 = dot( normalizedWorldNormal , normalizeResult51_g1665 );
				float blendOpSrc34_g1668 = ILMB576;
				float blendOpDest34_g1668 = dotResult50_g1665;
				float clampResult87_g1670 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1668) / max( blendOpSrc34_g1668, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_29 = (clampResult87_g1670).xxxx;
				float4 blendOpSrc30_g1677 = Base12_g1677;
				float4 blendOpDest30_g1677 = temp_cast_29;
				float4 lerpBlendMode30_g1677 = lerp(blendOpDest30_g1677,min( blendOpSrc30_g1677 , blendOpDest30_g1677 ),0.9);
				float3 desaturateInitialColor9_g1680 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1677 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1680 = dot( desaturateInitialColor9_g1680, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1680 = lerp( desaturateInitialColor9_g1680, desaturateDot9_g1680.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 temp_output_95_0_g1677 = ( float4( desaturateVar9_g1680 , 0.0 ) + Base12_g1677 );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1678 = ( temp_output_95_0_g1677 * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1678 = dot( desaturateInitialColor9_g1678, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1678 = lerp( desaturateInitialColor9_g1678, desaturateDot9_g1678.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 Base52_g1669 = temp_output_24_0_g1669[0];
				float3 blendOpSrc31_g1669 = Base52_g1669;
				float3 blendOpDest31_g1669 = temp_output_24_0_g1669[1];
				float4 lerpResult7_g1669 = lerp( ( DetailColor41_g1669 * float4( ( saturate( abs( blendOpSrc31_g1669 - blendOpDest31_g1669 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 lerpResult69_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 temp_output_8_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult7_g1669 : lerpResult69_g1669 );
				float4 blendOpSrc32_g1669 = temp_output_20_0_g1669;
				float4 blendOpDest32_g1669 = temp_output_8_0_g1669;
				float4 lerpResult17_g1669 = lerp( ( ILMAColor54_g1669 * ( saturate( abs( blendOpSrc32_g1669 - blendOpDest32_g1669 ) )) ) , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 lerpResult67_g1669 = lerp( SSSOLM63_g1669 , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 SSS578 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult17_g1669 : lerpResult67_g1669 );
				float4 SSS14_g1677 = SSS578;
				float3 desaturateInitialColor9_g1681 = ( SSS14_g1677 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1681 = dot( desaturateInitialColor9_g1681, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1681 = lerp( desaturateInitialColor9_g1681, desaturateDot9_g1681.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc51_g1677 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1677 = ( temp_output_95_0_g1677 * SSS14_g1677 );
				float4 lerpBlendMode51_g1677 = lerp(blendOpDest51_g1677,2.0f*blendOpDest51_g1677*blendOpSrc51_g1677 + blendOpDest51_g1677*blendOpDest51_g1677*(1.0f - 2.0f*blendOpSrc51_g1677),0.5);
				float3 desaturateInitialColor9_g1679 = ( ( saturate( lerpBlendMode51_g1677 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1679 = dot( desaturateInitialColor9_g1679, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1679 = lerp( desaturateInitialColor9_g1679, desaturateDot9_g1679.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1670 = i.ase_color.r;
				float dotResult46_g1665 = dot( ifLocalVar9_g1665 , normalizedWorldNormal );
				float temp_output_36_0_g1668 = ( ( dotResult46_g1665 + _GlobalLightPush ) * i.ase_color.r );
				float ILMG574 = break292.y;
				float temp_output_1_0_g1668 = ILMG574;
				float NdL20_g1670 = ( temp_output_36_0_g1668 * temp_output_1_0_g1668 );
				float temp_output_9_0_g1670 = _Shadow1Push;
				float temp_output_11_0_g1670 = _Shadow2Push;
				float clampResult15_g1670 = clamp( temp_output_9_0_g1670 , temp_output_11_0_g1670 , temp_output_9_0_g1670 );
				float RealShadow1Push16_g1670 = clampResult15_g1670;
				float clampResult17_g1670 = clamp( temp_output_11_0_g1670 , temp_output_11_0_g1670 , temp_output_9_0_g1670 );
				float RealShadow2Push18_g1670 = clampResult17_g1670;
				float temp_output_42_0_g1670 = max( max( ( 1.0 - ( VertexR33_g1670 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , ( NdL20_g1670 < RealShadow2Push18_g1670 ? 1.0 : 0.0 ) ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1670 = ( max( ( 1.0 - ( VertexR33_g1670 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( ( NdL20_g1670 < RealShadow1Push16_g1670 ? 1.0 : 0.0 ) , ( RealShadow1Push16_g1670 >= RealShadow2Push18_g1670 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1670 );
				float3 lerpResult100_g1677 = lerp( desaturateVar9_g1681 , desaturateVar9_g1679 , ( 1.0 - temp_output_43_0_g1670 ));
				float clampResult90_g1670 = clamp( ( 1.0 - ( temp_output_43_0_g1670 + temp_output_42_0_g1670 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1677 = clampResult90_g1670;
				float4 lerpResult101_g1677 = lerp( float4( desaturateVar9_g1678 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1677 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1677 ));
				float EnableRimlight82_g1670 = _EnableRimlight;
				float dotResult31_g1665 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1665 );
				float BaseA580 = tex2DNode296.a;
				float NdV48_g1670 = ( ( 1.0 - ( dotResult31_g1665 + ( 1.0 - _RimlightSize ) ) ) * BaseA580 );
				float clampResult91_g1670 = clamp( temp_output_42_0_g1670 , 0.0 , 1.0 );
				float clampResult88_g1670 = clamp( ( ceil( ( ( NdV48_g1670 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1670 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1670 = ( EnableRimlight82_g1670 == 1.0 ? clampResult88_g1670 : 0.0 );
				float3 desaturateInitialColor9_g1682 = ( ( Base12_g1677 * temp_output_94_0_g1670 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1682 = dot( desaturateInitialColor9_g1682, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1682 = lerp( desaturateInitialColor9_g1682, desaturateDot9_g1682.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1677 + float4( desaturateVar9_g1682 , 0.0 ) );
				float4 temp_output_1_0_g1686 = ColorOut1025;
				float4 lerpResult8_g1686 = lerp( DetailColor1072 , temp_output_1_0_g1686 , Detail1066);
				float4 temp_output_9_0_g1686 = ( DetailColorSetting1070 == 2.0 ? lerpResult8_g1686 : temp_output_1_0_g1686 );
				float4 lerpResult10_g1686 = lerp( ILMAColor1005 , temp_output_9_0_g1686 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1683 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1683 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1683 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_43 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_44 = (5.0).xxxx;
				float4 clampResult18_g1683 = clamp( ase_lightColor , temp_cast_43 , temp_cast_44 );
				float4 temp_output_11_0_g1683 = ( ase_atten * clampResult18_g1683 );
				float4 temp_output_8_0_g1683 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1683 = 0;
				if( ifLocalVar13_g1683 > 0.0 )
				ifLocalVar3_g1683 = temp_output_11_0_g1683;
				else if( ifLocalVar13_g1683 == 0.0 )
				ifLocalVar3_g1683 = temp_output_8_0_g1683;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1683 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1683 );
				#else
				float4 staticSwitch9_g1683 = ifLocalVar3_g1683;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1683;
				float temp_output_12_0_g1676 = ( ( ( temp_output_94_0_g1670 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1670 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1670 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1670 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1670 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float SSSA581 = tex2DNode297.a;
				float temp_output_28_0_g1676 = ( _SSSAlphaEmissiveToggle * ( SSSA581 >= 0.5 ? _SSSAlphaEmissiveIntensity : 0.0 ) );
				float clampResult30_g1676 = clamp( ( temp_output_12_0_g1676 - temp_output_28_0_g1676 ) , 0.0 , temp_output_12_0_g1676 );
				float EmissionRampMask920 = ( clampResult30_g1676 + temp_output_28_0_g1676 );
				float4 temp_cast_45 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1683 = 0;
				if( ifLocalVar13_g1683 > 0.0 )
				ifLocalVar17_g1683 = clampResult18_g1683;
				else if( ifLocalVar13_g1683 == 0.0 )
				ifLocalVar17_g1683 = temp_output_8_0_g1683;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1683 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1683 = max( temp_cast_45 , ifLocalVar17_g1683 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1683;
				float4 lerpResult1169 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult10_g1686 : temp_output_9_0_g1686 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1687 = _DebugGroup;
				float temp_output_47_0_g1687 = _VertexChannel;
				float4 temp_output_59_0_g1687 = _DebugColor;
				float temp_output_50_0_g1687 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1687 = appendResult1031;
				float4 break7_g1687 = temp_output_54_0_g1687;
				float temp_output_57_0_g1687 = _BaseSSSAlphaSwap;
				float4 Debug987 = ( temp_output_48_0_g1687 == 0.0 ? ( temp_output_47_0_g1687 == 0.0 ? i.ase_color : ( temp_output_47_0_g1687 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1687 == 1.0 ? ( temp_output_50_0_g1687 == 0.0 ? temp_output_54_0_g1687 : ( temp_output_50_0_g1687 == 1.0 ? ( break7_g1687.r * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 2.0 ? ( break7_g1687.g * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 3.0 ? ( break7_g1687.b * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 4.0 ? ( break7_g1687.a * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1687 == 2.0 ? ( temp_output_57_0_g1687 == 0.0 ? ( BaseA580 * temp_output_59_0_g1687 ) : ( temp_output_57_0_g1687 == 1.0 ? ( SSSA581 * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1169 : Debug987 ).rgb;
				outAlpha = 1;
				clip(outAlpha);
				return float4(outColor,outAlpha);
			}
			ENDCG
		}

		
		Pass
		{
			Name "Outline"
			Tags { "CullMode"="Front" }
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend SrcAlpha OneMinusSrcAlpha
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
				float4 ase_texcoord1 : TEXCOORD1;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
			};

			uniform float _PassFront;
			uniform float _ZTestMode;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _Comparison;
			uniform float _ZFailFront;
			uniform float _Units;
			uniform float _EditorVersion;
			uniform float _Opacity;
			uniform float _FailFront;
			uniform float _WriteMask;
			uniform float _ZWriteMode;
			uniform float _Reference;
			uniform float _EnableCameraDistanceMult;
			uniform float _OutlineThickness;
			uniform float _DepthOffset;
			uniform float _OutlineEnableBaseColorMult;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform float _EnableColorReplacer;
			uniform sampler2D _Base;
			uniform float4 _Base_ST;
			uniform sampler2D _SSS;
			uniform float4 _SSS_ST;
			uniform float _TotalReplacements;
			uniform float4 _Target5Color;
			uniform float4 _Target4Color;
			uniform float4 _Target3Color;
			uniform float4 _Target2Color;
			uniform float4 _Target1Color;
			uniform float _Source1Fuzziness;
			uniform float4 _Source1Color;
			uniform float _Source2Fuzziness;
			uniform float4 _Source2Color;
			uniform float _Source3Fuzziness;
			uniform float4 _Source3Color;
			uniform float _Source4Fuzziness;
			uniform float4 _Source4Color;
			uniform float _Source5Fuzziness;
			uniform float4 _Source5Color;
			uniform float _SSSHueShift5;
			uniform float _SSSHueShift4;
			uniform float _SSSHueShift3;
			uniform float _SSSHueShift2;
			uniform float _SSSHueShift1;
			uniform sampler2D _Detail;
			uniform float4 _Detail_ST;
			uniform sampler2D _OLM;
			uniform float4 _OLM_ST;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float4 _OutlineColor;
			uniform float _OutlineColorIntensity;
			uniform float _EnableOutline;
			inline float4 ASESafeNormalize(float4 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}


			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				float3 objectToViewPos = UnityObjectToViewPos(v.vertex.xyz);
				float eyeDepth = -objectToViewPos.z;
				float temp_output_33_0_g1688 = _OutlineThickness;
				float3 temp_output_135_0_g1688 = ( ( v.ase_normal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.ase_color.g * temp_output_33_0_g1688 ) + temp_output_33_0_g1688 ) * v.ase_color.a ) );
				float3 objectSpaceViewDir136_g1688 = ObjSpaceViewDir( float4( temp_output_135_0_g1688 , 0.0 ) );
				float4 normalizeResult142_g1688 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g1688 , 0.0 ) - v.vertex ) );
				float clampResult141_g1688 = clamp( ( v.ase_color.b + _DepthOffset ) , 0.0 , 1.0 );
				float4 lerpResult145_g1688 = lerp( float4( temp_output_135_0_g1688 , 0.0 ) , -normalizeResult142_g1688 , ( 1.0 - clampResult141_g1688 ));
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord.zw = v.ase_texcoord1.xy;

				v.vertex.xyz += lerpResult145_g1688.xyz;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float4 frag (v2f i ) : SV_Target
			{
				float3 outOutlineColor;
				float outOutlineAlpha;

				float ILMColorSetting1007 = _ILMColorSetting;
				float ILMColorSetting60_g1669 = ILMColorSetting1007;
				float4 ILMAColor1005 = _ILMAlphaColor;
				float4 ILMAColor54_g1669 = ILMAColor1005;
				float DetailColorSetting1070 = _DetailColorSetting;
				float DetailColorSetting44_g1669 = DetailColorSetting1070;
				float4 DetailColor1072 = _BodyLinesColor;
				float4 DetailColor41_g1669 = DetailColor1072;
				float2 uv_Base = i.ase_texcoord.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1659 = _TotalReplacements;
				float4 break8_g1664 = _Target5Color;
				float4 break8_g1660 = _Target4Color;
				float4 break8_g1662 = _Target3Color;
				float4 break8_g1661 = _Target2Color;
				float4 break8_g1663 = _Target1Color;
				float3x3 temp_output_67_0_g1659 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1663 = float4( temp_output_67_0_g1659[0] , 0.0 );
				float4 break6_g1663 = temp_output_13_0_g1663;
				float4 appendResult3_g1663 = (float4(break8_g1663.r , break8_g1663.g , break8_g1663.b , break6_g1663.a));
				float4 appendResult7_g1663 = (float4(break6_g1663.r , break6_g1663.g , break6_g1663.b , 1.0));
				float smoothstepResult5_g1663 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1663 , _Source1Color ));
				float4 lerpResult4_g1663 = lerp( appendResult3_g1663 , temp_output_13_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_106_0_g1659 = lerpResult4_g1663;
				float4 temp_output_13_0_g1661 = temp_output_106_0_g1659;
				float4 break6_g1661 = temp_output_13_0_g1661;
				float4 appendResult3_g1661 = (float4(break8_g1661.r , break8_g1661.g , break8_g1661.b , break6_g1661.a));
				float4 appendResult7_g1661 = (float4(break6_g1661.r , break6_g1661.g , break6_g1661.b , 1.0));
				float smoothstepResult5_g1661 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1661 , _Source2Color ));
				float4 lerpResult4_g1661 = lerp( appendResult3_g1661 , temp_output_13_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_102_0_g1659 = lerpResult4_g1661;
				float4 temp_output_13_0_g1662 = temp_output_102_0_g1659;
				float4 break6_g1662 = temp_output_13_0_g1662;
				float4 appendResult3_g1662 = (float4(break8_g1662.r , break8_g1662.g , break8_g1662.b , break6_g1662.a));
				float4 appendResult7_g1662 = (float4(break6_g1662.r , break6_g1662.g , break6_g1662.b , 1.0));
				float smoothstepResult5_g1662 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1662 , _Source3Color ));
				float4 lerpResult4_g1662 = lerp( appendResult3_g1662 , temp_output_13_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_104_0_g1659 = lerpResult4_g1662;
				float4 temp_output_13_0_g1660 = temp_output_104_0_g1659;
				float4 break6_g1660 = temp_output_13_0_g1660;
				float4 appendResult3_g1660 = (float4(break8_g1660.r , break8_g1660.g , break8_g1660.b , break6_g1660.a));
				float4 appendResult7_g1660 = (float4(break6_g1660.r , break6_g1660.g , break6_g1660.b , 1.0));
				float smoothstepResult5_g1660 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1660 , _Source4Color ));
				float4 lerpResult4_g1660 = lerp( appendResult3_g1660 , temp_output_13_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_105_0_g1659 = lerpResult4_g1660;
				float4 temp_output_13_0_g1664 = temp_output_105_0_g1659;
				float4 break6_g1664 = temp_output_13_0_g1664;
				float4 appendResult3_g1664 = (float4(break8_g1664.r , break8_g1664.g , break8_g1664.b , break6_g1664.a));
				float4 appendResult7_g1664 = (float4(break6_g1664.r , break6_g1664.g , break6_g1664.b , 1.0));
				float smoothstepResult5_g1664 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1664 , _Source5Color ));
				float4 lerpResult4_g1664 = lerp( appendResult3_g1664 , temp_output_13_0_g1664 , smoothstepResult5_g1664);
				float4 temp_output_15_0_g1663 = float4( temp_output_67_0_g1659[1] , 0.0 );
				float3 hsvTorgb25_g1663 = RGBToHSV( temp_output_15_0_g1663.rgb );
				float3 hsvTorgb26_g1663 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1663.x ),hsvTorgb25_g1663.y,hsvTorgb25_g1663.z) );
				float4 appendResult18_g1663 = (float4(hsvTorgb26_g1663 , temp_output_15_0_g1663.a));
				float4 lerpResult19_g1663 = lerp( appendResult18_g1663 , temp_output_15_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_15_0_g1661 = lerpResult19_g1663;
				float3 hsvTorgb25_g1661 = RGBToHSV( temp_output_15_0_g1661.rgb );
				float3 hsvTorgb26_g1661 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1661.x ),hsvTorgb25_g1661.y,hsvTorgb25_g1661.z) );
				float4 appendResult18_g1661 = (float4(hsvTorgb26_g1661 , temp_output_15_0_g1661.a));
				float4 lerpResult19_g1661 = lerp( appendResult18_g1661 , temp_output_15_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_15_0_g1662 = lerpResult19_g1661;
				float3 hsvTorgb25_g1662 = RGBToHSV( temp_output_15_0_g1662.rgb );
				float3 hsvTorgb26_g1662 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1662.x ),hsvTorgb25_g1662.y,hsvTorgb25_g1662.z) );
				float4 appendResult18_g1662 = (float4(hsvTorgb26_g1662 , temp_output_15_0_g1662.a));
				float4 lerpResult19_g1662 = lerp( appendResult18_g1662 , temp_output_15_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_15_0_g1660 = lerpResult19_g1662;
				float3 hsvTorgb25_g1660 = RGBToHSV( temp_output_15_0_g1660.rgb );
				float3 hsvTorgb26_g1660 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1660.x ),hsvTorgb25_g1660.y,hsvTorgb25_g1660.z) );
				float4 appendResult18_g1660 = (float4(hsvTorgb26_g1660 , temp_output_15_0_g1660.a));
				float4 lerpResult19_g1660 = lerp( appendResult18_g1660 , temp_output_15_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_15_0_g1664 = lerpResult19_g1660;
				float3 hsvTorgb25_g1664 = RGBToHSV( temp_output_15_0_g1664.rgb );
				float3 hsvTorgb26_g1664 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1664.x ),hsvTorgb25_g1664.y,hsvTorgb25_g1664.z) );
				float4 appendResult18_g1664 = (float4(hsvTorgb26_g1664 , temp_output_15_0_g1664.a));
				float4 lerpResult19_g1664 = lerp( appendResult18_g1664 , temp_output_15_0_g1664 , smoothstepResult5_g1664);
				float3x3 temp_output_24_0_g1669 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1659 == 5.0 ? lerpResult4_g1664 : ( temp_output_52_0_g1659 == 4.0 ? temp_output_105_0_g1659 : ( temp_output_52_0_g1659 == 3.0 ? temp_output_104_0_g1659 : ( temp_output_52_0_g1659 == 2.0 ? temp_output_102_0_g1659 : ( temp_output_52_0_g1659 == 1.0 ? temp_output_106_0_g1659 : float4( temp_output_67_0_g1659[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1664.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1066 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1669 = Detail1066;
				float4 lerpResult10_g1669 = lerp( DetailColor41_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float3 SSS50_g1669 = temp_output_24_0_g1669[1];
				float2 uv_OLM = i.ase_texcoord.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1117 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1669 = OLM1117;
				float4 SSSOLM63_g1669 = ( float4( SSS50_g1669 , 0.0 ) * OLM47_g1669 );
				float4 lerpResult36_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float4 temp_output_20_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult10_g1669 : lerpResult36_g1669 );
				float3 Base52_g1669 = temp_output_24_0_g1669[0];
				float3 blendOpSrc31_g1669 = Base52_g1669;
				float3 blendOpDest31_g1669 = temp_output_24_0_g1669[1];
				float4 lerpResult7_g1669 = lerp( ( DetailColor41_g1669 * float4( ( saturate( abs( blendOpSrc31_g1669 - blendOpDest31_g1669 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 lerpResult69_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 temp_output_8_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult7_g1669 : lerpResult69_g1669 );
				float4 blendOpSrc32_g1669 = temp_output_20_0_g1669;
				float4 blendOpDest32_g1669 = temp_output_8_0_g1669;
				float2 uv_ILM = i.ase_texcoord.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1669 = ILMA357;
				float4 lerpResult17_g1669 = lerp( ( ILMAColor54_g1669 * ( saturate( abs( blendOpSrc32_g1669 - blendOpDest32_g1669 ) )) ) , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 lerpResult67_g1669 = lerp( SSSOLM63_g1669 , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 SSS578 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult17_g1669 : lerpResult67_g1669 );
				

				outOutlineColor = ( ( _OutlineEnableBaseColorMult > 0.0 ? ( SSS578 * OLM1117 ) : _OutlineColor ) * _OutlineColorIntensity ).rgb;
				outOutlineAlpha = _EnableOutline;
				clip(outOutlineAlpha);
				return float4(outOutlineColor,outOutlineAlpha);
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite [_ZWriteMode]
			ZTest [_ZTestMode]
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_shadowcaster
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"
			#include "UnityStandardBRDF.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_SHADOWS 1

			//This is a late directive
			
			uniform float _PassFront;
			uniform float _ZTestMode;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _Comparison;
			uniform float _ZFailFront;
			uniform float _Units;
			uniform float _EditorVersion;
			uniform float _Opacity;
			uniform float _FailFront;
			uniform float _WriteMask;
			uniform float _ZWriteMode;
			uniform float _Reference;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableColorReplacer;
			uniform sampler2D _Base;
			uniform float4 _Base_ST;
			uniform sampler2D _SSS;
			uniform float4 _SSS_ST;
			uniform float _TotalReplacements;
			uniform float4 _Target5Color;
			uniform float4 _Target4Color;
			uniform float4 _Target3Color;
			uniform float4 _Target2Color;
			uniform float4 _Target1Color;
			uniform float _Source1Fuzziness;
			uniform float4 _Source1Color;
			uniform float _Source2Fuzziness;
			uniform float4 _Source2Color;
			uniform float _Source3Fuzziness;
			uniform float4 _Source3Color;
			uniform float _Source4Fuzziness;
			uniform float4 _Source4Color;
			uniform float _Source5Fuzziness;
			uniform float4 _Source5Color;
			uniform float _SSSHueShift5;
			uniform float _SSSHueShift4;
			uniform float _SSSHueShift3;
			uniform float _SSSHueShift2;
			uniform float _SSSHueShift1;
			uniform sampler2D _Detail;
			uniform float4 _Detail_ST;
			uniform sampler2D _OLM;
			uniform float4 _OLM_ST;
			uniform float _LightDirectionSetting;
			uniform float _FallbackLightDirection;
			uniform float _ViewDirOffsetPitch;
			uniform float _ViewDirOffsetYaw;
			uniform float _FakeLightDirX;
			uniform float _FakeLightDirY;
			uniform float _SpecularSize;
			uniform float _SpecularIntensity;
			uniform float4 _SpecularTint;
			uniform float _SpecularSaturation;
			uniform float4 _LightColor;
			uniform float _BaseIntensity;
			uniform float4 _BaseTint;
			uniform float _BaseSaturation;
			uniform float4 _AmbientColor;
			uniform float _Shadow1Intensity;
			uniform float4 _Shadow1Tint;
			uniform float _Shadow1Saturation;
			uniform float _Shadow2Intensity;
			uniform float4 _Shadow2Tint;
			uniform float _Shadow2Saturation;
			uniform float _Shadow1VertexRThreshold;
			uniform float _GlobalLightPush;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _PermanentShadowThreshold;
			uniform float _EnableRimlight;
			uniform float _RimlightSize;
			uniform float _RimlightIntensity;
			uniform float4 _RimlightTint;
			uniform float _RimlightSaturation;
			uniform float _LightColorSetting;
			uniform float _MinimumGlobalLightIntensity;
			uniform float4 _FakeGlobalLightColor;
			uniform float _FakeGlobalLightIntensity;
			uniform float _EmissionIntensity;
			uniform float _RimlightEmissiveToggle;
			uniform float _RimlightEmissionIntensity;
			uniform float _SpecularEmissiveToggle;
			uniform float _SpecularEmissionIntensity;
			uniform float _BaseEmissiveToggle;
			uniform float _BaseEmissionIntensity;
			uniform float _Shadow1EmissiveToggle;
			uniform float _Shadow1EmissionIntensity;
			uniform float _Shadow2EmissiveToggle;
			uniform float _Shadow2EmissionIntensity;
			uniform float _ILMAlphaEmissionIntensity;
			uniform float _ILMAlphaLinesEmissionToggle;
			uniform float _SSSAlphaEmissiveToggle;
			uniform float _SSSAlphaEmissiveIntensity;
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
			uniform float _BaseSSSAlphaSwap;
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 ViewMatrix0375_g1667(  )
			{
				return UNITY_MATRIX_V[0];
			}
			
			float3 ViewMatrix1373_g1667(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 StereoCameraViewPosition30_g1665(  )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				return cameraPos;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 StereoCameraViewDirection32_g1665( float3 worldPos )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				float3 worldViewDir = normalize((cameraPos - worldPos));
				return worldViewDir;
			}
			


			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
			};

			struct v2f
			{
				V2F_SHADOW_CASTER;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_SHADOW_COORDS(4)
			};


			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord1.zw = v.ase_texcoord1.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				v.vertex.xyz +=  float3(0,0,0) ;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}

			float4 frag (v2f i ) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				float ILMColorSetting1007 = _ILMColorSetting;
				float4 ILMAColor1005 = _ILMAlphaColor;
				float DetailColorSetting1070 = _DetailColorSetting;
				float4 DetailColor1072 = _BodyLinesColor;
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float ILMColorSetting60_g1669 = ILMColorSetting1007;
				float4 ILMAColor54_g1669 = ILMAColor1005;
				float DetailColorSetting44_g1669 = DetailColorSetting1070;
				float4 DetailColor41_g1669 = DetailColor1072;
				float2 uv_Base = i.ase_texcoord1.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1659 = _TotalReplacements;
				float4 break8_g1664 = _Target5Color;
				float4 break8_g1660 = _Target4Color;
				float4 break8_g1662 = _Target3Color;
				float4 break8_g1661 = _Target2Color;
				float4 break8_g1663 = _Target1Color;
				float3x3 temp_output_67_0_g1659 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1663 = float4( temp_output_67_0_g1659[0] , 0.0 );
				float4 break6_g1663 = temp_output_13_0_g1663;
				float4 appendResult3_g1663 = (float4(break8_g1663.r , break8_g1663.g , break8_g1663.b , break6_g1663.a));
				float4 appendResult7_g1663 = (float4(break6_g1663.r , break6_g1663.g , break6_g1663.b , 1.0));
				float smoothstepResult5_g1663 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1663 , _Source1Color ));
				float4 lerpResult4_g1663 = lerp( appendResult3_g1663 , temp_output_13_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_106_0_g1659 = lerpResult4_g1663;
				float4 temp_output_13_0_g1661 = temp_output_106_0_g1659;
				float4 break6_g1661 = temp_output_13_0_g1661;
				float4 appendResult3_g1661 = (float4(break8_g1661.r , break8_g1661.g , break8_g1661.b , break6_g1661.a));
				float4 appendResult7_g1661 = (float4(break6_g1661.r , break6_g1661.g , break6_g1661.b , 1.0));
				float smoothstepResult5_g1661 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1661 , _Source2Color ));
				float4 lerpResult4_g1661 = lerp( appendResult3_g1661 , temp_output_13_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_102_0_g1659 = lerpResult4_g1661;
				float4 temp_output_13_0_g1662 = temp_output_102_0_g1659;
				float4 break6_g1662 = temp_output_13_0_g1662;
				float4 appendResult3_g1662 = (float4(break8_g1662.r , break8_g1662.g , break8_g1662.b , break6_g1662.a));
				float4 appendResult7_g1662 = (float4(break6_g1662.r , break6_g1662.g , break6_g1662.b , 1.0));
				float smoothstepResult5_g1662 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1662 , _Source3Color ));
				float4 lerpResult4_g1662 = lerp( appendResult3_g1662 , temp_output_13_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_104_0_g1659 = lerpResult4_g1662;
				float4 temp_output_13_0_g1660 = temp_output_104_0_g1659;
				float4 break6_g1660 = temp_output_13_0_g1660;
				float4 appendResult3_g1660 = (float4(break8_g1660.r , break8_g1660.g , break8_g1660.b , break6_g1660.a));
				float4 appendResult7_g1660 = (float4(break6_g1660.r , break6_g1660.g , break6_g1660.b , 1.0));
				float smoothstepResult5_g1660 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1660 , _Source4Color ));
				float4 lerpResult4_g1660 = lerp( appendResult3_g1660 , temp_output_13_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_105_0_g1659 = lerpResult4_g1660;
				float4 temp_output_13_0_g1664 = temp_output_105_0_g1659;
				float4 break6_g1664 = temp_output_13_0_g1664;
				float4 appendResult3_g1664 = (float4(break8_g1664.r , break8_g1664.g , break8_g1664.b , break6_g1664.a));
				float4 appendResult7_g1664 = (float4(break6_g1664.r , break6_g1664.g , break6_g1664.b , 1.0));
				float smoothstepResult5_g1664 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1664 , _Source5Color ));
				float4 lerpResult4_g1664 = lerp( appendResult3_g1664 , temp_output_13_0_g1664 , smoothstepResult5_g1664);
				float4 temp_output_15_0_g1663 = float4( temp_output_67_0_g1659[1] , 0.0 );
				float3 hsvTorgb25_g1663 = RGBToHSV( temp_output_15_0_g1663.rgb );
				float3 hsvTorgb26_g1663 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1663.x ),hsvTorgb25_g1663.y,hsvTorgb25_g1663.z) );
				float4 appendResult18_g1663 = (float4(hsvTorgb26_g1663 , temp_output_15_0_g1663.a));
				float4 lerpResult19_g1663 = lerp( appendResult18_g1663 , temp_output_15_0_g1663 , smoothstepResult5_g1663);
				float4 temp_output_15_0_g1661 = lerpResult19_g1663;
				float3 hsvTorgb25_g1661 = RGBToHSV( temp_output_15_0_g1661.rgb );
				float3 hsvTorgb26_g1661 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1661.x ),hsvTorgb25_g1661.y,hsvTorgb25_g1661.z) );
				float4 appendResult18_g1661 = (float4(hsvTorgb26_g1661 , temp_output_15_0_g1661.a));
				float4 lerpResult19_g1661 = lerp( appendResult18_g1661 , temp_output_15_0_g1661 , smoothstepResult5_g1661);
				float4 temp_output_15_0_g1662 = lerpResult19_g1661;
				float3 hsvTorgb25_g1662 = RGBToHSV( temp_output_15_0_g1662.rgb );
				float3 hsvTorgb26_g1662 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1662.x ),hsvTorgb25_g1662.y,hsvTorgb25_g1662.z) );
				float4 appendResult18_g1662 = (float4(hsvTorgb26_g1662 , temp_output_15_0_g1662.a));
				float4 lerpResult19_g1662 = lerp( appendResult18_g1662 , temp_output_15_0_g1662 , smoothstepResult5_g1662);
				float4 temp_output_15_0_g1660 = lerpResult19_g1662;
				float3 hsvTorgb25_g1660 = RGBToHSV( temp_output_15_0_g1660.rgb );
				float3 hsvTorgb26_g1660 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1660.x ),hsvTorgb25_g1660.y,hsvTorgb25_g1660.z) );
				float4 appendResult18_g1660 = (float4(hsvTorgb26_g1660 , temp_output_15_0_g1660.a));
				float4 lerpResult19_g1660 = lerp( appendResult18_g1660 , temp_output_15_0_g1660 , smoothstepResult5_g1660);
				float4 temp_output_15_0_g1664 = lerpResult19_g1660;
				float3 hsvTorgb25_g1664 = RGBToHSV( temp_output_15_0_g1664.rgb );
				float3 hsvTorgb26_g1664 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1664.x ),hsvTorgb25_g1664.y,hsvTorgb25_g1664.z) );
				float4 appendResult18_g1664 = (float4(hsvTorgb26_g1664 , temp_output_15_0_g1664.a));
				float4 lerpResult19_g1664 = lerp( appendResult18_g1664 , temp_output_15_0_g1664 , smoothstepResult5_g1664);
				float3x3 temp_output_24_0_g1669 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1659 == 5.0 ? lerpResult4_g1664 : ( temp_output_52_0_g1659 == 4.0 ? temp_output_105_0_g1659 : ( temp_output_52_0_g1659 == 3.0 ? temp_output_104_0_g1659 : ( temp_output_52_0_g1659 == 2.0 ? temp_output_102_0_g1659 : ( temp_output_52_0_g1659 == 1.0 ? temp_output_106_0_g1659 : float4( temp_output_67_0_g1659[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1664.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1066 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1669 = Detail1066;
				float4 lerpResult10_g1669 = lerp( DetailColor41_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float3 SSS50_g1669 = temp_output_24_0_g1669[1];
				float2 uv_OLM = i.ase_texcoord1.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1117 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1669 = OLM1117;
				float4 SSSOLM63_g1669 = ( float4( SSS50_g1669 , 0.0 ) * OLM47_g1669 );
				float4 lerpResult36_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[0] , 0.0 ) , detail38_g1669);
				float4 temp_output_20_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult10_g1669 : lerpResult36_g1669 );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1669 = ILMA357;
				float4 lerpResult12_g1669 = lerp( ILMAColor54_g1669 , temp_output_20_0_g1669 , ILMA57_g1669);
				float4 lerpResult65_g1669 = lerp( SSSOLM63_g1669 , temp_output_20_0_g1669 , ILMA57_g1669);
				float4 Base339 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult12_g1669 : lerpResult65_g1669 );
				float4 Base12_g1677 = Base339;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix0375_g1667 = ViewMatrix0375_g1667();
				float3 normalizeResult384_g1667 = normalize( localViewMatrix0375_g1667 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 temp_output_380_0_g1667 = ( float3( 0,0,0 ) + ase_worldPos );
				float3 localViewMatrix1373_g1667 = ViewMatrix1373_g1667();
				float3 normalizeResult376_g1667 = normalize( localViewMatrix1373_g1667 );
				float3 localStereoCameraViewPosition30_g1665 = StereoCameraViewPosition30_g1665();
				float3 rotatedValue385_g1667 = RotateAroundAxis( temp_output_380_0_g1667, localStereoCameraViewPosition30_g1665, normalizeResult376_g1667, radians( ( _ViewDirOffsetYaw * -1.0 ) ) );
				float3 rotatedValue387_g1667 = RotateAroundAxis( temp_output_380_0_g1667, rotatedValue385_g1667, normalize( normalizeResult384_g1667 ), radians( ( _ViewDirOffsetPitch * 1.0 ) ) );
				float3 normalizeResult389_g1667 = normalize( ( rotatedValue387_g1667 - temp_output_380_0_g1667 ) );
				float3 normalizeResult38_g1665 = normalize( normalizeResult389_g1667 );
				float3 appendResult15_g1666 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1666 = normalize( appendResult15_g1666 );
				float3 normalizeResult26_g1665 = normalize( normalizeResult2_g1666 );
				float3 ifLocalVar3_g1665 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1665 = normalizeResult38_g1665;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1665 = normalizeResult26_g1665;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1631 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1631 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1631 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1631 = color8_g1631;
				#else
				float4 staticSwitch9_g1631 = ( clampResult7_g1631 * color14_g1631 );
				#endif
				float4 break10_g1631 = staticSwitch9_g1631;
				float IsThereWorldLight450 = break10_g1631.r;
				float3 ifLocalVar8_g1665 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1665 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1665 = ifLocalVar3_g1665;
				float3 ifLocalVar9_g1665 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1665 = ifLocalVar3_g1665;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1665 = ifLocalVar8_g1665;
				float3 normalizeResult48_g1665 = normalize( ifLocalVar9_g1665 );
				float3 worldPos32_g1665 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1665 = StereoCameraViewDirection32_g1665( worldPos32_g1665 );
				float3 normalizeResult51_g1665 = normalize( ( normalizeResult48_g1665 + localStereoCameraViewDirection32_g1665 ) );
				float dotResult50_g1665 = dot( normalizedWorldNormal , normalizeResult51_g1665 );
				float blendOpSrc34_g1668 = ILMB576;
				float blendOpDest34_g1668 = dotResult50_g1665;
				float clampResult87_g1670 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1668) / max( blendOpSrc34_g1668, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_29 = (clampResult87_g1670).xxxx;
				float4 blendOpSrc30_g1677 = Base12_g1677;
				float4 blendOpDest30_g1677 = temp_cast_29;
				float4 lerpBlendMode30_g1677 = lerp(blendOpDest30_g1677,min( blendOpSrc30_g1677 , blendOpDest30_g1677 ),0.9);
				float3 desaturateInitialColor9_g1680 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1677 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1680 = dot( desaturateInitialColor9_g1680, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1680 = lerp( desaturateInitialColor9_g1680, desaturateDot9_g1680.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 temp_output_95_0_g1677 = ( float4( desaturateVar9_g1680 , 0.0 ) + Base12_g1677 );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1678 = ( temp_output_95_0_g1677 * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1678 = dot( desaturateInitialColor9_g1678, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1678 = lerp( desaturateInitialColor9_g1678, desaturateDot9_g1678.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 Base52_g1669 = temp_output_24_0_g1669[0];
				float3 blendOpSrc31_g1669 = Base52_g1669;
				float3 blendOpDest31_g1669 = temp_output_24_0_g1669[1];
				float4 lerpResult7_g1669 = lerp( ( DetailColor41_g1669 * float4( ( saturate( abs( blendOpSrc31_g1669 - blendOpDest31_g1669 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 lerpResult69_g1669 = lerp( SSSOLM63_g1669 , float4( temp_output_24_0_g1669[1] , 0.0 ) , detail38_g1669);
				float4 temp_output_8_0_g1669 = ( DetailColorSetting44_g1669 == 1.0 ? lerpResult7_g1669 : lerpResult69_g1669 );
				float4 blendOpSrc32_g1669 = temp_output_20_0_g1669;
				float4 blendOpDest32_g1669 = temp_output_8_0_g1669;
				float4 lerpResult17_g1669 = lerp( ( ILMAColor54_g1669 * ( saturate( abs( blendOpSrc32_g1669 - blendOpDest32_g1669 ) )) ) , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 lerpResult67_g1669 = lerp( SSSOLM63_g1669 , temp_output_8_0_g1669 , ILMA57_g1669);
				float4 SSS578 = ( ILMColorSetting60_g1669 == 1.0 ? lerpResult17_g1669 : lerpResult67_g1669 );
				float4 SSS14_g1677 = SSS578;
				float3 desaturateInitialColor9_g1681 = ( SSS14_g1677 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1681 = dot( desaturateInitialColor9_g1681, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1681 = lerp( desaturateInitialColor9_g1681, desaturateDot9_g1681.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc51_g1677 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1677 = ( temp_output_95_0_g1677 * SSS14_g1677 );
				float4 lerpBlendMode51_g1677 = lerp(blendOpDest51_g1677,2.0f*blendOpDest51_g1677*blendOpSrc51_g1677 + blendOpDest51_g1677*blendOpDest51_g1677*(1.0f - 2.0f*blendOpSrc51_g1677),0.5);
				float3 desaturateInitialColor9_g1679 = ( ( saturate( lerpBlendMode51_g1677 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1679 = dot( desaturateInitialColor9_g1679, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1679 = lerp( desaturateInitialColor9_g1679, desaturateDot9_g1679.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1670 = i.ase_color.r;
				float dotResult46_g1665 = dot( ifLocalVar9_g1665 , normalizedWorldNormal );
				float temp_output_36_0_g1668 = ( ( dotResult46_g1665 + _GlobalLightPush ) * i.ase_color.r );
				float ILMG574 = break292.y;
				float temp_output_1_0_g1668 = ILMG574;
				float NdL20_g1670 = ( temp_output_36_0_g1668 * temp_output_1_0_g1668 );
				float temp_output_9_0_g1670 = _Shadow1Push;
				float temp_output_11_0_g1670 = _Shadow2Push;
				float clampResult15_g1670 = clamp( temp_output_9_0_g1670 , temp_output_11_0_g1670 , temp_output_9_0_g1670 );
				float RealShadow1Push16_g1670 = clampResult15_g1670;
				float clampResult17_g1670 = clamp( temp_output_11_0_g1670 , temp_output_11_0_g1670 , temp_output_9_0_g1670 );
				float RealShadow2Push18_g1670 = clampResult17_g1670;
				float temp_output_42_0_g1670 = max( max( ( 1.0 - ( VertexR33_g1670 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , ( NdL20_g1670 < RealShadow2Push18_g1670 ? 1.0 : 0.0 ) ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1670 = ( max( ( 1.0 - ( VertexR33_g1670 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( ( NdL20_g1670 < RealShadow1Push16_g1670 ? 1.0 : 0.0 ) , ( RealShadow1Push16_g1670 >= RealShadow2Push18_g1670 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1670 );
				float3 lerpResult100_g1677 = lerp( desaturateVar9_g1681 , desaturateVar9_g1679 , ( 1.0 - temp_output_43_0_g1670 ));
				float clampResult90_g1670 = clamp( ( 1.0 - ( temp_output_43_0_g1670 + temp_output_42_0_g1670 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1677 = clampResult90_g1670;
				float4 lerpResult101_g1677 = lerp( float4( desaturateVar9_g1678 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1677 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1677 ));
				float EnableRimlight82_g1670 = _EnableRimlight;
				float dotResult31_g1665 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1665 );
				float BaseA580 = tex2DNode296.a;
				float NdV48_g1670 = ( ( 1.0 - ( dotResult31_g1665 + ( 1.0 - _RimlightSize ) ) ) * BaseA580 );
				float clampResult91_g1670 = clamp( temp_output_42_0_g1670 , 0.0 , 1.0 );
				float clampResult88_g1670 = clamp( ( ceil( ( ( NdV48_g1670 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1670 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1670 = ( EnableRimlight82_g1670 == 1.0 ? clampResult88_g1670 : 0.0 );
				float3 desaturateInitialColor9_g1682 = ( ( Base12_g1677 * temp_output_94_0_g1670 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1682 = dot( desaturateInitialColor9_g1682, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1682 = lerp( desaturateInitialColor9_g1682, desaturateDot9_g1682.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1677 + float4( desaturateVar9_g1682 , 0.0 ) );
				float4 temp_output_1_0_g1686 = ColorOut1025;
				float4 lerpResult8_g1686 = lerp( DetailColor1072 , temp_output_1_0_g1686 , Detail1066);
				float4 temp_output_9_0_g1686 = ( DetailColorSetting1070 == 2.0 ? lerpResult8_g1686 : temp_output_1_0_g1686 );
				float4 lerpResult10_g1686 = lerp( ILMAColor1005 , temp_output_9_0_g1686 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1683 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1683 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1683 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_43 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_44 = (5.0).xxxx;
				float4 clampResult18_g1683 = clamp( ase_lightColor , temp_cast_43 , temp_cast_44 );
				float4 temp_output_11_0_g1683 = ( ase_atten * clampResult18_g1683 );
				float4 temp_output_8_0_g1683 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1683 = 0;
				if( ifLocalVar13_g1683 > 0.0 )
				ifLocalVar3_g1683 = temp_output_11_0_g1683;
				else if( ifLocalVar13_g1683 == 0.0 )
				ifLocalVar3_g1683 = temp_output_8_0_g1683;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1683 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1683 );
				#else
				float4 staticSwitch9_g1683 = ifLocalVar3_g1683;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1683;
				float temp_output_12_0_g1676 = ( ( ( temp_output_94_0_g1670 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1670 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1670 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1670 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1670 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float SSSA581 = tex2DNode297.a;
				float temp_output_28_0_g1676 = ( _SSSAlphaEmissiveToggle * ( SSSA581 >= 0.5 ? _SSSAlphaEmissiveIntensity : 0.0 ) );
				float clampResult30_g1676 = clamp( ( temp_output_12_0_g1676 - temp_output_28_0_g1676 ) , 0.0 , temp_output_12_0_g1676 );
				float EmissionRampMask920 = ( clampResult30_g1676 + temp_output_28_0_g1676 );
				float4 temp_cast_45 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1683 = 0;
				if( ifLocalVar13_g1683 > 0.0 )
				ifLocalVar17_g1683 = clampResult18_g1683;
				else if( ifLocalVar13_g1683 == 0.0 )
				ifLocalVar17_g1683 = temp_output_8_0_g1683;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1683 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1683 = max( temp_cast_45 , ifLocalVar17_g1683 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1683;
				float4 lerpResult1169 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult10_g1686 : temp_output_9_0_g1686 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1687 = _DebugGroup;
				float temp_output_47_0_g1687 = _VertexChannel;
				float4 temp_output_59_0_g1687 = _DebugColor;
				float temp_output_50_0_g1687 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1687 = appendResult1031;
				float4 break7_g1687 = temp_output_54_0_g1687;
				float temp_output_57_0_g1687 = _BaseSSSAlphaSwap;
				float4 Debug987 = ( temp_output_48_0_g1687 == 0.0 ? ( temp_output_47_0_g1687 == 0.0 ? i.ase_color : ( temp_output_47_0_g1687 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1687 ) : ( temp_output_47_0_g1687 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1687 == 1.0 ? ( temp_output_50_0_g1687 == 0.0 ? temp_output_54_0_g1687 : ( temp_output_50_0_g1687 == 1.0 ? ( break7_g1687.r * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 2.0 ? ( break7_g1687.g * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 3.0 ? ( break7_g1687.b * temp_output_59_0_g1687 ) : ( temp_output_50_0_g1687 == 4.0 ? ( break7_g1687.a * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1687 == 2.0 ? ( temp_output_57_0_g1687 == 0.0 ? ( BaseA580 * temp_output_59_0_g1687 ) : ( temp_output_57_0_g1687 == 1.0 ? ( SSSA581 * temp_output_59_0_g1687 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1169 : Debug987 ).rgb;
				outAlpha = 1;
				clip(outAlpha);
				SHADOW_CASTER_FRAGMENT(i)
			}
			ENDCG
		}
		
	}
	CustomEditor "ASWGuiltyGearStriveGUI"
	
	
}
/*ASEBEGIN
Version=18900
104;227;1939;816;2614.412;-1798.509;6.257267;True;True
Node;AmplifyShaderEditor.CommentaryNode;781;-2786.293,2702.811;Inherit;False;2829.268;2886.848;;56;1072;1071;1070;1069;1066;1065;581;988;573;993;555;576;574;1114;580;1007;992;292;764;1005;357;821;850;857;846;825;853;852;1004;1006;277;824;849;848;585;827;847;854;826;829;823;828;851;822;855;856;280;762;763;274;296;297;1116;1117;1058;1160;Color Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;274;-1490.404,2845.581;Inherit;True;Property;_ILM;ILM;3;0;Create;True;0;0;0;False;0;False;-1;None;4195061555b9e784385d86f20816f827;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;572;971.8275,2807.128;Inherit;False;703.0927;565.6688;;9;517;450;563;561;533;634;535;871;872;Light Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;280;-1167.917,2871.7;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;634;1049.433,2895.548;Inherit;False;Is There A Light;-1;;1631;65e24b0fdfa2e3146a301178490755c7;0;0;2;FLOAT;0;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;296;-2723.293,2752.811;Inherit;True;Property;_Base;Base;1;0;Create;True;0;0;0;False;0;False;-1;None;c0bc9dd88f76e8742a5c00526dbd2b49;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LinearToGammaNode;277;-1024.21,2870.06;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;535;1060.975,3242.652;Inherit;False;Property;_FallbackLightDirection;Fallback Light Direction;16;1;[Enum];Create;True;0;2;Fake Light Direction;0;View Direction;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;533;1058.975,3071.652;Inherit;False;Property;_LightDirectionSetting;Light Direction Setting;15;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;297;-2678.854,3006.014;Inherit;True;Property;_SSS;SSS;2;0;Create;True;0;0;0;False;0;False;-1;None;69883a890d33e164c809432ff603f8da;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;561;1314.975,3071.652;Inherit;False;LightDirectionSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;292;-752,2912;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;762;-2331.82,2777.283;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;1312.022,2857.128;Inherit;False;IsThereWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;1316.975,3242.652;Inherit;False;FallbackLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;763;-2332.82,3009.282;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;558;922.4996,3449.375;Inherit;False;919.3984;663.7043;;8;637;562;564;472;434;471;435;525;Dot Creation;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1006;-1716.687,5143.85;Inherit;False;Property;_ILMColorSetting;ILM Color Setting;4;1;[Enum];Create;True;0;3;Default;0;Shadow Priority;1;ILM Priority;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;856;-2458.85,5306.562;Inherit;False;Property;_Target5Color;Target 5 Color;49;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;849;-2522.85,4570.562;Inherit;False;Property;_SSSHueShift3;SSS Hue Shift 3;42;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-2522.85,5242.562;Inherit;False;Property;_Source5Fuzziness;Source 5 Fuzziness;48;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;822;-2490.85,3290.56;Inherit;False;Property;_Source1Color;Source 1 Color;31;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;821;-2516.85,3216.56;Inherit;False;Property;_TotalReplacements;Total Replacements;30;1;[IntRange];Create;True;0;0;0;False;0;False;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1116;-496,4928;Inherit;True;Property;_OLM;OLM;108;0;Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;827;-2522.85,3898.56;Inherit;False;Property;_Source2Fuzziness;Source 2 Fuzziness;36;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;1021.762,3769.256;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;9;0;Create;True;0;0;0;False;0;False;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1065;-1115.468,4942.118;Inherit;True;Property;_Detail;Detail;106;0;Create;True;0;0;0;False;0;False;-1;None;None;True;1;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1004;-1725.405,4958.093;Inherit;False;Property;_ILMAlphaColor;ILM Alpha Color;5;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;564;957.7625,3689.256;Inherit;False;563;FallbackLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;829;-2522.85,4122.562;Inherit;False;Property;_SSSHueShift2;SSS Hue Shift 2;38;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;846;-2522.85,4346.562;Inherit;False;Property;_Source3Fuzziness;Source 3 Fuzziness;40;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;850;-2522.85,4794.562;Inherit;False;Property;_Source4Fuzziness;Source 4 Fuzziness;44;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;562;957.7625,3609.256;Inherit;False;561;LightDirectionSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;857;-2522.85,5466.562;Inherit;False;Property;_SSSHueShift5;SSS Hue Shift 5;52;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;576;-608,3024;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;574;-608,2944;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;471;941.7625,3929.256;Inherit;False;Property;_ViewDirOffsetPitch;View Dir Offset Pitch;11;0;Create;True;0;0;0;False;0;False;0;0;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;848;-2458.85,4410.562;Inherit;False;Property;_Target3Color;Target 3 Color;41;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;852;-2458.85,4858.562;Inherit;False;Property;_Target4Color;Target 4 Color;45;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;828;-2458.85,3962.56;Inherit;False;Property;_Target2Color;Target 2 Color;37;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;435;1021.762,3849.256;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;10;0;Create;True;0;0;0;False;0;False;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;472;941.7625,4009.256;Inherit;False;Property;_ViewDirOffsetYaw;View Dir Offset Yaw;12;0;Create;True;0;0;0;False;0;False;0;0;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;825;-2522.85,3674.56;Inherit;False;Property;_SSSHueShift1;SSS Hue Shift 1;34;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;525;986.4993,3512.944;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;824;-2458.85,3514.56;Inherit;False;Property;_Target1Color;Target 1 Color;33;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;851;-2458.85,4634.562;Inherit;False;Property;_Source4Color;Source 4 Color;43;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;855;-2458.85,5082.562;Inherit;False;Property;_Source5Color;Source 5 Color;47;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;580;-2393.363,2900.325;Inherit;False;BaseA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;826;-2458.85,3738.56;Inherit;False;Property;_Source2Color;Source 2 Color;35;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;823;-2522.85,3450.56;Inherit;False;Property;_Source1Fuzziness;Source 1 Fuzziness;32;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1071;-1077.51,5230.471;Inherit;False;Property;_BodyLinesColor;Body Lines Color;107;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;853;-2522.85,5018.562;Inherit;False;Property;_SSSHueShift4;SSS Hue Shift 4;46;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1069;-1088,5136;Inherit;False;Property;_DetailColorSetting;Detail Color Setting;8;1;[Enum];Create;True;0;3;Default;0;Shadow Priority;1;Detail Priority;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;847;-2458.85,4186.562;Inherit;False;Property;_Source3Color;Source 3 Color;39;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.MatrixFromVectors;585;-2126.762,2904.759;Inherit;False;FLOAT3x3;True;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;992;-1768.7,3223.38;Inherit;False;Property;_EnableColorReplacer;Enable Color Replacer;29;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1070;-832,5136;Inherit;False;DetailColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;637;1422.762,3657.256;Inherit;False;Dot Creation;-1;;1665;fd90efbfe94791944bc1c5b55d8d67e4;0;7;12;FLOAT;0;False;17;FLOAT;0;False;16;FLOAT;0;False;29;FLOAT;0;False;28;FLOAT;0;False;33;FLOAT;0;False;34;FLOAT;0;False;3;FLOAT;0;FLOAT;42;FLOAT;52
Node;AmplifyShaderEditor.FunctionNode;764;-1857.64,3503.761;Inherit;False;Color Replacer;-1;;1659;3bf8a732171ac6840bcd0b4c21fcee62;0;22;67;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;52;FLOAT;0;False;16;COLOR;0,0,0,1;False;17;FLOAT;0;False;13;COLOR;0,0,0,0;False;96;FLOAT;0;False;31;COLOR;0,0,0,1;False;32;FLOAT;0;False;30;COLOR;0,0,0,0;False;97;FLOAT;0;False;36;COLOR;0,0,0,1;False;38;FLOAT;0;False;37;COLOR;0,0,0,0;False;99;FLOAT;0;False;40;COLOR;0,0,0,1;False;42;FLOAT;0;False;41;COLOR;0,0,0,0;False;100;FLOAT;0;False;44;COLOR;0,0,0,1;False;46;FLOAT;0;False;45;COLOR;0,0,0,0;False;101;FLOAT;0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1005;-1484.963,4957.933;Inherit;False;ILMAColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;639;2336,3776;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;2336,3968;Inherit;False;576;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;706;2336,3904;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1114;-1250,3400.522;Inherit;False;1148.857;669.478;;9;339;578;1075;1074;1011;1073;813;1012;1121;Shadow Priority Color Change;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;707;2295,4051;Inherit;False;Property;_GlobalLightPush;Global Light Push;17;0;Create;True;0;0;0;False;0;False;1;1;-1;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1117;-176,4928;Inherit;False;OLM;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1066;-768,4944;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1007;-1491.218,5140.88;Inherit;False;ILMColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1072;-832,5232;Inherit;False;DetailColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;641;2293,4137;Inherit;False;Property;_RimlightSize;Rimlight Size;27;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;357;-1110.106,3006.807;Inherit;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1075;-1120,3648;Inherit;False;1066;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;-1168,3776;Inherit;False;1007;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;926;3008,4672;Inherit;False;Property;_Shadow2EmissiveToggle;Shadow 2 Emissive Toggle;76;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1074;-1136,3712;Inherit;False;1072;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;753;3083.087,3792.721;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;732;2992,4352;Inherit;False;Property;_PermanentShadowThreshold;Permanent Shadow Threshold;26;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;922;3024,4416;Inherit;False;Property;_RimlightEmissiveToggle;Rimlight Emissive Toggle;56;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;727;3008,4224;Inherit;False;Property;_Shadow2Push;Shadow 2 Push;24;0;Create;True;0;0;0;False;0;False;-1;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;923;3024,4480;Inherit;False;Property;_SpecularEmissiveToggle;Specular Emissive Toggle;61;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;925;3008,4608;Inherit;False;Property;_Shadow1EmissiveToggle;Shadow 1 Emissive Toggle;71;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1121;-1129,3506;Inherit;False;1117;OLM;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;581;-2343.923,3136.528;Inherit;False;SSSA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;729;3092.385,3872.472;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;711;3008,4096;Inherit;False;Property;_Shadow1Push;Shadow 1 Push;22;0;Create;True;0;0;0;False;0;False;0.5;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;555;-1765.585,4137.153;Inherit;False;1451.782;658.5377;;14;947;944;873;950;867;544;869;632;779;780;777;778;1163;1181;Light Color Calculation;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;1085;2640,3664;Inherit;False;Final Dot Calculation Strive;-1;;1668;7fa0b619a5202f24c92b4cfbdde5487f;0;8;5;FLOAT;0;False;21;FLOAT;0;False;6;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;11;FLOAT;0;False;10;FLOAT;0;False;3;FLOAT;0;FLOAT;8;FLOAT;9
Node;AmplifyShaderEditor.GetLocalVarNode;813;-1120,3840;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;716;2992,4160;Inherit;False;Property;_Shadow1VertexRThreshold;Shadow 1 VertexR Threshold;23;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1011;-1120,3904;Inherit;False;1005;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;993;-1466.289,3435.024;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;3;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;758;3088,3968;Inherit;False;Property;_EnableRimlight;Enable Rimlight;28;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;2992,4288;Inherit;False;Property;_Shadow2VertexRThreshold;Shadow 2 VertexR Threshold;25;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;746;3008,4032;Inherit;False;Property;_SpecularSize;Specular Size;21;0;Create;True;0;0;0;False;0;False;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;924;3040,4544;Inherit;False;Property;_BaseEmissiveToggle;Base Emissive Toggle;66;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1073;-1184,3584;Inherit;False;1070;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1001;3659.589,3378.512;Inherit;False;Property;_BaseEmissionIntensity;Base Emission Intensity;67;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1013;3610.625,3147.818;Inherit;False;Property;_ILMAlphaEmissionIntensity;ILM Alpha Emission Intensity;92;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1017;3618.042,3075.314;Inherit;False;Property;_ILMAlphaLinesEmissionToggle;ILM Alpha Lines Emission Toggle;93;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1205;3616,2928;Inherit;False;Property;_SSSAlphaEmissiveIntensity;SSS Alpha Emissive Intensity;111;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1203;3632,2848;Inherit;False;Property;_SSSAlphaEmissiveToggle;SSS Alpha Emissive Toggle;110;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1016;3728.264,3004.706;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1000;3623.496,3303.772;Inherit;False;Property;_SpecularEmissionIntensity;Specular Emission Intensity;62;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1200;3728,2768;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;778;-738.5991,4407.015;Inherit;False;Property;_AmbientColor;Ambient Color;19;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;777;-738.5991,4197.015;Inherit;False;Property;_LightColor;Light Color;18;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1002;3616.589,3456.512;Inherit;False;Property;_Shadow1EmissionIntensity;Shadow 1 Emission Intensity;72;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;994;3633.195,3222.898;Inherit;False;Property;_RimlightEmissionIntensity;Rimlight Emission Intensity;57;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1156;-800,3456;Inherit;False;Shadow Priority Color Change;-1;;1669;e12dd788f9ad90545a25b4603cc00a62;0;8;24;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;35;COLOR;0,0,0,0;False;29;FLOAT;0;False;26;COLOR;0,0,0,0;False;25;COLOR;0,0,0,0;False;30;FLOAT;0;False;27;FLOAT;0;False;28;COLOR;0,0,0,0;False;2;COLOR;0;COLOR;23
Node;AmplifyShaderEditor.RangedFloatNode;1003;3628.589,3540.512;Inherit;False;Property;_Shadow2EmissionIntensity;Shadow 2 Emission Intensity;77;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;965;3472,3680;Inherit;False;Ramp Creation - Guilty Gear Xrd;-1;;1670;92a8a58660488504fb4c65a454407910;0;17;1;FLOAT;0;False;3;FLOAT;0;False;2;FLOAT;0;False;5;FLOAT;0;False;7;FLOAT;0;False;80;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;97;FLOAT;0;False;101;FLOAT;0;False;104;FLOAT;0;False;107;FLOAT;0;False;110;FLOAT;0;False;10;FLOAT;100;FLOAT;103;FLOAT;106;FLOAT;109;FLOAT;112;FLOAT;76;FLOAT;69;FLOAT;62;FLOAT;0;FLOAT;44
Node;AmplifyShaderEditor.RegisterLocalVarNode;573;-608,2864;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;780;-533.5998,4408.015;Inherit;False;AmbientColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;871;1073.175,3157.493;Inherit;False;Property;_LightColorSetting;Light Color Setting;14;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1201;4240,3376;Inherit;False;Emission - Guilty Gear Strive;-1;;1676;282e2fc31b84cbb48b669c6910d1914b;0;16;25;FLOAT;0;False;24;FLOAT;0;False;26;FLOAT;0;False;17;FLOAT;0;False;22;FLOAT;0;False;20;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;578;-384,3584;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;779;-533.5998,4199.015;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;-377.1432,3450.522;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;804;4016,4208;Inherit;False;573;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;887;4048,5024;Inherit;False;Property;_BaseIntensity;Base Intensity;63;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;893;4016,5376;Inherit;False;Property;_Shadow1Tint;Shadow 1 Tint;69;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;894;4000,5312;Inherit;False;Property;_Shadow1Intensity;Shadow 1 Intensity;68;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;898;3952,5824;Inherit;False;Property;_Shadow2Saturation;Shadow 2 Saturation;75;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;3952,5536;Inherit;False;Property;_Shadow1Saturation;Shadow 1 Saturation;70;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;883;3968,4960;Inherit;False;Property;_SpecularSaturation;Specular Saturation;60;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;4016,4736;Inherit;False;Property;_SpecularIntensity;Specular Intensity;58;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;880;3984,4448;Inherit;False;Property;_RimlightIntensity;Rimlight Intensity;53;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;859;4016,4288;Inherit;False;779;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;860;3984,4368;Inherit;False;780;AmbientColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;881;3984,4512;Inherit;False;Property;_RimlightTint;Rimlight Tint;54;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;793;4016,4128;Inherit;False;578;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;897;4016,5664;Inherit;False;Property;_Shadow2Tint;Shadow 2 Tint;74;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;872;1337.175,3156.493;Inherit;False;LightColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;889;3952,5248;Inherit;False;Property;_BaseSaturation;Base Saturation;65;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;884;4032,4800;Inherit;False;Property;_SpecularTint;Specular Tint;59;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;882;3936,4672;Inherit;False;Property;_RimlightSaturation;Rimlight Saturation;55;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;767;4016,4048;Inherit;False;339;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;888;4032,5088;Inherit;False;Property;_BaseTint;Base Tint;64;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;920;4688,3376;Inherit;False;EmissionRampMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;896;4000,5600;Inherit;False;Property;_Shadow2Intensity;Shadow 2 Intensity;73;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;544;-1725.444,4273.933;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;988;-608,2784;Inherit;False;ILM;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;867;-1738.728,4444.135;Inherit;False;Property;_FakeGlobalLightColor;Fake Global Light Color;6;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;869;-1746.997,4618.438;Inherit;False;Property;_FakeGlobalLightIntensity;Fake Global Light Intensity;7;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;873;-1722.37,4361.219;Inherit;False;872;LightColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1086;4496,4064;Inherit;False;Color Creation - Guilty Gear Strive;-1;;1677;22b8d5cb399b17145ab0f31f751f2bd5;0;26;6;FLOAT;0;False;29;FLOAT;0;False;39;FLOAT;0;False;41;FLOAT;0;False;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;COLOR;0,0,0,0;False;10;FLOAT;0;False;94;FLOAT;0;False;11;COLOR;0,0,0,0;False;67;COLOR;0,0,0,0;False;75;FLOAT;1;False;76;COLOR;1,1,1,0;False;78;FLOAT;0;False;81;FLOAT;1;False;80;COLOR;1,1,1,0;False;79;FLOAT;0;False;83;FLOAT;1;False;82;COLOR;1,1,1,0;False;84;FLOAT;0;False;85;FLOAT;1;False;86;COLOR;1,1,1,0;False;87;FLOAT;0;False;89;FLOAT;1;False;88;COLOR;1,1,1,0;False;90;FLOAT;0;False;1;COLOR;105
Node;AmplifyShaderEditor.LightAttenuation;632;-1719.909,4163.506;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;950;-1748.428,4699.634;Inherit;False;Property;_MinimumGlobalLightIntensity;Minimum Global Light Intensity;13;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;977;-383.4483,5722.681;Inherit;False;1186.069;893.5092;;12;987;1033;981;978;985;979;980;1031;1032;983;1196;1197;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1163;-1403.98,4203.657;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1019;4928,4256;Inherit;False;839.9919;535.7986;;8;1106;1112;1111;1110;1109;1108;1107;1026;Line Priority Color Change;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1025;4947.971,3801.074;Inherit;False;ColorOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1181;-1427.66,4325.012;Inherit;False;Light Color Calculation;-1;;1683;5b8f5c3f2a647dc4d89d921c89ebb0e5;0;7;25;FLOAT;0;False;10;FLOAT;1;False;5;FLOAT;0;False;14;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;19;FLOAT;0;False;2;COLOR;0;COLOR;16
Node;AmplifyShaderEditor.GetLocalVarNode;983;-347.8692,6215.467;Inherit;False;988;ILM;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1032;-336.8296,6297.702;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;985;-311.8692,6132.467;Inherit;False;Property;_ILMChannel;ILM Channel;91;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1031;-122.8295,6242.702;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1110;5040,4560;Inherit;False;1007;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1109;5072,4496;Inherit;False;1072;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;947;-984.4599,4390.014;Inherit;False;EmissionLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1112;5088,4688;Inherit;False;1005;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1111;5088,4624;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;944;-974.9218,4293.536;Inherit;False;GlobalLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1197;-304.512,6536.409;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1030;5960.892,4337.456;Inherit;False;469.1748;214.0239;;2;934;870;Apply Light Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1196;-346.512,6375.409;Inherit;False;Property;_BaseSSSAlphaSwap;BaseSSSAlphaSwap;109;1;[Enum];Create;True;0;2;Base Alpha;0;SSS Alpha;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;981;-291.8691,6048.467;Inherit;False;Property;_VertexChannel;Vertex Channel;50;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;979;-264.3643,5800.488;Inherit;False;Property;_DebugGroup;Debug Group;90;1;[Enum];Create;True;0;3;Vertex Colors;0;ILM Channels;1;Base and SSS Alpha;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;978;-296.3642,5880.488;Inherit;False;Property;_DebugColor;Debug Color;51;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1107;5024,4368;Inherit;False;1070;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1026;5088,4304;Inherit;False;1025;ColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;980;-326.8692,6460.467;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1108;5088,4432;Inherit;False;1066;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1028;7058.605,4329.721;Inherit;False;777.165;423.7624;;6;1169;933;1027;948;932;928;Emission Combining;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1027;7131.182,4558.405;Inherit;False;1025;ColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1033;152.7226,6096.615;Inherit;False;Debug;-1;;1687;6f93fc90e278e9a449a8e28c4cbb4ee4;0;8;48;FLOAT;0;False;59;COLOR;0,0,0,0;False;47;FLOAT;0;False;50;FLOAT;0;False;54;COLOR;0,0,0,0;False;57;FLOAT;0;False;55;FLOAT;0;False;56;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;870;6010.892,4436.479;Inherit;False;944;GlobalLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;933;7121.67,4456.718;Inherit;False;Property;_EmissionIntensity;Emission Intensity;20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1106;5456,4384;Inherit;False;Line Priority Color Change;-1;;1686;e71d6fe87185a054c9d0e635f7af6cdb;0;7;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;948;7093.861,4651.541;Inherit;False;947;EmissionLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;934;6261.067,4387.456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;932;7458.713,4525.067;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1029;8026.363,4280.438;Inherit;False;468.2808;338.5957;;3;989;990;991;Enable Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;497.8569,6094.068;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;928;7373.99,4667.589;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;990;8076.363,4504.031;Inherit;False;987;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1169;7670.063,4396.949;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;991;8107.605,4330.438;Inherit;False;Property;_EnableDebug;Enable Debug;89;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1045;1696,2816;Inherit;False;352;549;;7;1038;1039;1040;1041;1042;1043;1044;Stencil Buffer;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1051;2080,2816;Inherit;False;253;357;;4;1046;1049;1050;1052;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;915;5808.458,4724.881;Inherit;False;1201.994;833.8105;;11;904;1158;1036;907;908;911;910;909;912;1159;1195;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1062;2689.375,2909.014;Inherit;False;Property;_Opacity;Opacity;105;0;Create;True;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;973;2680.509,2996.567;Inherit;False;Property;_EnableGlowMask;Enable GlowMask;85;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1043;1744,3184;Inherit;False;Property;_FailFront;Fail Front;99;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;908;5894.458,5156.881;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;83;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;989;8312.64,4357.943;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;5962.458,5308.881;Inherit;False;578;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;909;5930.458,4983.881;Inherit;False;Property;_OutlineColor;Outline Color;82;0;Create;True;0;0;0;True;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1040;1745,2992;Inherit;False;Property;_WriteMask;Write Mask;96;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1046;2128,2880;Inherit;False;Property;_ZWriteMode;ZWrite Mode;102;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;2660.509,3255.567;Inherit;False;Property;_GlowMaskMultSystem;Glow Mask Mult System;87;1;[Enum];Create;True;0;2;Base Color Lerped From Mask;0;Mask Color;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;910;5865.458,4909.881;Inherit;False;Property;_DepthOffset;Depth Offset;81;0;Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1038;1744,2864;Inherit;False;Property;_Reference;Reference;94;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1158;6288,4896;Inherit;False;ASWOutline - Strive;-1;;1688;45e68a0e07691604398d794ebf3282a2;0;8;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;155;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.RangedFloatNode;907;5856.458,5228.881;Inherit;False;Property;_OutlineEnableBaseColorMult;Outline Enable Base Color Mult;84;1;[ToggleUI];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;5936.458,4772.881;Inherit;False;Property;_OutlineThickness;Outline Thickness;79;0;Create;True;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1159;5968,5392;Inherit;False;1117;OLM;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;976;2667.509,3329.567;Inherit;False;Property;_GlowMaskTint;Glow Mask Tint;88;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;970;1370.1,2684.252;Inherit;False;Property;_EditorVersion;Editor Version;0;1;[Enum];Create;True;0;2;Basic;0;Advanced;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1042;1744,3120;Inherit;False;Property;_PassFront;Pass Front;98;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;911;5856.458,4836.881;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;80;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1052;2128,2944;Inherit;False;Property;_ZTestMode;ZTest Mode;101;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1160;-456.9487,5164.26;Inherit;False;Constant;_Color0;Color 0;109;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1036;6352.914,4791.018;Inherit;False;Property;_EnableOutline;Enable Outline;78;1;[ToggleUI];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1172;8228.607,4678.034;Inherit;False;944;GlobalLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1058;-162.354,3493.501;Inherit;False;myVarName;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1039;1744,2928;Inherit;False;Property;_ReadMask;Read Mask;95;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;640;2336,3840;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1041;1744,3056;Inherit;False;Property;_Comparison;Comparison;97;1;[Enum];Create;True;0;9;Default;0;Greater;1;Greater or Equal;2;Less;3;Less or Equal;4;Equal;5;Not Equal;6;Always;7;Never;8;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;974;2639.509,3066.567;Inherit;True;Property;_GlowMask;Glow Mask;86;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;517;1313.557,2944.454;Inherit;False;IsTherePointLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1044;1744,3248;Inherit;False;Property;_ZFailFront;ZFail Front;100;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;2128,3072;Inherit;False;Property;_Units;Units;104;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1049;2128,3008;Inherit;False;Property;_Factor;Factor;103;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1189;8668.341,4470.591;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardAdd;0;1;ForwardAdd;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;True;1;LightMode=ForwardAdd;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1195;6761.374,4883.873;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Outline;0;3;Outline;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;True;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;1;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;CullMode=Front;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1188;8668.341,4363.591;Float;False;True;-1;2;ASWGuiltyGearStriveGUI;100;8;.Aerthas/Arc System Works/Game Select/Guilty Gear Strive/Opaque v7.2.2;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardBase;0;0;ForwardBase;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;True;True;True;255;True;1038;255;True;1039;255;True;1040;7;True;1041;1;True;1042;1;True;1043;1;True;1044;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;1046;True;3;True;1052;True;True;0;True;1049;0;True;1050;True;1;LightMode=ForwardBase;True;2;0;;0;0;Standard;0;0;5;True;True;False;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1193;8661.341,4396.591;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Deferred;0;2;Deferred;4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Deferred;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1194;8655.341,4624.591;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ShadowCaster;0;4;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;True;1046;True;3;True;1052;False;True;1;LightMode=ShadowCaster;False;0;;0;0;Standard;0;False;0
WireConnection;280;0;274;1
WireConnection;280;1;274;2
WireConnection;280;2;274;3
WireConnection;277;0;280;0
WireConnection;561;0;533;0
WireConnection;292;0;277;0
WireConnection;762;0;296;1
WireConnection;762;1;296;2
WireConnection;762;2;296;3
WireConnection;450;0;634;0
WireConnection;563;0;535;0
WireConnection;763;0;297;1
WireConnection;763;1;297;2
WireConnection;763;2;297;3
WireConnection;576;0;292;2
WireConnection;574;0;292;1
WireConnection;580;0;296;4
WireConnection;585;0;762;0
WireConnection;585;1;763;0
WireConnection;1070;0;1069;0
WireConnection;637;12;525;0
WireConnection;637;17;562;0
WireConnection;637;16;564;0
WireConnection;637;29;434;0
WireConnection;637;28;435;0
WireConnection;637;33;471;0
WireConnection;637;34;472;0
WireConnection;764;67;585;0
WireConnection;764;52;821;0
WireConnection;764;16;822;0
WireConnection;764;17;823;0
WireConnection;764;13;824;0
WireConnection;764;96;825;0
WireConnection;764;31;826;0
WireConnection;764;32;827;0
WireConnection;764;30;828;0
WireConnection;764;97;829;0
WireConnection;764;36;847;0
WireConnection;764;38;846;0
WireConnection;764;37;848;0
WireConnection;764;99;849;0
WireConnection;764;40;851;0
WireConnection;764;42;850;0
WireConnection;764;41;852;0
WireConnection;764;100;853;0
WireConnection;764;44;855;0
WireConnection;764;46;854;0
WireConnection;764;45;856;0
WireConnection;764;101;857;0
WireConnection;1005;0;1004;0
WireConnection;1117;0;1116;0
WireConnection;1066;0;1065;0
WireConnection;1007;0;1006;0
WireConnection;1072;0;1071;0
WireConnection;357;0;274;4
WireConnection;581;0;297;4
WireConnection;1085;5;637;0
WireConnection;1085;21;637;42
WireConnection;1085;6;637;52
WireConnection;1085;3;639;0
WireConnection;1085;1;706;0
WireConnection;1085;2;629;0
WireConnection;1085;11;707;0
WireConnection;1085;10;641;0
WireConnection;993;0;992;0
WireConnection;993;2;585;0
WireConnection;993;3;764;0
WireConnection;1156;24;993;0
WireConnection;1156;35;1121;0
WireConnection;1156;29;1073;0
WireConnection;1156;26;1075;0
WireConnection;1156;25;1074;0
WireConnection;1156;30;1012;0
WireConnection;1156;27;813;0
WireConnection;1156;28;1011;0
WireConnection;965;1;1085;0
WireConnection;965;3;1085;8
WireConnection;965;2;1085;9
WireConnection;965;5;753;0
WireConnection;965;7;729;0
WireConnection;965;80;758;0
WireConnection;965;8;746;0
WireConnection;965;9;711;0
WireConnection;965;10;716;0
WireConnection;965;11;727;0
WireConnection;965;12;731;0
WireConnection;965;13;732;0
WireConnection;965;97;922;0
WireConnection;965;101;923;0
WireConnection;965;104;924;0
WireConnection;965;107;925;0
WireConnection;965;110;926;0
WireConnection;573;0;292;0
WireConnection;780;0;778;0
WireConnection;1201;25;1200;0
WireConnection;1201;24;1203;0
WireConnection;1201;26;1205;0
WireConnection;1201;17;1016;0
WireConnection;1201;22;1017;0
WireConnection;1201;20;1013;0
WireConnection;1201;6;994;0
WireConnection;1201;7;1000;0
WireConnection;1201;8;1001;0
WireConnection;1201;9;1002;0
WireConnection;1201;10;1003;0
WireConnection;1201;1;965;100
WireConnection;1201;2;965;103
WireConnection;1201;3;965;106
WireConnection;1201;4;965;109
WireConnection;1201;5;965;112
WireConnection;578;0;1156;23
WireConnection;779;0;777;0
WireConnection;339;0;1156;0
WireConnection;872;0;871;0
WireConnection;920;0;1201;0
WireConnection;988;0;277;0
WireConnection;1086;6;965;76
WireConnection;1086;29;965;69
WireConnection;1086;39;965;62
WireConnection;1086;41;965;0
WireConnection;1086;7;767;0
WireConnection;1086;9;793;0
WireConnection;1086;94;804;0
WireConnection;1086;11;859;0
WireConnection;1086;67;860;0
WireConnection;1086;75;880;0
WireConnection;1086;76;881;0
WireConnection;1086;78;882;0
WireConnection;1086;81;885;0
WireConnection;1086;80;884;0
WireConnection;1086;79;883;0
WireConnection;1086;83;887;0
WireConnection;1086;82;888;0
WireConnection;1086;84;889;0
WireConnection;1086;85;894;0
WireConnection;1086;86;893;0
WireConnection;1086;87;892;0
WireConnection;1086;89;896;0
WireConnection;1086;88;897;0
WireConnection;1086;90;898;0
WireConnection;1025;0;1086;105
WireConnection;1181;25;1163;0
WireConnection;1181;10;632;0
WireConnection;1181;5;544;0
WireConnection;1181;14;873;0
WireConnection;1181;6;867;0
WireConnection;1181;7;869;0
WireConnection;1181;19;950;0
WireConnection;1031;0;983;0
WireConnection;1031;3;1032;0
WireConnection;947;0;1181;16
WireConnection;944;0;1181;0
WireConnection;1033;48;979;0
WireConnection;1033;59;978;0
WireConnection;1033;47;981;0
WireConnection;1033;50;985;0
WireConnection;1033;54;1031;0
WireConnection;1033;57;1196;0
WireConnection;1033;55;980;0
WireConnection;1033;56;1197;0
WireConnection;1106;1;1026;0
WireConnection;1106;2;1107;0
WireConnection;1106;3;1108;0
WireConnection;1106;4;1109;0
WireConnection;1106;5;1110;0
WireConnection;1106;6;1111;0
WireConnection;1106;7;1112;0
WireConnection;934;0;1106;0
WireConnection;934;1;870;0
WireConnection;932;0;933;0
WireConnection;932;1;1027;0
WireConnection;932;2;948;0
WireConnection;987;0;1033;0
WireConnection;1169;0;934;0
WireConnection;1169;1;932;0
WireConnection;1169;2;928;0
WireConnection;989;0;991;0
WireConnection;989;2;1169;0
WireConnection;989;3;990;0
WireConnection;1158;33;912;0
WireConnection;1158;47;911;0
WireConnection;1158;127;910;0
WireConnection;1158;35;909;0
WireConnection;1158;37;908;0
WireConnection;1158;36;907;0
WireConnection;1158;31;904;0
WireConnection;1158;155;1159;0
WireConnection;517;0;634;15
WireConnection;1195;0;1158;0
WireConnection;1195;1;1036;0
WireConnection;1195;2;1158;109
WireConnection;1188;0;989;0
ASEEND*/
//CHKSM=6437D739D8441AA8EF1AE649A55D76C65961EE64
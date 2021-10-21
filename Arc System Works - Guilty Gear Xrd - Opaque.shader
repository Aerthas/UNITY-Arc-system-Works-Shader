// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Game Select/Guilty Gear Xrd/Opaque v7.2.2"
{
	Properties
	{
		[Enum(Basic,0,Advanced,1)]_EditorVersion("Editor Version", Float) = 0
		_Base("Base", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		[Enum(Default Black,0,Shadow Priority,1,ILM Priority,2)]_ILMColorSetting("ILM Color Setting", Float) = 0
		_ILMAlphaColor("ILM Alpha Color", Color) = (1,0,0,0)
		_FakeGlobalLightColor("Fake Global Light Color", Color) = (1,1,1,0)
		_FakeGlobalLightIntensity("Fake Global Light Intensity", Float) = 0.4
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
		[Enum(Vertex Colors,0,ILM Channels,1,Base Alpha,2)]_DebugGroup("Debug Group", Float) = 0
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
		[ASEEnd]_Opacity("Opacity", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
	LOD 100

		Cull Front
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
			
			uniform float _Reference;
			uniform float _EditorVersion;
			uniform float _Units;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _ZWriteMode;
			uniform float _Comparison;
			uniform float _PassFront;
			uniform float _ZFailFront;
			uniform float _FailFront;
			uniform float _ZTestMode;
			uniform float _Opacity;
			uniform float _WriteMask;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
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
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
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
			float3 ViewMatrix0375_g1511(  )
			{
				return UNITY_MATRIX_V[0];
			}
			
			float3 ViewMatrix1373_g1511(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 StereoCameraViewPosition30_g1509(  )
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
			
			float3 StereoCameraViewDirection32_g1509( float3 worldPos )
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
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
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
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float2 uv_Base = i.ase_texcoord1.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g850 = _TotalReplacements;
				float4 break8_g855 = _Target5Color;
				float4 break8_g851 = _Target4Color;
				float4 break8_g853 = _Target3Color;
				float4 break8_g852 = _Target2Color;
				float4 break8_g854 = _Target1Color;
				float3x3 temp_output_67_0_g850 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g854 = float4( temp_output_67_0_g850[0] , 0.0 );
				float4 break6_g854 = temp_output_13_0_g854;
				float4 appendResult3_g854 = (float4(break8_g854.r , break8_g854.g , break8_g854.b , break6_g854.a));
				float4 appendResult7_g854 = (float4(break6_g854.r , break6_g854.g , break6_g854.b , 1.0));
				float smoothstepResult5_g854 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g854 , _Source1Color ));
				float4 lerpResult4_g854 = lerp( appendResult3_g854 , temp_output_13_0_g854 , smoothstepResult5_g854);
				float4 temp_output_106_0_g850 = lerpResult4_g854;
				float4 temp_output_13_0_g852 = temp_output_106_0_g850;
				float4 break6_g852 = temp_output_13_0_g852;
				float4 appendResult3_g852 = (float4(break8_g852.r , break8_g852.g , break8_g852.b , break6_g852.a));
				float4 appendResult7_g852 = (float4(break6_g852.r , break6_g852.g , break6_g852.b , 1.0));
				float smoothstepResult5_g852 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g852 , _Source2Color ));
				float4 lerpResult4_g852 = lerp( appendResult3_g852 , temp_output_13_0_g852 , smoothstepResult5_g852);
				float4 temp_output_102_0_g850 = lerpResult4_g852;
				float4 temp_output_13_0_g853 = temp_output_102_0_g850;
				float4 break6_g853 = temp_output_13_0_g853;
				float4 appendResult3_g853 = (float4(break8_g853.r , break8_g853.g , break8_g853.b , break6_g853.a));
				float4 appendResult7_g853 = (float4(break6_g853.r , break6_g853.g , break6_g853.b , 1.0));
				float smoothstepResult5_g853 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g853 , _Source3Color ));
				float4 lerpResult4_g853 = lerp( appendResult3_g853 , temp_output_13_0_g853 , smoothstepResult5_g853);
				float4 temp_output_104_0_g850 = lerpResult4_g853;
				float4 temp_output_13_0_g851 = temp_output_104_0_g850;
				float4 break6_g851 = temp_output_13_0_g851;
				float4 appendResult3_g851 = (float4(break8_g851.r , break8_g851.g , break8_g851.b , break6_g851.a));
				float4 appendResult7_g851 = (float4(break6_g851.r , break6_g851.g , break6_g851.b , 1.0));
				float smoothstepResult5_g851 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g851 , _Source4Color ));
				float4 lerpResult4_g851 = lerp( appendResult3_g851 , temp_output_13_0_g851 , smoothstepResult5_g851);
				float4 temp_output_105_0_g850 = lerpResult4_g851;
				float4 temp_output_13_0_g855 = temp_output_105_0_g850;
				float4 break6_g855 = temp_output_13_0_g855;
				float4 appendResult3_g855 = (float4(break8_g855.r , break8_g855.g , break8_g855.b , break6_g855.a));
				float4 appendResult7_g855 = (float4(break6_g855.r , break6_g855.g , break6_g855.b , 1.0));
				float smoothstepResult5_g855 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g855 , _Source5Color ));
				float4 lerpResult4_g855 = lerp( appendResult3_g855 , temp_output_13_0_g855 , smoothstepResult5_g855);
				float4 temp_output_15_0_g854 = float4( temp_output_67_0_g850[1] , 0.0 );
				float3 hsvTorgb25_g854 = RGBToHSV( temp_output_15_0_g854.rgb );
				float3 hsvTorgb26_g854 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g854.x ),hsvTorgb25_g854.y,hsvTorgb25_g854.z) );
				float4 appendResult18_g854 = (float4(hsvTorgb26_g854 , temp_output_15_0_g854.a));
				float4 lerpResult19_g854 = lerp( appendResult18_g854 , temp_output_15_0_g854 , smoothstepResult5_g854);
				float4 temp_output_15_0_g852 = lerpResult19_g854;
				float3 hsvTorgb25_g852 = RGBToHSV( temp_output_15_0_g852.rgb );
				float3 hsvTorgb26_g852 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g852.x ),hsvTorgb25_g852.y,hsvTorgb25_g852.z) );
				float4 appendResult18_g852 = (float4(hsvTorgb26_g852 , temp_output_15_0_g852.a));
				float4 lerpResult19_g852 = lerp( appendResult18_g852 , temp_output_15_0_g852 , smoothstepResult5_g852);
				float4 temp_output_15_0_g853 = lerpResult19_g852;
				float3 hsvTorgb25_g853 = RGBToHSV( temp_output_15_0_g853.rgb );
				float3 hsvTorgb26_g853 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g853.x ),hsvTorgb25_g853.y,hsvTorgb25_g853.z) );
				float4 appendResult18_g853 = (float4(hsvTorgb26_g853 , temp_output_15_0_g853.a));
				float4 lerpResult19_g853 = lerp( appendResult18_g853 , temp_output_15_0_g853 , smoothstepResult5_g853);
				float4 temp_output_15_0_g851 = lerpResult19_g853;
				float3 hsvTorgb25_g851 = RGBToHSV( temp_output_15_0_g851.rgb );
				float3 hsvTorgb26_g851 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g851.x ),hsvTorgb25_g851.y,hsvTorgb25_g851.z) );
				float4 appendResult18_g851 = (float4(hsvTorgb26_g851 , temp_output_15_0_g851.a));
				float4 lerpResult19_g851 = lerp( appendResult18_g851 , temp_output_15_0_g851 , smoothstepResult5_g851);
				float4 temp_output_15_0_g855 = lerpResult19_g851;
				float3 hsvTorgb25_g855 = RGBToHSV( temp_output_15_0_g855.rgb );
				float3 hsvTorgb26_g855 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g855.x ),hsvTorgb25_g855.y,hsvTorgb25_g855.z) );
				float4 appendResult18_g855 = (float4(hsvTorgb26_g855 , temp_output_15_0_g855.a));
				float4 lerpResult19_g855 = lerp( appendResult18_g855 , temp_output_15_0_g855 , smoothstepResult5_g855);
				float3x3 temp_output_993_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g850 == 5.0 ? lerpResult4_g855 : ( temp_output_52_0_g850 == 4.0 ? temp_output_105_0_g850 : ( temp_output_52_0_g850 == 3.0 ? temp_output_104_0_g850 : ( temp_output_52_0_g850 == 2.0 ? temp_output_102_0_g850 : ( temp_output_52_0_g850 == 1.0 ? temp_output_106_0_g850 : float4( temp_output_67_0_g850[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g855.rgb, float3( 0,0,0 )) );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1010 = lerp( ILMAColor1005 , float4( temp_output_993_0[0] , 0.0 ) , ILMA357);
				float4 Base339 = ( ILMColorSetting1007 == 1.0 ? lerpResult1010 : float4( ( ILMA357 * temp_output_993_0[0] ) , 0.0 ) );
				float4 Base12_g1515 = Base339;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix0375_g1511 = ViewMatrix0375_g1511();
				float3 normalizeResult384_g1511 = normalize( localViewMatrix0375_g1511 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 temp_output_380_0_g1511 = ( float3( 0,0,0 ) + ase_worldPos );
				float3 localViewMatrix1373_g1511 = ViewMatrix1373_g1511();
				float3 normalizeResult376_g1511 = normalize( localViewMatrix1373_g1511 );
				float3 localStereoCameraViewPosition30_g1509 = StereoCameraViewPosition30_g1509();
				float3 rotatedValue385_g1511 = RotateAroundAxis( temp_output_380_0_g1511, localStereoCameraViewPosition30_g1509, normalizeResult376_g1511, radians( ( _ViewDirOffsetYaw * -1.0 ) ) );
				float3 rotatedValue387_g1511 = RotateAroundAxis( temp_output_380_0_g1511, rotatedValue385_g1511, normalize( normalizeResult384_g1511 ), radians( ( _ViewDirOffsetPitch * 1.0 ) ) );
				float3 normalizeResult389_g1511 = normalize( ( rotatedValue387_g1511 - temp_output_380_0_g1511 ) );
				float3 normalizeResult38_g1509 = normalize( normalizeResult389_g1511 );
				float3 appendResult15_g1510 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1510 = normalize( appendResult15_g1510 );
				float3 normalizeResult26_g1509 = normalize( normalizeResult2_g1510 );
				float3 ifLocalVar3_g1509 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1509 = normalizeResult38_g1509;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1509 = normalizeResult26_g1509;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1505 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1505 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1505 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1505 = color8_g1505;
				#else
				float4 staticSwitch9_g1505 = ( clampResult7_g1505 * color14_g1505 );
				#endif
				float4 break10_g1505 = staticSwitch9_g1505;
				float IsThereWorldLight450 = break10_g1505.r;
				float3 ifLocalVar8_g1509 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1509 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1509 = ifLocalVar3_g1509;
				float3 ifLocalVar9_g1509 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1509 = ifLocalVar3_g1509;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1509 = ifLocalVar8_g1509;
				float3 normalizeResult48_g1509 = normalize( ifLocalVar9_g1509 );
				float3 worldPos32_g1509 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1509 = StereoCameraViewDirection32_g1509( worldPos32_g1509 );
				float3 normalizeResult51_g1509 = normalize( ( normalizeResult48_g1509 + localStereoCameraViewDirection32_g1509 ) );
				float dotResult50_g1509 = dot( normalizedWorldNormal , normalizeResult51_g1509 );
				float blendOpSrc34_g1512 = ILMB576;
				float blendOpDest34_g1512 = dotResult50_g1509;
				float clampResult87_g1513 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1512) / max( blendOpSrc34_g1512, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_28 = (clampResult87_g1513).xxxx;
				float4 blendOpSrc30_g1515 = Base12_g1515;
				float4 blendOpDest30_g1515 = temp_cast_28;
				float4 lerpBlendMode30_g1515 = lerp(blendOpDest30_g1515,min( blendOpSrc30_g1515 , blendOpDest30_g1515 ),0.9);
				float3 desaturateInitialColor9_g1518 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1515 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1518 = dot( desaturateInitialColor9_g1518, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1518 = lerp( desaturateInitialColor9_g1518, desaturateDot9_g1518.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 temp_output_95_0_g1515 = ( float4( desaturateVar9_g1518 , 0.0 ) + Base12_g1515 );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1516 = ( temp_output_95_0_g1515 * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1516 = dot( desaturateInitialColor9_g1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1516 = lerp( desaturateInitialColor9_g1516, desaturateDot9_g1516.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 SSS578 = temp_output_993_0[1];
				float4 SSS14_g1515 = float4( SSS578 , 0.0 );
				float4 temp_output_97_0_g1515 = ( temp_output_95_0_g1515 * SSS14_g1515 );
				float3 desaturateInitialColor9_g1519 = ( temp_output_97_0_g1515 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1519 = dot( desaturateInitialColor9_g1519, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1519 = lerp( desaturateInitialColor9_g1519, desaturateDot9_g1519.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc51_g1515 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1515 = temp_output_97_0_g1515;
				float4 lerpBlendMode51_g1515 = lerp(blendOpDest51_g1515,2.0f*blendOpDest51_g1515*blendOpSrc51_g1515 + blendOpDest51_g1515*blendOpDest51_g1515*(1.0f - 2.0f*blendOpSrc51_g1515),0.5);
				float3 desaturateInitialColor9_g1517 = ( ( saturate( lerpBlendMode51_g1515 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1517 = dot( desaturateInitialColor9_g1517, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1517 = lerp( desaturateInitialColor9_g1517, desaturateDot9_g1517.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1513 = i.ase_color.r;
				float dotResult46_g1509 = dot( ifLocalVar9_g1509 , normalizedWorldNormal );
				float temp_output_36_0_g1512 = ( ( dotResult46_g1509 + _GlobalLightPush ) * i.ase_color.r );
				float ILMG574 = break292.y;
				float temp_output_1_0_g1512 = ILMG574;
				float temp_output_1064_0 = ( temp_output_36_0_g1512 * temp_output_1_0_g1512 );
				float NdL20_g1513 = temp_output_1064_0;
				float temp_output_9_0_g1513 = _Shadow1Push;
				float temp_output_11_0_g1513 = _Shadow2Push;
				float clampResult15_g1513 = clamp( temp_output_9_0_g1513 , temp_output_11_0_g1513 , temp_output_9_0_g1513 );
				float RealShadow1Push16_g1513 = clampResult15_g1513;
				float clampResult17_g1513 = clamp( temp_output_11_0_g1513 , temp_output_11_0_g1513 , temp_output_9_0_g1513 );
				float RealShadow2Push18_g1513 = clampResult17_g1513;
				float temp_output_42_0_g1513 = max( max( ( 1.0 - ( VertexR33_g1513 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , ( NdL20_g1513 < RealShadow2Push18_g1513 ? 1.0 : 0.0 ) ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1513 = ( max( ( 1.0 - ( VertexR33_g1513 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( ( NdL20_g1513 < RealShadow1Push16_g1513 ? 1.0 : 0.0 ) , ( RealShadow1Push16_g1513 >= RealShadow2Push18_g1513 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1513 );
				float3 lerpResult100_g1515 = lerp( desaturateVar9_g1519 , desaturateVar9_g1517 , ( 1.0 - temp_output_43_0_g1513 ));
				float clampResult90_g1513 = clamp( ( 1.0 - ( temp_output_43_0_g1513 + temp_output_42_0_g1513 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1515 = clampResult90_g1513;
				float4 lerpResult101_g1515 = lerp( float4( desaturateVar9_g1516 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1515 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1515 ));
				float EnableRimlight82_g1513 = _EnableRimlight;
				float dotResult31_g1509 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1509 );
				float SSSA581 = tex2DNode297.a;
				float BaseA580 = tex2DNode296.a;
				float blendOpSrc15_g1512 = SSSA581;
				float blendOpDest15_g1512 = BaseA580;
				float NdV48_g1513 = ( ( 1.0 - ( dotResult31_g1509 + ( 1.0 - _RimlightSize ) ) ) * ( 1.0 - ( saturate( abs( blendOpSrc15_g1512 - blendOpDest15_g1512 ) )) ) );
				float clampResult91_g1513 = clamp( temp_output_42_0_g1513 , 0.0 , 1.0 );
				float clampResult88_g1513 = clamp( ( ceil( ( ( NdV48_g1513 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1513 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1513 = ( EnableRimlight82_g1513 == 1.0 ? clampResult88_g1513 : 0.0 );
				float3 desaturateInitialColor9_g1520 = ( ( Base12_g1515 * temp_output_94_0_g1513 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1520 = dot( desaturateInitialColor9_g1520, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1520 = lerp( desaturateInitialColor9_g1520, desaturateDot9_g1520.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1515 + float4( desaturateVar9_g1520 , 0.0 ) );
				float4 lerpResult1021 = lerp( ILMAColor1005 , ColorOut1025 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1522 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1522 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1522 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_41 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_42 = (5.0).xxxx;
				float4 clampResult18_g1522 = clamp( ase_lightColor , temp_cast_41 , temp_cast_42 );
				float4 temp_output_11_0_g1522 = ( ase_atten * clampResult18_g1522 );
				float4 temp_output_8_0_g1522 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1522 = 0;
				if( ifLocalVar13_g1522 > 0.0 )
				ifLocalVar3_g1522 = temp_output_11_0_g1522;
				else if( ifLocalVar13_g1522 == 0.0 )
				ifLocalVar3_g1522 = temp_output_8_0_g1522;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1522 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1522 );
				#else
				float4 staticSwitch9_g1522 = ifLocalVar3_g1522;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1522;
				float EmissionRampMask920 = ( ( ( temp_output_94_0_g1513 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1513 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1513 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1513 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1513 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float4 temp_cast_43 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1522 = 0;
				if( ifLocalVar13_g1522 > 0.0 )
				ifLocalVar17_g1522 = clampResult18_g1522;
				else if( ifLocalVar13_g1522 == 0.0 )
				ifLocalVar17_g1522 = temp_output_8_0_g1522;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1522 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1522 = max( temp_cast_43 , ifLocalVar17_g1522 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1522;
				float4 lerpResult1070 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult1021 : ColorOut1025 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1514 = _DebugGroup;
				float temp_output_47_0_g1514 = _VertexChannel;
				float4 temp_output_59_0_g1514 = _DebugColor;
				float temp_output_50_0_g1514 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1514 = appendResult1031;
				float4 break7_g1514 = temp_output_54_0_g1514;
				float temp_output_57_0_g1514 = 0.0;
				float4 Debug987 = ( temp_output_48_0_g1514 == 0.0 ? ( temp_output_47_0_g1514 == 0.0 ? i.ase_color : ( temp_output_47_0_g1514 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1514 ) : ( temp_output_47_0_g1514 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1514 ) : ( temp_output_47_0_g1514 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1514 ) : ( temp_output_47_0_g1514 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1514 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1514 == 1.0 ? ( temp_output_50_0_g1514 == 0.0 ? temp_output_54_0_g1514 : ( temp_output_50_0_g1514 == 1.0 ? ( break7_g1514.r * temp_output_59_0_g1514 ) : ( temp_output_50_0_g1514 == 2.0 ? ( break7_g1514.g * temp_output_59_0_g1514 ) : ( temp_output_50_0_g1514 == 3.0 ? ( break7_g1514.b * temp_output_59_0_g1514 ) : ( temp_output_50_0_g1514 == 4.0 ? ( break7_g1514.a * temp_output_59_0_g1514 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1514 == 2.0 ? ( temp_output_57_0_g1514 == 0.0 ? ( BaseA580 * temp_output_59_0_g1514 ) : ( temp_output_57_0_g1514 == 1.0 ? ( 0.0 * temp_output_59_0_g1514 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1070 : Debug987 ).rgb;
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
			
			uniform float _Reference;
			uniform float _EditorVersion;
			uniform float _Units;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _ZWriteMode;
			uniform float _Comparison;
			uniform float _PassFront;
			uniform float _ZFailFront;
			uniform float _FailFront;
			uniform float _ZTestMode;
			uniform float _Opacity;
			uniform float _WriteMask;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
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
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
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
			float3 ViewMatrix0375_g1511(  )
			{
				return UNITY_MATRIX_V[0];
			}
			
			float3 ViewMatrix1373_g1511(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 StereoCameraViewPosition30_g1509(  )
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
			
			float3 StereoCameraViewDirection32_g1509( float3 worldPos )
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
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
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
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float2 uv_Base = i.ase_texcoord1.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g850 = _TotalReplacements;
				float4 break8_g855 = _Target5Color;
				float4 break8_g851 = _Target4Color;
				float4 break8_g853 = _Target3Color;
				float4 break8_g852 = _Target2Color;
				float4 break8_g854 = _Target1Color;
				float3x3 temp_output_67_0_g850 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g854 = float4( temp_output_67_0_g850[0] , 0.0 );
				float4 break6_g854 = temp_output_13_0_g854;
				float4 appendResult3_g854 = (float4(break8_g854.r , break8_g854.g , break8_g854.b , break6_g854.a));
				float4 appendResult7_g854 = (float4(break6_g854.r , break6_g854.g , break6_g854.b , 1.0));
				float smoothstepResult5_g854 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g854 , _Source1Color ));
				float4 lerpResult4_g854 = lerp( appendResult3_g854 , temp_output_13_0_g854 , smoothstepResult5_g854);
				float4 temp_output_106_0_g850 = lerpResult4_g854;
				float4 temp_output_13_0_g852 = temp_output_106_0_g850;
				float4 break6_g852 = temp_output_13_0_g852;
				float4 appendResult3_g852 = (float4(break8_g852.r , break8_g852.g , break8_g852.b , break6_g852.a));
				float4 appendResult7_g852 = (float4(break6_g852.r , break6_g852.g , break6_g852.b , 1.0));
				float smoothstepResult5_g852 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g852 , _Source2Color ));
				float4 lerpResult4_g852 = lerp( appendResult3_g852 , temp_output_13_0_g852 , smoothstepResult5_g852);
				float4 temp_output_102_0_g850 = lerpResult4_g852;
				float4 temp_output_13_0_g853 = temp_output_102_0_g850;
				float4 break6_g853 = temp_output_13_0_g853;
				float4 appendResult3_g853 = (float4(break8_g853.r , break8_g853.g , break8_g853.b , break6_g853.a));
				float4 appendResult7_g853 = (float4(break6_g853.r , break6_g853.g , break6_g853.b , 1.0));
				float smoothstepResult5_g853 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g853 , _Source3Color ));
				float4 lerpResult4_g853 = lerp( appendResult3_g853 , temp_output_13_0_g853 , smoothstepResult5_g853);
				float4 temp_output_104_0_g850 = lerpResult4_g853;
				float4 temp_output_13_0_g851 = temp_output_104_0_g850;
				float4 break6_g851 = temp_output_13_0_g851;
				float4 appendResult3_g851 = (float4(break8_g851.r , break8_g851.g , break8_g851.b , break6_g851.a));
				float4 appendResult7_g851 = (float4(break6_g851.r , break6_g851.g , break6_g851.b , 1.0));
				float smoothstepResult5_g851 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g851 , _Source4Color ));
				float4 lerpResult4_g851 = lerp( appendResult3_g851 , temp_output_13_0_g851 , smoothstepResult5_g851);
				float4 temp_output_105_0_g850 = lerpResult4_g851;
				float4 temp_output_13_0_g855 = temp_output_105_0_g850;
				float4 break6_g855 = temp_output_13_0_g855;
				float4 appendResult3_g855 = (float4(break8_g855.r , break8_g855.g , break8_g855.b , break6_g855.a));
				float4 appendResult7_g855 = (float4(break6_g855.r , break6_g855.g , break6_g855.b , 1.0));
				float smoothstepResult5_g855 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g855 , _Source5Color ));
				float4 lerpResult4_g855 = lerp( appendResult3_g855 , temp_output_13_0_g855 , smoothstepResult5_g855);
				float4 temp_output_15_0_g854 = float4( temp_output_67_0_g850[1] , 0.0 );
				float3 hsvTorgb25_g854 = RGBToHSV( temp_output_15_0_g854.rgb );
				float3 hsvTorgb26_g854 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g854.x ),hsvTorgb25_g854.y,hsvTorgb25_g854.z) );
				float4 appendResult18_g854 = (float4(hsvTorgb26_g854 , temp_output_15_0_g854.a));
				float4 lerpResult19_g854 = lerp( appendResult18_g854 , temp_output_15_0_g854 , smoothstepResult5_g854);
				float4 temp_output_15_0_g852 = lerpResult19_g854;
				float3 hsvTorgb25_g852 = RGBToHSV( temp_output_15_0_g852.rgb );
				float3 hsvTorgb26_g852 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g852.x ),hsvTorgb25_g852.y,hsvTorgb25_g852.z) );
				float4 appendResult18_g852 = (float4(hsvTorgb26_g852 , temp_output_15_0_g852.a));
				float4 lerpResult19_g852 = lerp( appendResult18_g852 , temp_output_15_0_g852 , smoothstepResult5_g852);
				float4 temp_output_15_0_g853 = lerpResult19_g852;
				float3 hsvTorgb25_g853 = RGBToHSV( temp_output_15_0_g853.rgb );
				float3 hsvTorgb26_g853 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g853.x ),hsvTorgb25_g853.y,hsvTorgb25_g853.z) );
				float4 appendResult18_g853 = (float4(hsvTorgb26_g853 , temp_output_15_0_g853.a));
				float4 lerpResult19_g853 = lerp( appendResult18_g853 , temp_output_15_0_g853 , smoothstepResult5_g853);
				float4 temp_output_15_0_g851 = lerpResult19_g853;
				float3 hsvTorgb25_g851 = RGBToHSV( temp_output_15_0_g851.rgb );
				float3 hsvTorgb26_g851 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g851.x ),hsvTorgb25_g851.y,hsvTorgb25_g851.z) );
				float4 appendResult18_g851 = (float4(hsvTorgb26_g851 , temp_output_15_0_g851.a));
				float4 lerpResult19_g851 = lerp( appendResult18_g851 , temp_output_15_0_g851 , smoothstepResult5_g851);
				float4 temp_output_15_0_g855 = lerpResult19_g851;
				float3 hsvTorgb25_g855 = RGBToHSV( temp_output_15_0_g855.rgb );
				float3 hsvTorgb26_g855 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g855.x ),hsvTorgb25_g855.y,hsvTorgb25_g855.z) );
				float4 appendResult18_g855 = (float4(hsvTorgb26_g855 , temp_output_15_0_g855.a));
				float4 lerpResult19_g855 = lerp( appendResult18_g855 , temp_output_15_0_g855 , smoothstepResult5_g855);
				float3x3 temp_output_993_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g850 == 5.0 ? lerpResult4_g855 : ( temp_output_52_0_g850 == 4.0 ? temp_output_105_0_g850 : ( temp_output_52_0_g850 == 3.0 ? temp_output_104_0_g850 : ( temp_output_52_0_g850 == 2.0 ? temp_output_102_0_g850 : ( temp_output_52_0_g850 == 1.0 ? temp_output_106_0_g850 : float4( temp_output_67_0_g850[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g855.rgb, float3( 0,0,0 )) );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1010 = lerp( ILMAColor1005 , float4( temp_output_993_0[0] , 0.0 ) , ILMA357);
				float4 Base339 = ( ILMColorSetting1007 == 1.0 ? lerpResult1010 : float4( ( ILMA357 * temp_output_993_0[0] ) , 0.0 ) );
				float4 Base12_g1515 = Base339;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix0375_g1511 = ViewMatrix0375_g1511();
				float3 normalizeResult384_g1511 = normalize( localViewMatrix0375_g1511 );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 temp_output_380_0_g1511 = ( float3( 0,0,0 ) + ase_worldPos );
				float3 localViewMatrix1373_g1511 = ViewMatrix1373_g1511();
				float3 normalizeResult376_g1511 = normalize( localViewMatrix1373_g1511 );
				float3 localStereoCameraViewPosition30_g1509 = StereoCameraViewPosition30_g1509();
				float3 rotatedValue385_g1511 = RotateAroundAxis( temp_output_380_0_g1511, localStereoCameraViewPosition30_g1509, normalizeResult376_g1511, radians( ( _ViewDirOffsetYaw * -1.0 ) ) );
				float3 rotatedValue387_g1511 = RotateAroundAxis( temp_output_380_0_g1511, rotatedValue385_g1511, normalize( normalizeResult384_g1511 ), radians( ( _ViewDirOffsetPitch * 1.0 ) ) );
				float3 normalizeResult389_g1511 = normalize( ( rotatedValue387_g1511 - temp_output_380_0_g1511 ) );
				float3 normalizeResult38_g1509 = normalize( normalizeResult389_g1511 );
				float3 appendResult15_g1510 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1510 = normalize( appendResult15_g1510 );
				float3 normalizeResult26_g1509 = normalize( normalizeResult2_g1510 );
				float3 ifLocalVar3_g1509 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1509 = normalizeResult38_g1509;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1509 = normalizeResult26_g1509;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1505 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1505 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1505 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1505 = color8_g1505;
				#else
				float4 staticSwitch9_g1505 = ( clampResult7_g1505 * color14_g1505 );
				#endif
				float4 break10_g1505 = staticSwitch9_g1505;
				float IsThereWorldLight450 = break10_g1505.r;
				float3 ifLocalVar8_g1509 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1509 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1509 = ifLocalVar3_g1509;
				float3 ifLocalVar9_g1509 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1509 = ifLocalVar3_g1509;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1509 = ifLocalVar8_g1509;
				float3 normalizeResult48_g1509 = normalize( ifLocalVar9_g1509 );
				float3 worldPos32_g1509 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1509 = StereoCameraViewDirection32_g1509( worldPos32_g1509 );
				float3 normalizeResult51_g1509 = normalize( ( normalizeResult48_g1509 + localStereoCameraViewDirection32_g1509 ) );
				float dotResult50_g1509 = dot( normalizedWorldNormal , normalizeResult51_g1509 );
				float blendOpSrc34_g1512 = ILMB576;
				float blendOpDest34_g1512 = dotResult50_g1509;
				float clampResult87_g1513 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1512) / max( blendOpSrc34_g1512, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_28 = (clampResult87_g1513).xxxx;
				float4 blendOpSrc30_g1515 = Base12_g1515;
				float4 blendOpDest30_g1515 = temp_cast_28;
				float4 lerpBlendMode30_g1515 = lerp(blendOpDest30_g1515,min( blendOpSrc30_g1515 , blendOpDest30_g1515 ),0.9);
				float3 desaturateInitialColor9_g1518 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1515 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1518 = dot( desaturateInitialColor9_g1518, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1518 = lerp( desaturateInitialColor9_g1518, desaturateDot9_g1518.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 temp_output_95_0_g1515 = ( float4( desaturateVar9_g1518 , 0.0 ) + Base12_g1515 );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1516 = ( temp_output_95_0_g1515 * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1516 = dot( desaturateInitialColor9_g1516, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1516 = lerp( desaturateInitialColor9_g1516, desaturateDot9_g1516.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 SSS578 = temp_output_993_0[1];
				float4 SSS14_g1515 = float4( SSS578 , 0.0 );
				float4 temp_output_97_0_g1515 = ( temp_output_95_0_g1515 * SSS14_g1515 );
				float3 desaturateInitialColor9_g1519 = ( temp_output_97_0_g1515 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1519 = dot( desaturateInitialColor9_g1519, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1519 = lerp( desaturateInitialColor9_g1519, desaturateDot9_g1519.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc51_g1515 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1515 = temp_output_97_0_g1515;
				float4 lerpBlendMode51_g1515 = lerp(blendOpDest51_g1515,2.0f*blendOpDest51_g1515*blendOpSrc51_g1515 + blendOpDest51_g1515*blendOpDest51_g1515*(1.0f - 2.0f*blendOpSrc51_g1515),0.5);
				float3 desaturateInitialColor9_g1517 = ( ( saturate( lerpBlendMode51_g1515 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1517 = dot( desaturateInitialColor9_g1517, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1517 = lerp( desaturateInitialColor9_g1517, desaturateDot9_g1517.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1513 = i.ase_color.r;
				float dotResult46_g1509 = dot( ifLocalVar9_g1509 , normalizedWorldNormal );
				float temp_output_36_0_g1512 = ( ( dotResult46_g1509 + _GlobalLightPush ) * i.ase_color.r );
				float ILMG574 = break292.y;
				float temp_output_1_0_g1512 = ILMG574;
				float temp_output_1064_0 = ( temp_output_36_0_g1512 * temp_output_1_0_g1512 );
				float NdL20_g1513 = temp_output_1064_0;
				float temp_output_9_0_g1513 = _Shadow1Push;
				float temp_output_11_0_g1513 = _Shadow2Push;
				float clampResult15_g1513 = clamp( temp_output_9_0_g1513 , temp_output_11_0_g1513 , temp_output_9_0_g1513 );
				float RealShadow1Push16_g1513 = clampResult15_g1513;
				float clampResult17_g1513 = clamp( temp_output_11_0_g1513 , temp_output_11_0_g1513 , temp_output_9_0_g1513 );
				float RealShadow2Push18_g1513 = clampResult17_g1513;
				float temp_output_42_0_g1513 = max( max( ( 1.0 - ( VertexR33_g1513 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , ( NdL20_g1513 < RealShadow2Push18_g1513 ? 1.0 : 0.0 ) ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1513 = ( max( ( 1.0 - ( VertexR33_g1513 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( ( NdL20_g1513 < RealShadow1Push16_g1513 ? 1.0 : 0.0 ) , ( RealShadow1Push16_g1513 >= RealShadow2Push18_g1513 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1513 );
				float3 lerpResult100_g1515 = lerp( desaturateVar9_g1519 , desaturateVar9_g1517 , ( 1.0 - temp_output_43_0_g1513 ));
				float clampResult90_g1513 = clamp( ( 1.0 - ( temp_output_43_0_g1513 + temp_output_42_0_g1513 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1515 = clampResult90_g1513;
				float4 lerpResult101_g1515 = lerp( float4( desaturateVar9_g1516 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1515 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1515 ));
				float EnableRimlight82_g1513 = _EnableRimlight;
				float dotResult31_g1509 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1509 );
				float SSSA581 = tex2DNode297.a;
				float BaseA580 = tex2DNode296.a;
				float blendOpSrc15_g1512 = SSSA581;
				float blendOpDest15_g1512 = BaseA580;
				float NdV48_g1513 = ( ( 1.0 - ( dotResult31_g1509 + ( 1.0 - _RimlightSize ) ) ) * ( 1.0 - ( saturate( abs( blendOpSrc15_g1512 - blendOpDest15_g1512 ) )) ) );
				float clampResult91_g1513 = clamp( temp_output_42_0_g1513 , 0.0 , 1.0 );
				float clampResult88_g1513 = clamp( ( ceil( ( ( NdV48_g1513 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1513 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1513 = ( EnableRimlight82_g1513 == 1.0 ? clampResult88_g1513 : 0.0 );
				float3 desaturateInitialColor9_g1520 = ( ( Base12_g1515 * temp_output_94_0_g1513 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1520 = dot( desaturateInitialColor9_g1520, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1520 = lerp( desaturateInitialColor9_g1520, desaturateDot9_g1520.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1515 + float4( desaturateVar9_g1520 , 0.0 ) );
				float4 lerpResult1021 = lerp( ILMAColor1005 , ColorOut1025 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1522 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1522 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1522 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_41 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_42 = (5.0).xxxx;
				float4 clampResult18_g1522 = clamp( ase_lightColor , temp_cast_41 , temp_cast_42 );
				float4 temp_output_11_0_g1522 = ( ase_atten * clampResult18_g1522 );
				float4 temp_output_8_0_g1522 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1522 = 0;
				if( ifLocalVar13_g1522 > 0.0 )
				ifLocalVar3_g1522 = temp_output_11_0_g1522;
				else if( ifLocalVar13_g1522 == 0.0 )
				ifLocalVar3_g1522 = temp_output_8_0_g1522;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1522 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1522 );
				#else
				float4 staticSwitch9_g1522 = ifLocalVar3_g1522;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1522;
				float EmissionRampMask920 = ( ( ( temp_output_94_0_g1513 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1513 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1513 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1513 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1513 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float4 temp_cast_43 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1522 = 0;
				if( ifLocalVar13_g1522 > 0.0 )
				ifLocalVar17_g1522 = clampResult18_g1522;
				else if( ifLocalVar13_g1522 == 0.0 )
				ifLocalVar17_g1522 = temp_output_8_0_g1522;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1522 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1522 = max( temp_cast_43 , ifLocalVar17_g1522 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1522;
				float4 lerpResult1070 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult1021 : ColorOut1025 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1514 = _DebugGroup;
				float temp_output_47_0_g1514 = _VertexChannel;
				float4 temp_output_59_0_g1514 = _DebugColor;
				float temp_output_50_0_g1514 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1514 = appendResult1031;
				float4 break7_g1514 = temp_output_54_0_g1514;
				float temp_output_57_0_g1514 = 0.0;
				float4 Debug987 = ( temp_output_48_0_g1514 == 0.0 ? ( temp_output_47_0_g1514 == 0.0 ? i.ase_color : ( temp_output_47_0_g1514 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1514 ) : ( temp_output_47_0_g1514 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1514 ) : ( temp_output_47_0_g1514 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1514 ) : ( temp_output_47_0_g1514 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1514 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1514 == 1.0 ? ( temp_output_50_0_g1514 == 0.0 ? temp_output_54_0_g1514 : ( temp_output_50_0_g1514 == 1.0 ? ( break7_g1514.r * temp_output_59_0_g1514 ) : ( temp_output_50_0_g1514 == 2.0 ? ( break7_g1514.g * temp_output_59_0_g1514 ) : ( temp_output_50_0_g1514 == 3.0 ? ( break7_g1514.b * temp_output_59_0_g1514 ) : ( temp_output_50_0_g1514 == 4.0 ? ( break7_g1514.a * temp_output_59_0_g1514 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1514 == 2.0 ? ( temp_output_57_0_g1514 == 0.0 ? ( BaseA580 * temp_output_59_0_g1514 ) : ( temp_output_57_0_g1514 == 1.0 ? ( 0.0 * temp_output_59_0_g1514 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1070 : Debug987 ).rgb;
				outAlpha = 1;
				clip(outAlpha);
				return float4(outColor,outAlpha);
			}
			ENDCG
		}

		
		Pass
		{
			Name "Outline"
			Tags { "CullMode"="Front" "RenderType"="TransparentCutout" }
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
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
			};

			uniform float _Reference;
			uniform float _EditorVersion;
			uniform float _Units;
			uniform float _ReadMask;
			uniform float _Factor;
			uniform float _ZWriteMode;
			uniform float _Comparison;
			uniform float _PassFront;
			uniform float _ZFailFront;
			uniform float _FailFront;
			uniform float _ZTestMode;
			uniform float _Opacity;
			uniform float _WriteMask;
			uniform float _EnableCameraDistanceMult;
			uniform float _OutlineThickness;
			uniform float _DepthOffset;
			uniform float _OutlineEnableBaseColorMult;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
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
				float temp_output_33_0_g1521 = _OutlineThickness;
				float3 temp_output_135_0_g1521 = ( ( v.ase_normal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.ase_color.g * temp_output_33_0_g1521 ) + temp_output_33_0_g1521 ) * v.ase_color.a ) );
				float3 objectSpaceViewDir136_g1521 = ObjSpaceViewDir( float4( temp_output_135_0_g1521 , 0.0 ) );
				float4 normalizeResult142_g1521 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g1521 , 0.0 ) - v.vertex ) );
				float clampResult141_g1521 = clamp( ( v.ase_color.b + _DepthOffset ) , 0.0 , 1.0 );
				float4 lerpResult145_g1521 = lerp( float4( temp_output_135_0_g1521 , 0.0 ) , -normalizeResult142_g1521 , ( 1.0 - clampResult141_g1521 ));
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				v.vertex.xyz += lerpResult145_g1521.xyz;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float4 frag (v2f i ) : SV_Target
			{
				float3 outOutlineColor;
				float outOutlineAlpha;

				float ILMColorSetting1007 = _ILMColorSetting;
				float4 ILMAColor1005 = _ILMAlphaColor;
				float2 uv_Base = i.ase_texcoord.xy * _Base_ST.xy + _Base_ST.zw;
				float4 tex2DNode296 = tex2D( _Base, uv_Base );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g850 = _TotalReplacements;
				float4 break8_g855 = _Target5Color;
				float4 break8_g851 = _Target4Color;
				float4 break8_g853 = _Target3Color;
				float4 break8_g852 = _Target2Color;
				float4 break8_g854 = _Target1Color;
				float3x3 temp_output_67_0_g850 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g854 = float4( temp_output_67_0_g850[0] , 0.0 );
				float4 break6_g854 = temp_output_13_0_g854;
				float4 appendResult3_g854 = (float4(break8_g854.r , break8_g854.g , break8_g854.b , break6_g854.a));
				float4 appendResult7_g854 = (float4(break6_g854.r , break6_g854.g , break6_g854.b , 1.0));
				float smoothstepResult5_g854 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g854 , _Source1Color ));
				float4 lerpResult4_g854 = lerp( appendResult3_g854 , temp_output_13_0_g854 , smoothstepResult5_g854);
				float4 temp_output_106_0_g850 = lerpResult4_g854;
				float4 temp_output_13_0_g852 = temp_output_106_0_g850;
				float4 break6_g852 = temp_output_13_0_g852;
				float4 appendResult3_g852 = (float4(break8_g852.r , break8_g852.g , break8_g852.b , break6_g852.a));
				float4 appendResult7_g852 = (float4(break6_g852.r , break6_g852.g , break6_g852.b , 1.0));
				float smoothstepResult5_g852 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g852 , _Source2Color ));
				float4 lerpResult4_g852 = lerp( appendResult3_g852 , temp_output_13_0_g852 , smoothstepResult5_g852);
				float4 temp_output_102_0_g850 = lerpResult4_g852;
				float4 temp_output_13_0_g853 = temp_output_102_0_g850;
				float4 break6_g853 = temp_output_13_0_g853;
				float4 appendResult3_g853 = (float4(break8_g853.r , break8_g853.g , break8_g853.b , break6_g853.a));
				float4 appendResult7_g853 = (float4(break6_g853.r , break6_g853.g , break6_g853.b , 1.0));
				float smoothstepResult5_g853 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g853 , _Source3Color ));
				float4 lerpResult4_g853 = lerp( appendResult3_g853 , temp_output_13_0_g853 , smoothstepResult5_g853);
				float4 temp_output_104_0_g850 = lerpResult4_g853;
				float4 temp_output_13_0_g851 = temp_output_104_0_g850;
				float4 break6_g851 = temp_output_13_0_g851;
				float4 appendResult3_g851 = (float4(break8_g851.r , break8_g851.g , break8_g851.b , break6_g851.a));
				float4 appendResult7_g851 = (float4(break6_g851.r , break6_g851.g , break6_g851.b , 1.0));
				float smoothstepResult5_g851 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g851 , _Source4Color ));
				float4 lerpResult4_g851 = lerp( appendResult3_g851 , temp_output_13_0_g851 , smoothstepResult5_g851);
				float4 temp_output_105_0_g850 = lerpResult4_g851;
				float4 temp_output_13_0_g855 = temp_output_105_0_g850;
				float4 break6_g855 = temp_output_13_0_g855;
				float4 appendResult3_g855 = (float4(break8_g855.r , break8_g855.g , break8_g855.b , break6_g855.a));
				float4 appendResult7_g855 = (float4(break6_g855.r , break6_g855.g , break6_g855.b , 1.0));
				float smoothstepResult5_g855 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g855 , _Source5Color ));
				float4 lerpResult4_g855 = lerp( appendResult3_g855 , temp_output_13_0_g855 , smoothstepResult5_g855);
				float4 temp_output_15_0_g854 = float4( temp_output_67_0_g850[1] , 0.0 );
				float3 hsvTorgb25_g854 = RGBToHSV( temp_output_15_0_g854.rgb );
				float3 hsvTorgb26_g854 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g854.x ),hsvTorgb25_g854.y,hsvTorgb25_g854.z) );
				float4 appendResult18_g854 = (float4(hsvTorgb26_g854 , temp_output_15_0_g854.a));
				float4 lerpResult19_g854 = lerp( appendResult18_g854 , temp_output_15_0_g854 , smoothstepResult5_g854);
				float4 temp_output_15_0_g852 = lerpResult19_g854;
				float3 hsvTorgb25_g852 = RGBToHSV( temp_output_15_0_g852.rgb );
				float3 hsvTorgb26_g852 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g852.x ),hsvTorgb25_g852.y,hsvTorgb25_g852.z) );
				float4 appendResult18_g852 = (float4(hsvTorgb26_g852 , temp_output_15_0_g852.a));
				float4 lerpResult19_g852 = lerp( appendResult18_g852 , temp_output_15_0_g852 , smoothstepResult5_g852);
				float4 temp_output_15_0_g853 = lerpResult19_g852;
				float3 hsvTorgb25_g853 = RGBToHSV( temp_output_15_0_g853.rgb );
				float3 hsvTorgb26_g853 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g853.x ),hsvTorgb25_g853.y,hsvTorgb25_g853.z) );
				float4 appendResult18_g853 = (float4(hsvTorgb26_g853 , temp_output_15_0_g853.a));
				float4 lerpResult19_g853 = lerp( appendResult18_g853 , temp_output_15_0_g853 , smoothstepResult5_g853);
				float4 temp_output_15_0_g851 = lerpResult19_g853;
				float3 hsvTorgb25_g851 = RGBToHSV( temp_output_15_0_g851.rgb );
				float3 hsvTorgb26_g851 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g851.x ),hsvTorgb25_g851.y,hsvTorgb25_g851.z) );
				float4 appendResult18_g851 = (float4(hsvTorgb26_g851 , temp_output_15_0_g851.a));
				float4 lerpResult19_g851 = lerp( appendResult18_g851 , temp_output_15_0_g851 , smoothstepResult5_g851);
				float4 temp_output_15_0_g855 = lerpResult19_g851;
				float3 hsvTorgb25_g855 = RGBToHSV( temp_output_15_0_g855.rgb );
				float3 hsvTorgb26_g855 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g855.x ),hsvTorgb25_g855.y,hsvTorgb25_g855.z) );
				float4 appendResult18_g855 = (float4(hsvTorgb26_g855 , temp_output_15_0_g855.a));
				float4 lerpResult19_g855 = lerp( appendResult18_g855 , temp_output_15_0_g855 , smoothstepResult5_g855);
				float3x3 temp_output_993_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g850 == 5.0 ? lerpResult4_g855 : ( temp_output_52_0_g850 == 4.0 ? temp_output_105_0_g850 : ( temp_output_52_0_g850 == 3.0 ? temp_output_104_0_g850 : ( temp_output_52_0_g850 == 2.0 ? temp_output_102_0_g850 : ( temp_output_52_0_g850 == 1.0 ? temp_output_106_0_g850 : float4( temp_output_67_0_g850[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g855.rgb, float3( 0,0,0 )) );
				float2 uv_ILM = i.ase_texcoord.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1010 = lerp( ILMAColor1005 , float4( temp_output_993_0[0] , 0.0 ) , ILMA357);
				float4 Base339 = ( ILMColorSetting1007 == 1.0 ? lerpResult1010 : float4( ( ILMA357 * temp_output_993_0[0] ) , 0.0 ) );
				float4 temp_output_13_0_g1521 = max( float4( 0,0,0,0 ) , ( 0.2 * Base339 ) );
				

				outOutlineColor = ( ( _OutlineEnableBaseColorMult > 0.0 ? ( temp_output_13_0_g1521 * temp_output_13_0_g1521 ) : _OutlineColor ) * _OutlineColorIntensity ).rgb;
				outOutlineAlpha = _EnableOutline;
				clip(outOutlineAlpha);
				return float4(outOutlineColor,outOutlineAlpha);
			}
			ENDCG
		}

	
	}
	CustomEditor "ASWGuiltyGearXrdGUI"
	
	
}
/*ASEBEGIN
Version=18900
104;227;1939;816;-6944.134;-4731.332;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;781;-2786.293,2702.811;Inherit;False;3560.719;2932.564;;55;988;573;339;578;1008;587;815;580;574;1012;555;581;1010;576;586;813;1007;1011;292;1006;1005;357;993;277;1004;764;992;280;827;585;854;849;848;825;828;857;851;829;853;824;826;823;822;855;821;852;846;856;850;847;274;762;763;296;297;Color Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;297;-2678.854,3006.014;Inherit;True;Property;_SSS;SSS;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;296;-2723.293,2752.811;Inherit;True;Property;_Base;Base;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;763;-2332.82,3009.282;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;762;-2331.82,2777.283;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;849;-2522.85,4570.562;Inherit;False;Property;_SSSHueShift3;SSS Hue Shift 3;41;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-2522.85,5242.562;Inherit;False;Property;_Source5Fuzziness;Source 5 Fuzziness;47;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.MatrixFromVectors;585;-2126.762,2904.759;Inherit;False;FLOAT3x3;True;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;823;-2522.85,3450.56;Inherit;False;Property;_Source1Fuzziness;Source 1 Fuzziness;31;0;Create;True;0;0;0;False;0;False;0.01;0;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;825;-2522.85,3674.56;Inherit;False;Property;_SSSHueShift1;SSS Hue Shift 1;33;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;822;-2490.85,3290.56;Inherit;False;Property;_Source1Color;Source 1 Color;30;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;848;-2458.85,4410.562;Inherit;False;Property;_Target3Color;Target 3 Color;40;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;828;-2458.85,3962.56;Inherit;False;Property;_Target2Color;Target 2 Color;36;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;851;-2458.85,4634.562;Inherit;False;Property;_Source4Color;Source 4 Color;42;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;855;-2458.85,5082.562;Inherit;False;Property;_Source5Color;Source 5 Color;46;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;829;-2522.85,4122.562;Inherit;False;Property;_SSSHueShift2;SSS Hue Shift 2;37;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;847;-2458.85,4186.562;Inherit;False;Property;_Source3Color;Source 3 Color;38;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;853;-2522.85,5018.562;Inherit;False;Property;_SSSHueShift4;SSS Hue Shift 4;45;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;846;-2522.85,4346.562;Inherit;False;Property;_Source3Fuzziness;Source 3 Fuzziness;39;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;826;-2458.85,3738.56;Inherit;False;Property;_Source2Color;Source 2 Color;34;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;827;-2522.85,3898.56;Inherit;False;Property;_Source2Fuzziness;Source 2 Fuzziness;35;0;Create;True;0;0;0;False;0;False;0.01;0;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;857;-2522.85,5466.562;Inherit;False;Property;_SSSHueShift5;SSS Hue Shift 5;51;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;821;-2516.85,3216.56;Inherit;False;Property;_TotalReplacements;Total Replacements;29;1;[IntRange];Create;True;0;0;0;False;0;False;1;0;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;824;-2458.85,3514.56;Inherit;False;Property;_Target1Color;Target 1 Color;32;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;856;-2458.85,5306.562;Inherit;False;Property;_Target5Color;Target 5 Color;48;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;852;-2458.85,4858.562;Inherit;False;Property;_Target4Color;Target 4 Color;44;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;850;-2522.85,4794.562;Inherit;False;Property;_Source4Fuzziness;Source 4 Fuzziness;43;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1004;-1725.405,4958.093;Inherit;False;Property;_ILMAlphaColor;ILM Alpha Color;5;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;274;-1490.404,2845.581;Inherit;True;Property;_ILM;ILM;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;992;-1768.7,3223.38;Inherit;False;Property;_EnableColorReplacer;Enable Color Replacer;28;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;764;-1857.64,3503.761;Inherit;False;Color Replacer;-1;;850;3bf8a732171ac6840bcd0b4c21fcee62;0;22;67;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;52;FLOAT;0;False;16;COLOR;0,0,0,1;False;17;FLOAT;0;False;13;COLOR;0,0,0,0;False;96;FLOAT;0;False;31;COLOR;0,0,0,1;False;32;FLOAT;0;False;30;COLOR;0,0,0,0;False;97;FLOAT;0;False;36;COLOR;0,0,0,1;False;38;FLOAT;0;False;37;COLOR;0,0,0,0;False;99;FLOAT;0;False;40;COLOR;0,0,0,1;False;42;FLOAT;0;False;41;COLOR;0,0,0,0;False;100;FLOAT;0;False;44;COLOR;0,0,0,1;False;46;FLOAT;0;False;45;COLOR;0,0,0,0;False;101;FLOAT;0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;357;-1110.106,3006.807;Inherit;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1006;-1716.687,5143.85;Inherit;False;Property;_ILMColorSetting;ILM Color Setting;4;1;[Enum];Create;True;0;3;Default Black;0;Shadow Priority;1;ILM Priority;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1005;-1484.963,4957.933;Inherit;False;ILMAColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;993;-1466.289,3435.024;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;3;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1011;-1104.495,3229.523;Inherit;False;1005;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;813;-1196.734,3364.463;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VectorFromMatrixNode;586;-1229.119,3467.486;Inherit;False;Row;0;1;0;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1007;-1491.218,5140.88;Inherit;False;ILMColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;-861.4951,3196.523;Inherit;False;1007;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1010;-852.4734,3293.306;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;815;-838.2523,3435.599;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1008;-442.1735,3327.806;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;-266.7255,3326.549;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;915;7123.105,4949.887;Inherit;False;1259.777;695.248;;10;1074;1036;1053;904;911;907;910;909;912;908;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1030;5960.892,4337.456;Inherit;False;469.1748;214.0239;;2;934;870;Apply Light Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;558;922.4996,3449.375;Inherit;False;919.3984;663.7043;;8;637;562;564;472;434;471;435;525;Dot Creation;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;7283.105,5541.887;Inherit;False;339;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;907;7171.105,5453.887;Inherit;False;Property;_OutlineEnableBaseColorMult;Outline Enable Base Color Mult;83;1;[ToggleUI];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;908;7209.105,5381.887;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;82;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1045;1696,2816;Inherit;False;352;549;;7;1038;1039;1040;1041;1042;1043;1044;Stencil Buffer;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;555;-1765.585,4137.153;Inherit;False;1451.782;658.5377;;13;947;944;873;950;867;544;869;632;779;780;777;778;1065;Light Color Calculation;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;909;7245.105,5208.887;Inherit;False;Property;_OutlineColor;Outline Color;81;0;Create;True;0;0;0;True;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1019;5022.988,4153.521;Inherit;False;908.092;435.7986;;6;1026;1023;1021;1022;1024;1020;ILM Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1051;2080,2816;Inherit;False;253;357;;4;1046;1049;1050;1052;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1029;7806.709,4281.286;Inherit;False;468.2808;338.5957;;3;989;990;991;Enable Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;572;971.8275,2807.128;Inherit;False;703.0927;565.6688;;9;517;450;563;561;533;634;535;871;872;Light Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1028;6771.257,4323.543;Inherit;False;902.7671;555.4905;;6;1027;933;932;948;928;1070;Emission Combining;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;977;-383.4483,5722.681;Inherit;False;1110.669;779.1093;;10;987;1031;1033;981;985;979;978;980;983;1032;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;910;7180.105,5134.887;Inherit;False;Property;_DepthOffset;Depth Offset;80;0;Create;True;0;0;0;True;0;False;0.5;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;7251.105,4997.887;Inherit;False;Property;_OutlineThickness;Outline Thickness;78;0;Create;True;0;0;0;True;0;False;0;9.08;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;911;7171.105,5061.887;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;79;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;872;1337.175,3156.493;Inherit;False;LightColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;632;-1714.909,4190.506;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;870;6010.892,4436.479;Inherit;False;944;GlobalLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;544;-1725.444,4273.933;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1021;5492.121,4309.517;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;981;-291.8691,6048.467;Inherit;False;Property;_VertexChannel;Vertex Channel;49;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1024;5227.393,4222.407;Inherit;False;1005;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;979;-264.3643,5800.488;Inherit;False;Property;_DebugGroup;Debug Group;89;1;[Enum];Create;True;0;3;Vertex Colors;0;ILM Channels;1;Base Alpha;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;873;-1722.37,4361.219;Inherit;False;872;LightColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1032;-336.8296,6297.702;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1033;152.7226,6096.615;Inherit;False;Debug;-1;;1514;6f93fc90e278e9a449a8e28c4cbb4ee4;0;8;48;FLOAT;0;False;59;COLOR;0,0,0,0;False;47;FLOAT;0;False;50;FLOAT;0;False;54;COLOR;0,0,0,0;False;57;FLOAT;0;False;55;FLOAT;0;False;56;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1022;5455.785,4204.521;Inherit;False;1007;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1026;5050.318,4392.323;Inherit;False;1025;ColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1020;5293.244,4382.505;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;944;-974.9218,4293.536;Inherit;False;GlobalLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;950;-1748.428,4699.634;Inherit;False;Property;_MinimumGlobalLightIntensity;Minimum Global Light Intensity;12;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;778;-738.5991,4407.015;Inherit;False;Property;_AmbientColor;Ambient Color;18;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;882;3936,4672;Inherit;False;Property;_RimlightSaturation;Rimlight Saturation;54;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;711;3008,4096;Inherit;False;Property;_Shadow1Push;Shadow 1 Push;21;0;Create;True;0;0;0;False;0;False;0.5;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;869;-1746.997,4618.438;Inherit;False;Property;_FakeGlobalLightIntensity;Fake Global Light Intensity;7;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;920;4718.61,3473.063;Inherit;False;EmissionRampMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;641;2293,4137;Inherit;False;Property;_RimlightSize;Rimlight Size;26;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;888;4032,5088;Inherit;False;Property;_BaseTint;Base Tint;63;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;985;-311.8692,6132.467;Inherit;False;Property;_ILMChannel;ILM Channel;90;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1002;3616.589,3456.512;Inherit;False;Property;_Shadow1EmissionIntensity;Shadow 1 Emission Intensity;71;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1017;3618.042,3075.314;Inherit;False;Property;_ILMAlphaLinesEmissionToggle;ILM Alpha Lines Emission Toggle;92;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1023;5741.078,4392.133;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1046;2128,2880;Inherit;False;Property;_ZWriteMode;ZWrite Mode;101;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;947;-984.4599,4390.014;Inherit;False;EmissionLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;976;2667.509,3329.567;Inherit;False;Property;_GlowMaskTint;Glow Mask Tint;87;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;983;-347.8692,6215.467;Inherit;False;988;ILM;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1031;-122.8295,6242.702;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;779;-533.5998,4199.015;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;640;2336,3840;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;978;-296.3642,5880.488;Inherit;False;Property;_DebugColor;Debug Color;50;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1062;2689.375,2909.014;Inherit;False;Property;_Opacity;Opacity;104;0;Create;True;0;0;0;True;0;False;1;0.196;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;639;2336,3776;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1065;-1465.146,4211.977;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1025;4947.971,3801.074;Inherit;False;ColorOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;707;2295,4051;Inherit;False;Property;_GlobalLightPush;Global Light Push;16;0;Create;True;0;0;0;False;0;False;1;1;-1;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;989;8092.991,4358.792;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1040;1745,2992;Inherit;False;Property;_WriteMask;Write Mask;95;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1027;6866.877,4552.729;Inherit;False;1025;ColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;933;6852.452,4442.852;Inherit;False;Property;_EmissionIntensity;Emission Intensity;19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1075;-1427.66,4325.012;Inherit;False;Light Color Calculation;-1;;1522;5b8f5c3f2a647dc4d89d921c89ebb0e5;0;7;25;FLOAT;0;False;10;FLOAT;0;False;5;FLOAT;0;False;14;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;19;FLOAT;0;False;2;COLOR;0;COLOR;16
Node;AmplifyShaderEditor.RangedFloatNode;1049;2128,3008;Inherit;False;Property;_Factor;Factor;102;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;932;7144.705,4527.773;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1036;7797.562,5419.024;Inherit;False;Property;_EnableOutline;Enable Outline;77;1;[ToggleUI];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1053;7678.969,5104.001;Inherit;False;ASWOutline;-1;;1521;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.GetLocalVarNode;948;6801.707,4634.397;Inherit;False;947;EmissionLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;867;-1738.728,4444.135;Inherit;False;Property;_FakeGlobalLightColor;Fake Global Light Color;6;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1052;2128,2944;Inherit;False;Property;_ZTestMode;ZTest Mode;100;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;517;1313.557,2944.454;Inherit;False;IsTherePointLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;988;-703.5383,2747.413;Inherit;False;ILM;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;497.8569,6094.068;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1070;7498.749,4379.978;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1058;3077.777,3617.62;Inherit;False;myVarName;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;980;-332.8692,6389.467;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;3952,5536;Inherit;False;Property;_Shadow1Saturation;Shadow 1 Saturation;69;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;968;4512,3808;Inherit;False;Color Creation - Guilty Gear Xrd;-1;;1515;6fd14c10126085c4a9f0335974d35a1f;0;26;6;FLOAT;0;False;29;FLOAT;0;False;39;FLOAT;0;False;41;FLOAT;0;False;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;COLOR;0,0,0,0;False;10;FLOAT;0;False;94;FLOAT;0;False;11;COLOR;0,0,0,0;False;67;COLOR;0,0,0,0;False;75;FLOAT;1;False;76;COLOR;1,1,1,0;False;78;FLOAT;0;False;81;FLOAT;1;False;80;COLOR;1,1,1,0;False;79;FLOAT;0;False;83;FLOAT;1;False;82;COLOR;1,1,1,0;False;84;FLOAT;0;False;85;FLOAT;1;False;86;COLOR;1,1,1,0;False;87;FLOAT;0;False;89;FLOAT;1;False;88;COLOR;1,1,1,0;False;90;FLOAT;0;False;1;COLOR;105
Node;AmplifyShaderEditor.GetLocalVarNode;706;2336,3904;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1041;1744,3056;Inherit;False;Property;_Comparison;Comparison;96;1;[Enum];Create;True;0;9;Default;0;Greater;1;Greater or Equal;2;Less;3;Less or Equal;4;Equal;5;Not Equal;6;Always;7;Never;8;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1044;1744,3248;Inherit;False;Property;_ZFailFront;ZFail Front;99;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1043;1744,3184;Inherit;False;Property;_FailFront;Fail Front;98;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;991;7887.951,4331.286;Inherit;False;Property;_EnableDebug;Enable Debug;88;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;860;3984,4368;Inherit;False;780;AmbientColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;2336,3968;Inherit;False;576;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;2660.509,3255.567;Inherit;False;Property;_GlowMaskMultSystem;Glow Mask Mult System;86;1;[Enum];Create;True;0;2;Base Color Lerped From Mask;0;Mask Color;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1042;1744,3120;Inherit;False;Property;_PassFront;Pass Front;97;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1016;3728.264,3004.706;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;934;6261.067,4387.456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;923;3024,4480;Inherit;False;Property;_SpecularEmissiveToggle;Specular Emissive Toggle;60;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;727;3008,4224;Inherit;False;Property;_Shadow2Push;Shadow 2 Push;23;0;Create;True;0;0;0;False;0;False;-1;0.2;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;4000,5312;Inherit;False;Property;_Shadow1Intensity;Shadow 1 Intensity;67;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1038;1744,2864;Inherit;False;Property;_Reference;Reference;93;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;970;1370.1,2684.252;Inherit;False;Property;_EditorVersion;Editor Version;0;1;[Enum];Create;True;0;2;Basic;0;Advanced;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;990;7856.709,4504.88;Inherit;False;987;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;2128,3072;Inherit;False;Property;_Units;Units;103;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;634;1049.433,2895.548;Inherit;False;Is There A Light;-1;;1505;65e24b0fdfa2e3146a301178490755c7;0;0;2;FLOAT;0;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;922;3024,4416;Inherit;False;Property;_RimlightEmissiveToggle;Rimlight Emissive Toggle;55;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;924;3040,4544;Inherit;False;Property;_BaseEmissiveToggle;Base Emissive Toggle;65;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;716;2992,4160;Inherit;False;Property;_Shadow1VertexRThreshold;Shadow 1 VertexR Threshold;22;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;533;1058.975,3071.652;Inherit;False;Property;_LightDirectionSetting;Light Direction Setting;14;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;574;-600.7415,2903.808;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;1021.762,3769.256;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;8;0;Create;True;0;0;0;False;0;False;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;1021.762,3849.256;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;9;0;Create;True;0;0;0;False;0;False;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;525;986.4993,3512.944;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;280;-1167.917,2871.7;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;731;2992,4288;Inherit;False;Property;_Shadow2VertexRThreshold;Shadow 2 VertexR Threshold;24;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1039;1744,2928;Inherit;False;Property;_ReadMask;Read Mask;94;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;973;2680.509,2996.567;Inherit;False;Property;_EnableGlowMask;Enable GlowMask;84;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;758;3088,3968;Inherit;False;Property;_EnableRimlight;Enable Rimlight;27;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;472;941.7625,4009.256;Inherit;False;Property;_ViewDirOffsetYaw;View Dir Offset Yaw;11;0;Create;True;0;0;0;False;0;False;0;0;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;277;-1024.21,2870.06;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;471;941.7625,3929.256;Inherit;False;Property;_ViewDirOffsetPitch;View Dir Offset Pitch;10;0;Create;True;0;0;0;False;0;False;0;0;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;561;1314.975,3071.652;Inherit;False;LightDirectionSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;880;3984,4448;Inherit;False;Property;_RimlightIntensity;Rimlight Intensity;52;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;292;-751.6676,2872.298;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;576;-600.7415,2983.808;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;729;3092.385,3872.472;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;926;3008,4672;Inherit;False;Property;_Shadow2EmissiveToggle;Shadow 2 Emissive Toggle;75;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;580;-2393.363,2900.325;Inherit;False;BaseA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;562;957.7625,3609.256;Inherit;False;561;LightDirectionSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;581;-2343.923,3136.528;Inherit;False;SSSA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;1312.022,2857.128;Inherit;False;IsThereWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;564;957.7625,3689.256;Inherit;False;563;FallbackLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;974;2639.509,3066.567;Inherit;True;Property;_GlowMask;Glow Mask;85;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;804;4016,4208;Inherit;False;573;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;887;4048,5024;Inherit;False;Property;_BaseIntensity;Base Intensity;62;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1035;4243.784,3442.179;Inherit;False;Emission - Guilty Gear Xrd;-1;;1508;0804f3eb9e8a1224897e481e37ef96e3;0;13;17;FLOAT;0;False;22;FLOAT;0;False;20;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;898;3952,5824;Inherit;False;Property;_Shadow2Saturation;Shadow 2 Saturation;74;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;896;4000,5600;Inherit;False;Property;_Shadow2Intensity;Shadow 2 Intensity;72;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;777;-738.5991,4197.015;Inherit;False;Property;_LightColor;Light Color;17;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;883;3968,4960;Inherit;False;Property;_SpecularSaturation;Specular Saturation;59;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1003;3628.589,3540.512;Inherit;False;Property;_Shadow2EmissionIntensity;Shadow 2 Emission Intensity;76;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;871;1073.175,3157.493;Inherit;False;Property;_LightColorSetting;Light Color Setting;13;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;859;4016,4288;Inherit;False;779;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;535;1060.975,3242.652;Inherit;False;Property;_FallbackLightDirection;Fallback Light Direction;15;1;[Enum];Create;True;0;2;Fake Light Direction;0;View Direction;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;578;-953.1295,3642.289;Inherit;False;SSS;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VectorFromMatrixNode;587;-1222.119,3646.486;Inherit;False;Row;1;1;0;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;780;-533.5998,4408.015;Inherit;False;AmbientColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;965;3472,3680;Inherit;False;Ramp Creation - Guilty Gear Xrd;-1;;1513;92a8a58660488504fb4c65a454407910;0;17;1;FLOAT;0;False;3;FLOAT;0;False;2;FLOAT;0;False;5;FLOAT;0;False;7;FLOAT;0;False;80;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;97;FLOAT;0;False;101;FLOAT;0;False;104;FLOAT;0;False;107;FLOAT;0;False;110;FLOAT;0;False;10;FLOAT;100;FLOAT;103;FLOAT;106;FLOAT;109;FLOAT;112;FLOAT;76;FLOAT;69;FLOAT;62;FLOAT;0;FLOAT;44
Node;AmplifyShaderEditor.RangedFloatNode;1000;3623.496,3303.772;Inherit;False;Property;_SpecularEmissionIntensity;Specular Emission Intensity;61;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;928;6918.092,4728.719;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1064;2707.013,3668.041;Inherit;False;Final Dot Calculation;-1;;1512;966aa02f52a17a443a5106621d0d8d24;0;9;5;FLOAT;0;False;21;FLOAT;0;False;6;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;11;FLOAT;0;False;10;FLOAT;0;False;3;FLOAT;0;FLOAT;8;FLOAT;9
Node;AmplifyShaderEditor.RangedFloatNode;885;4016,4736;Inherit;False;Property;_SpecularIntensity;Specular Intensity;57;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;767;4016,4048;Inherit;False;339;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1013;3610.625,3147.818;Inherit;False;Property;_ILMAlphaEmissionIntensity;ILM Alpha Emission Intensity;91;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;753;3083.087,3792.721;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;746;3008,4032;Inherit;False;Property;_SpecularSize;Specular Size;20;0;Create;True;0;0;0;False;0;False;0.2;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;881;3984,4512;Inherit;False;Property;_RimlightTint;Rimlight Tint;53;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1001;3659.589,3378.512;Inherit;False;Property;_BaseEmissionIntensity;Base Emission Intensity;66;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;732;2992,4352;Inherit;False;Property;_PermanentShadowThreshold;Permanent Shadow Threshold;25;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;573;-600.7415,2823.808;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;884;4032,4800;Inherit;False;Property;_SpecularTint;Specular Tint;58;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;994;3633.195,3222.898;Inherit;False;Property;_RimlightEmissionIntensity;Rimlight Emission Intensity;56;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;1316.975,3242.652;Inherit;False;FallbackLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;637;1422.762,3657.256;Inherit;False;Dot Creation;-1;;1509;fd90efbfe94791944bc1c5b55d8d67e4;0;7;12;FLOAT;0;False;17;FLOAT;0;False;16;FLOAT;0;False;29;FLOAT;0;False;28;FLOAT;0;False;33;FLOAT;0;False;34;FLOAT;0;False;3;FLOAT;0;FLOAT;42;FLOAT;52
Node;AmplifyShaderEditor.RangedFloatNode;889;3952,5248;Inherit;False;Property;_BaseSaturation;Base Saturation;64;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;897;4016,5664;Inherit;False;Property;_Shadow2Tint;Shadow 2 Tint;73;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;893;4016,5376;Inherit;False;Property;_Shadow1Tint;Shadow 1 Tint;68;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;793;4016,4128;Inherit;False;578;SSS;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;925;3008,4608;Inherit;False;Property;_Shadow1EmissiveToggle;Shadow 1 Emissive Toggle;70;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1066;8426.12,4375.02;Float;False;True;-1;2;ASWGuiltyGearXrdGUI;100;8;.Aerthas/Arc System Works/Game Select/Guilty Gear Xrd/Opaque v7.2.2;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardBase;0;0;ForwardBase;3;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;True;True;True;255;True;1038;255;True;1039;255;True;1040;7;True;1041;1;True;1042;1;True;1043;1;True;1044;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;1046;True;3;True;1052;True;True;0;True;1049;0;True;1050;True;1;LightMode=ForwardBase;True;2;0;;0;0;Standard;0;0;5;True;True;False;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1074;8167.54,5152.328;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Outline;0;3;Outline;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;True;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;1;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;CullMode=Front;RenderType=TransparentCutout=RenderType;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1068;8306.228,4402.463;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Deferred;0;2;Deferred;4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Deferred;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1069;8426.12,4515.02;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ShadowCaster;0;4;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1067;8426.12,4482.02;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardAdd;0;1;ForwardAdd;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;True;1;LightMode=ForwardAdd;False;0;;0;0;Standard;0;False;0
WireConnection;763;0;297;1
WireConnection;763;1;297;2
WireConnection;763;2;297;3
WireConnection;762;0;296;1
WireConnection;762;1;296;2
WireConnection;762;2;296;3
WireConnection;585;0;762;0
WireConnection;585;1;763;0
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
WireConnection;357;0;274;4
WireConnection;1005;0;1004;0
WireConnection;993;0;992;0
WireConnection;993;2;585;0
WireConnection;993;3;764;0
WireConnection;586;0;993;0
WireConnection;1007;0;1006;0
WireConnection;1010;0;1011;0
WireConnection;1010;1;586;0
WireConnection;1010;2;813;0
WireConnection;815;0;813;0
WireConnection;815;1;586;0
WireConnection;1008;0;1012;0
WireConnection;1008;2;1010;0
WireConnection;1008;3;815;0
WireConnection;339;0;1008;0
WireConnection;872;0;871;0
WireConnection;1021;0;1024;0
WireConnection;1021;1;1026;0
WireConnection;1021;2;1020;0
WireConnection;1033;48;979;0
WireConnection;1033;59;978;0
WireConnection;1033;47;981;0
WireConnection;1033;50;985;0
WireConnection;1033;54;1031;0
WireConnection;1033;55;980;0
WireConnection;944;0;1075;0
WireConnection;920;0;1035;0
WireConnection;1023;0;1022;0
WireConnection;1023;2;1021;0
WireConnection;1023;3;1026;0
WireConnection;947;0;1075;16
WireConnection;1031;0;983;0
WireConnection;1031;3;1032;0
WireConnection;779;0;777;0
WireConnection;1025;0;968;105
WireConnection;989;0;991;0
WireConnection;989;2;1070;0
WireConnection;989;3;990;0
WireConnection;1075;25;1065;0
WireConnection;1075;10;632;0
WireConnection;1075;5;544;0
WireConnection;1075;14;873;0
WireConnection;1075;6;867;0
WireConnection;1075;7;869;0
WireConnection;1075;19;950;0
WireConnection;932;0;933;0
WireConnection;932;1;1027;0
WireConnection;932;2;948;0
WireConnection;1053;33;912;0
WireConnection;1053;47;911;0
WireConnection;1053;127;910;0
WireConnection;1053;35;909;0
WireConnection;1053;37;908;0
WireConnection;1053;36;907;0
WireConnection;1053;31;904;0
WireConnection;517;0;634;15
WireConnection;988;0;277;0
WireConnection;987;0;1033;0
WireConnection;1070;0;934;0
WireConnection;1070;1;932;0
WireConnection;1070;2;928;0
WireConnection;1058;0;1064;0
WireConnection;968;6;965;76
WireConnection;968;29;965;69
WireConnection;968;39;965;62
WireConnection;968;41;965;0
WireConnection;968;7;767;0
WireConnection;968;9;793;0
WireConnection;968;94;804;0
WireConnection;968;11;859;0
WireConnection;968;67;860;0
WireConnection;968;75;880;0
WireConnection;968;76;881;0
WireConnection;968;78;882;0
WireConnection;968;81;885;0
WireConnection;968;80;884;0
WireConnection;968;79;883;0
WireConnection;968;83;887;0
WireConnection;968;82;888;0
WireConnection;968;84;889;0
WireConnection;968;85;894;0
WireConnection;968;86;893;0
WireConnection;968;87;892;0
WireConnection;968;89;896;0
WireConnection;968;88;897;0
WireConnection;968;90;898;0
WireConnection;934;0;1023;0
WireConnection;934;1;870;0
WireConnection;574;0;292;1
WireConnection;280;0;274;1
WireConnection;280;1;274;2
WireConnection;280;2;274;3
WireConnection;277;0;280;0
WireConnection;561;0;533;0
WireConnection;292;0;277;0
WireConnection;576;0;292;2
WireConnection;580;0;296;4
WireConnection;581;0;297;4
WireConnection;450;0;634;0
WireConnection;1035;17;1016;0
WireConnection;1035;22;1017;0
WireConnection;1035;20;1013;0
WireConnection;1035;6;994;0
WireConnection;1035;7;1000;0
WireConnection;1035;8;1001;0
WireConnection;1035;9;1002;0
WireConnection;1035;10;1003;0
WireConnection;1035;1;965;100
WireConnection;1035;2;965;103
WireConnection;1035;3;965;106
WireConnection;1035;4;965;109
WireConnection;1035;5;965;112
WireConnection;578;0;587;0
WireConnection;587;0;993;0
WireConnection;780;0;778;0
WireConnection;965;1;1064;0
WireConnection;965;3;1064;8
WireConnection;965;2;1064;9
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
WireConnection;1064;5;637;0
WireConnection;1064;21;637;42
WireConnection;1064;6;637;52
WireConnection;1064;3;639;0
WireConnection;1064;4;640;0
WireConnection;1064;1;706;0
WireConnection;1064;2;629;0
WireConnection;1064;11;707;0
WireConnection;1064;10;641;0
WireConnection;573;0;292;0
WireConnection;563;0;535;0
WireConnection;637;12;525;0
WireConnection;637;17;562;0
WireConnection;637;16;564;0
WireConnection;637;29;434;0
WireConnection;637;28;435;0
WireConnection;637;33;471;0
WireConnection;637;34;472;0
WireConnection;1066;0;989;0
WireConnection;1074;0;1053;0
WireConnection;1074;1;1036;0
WireConnection;1074;2;1053;109
ASEEND*/
//CHKSM=7E345D373537E79CB3A09CBD8841AB739EAC6479
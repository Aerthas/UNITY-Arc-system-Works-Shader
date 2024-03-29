// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Game Select/Guilty Gear Strive/Transparent v8.1.4"
{
	Properties
	{
		[Enum(Basic,0,Advanced,1)]_EditorVersion("Editor Version", Float) = 0
		_MainTex("MainTex", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		[Enum(Default Black,0,Shadow Priority,1,ILM Priority,2)]_ILMColorSetting("ILM Color Setting", Float) = 0
		_ILMAlphaColor("ILM Alpha Color", Color) = (1,0,0,0)
		_FakeGlobalLightColor("Fake Global Light Color", Color) = (1,1,1,0)
		_FakeGlobalLightIntensity("Fake Global Light Intensity", Float) = 0.4
		[Enum(Default Black,0,Shadow Priority,1,Detail Priority,2)]_DetailColorSetting("Detail Color Setting", Float) = 0
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
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.3
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
		_OutlineThickness("Outline Thickness", Float) = 1
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
		_Opacity("Opacity", Range( 0 , 1)) = 1
		_Detail("Detail", 2D) = "white" {}
		_BodyLinesColor("Body Lines Color", Color) = (1,1,0,0)
		_OLM("OLM", 2D) = "white" {}
		[Enum(Base Alpha,0,SSS Alpha,1)]_BaseSSSAlphaSwap("BaseSSSAlphaSwap", Float) = 0
		[ToggleUI]_SSSAlphaEmissiveToggle("SSS Alpha Emissive Toggle", Float) = 0
		_SSSAlphaEmissiveIntensity("SSS Alpha Emissive Intensity", Float) = 1
		_Shadow1Smoothness("Shadow 1 Smoothness", Range( 0 , 1)) = 0
		_Shadow2Smoothness("Shadow 2 Smoothness", Range( 0 , 1)) = 0
		_EmissionMask("Emission Mask", 2D) = "black" {}
		[ASEEnd]_EmissionMaskIntensity("Emission Mask Intensity", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}

	}

	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "VRCFallback"="Toon" }
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
			Blend SrcAlpha OneMinusSrcAlpha
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
			
			uniform float _ZFailFront;
			uniform float _FailFront;
			uniform float _OutlineColorIntensity;
			uniform float _EnableOutline;
			uniform float _OutlineThickness;
			uniform float _ReadMask;
			uniform float _Comparison;
			uniform float _OutlineEnableBaseColorMult;
			uniform float _DepthOffset;
			uniform float _EnableCameraDistanceMult;
			uniform float _Reference;
			uniform float _PassFront;
			uniform float _WriteMask;
			uniform float _ZTestMode;
			uniform float _Units;
			uniform float _ZWriteMode;
			uniform float4 _OutlineColor;
			uniform float _EditorVersion;
			uniform float _Factor;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableColorReplacer;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
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
			uniform float _ViewDirOffsetYaw;
			uniform float _ViewDirOffsetPitch;
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
			uniform float _Shadow1Smoothness;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _Shadow2Smoothness;
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
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
			uniform float _EmissionMaskIntensity;
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
			uniform float _BaseSSSAlphaSwap;
			uniform float _Opacity;
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
			float3 ViewMatrix1418_g1513(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 ViewMatrix0417_g1513(  )
			{
				return UNITY_MATRIX_V[0];
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
			
			float3 StereoCameraViewPosition30_g1511(  )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				return cameraPos;
			}
			
			inline float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 StereoCameraViewDirection32_g1511( float3 worldPos )
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				UNITY_SHADOW_COORDS(5)
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
				o.ase_texcoord4 = v.vertex;
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
				float DetailColorSetting1067 = _DetailColorSetting;
				float4 DetailColor1066 = _BodyLinesColor;
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float ILMColorSetting60_g1519 = ILMColorSetting1007;
				float4 ILMAColor54_g1519 = ILMAColor1005;
				float DetailColorSetting44_g1519 = DetailColorSetting1067;
				float4 DetailColor41_g1519 = DetailColor1066;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1505 = _TotalReplacements;
				float4 break8_g1510 = _Target5Color;
				float4 break8_g1506 = _Target4Color;
				float4 break8_g1508 = _Target3Color;
				float4 break8_g1507 = _Target2Color;
				float4 break8_g1509 = _Target1Color;
				float3x3 temp_output_67_0_g1505 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1509 = float4( temp_output_67_0_g1505[0] , 0.0 );
				float4 break6_g1509 = temp_output_13_0_g1509;
				float4 appendResult3_g1509 = (float4(break8_g1509.r , break8_g1509.g , break8_g1509.b , break6_g1509.a));
				float4 appendResult7_g1509 = (float4(break6_g1509.r , break6_g1509.g , break6_g1509.b , 1.0));
				float smoothstepResult5_g1509 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1509 , _Source1Color ));
				float4 lerpResult4_g1509 = lerp( appendResult3_g1509 , temp_output_13_0_g1509 , smoothstepResult5_g1509);
				float4 temp_output_106_0_g1505 = lerpResult4_g1509;
				float4 temp_output_13_0_g1507 = temp_output_106_0_g1505;
				float4 break6_g1507 = temp_output_13_0_g1507;
				float4 appendResult3_g1507 = (float4(break8_g1507.r , break8_g1507.g , break8_g1507.b , break6_g1507.a));
				float4 appendResult7_g1507 = (float4(break6_g1507.r , break6_g1507.g , break6_g1507.b , 1.0));
				float smoothstepResult5_g1507 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1507 , _Source2Color ));
				float4 lerpResult4_g1507 = lerp( appendResult3_g1507 , temp_output_13_0_g1507 , smoothstepResult5_g1507);
				float4 temp_output_102_0_g1505 = lerpResult4_g1507;
				float4 temp_output_13_0_g1508 = temp_output_102_0_g1505;
				float4 break6_g1508 = temp_output_13_0_g1508;
				float4 appendResult3_g1508 = (float4(break8_g1508.r , break8_g1508.g , break8_g1508.b , break6_g1508.a));
				float4 appendResult7_g1508 = (float4(break6_g1508.r , break6_g1508.g , break6_g1508.b , 1.0));
				float smoothstepResult5_g1508 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1508 , _Source3Color ));
				float4 lerpResult4_g1508 = lerp( appendResult3_g1508 , temp_output_13_0_g1508 , smoothstepResult5_g1508);
				float4 temp_output_104_0_g1505 = lerpResult4_g1508;
				float4 temp_output_13_0_g1506 = temp_output_104_0_g1505;
				float4 break6_g1506 = temp_output_13_0_g1506;
				float4 appendResult3_g1506 = (float4(break8_g1506.r , break8_g1506.g , break8_g1506.b , break6_g1506.a));
				float4 appendResult7_g1506 = (float4(break6_g1506.r , break6_g1506.g , break6_g1506.b , 1.0));
				float smoothstepResult5_g1506 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1506 , _Source4Color ));
				float4 lerpResult4_g1506 = lerp( appendResult3_g1506 , temp_output_13_0_g1506 , smoothstepResult5_g1506);
				float4 temp_output_105_0_g1505 = lerpResult4_g1506;
				float4 temp_output_13_0_g1510 = temp_output_105_0_g1505;
				float4 break6_g1510 = temp_output_13_0_g1510;
				float4 appendResult3_g1510 = (float4(break8_g1510.r , break8_g1510.g , break8_g1510.b , break6_g1510.a));
				float4 appendResult7_g1510 = (float4(break6_g1510.r , break6_g1510.g , break6_g1510.b , 1.0));
				float smoothstepResult5_g1510 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1510 , _Source5Color ));
				float4 lerpResult4_g1510 = lerp( appendResult3_g1510 , temp_output_13_0_g1510 , smoothstepResult5_g1510);
				float4 temp_output_15_0_g1509 = float4( temp_output_67_0_g1505[1] , 0.0 );
				float3 hsvTorgb25_g1509 = RGBToHSV( temp_output_15_0_g1509.rgb );
				float3 hsvTorgb26_g1509 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1509.x ),hsvTorgb25_g1509.y,hsvTorgb25_g1509.z) );
				float4 appendResult18_g1509 = (float4(hsvTorgb26_g1509 , temp_output_15_0_g1509.a));
				float4 lerpResult19_g1509 = lerp( appendResult18_g1509 , temp_output_15_0_g1509 , smoothstepResult5_g1509);
				float4 temp_output_15_0_g1507 = lerpResult19_g1509;
				float3 hsvTorgb25_g1507 = RGBToHSV( temp_output_15_0_g1507.rgb );
				float3 hsvTorgb26_g1507 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1507.x ),hsvTorgb25_g1507.y,hsvTorgb25_g1507.z) );
				float4 appendResult18_g1507 = (float4(hsvTorgb26_g1507 , temp_output_15_0_g1507.a));
				float4 lerpResult19_g1507 = lerp( appendResult18_g1507 , temp_output_15_0_g1507 , smoothstepResult5_g1507);
				float4 temp_output_15_0_g1508 = lerpResult19_g1507;
				float3 hsvTorgb25_g1508 = RGBToHSV( temp_output_15_0_g1508.rgb );
				float3 hsvTorgb26_g1508 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1508.x ),hsvTorgb25_g1508.y,hsvTorgb25_g1508.z) );
				float4 appendResult18_g1508 = (float4(hsvTorgb26_g1508 , temp_output_15_0_g1508.a));
				float4 lerpResult19_g1508 = lerp( appendResult18_g1508 , temp_output_15_0_g1508 , smoothstepResult5_g1508);
				float4 temp_output_15_0_g1506 = lerpResult19_g1508;
				float3 hsvTorgb25_g1506 = RGBToHSV( temp_output_15_0_g1506.rgb );
				float3 hsvTorgb26_g1506 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1506.x ),hsvTorgb25_g1506.y,hsvTorgb25_g1506.z) );
				float4 appendResult18_g1506 = (float4(hsvTorgb26_g1506 , temp_output_15_0_g1506.a));
				float4 lerpResult19_g1506 = lerp( appendResult18_g1506 , temp_output_15_0_g1506 , smoothstepResult5_g1506);
				float4 temp_output_15_0_g1510 = lerpResult19_g1506;
				float3 hsvTorgb25_g1510 = RGBToHSV( temp_output_15_0_g1510.rgb );
				float3 hsvTorgb26_g1510 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1510.x ),hsvTorgb25_g1510.y,hsvTorgb25_g1510.z) );
				float4 appendResult18_g1510 = (float4(hsvTorgb26_g1510 , temp_output_15_0_g1510.a));
				float4 lerpResult19_g1510 = lerp( appendResult18_g1510 , temp_output_15_0_g1510 , smoothstepResult5_g1510);
				float3x3 temp_output_24_0_g1519 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1505 == 5.0 ? lerpResult4_g1510 : ( temp_output_52_0_g1505 == 4.0 ? temp_output_105_0_g1505 : ( temp_output_52_0_g1505 == 3.0 ? temp_output_104_0_g1505 : ( temp_output_52_0_g1505 == 2.0 ? temp_output_102_0_g1505 : ( temp_output_52_0_g1505 == 1.0 ? temp_output_106_0_g1505 : float4( temp_output_67_0_g1505[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1510.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1062 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1519 = Detail1062;
				float4 lerpResult10_g1519 = lerp( DetailColor41_g1519 , float4( temp_output_24_0_g1519[0] , 0.0 ) , detail38_g1519);
				float3 SSS50_g1519 = temp_output_24_0_g1519[1];
				float2 uv_OLM = i.ase_texcoord1.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1090 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1519 = OLM1090;
				float4 SSSOLM63_g1519 = ( float4( SSS50_g1519 , 0.0 ) * OLM47_g1519 );
				float4 lerpResult36_g1519 = lerp( SSSOLM63_g1519 , float4( temp_output_24_0_g1519[0] , 0.0 ) , detail38_g1519);
				float4 temp_output_20_0_g1519 = ( DetailColorSetting44_g1519 == 1.0 ? lerpResult10_g1519 : lerpResult36_g1519 );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1519 = ILMA357;
				float4 lerpResult12_g1519 = lerp( ILMAColor54_g1519 , temp_output_20_0_g1519 , ILMA57_g1519);
				float4 lerpResult65_g1519 = lerp( SSSOLM63_g1519 , temp_output_20_0_g1519 , ILMA57_g1519);
				float4 Base1076 = ( ILMColorSetting60_g1519 == 1.0 ? lerpResult12_g1519 : lerpResult65_g1519 );
				float4 Base12_g1521 = Base1076;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix1418_g1513 = ViewMatrix1418_g1513();
				float3 normalizeResult422_g1513 = normalize( localViewMatrix1418_g1513 );
				int localIsInMirror411_g1513 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_297_0_g1513 = _ViewDirOffsetYaw;
				float temp_output_424_0_g1513 = radians( ( (float)localIsInMirror411_g1513 == 0.0 ? -temp_output_297_0_g1513 : temp_output_297_0_g1513 ) );
				float3 localViewMatrix0417_g1513 = ViewMatrix0417_g1513();
				float3 normalizeResult425_g1513 = normalize( localViewMatrix0417_g1513 );
				float3 rotatedValue428_g1513 = RotateAroundAxis( float3( 0,0,0 ), normalizeResult425_g1513, normalizeResult422_g1513, temp_output_424_0_g1513 );
				float3 normalizeResult429_g1513 = normalize( rotatedValue428_g1513 );
				int localIsInMirror423_g1513 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_296_0_g1513 = _ViewDirOffsetPitch;
				float3 localStereoCameraViewPosition30_g1511 = StereoCameraViewPosition30_g1511();
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 rotatedValue431_g1513 = RotateAroundAxis( float3( 0,0,0 ), ( localStereoCameraViewPosition30_g1511 - ( ase_worldPos - i.ase_texcoord4.xyz ) ), normalizeResult422_g1513, temp_output_424_0_g1513 );
				float3 rotatedValue432_g1513 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue431_g1513, normalizeResult429_g1513, radians( ( (float)localIsInMirror423_g1513 == 0.0 ? temp_output_296_0_g1513 : -temp_output_296_0_g1513 ) ) );
				float3 normalizeResult433_g1513 = ASESafeNormalize( rotatedValue432_g1513 );
				float3 normalizeResult38_g1511 = normalize( normalizeResult433_g1513 );
				float3 appendResult15_g1512 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1512 = normalize( appendResult15_g1512 );
				float3 normalizeResult26_g1511 = normalize( normalizeResult2_g1512 );
				float3 ifLocalVar3_g1511 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1511 = normalizeResult38_g1511;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1511 = normalizeResult26_g1511;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g842 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g842 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g842 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g842 = color8_g842;
				#else
				float4 staticSwitch9_g842 = ( clampResult7_g842 * color14_g842 );
				#endif
				float4 break10_g842 = staticSwitch9_g842;
				float IsThereWorldLight450 = break10_g842.r;
				float3 ifLocalVar8_g1511 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1511 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1511 = ifLocalVar3_g1511;
				float3 ifLocalVar9_g1511 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1511 = ifLocalVar3_g1511;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1511 = ifLocalVar8_g1511;
				float3 normalizeResult48_g1511 = normalize( ifLocalVar9_g1511 );
				float3 worldPos32_g1511 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1511 = StereoCameraViewDirection32_g1511( worldPos32_g1511 );
				float3 normalizeResult51_g1511 = normalize( ( normalizeResult48_g1511 + localStereoCameraViewDirection32_g1511 ) );
				float dotResult50_g1511 = dot( normalizedWorldNormal , normalizeResult51_g1511 );
				float blendOpSrc34_g1514 = ILMB576;
				float blendOpDest34_g1514 = dotResult50_g1511;
				float clampResult87_g1516 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1514) / max( blendOpSrc34_g1514, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_31 = (clampResult87_g1516).xxxx;
				float4 blendOpSrc30_g1521 = Base12_g1521;
				float4 blendOpDest30_g1521 = temp_cast_31;
				float4 lerpBlendMode30_g1521 = lerp(blendOpDest30_g1521,min( blendOpSrc30_g1521 , blendOpDest30_g1521 ),0.9);
				float3 desaturateInitialColor9_g1524 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1521 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1524 = dot( desaturateInitialColor9_g1524, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1524 = lerp( desaturateInitialColor9_g1524, desaturateDot9_g1524.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1526 = ( ( float4( desaturateVar9_g1524 , 0.0 ) + Base12_g1521 ) * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1526 = dot( desaturateInitialColor9_g1526, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1526 = lerp( desaturateInitialColor9_g1526, desaturateDot9_g1526.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 Base52_g1519 = temp_output_24_0_g1519[0];
				float3 blendOpSrc31_g1519 = Base52_g1519;
				float3 blendOpDest31_g1519 = temp_output_24_0_g1519[1];
				float4 lerpResult7_g1519 = lerp( ( DetailColor41_g1519 * float4( ( saturate( abs( blendOpSrc31_g1519 - blendOpDest31_g1519 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1519[1] , 0.0 ) , detail38_g1519);
				float4 lerpResult69_g1519 = lerp( SSSOLM63_g1519 , float4( temp_output_24_0_g1519[1] , 0.0 ) , detail38_g1519);
				float4 temp_output_8_0_g1519 = ( DetailColorSetting44_g1519 == 1.0 ? lerpResult7_g1519 : lerpResult69_g1519 );
				float4 blendOpSrc32_g1519 = temp_output_20_0_g1519;
				float4 blendOpDest32_g1519 = temp_output_8_0_g1519;
				float4 lerpResult17_g1519 = lerp( ( ILMAColor54_g1519 * ( saturate( abs( blendOpSrc32_g1519 - blendOpDest32_g1519 ) )) ) , temp_output_8_0_g1519 , ILMA57_g1519);
				float4 lerpResult67_g1519 = lerp( SSSOLM63_g1519 , temp_output_8_0_g1519 , ILMA57_g1519);
				float4 SSS1077 = ( ILMColorSetting60_g1519 == 1.0 ? lerpResult17_g1519 : lerpResult67_g1519 );
				float4 SSS14_g1521 = SSS1077;
				float3 desaturateInitialColor9_g1523 = ( SSS14_g1521 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1523 = dot( desaturateInitialColor9_g1523, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1523 = lerp( desaturateInitialColor9_g1523, desaturateDot9_g1523.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc108_g1521 = float4( 0,0,0,0 );
				float4 blendOpDest108_g1521 = Base12_g1521;
				float4 blendOpSrc51_g1521 = ( saturate( min( blendOpSrc108_g1521 , blendOpDest108_g1521 ) ));
				float4 blendOpDest51_g1521 = SSS14_g1521;
				float4 lerpBlendMode51_g1521 = lerp(blendOpDest51_g1521,2.0f*blendOpDest51_g1521*blendOpSrc51_g1521 + blendOpDest51_g1521*blendOpDest51_g1521*(1.0f - 2.0f*blendOpSrc51_g1521),0.5);
				float3 desaturateInitialColor9_g1522 = ( ( saturate( lerpBlendMode51_g1521 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1522 = dot( desaturateInitialColor9_g1522, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1522 = lerp( desaturateInitialColor9_g1522, desaturateDot9_g1522.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1516 = pow( pow( i.ase_color.r , 2.2 ) , 2.2 );
				float dotResult46_g1511 = dot( ifLocalVar9_g1511 , normalizedWorldNormal );
				float ILMG574 = break292.y;
				float temp_output_1087_0 = ( ( ( ( dotResult46_g1511 + _GlobalLightPush ) * i.ase_color.r ) * 0.5 ) + ( ( ILMG574 * 2.0 ) - 1.0 ) );
				float NdL20_g1516 = temp_output_1087_0;
				float temp_output_2_0_g1517 = NdL20_g1516;
				float temp_output_3_0_g1517 = -_Shadow1Smoothness;
				float temp_output_9_0_g1516 = _Shadow1Push;
				float temp_output_11_0_g1516 = _Shadow2Push;
				float clampResult15_g1516 = clamp( temp_output_9_0_g1516 , temp_output_11_0_g1516 , temp_output_9_0_g1516 );
				float RealShadow1Push16_g1516 = clampResult15_g1516;
				float temp_output_1_0_g1517 = RealShadow1Push16_g1516;
				float smoothstepResult6_g1517 = smoothstep( ( ( temp_output_2_0_g1517 / 1.0 ) + temp_output_3_0_g1517 ) , temp_output_2_0_g1517 , temp_output_1_0_g1517);
				float lerpResult7_g1517 = lerp( smoothstepResult6_g1517 , ( temp_output_1_0_g1517 >= temp_output_2_0_g1517 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1517 ? 1.0 : 0.0 ));
				float clampResult17_g1516 = clamp( temp_output_11_0_g1516 , temp_output_11_0_g1516 , temp_output_9_0_g1516 );
				float RealShadow2Push18_g1516 = clampResult17_g1516;
				float temp_output_2_0_g1518 = NdL20_g1516;
				float temp_output_3_0_g1518 = -_Shadow2Smoothness;
				float temp_output_1_0_g1518 = RealShadow2Push18_g1516;
				float smoothstepResult6_g1518 = smoothstep( ( ( temp_output_2_0_g1518 / 1.0 ) + temp_output_3_0_g1518 ) , temp_output_2_0_g1518 , temp_output_1_0_g1518);
				float lerpResult7_g1518 = lerp( smoothstepResult6_g1518 , ( temp_output_1_0_g1518 >= temp_output_2_0_g1518 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1518 ? 1.0 : 0.0 ));
				float temp_output_42_0_g1516 = max( max( ( 1.0 - ( VertexR33_g1516 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , lerpResult7_g1518 ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1516 = ( max( ( 1.0 - ( VertexR33_g1516 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( lerpResult7_g1517 , ( RealShadow1Push16_g1516 >= RealShadow2Push18_g1516 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1516 );
				float3 lerpResult100_g1521 = lerp( desaturateVar9_g1523 , desaturateVar9_g1522 , ( 1.0 - temp_output_43_0_g1516 ));
				float clampResult90_g1516 = clamp( ( 1.0 - ( temp_output_43_0_g1516 + temp_output_42_0_g1516 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1521 = clampResult90_g1516;
				float4 lerpResult101_g1521 = lerp( float4( desaturateVar9_g1526 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1521 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1521 ));
				float EnableRimlight82_g1516 = _EnableRimlight;
				float dotResult31_g1511 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1511 );
				float BaseA580 = tex2DNode296.a;
				float NdV48_g1516 = ( ( 1.0 - ( dotResult31_g1511 + ( 1.0 - _RimlightSize ) ) ) * BaseA580 );
				float clampResult91_g1516 = clamp( temp_output_42_0_g1516 , 0.0 , 1.0 );
				float clampResult88_g1516 = clamp( ( ceil( ( ( NdV48_g1516 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1516 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1516 = ( EnableRimlight82_g1516 == 1.0 ? clampResult88_g1516 : 0.0 );
				float3 desaturateInitialColor9_g1525 = ( ( Base12_g1521 * temp_output_94_0_g1516 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1525 = dot( desaturateInitialColor9_g1525, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1525 = lerp( desaturateInitialColor9_g1525, desaturateDot9_g1525.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1521 + float4( desaturateVar9_g1525 , 0.0 ) );
				float4 temp_output_1_0_g1533 = ColorOut1025;
				float4 lerpResult8_g1533 = lerp( DetailColor1066 , temp_output_1_0_g1533 , Detail1062);
				float4 temp_output_9_0_g1533 = ( DetailColorSetting1067 == 2.0 ? lerpResult8_g1533 : temp_output_1_0_g1533 );
				float4 lerpResult10_g1533 = lerp( ILMAColor1005 , temp_output_9_0_g1533 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1527 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1527 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1527 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_44 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_45 = (5.0).xxxx;
				float4 clampResult18_g1527 = clamp( ase_lightColor , temp_cast_44 , temp_cast_45 );
				float4 temp_output_11_0_g1527 = ( ase_atten * clampResult18_g1527 );
				float4 temp_output_8_0_g1527 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1527 = 0;
				if( ifLocalVar13_g1527 > 0.0 )
				ifLocalVar3_g1527 = temp_output_11_0_g1527;
				else if( ifLocalVar13_g1527 == 0.0 )
				ifLocalVar3_g1527 = temp_output_8_0_g1527;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1527 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1527 );
				#else
				float4 staticSwitch9_g1527 = ifLocalVar3_g1527;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1527;
				float temp_output_12_0_g1520 = ( ( ( temp_output_94_0_g1516 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1516 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1516 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1516 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1516 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float SSSA581 = tex2DNode297.a;
				float temp_output_28_0_g1520 = ( _SSSAlphaEmissiveToggle * ( SSSA581 >= 0.5 ? _SSSAlphaEmissiveIntensity : 0.0 ) );
				float clampResult30_g1520 = clamp( ( temp_output_12_0_g1520 - temp_output_28_0_g1520 ) , 0.0 , temp_output_12_0_g1520 );
				float2 uv_EmissionMask = i.ase_texcoord1.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float EmissionRampMask920 = max( ( clampResult30_g1520 + temp_output_28_0_g1520 ) , ( tex2D( _EmissionMask, uv_EmissionMask ).r * _EmissionMaskIntensity ) );
				float4 temp_cast_47 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1527 = 0;
				if( ifLocalVar13_g1527 > 0.0 )
				ifLocalVar17_g1527 = clampResult18_g1527;
				else if( ifLocalVar13_g1527 == 0.0 )
				ifLocalVar17_g1527 = temp_output_8_0_g1527;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1527 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1527 = max( temp_cast_47 , ifLocalVar17_g1527 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1527;
				float4 lerpResult1100 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult10_g1533 : temp_output_9_0_g1533 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1532 = _DebugGroup;
				float temp_output_47_0_g1532 = _VertexChannel;
				float4 temp_output_59_0_g1532 = _DebugColor;
				float temp_output_50_0_g1532 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1532 = appendResult1031;
				float4 break7_g1532 = temp_output_54_0_g1532;
				float temp_output_57_0_g1532 = _BaseSSSAlphaSwap;
				float4 Debug987 = ( temp_output_48_0_g1532 == 0.0 ? ( temp_output_47_0_g1532 == 0.0 ? i.ase_color : ( temp_output_47_0_g1532 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1532 == 1.0 ? ( temp_output_50_0_g1532 == 0.0 ? temp_output_54_0_g1532 : ( temp_output_50_0_g1532 == 1.0 ? ( break7_g1532.r * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 2.0 ? ( break7_g1532.g * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 3.0 ? ( break7_g1532.b * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 4.0 ? ( break7_g1532.a * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1532 == 2.0 ? ( temp_output_57_0_g1532 == 0.0 ? ( BaseA580 * temp_output_59_0_g1532 ) : ( temp_output_57_0_g1532 == 1.0 ? ( SSSA581 * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1100 : Debug987 ).rgb;
				outAlpha = _Opacity;
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
			
			uniform float _ZFailFront;
			uniform float _FailFront;
			uniform float _OutlineColorIntensity;
			uniform float _EnableOutline;
			uniform float _OutlineThickness;
			uniform float _ReadMask;
			uniform float _Comparison;
			uniform float _OutlineEnableBaseColorMult;
			uniform float _DepthOffset;
			uniform float _EnableCameraDistanceMult;
			uniform float _Reference;
			uniform float _PassFront;
			uniform float _WriteMask;
			uniform float _ZTestMode;
			uniform float _Units;
			uniform float _ZWriteMode;
			uniform float4 _OutlineColor;
			uniform float _EditorVersion;
			uniform float _Factor;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableColorReplacer;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
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
			uniform float _ViewDirOffsetYaw;
			uniform float _ViewDirOffsetPitch;
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
			uniform float _Shadow1Smoothness;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _Shadow2Smoothness;
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
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
			uniform float _EmissionMaskIntensity;
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
			uniform float _BaseSSSAlphaSwap;
			uniform float _Opacity;
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
			float3 ViewMatrix1418_g1513(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 ViewMatrix0417_g1513(  )
			{
				return UNITY_MATRIX_V[0];
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
			
			float3 StereoCameraViewPosition30_g1511(  )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				return cameraPos;
			}
			
			inline float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 StereoCameraViewDirection32_g1511( float3 worldPos )
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				UNITY_SHADOW_COORDS(5)
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
				o.ase_texcoord4 = v.vertex;
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
				float DetailColorSetting1067 = _DetailColorSetting;
				float4 DetailColor1066 = _BodyLinesColor;
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float ILMColorSetting60_g1519 = ILMColorSetting1007;
				float4 ILMAColor54_g1519 = ILMAColor1005;
				float DetailColorSetting44_g1519 = DetailColorSetting1067;
				float4 DetailColor41_g1519 = DetailColor1066;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1505 = _TotalReplacements;
				float4 break8_g1510 = _Target5Color;
				float4 break8_g1506 = _Target4Color;
				float4 break8_g1508 = _Target3Color;
				float4 break8_g1507 = _Target2Color;
				float4 break8_g1509 = _Target1Color;
				float3x3 temp_output_67_0_g1505 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1509 = float4( temp_output_67_0_g1505[0] , 0.0 );
				float4 break6_g1509 = temp_output_13_0_g1509;
				float4 appendResult3_g1509 = (float4(break8_g1509.r , break8_g1509.g , break8_g1509.b , break6_g1509.a));
				float4 appendResult7_g1509 = (float4(break6_g1509.r , break6_g1509.g , break6_g1509.b , 1.0));
				float smoothstepResult5_g1509 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1509 , _Source1Color ));
				float4 lerpResult4_g1509 = lerp( appendResult3_g1509 , temp_output_13_0_g1509 , smoothstepResult5_g1509);
				float4 temp_output_106_0_g1505 = lerpResult4_g1509;
				float4 temp_output_13_0_g1507 = temp_output_106_0_g1505;
				float4 break6_g1507 = temp_output_13_0_g1507;
				float4 appendResult3_g1507 = (float4(break8_g1507.r , break8_g1507.g , break8_g1507.b , break6_g1507.a));
				float4 appendResult7_g1507 = (float4(break6_g1507.r , break6_g1507.g , break6_g1507.b , 1.0));
				float smoothstepResult5_g1507 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1507 , _Source2Color ));
				float4 lerpResult4_g1507 = lerp( appendResult3_g1507 , temp_output_13_0_g1507 , smoothstepResult5_g1507);
				float4 temp_output_102_0_g1505 = lerpResult4_g1507;
				float4 temp_output_13_0_g1508 = temp_output_102_0_g1505;
				float4 break6_g1508 = temp_output_13_0_g1508;
				float4 appendResult3_g1508 = (float4(break8_g1508.r , break8_g1508.g , break8_g1508.b , break6_g1508.a));
				float4 appendResult7_g1508 = (float4(break6_g1508.r , break6_g1508.g , break6_g1508.b , 1.0));
				float smoothstepResult5_g1508 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1508 , _Source3Color ));
				float4 lerpResult4_g1508 = lerp( appendResult3_g1508 , temp_output_13_0_g1508 , smoothstepResult5_g1508);
				float4 temp_output_104_0_g1505 = lerpResult4_g1508;
				float4 temp_output_13_0_g1506 = temp_output_104_0_g1505;
				float4 break6_g1506 = temp_output_13_0_g1506;
				float4 appendResult3_g1506 = (float4(break8_g1506.r , break8_g1506.g , break8_g1506.b , break6_g1506.a));
				float4 appendResult7_g1506 = (float4(break6_g1506.r , break6_g1506.g , break6_g1506.b , 1.0));
				float smoothstepResult5_g1506 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1506 , _Source4Color ));
				float4 lerpResult4_g1506 = lerp( appendResult3_g1506 , temp_output_13_0_g1506 , smoothstepResult5_g1506);
				float4 temp_output_105_0_g1505 = lerpResult4_g1506;
				float4 temp_output_13_0_g1510 = temp_output_105_0_g1505;
				float4 break6_g1510 = temp_output_13_0_g1510;
				float4 appendResult3_g1510 = (float4(break8_g1510.r , break8_g1510.g , break8_g1510.b , break6_g1510.a));
				float4 appendResult7_g1510 = (float4(break6_g1510.r , break6_g1510.g , break6_g1510.b , 1.0));
				float smoothstepResult5_g1510 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1510 , _Source5Color ));
				float4 lerpResult4_g1510 = lerp( appendResult3_g1510 , temp_output_13_0_g1510 , smoothstepResult5_g1510);
				float4 temp_output_15_0_g1509 = float4( temp_output_67_0_g1505[1] , 0.0 );
				float3 hsvTorgb25_g1509 = RGBToHSV( temp_output_15_0_g1509.rgb );
				float3 hsvTorgb26_g1509 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1509.x ),hsvTorgb25_g1509.y,hsvTorgb25_g1509.z) );
				float4 appendResult18_g1509 = (float4(hsvTorgb26_g1509 , temp_output_15_0_g1509.a));
				float4 lerpResult19_g1509 = lerp( appendResult18_g1509 , temp_output_15_0_g1509 , smoothstepResult5_g1509);
				float4 temp_output_15_0_g1507 = lerpResult19_g1509;
				float3 hsvTorgb25_g1507 = RGBToHSV( temp_output_15_0_g1507.rgb );
				float3 hsvTorgb26_g1507 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1507.x ),hsvTorgb25_g1507.y,hsvTorgb25_g1507.z) );
				float4 appendResult18_g1507 = (float4(hsvTorgb26_g1507 , temp_output_15_0_g1507.a));
				float4 lerpResult19_g1507 = lerp( appendResult18_g1507 , temp_output_15_0_g1507 , smoothstepResult5_g1507);
				float4 temp_output_15_0_g1508 = lerpResult19_g1507;
				float3 hsvTorgb25_g1508 = RGBToHSV( temp_output_15_0_g1508.rgb );
				float3 hsvTorgb26_g1508 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1508.x ),hsvTorgb25_g1508.y,hsvTorgb25_g1508.z) );
				float4 appendResult18_g1508 = (float4(hsvTorgb26_g1508 , temp_output_15_0_g1508.a));
				float4 lerpResult19_g1508 = lerp( appendResult18_g1508 , temp_output_15_0_g1508 , smoothstepResult5_g1508);
				float4 temp_output_15_0_g1506 = lerpResult19_g1508;
				float3 hsvTorgb25_g1506 = RGBToHSV( temp_output_15_0_g1506.rgb );
				float3 hsvTorgb26_g1506 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1506.x ),hsvTorgb25_g1506.y,hsvTorgb25_g1506.z) );
				float4 appendResult18_g1506 = (float4(hsvTorgb26_g1506 , temp_output_15_0_g1506.a));
				float4 lerpResult19_g1506 = lerp( appendResult18_g1506 , temp_output_15_0_g1506 , smoothstepResult5_g1506);
				float4 temp_output_15_0_g1510 = lerpResult19_g1506;
				float3 hsvTorgb25_g1510 = RGBToHSV( temp_output_15_0_g1510.rgb );
				float3 hsvTorgb26_g1510 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1510.x ),hsvTorgb25_g1510.y,hsvTorgb25_g1510.z) );
				float4 appendResult18_g1510 = (float4(hsvTorgb26_g1510 , temp_output_15_0_g1510.a));
				float4 lerpResult19_g1510 = lerp( appendResult18_g1510 , temp_output_15_0_g1510 , smoothstepResult5_g1510);
				float3x3 temp_output_24_0_g1519 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1505 == 5.0 ? lerpResult4_g1510 : ( temp_output_52_0_g1505 == 4.0 ? temp_output_105_0_g1505 : ( temp_output_52_0_g1505 == 3.0 ? temp_output_104_0_g1505 : ( temp_output_52_0_g1505 == 2.0 ? temp_output_102_0_g1505 : ( temp_output_52_0_g1505 == 1.0 ? temp_output_106_0_g1505 : float4( temp_output_67_0_g1505[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1510.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1062 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1519 = Detail1062;
				float4 lerpResult10_g1519 = lerp( DetailColor41_g1519 , float4( temp_output_24_0_g1519[0] , 0.0 ) , detail38_g1519);
				float3 SSS50_g1519 = temp_output_24_0_g1519[1];
				float2 uv_OLM = i.ase_texcoord1.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1090 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1519 = OLM1090;
				float4 SSSOLM63_g1519 = ( float4( SSS50_g1519 , 0.0 ) * OLM47_g1519 );
				float4 lerpResult36_g1519 = lerp( SSSOLM63_g1519 , float4( temp_output_24_0_g1519[0] , 0.0 ) , detail38_g1519);
				float4 temp_output_20_0_g1519 = ( DetailColorSetting44_g1519 == 1.0 ? lerpResult10_g1519 : lerpResult36_g1519 );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1519 = ILMA357;
				float4 lerpResult12_g1519 = lerp( ILMAColor54_g1519 , temp_output_20_0_g1519 , ILMA57_g1519);
				float4 lerpResult65_g1519 = lerp( SSSOLM63_g1519 , temp_output_20_0_g1519 , ILMA57_g1519);
				float4 Base1076 = ( ILMColorSetting60_g1519 == 1.0 ? lerpResult12_g1519 : lerpResult65_g1519 );
				float4 Base12_g1521 = Base1076;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix1418_g1513 = ViewMatrix1418_g1513();
				float3 normalizeResult422_g1513 = normalize( localViewMatrix1418_g1513 );
				int localIsInMirror411_g1513 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_297_0_g1513 = _ViewDirOffsetYaw;
				float temp_output_424_0_g1513 = radians( ( (float)localIsInMirror411_g1513 == 0.0 ? -temp_output_297_0_g1513 : temp_output_297_0_g1513 ) );
				float3 localViewMatrix0417_g1513 = ViewMatrix0417_g1513();
				float3 normalizeResult425_g1513 = normalize( localViewMatrix0417_g1513 );
				float3 rotatedValue428_g1513 = RotateAroundAxis( float3( 0,0,0 ), normalizeResult425_g1513, normalizeResult422_g1513, temp_output_424_0_g1513 );
				float3 normalizeResult429_g1513 = normalize( rotatedValue428_g1513 );
				int localIsInMirror423_g1513 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_296_0_g1513 = _ViewDirOffsetPitch;
				float3 localStereoCameraViewPosition30_g1511 = StereoCameraViewPosition30_g1511();
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 rotatedValue431_g1513 = RotateAroundAxis( float3( 0,0,0 ), ( localStereoCameraViewPosition30_g1511 - ( ase_worldPos - i.ase_texcoord4.xyz ) ), normalizeResult422_g1513, temp_output_424_0_g1513 );
				float3 rotatedValue432_g1513 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue431_g1513, normalizeResult429_g1513, radians( ( (float)localIsInMirror423_g1513 == 0.0 ? temp_output_296_0_g1513 : -temp_output_296_0_g1513 ) ) );
				float3 normalizeResult433_g1513 = ASESafeNormalize( rotatedValue432_g1513 );
				float3 normalizeResult38_g1511 = normalize( normalizeResult433_g1513 );
				float3 appendResult15_g1512 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1512 = normalize( appendResult15_g1512 );
				float3 normalizeResult26_g1511 = normalize( normalizeResult2_g1512 );
				float3 ifLocalVar3_g1511 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1511 = normalizeResult38_g1511;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1511 = normalizeResult26_g1511;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g842 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g842 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g842 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g842 = color8_g842;
				#else
				float4 staticSwitch9_g842 = ( clampResult7_g842 * color14_g842 );
				#endif
				float4 break10_g842 = staticSwitch9_g842;
				float IsThereWorldLight450 = break10_g842.r;
				float3 ifLocalVar8_g1511 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1511 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1511 = ifLocalVar3_g1511;
				float3 ifLocalVar9_g1511 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1511 = ifLocalVar3_g1511;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1511 = ifLocalVar8_g1511;
				float3 normalizeResult48_g1511 = normalize( ifLocalVar9_g1511 );
				float3 worldPos32_g1511 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1511 = StereoCameraViewDirection32_g1511( worldPos32_g1511 );
				float3 normalizeResult51_g1511 = normalize( ( normalizeResult48_g1511 + localStereoCameraViewDirection32_g1511 ) );
				float dotResult50_g1511 = dot( normalizedWorldNormal , normalizeResult51_g1511 );
				float blendOpSrc34_g1514 = ILMB576;
				float blendOpDest34_g1514 = dotResult50_g1511;
				float clampResult87_g1516 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1514) / max( blendOpSrc34_g1514, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_31 = (clampResult87_g1516).xxxx;
				float4 blendOpSrc30_g1521 = Base12_g1521;
				float4 blendOpDest30_g1521 = temp_cast_31;
				float4 lerpBlendMode30_g1521 = lerp(blendOpDest30_g1521,min( blendOpSrc30_g1521 , blendOpDest30_g1521 ),0.9);
				float3 desaturateInitialColor9_g1524 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1521 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1524 = dot( desaturateInitialColor9_g1524, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1524 = lerp( desaturateInitialColor9_g1524, desaturateDot9_g1524.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1526 = ( ( float4( desaturateVar9_g1524 , 0.0 ) + Base12_g1521 ) * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1526 = dot( desaturateInitialColor9_g1526, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1526 = lerp( desaturateInitialColor9_g1526, desaturateDot9_g1526.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 Base52_g1519 = temp_output_24_0_g1519[0];
				float3 blendOpSrc31_g1519 = Base52_g1519;
				float3 blendOpDest31_g1519 = temp_output_24_0_g1519[1];
				float4 lerpResult7_g1519 = lerp( ( DetailColor41_g1519 * float4( ( saturate( abs( blendOpSrc31_g1519 - blendOpDest31_g1519 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1519[1] , 0.0 ) , detail38_g1519);
				float4 lerpResult69_g1519 = lerp( SSSOLM63_g1519 , float4( temp_output_24_0_g1519[1] , 0.0 ) , detail38_g1519);
				float4 temp_output_8_0_g1519 = ( DetailColorSetting44_g1519 == 1.0 ? lerpResult7_g1519 : lerpResult69_g1519 );
				float4 blendOpSrc32_g1519 = temp_output_20_0_g1519;
				float4 blendOpDest32_g1519 = temp_output_8_0_g1519;
				float4 lerpResult17_g1519 = lerp( ( ILMAColor54_g1519 * ( saturate( abs( blendOpSrc32_g1519 - blendOpDest32_g1519 ) )) ) , temp_output_8_0_g1519 , ILMA57_g1519);
				float4 lerpResult67_g1519 = lerp( SSSOLM63_g1519 , temp_output_8_0_g1519 , ILMA57_g1519);
				float4 SSS1077 = ( ILMColorSetting60_g1519 == 1.0 ? lerpResult17_g1519 : lerpResult67_g1519 );
				float4 SSS14_g1521 = SSS1077;
				float3 desaturateInitialColor9_g1523 = ( SSS14_g1521 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1523 = dot( desaturateInitialColor9_g1523, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1523 = lerp( desaturateInitialColor9_g1523, desaturateDot9_g1523.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc108_g1521 = float4( 0,0,0,0 );
				float4 blendOpDest108_g1521 = Base12_g1521;
				float4 blendOpSrc51_g1521 = ( saturate( min( blendOpSrc108_g1521 , blendOpDest108_g1521 ) ));
				float4 blendOpDest51_g1521 = SSS14_g1521;
				float4 lerpBlendMode51_g1521 = lerp(blendOpDest51_g1521,2.0f*blendOpDest51_g1521*blendOpSrc51_g1521 + blendOpDest51_g1521*blendOpDest51_g1521*(1.0f - 2.0f*blendOpSrc51_g1521),0.5);
				float3 desaturateInitialColor9_g1522 = ( ( saturate( lerpBlendMode51_g1521 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1522 = dot( desaturateInitialColor9_g1522, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1522 = lerp( desaturateInitialColor9_g1522, desaturateDot9_g1522.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1516 = pow( pow( i.ase_color.r , 2.2 ) , 2.2 );
				float dotResult46_g1511 = dot( ifLocalVar9_g1511 , normalizedWorldNormal );
				float ILMG574 = break292.y;
				float temp_output_1087_0 = ( ( ( ( dotResult46_g1511 + _GlobalLightPush ) * i.ase_color.r ) * 0.5 ) + ( ( ILMG574 * 2.0 ) - 1.0 ) );
				float NdL20_g1516 = temp_output_1087_0;
				float temp_output_2_0_g1517 = NdL20_g1516;
				float temp_output_3_0_g1517 = -_Shadow1Smoothness;
				float temp_output_9_0_g1516 = _Shadow1Push;
				float temp_output_11_0_g1516 = _Shadow2Push;
				float clampResult15_g1516 = clamp( temp_output_9_0_g1516 , temp_output_11_0_g1516 , temp_output_9_0_g1516 );
				float RealShadow1Push16_g1516 = clampResult15_g1516;
				float temp_output_1_0_g1517 = RealShadow1Push16_g1516;
				float smoothstepResult6_g1517 = smoothstep( ( ( temp_output_2_0_g1517 / 1.0 ) + temp_output_3_0_g1517 ) , temp_output_2_0_g1517 , temp_output_1_0_g1517);
				float lerpResult7_g1517 = lerp( smoothstepResult6_g1517 , ( temp_output_1_0_g1517 >= temp_output_2_0_g1517 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1517 ? 1.0 : 0.0 ));
				float clampResult17_g1516 = clamp( temp_output_11_0_g1516 , temp_output_11_0_g1516 , temp_output_9_0_g1516 );
				float RealShadow2Push18_g1516 = clampResult17_g1516;
				float temp_output_2_0_g1518 = NdL20_g1516;
				float temp_output_3_0_g1518 = -_Shadow2Smoothness;
				float temp_output_1_0_g1518 = RealShadow2Push18_g1516;
				float smoothstepResult6_g1518 = smoothstep( ( ( temp_output_2_0_g1518 / 1.0 ) + temp_output_3_0_g1518 ) , temp_output_2_0_g1518 , temp_output_1_0_g1518);
				float lerpResult7_g1518 = lerp( smoothstepResult6_g1518 , ( temp_output_1_0_g1518 >= temp_output_2_0_g1518 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1518 ? 1.0 : 0.0 ));
				float temp_output_42_0_g1516 = max( max( ( 1.0 - ( VertexR33_g1516 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , lerpResult7_g1518 ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1516 = ( max( ( 1.0 - ( VertexR33_g1516 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( lerpResult7_g1517 , ( RealShadow1Push16_g1516 >= RealShadow2Push18_g1516 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1516 );
				float3 lerpResult100_g1521 = lerp( desaturateVar9_g1523 , desaturateVar9_g1522 , ( 1.0 - temp_output_43_0_g1516 ));
				float clampResult90_g1516 = clamp( ( 1.0 - ( temp_output_43_0_g1516 + temp_output_42_0_g1516 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1521 = clampResult90_g1516;
				float4 lerpResult101_g1521 = lerp( float4( desaturateVar9_g1526 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1521 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1521 ));
				float EnableRimlight82_g1516 = _EnableRimlight;
				float dotResult31_g1511 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1511 );
				float BaseA580 = tex2DNode296.a;
				float NdV48_g1516 = ( ( 1.0 - ( dotResult31_g1511 + ( 1.0 - _RimlightSize ) ) ) * BaseA580 );
				float clampResult91_g1516 = clamp( temp_output_42_0_g1516 , 0.0 , 1.0 );
				float clampResult88_g1516 = clamp( ( ceil( ( ( NdV48_g1516 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1516 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1516 = ( EnableRimlight82_g1516 == 1.0 ? clampResult88_g1516 : 0.0 );
				float3 desaturateInitialColor9_g1525 = ( ( Base12_g1521 * temp_output_94_0_g1516 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1525 = dot( desaturateInitialColor9_g1525, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1525 = lerp( desaturateInitialColor9_g1525, desaturateDot9_g1525.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1521 + float4( desaturateVar9_g1525 , 0.0 ) );
				float4 temp_output_1_0_g1533 = ColorOut1025;
				float4 lerpResult8_g1533 = lerp( DetailColor1066 , temp_output_1_0_g1533 , Detail1062);
				float4 temp_output_9_0_g1533 = ( DetailColorSetting1067 == 2.0 ? lerpResult8_g1533 : temp_output_1_0_g1533 );
				float4 lerpResult10_g1533 = lerp( ILMAColor1005 , temp_output_9_0_g1533 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1527 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1527 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1527 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_44 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_45 = (5.0).xxxx;
				float4 clampResult18_g1527 = clamp( ase_lightColor , temp_cast_44 , temp_cast_45 );
				float4 temp_output_11_0_g1527 = ( ase_atten * clampResult18_g1527 );
				float4 temp_output_8_0_g1527 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1527 = 0;
				if( ifLocalVar13_g1527 > 0.0 )
				ifLocalVar3_g1527 = temp_output_11_0_g1527;
				else if( ifLocalVar13_g1527 == 0.0 )
				ifLocalVar3_g1527 = temp_output_8_0_g1527;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1527 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1527 );
				#else
				float4 staticSwitch9_g1527 = ifLocalVar3_g1527;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1527;
				float temp_output_12_0_g1520 = ( ( ( temp_output_94_0_g1516 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1516 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1516 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1516 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1516 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float SSSA581 = tex2DNode297.a;
				float temp_output_28_0_g1520 = ( _SSSAlphaEmissiveToggle * ( SSSA581 >= 0.5 ? _SSSAlphaEmissiveIntensity : 0.0 ) );
				float clampResult30_g1520 = clamp( ( temp_output_12_0_g1520 - temp_output_28_0_g1520 ) , 0.0 , temp_output_12_0_g1520 );
				float2 uv_EmissionMask = i.ase_texcoord1.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float EmissionRampMask920 = max( ( clampResult30_g1520 + temp_output_28_0_g1520 ) , ( tex2D( _EmissionMask, uv_EmissionMask ).r * _EmissionMaskIntensity ) );
				float4 temp_cast_47 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1527 = 0;
				if( ifLocalVar13_g1527 > 0.0 )
				ifLocalVar17_g1527 = clampResult18_g1527;
				else if( ifLocalVar13_g1527 == 0.0 )
				ifLocalVar17_g1527 = temp_output_8_0_g1527;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1527 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1527 = max( temp_cast_47 , ifLocalVar17_g1527 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1527;
				float4 lerpResult1100 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult10_g1533 : temp_output_9_0_g1533 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1532 = _DebugGroup;
				float temp_output_47_0_g1532 = _VertexChannel;
				float4 temp_output_59_0_g1532 = _DebugColor;
				float temp_output_50_0_g1532 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1532 = appendResult1031;
				float4 break7_g1532 = temp_output_54_0_g1532;
				float temp_output_57_0_g1532 = _BaseSSSAlphaSwap;
				float4 Debug987 = ( temp_output_48_0_g1532 == 0.0 ? ( temp_output_47_0_g1532 == 0.0 ? i.ase_color : ( temp_output_47_0_g1532 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1532 == 1.0 ? ( temp_output_50_0_g1532 == 0.0 ? temp_output_54_0_g1532 : ( temp_output_50_0_g1532 == 1.0 ? ( break7_g1532.r * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 2.0 ? ( break7_g1532.g * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 3.0 ? ( break7_g1532.b * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 4.0 ? ( break7_g1532.a * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1532 == 2.0 ? ( temp_output_57_0_g1532 == 0.0 ? ( BaseA580 * temp_output_59_0_g1532 ) : ( temp_output_57_0_g1532 == 1.0 ? ( SSSA581 * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1100 : Debug987 ).rgb;
				outAlpha = _Opacity;
				clip(outAlpha);
				return float4(outColor,outAlpha);
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
			
			uniform float _ZFailFront;
			uniform float _FailFront;
			uniform float _OutlineColorIntensity;
			uniform float _EnableOutline;
			uniform float _OutlineThickness;
			uniform float _ReadMask;
			uniform float _Comparison;
			uniform float _OutlineEnableBaseColorMult;
			uniform float _DepthOffset;
			uniform float _EnableCameraDistanceMult;
			uniform float _Reference;
			uniform float _PassFront;
			uniform float _WriteMask;
			uniform float _ZTestMode;
			uniform float _Units;
			uniform float _ZWriteMode;
			uniform float4 _OutlineColor;
			uniform float _EditorVersion;
			uniform float _Factor;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableColorReplacer;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
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
			uniform float _ViewDirOffsetYaw;
			uniform float _ViewDirOffsetPitch;
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
			uniform float _Shadow1Smoothness;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _Shadow2Smoothness;
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
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
			uniform float _EmissionMaskIntensity;
			uniform float _DebugGroup;
			uniform float _VertexChannel;
			uniform float4 _DebugColor;
			uniform float _ILMChannel;
			uniform float _BaseSSSAlphaSwap;
			uniform float _Opacity;
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
			float3 ViewMatrix1418_g1513(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 ViewMatrix0417_g1513(  )
			{
				return UNITY_MATRIX_V[0];
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
			
			float3 StereoCameraViewPosition30_g1511(  )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				return cameraPos;
			}
			
			inline float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max( 0.001f , dot( inVec , inVec ) );
				return inVec* rsqrt( dp3);
			}
			
			float3 StereoCameraViewDirection32_g1511( float3 worldPos )
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				UNITY_SHADOW_COORDS(5)
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
				o.ase_texcoord4 = v.vertex;
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
				float DetailColorSetting1067 = _DetailColorSetting;
				float4 DetailColor1066 = _BodyLinesColor;
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMR573 = break292.x;
				float ILMColorSetting60_g1519 = ILMColorSetting1007;
				float4 ILMAColor54_g1519 = ILMAColor1005;
				float DetailColorSetting44_g1519 = DetailColorSetting1067;
				float4 DetailColor41_g1519 = DetailColor1066;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g1505 = _TotalReplacements;
				float4 break8_g1510 = _Target5Color;
				float4 break8_g1506 = _Target4Color;
				float4 break8_g1508 = _Target3Color;
				float4 break8_g1507 = _Target2Color;
				float4 break8_g1509 = _Target1Color;
				float3x3 temp_output_67_0_g1505 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g1509 = float4( temp_output_67_0_g1505[0] , 0.0 );
				float4 break6_g1509 = temp_output_13_0_g1509;
				float4 appendResult3_g1509 = (float4(break8_g1509.r , break8_g1509.g , break8_g1509.b , break6_g1509.a));
				float4 appendResult7_g1509 = (float4(break6_g1509.r , break6_g1509.g , break6_g1509.b , 1.0));
				float smoothstepResult5_g1509 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g1509 , _Source1Color ));
				float4 lerpResult4_g1509 = lerp( appendResult3_g1509 , temp_output_13_0_g1509 , smoothstepResult5_g1509);
				float4 temp_output_106_0_g1505 = lerpResult4_g1509;
				float4 temp_output_13_0_g1507 = temp_output_106_0_g1505;
				float4 break6_g1507 = temp_output_13_0_g1507;
				float4 appendResult3_g1507 = (float4(break8_g1507.r , break8_g1507.g , break8_g1507.b , break6_g1507.a));
				float4 appendResult7_g1507 = (float4(break6_g1507.r , break6_g1507.g , break6_g1507.b , 1.0));
				float smoothstepResult5_g1507 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g1507 , _Source2Color ));
				float4 lerpResult4_g1507 = lerp( appendResult3_g1507 , temp_output_13_0_g1507 , smoothstepResult5_g1507);
				float4 temp_output_102_0_g1505 = lerpResult4_g1507;
				float4 temp_output_13_0_g1508 = temp_output_102_0_g1505;
				float4 break6_g1508 = temp_output_13_0_g1508;
				float4 appendResult3_g1508 = (float4(break8_g1508.r , break8_g1508.g , break8_g1508.b , break6_g1508.a));
				float4 appendResult7_g1508 = (float4(break6_g1508.r , break6_g1508.g , break6_g1508.b , 1.0));
				float smoothstepResult5_g1508 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g1508 , _Source3Color ));
				float4 lerpResult4_g1508 = lerp( appendResult3_g1508 , temp_output_13_0_g1508 , smoothstepResult5_g1508);
				float4 temp_output_104_0_g1505 = lerpResult4_g1508;
				float4 temp_output_13_0_g1506 = temp_output_104_0_g1505;
				float4 break6_g1506 = temp_output_13_0_g1506;
				float4 appendResult3_g1506 = (float4(break8_g1506.r , break8_g1506.g , break8_g1506.b , break6_g1506.a));
				float4 appendResult7_g1506 = (float4(break6_g1506.r , break6_g1506.g , break6_g1506.b , 1.0));
				float smoothstepResult5_g1506 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g1506 , _Source4Color ));
				float4 lerpResult4_g1506 = lerp( appendResult3_g1506 , temp_output_13_0_g1506 , smoothstepResult5_g1506);
				float4 temp_output_105_0_g1505 = lerpResult4_g1506;
				float4 temp_output_13_0_g1510 = temp_output_105_0_g1505;
				float4 break6_g1510 = temp_output_13_0_g1510;
				float4 appendResult3_g1510 = (float4(break8_g1510.r , break8_g1510.g , break8_g1510.b , break6_g1510.a));
				float4 appendResult7_g1510 = (float4(break6_g1510.r , break6_g1510.g , break6_g1510.b , 1.0));
				float smoothstepResult5_g1510 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g1510 , _Source5Color ));
				float4 lerpResult4_g1510 = lerp( appendResult3_g1510 , temp_output_13_0_g1510 , smoothstepResult5_g1510);
				float4 temp_output_15_0_g1509 = float4( temp_output_67_0_g1505[1] , 0.0 );
				float3 hsvTorgb25_g1509 = RGBToHSV( temp_output_15_0_g1509.rgb );
				float3 hsvTorgb26_g1509 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g1509.x ),hsvTorgb25_g1509.y,hsvTorgb25_g1509.z) );
				float4 appendResult18_g1509 = (float4(hsvTorgb26_g1509 , temp_output_15_0_g1509.a));
				float4 lerpResult19_g1509 = lerp( appendResult18_g1509 , temp_output_15_0_g1509 , smoothstepResult5_g1509);
				float4 temp_output_15_0_g1507 = lerpResult19_g1509;
				float3 hsvTorgb25_g1507 = RGBToHSV( temp_output_15_0_g1507.rgb );
				float3 hsvTorgb26_g1507 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g1507.x ),hsvTorgb25_g1507.y,hsvTorgb25_g1507.z) );
				float4 appendResult18_g1507 = (float4(hsvTorgb26_g1507 , temp_output_15_0_g1507.a));
				float4 lerpResult19_g1507 = lerp( appendResult18_g1507 , temp_output_15_0_g1507 , smoothstepResult5_g1507);
				float4 temp_output_15_0_g1508 = lerpResult19_g1507;
				float3 hsvTorgb25_g1508 = RGBToHSV( temp_output_15_0_g1508.rgb );
				float3 hsvTorgb26_g1508 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g1508.x ),hsvTorgb25_g1508.y,hsvTorgb25_g1508.z) );
				float4 appendResult18_g1508 = (float4(hsvTorgb26_g1508 , temp_output_15_0_g1508.a));
				float4 lerpResult19_g1508 = lerp( appendResult18_g1508 , temp_output_15_0_g1508 , smoothstepResult5_g1508);
				float4 temp_output_15_0_g1506 = lerpResult19_g1508;
				float3 hsvTorgb25_g1506 = RGBToHSV( temp_output_15_0_g1506.rgb );
				float3 hsvTorgb26_g1506 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g1506.x ),hsvTorgb25_g1506.y,hsvTorgb25_g1506.z) );
				float4 appendResult18_g1506 = (float4(hsvTorgb26_g1506 , temp_output_15_0_g1506.a));
				float4 lerpResult19_g1506 = lerp( appendResult18_g1506 , temp_output_15_0_g1506 , smoothstepResult5_g1506);
				float4 temp_output_15_0_g1510 = lerpResult19_g1506;
				float3 hsvTorgb25_g1510 = RGBToHSV( temp_output_15_0_g1510.rgb );
				float3 hsvTorgb26_g1510 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g1510.x ),hsvTorgb25_g1510.y,hsvTorgb25_g1510.z) );
				float4 appendResult18_g1510 = (float4(hsvTorgb26_g1510 , temp_output_15_0_g1510.a));
				float4 lerpResult19_g1510 = lerp( appendResult18_g1510 , temp_output_15_0_g1510 , smoothstepResult5_g1510);
				float3x3 temp_output_24_0_g1519 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g1505 == 5.0 ? lerpResult4_g1510 : ( temp_output_52_0_g1505 == 4.0 ? temp_output_105_0_g1505 : ( temp_output_52_0_g1505 == 3.0 ? temp_output_104_0_g1505 : ( temp_output_52_0_g1505 == 2.0 ? temp_output_102_0_g1505 : ( temp_output_52_0_g1505 == 1.0 ? temp_output_106_0_g1505 : float4( temp_output_67_0_g1505[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g1510.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail1062 = tex2D( _Detail, uv2_Detail );
				float4 detail38_g1519 = Detail1062;
				float4 lerpResult10_g1519 = lerp( DetailColor41_g1519 , float4( temp_output_24_0_g1519[0] , 0.0 ) , detail38_g1519);
				float3 SSS50_g1519 = temp_output_24_0_g1519[1];
				float2 uv_OLM = i.ase_texcoord1.xy * _OLM_ST.xy + _OLM_ST.zw;
				float4 OLM1090 = tex2D( _OLM, uv_OLM );
				float4 OLM47_g1519 = OLM1090;
				float4 SSSOLM63_g1519 = ( float4( SSS50_g1519 , 0.0 ) * OLM47_g1519 );
				float4 lerpResult36_g1519 = lerp( SSSOLM63_g1519 , float4( temp_output_24_0_g1519[0] , 0.0 ) , detail38_g1519);
				float4 temp_output_20_0_g1519 = ( DetailColorSetting44_g1519 == 1.0 ? lerpResult10_g1519 : lerpResult36_g1519 );
				float ILMA357 = tex2DNode274.a;
				float ILMA57_g1519 = ILMA357;
				float4 lerpResult12_g1519 = lerp( ILMAColor54_g1519 , temp_output_20_0_g1519 , ILMA57_g1519);
				float4 lerpResult65_g1519 = lerp( SSSOLM63_g1519 , temp_output_20_0_g1519 , ILMA57_g1519);
				float4 Base1076 = ( ILMColorSetting60_g1519 == 1.0 ? lerpResult12_g1519 : lerpResult65_g1519 );
				float4 Base12_g1521 = Base1076;
				float ILMB576 = break292.z;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix1418_g1513 = ViewMatrix1418_g1513();
				float3 normalizeResult422_g1513 = normalize( localViewMatrix1418_g1513 );
				int localIsInMirror411_g1513 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_297_0_g1513 = _ViewDirOffsetYaw;
				float temp_output_424_0_g1513 = radians( ( (float)localIsInMirror411_g1513 == 0.0 ? -temp_output_297_0_g1513 : temp_output_297_0_g1513 ) );
				float3 localViewMatrix0417_g1513 = ViewMatrix0417_g1513();
				float3 normalizeResult425_g1513 = normalize( localViewMatrix0417_g1513 );
				float3 rotatedValue428_g1513 = RotateAroundAxis( float3( 0,0,0 ), normalizeResult425_g1513, normalizeResult422_g1513, temp_output_424_0_g1513 );
				float3 normalizeResult429_g1513 = normalize( rotatedValue428_g1513 );
				int localIsInMirror423_g1513 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_296_0_g1513 = _ViewDirOffsetPitch;
				float3 localStereoCameraViewPosition30_g1511 = StereoCameraViewPosition30_g1511();
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 rotatedValue431_g1513 = RotateAroundAxis( float3( 0,0,0 ), ( localStereoCameraViewPosition30_g1511 - ( ase_worldPos - i.ase_texcoord4.xyz ) ), normalizeResult422_g1513, temp_output_424_0_g1513 );
				float3 rotatedValue432_g1513 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue431_g1513, normalizeResult429_g1513, radians( ( (float)localIsInMirror423_g1513 == 0.0 ? temp_output_296_0_g1513 : -temp_output_296_0_g1513 ) ) );
				float3 normalizeResult433_g1513 = ASESafeNormalize( rotatedValue432_g1513 );
				float3 normalizeResult38_g1511 = normalize( normalizeResult433_g1513 );
				float3 appendResult15_g1512 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1512 = normalize( appendResult15_g1512 );
				float3 normalizeResult26_g1511 = normalize( normalizeResult2_g1512 );
				float3 ifLocalVar3_g1511 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1511 = normalizeResult38_g1511;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1511 = normalizeResult26_g1511;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g842 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g842 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g842 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g842 = color8_g842;
				#else
				float4 staticSwitch9_g842 = ( clampResult7_g842 * color14_g842 );
				#endif
				float4 break10_g842 = staticSwitch9_g842;
				float IsThereWorldLight450 = break10_g842.r;
				float3 ifLocalVar8_g1511 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1511 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1511 = ifLocalVar3_g1511;
				float3 ifLocalVar9_g1511 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1511 = ifLocalVar3_g1511;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1511 = ifLocalVar8_g1511;
				float3 normalizeResult48_g1511 = normalize( ifLocalVar9_g1511 );
				float3 worldPos32_g1511 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1511 = StereoCameraViewDirection32_g1511( worldPos32_g1511 );
				float3 normalizeResult51_g1511 = normalize( ( normalizeResult48_g1511 + localStereoCameraViewDirection32_g1511 ) );
				float dotResult50_g1511 = dot( normalizedWorldNormal , normalizeResult51_g1511 );
				float blendOpSrc34_g1514 = ILMB576;
				float blendOpDest34_g1514 = dotResult50_g1511;
				float clampResult87_g1516 = clamp( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1514) / max( blendOpSrc34_g1514, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) , 0.0 , 1.0 );
				float4 temp_cast_31 = (clampResult87_g1516).xxxx;
				float4 blendOpSrc30_g1521 = Base12_g1521;
				float4 blendOpDest30_g1521 = temp_cast_31;
				float4 lerpBlendMode30_g1521 = lerp(blendOpDest30_g1521,min( blendOpSrc30_g1521 , blendOpDest30_g1521 ),0.9);
				float3 desaturateInitialColor9_g1524 = ( ( ILMR573 * ( saturate( lerpBlendMode30_g1521 )) ) * float4( 1,1,1,0 ) * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1524 = dot( desaturateInitialColor9_g1524, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1524 = lerp( desaturateInitialColor9_g1524, desaturateDot9_g1524.xxx, ( 1.0 - _SpecularSaturation ) );
				float4 LightColor779 = _LightColor;
				float3 desaturateInitialColor9_g1526 = ( ( float4( desaturateVar9_g1524 , 0.0 ) + Base12_g1521 ) * LightColor779 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1526 = dot( desaturateInitialColor9_g1526, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1526 = lerp( desaturateInitialColor9_g1526, desaturateDot9_g1526.xxx, ( 1.0 - _BaseSaturation ) );
				float4 AmbientColor780 = _AmbientColor;
				float3 Base52_g1519 = temp_output_24_0_g1519[0];
				float3 blendOpSrc31_g1519 = Base52_g1519;
				float3 blendOpDest31_g1519 = temp_output_24_0_g1519[1];
				float4 lerpResult7_g1519 = lerp( ( DetailColor41_g1519 * float4( ( saturate( abs( blendOpSrc31_g1519 - blendOpDest31_g1519 ) )) , 0.0 ) ) , float4( temp_output_24_0_g1519[1] , 0.0 ) , detail38_g1519);
				float4 lerpResult69_g1519 = lerp( SSSOLM63_g1519 , float4( temp_output_24_0_g1519[1] , 0.0 ) , detail38_g1519);
				float4 temp_output_8_0_g1519 = ( DetailColorSetting44_g1519 == 1.0 ? lerpResult7_g1519 : lerpResult69_g1519 );
				float4 blendOpSrc32_g1519 = temp_output_20_0_g1519;
				float4 blendOpDest32_g1519 = temp_output_8_0_g1519;
				float4 lerpResult17_g1519 = lerp( ( ILMAColor54_g1519 * ( saturate( abs( blendOpSrc32_g1519 - blendOpDest32_g1519 ) )) ) , temp_output_8_0_g1519 , ILMA57_g1519);
				float4 lerpResult67_g1519 = lerp( SSSOLM63_g1519 , temp_output_8_0_g1519 , ILMA57_g1519);
				float4 SSS1077 = ( ILMColorSetting60_g1519 == 1.0 ? lerpResult17_g1519 : lerpResult67_g1519 );
				float4 SSS14_g1521 = SSS1077;
				float3 desaturateInitialColor9_g1523 = ( SSS14_g1521 * float4( 1,1,1,0 ) * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1523 = dot( desaturateInitialColor9_g1523, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1523 = lerp( desaturateInitialColor9_g1523, desaturateDot9_g1523.xxx, ( 1.0 - _Shadow1Saturation ) );
				float4 blendOpSrc108_g1521 = float4( 0,0,0,0 );
				float4 blendOpDest108_g1521 = Base12_g1521;
				float4 blendOpSrc51_g1521 = ( saturate( min( blendOpSrc108_g1521 , blendOpDest108_g1521 ) ));
				float4 blendOpDest51_g1521 = SSS14_g1521;
				float4 lerpBlendMode51_g1521 = lerp(blendOpDest51_g1521,2.0f*blendOpDest51_g1521*blendOpSrc51_g1521 + blendOpDest51_g1521*blendOpDest51_g1521*(1.0f - 2.0f*blendOpSrc51_g1521),0.5);
				float3 desaturateInitialColor9_g1522 = ( ( saturate( lerpBlendMode51_g1521 )) * float4( 1,1,1,0 ) * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1522 = dot( desaturateInitialColor9_g1522, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1522 = lerp( desaturateInitialColor9_g1522, desaturateDot9_g1522.xxx, ( 1.0 - _Shadow2Saturation ) );
				float VertexR33_g1516 = pow( pow( i.ase_color.r , 2.2 ) , 2.2 );
				float dotResult46_g1511 = dot( ifLocalVar9_g1511 , normalizedWorldNormal );
				float ILMG574 = break292.y;
				float temp_output_1087_0 = ( ( ( ( dotResult46_g1511 + _GlobalLightPush ) * i.ase_color.r ) * 0.5 ) + ( ( ILMG574 * 2.0 ) - 1.0 ) );
				float NdL20_g1516 = temp_output_1087_0;
				float temp_output_2_0_g1517 = NdL20_g1516;
				float temp_output_3_0_g1517 = -_Shadow1Smoothness;
				float temp_output_9_0_g1516 = _Shadow1Push;
				float temp_output_11_0_g1516 = _Shadow2Push;
				float clampResult15_g1516 = clamp( temp_output_9_0_g1516 , temp_output_11_0_g1516 , temp_output_9_0_g1516 );
				float RealShadow1Push16_g1516 = clampResult15_g1516;
				float temp_output_1_0_g1517 = RealShadow1Push16_g1516;
				float smoothstepResult6_g1517 = smoothstep( ( ( temp_output_2_0_g1517 / 1.0 ) + temp_output_3_0_g1517 ) , temp_output_2_0_g1517 , temp_output_1_0_g1517);
				float lerpResult7_g1517 = lerp( smoothstepResult6_g1517 , ( temp_output_1_0_g1517 >= temp_output_2_0_g1517 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1517 ? 1.0 : 0.0 ));
				float clampResult17_g1516 = clamp( temp_output_11_0_g1516 , temp_output_11_0_g1516 , temp_output_9_0_g1516 );
				float RealShadow2Push18_g1516 = clampResult17_g1516;
				float temp_output_2_0_g1518 = NdL20_g1516;
				float temp_output_3_0_g1518 = -_Shadow2Smoothness;
				float temp_output_1_0_g1518 = RealShadow2Push18_g1516;
				float smoothstepResult6_g1518 = smoothstep( ( ( temp_output_2_0_g1518 / 1.0 ) + temp_output_3_0_g1518 ) , temp_output_2_0_g1518 , temp_output_1_0_g1518);
				float lerpResult7_g1518 = lerp( smoothstepResult6_g1518 , ( temp_output_1_0_g1518 >= temp_output_2_0_g1518 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1518 ? 1.0 : 0.0 ));
				float temp_output_42_0_g1516 = max( max( ( 1.0 - ( VertexR33_g1516 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , lerpResult7_g1518 ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1516 = ( max( ( 1.0 - ( VertexR33_g1516 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( lerpResult7_g1517 , ( RealShadow1Push16_g1516 >= RealShadow2Push18_g1516 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1516 );
				float3 lerpResult100_g1521 = lerp( desaturateVar9_g1523 , desaturateVar9_g1522 , ( 1.0 - temp_output_43_0_g1516 ));
				float clampResult90_g1516 = clamp( ( 1.0 - ( temp_output_43_0_g1516 + temp_output_42_0_g1516 ) ) , 0.0 , 1.0 );
				float temp_output_39_0_g1521 = clampResult90_g1516;
				float4 lerpResult101_g1521 = lerp( float4( desaturateVar9_g1526 , 0.0 ) , ( AmbientColor780 * float4( lerpResult100_g1521 , 0.0 ) ) , ( 1.0 - temp_output_39_0_g1521 ));
				float EnableRimlight82_g1516 = _EnableRimlight;
				float dotResult31_g1511 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1511 );
				float BaseA580 = tex2DNode296.a;
				float NdV48_g1516 = ( ( 1.0 - ( dotResult31_g1511 + ( 1.0 - _RimlightSize ) ) ) * BaseA580 );
				float clampResult91_g1516 = clamp( temp_output_42_0_g1516 , 0.0 , 1.0 );
				float clampResult88_g1516 = clamp( ( ceil( ( ( NdV48_g1516 > 0.1 ? 1.0 : 0.0 ) * BaseA580 ) ) - clampResult91_g1516 ) , 0.0 , 1.0 );
				float temp_output_94_0_g1516 = ( EnableRimlight82_g1516 == 1.0 ? clampResult88_g1516 : 0.0 );
				float3 desaturateInitialColor9_g1525 = ( ( Base12_g1521 * temp_output_94_0_g1516 ) * float4( 1,1,1,0 ) * _RimlightIntensity * _RimlightTint ).rgb;
				float desaturateDot9_g1525 = dot( desaturateInitialColor9_g1525, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1525 = lerp( desaturateInitialColor9_g1525, desaturateDot9_g1525.xxx, ( 1.0 - _RimlightSaturation ) );
				float4 ColorOut1025 = ( lerpResult101_g1521 + float4( desaturateVar9_g1525 , 0.0 ) );
				float4 temp_output_1_0_g1533 = ColorOut1025;
				float4 lerpResult8_g1533 = lerp( DetailColor1066 , temp_output_1_0_g1533 , Detail1062);
				float4 temp_output_9_0_g1533 = ( DetailColorSetting1067 == 2.0 ? lerpResult8_g1533 : temp_output_1_0_g1533 );
				float4 lerpResult10_g1533 = lerp( ILMAColor1005 , temp_output_9_0_g1533 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1527 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1527 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1527 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_44 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_45 = (5.0).xxxx;
				float4 clampResult18_g1527 = clamp( ase_lightColor , temp_cast_44 , temp_cast_45 );
				float4 temp_output_11_0_g1527 = ( ase_atten * clampResult18_g1527 );
				float4 temp_output_8_0_g1527 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1527 = 0;
				if( ifLocalVar13_g1527 > 0.0 )
				ifLocalVar3_g1527 = temp_output_11_0_g1527;
				else if( ifLocalVar13_g1527 == 0.0 )
				ifLocalVar3_g1527 = temp_output_8_0_g1527;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1527 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1527 );
				#else
				float4 staticSwitch9_g1527 = ifLocalVar3_g1527;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1527;
				float temp_output_12_0_g1520 = ( ( ( temp_output_94_0_g1516 * _RimlightEmissiveToggle ) * _RimlightEmissionIntensity ) + ( ( clampResult87_g1516 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1516 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1516 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1516 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( 1.0 - ILMA357 ) * ( _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) ) );
				float SSSA581 = tex2DNode297.a;
				float temp_output_28_0_g1520 = ( _SSSAlphaEmissiveToggle * ( SSSA581 >= 0.5 ? _SSSAlphaEmissiveIntensity : 0.0 ) );
				float clampResult30_g1520 = clamp( ( temp_output_12_0_g1520 - temp_output_28_0_g1520 ) , 0.0 , temp_output_12_0_g1520 );
				float2 uv_EmissionMask = i.ase_texcoord1.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float EmissionRampMask920 = max( ( clampResult30_g1520 + temp_output_28_0_g1520 ) , ( tex2D( _EmissionMask, uv_EmissionMask ).r * _EmissionMaskIntensity ) );
				float4 temp_cast_47 = (EmissionRampMask920).xxxx;
				float4 ifLocalVar17_g1527 = 0;
				if( ifLocalVar13_g1527 > 0.0 )
				ifLocalVar17_g1527 = clampResult18_g1527;
				else if( ifLocalVar13_g1527 == 0.0 )
				ifLocalVar17_g1527 = temp_output_8_0_g1527;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1527 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1527 = max( temp_cast_47 , ifLocalVar17_g1527 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1527;
				float4 lerpResult1100 = lerp( ( ( ILMColorSetting1007 == 2.0 ? lerpResult10_g1533 : temp_output_9_0_g1533 ) * GlobalLightColor944 ) , ( _EmissionIntensity * ColorOut1025 * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1532 = _DebugGroup;
				float temp_output_47_0_g1532 = _VertexChannel;
				float4 temp_output_59_0_g1532 = _DebugColor;
				float temp_output_50_0_g1532 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult1031 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1532 = appendResult1031;
				float4 break7_g1532 = temp_output_54_0_g1532;
				float temp_output_57_0_g1532 = _BaseSSSAlphaSwap;
				float4 Debug987 = ( temp_output_48_0_g1532 == 0.0 ? ( temp_output_47_0_g1532 == 0.0 ? i.ase_color : ( temp_output_47_0_g1532 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1532 ) : ( temp_output_47_0_g1532 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1532 == 1.0 ? ( temp_output_50_0_g1532 == 0.0 ? temp_output_54_0_g1532 : ( temp_output_50_0_g1532 == 1.0 ? ( break7_g1532.r * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 2.0 ? ( break7_g1532.g * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 3.0 ? ( break7_g1532.b * temp_output_59_0_g1532 ) : ( temp_output_50_0_g1532 == 4.0 ? ( break7_g1532.a * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1532 == 2.0 ? ( temp_output_57_0_g1532 == 0.0 ? ( BaseA580 * temp_output_59_0_g1532 ) : ( temp_output_57_0_g1532 == 1.0 ? ( SSSA581 * temp_output_59_0_g1532 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1100 : Debug987 ).rgb;
				outAlpha = _Opacity;
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
2961;197;2049;932;3267.876;-2495.149;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;781;-2786.293,2702.811;Inherit;False;3560.719;2932.564;;52;988;573;580;574;555;581;576;1007;292;1006;1005;357;993;277;1004;764;992;280;827;585;854;849;848;825;828;857;851;829;853;824;826;823;822;855;821;852;846;856;850;847;274;762;763;296;297;1061;1062;1064;1065;1067;1068;1089;Color Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;274;-1490.404,2845.581;Inherit;True;Property;_ILM;ILM;3;0;Create;True;0;0;0;False;0;False;-1;None;f9ce7ab2674f9db438ec75f5d229f329;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;280;-1167.917,2871.7;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;572;971.8275,2807.128;Inherit;False;703.0927;565.6688;;9;517;450;563;561;533;634;535;871;872;Light Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;297;-2678.854,3006.014;Inherit;True;Property;_SSS;SSS;2;0;Create;True;0;0;0;False;0;False;-1;None;961e7fd6475d1de488f2fa48ffcae419;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;535;1060.975,3242.652;Inherit;False;Property;_FallbackLightDirection;Fallback Light Direction;16;1;[Enum];Create;True;0;2;Fake Light Direction;0;View Direction;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;296;-2723.293,2752.811;Inherit;True;Property;_MainTex;MainTex;1;0;Create;True;0;0;0;False;0;False;-1;None;08ce0b81a00631747a551c7aa5eca51a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;634;1049.433,2895.548;Inherit;False;Is There A Light;-1;;842;65e24b0fdfa2e3146a301178490755c7;0;0;2;FLOAT;0;FLOAT;15
Node;AmplifyShaderEditor.LinearToGammaNode;277;-1024.21,2870.06;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;533;1058.975,3071.652;Inherit;False;Property;_LightDirectionSetting;Light Direction Setting;15;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;292;-751.6676,2872.298;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;762;-2331.82,2777.283;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;1316.975,3242.652;Inherit;False;FallbackLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;1312.022,2857.128;Inherit;False;IsThereWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;763;-2332.82,3009.282;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;561;1314.975,3071.652;Inherit;False;LightDirectionSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;558;922.4996,3449.375;Inherit;False;919.3984;663.7043;;8;637;562;564;472;434;471;435;525;Dot Creation;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;829;-2522.85,4122.562;Inherit;False;Property;_SSSHueShift2;SSS Hue Shift 2;38;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.MatrixFromVectors;585;-2126.762,2904.759;Inherit;False;FLOAT3x3;True;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-2522.85,5242.562;Inherit;False;Property;_Source5Fuzziness;Source 5 Fuzziness;48;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;857;-2522.85,5466.562;Inherit;False;Property;_SSSHueShift5;SSS Hue Shift 5;52;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;821;-2516.85,3216.56;Inherit;False;Property;_TotalReplacements;Total Replacements;30;1;[IntRange];Create;True;0;0;0;False;0;False;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1064;-1024,5152;Inherit;False;Property;_DetailColorSetting;Detail Color Setting;8;1;[Enum];Create;True;0;3;Default Black;0;Shadow Priority;1;Detail Priority;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1004;-1725.405,4958.093;Inherit;False;Property;_ILMAlphaColor;ILM Alpha Color;5;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;855;-2458.85,5082.562;Inherit;False;Property;_Source5Color;Source 5 Color;47;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;848;-2458.85,4410.562;Inherit;False;Property;_Target3Color;Target 3 Color;41;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;824;-2458.85,3514.56;Inherit;False;Property;_Target1Color;Target 1 Color;33;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1061;-1072,4944;Inherit;True;Property;_Detail;Detail;106;0;Create;True;0;0;0;False;0;False;-1;None;None;True;1;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;849;-2522.85,4570.562;Inherit;False;Property;_SSSHueShift3;SSS Hue Shift 3;42;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1065;-1024,5248;Inherit;False;Property;_BodyLinesColor;Body Lines Color;107;0;Create;True;0;0;0;False;0;False;1,1,0,0;0,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;856;-2458.85,5306.562;Inherit;False;Property;_Target5Color;Target 5 Color;49;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;827;-2522.85,3898.56;Inherit;False;Property;_Source2Fuzziness;Source 2 Fuzziness;36;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;823;-2522.85,3450.56;Inherit;False;Property;_Source1Fuzziness;Source 1 Fuzziness;32;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;828;-2458.85,3962.56;Inherit;False;Property;_Target2Color;Target 2 Color;37;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;850;-2522.85,4794.562;Inherit;False;Property;_Source4Fuzziness;Source 4 Fuzziness;44;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;852;-2458.85,4858.562;Inherit;False;Property;_Target4Color;Target 4 Color;45;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;525;986.4993,3512.944;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;562;957.7625,3609.256;Inherit;False;561;LightDirectionSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1089;-338.0792,5018.021;Inherit;True;Property;_OLM;OLM;108;0;Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;580;-2393.363,2900.325;Inherit;False;BaseA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;853;-2522.85,5018.562;Inherit;False;Property;_SSSHueShift4;SSS Hue Shift 4;46;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;1021.762,3769.256;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;9;0;Create;True;0;0;0;False;0;False;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;574;-600.7415,2903.808;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;826;-2458.85,3738.56;Inherit;False;Property;_Source2Color;Source 2 Color;35;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1006;-1716.687,5143.85;Inherit;False;Property;_ILMColorSetting;ILM Color Setting;4;1;[Enum];Create;True;0;3;Default Black;0;Shadow Priority;1;ILM Priority;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;1021.762,3849.256;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;10;0;Create;True;0;0;0;False;0;False;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;846;-2522.85,4346.562;Inherit;False;Property;_Source3Fuzziness;Source 3 Fuzziness;40;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;822;-2490.85,3290.56;Inherit;False;Property;_Source1Color;Source 1 Color;31;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;471;941.7625,3929.256;Inherit;False;Property;_ViewDirOffsetPitch;View Dir Offset Pitch;11;0;Create;True;0;0;0;False;0;False;0;0;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;847;-2458.85,4186.562;Inherit;False;Property;_Source3Color;Source 3 Color;39;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;576;-600.7415,2983.808;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;564;957.7625,3689.256;Inherit;False;563;FallbackLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;472;941.7625,4009.256;Inherit;False;Property;_ViewDirOffsetYaw;View Dir Offset Yaw;12;0;Create;True;0;0;0;False;0;False;0;0;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;851;-2458.85,4634.562;Inherit;False;Property;_Source4Color;Source 4 Color;43;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;825;-2522.85,3674.56;Inherit;False;Property;_SSSHueShift1;SSS Hue Shift 1;34;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;2336,3968;Inherit;False;576;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1090;-18.07922,5018.021;Inherit;False;OLM;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1062;-720,4944;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1066;-768,5248;Inherit;False;DetailColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1005;-1484.963,4957.933;Inherit;False;ILMAColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;357;-1110.106,3006.807;Inherit;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;992;-1768.7,3223.38;Inherit;False;Property;_EnableColorReplacer;Enable Color Replacer;29;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1068;-1262.131,3398.982;Inherit;False;1155.857;663.478;;10;1091;1077;1076;1075;1074;1073;1071;1072;1069;1070;Shadow Priority Color Change;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;707;2295,4051;Inherit;False;Property;_GlobalLightPush;Global Light Push;17;0;Create;True;0;0;0;False;0;False;1;1;-1;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;639;2336,3776;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;706;2336,3904;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;764;-1857.64,3503.761;Inherit;False;Color Replacer;-1;;1505;3bf8a732171ac6840bcd0b4c21fcee62;0;22;67;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;52;FLOAT;0;False;16;COLOR;0,0,0,1;False;17;FLOAT;0;False;13;COLOR;0,0,0,0;False;96;FLOAT;0;False;31;COLOR;0,0,0,1;False;32;FLOAT;0;False;30;COLOR;0,0,0,0;False;97;FLOAT;0;False;36;COLOR;0,0,0,1;False;38;FLOAT;0;False;37;COLOR;0,0,0,0;False;99;FLOAT;0;False;40;COLOR;0,0,0,1;False;42;FLOAT;0;False;41;COLOR;0,0,0,0;False;100;FLOAT;0;False;44;COLOR;0,0,0,1;False;46;FLOAT;0;False;45;COLOR;0,0,0,0;False;101;FLOAT;0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1007;-1491.218,5140.88;Inherit;False;ILMColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;637;1422.762,3657.256;Inherit;False;Dot Creation;-1;;1511;fd90efbfe94791944bc1c5b55d8d67e4;0;7;12;FLOAT;0;False;17;FLOAT;0;False;16;FLOAT;0;False;29;FLOAT;0;False;28;FLOAT;0;False;33;FLOAT;0;False;34;FLOAT;0;False;3;FLOAT;0;FLOAT;42;FLOAT;52
Node;AmplifyShaderEditor.RangedFloatNode;641;2293,4137;Inherit;False;Property;_RimlightSize;Rimlight Size;27;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1067;-768,5152;Inherit;False;DetailColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;581;-2343.923,3136.528;Inherit;False;SSSA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;716;2992,4224;Inherit;False;Property;_Shadow1VertexRThreshold;Shadow 1 VertexR Threshold;23;0;Create;True;0;0;0;False;0;False;0.5;0.51;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;2976,4416;Inherit;False;Property;_Shadow2VertexRThreshold;Shadow 2 VertexR Threshold;25;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1069;-1152,3968;Inherit;False;1005;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;711;3008,4096;Inherit;False;Property;_Shadow1Push;Shadow 1 Push;22;0;Create;True;0;0;0;False;0;False;0.5;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;925;2992,4736;Inherit;False;Property;_Shadow1EmissiveToggle;Shadow 1 Emissive Toggle;71;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;753;3083.087,3792.721;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;926;2992,4800;Inherit;False;Property;_Shadow2EmissiveToggle;Shadow 2 Emissive Toggle;76;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1105;3008,4160;Inherit;False;Property;_Shadow1Smoothness;Shadow 1 Smoothness;112;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1106;3008,4352;Inherit;False;Property;_Shadow2Smoothness;Shadow 2 Smoothness;113;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;732;2976,4480;Inherit;False;Property;_PermanentShadowThreshold;Permanent Shadow Threshold;26;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;924;3024,4672;Inherit;False;Property;_BaseEmissiveToggle;Base Emissive Toggle;66;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;922;3008,4544;Inherit;False;Property;_RimlightEmissiveToggle;Rimlight Emissive Toggle;56;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;923;3008,4608;Inherit;False;Property;_SpecularEmissiveToggle;Specular Emissive Toggle;61;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1073;-1200,3840;Inherit;False;1007;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1070;-1216,3648;Inherit;False;1067;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;993;-1466.289,3435.024;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;3;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;746;3008,4032;Inherit;False;Property;_SpecularSize;Specular Size;21;0;Create;True;0;0;0;False;0;False;0.3;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;729;3092.385,3872.472;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1072;-1168,3776;Inherit;False;1066;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;758;3088,3968;Inherit;False;Property;_EnableRimlight;Enable Rimlight;28;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;555;-1765.585,4137.153;Inherit;False;1451.782;658.5377;;13;947;944;873;950;867;544;869;632;779;780;777;778;1094;Light Color Calculation;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1071;-1152,3712;Inherit;False;1062;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1091;-1152,3584;Inherit;False;1090;OLM;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;727;3008,4288;Inherit;False;Property;_Shadow2Push;Shadow 2 Push;24;0;Create;True;0;0;0;False;0;False;-1;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1074;-1152,3904;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1087;2640,3664;Inherit;False;Final Dot Calculation Strive;-1;;1514;7fa0b619a5202f24c92b4cfbdde5487f;0;8;5;FLOAT;0;False;21;FLOAT;0;False;6;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;11;FLOAT;0;False;10;FLOAT;0;False;3;FLOAT;0;FLOAT;8;FLOAT;9
Node;AmplifyShaderEditor.RangedFloatNode;1104;3616,2928;Inherit;False;Property;_SSSAlphaEmissiveIntensity;SSS Alpha Emissive Intensity;111;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1112;3473.26,3694.933;Inherit;False;Ramp Creation - Guilty Gear Strive;-1;;1516;5daec4314cbb03243a1aa4ab943e34b3;0;19;1;FLOAT;0;False;3;FLOAT;0;False;2;FLOAT;0;False;5;FLOAT;0;False;7;FLOAT;0;False;80;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;121;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;120;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;97;FLOAT;0;False;101;FLOAT;0;False;104;FLOAT;0;False;107;FLOAT;0;False;110;FLOAT;0;False;10;FLOAT;100;FLOAT;103;FLOAT;106;FLOAT;109;FLOAT;112;FLOAT;76;FLOAT;69;FLOAT;62;FLOAT;0;FLOAT;44
Node;AmplifyShaderEditor.RangedFloatNode;1003;3628.589,3540.512;Inherit;False;Property;_Shadow2EmissionIntensity;Shadow 2 Emission Intensity;77;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1000;3623.496,3303.772;Inherit;False;Property;_SpecularEmissionIntensity;Specular Emission Intensity;62;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1001;3659.589,3378.512;Inherit;False;Property;_BaseEmissionIntensity;Base Emission Intensity;67;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;778;-738.5991,4407.015;Inherit;False;Property;_AmbientColor;Ambient Color;19;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1075;-812.1314,3454.46;Inherit;False;Shadow Priority Color Change;-1;;1519;e12dd788f9ad90545a25b4603cc00a62;0;8;24;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;35;COLOR;0,0,0,0;False;29;FLOAT;0;False;26;COLOR;0,0,0,0;False;25;COLOR;0,0,0,0;False;30;FLOAT;0;False;27;FLOAT;0;False;28;COLOR;0,0,0,0;False;2;COLOR;0;COLOR;23
Node;AmplifyShaderEditor.RangedFloatNode;1013;3610.625,3147.818;Inherit;False;Property;_ILMAlphaEmissionIntensity;ILM Alpha Emission Intensity;92;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1103;3632,2848;Inherit;False;Property;_SSSAlphaEmissiveToggle;SSS Alpha Emissive Toggle;110;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1002;3616.589,3456.512;Inherit;False;Property;_Shadow1EmissionIntensity;Shadow 1 Emission Intensity;72;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;994;3633.195,3222.898;Inherit;False;Property;_RimlightEmissionIntensity;Rimlight Emission Intensity;57;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1102;3728,2768;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1017;3618.042,3075.314;Inherit;False;Property;_ILMAlphaLinesEmissionToggle;ILM Alpha Lines Emission Toggle;93;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1109;4088.77,2945.526;Inherit;True;Property;_EmissionMask;Emission Mask;114;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;777;-738.5991,4197.015;Inherit;False;Property;_LightColor;Light Color;18;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1110;4477.77,3174.526;Inherit;False;Property;_EmissionMaskIntensity;Emission Mask Intensity;115;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1016;3728.264,3004.706;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;780;-533.5998,4408.015;Inherit;False;AmbientColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;779;-533.5998,4199.015;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1077;-396.1314,3582.46;Inherit;False;SSS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;871;1073.175,3157.493;Inherit;False;Property;_LightColorSetting;Light Color Setting;14;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;573;-600.7415,2823.808;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1076;-389.2746,3448.982;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1101;4208,3376;Inherit;False;Emission - Guilty Gear Strive;-1;;1520;282e2fc31b84cbb48b669c6910d1914b;0;18;33;FLOAT;0;False;35;FLOAT;0;False;25;FLOAT;0;False;24;FLOAT;0;False;26;FLOAT;0;False;17;FLOAT;0;False;22;FLOAT;0;False;20;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;898;3952,5824;Inherit;False;Property;_Shadow2Saturation;Shadow 2 Saturation;75;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;920;4718.61,3473.063;Inherit;False;EmissionRampMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;896;4000,5600;Inherit;False;Property;_Shadow2Intensity;Shadow 2 Intensity;73;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;882;3936,4672;Inherit;False;Property;_RimlightSaturation;Rimlight Saturation;55;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;883;3968,4960;Inherit;False;Property;_SpecularSaturation;Specular Saturation;60;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;767;4016,4048;Inherit;False;1076;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;887;4048,5024;Inherit;False;Property;_BaseIntensity;Base Intensity;63;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;897;4016,5664;Inherit;False;Property;_Shadow2Tint;Shadow 2 Tint;74;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;888;4032,5088;Inherit;False;Property;_BaseTint;Base Tint;64;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;860;3984,4368;Inherit;False;780;AmbientColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;872;1337.175,3156.493;Inherit;False;LightColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;881;3984,4512;Inherit;False;Property;_RimlightTint;Rimlight Tint;54;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;884;4032,4800;Inherit;False;Property;_SpecularTint;Specular Tint;59;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;880;3984,4448;Inherit;False;Property;_RimlightIntensity;Rimlight Intensity;53;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;3952,5536;Inherit;False;Property;_Shadow1Saturation;Shadow 1 Saturation;70;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;4016,4736;Inherit;False;Property;_SpecularIntensity;Specular Intensity;58;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;859;4016,4288;Inherit;False;779;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;793;4016,4128;Inherit;False;1077;SSS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;893;4016,5376;Inherit;False;Property;_Shadow1Tint;Shadow 1 Tint;69;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;894;4000,5312;Inherit;False;Property;_Shadow1Intensity;Shadow 1 Intensity;68;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;889;3952,5248;Inherit;False;Property;_BaseSaturation;Base Saturation;65;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;804;4016,4208;Inherit;False;573;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;869;-1746.997,4618.438;Inherit;False;Property;_FakeGlobalLightIntensity;Fake Global Light Intensity;7;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1094;-1372.019,4214.663;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;873;-1722.37,4361.219;Inherit;False;872;LightColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;988;-703.5383,2747.413;Inherit;False;ILM;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;977;-383.4483,5722.681;Inherit;False;1110.669;779.1093;;11;987;1031;1033;981;985;979;978;980;983;1032;1108;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;1088;4480,3808;Inherit;False;Color Creation - Guilty Gear Strive;-1;;1521;22b8d5cb399b17145ab0f31f751f2bd5;0;26;6;FLOAT;0;False;29;FLOAT;0;False;39;FLOAT;0;False;41;FLOAT;0;False;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;COLOR;0,0,0,0;False;10;FLOAT;0;False;94;FLOAT;0;False;11;COLOR;0,0,0,0;False;67;COLOR;0,0,0,0;False;75;FLOAT;1;False;76;COLOR;1,1,1,0;False;78;FLOAT;0;False;81;FLOAT;1;False;80;COLOR;1,1,1,0;False;79;FLOAT;0;False;83;FLOAT;1;False;82;COLOR;1,1,1,0;False;84;FLOAT;0;False;85;FLOAT;1;False;86;COLOR;1,1,1,0;False;87;FLOAT;0;False;89;FLOAT;1;False;88;COLOR;1,1,1,0;False;90;FLOAT;0;False;1;COLOR;105
Node;AmplifyShaderEditor.GetLocalVarNode;544;-1725.444,4273.933;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;632;-1714.909,4190.506;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;867;-1738.728,4444.135;Inherit;False;Property;_FakeGlobalLightColor;Fake Global Light Color;6;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;950;-1748.428,4699.634;Inherit;False;Property;_MinimumGlobalLightIntensity;Minimum Global Light Intensity;13;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;983;-347.8692,6215.467;Inherit;False;988;ILM;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;1078;4975.274,4169.582;Inherit;False;839.9919;535.7986;;8;1086;1085;1084;1083;1082;1081;1080;1079;Line Priority Color Change;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1032;-336.8296,6297.702;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1025;4947.971,3801.074;Inherit;False;ColorOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1093;-1427.66,4325.012;Inherit;False;Light Color Calculation;-1;;1527;5b8f5c3f2a647dc4d89d921c89ebb0e5;0;7;25;FLOAT;0;False;10;FLOAT;0;False;5;FLOAT;0;False;14;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;19;FLOAT;0;False;2;COLOR;0;COLOR;16
Node;AmplifyShaderEditor.RangedFloatNode;1107;-289.675,6512.277;Inherit;False;Property;_BaseSSSAlphaSwap;BaseSSSAlphaSwap;109;1;[Enum];Create;True;0;2;Base Alpha;0;SSS Alpha;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;978;-296.3642,5880.488;Inherit;False;Property;_DebugColor;Debug Color;51;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1108;66.32495,6417.277;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1080;5071.274,4281.582;Inherit;False;1067;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1083;5135.274,4345.582;Inherit;False;1062;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1082;5135.274,4537.582;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1081;5135.274,4601.582;Inherit;False;1005;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1084;5087.274,4473.582;Inherit;False;1007;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1031;-122.8295,6242.702;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1079;5119.274,4409.582;Inherit;False;1066;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1085;5135.274,4217.582;Inherit;False;1025;ColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1030;5960.892,4337.456;Inherit;False;469.1748;214.0239;;2;934;870;Apply Light Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;944;-974.9218,4293.536;Inherit;False;GlobalLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;980;-332.8692,6389.467;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;985;-311.8692,6132.467;Inherit;False;Property;_ILMChannel;ILM Channel;91;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;981;-291.8691,6048.467;Inherit;False;Property;_VertexChannel;Vertex Channel;50;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;947;-984.4599,4390.014;Inherit;False;EmissionLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;979;-264.3643,5800.488;Inherit;False;Property;_DebugGroup;Debug Group;90;1;[Enum];Create;True;0;3;Vertex Colors;0;ILM Channels;1;Base Alpha;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1028;6495.836,4324.941;Inherit;False;831.1079;522.8679;;6;1100;932;928;948;933;1027;Emission Combining;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;948;6520.836,4660.488;Inherit;False;947;EmissionLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;933;6571.58,4468.941;Inherit;False;Property;_EmissionIntensity;Emission Intensity;20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1086;5503.274,4297.582;Inherit;False;Line Priority Color Change;-1;;1533;e71d6fe87185a054c9d0e635f7af6cdb;0;7;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1033;152.7226,6096.615;Inherit;False;Debug;-1;;1532;6f93fc90e278e9a449a8e28c4cbb4ee4;0;8;48;FLOAT;0;False;59;COLOR;0,0,0,0;False;47;FLOAT;0;False;50;FLOAT;0;False;54;COLOR;0,0,0,0;False;57;FLOAT;0;False;55;FLOAT;0;False;56;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1027;6586.006,4578.819;Inherit;False;1025;ColorOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;870;6010.892,4436.479;Inherit;False;944;GlobalLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;932;6861.944,4498.287;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;497.8569,6094.068;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1029;7415.409,4244.81;Inherit;False;468.2808;338.5957;;3;989;990;991;Enable Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;934;6261.067,4387.456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;928;6524.22,4740.809;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;991;7496.651,4294.81;Inherit;False;Property;_EnableDebug;Enable Debug;89;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;990;7465.409,4468.404;Inherit;False;987;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1045;1696,2816;Inherit;False;352;549;;7;1038;1039;1040;1041;1042;1043;1044;Stencil Buffer;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;1100;7127.348,4387.774;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1051;2080,2816;Inherit;False;253;357;;4;1046;1049;1050;1052;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;915;5092.16,4862.631;Inherit;False;1167.994;700.8105;;10;1036;903;904;907;908;912;910;911;909;1053;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1043;1744,3184;Inherit;False;Property;_FailFront;Fail Front;99;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;908;5178.16,5294.631;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;83;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1036;5636.616,4928.768;Inherit;False;Property;_EnableOutline;Enable Outline;78;1;[ToggleUI];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;2660.509,3255.567;Inherit;False;Property;_GlowMaskMultSystem;Glow Mask Mult System;87;1;[Enum];Create;True;0;2;Base Color Lerped From Mask;0;Mask Color;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;5220.16,4910.631;Inherit;False;Property;_OutlineThickness;Outline Thickness;79;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OutlineNode;903;6004.16,5022.631;Inherit;False;2;True;Masked;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1041;1744,3056;Inherit;False;Property;_Comparison;Comparison;97;1;[Enum];Create;True;0;9;Default;0;Greater;1;Greater or Equal;2;Less;3;Less or Equal;4;Equal;5;Not Equal;6;Always;7;Never;8;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;974;2639.509,3066.567;Inherit;True;Property;_GlowMask;Glow Mask;86;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;989;7701.689,4322.316;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;910;5149.16,5047.631;Inherit;False;Property;_DepthOffset;Depth Offset;81;0;Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1053;5556.248,5059.576;Inherit;False;ASWOutline;-1;;1534;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.RangedFloatNode;911;5140.16,4974.631;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;80;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1044;1744,3248;Inherit;False;Property;_ZFailFront;ZFail Front;100;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;907;5140.16,5366.631;Inherit;False;Property;_OutlineEnableBaseColorMult;Outline Enable Base Color Mult;84;1;[ToggleUI];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;517;1313.557,2944.454;Inherit;False;IsTherePointLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1038;1744,2864;Inherit;False;Property;_Reference;Reference;94;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;5252.16,5454.631;Inherit;False;-1;;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1042;1744,3120;Inherit;False;Property;_PassFront;Pass Front;98;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1040;1745,2992;Inherit;False;Property;_WriteMask;Write Mask;96;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1052;2128,2944;Inherit;False;Property;_ZTestMode;ZTest Mode;101;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1054;7699.94,4640.364;Inherit;False;Property;_Opacity;Opacity;105;0;Create;True;0;0;0;True;0;False;1;0.273;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;976;2667.509,3329.567;Inherit;False;Property;_GlowMaskTint;Glow Mask Tint;88;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1039;1744,2928;Inherit;False;Property;_ReadMask;Read Mask;95;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;2128,3072;Inherit;False;Property;_Units;Units;104;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;970;1370.1,2684.252;Inherit;False;Property;_EditorVersion;Editor Version;0;1;[Enum];Create;True;0;2;Basic;0;Advanced;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;973;2680.509,2996.567;Inherit;False;Property;_EnableGlowMask;Enable GlowMask;85;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1058;3077.777,3617.62;Inherit;False;myVarName;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1049;2128,3008;Inherit;False;Property;_Factor;Factor;103;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;640;2336,3840;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1046;2128,2880;Inherit;False;Property;_ZWriteMode;ZWrite Mode;102;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;909;5214.16,5121.631;Inherit;False;Property;_OutlineColor;Outline Color;82;0;Create;True;0;0;0;True;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1098;7916.982,4592.474;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Outline;0;3;Outline;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;CullMode=Front;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1096;8035.982,4429.474;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardAdd;0;1;ForwardAdd;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;True;1;LightMode=ForwardAdd;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1099;7467.201,4094.323;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ShadowCaster;0;4;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;True;1046;True;3;True;1052;False;True;1;LightMode=ShadowCaster;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1095;8035.982,4319.474;Float;False;True;-1;2;ASWGuiltyGearStriveGUI;100;8;.Aerthas/Arc System Works/Game Select/Guilty Gear Strive/Transparent v8.1.4;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardBase;0;0;ForwardBase;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;VRCFallback=Toon;True;2;0;True;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;True;True;True;255;True;1038;255;True;1039;255;True;1040;7;True;1041;1;True;1042;1;True;1043;1;True;1044;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;1046;True;3;True;1052;True;True;0;True;1049;0;True;1050;True;1;LightMode=ForwardBase;True;2;0;;0;0;Standard;0;0;5;True;True;False;False;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1097;7916.982,4431.474;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Deferred;0;2;Deferred;4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Deferred;True;2;0;;0;0;Standard;0;False;0
WireConnection;280;0;274;1
WireConnection;280;1;274;2
WireConnection;280;2;274;3
WireConnection;277;0;280;0
WireConnection;292;0;277;0
WireConnection;762;0;296;1
WireConnection;762;1;296;2
WireConnection;762;2;296;3
WireConnection;563;0;535;0
WireConnection;450;0;634;0
WireConnection;763;0;297;1
WireConnection;763;1;297;2
WireConnection;763;2;297;3
WireConnection;561;0;533;0
WireConnection;585;0;762;0
WireConnection;585;1;763;0
WireConnection;580;0;296;4
WireConnection;574;0;292;1
WireConnection;576;0;292;2
WireConnection;1090;0;1089;0
WireConnection;1062;0;1061;0
WireConnection;1066;0;1065;0
WireConnection;1005;0;1004;0
WireConnection;357;0;274;4
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
WireConnection;1007;0;1006;0
WireConnection;637;12;525;0
WireConnection;637;17;562;0
WireConnection;637;16;564;0
WireConnection;637;29;434;0
WireConnection;637;28;435;0
WireConnection;637;33;471;0
WireConnection;637;34;472;0
WireConnection;1067;0;1064;0
WireConnection;581;0;297;4
WireConnection;993;0;992;0
WireConnection;993;2;585;0
WireConnection;993;3;764;0
WireConnection;1087;5;637;0
WireConnection;1087;21;637;42
WireConnection;1087;6;637;52
WireConnection;1087;3;639;0
WireConnection;1087;1;706;0
WireConnection;1087;2;629;0
WireConnection;1087;11;707;0
WireConnection;1087;10;641;0
WireConnection;1112;1;1087;0
WireConnection;1112;3;1087;8
WireConnection;1112;2;1087;9
WireConnection;1112;5;753;0
WireConnection;1112;7;729;0
WireConnection;1112;80;758;0
WireConnection;1112;8;746;0
WireConnection;1112;9;711;0
WireConnection;1112;121;1105;0
WireConnection;1112;10;716;0
WireConnection;1112;11;727;0
WireConnection;1112;120;1106;0
WireConnection;1112;12;731;0
WireConnection;1112;13;732;0
WireConnection;1112;97;922;0
WireConnection;1112;101;923;0
WireConnection;1112;104;924;0
WireConnection;1112;107;925;0
WireConnection;1112;110;926;0
WireConnection;1075;24;993;0
WireConnection;1075;35;1091;0
WireConnection;1075;29;1070;0
WireConnection;1075;26;1071;0
WireConnection;1075;25;1072;0
WireConnection;1075;30;1073;0
WireConnection;1075;27;1074;0
WireConnection;1075;28;1069;0
WireConnection;780;0;778;0
WireConnection;779;0;777;0
WireConnection;1077;0;1075;23
WireConnection;573;0;292;0
WireConnection;1076;0;1075;0
WireConnection;1101;33;1109;0
WireConnection;1101;35;1110;0
WireConnection;1101;25;1102;0
WireConnection;1101;24;1103;0
WireConnection;1101;26;1104;0
WireConnection;1101;17;1016;0
WireConnection;1101;22;1017;0
WireConnection;1101;20;1013;0
WireConnection;1101;6;994;0
WireConnection;1101;7;1000;0
WireConnection;1101;8;1001;0
WireConnection;1101;9;1002;0
WireConnection;1101;10;1003;0
WireConnection;1101;1;1112;100
WireConnection;1101;2;1112;103
WireConnection;1101;3;1112;106
WireConnection;1101;4;1112;109
WireConnection;1101;5;1112;112
WireConnection;920;0;1101;0
WireConnection;872;0;871;0
WireConnection;988;0;277;0
WireConnection;1088;6;1112;76
WireConnection;1088;29;1112;69
WireConnection;1088;39;1112;62
WireConnection;1088;41;1112;0
WireConnection;1088;7;767;0
WireConnection;1088;9;793;0
WireConnection;1088;94;804;0
WireConnection;1088;11;859;0
WireConnection;1088;67;860;0
WireConnection;1088;75;880;0
WireConnection;1088;76;881;0
WireConnection;1088;78;882;0
WireConnection;1088;81;885;0
WireConnection;1088;80;884;0
WireConnection;1088;79;883;0
WireConnection;1088;83;887;0
WireConnection;1088;82;888;0
WireConnection;1088;84;889;0
WireConnection;1088;85;894;0
WireConnection;1088;86;893;0
WireConnection;1088;87;892;0
WireConnection;1088;89;896;0
WireConnection;1088;88;897;0
WireConnection;1088;90;898;0
WireConnection;1025;0;1088;105
WireConnection;1093;25;1094;0
WireConnection;1093;10;632;0
WireConnection;1093;5;544;0
WireConnection;1093;14;873;0
WireConnection;1093;6;867;0
WireConnection;1093;7;869;0
WireConnection;1093;19;950;0
WireConnection;1031;0;983;0
WireConnection;1031;3;1032;0
WireConnection;944;0;1093;0
WireConnection;947;0;1093;16
WireConnection;1086;1;1085;0
WireConnection;1086;2;1080;0
WireConnection;1086;3;1083;0
WireConnection;1086;4;1079;0
WireConnection;1086;5;1084;0
WireConnection;1086;6;1082;0
WireConnection;1086;7;1081;0
WireConnection;1033;48;979;0
WireConnection;1033;59;978;0
WireConnection;1033;47;981;0
WireConnection;1033;50;985;0
WireConnection;1033;54;1031;0
WireConnection;1033;57;1107;0
WireConnection;1033;55;980;0
WireConnection;1033;56;1108;0
WireConnection;932;0;933;0
WireConnection;932;1;1027;0
WireConnection;932;2;948;0
WireConnection;987;0;1033;0
WireConnection;934;0;1086;0
WireConnection;934;1;870;0
WireConnection;1100;0;934;0
WireConnection;1100;1;932;0
WireConnection;1100;2;928;0
WireConnection;903;0;1053;0
WireConnection;903;2;1036;0
WireConnection;903;1;1053;109
WireConnection;989;0;991;0
WireConnection;989;2;1100;0
WireConnection;989;3;990;0
WireConnection;1053;33;912;0
WireConnection;1053;47;911;0
WireConnection;1053;127;910;0
WireConnection;1053;35;909;0
WireConnection;1053;37;908;0
WireConnection;1053;36;907;0
WireConnection;1053;31;904;0
WireConnection;517;0;634;15
WireConnection;1058;0;1087;0
WireConnection;1095;0;989;0
WireConnection;1095;1;1054;0
ASEEND*/
//CHKSM=C3E75182069DA617695CA0532E926233E1BD1987
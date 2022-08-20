// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader ".Aerthas/Arc System Works/Game Select/FighterZ/Opaque v8.1.4"
{
	Properties
	{
		_ShadowRimlightBaseColor("Shadow Rimlight Base Color", Color) = (0.2392157,0.2392157,0.5294118,0)
		[Enum(Basic,0,Advanced,1)]_EditorVersion("Editor Version", Float) = 0
		_MainTex("MainTex", 2D) = "white" {}
		_SSS("SSS", 2D) = "white" {}
		_ILM("ILM", 2D) = "white" {}
		_Detail("Detail", 2D) = "white" {}
		[Enum(Default Black,0,Shadow Priority,1,ILM Priority,2)]_ILMColorSetting("ILM Color Setting", Float) = 0
		[Enum(Default Black,0,Shadow Priority,1,Detail Priority,2)]_DetailColorSetting("Detail Color Setting", Float) = 0
		_FakeGlobalLightColor("Fake Global Light Color", Color) = (1,1,1,0)
		_ILMAlphaColor("ILM Alpha Color", Color) = (1,0,0,0)
		_FakeGlobalLightIntensity("Fake Global Light Intensity", Float) = 0.4
		_FakeLightDirX("Fake Light Dir X", Float) = 35
		_FakeLightDirY("Fake Light Dir Y", Float) = -135
		_ViewDirOffsetPitch("View Dir Offset Pitch", Range( -90 , 90)) = 0
		_ViewDirOffsetYaw("View Dir Offset Yaw", Range( -90 , 90)) = 0
		_DepthOffset("Depth Offset", Float) = 1
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
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode("ZTest Mode", Float) = 4
		_Shadow1VertexRThreshold("Shadow 1 VertexR Threshold", Range( 0 , 1)) = 0.5
		_Shadow2Push("Shadow 2 Push", Range( -1 , 1)) = 0.2
		_Shadow2VertexRThreshold("Shadow 2 VertexR Threshold", Range( 0 , 1)) = 0.1
		_PermanentShadowThreshold("Permanent Shadow Threshold", Range( 0 , 1)) = 0.1
		[ToggleUI]_EnableColorReplacer("Enable Color Replacer", Float) = 0
		_RimlightSize("Rimlight Size", Range( 0 , 1)) = 0.4
		[ToggleUI]_EnableRimlight("Enable Rimlight", Float) = 1
		[IntRange]_TotalReplacements("Total Replacements", Range( 0 , 5)) = 0
		_Source1Color("Source 1 Color", Color) = (1,1,1,0)
		_Source1Fuzziness("Source 1 Fuzziness", Range( 0.01 , 1)) = 0
		_Target1Color("Target 1 Color", Color) = (1,1,1,0)
		_SSSHueShift1("SSS Hue Shift 1", Range( -1 , 1)) = 0
		_Source2Color("Source 2 Color", Color) = (1,1,1,0)
		_Source2Fuzziness("Source 2 Fuzziness", Range( 0.01 , 1)) = 0
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
		_SSSHueShift5("SSS Hue Shift 5", Range( -1 , 1)) = 0
		_HighlightRimlightIntensity("Highlight Rimlight Intensity", Float) = 1
		[Enum(All Channels,0,Red,1,Green,2,Blue,3,Alpha,4)]_VertexChannel("Vertex Channel", Float) = 0
		_HighlightRimlightTint("Highlight Rimlight Tint", Color) = (1,1,1,0)
		_HighlightRimlightSaturation("Highlight Rimlight Saturation", Range( 0 , 4)) = 1
		_DebugColor("Debug Color", Color) = (1,1,1,0)
		[ToggleUI]_HighlightRimlightEmissiveToggle("Highlight Rimlight Emissive Toggle", Float) = 0
		_HighlightRimlightEmissionIntensity("Highlight Rimlight Emission Intensity", Float) = 1
		_SpecularIntensity("Specular Intensity", Float) = 1
		_SpecularTint("Specular Tint", Color) = (1,1,1,0)
		_SpecularSaturation("Specular Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_SpecularEmissiveToggle("Specular Emissive Toggle", Float) = 0
		_SpecularEmissionIntensity("Specular Emission Intensity", Float) = 1
		_BaseIntensity("Base Intensity", Float) = 1
		_BaseTint("Base Tint", Color) = (1,1,1,0)
		_ShadowRimlightEmissionIntensity("Shadow Rimlight Emission Intensity", Float) = 1
		_BaseSaturation("Base Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_BaseEmissiveToggle("Base Emissive Toggle", Float) = 0
		_Shadow1Intensity("Shadow 1 Intensity", Float) = 1
		_Shadow1Tint("Shadow 1 Tint", Color) = (1,1,1,0)
		_Shadow1EmissionIntensity("Shadow 1 Emission Intensity", Float) = 1
		_Shadow1Saturation("Shadow 1 Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_Shadow1EmissiveToggle("Shadow 1 Emissive Toggle", Float) = 0
		_Shadow2Intensity("Shadow 2 Intensity", Float) = 1
		_Shadow2Tint("Shadow 2 Tint", Color) = (1,1,1,0)
		_Shadow2Saturation("Shadow 2 Saturation", Range( 0 , 4)) = 1
		_BaseEmissionIntensity("Base Emission Intensity", Float) = 1
		[ToggleUI]_Shadow2EmissiveToggle("Shadow 2 Emissive Toggle", Float) = 0
		_ShadowRimlightTint("Shadow Rimlight Tint", Color) = (1,1,1,0)
		_ShadowRimlightIntensity("Shadow Rimlight Intensity", Float) = 1
		_ShadowRimlightSaturation("Shadow Rimlight Saturation", Range( 0 , 4)) = 1
		[ToggleUI]_ShadowRimlightEmissiveToggle("Shadow Rimlight Emissive Toggle", Float) = 0
		[ToggleUI]_EnableOutline("Enable Outline", Float) = 0
		_OutlineThickness("Outline Thickness", Float) = 0
		[ToggleUI]_EnableCameraDistanceMult("Enable Camera Distance Mult", Float) = 1
		_OutlineColor("Outline Color", Color) = (0,0,0,0)
		_OutlineColorIntensity("Outline Color Intensity", Float) = 1
		[ToggleUI]_OutlineEnableBaseColorMult("Outline Enable Base Color Mult", Float) = 1
		[ToggleUI]_EnableDebug("Enable Debug", Float) = 0
		_Shadow2EmissionIntensity("Shadow 2 Emission Intensity", Float) = 1
		_BodyLinesEmissionIntensity("Body Lines Emission Intensity", Float) = 1
		_ILMAlphaEmissionIntensity("ILM Alpha Emission Intensity", Float) = 1
		[IntRange]_Reference("Reference", Range( 0 , 255)) = 0
		[ToggleUI]_BodyLinesEmissionToggle("Body Lines Emission Toggle", Float) = 0
		[IntRange]_ReadMask("Read Mask", Range( 0 , 255)) = 255
		[ToggleUI]_ILMAlphaLinesEmissionToggle("ILM Alpha Lines Emission Toggle", Float) = 0
		[IntRange]_WriteMask("Write Mask", Range( 0 , 255)) = 255
		[Enum(Vertex Colors,0,ILM Channels,1,Base Alpha,2)]_DebugGroup("Debug Group", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Comparison("Comparison", Float) = 0
		[Enum(All Channels,0,Red,1,Green,2,Blue,3,Alpha,4)]_ILMChannel("ILM Channel", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_PassFront("Pass Front", Float) = 0
		_BodyLinesColor("Body Lines Color", Color) = (0,1,0,0)
		[Enum(UnityEngine.Rendering.StencilOp)]_FailFront("Fail Front", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)]_ZFailFront("ZFail Front", Float) = 0
		[IntRange][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Float) = 1
		_Factor("Factor", Float) = 0
		_Units("Units", Float) = 0
		_Opacity("Opacity", Range( 0 , 1)) = 1
		_Shadow1Smoothness("Shadow 1 Smoothness", Range( 0 , 1)) = 0
		_Shadow2Smoothness("Shadow 2 Smoothness", Range( 0 , 1)) = 0
		_EmissionMask("Emission Mask", 2D) = "black" {}
		[ASEEnd]_EmissionMaskIntensity("Emission Mask Intensity", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" "VRCFallback"="Toon" }
	LOD 100

		Cull Back
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
			
			uniform float _ReadMask;
			uniform float _ZFailFront;
			uniform float _ZTestMode;
			uniform float _EditorVersion;
			uniform float _WriteMask;
			uniform float _Reference;
			uniform float _Comparison;
			uniform float _Opacity;
			uniform float _ZWriteMode;
			uniform float _FailFront;
			uniform float _PassFront;
			uniform float _Factor;
			uniform float _Units;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _EnableColorReplacer;
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
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableRimlight;
			uniform float _RimlightSize;
			uniform float _Shadow1VertexRThreshold;
			uniform float _LightDirectionSetting;
			uniform float _FallbackLightDirection;
			uniform float _ViewDirOffsetYaw;
			uniform float _ViewDirOffsetPitch;
			uniform float _FakeLightDirX;
			uniform float _FakeLightDirY;
			uniform float _GlobalLightPush;
			uniform float _Shadow1Smoothness;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _Shadow2Smoothness;
			uniform float _PermanentShadowThreshold;
			uniform float4 _LightColor;
			uniform float _HighlightRimlightIntensity;
			uniform float4 _HighlightRimlightTint;
			uniform float _HighlightRimlightSaturation;
			uniform float _SpecularSize;
			uniform float _SpecularIntensity;
			uniform float4 _SpecularTint;
			uniform float _SpecularSaturation;
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
			uniform float4 _ShadowRimlightBaseColor;
			uniform float _ShadowRimlightIntensity;
			uniform float4 _ShadowRimlightTint;
			uniform float _ShadowRimlightSaturation;
			uniform float _LightColorSetting;
			uniform float _MinimumGlobalLightIntensity;
			uniform float4 _FakeGlobalLightColor;
			uniform float _FakeGlobalLightIntensity;
			uniform float _EmissionIntensity;
			uniform float _HighlightRimlightEmissiveToggle;
			uniform float _HighlightRimlightEmissionIntensity;
			uniform float _SpecularEmissiveToggle;
			uniform float _SpecularEmissionIntensity;
			uniform float _BaseEmissiveToggle;
			uniform float _BaseEmissionIntensity;
			uniform float _Shadow1EmissiveToggle;
			uniform float _Shadow1EmissionIntensity;
			uniform float _Shadow2EmissiveToggle;
			uniform float _Shadow2EmissionIntensity;
			uniform float _ShadowRimlightEmissiveToggle;
			uniform float _ShadowRimlightEmissionIntensity;
			uniform float _ILMAlphaEmissionIntensity;
			uniform float _ILMAlphaLinesEmissionToggle;
			uniform float _BodyLinesEmissionToggle;
			uniform float _BodyLinesEmissionIntensity;
			uniform float _EmissionMaskIntensity;
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
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
			float3 StereoCameraViewDirection32_g1529( float3 worldPos )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				float3 worldViewDir = normalize((cameraPos - worldPos));
				return worldViewDir;
			}
			
			float3 ViewMatrix1418_g1531(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 ViewMatrix0417_g1531(  )
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
			
			float3 StereoCameraViewPosition30_g1529(  )
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
				float4 ase_texcoord4 : TEXCOORD4;
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
				o.ase_color = v.ase_color;
				o.ase_texcoord4 = v.vertex;
				
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

				float ILMColorSetting993 = _ILMColorSetting;
				float4 ILMAColor992 = _ILMAlphaColor;
				float DetailColorSetting1027 = _DetailColorSetting;
				float4 DetailColor1029 = _BodyLinesColor;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float BaseA580 = tex2DNode296.a;
				float BaseA13_g1537 = BaseA580;
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g818 = _TotalReplacements;
				float4 break8_g823 = _Target5Color;
				float4 break8_g819 = _Target4Color;
				float4 break8_g821 = _Target3Color;
				float4 break8_g820 = _Target2Color;
				float4 break8_g822 = _Target1Color;
				float3x3 temp_output_67_0_g818 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g822 = float4( temp_output_67_0_g818[0] , 0.0 );
				float4 break6_g822 = temp_output_13_0_g822;
				float4 appendResult3_g822 = (float4(break8_g822.r , break8_g822.g , break8_g822.b , break6_g822.a));
				float4 appendResult7_g822 = (float4(break6_g822.r , break6_g822.g , break6_g822.b , 1.0));
				float smoothstepResult5_g822 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g822 , _Source1Color ));
				float4 lerpResult4_g822 = lerp( appendResult3_g822 , temp_output_13_0_g822 , smoothstepResult5_g822);
				float4 temp_output_106_0_g818 = lerpResult4_g822;
				float4 temp_output_13_0_g820 = temp_output_106_0_g818;
				float4 break6_g820 = temp_output_13_0_g820;
				float4 appendResult3_g820 = (float4(break8_g820.r , break8_g820.g , break8_g820.b , break6_g820.a));
				float4 appendResult7_g820 = (float4(break6_g820.r , break6_g820.g , break6_g820.b , 1.0));
				float smoothstepResult5_g820 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g820 , _Source2Color ));
				float4 lerpResult4_g820 = lerp( appendResult3_g820 , temp_output_13_0_g820 , smoothstepResult5_g820);
				float4 temp_output_102_0_g818 = lerpResult4_g820;
				float4 temp_output_13_0_g821 = temp_output_102_0_g818;
				float4 break6_g821 = temp_output_13_0_g821;
				float4 appendResult3_g821 = (float4(break8_g821.r , break8_g821.g , break8_g821.b , break6_g821.a));
				float4 appendResult7_g821 = (float4(break6_g821.r , break6_g821.g , break6_g821.b , 1.0));
				float smoothstepResult5_g821 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g821 , _Source3Color ));
				float4 lerpResult4_g821 = lerp( appendResult3_g821 , temp_output_13_0_g821 , smoothstepResult5_g821);
				float4 temp_output_104_0_g818 = lerpResult4_g821;
				float4 temp_output_13_0_g819 = temp_output_104_0_g818;
				float4 break6_g819 = temp_output_13_0_g819;
				float4 appendResult3_g819 = (float4(break8_g819.r , break8_g819.g , break8_g819.b , break6_g819.a));
				float4 appendResult7_g819 = (float4(break6_g819.r , break6_g819.g , break6_g819.b , 1.0));
				float smoothstepResult5_g819 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g819 , _Source4Color ));
				float4 lerpResult4_g819 = lerp( appendResult3_g819 , temp_output_13_0_g819 , smoothstepResult5_g819);
				float4 temp_output_105_0_g818 = lerpResult4_g819;
				float4 temp_output_13_0_g823 = temp_output_105_0_g818;
				float4 break6_g823 = temp_output_13_0_g823;
				float4 appendResult3_g823 = (float4(break8_g823.r , break8_g823.g , break8_g823.b , break6_g823.a));
				float4 appendResult7_g823 = (float4(break6_g823.r , break6_g823.g , break6_g823.b , 1.0));
				float smoothstepResult5_g823 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g823 , _Source5Color ));
				float4 lerpResult4_g823 = lerp( appendResult3_g823 , temp_output_13_0_g823 , smoothstepResult5_g823);
				float4 temp_output_15_0_g822 = float4( temp_output_67_0_g818[1] , 0.0 );
				float3 hsvTorgb25_g822 = RGBToHSV( temp_output_15_0_g822.rgb );
				float3 hsvTorgb26_g822 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g822.x ),hsvTorgb25_g822.y,hsvTorgb25_g822.z) );
				float4 appendResult18_g822 = (float4(hsvTorgb26_g822 , temp_output_15_0_g822.a));
				float4 lerpResult19_g822 = lerp( appendResult18_g822 , temp_output_15_0_g822 , smoothstepResult5_g822);
				float4 temp_output_15_0_g820 = lerpResult19_g822;
				float3 hsvTorgb25_g820 = RGBToHSV( temp_output_15_0_g820.rgb );
				float3 hsvTorgb26_g820 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g820.x ),hsvTorgb25_g820.y,hsvTorgb25_g820.z) );
				float4 appendResult18_g820 = (float4(hsvTorgb26_g820 , temp_output_15_0_g820.a));
				float4 lerpResult19_g820 = lerp( appendResult18_g820 , temp_output_15_0_g820 , smoothstepResult5_g820);
				float4 temp_output_15_0_g821 = lerpResult19_g820;
				float3 hsvTorgb25_g821 = RGBToHSV( temp_output_15_0_g821.rgb );
				float3 hsvTorgb26_g821 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g821.x ),hsvTorgb25_g821.y,hsvTorgb25_g821.z) );
				float4 appendResult18_g821 = (float4(hsvTorgb26_g821 , temp_output_15_0_g821.a));
				float4 lerpResult19_g821 = lerp( appendResult18_g821 , temp_output_15_0_g821 , smoothstepResult5_g821);
				float4 temp_output_15_0_g819 = lerpResult19_g821;
				float3 hsvTorgb25_g819 = RGBToHSV( temp_output_15_0_g819.rgb );
				float3 hsvTorgb26_g819 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g819.x ),hsvTorgb25_g819.y,hsvTorgb25_g819.z) );
				float4 appendResult18_g819 = (float4(hsvTorgb26_g819 , temp_output_15_0_g819.a));
				float4 lerpResult19_g819 = lerp( appendResult18_g819 , temp_output_15_0_g819 , smoothstepResult5_g819);
				float4 temp_output_15_0_g823 = lerpResult19_g819;
				float3 hsvTorgb25_g823 = RGBToHSV( temp_output_15_0_g823.rgb );
				float3 hsvTorgb26_g823 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g823.x ),hsvTorgb25_g823.y,hsvTorgb25_g823.z) );
				float4 appendResult18_g823 = (float4(hsvTorgb26_g823 , temp_output_15_0_g823.a));
				float4 lerpResult19_g823 = lerp( appendResult18_g823 , temp_output_15_0_g823 , smoothstepResult5_g823);
				float3x3 temp_output_995_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g818 == 5.0 ? lerpResult4_g823 : ( temp_output_52_0_g818 == 4.0 ? temp_output_105_0_g818 : ( temp_output_52_0_g818 == 3.0 ? temp_output_104_0_g818 : ( temp_output_52_0_g818 == 2.0 ? temp_output_102_0_g818 : ( temp_output_52_0_g818 == 1.0 ? temp_output_106_0_g818 : float4( temp_output_67_0_g818[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g823.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail807 = tex2D( _Detail, uv2_Detail );
				float4 lerpResult1030 = lerp( DetailColor1029 , float4( temp_output_995_0[0] , 0.0 ) , Detail807);
				float4 temp_output_1031_0 = ( _DetailColorSetting == 1.0 ? lerpResult1030 : ( Detail807 * float4( temp_output_995_0[0] , 0.0 ) ) );
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1020 = lerp( ILMAColor992 , temp_output_1031_0 , ILMA357);
				float4 Base339 = ( _ILMColorSetting == 1.0 ? lerpResult1020 : ( ILMA357 * temp_output_1031_0 ) );
				float4 Base12_g1537 = Base339;
				float EnableRimlight82_g1533 = _EnableRimlight;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 worldPos32_g1529 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1529 = StereoCameraViewDirection32_g1529( worldPos32_g1529 );
				float dotResult31_g1529 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1529 );
				float SSSA581 = tex2DNode297.a;
				float blendOpSrc15_g1532 = SSSA581;
				float blendOpDest15_g1532 = BaseA580;
				float NdV48_g1533 = ( ( 1.0 - ( dotResult31_g1529 + ( 1.0 - _RimlightSize ) ) ) * ( 1.0 - ( saturate( abs( blendOpSrc15_g1532 - blendOpDest15_g1532 ) )) ) );
				float VertexR33_g1533 = i.ase_color.r;
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix1418_g1531 = ViewMatrix1418_g1531();
				float3 normalizeResult422_g1531 = normalize( localViewMatrix1418_g1531 );
				int localIsInMirror411_g1531 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_297_0_g1531 = _ViewDirOffsetYaw;
				float temp_output_424_0_g1531 = radians( ( (float)localIsInMirror411_g1531 == 0.0 ? -temp_output_297_0_g1531 : temp_output_297_0_g1531 ) );
				float3 localViewMatrix0417_g1531 = ViewMatrix0417_g1531();
				float3 normalizeResult425_g1531 = normalize( localViewMatrix0417_g1531 );
				float3 rotatedValue428_g1531 = RotateAroundAxis( float3( 0,0,0 ), normalizeResult425_g1531, normalizeResult422_g1531, temp_output_424_0_g1531 );
				float3 normalizeResult429_g1531 = normalize( rotatedValue428_g1531 );
				int localIsInMirror423_g1531 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_296_0_g1531 = _ViewDirOffsetPitch;
				float3 localStereoCameraViewPosition30_g1529 = StereoCameraViewPosition30_g1529();
				float3 rotatedValue431_g1531 = RotateAroundAxis( float3( 0,0,0 ), ( localStereoCameraViewPosition30_g1529 - ( ase_worldPos - i.ase_texcoord4.xyz ) ), normalizeResult422_g1531, temp_output_424_0_g1531 );
				float3 rotatedValue432_g1531 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue431_g1531, normalizeResult429_g1531, radians( ( (float)localIsInMirror423_g1531 == 0.0 ? temp_output_296_0_g1531 : -temp_output_296_0_g1531 ) ) );
				float3 normalizeResult433_g1531 = ASESafeNormalize( rotatedValue432_g1531 );
				float3 normalizeResult38_g1529 = normalize( normalizeResult433_g1531 );
				float3 appendResult15_g1530 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1530 = normalize( appendResult15_g1530 );
				float3 normalizeResult26_g1529 = normalize( normalizeResult2_g1530 );
				float3 ifLocalVar3_g1529 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1529 = normalizeResult38_g1529;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1529 = normalizeResult26_g1529;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1507 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1507 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1507 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1507 = color8_g1507;
				#else
				float4 staticSwitch9_g1507 = ( clampResult7_g1507 * color14_g1507 );
				#endif
				float4 break10_g1507 = staticSwitch9_g1507;
				float IsThereWorldLight450 = break10_g1507.r;
				float3 ifLocalVar8_g1529 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1529 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1529 = ifLocalVar3_g1529;
				float3 ifLocalVar9_g1529 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1529 = ifLocalVar3_g1529;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1529 = ifLocalVar8_g1529;
				float dotResult46_g1529 = dot( ifLocalVar9_g1529 , normalizedWorldNormal );
				float temp_output_36_0_g1532 = ( ( dotResult46_g1529 + _GlobalLightPush ) * i.ase_color.r );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMG574 = break292.y;
				float temp_output_1_0_g1532 = ILMG574;
				float temp_output_1077_0 = ( ( temp_output_36_0_g1532 * 0.5 ) + ( ( temp_output_1_0_g1532 * 2.0 ) - 1.0 ) );
				float NdL20_g1533 = temp_output_1077_0;
				float temp_output_2_0_g1534 = NdL20_g1533;
				float temp_output_3_0_g1534 = -_Shadow1Smoothness;
				float temp_output_9_0_g1533 = _Shadow1Push;
				float temp_output_11_0_g1533 = _Shadow2Push;
				float clampResult15_g1533 = clamp( temp_output_9_0_g1533 , temp_output_11_0_g1533 , temp_output_9_0_g1533 );
				float RealShadow1Push16_g1533 = clampResult15_g1533;
				float temp_output_1_0_g1534 = RealShadow1Push16_g1533;
				float smoothstepResult6_g1534 = smoothstep( ( ( temp_output_2_0_g1534 / 1.0 ) + temp_output_3_0_g1534 ) , temp_output_2_0_g1534 , temp_output_1_0_g1534);
				float lerpResult7_g1534 = lerp( smoothstepResult6_g1534 , ( temp_output_1_0_g1534 >= temp_output_2_0_g1534 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1534 ? 1.0 : 0.0 ));
				float clampResult17_g1533 = clamp( temp_output_11_0_g1533 , temp_output_11_0_g1533 , temp_output_9_0_g1533 );
				float RealShadow2Push18_g1533 = clampResult17_g1533;
				float temp_output_2_0_g1535 = NdL20_g1533;
				float temp_output_3_0_g1535 = -_Shadow2Smoothness;
				float temp_output_1_0_g1535 = RealShadow2Push18_g1533;
				float smoothstepResult6_g1535 = smoothstep( ( ( temp_output_2_0_g1535 / 1.0 ) + temp_output_3_0_g1535 ) , temp_output_2_0_g1535 , temp_output_1_0_g1535);
				float lerpResult7_g1535 = lerp( smoothstepResult6_g1535 , ( temp_output_1_0_g1535 >= temp_output_2_0_g1535 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1535 ? 1.0 : 0.0 ));
				float temp_output_42_0_g1533 = max( max( ( 1.0 - ( VertexR33_g1533 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , lerpResult7_g1535 ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1533 = ( max( ( 1.0 - ( VertexR33_g1533 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( lerpResult7_g1534 , ( RealShadow1Push16_g1533 >= RealShadow2Push18_g1533 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1533 );
				float temp_output_61_0_g1533 = ( 1.0 - ( temp_output_43_0_g1533 + temp_output_42_0_g1533 ) );
				float temp_output_75_0_g1533 = ceil( ( ( ( NdV48_g1533 * BaseA580 ) > 0.0 ? 1.0 : 0.0 ) * temp_output_61_0_g1533 ) );
				float clampResult88_g1533 = clamp( temp_output_75_0_g1533 , 0.0 , 1.0 );
				float temp_output_94_0_g1533 = ( EnableRimlight82_g1533 == 1.0 ? clampResult88_g1533 : 0.0 );
				float temp_output_6_0_g1537 = temp_output_94_0_g1533;
				float4 temp_cast_31 = (temp_output_6_0_g1537).xxxx;
				float4 blendOpSrc19_g1537 = Base12_g1537;
				float4 blendOpDest19_g1537 = temp_cast_31;
				float4 lerpBlendMode19_g1537 = lerp(blendOpDest19_g1537,min( blendOpSrc19_g1537 , blendOpDest19_g1537 ),0.9);
				float4 LightColor779 = _LightColor;
				float4 LightColor16_g1537 = LightColor779;
				float3 desaturateInitialColor9_g1538 = ( ( ( BaseA13_g1537 * ( saturate( lerpBlendMode19_g1537 )) ) + ( Base12_g1537 * temp_output_6_0_g1537 ) ) * LightColor16_g1537 * _HighlightRimlightIntensity * _HighlightRimlightTint ).rgb;
				float desaturateDot9_g1538 = dot( desaturateInitialColor9_g1538, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1538 = lerp( desaturateInitialColor9_g1538, desaturateDot9_g1538.xxx, ( 1.0 - _HighlightRimlightSaturation ) );
				float ILMB576 = break292.z;
				float3 normalizeResult48_g1529 = normalize( ifLocalVar9_g1529 );
				float3 normalizeResult51_g1529 = normalize( ( normalizeResult48_g1529 + localStereoCameraViewDirection32_g1529 ) );
				float dotResult50_g1529 = dot( normalizedWorldNormal , normalizeResult51_g1529 );
				float blendOpSrc34_g1532 = ILMB576;
				float blendOpDest34_g1532 = dotResult50_g1529;
				float temp_output_68_0_g1533 = ( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1532) / max( blendOpSrc34_g1532, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) * temp_output_61_0_g1533 );
				float clampResult87_g1533 = clamp( temp_output_68_0_g1533 , 0.0 , 1.0 );
				float temp_output_29_0_g1537 = clampResult87_g1533;
				float4 temp_cast_33 = (temp_output_29_0_g1537).xxxx;
				float4 blendOpSrc30_g1537 = Base12_g1537;
				float4 blendOpDest30_g1537 = temp_cast_33;
				float4 lerpBlendMode30_g1537 = lerp(blendOpDest30_g1537,min( blendOpSrc30_g1537 , blendOpDest30_g1537 ),0.9);
				float3 desaturateInitialColor9_g1541 = ( ( ( BaseA13_g1537 * ( saturate( lerpBlendMode30_g1537 )) ) + ( Base12_g1537 * temp_output_29_0_g1537 ) ) * LightColor16_g1537 * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1541 = dot( desaturateInitialColor9_g1541, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1541 = lerp( desaturateInitialColor9_g1541, desaturateDot9_g1541.xxx, ( 1.0 - _SpecularSaturation ) );
				float temp_output_77_0_g1533 = ( temp_output_61_0_g1533 - temp_output_68_0_g1533 );
				float clampResult90_g1533 = clamp( ( EnableRimlight82_g1533 == 1.0 ? ( temp_output_77_0_g1533 - temp_output_75_0_g1533 ) : temp_output_77_0_g1533 ) , 0.0 , 1.0 );
				float3 desaturateInitialColor9_g1543 = ( ( Base12_g1537 * clampResult90_g1533 ) * LightColor16_g1537 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1543 = dot( desaturateInitialColor9_g1543, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1543 = lerp( desaturateInitialColor9_g1543, desaturateDot9_g1543.xxx, ( 1.0 - _BaseSaturation ) );
				float3 SSS578 = temp_output_995_0[1];
				float4 SSS14_g1537 = float4( SSS578 , 0.0 );
				float4 AmbientColor780 = _AmbientColor;
				float4 AmbientColor68_g1537 = AmbientColor780;
				float3 desaturateInitialColor9_g1542 = ( ( temp_output_43_0_g1533 * Base12_g1537 * SSS14_g1537 ) * AmbientColor68_g1537 * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1542 = dot( desaturateInitialColor9_g1542, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1542 = lerp( desaturateInitialColor9_g1542, desaturateDot9_g1542.xxx, ( 1.0 - _Shadow1Saturation ) );
				float ILMR573 = break292.x;
				float temp_output_53_0_g1533 = ceil( ( ( ( temp_output_42_0_g1533 * NdV48_g1533 ) > 0.1 ? 1.0 : 0.0 ) * ILMR573 ) );
				float clampResult91_g1533 = clamp( ( EnableRimlight82_g1533 == 1.0 ? ( temp_output_42_0_g1533 - temp_output_53_0_g1533 ) : temp_output_42_0_g1533 ) , 0.0 , 1.0 );
				float4 blendOpSrc51_g1537 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1537 = ( Base12_g1537 * SSS14_g1537 );
				float4 lerpBlendMode51_g1537 = lerp(blendOpDest51_g1537,2.0f*blendOpDest51_g1537*blendOpSrc51_g1537 + blendOpDest51_g1537*blendOpDest51_g1537*(1.0f - 2.0f*blendOpSrc51_g1537),0.5);
				float3 desaturateInitialColor9_g1540 = ( ( clampResult91_g1533 * ( saturate( lerpBlendMode51_g1537 )) ) * AmbientColor68_g1537 * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1540 = dot( desaturateInitialColor9_g1540, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1540 = lerp( desaturateInitialColor9_g1540, desaturateDot9_g1540.xxx, ( 1.0 - _Shadow2Saturation ) );
				float clampResult92_g1533 = clamp( temp_output_53_0_g1533 , 0.0 , 1.0 );
				float temp_output_96_0_g1533 = ( EnableRimlight82_g1533 == 1.0 ? clampResult92_g1533 : 0.0 );
				float temp_output_60_0_g1537 = temp_output_96_0_g1533;
				float4 blendOpSrc56_g1537 = float4( 0,0,0,0 );
				float4 blendOpDest56_g1537 = ( Base12_g1537 * SSS14_g1537 );
				float4 lerpBlendMode56_g1537 = lerp(blendOpDest56_g1537,2.0f*blendOpDest56_g1537*blendOpSrc56_g1537 + blendOpDest56_g1537*blendOpDest56_g1537*(1.0f - 2.0f*blendOpSrc56_g1537),0.5);
				float4 temp_output_56_0_g1537 = ( saturate( lerpBlendMode56_g1537 ));
				float3 desaturateInitialColor9_g1539 = ( ( ( ( temp_output_60_0_g1537 * ( temp_output_56_0_g1537 + _ShadowRimlightBaseColor ) ) + ( temp_output_60_0_g1537 * temp_output_56_0_g1537 ) ) * ILMR573 ) * AmbientColor68_g1537 * _ShadowRimlightIntensity * _ShadowRimlightTint ).rgb;
				float desaturateDot9_g1539 = dot( desaturateInitialColor9_g1539, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1539 = lerp( desaturateInitialColor9_g1539, desaturateDot9_g1539.xxx, ( 1.0 - _ShadowRimlightSaturation ) );
				float3 temp_output_787_0 = ( desaturateVar9_g1538 + desaturateVar9_g1541 + desaturateVar9_g1543 + desaturateVar9_g1542 + desaturateVar9_g1540 + desaturateVar9_g1539 );
				float4 lerpResult1049 = lerp( DetailColor1029 , float4( temp_output_787_0 , 0.0 ) , Detail807);
				float4 temp_output_1048_0 = ( DetailColorSetting1027 == 2.0 ? lerpResult1049 : float4( temp_output_787_0 , 0.0 ) );
				float4 lerpResult1004 = lerp( ILMAColor992 , temp_output_1048_0 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1544 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1544 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1544 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_43 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_44 = (5.0).xxxx;
				float4 clampResult18_g1544 = clamp( ase_lightColor , temp_cast_43 , temp_cast_44 );
				float4 temp_output_11_0_g1544 = ( ase_atten * clampResult18_g1544 );
				float4 temp_output_8_0_g1544 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1544 = 0;
				if( ifLocalVar13_g1544 > 0.0 )
				ifLocalVar3_g1544 = temp_output_11_0_g1544;
				else if( ifLocalVar13_g1544 == 0.0 )
				ifLocalVar3_g1544 = temp_output_8_0_g1544;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1544 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1544 );
				#else
				float4 staticSwitch9_g1544 = ifLocalVar3_g1544;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1544;
				float3 ColorOut997 = temp_output_787_0;
				float2 uv_EmissionMask = i.ase_texcoord1.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float4 temp_cast_47 = (( _EmissionMaskIntensity * tex2D( _EmissionMask, uv_EmissionMask ).r )).xxxx;
				float4 EmissionRampMask920 = max( ( ( ( temp_output_94_0_g1533 * _HighlightRimlightEmissiveToggle ) * _HighlightRimlightEmissionIntensity ) + ( ( clampResult87_g1533 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1533 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1533 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1533 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( temp_output_96_0_g1533 * _ShadowRimlightEmissiveToggle ) * _ShadowRimlightEmissionIntensity ) + ( ( 1.0 - ILMA357 ) * _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) + ( ( 1.0 - Detail807 ) * _BodyLinesEmissionToggle * _BodyLinesEmissionIntensity ) ) , temp_cast_47 );
				float4 temp_cast_49 = (EmissionRampMask920.r).xxxx;
				float4 ifLocalVar17_g1544 = 0;
				if( ifLocalVar13_g1544 > 0.0 )
				ifLocalVar17_g1544 = clampResult18_g1544;
				else if( ifLocalVar13_g1544 == 0.0 )
				ifLocalVar17_g1544 = temp_output_8_0_g1544;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1544 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1544 = max( temp_cast_49 , ifLocalVar17_g1544 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1544;
				float4 lerpResult1088 = lerp( ( ( ILMColorSetting993 == 2.0 ? lerpResult1004 : temp_output_1048_0 ) * GlobalLightColor944 ) , ( _EmissionIntensity * float4( ColorOut997 , 0.0 ) * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1545 = _DebugGroup;
				float temp_output_47_0_g1545 = _VertexChannel;
				float4 temp_output_59_0_g1545 = _DebugColor;
				float temp_output_50_0_g1545 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult984 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1545 = appendResult984;
				float4 break7_g1545 = temp_output_54_0_g1545;
				float temp_output_57_0_g1545 = 0.0;
				float4 Debug987 = ( temp_output_48_0_g1545 == 0.0 ? ( temp_output_47_0_g1545 == 0.0 ? i.ase_color : ( temp_output_47_0_g1545 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1545 == 1.0 ? ( temp_output_50_0_g1545 == 0.0 ? temp_output_54_0_g1545 : ( temp_output_50_0_g1545 == 1.0 ? ( break7_g1545.r * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 2.0 ? ( break7_g1545.g * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 3.0 ? ( break7_g1545.b * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 4.0 ? ( break7_g1545.a * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1545 == 2.0 ? ( temp_output_57_0_g1545 == 0.0 ? ( BaseA580 * temp_output_59_0_g1545 ) : ( temp_output_57_0_g1545 == 1.0 ? ( 0.0 * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1088 : Debug987 ).rgb;
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
			
			uniform float _ReadMask;
			uniform float _ZFailFront;
			uniform float _ZTestMode;
			uniform float _EditorVersion;
			uniform float _WriteMask;
			uniform float _Reference;
			uniform float _Comparison;
			uniform float _Opacity;
			uniform float _ZWriteMode;
			uniform float _FailFront;
			uniform float _PassFront;
			uniform float _Factor;
			uniform float _Units;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _EnableColorReplacer;
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
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableRimlight;
			uniform float _RimlightSize;
			uniform float _Shadow1VertexRThreshold;
			uniform float _LightDirectionSetting;
			uniform float _FallbackLightDirection;
			uniform float _ViewDirOffsetYaw;
			uniform float _ViewDirOffsetPitch;
			uniform float _FakeLightDirX;
			uniform float _FakeLightDirY;
			uniform float _GlobalLightPush;
			uniform float _Shadow1Smoothness;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _Shadow2Smoothness;
			uniform float _PermanentShadowThreshold;
			uniform float4 _LightColor;
			uniform float _HighlightRimlightIntensity;
			uniform float4 _HighlightRimlightTint;
			uniform float _HighlightRimlightSaturation;
			uniform float _SpecularSize;
			uniform float _SpecularIntensity;
			uniform float4 _SpecularTint;
			uniform float _SpecularSaturation;
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
			uniform float4 _ShadowRimlightBaseColor;
			uniform float _ShadowRimlightIntensity;
			uniform float4 _ShadowRimlightTint;
			uniform float _ShadowRimlightSaturation;
			uniform float _LightColorSetting;
			uniform float _MinimumGlobalLightIntensity;
			uniform float4 _FakeGlobalLightColor;
			uniform float _FakeGlobalLightIntensity;
			uniform float _EmissionIntensity;
			uniform float _HighlightRimlightEmissiveToggle;
			uniform float _HighlightRimlightEmissionIntensity;
			uniform float _SpecularEmissiveToggle;
			uniform float _SpecularEmissionIntensity;
			uniform float _BaseEmissiveToggle;
			uniform float _BaseEmissionIntensity;
			uniform float _Shadow1EmissiveToggle;
			uniform float _Shadow1EmissionIntensity;
			uniform float _Shadow2EmissiveToggle;
			uniform float _Shadow2EmissionIntensity;
			uniform float _ShadowRimlightEmissiveToggle;
			uniform float _ShadowRimlightEmissionIntensity;
			uniform float _ILMAlphaEmissionIntensity;
			uniform float _ILMAlphaLinesEmissionToggle;
			uniform float _BodyLinesEmissionToggle;
			uniform float _BodyLinesEmissionIntensity;
			uniform float _EmissionMaskIntensity;
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
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
			float3 StereoCameraViewDirection32_g1529( float3 worldPos )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				float3 worldViewDir = normalize((cameraPos - worldPos));
				return worldViewDir;
			}
			
			float3 ViewMatrix1418_g1531(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 ViewMatrix0417_g1531(  )
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
			
			float3 StereoCameraViewPosition30_g1529(  )
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
				float4 ase_texcoord4 : TEXCOORD4;
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
				o.ase_color = v.ase_color;
				o.ase_texcoord4 = v.vertex;
				
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

				float ILMColorSetting993 = _ILMColorSetting;
				float4 ILMAColor992 = _ILMAlphaColor;
				float DetailColorSetting1027 = _DetailColorSetting;
				float4 DetailColor1029 = _BodyLinesColor;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float BaseA580 = tex2DNode296.a;
				float BaseA13_g1537 = BaseA580;
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g818 = _TotalReplacements;
				float4 break8_g823 = _Target5Color;
				float4 break8_g819 = _Target4Color;
				float4 break8_g821 = _Target3Color;
				float4 break8_g820 = _Target2Color;
				float4 break8_g822 = _Target1Color;
				float3x3 temp_output_67_0_g818 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g822 = float4( temp_output_67_0_g818[0] , 0.0 );
				float4 break6_g822 = temp_output_13_0_g822;
				float4 appendResult3_g822 = (float4(break8_g822.r , break8_g822.g , break8_g822.b , break6_g822.a));
				float4 appendResult7_g822 = (float4(break6_g822.r , break6_g822.g , break6_g822.b , 1.0));
				float smoothstepResult5_g822 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g822 , _Source1Color ));
				float4 lerpResult4_g822 = lerp( appendResult3_g822 , temp_output_13_0_g822 , smoothstepResult5_g822);
				float4 temp_output_106_0_g818 = lerpResult4_g822;
				float4 temp_output_13_0_g820 = temp_output_106_0_g818;
				float4 break6_g820 = temp_output_13_0_g820;
				float4 appendResult3_g820 = (float4(break8_g820.r , break8_g820.g , break8_g820.b , break6_g820.a));
				float4 appendResult7_g820 = (float4(break6_g820.r , break6_g820.g , break6_g820.b , 1.0));
				float smoothstepResult5_g820 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g820 , _Source2Color ));
				float4 lerpResult4_g820 = lerp( appendResult3_g820 , temp_output_13_0_g820 , smoothstepResult5_g820);
				float4 temp_output_102_0_g818 = lerpResult4_g820;
				float4 temp_output_13_0_g821 = temp_output_102_0_g818;
				float4 break6_g821 = temp_output_13_0_g821;
				float4 appendResult3_g821 = (float4(break8_g821.r , break8_g821.g , break8_g821.b , break6_g821.a));
				float4 appendResult7_g821 = (float4(break6_g821.r , break6_g821.g , break6_g821.b , 1.0));
				float smoothstepResult5_g821 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g821 , _Source3Color ));
				float4 lerpResult4_g821 = lerp( appendResult3_g821 , temp_output_13_0_g821 , smoothstepResult5_g821);
				float4 temp_output_104_0_g818 = lerpResult4_g821;
				float4 temp_output_13_0_g819 = temp_output_104_0_g818;
				float4 break6_g819 = temp_output_13_0_g819;
				float4 appendResult3_g819 = (float4(break8_g819.r , break8_g819.g , break8_g819.b , break6_g819.a));
				float4 appendResult7_g819 = (float4(break6_g819.r , break6_g819.g , break6_g819.b , 1.0));
				float smoothstepResult5_g819 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g819 , _Source4Color ));
				float4 lerpResult4_g819 = lerp( appendResult3_g819 , temp_output_13_0_g819 , smoothstepResult5_g819);
				float4 temp_output_105_0_g818 = lerpResult4_g819;
				float4 temp_output_13_0_g823 = temp_output_105_0_g818;
				float4 break6_g823 = temp_output_13_0_g823;
				float4 appendResult3_g823 = (float4(break8_g823.r , break8_g823.g , break8_g823.b , break6_g823.a));
				float4 appendResult7_g823 = (float4(break6_g823.r , break6_g823.g , break6_g823.b , 1.0));
				float smoothstepResult5_g823 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g823 , _Source5Color ));
				float4 lerpResult4_g823 = lerp( appendResult3_g823 , temp_output_13_0_g823 , smoothstepResult5_g823);
				float4 temp_output_15_0_g822 = float4( temp_output_67_0_g818[1] , 0.0 );
				float3 hsvTorgb25_g822 = RGBToHSV( temp_output_15_0_g822.rgb );
				float3 hsvTorgb26_g822 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g822.x ),hsvTorgb25_g822.y,hsvTorgb25_g822.z) );
				float4 appendResult18_g822 = (float4(hsvTorgb26_g822 , temp_output_15_0_g822.a));
				float4 lerpResult19_g822 = lerp( appendResult18_g822 , temp_output_15_0_g822 , smoothstepResult5_g822);
				float4 temp_output_15_0_g820 = lerpResult19_g822;
				float3 hsvTorgb25_g820 = RGBToHSV( temp_output_15_0_g820.rgb );
				float3 hsvTorgb26_g820 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g820.x ),hsvTorgb25_g820.y,hsvTorgb25_g820.z) );
				float4 appendResult18_g820 = (float4(hsvTorgb26_g820 , temp_output_15_0_g820.a));
				float4 lerpResult19_g820 = lerp( appendResult18_g820 , temp_output_15_0_g820 , smoothstepResult5_g820);
				float4 temp_output_15_0_g821 = lerpResult19_g820;
				float3 hsvTorgb25_g821 = RGBToHSV( temp_output_15_0_g821.rgb );
				float3 hsvTorgb26_g821 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g821.x ),hsvTorgb25_g821.y,hsvTorgb25_g821.z) );
				float4 appendResult18_g821 = (float4(hsvTorgb26_g821 , temp_output_15_0_g821.a));
				float4 lerpResult19_g821 = lerp( appendResult18_g821 , temp_output_15_0_g821 , smoothstepResult5_g821);
				float4 temp_output_15_0_g819 = lerpResult19_g821;
				float3 hsvTorgb25_g819 = RGBToHSV( temp_output_15_0_g819.rgb );
				float3 hsvTorgb26_g819 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g819.x ),hsvTorgb25_g819.y,hsvTorgb25_g819.z) );
				float4 appendResult18_g819 = (float4(hsvTorgb26_g819 , temp_output_15_0_g819.a));
				float4 lerpResult19_g819 = lerp( appendResult18_g819 , temp_output_15_0_g819 , smoothstepResult5_g819);
				float4 temp_output_15_0_g823 = lerpResult19_g819;
				float3 hsvTorgb25_g823 = RGBToHSV( temp_output_15_0_g823.rgb );
				float3 hsvTorgb26_g823 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g823.x ),hsvTorgb25_g823.y,hsvTorgb25_g823.z) );
				float4 appendResult18_g823 = (float4(hsvTorgb26_g823 , temp_output_15_0_g823.a));
				float4 lerpResult19_g823 = lerp( appendResult18_g823 , temp_output_15_0_g823 , smoothstepResult5_g823);
				float3x3 temp_output_995_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g818 == 5.0 ? lerpResult4_g823 : ( temp_output_52_0_g818 == 4.0 ? temp_output_105_0_g818 : ( temp_output_52_0_g818 == 3.0 ? temp_output_104_0_g818 : ( temp_output_52_0_g818 == 2.0 ? temp_output_102_0_g818 : ( temp_output_52_0_g818 == 1.0 ? temp_output_106_0_g818 : float4( temp_output_67_0_g818[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g823.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail807 = tex2D( _Detail, uv2_Detail );
				float4 lerpResult1030 = lerp( DetailColor1029 , float4( temp_output_995_0[0] , 0.0 ) , Detail807);
				float4 temp_output_1031_0 = ( _DetailColorSetting == 1.0 ? lerpResult1030 : ( Detail807 * float4( temp_output_995_0[0] , 0.0 ) ) );
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1020 = lerp( ILMAColor992 , temp_output_1031_0 , ILMA357);
				float4 Base339 = ( _ILMColorSetting == 1.0 ? lerpResult1020 : ( ILMA357 * temp_output_1031_0 ) );
				float4 Base12_g1537 = Base339;
				float EnableRimlight82_g1533 = _EnableRimlight;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 worldPos32_g1529 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1529 = StereoCameraViewDirection32_g1529( worldPos32_g1529 );
				float dotResult31_g1529 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1529 );
				float SSSA581 = tex2DNode297.a;
				float blendOpSrc15_g1532 = SSSA581;
				float blendOpDest15_g1532 = BaseA580;
				float NdV48_g1533 = ( ( 1.0 - ( dotResult31_g1529 + ( 1.0 - _RimlightSize ) ) ) * ( 1.0 - ( saturate( abs( blendOpSrc15_g1532 - blendOpDest15_g1532 ) )) ) );
				float VertexR33_g1533 = i.ase_color.r;
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix1418_g1531 = ViewMatrix1418_g1531();
				float3 normalizeResult422_g1531 = normalize( localViewMatrix1418_g1531 );
				int localIsInMirror411_g1531 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_297_0_g1531 = _ViewDirOffsetYaw;
				float temp_output_424_0_g1531 = radians( ( (float)localIsInMirror411_g1531 == 0.0 ? -temp_output_297_0_g1531 : temp_output_297_0_g1531 ) );
				float3 localViewMatrix0417_g1531 = ViewMatrix0417_g1531();
				float3 normalizeResult425_g1531 = normalize( localViewMatrix0417_g1531 );
				float3 rotatedValue428_g1531 = RotateAroundAxis( float3( 0,0,0 ), normalizeResult425_g1531, normalizeResult422_g1531, temp_output_424_0_g1531 );
				float3 normalizeResult429_g1531 = normalize( rotatedValue428_g1531 );
				int localIsInMirror423_g1531 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_296_0_g1531 = _ViewDirOffsetPitch;
				float3 localStereoCameraViewPosition30_g1529 = StereoCameraViewPosition30_g1529();
				float3 rotatedValue431_g1531 = RotateAroundAxis( float3( 0,0,0 ), ( localStereoCameraViewPosition30_g1529 - ( ase_worldPos - i.ase_texcoord4.xyz ) ), normalizeResult422_g1531, temp_output_424_0_g1531 );
				float3 rotatedValue432_g1531 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue431_g1531, normalizeResult429_g1531, radians( ( (float)localIsInMirror423_g1531 == 0.0 ? temp_output_296_0_g1531 : -temp_output_296_0_g1531 ) ) );
				float3 normalizeResult433_g1531 = ASESafeNormalize( rotatedValue432_g1531 );
				float3 normalizeResult38_g1529 = normalize( normalizeResult433_g1531 );
				float3 appendResult15_g1530 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1530 = normalize( appendResult15_g1530 );
				float3 normalizeResult26_g1529 = normalize( normalizeResult2_g1530 );
				float3 ifLocalVar3_g1529 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1529 = normalizeResult38_g1529;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1529 = normalizeResult26_g1529;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1507 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1507 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1507 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1507 = color8_g1507;
				#else
				float4 staticSwitch9_g1507 = ( clampResult7_g1507 * color14_g1507 );
				#endif
				float4 break10_g1507 = staticSwitch9_g1507;
				float IsThereWorldLight450 = break10_g1507.r;
				float3 ifLocalVar8_g1529 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1529 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1529 = ifLocalVar3_g1529;
				float3 ifLocalVar9_g1529 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1529 = ifLocalVar3_g1529;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1529 = ifLocalVar8_g1529;
				float dotResult46_g1529 = dot( ifLocalVar9_g1529 , normalizedWorldNormal );
				float temp_output_36_0_g1532 = ( ( dotResult46_g1529 + _GlobalLightPush ) * i.ase_color.r );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMG574 = break292.y;
				float temp_output_1_0_g1532 = ILMG574;
				float temp_output_1077_0 = ( ( temp_output_36_0_g1532 * 0.5 ) + ( ( temp_output_1_0_g1532 * 2.0 ) - 1.0 ) );
				float NdL20_g1533 = temp_output_1077_0;
				float temp_output_2_0_g1534 = NdL20_g1533;
				float temp_output_3_0_g1534 = -_Shadow1Smoothness;
				float temp_output_9_0_g1533 = _Shadow1Push;
				float temp_output_11_0_g1533 = _Shadow2Push;
				float clampResult15_g1533 = clamp( temp_output_9_0_g1533 , temp_output_11_0_g1533 , temp_output_9_0_g1533 );
				float RealShadow1Push16_g1533 = clampResult15_g1533;
				float temp_output_1_0_g1534 = RealShadow1Push16_g1533;
				float smoothstepResult6_g1534 = smoothstep( ( ( temp_output_2_0_g1534 / 1.0 ) + temp_output_3_0_g1534 ) , temp_output_2_0_g1534 , temp_output_1_0_g1534);
				float lerpResult7_g1534 = lerp( smoothstepResult6_g1534 , ( temp_output_1_0_g1534 >= temp_output_2_0_g1534 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1534 ? 1.0 : 0.0 ));
				float clampResult17_g1533 = clamp( temp_output_11_0_g1533 , temp_output_11_0_g1533 , temp_output_9_0_g1533 );
				float RealShadow2Push18_g1533 = clampResult17_g1533;
				float temp_output_2_0_g1535 = NdL20_g1533;
				float temp_output_3_0_g1535 = -_Shadow2Smoothness;
				float temp_output_1_0_g1535 = RealShadow2Push18_g1533;
				float smoothstepResult6_g1535 = smoothstep( ( ( temp_output_2_0_g1535 / 1.0 ) + temp_output_3_0_g1535 ) , temp_output_2_0_g1535 , temp_output_1_0_g1535);
				float lerpResult7_g1535 = lerp( smoothstepResult6_g1535 , ( temp_output_1_0_g1535 >= temp_output_2_0_g1535 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1535 ? 1.0 : 0.0 ));
				float temp_output_42_0_g1533 = max( max( ( 1.0 - ( VertexR33_g1533 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , lerpResult7_g1535 ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1533 = ( max( ( 1.0 - ( VertexR33_g1533 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( lerpResult7_g1534 , ( RealShadow1Push16_g1533 >= RealShadow2Push18_g1533 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1533 );
				float temp_output_61_0_g1533 = ( 1.0 - ( temp_output_43_0_g1533 + temp_output_42_0_g1533 ) );
				float temp_output_75_0_g1533 = ceil( ( ( ( NdV48_g1533 * BaseA580 ) > 0.0 ? 1.0 : 0.0 ) * temp_output_61_0_g1533 ) );
				float clampResult88_g1533 = clamp( temp_output_75_0_g1533 , 0.0 , 1.0 );
				float temp_output_94_0_g1533 = ( EnableRimlight82_g1533 == 1.0 ? clampResult88_g1533 : 0.0 );
				float temp_output_6_0_g1537 = temp_output_94_0_g1533;
				float4 temp_cast_31 = (temp_output_6_0_g1537).xxxx;
				float4 blendOpSrc19_g1537 = Base12_g1537;
				float4 blendOpDest19_g1537 = temp_cast_31;
				float4 lerpBlendMode19_g1537 = lerp(blendOpDest19_g1537,min( blendOpSrc19_g1537 , blendOpDest19_g1537 ),0.9);
				float4 LightColor779 = _LightColor;
				float4 LightColor16_g1537 = LightColor779;
				float3 desaturateInitialColor9_g1538 = ( ( ( BaseA13_g1537 * ( saturate( lerpBlendMode19_g1537 )) ) + ( Base12_g1537 * temp_output_6_0_g1537 ) ) * LightColor16_g1537 * _HighlightRimlightIntensity * _HighlightRimlightTint ).rgb;
				float desaturateDot9_g1538 = dot( desaturateInitialColor9_g1538, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1538 = lerp( desaturateInitialColor9_g1538, desaturateDot9_g1538.xxx, ( 1.0 - _HighlightRimlightSaturation ) );
				float ILMB576 = break292.z;
				float3 normalizeResult48_g1529 = normalize( ifLocalVar9_g1529 );
				float3 normalizeResult51_g1529 = normalize( ( normalizeResult48_g1529 + localStereoCameraViewDirection32_g1529 ) );
				float dotResult50_g1529 = dot( normalizedWorldNormal , normalizeResult51_g1529 );
				float blendOpSrc34_g1532 = ILMB576;
				float blendOpDest34_g1532 = dotResult50_g1529;
				float temp_output_68_0_g1533 = ( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1532) / max( blendOpSrc34_g1532, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) * temp_output_61_0_g1533 );
				float clampResult87_g1533 = clamp( temp_output_68_0_g1533 , 0.0 , 1.0 );
				float temp_output_29_0_g1537 = clampResult87_g1533;
				float4 temp_cast_33 = (temp_output_29_0_g1537).xxxx;
				float4 blendOpSrc30_g1537 = Base12_g1537;
				float4 blendOpDest30_g1537 = temp_cast_33;
				float4 lerpBlendMode30_g1537 = lerp(blendOpDest30_g1537,min( blendOpSrc30_g1537 , blendOpDest30_g1537 ),0.9);
				float3 desaturateInitialColor9_g1541 = ( ( ( BaseA13_g1537 * ( saturate( lerpBlendMode30_g1537 )) ) + ( Base12_g1537 * temp_output_29_0_g1537 ) ) * LightColor16_g1537 * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1541 = dot( desaturateInitialColor9_g1541, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1541 = lerp( desaturateInitialColor9_g1541, desaturateDot9_g1541.xxx, ( 1.0 - _SpecularSaturation ) );
				float temp_output_77_0_g1533 = ( temp_output_61_0_g1533 - temp_output_68_0_g1533 );
				float clampResult90_g1533 = clamp( ( EnableRimlight82_g1533 == 1.0 ? ( temp_output_77_0_g1533 - temp_output_75_0_g1533 ) : temp_output_77_0_g1533 ) , 0.0 , 1.0 );
				float3 desaturateInitialColor9_g1543 = ( ( Base12_g1537 * clampResult90_g1533 ) * LightColor16_g1537 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1543 = dot( desaturateInitialColor9_g1543, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1543 = lerp( desaturateInitialColor9_g1543, desaturateDot9_g1543.xxx, ( 1.0 - _BaseSaturation ) );
				float3 SSS578 = temp_output_995_0[1];
				float4 SSS14_g1537 = float4( SSS578 , 0.0 );
				float4 AmbientColor780 = _AmbientColor;
				float4 AmbientColor68_g1537 = AmbientColor780;
				float3 desaturateInitialColor9_g1542 = ( ( temp_output_43_0_g1533 * Base12_g1537 * SSS14_g1537 ) * AmbientColor68_g1537 * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1542 = dot( desaturateInitialColor9_g1542, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1542 = lerp( desaturateInitialColor9_g1542, desaturateDot9_g1542.xxx, ( 1.0 - _Shadow1Saturation ) );
				float ILMR573 = break292.x;
				float temp_output_53_0_g1533 = ceil( ( ( ( temp_output_42_0_g1533 * NdV48_g1533 ) > 0.1 ? 1.0 : 0.0 ) * ILMR573 ) );
				float clampResult91_g1533 = clamp( ( EnableRimlight82_g1533 == 1.0 ? ( temp_output_42_0_g1533 - temp_output_53_0_g1533 ) : temp_output_42_0_g1533 ) , 0.0 , 1.0 );
				float4 blendOpSrc51_g1537 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1537 = ( Base12_g1537 * SSS14_g1537 );
				float4 lerpBlendMode51_g1537 = lerp(blendOpDest51_g1537,2.0f*blendOpDest51_g1537*blendOpSrc51_g1537 + blendOpDest51_g1537*blendOpDest51_g1537*(1.0f - 2.0f*blendOpSrc51_g1537),0.5);
				float3 desaturateInitialColor9_g1540 = ( ( clampResult91_g1533 * ( saturate( lerpBlendMode51_g1537 )) ) * AmbientColor68_g1537 * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1540 = dot( desaturateInitialColor9_g1540, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1540 = lerp( desaturateInitialColor9_g1540, desaturateDot9_g1540.xxx, ( 1.0 - _Shadow2Saturation ) );
				float clampResult92_g1533 = clamp( temp_output_53_0_g1533 , 0.0 , 1.0 );
				float temp_output_96_0_g1533 = ( EnableRimlight82_g1533 == 1.0 ? clampResult92_g1533 : 0.0 );
				float temp_output_60_0_g1537 = temp_output_96_0_g1533;
				float4 blendOpSrc56_g1537 = float4( 0,0,0,0 );
				float4 blendOpDest56_g1537 = ( Base12_g1537 * SSS14_g1537 );
				float4 lerpBlendMode56_g1537 = lerp(blendOpDest56_g1537,2.0f*blendOpDest56_g1537*blendOpSrc56_g1537 + blendOpDest56_g1537*blendOpDest56_g1537*(1.0f - 2.0f*blendOpSrc56_g1537),0.5);
				float4 temp_output_56_0_g1537 = ( saturate( lerpBlendMode56_g1537 ));
				float3 desaturateInitialColor9_g1539 = ( ( ( ( temp_output_60_0_g1537 * ( temp_output_56_0_g1537 + _ShadowRimlightBaseColor ) ) + ( temp_output_60_0_g1537 * temp_output_56_0_g1537 ) ) * ILMR573 ) * AmbientColor68_g1537 * _ShadowRimlightIntensity * _ShadowRimlightTint ).rgb;
				float desaturateDot9_g1539 = dot( desaturateInitialColor9_g1539, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1539 = lerp( desaturateInitialColor9_g1539, desaturateDot9_g1539.xxx, ( 1.0 - _ShadowRimlightSaturation ) );
				float3 temp_output_787_0 = ( desaturateVar9_g1538 + desaturateVar9_g1541 + desaturateVar9_g1543 + desaturateVar9_g1542 + desaturateVar9_g1540 + desaturateVar9_g1539 );
				float4 lerpResult1049 = lerp( DetailColor1029 , float4( temp_output_787_0 , 0.0 ) , Detail807);
				float4 temp_output_1048_0 = ( DetailColorSetting1027 == 2.0 ? lerpResult1049 : float4( temp_output_787_0 , 0.0 ) );
				float4 lerpResult1004 = lerp( ILMAColor992 , temp_output_1048_0 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1544 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1544 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1544 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_43 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_44 = (5.0).xxxx;
				float4 clampResult18_g1544 = clamp( ase_lightColor , temp_cast_43 , temp_cast_44 );
				float4 temp_output_11_0_g1544 = ( ase_atten * clampResult18_g1544 );
				float4 temp_output_8_0_g1544 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1544 = 0;
				if( ifLocalVar13_g1544 > 0.0 )
				ifLocalVar3_g1544 = temp_output_11_0_g1544;
				else if( ifLocalVar13_g1544 == 0.0 )
				ifLocalVar3_g1544 = temp_output_8_0_g1544;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1544 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1544 );
				#else
				float4 staticSwitch9_g1544 = ifLocalVar3_g1544;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1544;
				float3 ColorOut997 = temp_output_787_0;
				float2 uv_EmissionMask = i.ase_texcoord1.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float4 temp_cast_47 = (( _EmissionMaskIntensity * tex2D( _EmissionMask, uv_EmissionMask ).r )).xxxx;
				float4 EmissionRampMask920 = max( ( ( ( temp_output_94_0_g1533 * _HighlightRimlightEmissiveToggle ) * _HighlightRimlightEmissionIntensity ) + ( ( clampResult87_g1533 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1533 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1533 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1533 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( temp_output_96_0_g1533 * _ShadowRimlightEmissiveToggle ) * _ShadowRimlightEmissionIntensity ) + ( ( 1.0 - ILMA357 ) * _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) + ( ( 1.0 - Detail807 ) * _BodyLinesEmissionToggle * _BodyLinesEmissionIntensity ) ) , temp_cast_47 );
				float4 temp_cast_49 = (EmissionRampMask920.r).xxxx;
				float4 ifLocalVar17_g1544 = 0;
				if( ifLocalVar13_g1544 > 0.0 )
				ifLocalVar17_g1544 = clampResult18_g1544;
				else if( ifLocalVar13_g1544 == 0.0 )
				ifLocalVar17_g1544 = temp_output_8_0_g1544;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1544 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1544 = max( temp_cast_49 , ifLocalVar17_g1544 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1544;
				float4 lerpResult1088 = lerp( ( ( ILMColorSetting993 == 2.0 ? lerpResult1004 : temp_output_1048_0 ) * GlobalLightColor944 ) , ( _EmissionIntensity * float4( ColorOut997 , 0.0 ) * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1545 = _DebugGroup;
				float temp_output_47_0_g1545 = _VertexChannel;
				float4 temp_output_59_0_g1545 = _DebugColor;
				float temp_output_50_0_g1545 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult984 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1545 = appendResult984;
				float4 break7_g1545 = temp_output_54_0_g1545;
				float temp_output_57_0_g1545 = 0.0;
				float4 Debug987 = ( temp_output_48_0_g1545 == 0.0 ? ( temp_output_47_0_g1545 == 0.0 ? i.ase_color : ( temp_output_47_0_g1545 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1545 == 1.0 ? ( temp_output_50_0_g1545 == 0.0 ? temp_output_54_0_g1545 : ( temp_output_50_0_g1545 == 1.0 ? ( break7_g1545.r * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 2.0 ? ( break7_g1545.g * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 3.0 ? ( break7_g1545.b * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 4.0 ? ( break7_g1545.a * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1545 == 2.0 ? ( temp_output_57_0_g1545 == 0.0 ? ( BaseA580 * temp_output_59_0_g1545 ) : ( temp_output_57_0_g1545 == 1.0 ? ( 0.0 * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1088 : Debug987 ).rgb;
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
				float4 ase_texcoord1 : TEXCOORD1;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
			};

			uniform float _ReadMask;
			uniform float _ZFailFront;
			uniform float _ZTestMode;
			uniform float _EditorVersion;
			uniform float _WriteMask;
			uniform float _Reference;
			uniform float _Comparison;
			uniform float _Opacity;
			uniform float _ZWriteMode;
			uniform float _FailFront;
			uniform float _PassFront;
			uniform float _Factor;
			uniform float _Units;
			uniform float _EnableCameraDistanceMult;
			uniform float _OutlineThickness;
			uniform float _DepthOffset;
			uniform float _OutlineEnableBaseColorMult;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
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
				float temp_output_33_0_g1546 = _OutlineThickness;
				float3 temp_output_135_0_g1546 = ( ( v.ase_normal * 2E-05 ) * ( ( ( _EnableCameraDistanceMult * eyeDepth * v.ase_color.g * temp_output_33_0_g1546 ) + temp_output_33_0_g1546 ) * v.ase_color.a ) );
				float3 objectSpaceViewDir136_g1546 = ObjSpaceViewDir( float4( temp_output_135_0_g1546 , 0.0 ) );
				float4 normalizeResult142_g1546 = ASESafeNormalize( ( float4( objectSpaceViewDir136_g1546 , 0.0 ) - v.vertex ) );
				float clampResult141_g1546 = clamp( ( v.ase_color.b + _DepthOffset ) , 0.0 , 1.0 );
				float4 lerpResult145_g1546 = lerp( float4( temp_output_135_0_g1546 , 0.0 ) , -normalizeResult142_g1546 , ( 1.0 - clampResult141_g1546 ));
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord.zw = v.ase_texcoord1.xy;

				v.vertex.xyz += lerpResult145_g1546.xyz;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float4 frag (v2f i ) : SV_Target
			{
				float3 outOutlineColor;
				float outOutlineAlpha;

				float4 ILMAColor992 = _ILMAlphaColor;
				float4 DetailColor1029 = _BodyLinesColor;
				float2 uv_MainTex = i.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g818 = _TotalReplacements;
				float4 break8_g823 = _Target5Color;
				float4 break8_g819 = _Target4Color;
				float4 break8_g821 = _Target3Color;
				float4 break8_g820 = _Target2Color;
				float4 break8_g822 = _Target1Color;
				float3x3 temp_output_67_0_g818 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g822 = float4( temp_output_67_0_g818[0] , 0.0 );
				float4 break6_g822 = temp_output_13_0_g822;
				float4 appendResult3_g822 = (float4(break8_g822.r , break8_g822.g , break8_g822.b , break6_g822.a));
				float4 appendResult7_g822 = (float4(break6_g822.r , break6_g822.g , break6_g822.b , 1.0));
				float smoothstepResult5_g822 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g822 , _Source1Color ));
				float4 lerpResult4_g822 = lerp( appendResult3_g822 , temp_output_13_0_g822 , smoothstepResult5_g822);
				float4 temp_output_106_0_g818 = lerpResult4_g822;
				float4 temp_output_13_0_g820 = temp_output_106_0_g818;
				float4 break6_g820 = temp_output_13_0_g820;
				float4 appendResult3_g820 = (float4(break8_g820.r , break8_g820.g , break8_g820.b , break6_g820.a));
				float4 appendResult7_g820 = (float4(break6_g820.r , break6_g820.g , break6_g820.b , 1.0));
				float smoothstepResult5_g820 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g820 , _Source2Color ));
				float4 lerpResult4_g820 = lerp( appendResult3_g820 , temp_output_13_0_g820 , smoothstepResult5_g820);
				float4 temp_output_102_0_g818 = lerpResult4_g820;
				float4 temp_output_13_0_g821 = temp_output_102_0_g818;
				float4 break6_g821 = temp_output_13_0_g821;
				float4 appendResult3_g821 = (float4(break8_g821.r , break8_g821.g , break8_g821.b , break6_g821.a));
				float4 appendResult7_g821 = (float4(break6_g821.r , break6_g821.g , break6_g821.b , 1.0));
				float smoothstepResult5_g821 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g821 , _Source3Color ));
				float4 lerpResult4_g821 = lerp( appendResult3_g821 , temp_output_13_0_g821 , smoothstepResult5_g821);
				float4 temp_output_104_0_g818 = lerpResult4_g821;
				float4 temp_output_13_0_g819 = temp_output_104_0_g818;
				float4 break6_g819 = temp_output_13_0_g819;
				float4 appendResult3_g819 = (float4(break8_g819.r , break8_g819.g , break8_g819.b , break6_g819.a));
				float4 appendResult7_g819 = (float4(break6_g819.r , break6_g819.g , break6_g819.b , 1.0));
				float smoothstepResult5_g819 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g819 , _Source4Color ));
				float4 lerpResult4_g819 = lerp( appendResult3_g819 , temp_output_13_0_g819 , smoothstepResult5_g819);
				float4 temp_output_105_0_g818 = lerpResult4_g819;
				float4 temp_output_13_0_g823 = temp_output_105_0_g818;
				float4 break6_g823 = temp_output_13_0_g823;
				float4 appendResult3_g823 = (float4(break8_g823.r , break8_g823.g , break8_g823.b , break6_g823.a));
				float4 appendResult7_g823 = (float4(break6_g823.r , break6_g823.g , break6_g823.b , 1.0));
				float smoothstepResult5_g823 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g823 , _Source5Color ));
				float4 lerpResult4_g823 = lerp( appendResult3_g823 , temp_output_13_0_g823 , smoothstepResult5_g823);
				float4 temp_output_15_0_g822 = float4( temp_output_67_0_g818[1] , 0.0 );
				float3 hsvTorgb25_g822 = RGBToHSV( temp_output_15_0_g822.rgb );
				float3 hsvTorgb26_g822 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g822.x ),hsvTorgb25_g822.y,hsvTorgb25_g822.z) );
				float4 appendResult18_g822 = (float4(hsvTorgb26_g822 , temp_output_15_0_g822.a));
				float4 lerpResult19_g822 = lerp( appendResult18_g822 , temp_output_15_0_g822 , smoothstepResult5_g822);
				float4 temp_output_15_0_g820 = lerpResult19_g822;
				float3 hsvTorgb25_g820 = RGBToHSV( temp_output_15_0_g820.rgb );
				float3 hsvTorgb26_g820 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g820.x ),hsvTorgb25_g820.y,hsvTorgb25_g820.z) );
				float4 appendResult18_g820 = (float4(hsvTorgb26_g820 , temp_output_15_0_g820.a));
				float4 lerpResult19_g820 = lerp( appendResult18_g820 , temp_output_15_0_g820 , smoothstepResult5_g820);
				float4 temp_output_15_0_g821 = lerpResult19_g820;
				float3 hsvTorgb25_g821 = RGBToHSV( temp_output_15_0_g821.rgb );
				float3 hsvTorgb26_g821 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g821.x ),hsvTorgb25_g821.y,hsvTorgb25_g821.z) );
				float4 appendResult18_g821 = (float4(hsvTorgb26_g821 , temp_output_15_0_g821.a));
				float4 lerpResult19_g821 = lerp( appendResult18_g821 , temp_output_15_0_g821 , smoothstepResult5_g821);
				float4 temp_output_15_0_g819 = lerpResult19_g821;
				float3 hsvTorgb25_g819 = RGBToHSV( temp_output_15_0_g819.rgb );
				float3 hsvTorgb26_g819 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g819.x ),hsvTorgb25_g819.y,hsvTorgb25_g819.z) );
				float4 appendResult18_g819 = (float4(hsvTorgb26_g819 , temp_output_15_0_g819.a));
				float4 lerpResult19_g819 = lerp( appendResult18_g819 , temp_output_15_0_g819 , smoothstepResult5_g819);
				float4 temp_output_15_0_g823 = lerpResult19_g819;
				float3 hsvTorgb25_g823 = RGBToHSV( temp_output_15_0_g823.rgb );
				float3 hsvTorgb26_g823 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g823.x ),hsvTorgb25_g823.y,hsvTorgb25_g823.z) );
				float4 appendResult18_g823 = (float4(hsvTorgb26_g823 , temp_output_15_0_g823.a));
				float4 lerpResult19_g823 = lerp( appendResult18_g823 , temp_output_15_0_g823 , smoothstepResult5_g823);
				float3x3 temp_output_995_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g818 == 5.0 ? lerpResult4_g823 : ( temp_output_52_0_g818 == 4.0 ? temp_output_105_0_g818 : ( temp_output_52_0_g818 == 3.0 ? temp_output_104_0_g818 : ( temp_output_52_0_g818 == 2.0 ? temp_output_102_0_g818 : ( temp_output_52_0_g818 == 1.0 ? temp_output_106_0_g818 : float4( temp_output_67_0_g818[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g823.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail807 = tex2D( _Detail, uv2_Detail );
				float4 lerpResult1030 = lerp( DetailColor1029 , float4( temp_output_995_0[0] , 0.0 ) , Detail807);
				float4 temp_output_1031_0 = ( _DetailColorSetting == 1.0 ? lerpResult1030 : ( Detail807 * float4( temp_output_995_0[0] , 0.0 ) ) );
				float2 uv_ILM = i.ase_texcoord.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1020 = lerp( ILMAColor992 , temp_output_1031_0 , ILMA357);
				float4 Base339 = ( _ILMColorSetting == 1.0 ? lerpResult1020 : ( ILMA357 * temp_output_1031_0 ) );
				float4 temp_output_13_0_g1546 = max( float4( 0,0,0,0 ) , ( 0.2 * Base339 ) );
				

				outOutlineColor = ( ( _OutlineEnableBaseColorMult > 0.0 ? ( temp_output_13_0_g1546 * temp_output_13_0_g1546 ) : _OutlineColor ) * _OutlineColorIntensity ).rgb;
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
			
			uniform float _ReadMask;
			uniform float _ZFailFront;
			uniform float _ZTestMode;
			uniform float _EditorVersion;
			uniform float _WriteMask;
			uniform float _Reference;
			uniform float _Comparison;
			uniform float _Opacity;
			uniform float _ZWriteMode;
			uniform float _FailFront;
			uniform float _PassFront;
			uniform float _Factor;
			uniform float _Units;
			uniform float _EnableDebug;
			uniform float _ILMColorSetting;
			uniform float4 _ILMAlphaColor;
			uniform float _DetailColorSetting;
			uniform float4 _BodyLinesColor;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _EnableColorReplacer;
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
			uniform sampler2D _ILM;
			uniform float4 _ILM_ST;
			uniform float _EnableRimlight;
			uniform float _RimlightSize;
			uniform float _Shadow1VertexRThreshold;
			uniform float _LightDirectionSetting;
			uniform float _FallbackLightDirection;
			uniform float _ViewDirOffsetYaw;
			uniform float _ViewDirOffsetPitch;
			uniform float _FakeLightDirX;
			uniform float _FakeLightDirY;
			uniform float _GlobalLightPush;
			uniform float _Shadow1Smoothness;
			uniform float _Shadow1Push;
			uniform float _Shadow2Push;
			uniform float _Shadow2VertexRThreshold;
			uniform float _Shadow2Smoothness;
			uniform float _PermanentShadowThreshold;
			uniform float4 _LightColor;
			uniform float _HighlightRimlightIntensity;
			uniform float4 _HighlightRimlightTint;
			uniform float _HighlightRimlightSaturation;
			uniform float _SpecularSize;
			uniform float _SpecularIntensity;
			uniform float4 _SpecularTint;
			uniform float _SpecularSaturation;
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
			uniform float4 _ShadowRimlightBaseColor;
			uniform float _ShadowRimlightIntensity;
			uniform float4 _ShadowRimlightTint;
			uniform float _ShadowRimlightSaturation;
			uniform float _LightColorSetting;
			uniform float _MinimumGlobalLightIntensity;
			uniform float4 _FakeGlobalLightColor;
			uniform float _FakeGlobalLightIntensity;
			uniform float _EmissionIntensity;
			uniform float _HighlightRimlightEmissiveToggle;
			uniform float _HighlightRimlightEmissionIntensity;
			uniform float _SpecularEmissiveToggle;
			uniform float _SpecularEmissionIntensity;
			uniform float _BaseEmissiveToggle;
			uniform float _BaseEmissionIntensity;
			uniform float _Shadow1EmissiveToggle;
			uniform float _Shadow1EmissionIntensity;
			uniform float _Shadow2EmissiveToggle;
			uniform float _Shadow2EmissionIntensity;
			uniform float _ShadowRimlightEmissiveToggle;
			uniform float _ShadowRimlightEmissionIntensity;
			uniform float _ILMAlphaEmissionIntensity;
			uniform float _ILMAlphaLinesEmissionToggle;
			uniform float _BodyLinesEmissionToggle;
			uniform float _BodyLinesEmissionIntensity;
			uniform float _EmissionMaskIntensity;
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
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
			float3 StereoCameraViewDirection32_g1529( float3 worldPos )
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 cameraPos = float3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5); 
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				float3 worldViewDir = normalize((cameraPos - worldPos));
				return worldViewDir;
			}
			
			float3 ViewMatrix1418_g1531(  )
			{
				return UNITY_MATRIX_V[1];
			}
			
			float3 ViewMatrix0417_g1531(  )
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
			
			float3 StereoCameraViewPosition30_g1529(  )
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
				float4 ase_texcoord4 : TEXCOORD4;
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
				o.ase_color = v.ase_color;
				o.ase_texcoord4 = v.vertex;
				
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

				float ILMColorSetting993 = _ILMColorSetting;
				float4 ILMAColor992 = _ILMAlphaColor;
				float DetailColorSetting1027 = _DetailColorSetting;
				float4 DetailColor1029 = _BodyLinesColor;
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode296 = tex2D( _MainTex, uv_MainTex );
				float BaseA580 = tex2DNode296.a;
				float BaseA13_g1537 = BaseA580;
				float3 appendResult762 = (float3(tex2DNode296.r , tex2DNode296.g , tex2DNode296.b));
				float2 uv_SSS = i.ase_texcoord1.xy * _SSS_ST.xy + _SSS_ST.zw;
				float4 tex2DNode297 = tex2D( _SSS, uv_SSS );
				float3 appendResult763 = (float3(tex2DNode297.r , tex2DNode297.g , tex2DNode297.b));
				float temp_output_52_0_g818 = _TotalReplacements;
				float4 break8_g823 = _Target5Color;
				float4 break8_g819 = _Target4Color;
				float4 break8_g821 = _Target3Color;
				float4 break8_g820 = _Target2Color;
				float4 break8_g822 = _Target1Color;
				float3x3 temp_output_67_0_g818 = float3x3(appendResult762, appendResult763, float3( 0,0,0 ));
				float4 temp_output_13_0_g822 = float4( temp_output_67_0_g818[0] , 0.0 );
				float4 break6_g822 = temp_output_13_0_g822;
				float4 appendResult3_g822 = (float4(break8_g822.r , break8_g822.g , break8_g822.b , break6_g822.a));
				float4 appendResult7_g822 = (float4(break6_g822.r , break6_g822.g , break6_g822.b , 1.0));
				float smoothstepResult5_g822 = smoothstep( 0.0 , _Source1Fuzziness , distance( appendResult7_g822 , _Source1Color ));
				float4 lerpResult4_g822 = lerp( appendResult3_g822 , temp_output_13_0_g822 , smoothstepResult5_g822);
				float4 temp_output_106_0_g818 = lerpResult4_g822;
				float4 temp_output_13_0_g820 = temp_output_106_0_g818;
				float4 break6_g820 = temp_output_13_0_g820;
				float4 appendResult3_g820 = (float4(break8_g820.r , break8_g820.g , break8_g820.b , break6_g820.a));
				float4 appendResult7_g820 = (float4(break6_g820.r , break6_g820.g , break6_g820.b , 1.0));
				float smoothstepResult5_g820 = smoothstep( 0.0 , _Source2Fuzziness , distance( appendResult7_g820 , _Source2Color ));
				float4 lerpResult4_g820 = lerp( appendResult3_g820 , temp_output_13_0_g820 , smoothstepResult5_g820);
				float4 temp_output_102_0_g818 = lerpResult4_g820;
				float4 temp_output_13_0_g821 = temp_output_102_0_g818;
				float4 break6_g821 = temp_output_13_0_g821;
				float4 appendResult3_g821 = (float4(break8_g821.r , break8_g821.g , break8_g821.b , break6_g821.a));
				float4 appendResult7_g821 = (float4(break6_g821.r , break6_g821.g , break6_g821.b , 1.0));
				float smoothstepResult5_g821 = smoothstep( 0.0 , _Source3Fuzziness , distance( appendResult7_g821 , _Source3Color ));
				float4 lerpResult4_g821 = lerp( appendResult3_g821 , temp_output_13_0_g821 , smoothstepResult5_g821);
				float4 temp_output_104_0_g818 = lerpResult4_g821;
				float4 temp_output_13_0_g819 = temp_output_104_0_g818;
				float4 break6_g819 = temp_output_13_0_g819;
				float4 appendResult3_g819 = (float4(break8_g819.r , break8_g819.g , break8_g819.b , break6_g819.a));
				float4 appendResult7_g819 = (float4(break6_g819.r , break6_g819.g , break6_g819.b , 1.0));
				float smoothstepResult5_g819 = smoothstep( 0.0 , _Source4Fuzziness , distance( appendResult7_g819 , _Source4Color ));
				float4 lerpResult4_g819 = lerp( appendResult3_g819 , temp_output_13_0_g819 , smoothstepResult5_g819);
				float4 temp_output_105_0_g818 = lerpResult4_g819;
				float4 temp_output_13_0_g823 = temp_output_105_0_g818;
				float4 break6_g823 = temp_output_13_0_g823;
				float4 appendResult3_g823 = (float4(break8_g823.r , break8_g823.g , break8_g823.b , break6_g823.a));
				float4 appendResult7_g823 = (float4(break6_g823.r , break6_g823.g , break6_g823.b , 1.0));
				float smoothstepResult5_g823 = smoothstep( 0.0 , _Source5Fuzziness , distance( appendResult7_g823 , _Source5Color ));
				float4 lerpResult4_g823 = lerp( appendResult3_g823 , temp_output_13_0_g823 , smoothstepResult5_g823);
				float4 temp_output_15_0_g822 = float4( temp_output_67_0_g818[1] , 0.0 );
				float3 hsvTorgb25_g822 = RGBToHSV( temp_output_15_0_g822.rgb );
				float3 hsvTorgb26_g822 = HSVToRGB( float3(( _SSSHueShift1 + hsvTorgb25_g822.x ),hsvTorgb25_g822.y,hsvTorgb25_g822.z) );
				float4 appendResult18_g822 = (float4(hsvTorgb26_g822 , temp_output_15_0_g822.a));
				float4 lerpResult19_g822 = lerp( appendResult18_g822 , temp_output_15_0_g822 , smoothstepResult5_g822);
				float4 temp_output_15_0_g820 = lerpResult19_g822;
				float3 hsvTorgb25_g820 = RGBToHSV( temp_output_15_0_g820.rgb );
				float3 hsvTorgb26_g820 = HSVToRGB( float3(( _SSSHueShift2 + hsvTorgb25_g820.x ),hsvTorgb25_g820.y,hsvTorgb25_g820.z) );
				float4 appendResult18_g820 = (float4(hsvTorgb26_g820 , temp_output_15_0_g820.a));
				float4 lerpResult19_g820 = lerp( appendResult18_g820 , temp_output_15_0_g820 , smoothstepResult5_g820);
				float4 temp_output_15_0_g821 = lerpResult19_g820;
				float3 hsvTorgb25_g821 = RGBToHSV( temp_output_15_0_g821.rgb );
				float3 hsvTorgb26_g821 = HSVToRGB( float3(( _SSSHueShift3 + hsvTorgb25_g821.x ),hsvTorgb25_g821.y,hsvTorgb25_g821.z) );
				float4 appendResult18_g821 = (float4(hsvTorgb26_g821 , temp_output_15_0_g821.a));
				float4 lerpResult19_g821 = lerp( appendResult18_g821 , temp_output_15_0_g821 , smoothstepResult5_g821);
				float4 temp_output_15_0_g819 = lerpResult19_g821;
				float3 hsvTorgb25_g819 = RGBToHSV( temp_output_15_0_g819.rgb );
				float3 hsvTorgb26_g819 = HSVToRGB( float3(( _SSSHueShift4 + hsvTorgb25_g819.x ),hsvTorgb25_g819.y,hsvTorgb25_g819.z) );
				float4 appendResult18_g819 = (float4(hsvTorgb26_g819 , temp_output_15_0_g819.a));
				float4 lerpResult19_g819 = lerp( appendResult18_g819 , temp_output_15_0_g819 , smoothstepResult5_g819);
				float4 temp_output_15_0_g823 = lerpResult19_g819;
				float3 hsvTorgb25_g823 = RGBToHSV( temp_output_15_0_g823.rgb );
				float3 hsvTorgb26_g823 = HSVToRGB( float3(( _SSSHueShift5 + hsvTorgb25_g823.x ),hsvTorgb25_g823.y,hsvTorgb25_g823.z) );
				float4 appendResult18_g823 = (float4(hsvTorgb26_g823 , temp_output_15_0_g823.a));
				float4 lerpResult19_g823 = lerp( appendResult18_g823 , temp_output_15_0_g823 , smoothstepResult5_g823);
				float3x3 temp_output_995_0 = ( _EnableColorReplacer == 0.0 ? float3x3(appendResult762, appendResult763, float3( 0,0,0 )) : float3x3(( temp_output_52_0_g818 == 5.0 ? lerpResult4_g823 : ( temp_output_52_0_g818 == 4.0 ? temp_output_105_0_g818 : ( temp_output_52_0_g818 == 3.0 ? temp_output_104_0_g818 : ( temp_output_52_0_g818 == 2.0 ? temp_output_102_0_g818 : ( temp_output_52_0_g818 == 1.0 ? temp_output_106_0_g818 : float4( temp_output_67_0_g818[0] , 0.0 ) ) ) ) ) ).rgb, lerpResult19_g823.rgb, float3( 0,0,0 )) );
				float2 uv2_Detail = i.ase_texcoord1.zw * _Detail_ST.xy + _Detail_ST.zw;
				float4 Detail807 = tex2D( _Detail, uv2_Detail );
				float4 lerpResult1030 = lerp( DetailColor1029 , float4( temp_output_995_0[0] , 0.0 ) , Detail807);
				float4 temp_output_1031_0 = ( _DetailColorSetting == 1.0 ? lerpResult1030 : ( Detail807 * float4( temp_output_995_0[0] , 0.0 ) ) );
				float2 uv_ILM = i.ase_texcoord1.xy * _ILM_ST.xy + _ILM_ST.zw;
				float4 tex2DNode274 = tex2D( _ILM, uv_ILM );
				float ILMA357 = tex2DNode274.a;
				float4 lerpResult1020 = lerp( ILMAColor992 , temp_output_1031_0 , ILMA357);
				float4 Base339 = ( _ILMColorSetting == 1.0 ? lerpResult1020 : ( ILMA357 * temp_output_1031_0 ) );
				float4 Base12_g1537 = Base339;
				float EnableRimlight82_g1533 = _EnableRimlight;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 worldPos32_g1529 = ase_worldPos;
				float3 localStereoCameraViewDirection32_g1529 = StereoCameraViewDirection32_g1529( worldPos32_g1529 );
				float dotResult31_g1529 = dot( normalizedWorldNormal , localStereoCameraViewDirection32_g1529 );
				float SSSA581 = tex2DNode297.a;
				float blendOpSrc15_g1532 = SSSA581;
				float blendOpDest15_g1532 = BaseA580;
				float NdV48_g1533 = ( ( 1.0 - ( dotResult31_g1529 + ( 1.0 - _RimlightSize ) ) ) * ( 1.0 - ( saturate( abs( blendOpSrc15_g1532 - blendOpDest15_g1532 ) )) ) );
				float VertexR33_g1533 = i.ase_color.r;
				float LightDirectionSetting561 = _LightDirectionSetting;
				float FallbackLightDirection563 = _FallbackLightDirection;
				float3 localViewMatrix1418_g1531 = ViewMatrix1418_g1531();
				float3 normalizeResult422_g1531 = normalize( localViewMatrix1418_g1531 );
				int localIsInMirror411_g1531 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_297_0_g1531 = _ViewDirOffsetYaw;
				float temp_output_424_0_g1531 = radians( ( (float)localIsInMirror411_g1531 == 0.0 ? -temp_output_297_0_g1531 : temp_output_297_0_g1531 ) );
				float3 localViewMatrix0417_g1531 = ViewMatrix0417_g1531();
				float3 normalizeResult425_g1531 = normalize( localViewMatrix0417_g1531 );
				float3 rotatedValue428_g1531 = RotateAroundAxis( float3( 0,0,0 ), normalizeResult425_g1531, normalizeResult422_g1531, temp_output_424_0_g1531 );
				float3 normalizeResult429_g1531 = normalize( rotatedValue428_g1531 );
				int localIsInMirror423_g1531 = ( unity_CameraProjection[2][0] != 0.f || unity_CameraProjection[2][1] != 0.f );
				float temp_output_296_0_g1531 = _ViewDirOffsetPitch;
				float3 localStereoCameraViewPosition30_g1529 = StereoCameraViewPosition30_g1529();
				float3 rotatedValue431_g1531 = RotateAroundAxis( float3( 0,0,0 ), ( localStereoCameraViewPosition30_g1529 - ( ase_worldPos - i.ase_texcoord4.xyz ) ), normalizeResult422_g1531, temp_output_424_0_g1531 );
				float3 rotatedValue432_g1531 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue431_g1531, normalizeResult429_g1531, radians( ( (float)localIsInMirror423_g1531 == 0.0 ? temp_output_296_0_g1531 : -temp_output_296_0_g1531 ) ) );
				float3 normalizeResult433_g1531 = ASESafeNormalize( rotatedValue432_g1531 );
				float3 normalizeResult38_g1529 = normalize( normalizeResult433_g1531 );
				float3 appendResult15_g1530 = (float3(( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * sin( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 ) , sin( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) , ( cos( ( ( _FakeLightDirX / 180.0 ) * UNITY_PI ) ) * cos( ( ( _FakeLightDirY / 180.0 ) * UNITY_PI ) ) * -1.0 )));
				float3 normalizeResult2_g1530 = normalize( appendResult15_g1530 );
				float3 normalizeResult26_g1529 = normalize( normalizeResult2_g1530 );
				float3 ifLocalVar3_g1529 = 0;
				if( FallbackLightDirection563 > 0.0 )
				ifLocalVar3_g1529 = normalizeResult38_g1529;
				else if( FallbackLightDirection563 == 0.0 )
				ifLocalVar3_g1529 = normalizeResult26_g1529;
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(ase_worldPos));
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float clampResult7_g1507 = clamp( ( ( abs( worldSpaceLightDir ).x > float3( 0,0,0 ) ? 1.0 : 0.0 ) + ( ase_lightColor.a > 0.0 ? 1.0 : 0.0 ) ) , 0.0 , 1.0 );
				float4 color14_g1507 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
				float4 color8_g1507 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1507 = color8_g1507;
				#else
				float4 staticSwitch9_g1507 = ( clampResult7_g1507 * color14_g1507 );
				#endif
				float4 break10_g1507 = staticSwitch9_g1507;
				float IsThereWorldLight450 = break10_g1507.r;
				float3 ifLocalVar8_g1529 = 0;
				if( IsThereWorldLight450 > 0.0 )
				ifLocalVar8_g1529 = worldSpaceLightDir;
				else if( IsThereWorldLight450 == 0.0 )
				ifLocalVar8_g1529 = ifLocalVar3_g1529;
				float3 ifLocalVar9_g1529 = 0;
				if( LightDirectionSetting561 > 0.0 )
				ifLocalVar9_g1529 = ifLocalVar3_g1529;
				else if( LightDirectionSetting561 == 0.0 )
				ifLocalVar9_g1529 = ifLocalVar8_g1529;
				float dotResult46_g1529 = dot( ifLocalVar9_g1529 , normalizedWorldNormal );
				float temp_output_36_0_g1532 = ( ( dotResult46_g1529 + _GlobalLightPush ) * i.ase_color.r );
				float3 appendResult280 = (float3(tex2DNode274.r , tex2DNode274.g , tex2DNode274.b));
				float3 linearToGamma277 = LinearToGammaSpace( appendResult280 );
				float3 break292 = linearToGamma277;
				float ILMG574 = break292.y;
				float temp_output_1_0_g1532 = ILMG574;
				float temp_output_1077_0 = ( ( temp_output_36_0_g1532 * 0.5 ) + ( ( temp_output_1_0_g1532 * 2.0 ) - 1.0 ) );
				float NdL20_g1533 = temp_output_1077_0;
				float temp_output_2_0_g1534 = NdL20_g1533;
				float temp_output_3_0_g1534 = -_Shadow1Smoothness;
				float temp_output_9_0_g1533 = _Shadow1Push;
				float temp_output_11_0_g1533 = _Shadow2Push;
				float clampResult15_g1533 = clamp( temp_output_9_0_g1533 , temp_output_11_0_g1533 , temp_output_9_0_g1533 );
				float RealShadow1Push16_g1533 = clampResult15_g1533;
				float temp_output_1_0_g1534 = RealShadow1Push16_g1533;
				float smoothstepResult6_g1534 = smoothstep( ( ( temp_output_2_0_g1534 / 1.0 ) + temp_output_3_0_g1534 ) , temp_output_2_0_g1534 , temp_output_1_0_g1534);
				float lerpResult7_g1534 = lerp( smoothstepResult6_g1534 , ( temp_output_1_0_g1534 >= temp_output_2_0_g1534 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1534 ? 1.0 : 0.0 ));
				float clampResult17_g1533 = clamp( temp_output_11_0_g1533 , temp_output_11_0_g1533 , temp_output_9_0_g1533 );
				float RealShadow2Push18_g1533 = clampResult17_g1533;
				float temp_output_2_0_g1535 = NdL20_g1533;
				float temp_output_3_0_g1535 = -_Shadow2Smoothness;
				float temp_output_1_0_g1535 = RealShadow2Push18_g1533;
				float smoothstepResult6_g1535 = smoothstep( ( ( temp_output_2_0_g1535 / 1.0 ) + temp_output_3_0_g1535 ) , temp_output_2_0_g1535 , temp_output_1_0_g1535);
				float lerpResult7_g1535 = lerp( smoothstepResult6_g1535 , ( temp_output_1_0_g1535 >= temp_output_2_0_g1535 ? 1.0 : 0.0 ) , ( 0.0 == temp_output_3_0_g1535 ? 1.0 : 0.0 ));
				float temp_output_42_0_g1533 = max( max( ( 1.0 - ( VertexR33_g1533 > _Shadow2VertexRThreshold ? 1.0 : 0.0 ) ) , lerpResult7_g1535 ) , ( ILMG574 < _PermanentShadowThreshold ? 1.0 : 0.0 ) );
				float temp_output_43_0_g1533 = ( max( ( 1.0 - ( VertexR33_g1533 > _Shadow1VertexRThreshold ? 1.0 : 0.0 ) ) , min( lerpResult7_g1534 , ( RealShadow1Push16_g1533 >= RealShadow2Push18_g1533 ? 1.0 : 0.0 ) ) ) - temp_output_42_0_g1533 );
				float temp_output_61_0_g1533 = ( 1.0 - ( temp_output_43_0_g1533 + temp_output_42_0_g1533 ) );
				float temp_output_75_0_g1533 = ceil( ( ( ( NdV48_g1533 * BaseA580 ) > 0.0 ? 1.0 : 0.0 ) * temp_output_61_0_g1533 ) );
				float clampResult88_g1533 = clamp( temp_output_75_0_g1533 , 0.0 , 1.0 );
				float temp_output_94_0_g1533 = ( EnableRimlight82_g1533 == 1.0 ? clampResult88_g1533 : 0.0 );
				float temp_output_6_0_g1537 = temp_output_94_0_g1533;
				float4 temp_cast_31 = (temp_output_6_0_g1537).xxxx;
				float4 blendOpSrc19_g1537 = Base12_g1537;
				float4 blendOpDest19_g1537 = temp_cast_31;
				float4 lerpBlendMode19_g1537 = lerp(blendOpDest19_g1537,min( blendOpSrc19_g1537 , blendOpDest19_g1537 ),0.9);
				float4 LightColor779 = _LightColor;
				float4 LightColor16_g1537 = LightColor779;
				float3 desaturateInitialColor9_g1538 = ( ( ( BaseA13_g1537 * ( saturate( lerpBlendMode19_g1537 )) ) + ( Base12_g1537 * temp_output_6_0_g1537 ) ) * LightColor16_g1537 * _HighlightRimlightIntensity * _HighlightRimlightTint ).rgb;
				float desaturateDot9_g1538 = dot( desaturateInitialColor9_g1538, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1538 = lerp( desaturateInitialColor9_g1538, desaturateDot9_g1538.xxx, ( 1.0 - _HighlightRimlightSaturation ) );
				float ILMB576 = break292.z;
				float3 normalizeResult48_g1529 = normalize( ifLocalVar9_g1529 );
				float3 normalizeResult51_g1529 = normalize( ( normalizeResult48_g1529 + localStereoCameraViewDirection32_g1529 ) );
				float dotResult50_g1529 = dot( normalizedWorldNormal , normalizeResult51_g1529 );
				float blendOpSrc34_g1532 = ILMB576;
				float blendOpDest34_g1532 = dotResult50_g1529;
				float temp_output_68_0_g1533 = ( ( ( saturate( ( 1.0 - ( ( 1.0 - blendOpDest34_g1532) / max( blendOpSrc34_g1532, 0.00001) ) ) )) > ( 1.0 - _SpecularSize ) ? 1.0 : 0.0 ) * temp_output_61_0_g1533 );
				float clampResult87_g1533 = clamp( temp_output_68_0_g1533 , 0.0 , 1.0 );
				float temp_output_29_0_g1537 = clampResult87_g1533;
				float4 temp_cast_33 = (temp_output_29_0_g1537).xxxx;
				float4 blendOpSrc30_g1537 = Base12_g1537;
				float4 blendOpDest30_g1537 = temp_cast_33;
				float4 lerpBlendMode30_g1537 = lerp(blendOpDest30_g1537,min( blendOpSrc30_g1537 , blendOpDest30_g1537 ),0.9);
				float3 desaturateInitialColor9_g1541 = ( ( ( BaseA13_g1537 * ( saturate( lerpBlendMode30_g1537 )) ) + ( Base12_g1537 * temp_output_29_0_g1537 ) ) * LightColor16_g1537 * _SpecularIntensity * _SpecularTint ).rgb;
				float desaturateDot9_g1541 = dot( desaturateInitialColor9_g1541, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1541 = lerp( desaturateInitialColor9_g1541, desaturateDot9_g1541.xxx, ( 1.0 - _SpecularSaturation ) );
				float temp_output_77_0_g1533 = ( temp_output_61_0_g1533 - temp_output_68_0_g1533 );
				float clampResult90_g1533 = clamp( ( EnableRimlight82_g1533 == 1.0 ? ( temp_output_77_0_g1533 - temp_output_75_0_g1533 ) : temp_output_77_0_g1533 ) , 0.0 , 1.0 );
				float3 desaturateInitialColor9_g1543 = ( ( Base12_g1537 * clampResult90_g1533 ) * LightColor16_g1537 * _BaseIntensity * _BaseTint ).rgb;
				float desaturateDot9_g1543 = dot( desaturateInitialColor9_g1543, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1543 = lerp( desaturateInitialColor9_g1543, desaturateDot9_g1543.xxx, ( 1.0 - _BaseSaturation ) );
				float3 SSS578 = temp_output_995_0[1];
				float4 SSS14_g1537 = float4( SSS578 , 0.0 );
				float4 AmbientColor780 = _AmbientColor;
				float4 AmbientColor68_g1537 = AmbientColor780;
				float3 desaturateInitialColor9_g1542 = ( ( temp_output_43_0_g1533 * Base12_g1537 * SSS14_g1537 ) * AmbientColor68_g1537 * _Shadow1Intensity * _Shadow1Tint ).rgb;
				float desaturateDot9_g1542 = dot( desaturateInitialColor9_g1542, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1542 = lerp( desaturateInitialColor9_g1542, desaturateDot9_g1542.xxx, ( 1.0 - _Shadow1Saturation ) );
				float ILMR573 = break292.x;
				float temp_output_53_0_g1533 = ceil( ( ( ( temp_output_42_0_g1533 * NdV48_g1533 ) > 0.1 ? 1.0 : 0.0 ) * ILMR573 ) );
				float clampResult91_g1533 = clamp( ( EnableRimlight82_g1533 == 1.0 ? ( temp_output_42_0_g1533 - temp_output_53_0_g1533 ) : temp_output_42_0_g1533 ) , 0.0 , 1.0 );
				float4 blendOpSrc51_g1537 = float4( 0,0,0,0 );
				float4 blendOpDest51_g1537 = ( Base12_g1537 * SSS14_g1537 );
				float4 lerpBlendMode51_g1537 = lerp(blendOpDest51_g1537,2.0f*blendOpDest51_g1537*blendOpSrc51_g1537 + blendOpDest51_g1537*blendOpDest51_g1537*(1.0f - 2.0f*blendOpSrc51_g1537),0.5);
				float3 desaturateInitialColor9_g1540 = ( ( clampResult91_g1533 * ( saturate( lerpBlendMode51_g1537 )) ) * AmbientColor68_g1537 * _Shadow2Intensity * _Shadow2Tint ).rgb;
				float desaturateDot9_g1540 = dot( desaturateInitialColor9_g1540, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1540 = lerp( desaturateInitialColor9_g1540, desaturateDot9_g1540.xxx, ( 1.0 - _Shadow2Saturation ) );
				float clampResult92_g1533 = clamp( temp_output_53_0_g1533 , 0.0 , 1.0 );
				float temp_output_96_0_g1533 = ( EnableRimlight82_g1533 == 1.0 ? clampResult92_g1533 : 0.0 );
				float temp_output_60_0_g1537 = temp_output_96_0_g1533;
				float4 blendOpSrc56_g1537 = float4( 0,0,0,0 );
				float4 blendOpDest56_g1537 = ( Base12_g1537 * SSS14_g1537 );
				float4 lerpBlendMode56_g1537 = lerp(blendOpDest56_g1537,2.0f*blendOpDest56_g1537*blendOpSrc56_g1537 + blendOpDest56_g1537*blendOpDest56_g1537*(1.0f - 2.0f*blendOpSrc56_g1537),0.5);
				float4 temp_output_56_0_g1537 = ( saturate( lerpBlendMode56_g1537 ));
				float3 desaturateInitialColor9_g1539 = ( ( ( ( temp_output_60_0_g1537 * ( temp_output_56_0_g1537 + _ShadowRimlightBaseColor ) ) + ( temp_output_60_0_g1537 * temp_output_56_0_g1537 ) ) * ILMR573 ) * AmbientColor68_g1537 * _ShadowRimlightIntensity * _ShadowRimlightTint ).rgb;
				float desaturateDot9_g1539 = dot( desaturateInitialColor9_g1539, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar9_g1539 = lerp( desaturateInitialColor9_g1539, desaturateDot9_g1539.xxx, ( 1.0 - _ShadowRimlightSaturation ) );
				float3 temp_output_787_0 = ( desaturateVar9_g1538 + desaturateVar9_g1541 + desaturateVar9_g1543 + desaturateVar9_g1542 + desaturateVar9_g1540 + desaturateVar9_g1539 );
				float4 lerpResult1049 = lerp( DetailColor1029 , float4( temp_output_787_0 , 0.0 ) , Detail807);
				float4 temp_output_1048_0 = ( DetailColorSetting1027 == 2.0 ? lerpResult1049 : float4( temp_output_787_0 , 0.0 ) );
				float4 lerpResult1004 = lerp( ILMAColor992 , temp_output_1048_0 , ILMA357);
				float LightColorSetting872 = _LightColorSetting;
				float ifLocalVar13_g1544 = 0;
				if( LightColorSetting872 == 1.0 )
				ifLocalVar13_g1544 = 0.0;
				else if( LightColorSetting872 < 1.0 )
				ifLocalVar13_g1544 = IsThereWorldLight450;
				UNITY_LIGHT_ATTENUATION(ase_atten, i, ase_worldPos)
				float4 temp_cast_43 = (_MinimumGlobalLightIntensity).xxxx;
				float4 temp_cast_44 = (5.0).xxxx;
				float4 clampResult18_g1544 = clamp( ase_lightColor , temp_cast_43 , temp_cast_44 );
				float4 temp_output_11_0_g1544 = ( ase_atten * clampResult18_g1544 );
				float4 temp_output_8_0_g1544 = ( _FakeGlobalLightColor * _FakeGlobalLightIntensity );
				float4 ifLocalVar3_g1544 = 0;
				if( ifLocalVar13_g1544 > 0.0 )
				ifLocalVar3_g1544 = temp_output_11_0_g1544;
				else if( ifLocalVar13_g1544 == 0.0 )
				ifLocalVar3_g1544 = temp_output_8_0_g1544;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch9_g1544 = max( float4( 0,0,0,0 ) , temp_output_11_0_g1544 );
				#else
				float4 staticSwitch9_g1544 = ifLocalVar3_g1544;
				#endif
				float4 GlobalLightColor944 = staticSwitch9_g1544;
				float3 ColorOut997 = temp_output_787_0;
				float2 uv_EmissionMask = i.ase_texcoord1.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float4 temp_cast_47 = (( _EmissionMaskIntensity * tex2D( _EmissionMask, uv_EmissionMask ).r )).xxxx;
				float4 EmissionRampMask920 = max( ( ( ( temp_output_94_0_g1533 * _HighlightRimlightEmissiveToggle ) * _HighlightRimlightEmissionIntensity ) + ( ( clampResult87_g1533 * _SpecularEmissiveToggle ) * _SpecularEmissionIntensity ) + ( ( clampResult90_g1533 * _BaseEmissiveToggle ) * _BaseEmissionIntensity ) + ( ( temp_output_43_0_g1533 * _Shadow1EmissiveToggle ) * _Shadow1EmissionIntensity ) + ( ( clampResult91_g1533 * _Shadow2EmissiveToggle ) * _Shadow2EmissionIntensity ) + ( ( temp_output_96_0_g1533 * _ShadowRimlightEmissiveToggle ) * _ShadowRimlightEmissionIntensity ) + ( ( 1.0 - ILMA357 ) * _ILMAlphaEmissionIntensity * _ILMAlphaLinesEmissionToggle ) + ( ( 1.0 - Detail807 ) * _BodyLinesEmissionToggle * _BodyLinesEmissionIntensity ) ) , temp_cast_47 );
				float4 temp_cast_49 = (EmissionRampMask920.r).xxxx;
				float4 ifLocalVar17_g1544 = 0;
				if( ifLocalVar13_g1544 > 0.0 )
				ifLocalVar17_g1544 = clampResult18_g1544;
				else if( ifLocalVar13_g1544 == 0.0 )
				ifLocalVar17_g1544 = temp_output_8_0_g1544;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch30_g1544 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch30_g1544 = max( temp_cast_49 , ifLocalVar17_g1544 );
				#endif
				float4 EmissionLightColor947 = staticSwitch30_g1544;
				float4 lerpResult1088 = lerp( ( ( ILMColorSetting993 == 2.0 ? lerpResult1004 : temp_output_1048_0 ) * GlobalLightColor944 ) , ( _EmissionIntensity * float4( ColorOut997 , 0.0 ) * EmissionLightColor947 ) , EmissionRampMask920);
				float temp_output_48_0_g1545 = _DebugGroup;
				float temp_output_47_0_g1545 = _VertexChannel;
				float4 temp_output_59_0_g1545 = _DebugColor;
				float temp_output_50_0_g1545 = _ILMChannel;
				float3 ILM988 = linearToGamma277;
				float4 appendResult984 = (float4(ILM988 , ILMA357));
				float4 temp_output_54_0_g1545 = appendResult984;
				float4 break7_g1545 = temp_output_54_0_g1545;
				float temp_output_57_0_g1545 = 0.0;
				float4 Debug987 = ( temp_output_48_0_g1545 == 0.0 ? ( temp_output_47_0_g1545 == 0.0 ? i.ase_color : ( temp_output_47_0_g1545 == 1.0 ? ( i.ase_color.r * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 2.0 ? ( i.ase_color.g * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 3.0 ? ( i.ase_color.b * temp_output_59_0_g1545 ) : ( temp_output_47_0_g1545 == 4.0 ? ( i.ase_color.a * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1545 == 1.0 ? ( temp_output_50_0_g1545 == 0.0 ? temp_output_54_0_g1545 : ( temp_output_50_0_g1545 == 1.0 ? ( break7_g1545.r * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 2.0 ? ( break7_g1545.g * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 3.0 ? ( break7_g1545.b * temp_output_59_0_g1545 ) : ( temp_output_50_0_g1545 == 4.0 ? ( break7_g1545.a * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) ) ) ) : ( temp_output_48_0_g1545 == 2.0 ? ( temp_output_57_0_g1545 == 0.0 ? ( BaseA580 * temp_output_59_0_g1545 ) : ( temp_output_57_0_g1545 == 1.0 ? ( 0.0 * temp_output_59_0_g1545 ) : float4( 0,0,0,0 ) ) ) : float4( 0,0,0,0 ) ) ) );
				

				outColor = ( _EnableDebug == 0.0 ? lerpResult1088 : Debug987 ).rgb;
				outAlpha = 1;
				clip(outAlpha);
				SHADOW_CASTER_FRAGMENT(i)
			}
			ENDCG
		}
		
	}
	CustomEditor "ASWFighterZGUI"
	
	
}
/*ASEBEGIN
Version=18900
2961;197;2049;932;3682.081;-2456.609;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;781;-3044.91,2694.822;Inherit;False;3694.567;2936.844;;67;339;1022;1021;1020;1019;1018;807;806;993;991;992;990;988;578;573;587;555;586;581;576;574;580;292;995;357;277;994;764;827;848;826;850;854;852;855;846;847;829;823;857;853;585;849;824;828;821;822;851;856;280;825;763;762;274;297;296;1026;1027;1028;1029;1030;1031;1033;1036;1037;1034;1038;Color Information;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;296;-2981.91,2744.822;Inherit;True;Property;_MainTex;MainTex;2;0;Create;True;0;0;0;False;0;False;-1;None;77b48568ee1415f41903ee6ff584ba49;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;297;-2937.471,2998.025;Inherit;True;Property;_SSS;SSS;3;0;Create;True;0;0;0;False;0;False;-1;None;0b632c1a43d4ffa47866a238d332cc95;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;762;-2590.436,2769.294;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;763;-2591.436,3001.293;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;848;-2717.466,4402.572;Inherit;False;Property;_Target3Color;Target 3 Color;45;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;829;-2781.466,4114.572;Inherit;False;Property;_SSSHueShift2;SSS Hue Shift 2;42;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-2781.466,5234.572;Inherit;False;Property;_Source5Fuzziness;Source 5 Fuzziness;52;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;852;-2717.466,4850.572;Inherit;False;Property;_Target4Color;Target 4 Color;49;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;846;-2781.466,4338.572;Inherit;False;Property;_Source3Fuzziness;Source 3 Fuzziness;44;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;847;-2717.466,4178.572;Inherit;False;Property;_Source3Color;Source 3 Color;43;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;857;-2781.466,5458.572;Inherit;False;Property;_SSSHueShift5;SSS Hue Shift 5;54;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;827;-2781.466,3890.571;Inherit;False;Property;_Source2Fuzziness;Source 2 Fuzziness;40;0;Create;True;0;0;0;False;0;False;0;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;826;-2717.466,3730.571;Inherit;False;Property;_Source2Color;Source 2 Color;39;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;855;-2717.466,5074.572;Inherit;False;Property;_Source5Color;Source 5 Color;51;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;850;-2781.466,4786.572;Inherit;False;Property;_Source4Fuzziness;Source 4 Fuzziness;48;0;Create;True;0;0;0;False;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;849;-2781.466,4562.572;Inherit;False;Property;_SSSHueShift3;SSS Hue Shift 3;46;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;822;-2749.466,3282.571;Inherit;False;Property;_Source1Color;Source 1 Color;35;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.MatrixFromVectors;585;-2385.379,2896.77;Inherit;False;FLOAT3x3;True;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;825;-2781.466,3666.571;Inherit;False;Property;_SSSHueShift1;SSS Hue Shift 1;38;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;823;-2781.466,3442.571;Inherit;False;Property;_Source1Fuzziness;Source 1 Fuzziness;36;0;Create;True;0;0;0;False;0;False;0;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;853;-2781.466,5010.572;Inherit;False;Property;_SSSHueShift4;SSS Hue Shift 4;50;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;821;-2781.466,3218.571;Inherit;False;Property;_TotalReplacements;Total Replacements;34;1;[IntRange];Create;True;0;0;0;False;0;False;0;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;856;-2717.466,5298.572;Inherit;False;Property;_Target5Color;Target 5 Color;53;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;851;-2717.466,4626.572;Inherit;False;Property;_Source4Color;Source 4 Color;47;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;824;-2717.466,3506.571;Inherit;False;Property;_Target1Color;Target 1 Color;37;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;828;-2717.466,3954.571;Inherit;False;Property;_Target2Color;Target 2 Color;41;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1028;-1125.44,3079.229;Inherit;False;Property;_BodyLinesColor;Body Lines Color;105;0;Create;True;0;0;0;False;0;False;0,1,0,0;1,1,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;994;-1864.083,3595.255;Inherit;False;Property;_EnableColorReplacer;Enable Color Replacer;31;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;806;-1710.088,3115.39;Inherit;True;Property;_Detail;Detail;5;0;Create;True;0;0;0;False;0;False;-1;None;079371fbcdf1cfc4c90d7918372946ab;True;1;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;1036;-1981.342,3579.595;Inherit;False;1;0;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.FunctionNode;764;-2083.66,3760.169;Inherit;False;Color Replacer;-1;;818;3bf8a732171ac6840bcd0b4c21fcee62;0;22;67;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;52;FLOAT;0;False;16;COLOR;0,0,0,1;False;17;FLOAT;0;False;13;COLOR;0,0,0,0;False;96;FLOAT;0;False;31;COLOR;0,0,0,1;False;32;FLOAT;0;False;30;COLOR;0,0,0,0;False;97;FLOAT;0;False;36;COLOR;0,0,0,1;False;38;FLOAT;0;False;37;COLOR;0,0,0,0;False;99;FLOAT;0;False;40;COLOR;0,0,0,1;False;42;FLOAT;0;False;41;COLOR;0,0,0,0;False;100;FLOAT;0;False;44;COLOR;0,0,0,1;False;46;FLOAT;0;False;45;COLOR;0,0,0,0;False;101;FLOAT;0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;807;-1385.286,3116.565;Inherit;False;Detail;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;995;-1569.022,3700.44;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;3;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.SamplerNode;274;-1737.02,2839.592;Inherit;True;Property;_ILM;ILM;4;0;Create;True;0;0;0;False;0;False;-1;None;652763c641dea3547b1e6e08412c401e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1029;-847.9679,3083.436;Inherit;False;DetailColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1037;-950.6687,3602.41;Inherit;False;807;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;572;971.8275,2807.128;Inherit;False;703.0927;565.6688;;9;517;450;563;561;533;634;535;871;872;Light Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;280;-1426.534,2863.711;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;990;-646.1214,2771.983;Inherit;False;Property;_ILMAlphaColor;ILM Alpha Color;9;0;Create;True;0;0;0;True;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1026;-1141.44,3256.229;Inherit;False;Property;_DetailColorSetting;Detail Color Setting;7;1;[Enum];Create;True;0;3;Default Black;0;Shadow Priority;1;Detail Priority;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VectorFromMatrixNode;586;-1318.638,3689.277;Inherit;False;Row;0;1;0;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1038;-967.8168,3497.064;Inherit;False;1029;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;992;-405.6796,2771.823;Inherit;False;ILMAColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;-703.4213,3640.504;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;1034;-553.288,3481.147;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;357;-1368.723,2998.818;Inherit;False;ILMA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;535;1060.975,3242.652;Inherit;False;Property;_FallbackLightDirection;Fallback Light Direction;19;1;[Enum];Create;True;0;2;Fake Light Direction;0;View Direction;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;277;-1282.827,2862.071;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;533;1058.975,3071.652;Inherit;False;Property;_LightDirectionSetting;Light Direction Setting;18;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;634;1049.433,2895.548;Inherit;False;Is There A Light;-1;;1507;65e24b0fdfa2e3146a301178490755c7;0;0;2;FLOAT;0;FLOAT;15
Node;AmplifyShaderEditor.LerpOp;1030;-721.7653,3506.472;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;1312.022,2857.128;Inherit;False;IsThereWorldLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;1316.975,3242.652;Inherit;False;FallbackLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1018;-231.2147,3539.682;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;561;1314.975,3071.652;Inherit;False;LightDirectionSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;991;-637.4034,2957.74;Inherit;False;Property;_ILMColorSetting;ILM Color Setting;6;1;[Enum];Create;True;0;3;Default Black;0;Shadow Priority;1;ILM Priority;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;292;-1075.284,2862.309;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;558;922.4996,3449.375;Inherit;False;919.3984;663.7043;;8;637;562;564;472;434;471;435;525;Dot Creation;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1019;-246.7756,3374.842;Inherit;False;992;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;1031;-453.8447,3499.728;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;564;957.7625,3689.256;Inherit;False;563;FallbackLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;580;-2651.979,2892.336;Inherit;False;BaseA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;472;941.7625,4009.256;Inherit;False;Property;_ViewDirOffsetYaw;View Dir Offset Yaw;14;0;Create;True;0;0;0;False;0;False;0;-35;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;525;986.4993,3512.944;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;555;-1437.457,4715.907;Inherit;False;1451.782;658.5377;;14;960;947;944;873;950;867;544;869;632;779;780;777;778;1082;Light Color Calculation;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;1032;55.20951,3182.57;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;1021.762,3769.256;Inherit;False;Property;_FakeLightDirX;Fake Light Dir X;11;0;Create;True;0;0;0;False;0;False;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1021;19.46733,3580.918;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;471;941.7625,3929.256;Inherit;False;Property;_ViewDirOffsetPitch;View Dir Offset Pitch;13;0;Create;True;0;0;0;False;0;False;0;35;-90;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;562;957.7625,3609.256;Inherit;False;561;LightDirectionSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1020;5.246209,3438.625;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;581;-2602.539,3128.539;Inherit;False;SSSA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;576;-924.3578,2973.819;Inherit;False;ILMB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;1021.762,3849.256;Inherit;False;Property;_FakeLightDirY;Fake Light Dir Y;12;0;Create;True;0;0;0;False;0;False;-135;-135;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;574;-924.3578,2893.819;Inherit;False;ILMG;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;639;2336,3776;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1022;271.5455,3459.125;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;573;-924.3578,2813.819;Inherit;False;ILMR;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VectorFromMatrixNode;587;-1311.638,3868.277;Inherit;False;Row;1;1;0;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;637;1422.762,3657.256;Inherit;False;Dot Creation;-1;;1529;fd90efbfe94791944bc1c5b55d8d67e4;0;7;12;FLOAT;0;False;17;FLOAT;0;False;16;FLOAT;0;False;29;FLOAT;0;False;28;FLOAT;0;False;33;FLOAT;0;False;34;FLOAT;0;False;3;FLOAT;0;FLOAT;42;FLOAT;52
Node;AmplifyShaderEditor.RangedFloatNode;707;2295,4051;Inherit;False;Property;_GlobalLightPush;Global Light Push;20;0;Create;True;0;0;0;False;0;False;1;1;-1;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;2336,3968;Inherit;False;576;ILMB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;777;-410.4719,4775.769;Inherit;False;Property;_LightColor;Light Color;21;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;640;2336,3840;Inherit;False;581;SSSA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;706;2336,3904;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;778;-410.4719,4985.769;Inherit;False;Property;_AmbientColor;Ambient Color;22;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;641;2293,4137;Inherit;False;Property;_RimlightSize;Rimlight Size;32;0;Create;True;0;0;0;False;0;False;0.4;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;578;-1042.649,3864.08;Inherit;False;SSS;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;463.5115,3476.944;Inherit;False;Base;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;753;3102.999,3771.149;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;746;3008,4032;Inherit;False;Property;_SpecularSize;Specular Size;24;0;Create;True;0;0;0;False;0;False;0.3;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;923;3008,4608;Inherit;False;Property;_SpecularEmissiveToggle;Specular Emissive Toggle;65;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;729;3104,3904;Inherit;False;574;ILMG;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1090;3008,4352;Inherit;False;Property;_Shadow2Smoothness;Shadow 2 Smoothness;113;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;924;3024,4672;Inherit;False;Property;_BaseEmissiveToggle;Base Emissive Toggle;71;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;738;3104,3840;Inherit;False;573;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;711;3008,4096;Inherit;False;Property;_Shadow1Push;Shadow 1 Push;25;0;Create;True;0;0;0;False;0;False;0.5;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;780;-205.4724,4986.769;Inherit;False;AmbientColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;732;2976,4480;Inherit;False;Property;_PermanentShadowThreshold;Permanent Shadow Threshold;30;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;2976,4416;Inherit;False;Property;_Shadow2VertexRThreshold;Shadow 2 VertexR Threshold;29;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;758;3088,3968;Inherit;False;Property;_EnableRimlight;Enable Rimlight;33;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;927;2976,4864;Inherit;False;Property;_ShadowRimlightEmissiveToggle;Shadow Rimlight Emissive Toggle;85;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;716;2992,4224;Inherit;False;Property;_Shadow1VertexRThreshold;Shadow 1 VertexR Threshold;27;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;922;2976,4544;Inherit;False;Property;_HighlightRimlightEmissiveToggle;Highlight Rimlight Emissive Toggle;60;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;925;2992,4736;Inherit;False;Property;_Shadow1EmissiveToggle;Shadow 1 Emissive Toggle;76;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;727;3008,4288;Inherit;False;Property;_Shadow2Push;Shadow 2 Push;28;0;Create;True;0;0;0;False;0;False;0.2;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;779;-205.4724,4777.769;Inherit;False;LightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;926;2992,4800;Inherit;False;Property;_Shadow2EmissiveToggle;Shadow 2 Emissive Toggle;81;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1077;2707.013,3668.041;Inherit;False;Final Dot Calculation;-1;;1532;966aa02f52a17a443a5106621d0d8d24;0;9;5;FLOAT;0;False;21;FLOAT;0;False;6;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;11;FLOAT;0;False;10;FLOAT;0;False;3;FLOAT;0;FLOAT;8;FLOAT;9
Node;AmplifyShaderEditor.RangedFloatNode;1089;3008,4160;Inherit;False;Property;_Shadow1Smoothness;Shadow 1 Smoothness;112;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;889;3952,5248;Inherit;False;Property;_BaseSaturation;Base Saturation;70;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;793;4032,4144;Inherit;False;578;SSS;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;897;4016,5664;Inherit;False;Property;_Shadow2Tint;Shadow 2 Tint;78;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;974;3704,2745.519;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;888;4032,5088;Inherit;False;Property;_BaseTint;Base Tint;68;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;877;3952,6048;Inherit;False;Property;_ShadowRimlightIntensity;Shadow Rimlight Intensity;83;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1045;3597.194,3052.232;Inherit;False;Property;_BodyLinesEmissionToggle;Body Lines Emission Toggle;97;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;973;3578.203,3284.801;Inherit;False;Property;_SpecularEmissionIntensity;Specular Emission Intensity;66;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;804;4032,4240;Inherit;False;573;ILMR;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;3583.296,3521.541;Inherit;False;Property;_Shadow2EmissionIntensity;Shadow 2 Emission Intensity;93;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;898;3952,5824;Inherit;False;Property;_Shadow2Saturation;Shadow 2 Saturation;79;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;893;4016,5376;Inherit;False;Property;_Shadow1Tint;Shadow 1 Tint;73;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1043;3701.927,2819.818;Inherit;False;807;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;878;3984,6112;Inherit;False;Property;_ShadowRimlightTint;Shadow Rimlight Tint;82;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;883;3968,4960;Inherit;False;Property;_SpecularSaturation;Specular Saturation;64;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;859;4032,4320;Inherit;False;779;LightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1093;4467.425,3061.019;Inherit;False;Property;_EmissionMaskIntensity;Emission Mask Intensity;115;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;881;3984,4512;Inherit;False;Property;_HighlightRimlightTint;Highlight Rimlight Tint;57;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;860;4016,4384;Inherit;False;780;AmbientColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;894;4000,5312;Inherit;False;Property;_Shadow1Intensity;Shadow 1 Intensity;72;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;896;4000,5600;Inherit;False;Property;_Shadow2Intensity;Shadow 2 Intensity;77;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;887;4048,5024;Inherit;False;Property;_BaseIntensity;Base Intensity;67;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;972;3571.296,3437.541;Inherit;False;Property;_Shadow1EmissionIntensity;Shadow 1 Emission Intensity;74;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1046;3590.589,3127.735;Inherit;False;Property;_BodyLinesEmissionIntensity;Body Lines Emission Intensity;94;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1080;3936,5888;Inherit;False;Property;_ShadowRimlightBaseColor;Shadow Rimlight Base Color;0;0;Create;True;0;0;0;False;0;False;0.2392157,0.2392157,0.5294118,0;0.2392156,0.2392156,0.5294118,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;976;3592.526,3604.746;Inherit;False;Property;_ShadowRimlightEmissionIntensity;Shadow Rimlight Emission Intensity;69;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;880;3936,4448;Inherit;False;Property;_HighlightRimlightIntensity;Highlight Rimlight Intensity;55;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;882;3936,4672;Inherit;False;Property;_HighlightRimlightSaturation;Highlight Rimlight Saturation;58;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;3952,5536;Inherit;False;Property;_Shadow1Saturation;Shadow 1 Saturation;75;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;884;4032,4800;Inherit;False;Property;_SpecularTint;Specular Tint;63;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;969;3589.202,3203.927;Inherit;False;Property;_HighlightRimlightEmissionIntensity;Highlight Rimlight Emission Intensity;61;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;967;3584.651,2969.63;Inherit;False;Property;_ILMAlphaEmissionIntensity;ILM Alpha Emission Intensity;95;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;4016,4736;Inherit;False;Property;_SpecularIntensity;Specular Intensity;62;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;767;4032,3984;Inherit;False;339;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;768;4032,4064;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;918;3470.572,3676.176;Inherit;False;Ramp Creation - FighterZ;-1;;1533;1e90b445c7cf36f48acd4702d43c31c1;0;21;1;FLOAT;0;False;3;FLOAT;0;False;2;FLOAT;0;False;5;FLOAT;0;False;50;FLOAT;0;False;7;FLOAT;0;False;80;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;116;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;124;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;97;FLOAT;0;False;101;FLOAT;0;False;104;FLOAT;0;False;107;FLOAT;0;False;110;FLOAT;0;False;113;FLOAT;0;False;12;FLOAT;100;FLOAT;103;FLOAT;106;FLOAT;109;FLOAT;112;FLOAT;115;FLOAT;76;FLOAT;69;FLOAT;62;FLOAT;0;FLOAT;44;FLOAT;54
Node;AmplifyShaderEditor.RangedFloatNode;879;3936,6272;Inherit;False;Property;_ShadowRimlightSaturation;Shadow Rimlight Saturation;84;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1092;4099.26,2908.056;Inherit;True;Property;_EmissionMask;Emission Mask;114;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;968;3587.3,2900.72;Inherit;False;Property;_ILMAlphaLinesEmissionToggle;ILM Alpha Lines Emission Toggle;99;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;971;3614.296,3359.541;Inherit;False;Property;_BaseEmissionIntensity;Base Emission Intensity;80;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1054;5272.855,3593.24;Inherit;False;942.7314;474.8728;;5;1048;1051;1050;1053;1049;Detail Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;1091;4154.673,3311.612;Inherit;False;Emission - FighterZ;-1;;1536;2e32fe20ddeddef43b8b5dae014cc006;0;20;32;FLOAT;0;False;31;FLOAT;0;False;17;FLOAT;0;False;25;COLOR;0,0,0,0;False;24;FLOAT;0;False;20;FLOAT;0;False;26;FLOAT;0;False;27;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;22;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;21;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;871;1073.175,3157.493;Inherit;False;Property;_LightColorSetting;Light Color Setting;17;1;[Enum];Create;True;0;2;Automatic RECOMMENDED;0;Forced Fake;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1081;4352,3808;Inherit;False;Color Creation - FighterZ;-1;;1537;65c0143daf0e7e044831a9987d822acf;0;32;6;FLOAT;0;False;29;FLOAT;0;False;39;FLOAT;0;False;41;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;COLOR;0,0,0,0;False;10;FLOAT;0;False;64;FLOAT;0;False;11;COLOR;0,0,0,0;False;67;COLOR;0,0,0,0;False;75;FLOAT;1;False;76;COLOR;1,1,1,0;False;78;FLOAT;0;False;81;FLOAT;1;False;80;COLOR;1,1,1,0;False;79;FLOAT;0;False;83;FLOAT;1;False;82;COLOR;1,1,1,0;False;84;FLOAT;0;False;85;FLOAT;1;False;86;COLOR;1,1,1,0;False;87;FLOAT;0;False;89;FLOAT;1;False;88;COLOR;1,1,1,0;False;90;FLOAT;0;False;94;COLOR;0,0,0,0;False;91;FLOAT;1;False;92;COLOR;1,1,1,0;False;93;FLOAT;0;False;6;FLOAT3;1;FLOAT3;0;FLOAT3;3;FLOAT3;2;FLOAT3;5;FLOAT3;4
Node;AmplifyShaderEditor.GetLocalVarNode;1050;5535.163,3915.281;Inherit;False;807;Detail;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1051;5476.138,3734.509;Inherit;False;1029;DetailColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;872;1337.175,3156.493;Inherit;False;LightColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1027;-825.9841,3222.413;Inherit;False;DetailColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;787;4992,3808;Inherit;False;6;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;920;4697.346,3331.842;Inherit;False;EmissionRampMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;869;-1418.869,5197.192;Inherit;False;Property;_FakeGlobalLightIntensity;Fake Global Light Intensity;10;0;Create;True;0;0;0;False;0;False;0.4;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1053;5614.082,3643.24;Inherit;False;1027;DetailColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;988;-999.0661,2731.646;Inherit;False;ILM;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightAttenuation;632;-1386.781,4769.26;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1049;5785.235,3836.083;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1082;-1095.579,4794.144;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;544;-1397.316,4852.687;Inherit;False;450;IsThereWorldLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1055;5311.162,4009.043;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;867;-1410.6,5022.889;Inherit;False;Property;_FakeGlobalLightColor;Fake Global Light Color;8;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;998;6239.746,3653.975;Inherit;False;908.092;435.7986;;5;1005;1004;1003;1001;1000;ILM Color Swap;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;873;-1394.242,4939.973;Inherit;False;872;LightColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;977;-360.6802,5828.396;Inherit;False;1110.669;779.1093;;10;987;986;985;984;983;982;981;980;979;978;Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;950;-1420.3,5278.388;Inherit;False;Property;_MinimumGlobalLightIntensity;Minimum Global Light Intensity;16;0;Create;True;0;0;0;False;0;False;0.4;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1001;6510.002,3882.956;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1000;6444.151,3722.86;Inherit;False;992;ILMAColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;1048;6033.586,3872.51;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;960;-1099.532,4903.766;Inherit;False;Light Color Calculation;-1;;1544;5b8f5c3f2a647dc4d89d921c89ebb0e5;0;7;25;FLOAT;0;False;10;FLOAT;0;False;5;FLOAT;0;False;14;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;19;FLOAT;0;False;2;COLOR;0;COLOR;16
Node;AmplifyShaderEditor.GetLocalVarNode;978;-314.0615,6403.417;Inherit;False;357;ILMA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;979;-325.1011,6321.182;Inherit;False;988;ILM;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;993;-411.9348,2954.77;Inherit;False;ILMColorSetting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;980;-241.5962,5906.203;Inherit;False;Property;_DebugGroup;Debug Group;101;1;[Enum];Create;True;0;3;Vertex Colors;0;ILM Channels;1;Base Alpha;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;982;-310.1011,6495.182;Inherit;False;580;BaseA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1007;7869.434,3844.451;Inherit;False;974.2085;568.3684;;6;1088;1014;933;1012;1017;1013;Emission Combining;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;1004;6708.879,3809.969;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;981;-289.1011,6238.182;Inherit;False;Property;_ILMChannel;ILM Channel;103;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;997;5162.43,3797.217;Inherit;False;ColorOut;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;947;-656.3326,4968.768;Inherit;False;EmissionLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;944;-646.7944,4872.29;Inherit;False;GlobalLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;984;-100.0614,6348.417;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;985;-273.5961,5986.203;Inherit;False;Property;_DebugColor;Debug Color;59;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;983;-269.101,6154.182;Inherit;False;Property;_VertexChannel;Vertex Channel;56;1;[Enum];Create;True;0;5;All Channels;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1002;7177.65,3837.908;Inherit;False;469.1748;214.0239;;2;1009;1006;Apply Light Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1003;6672.543,3704.974;Inherit;False;993;ILMColorSetting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1014;7905.135,4206.898;Inherit;False;947;EmissionLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;7970.305,4125.229;Inherit;False;997;ColorOut;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;933;7942.427,4038.098;Inherit;False;Property;_EmissionIntensity;Emission Intensity;23;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1006;7227.65,3936.929;Inherit;False;944;GlobalLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;986;175.4907,6202.33;Inherit;False;Debug;-1;;1545;6f93fc90e278e9a449a8e28c4cbb4ee4;0;8;48;FLOAT;0;False;59;COLOR;0,0,0,0;False;47;FLOAT;0;False;50;FLOAT;0;False;54;COLOR;0,0,0,0;False;57;FLOAT;0;False;55;FLOAT;0;False;56;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;1005;6957.836,3892.584;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1013;7908.519,4287.22;Inherit;False;920;EmissionRampMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1008;8997.756,3937.71;Inherit;False;468.2808;338.5957;;3;1016;1015;1011;Enable Debug;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1009;7477.825,3887.907;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1017;8229.238,4113.698;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;987;520.625,6199.783;Inherit;False;Debug;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1059;2144,2816;Inherit;False;253;357;;4;1070;1069;1061;1071;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;915;6673.561,4175.573;Inherit;False;1161.307;700.3555;;10;1057;1056;908;909;910;912;911;904;907;1086;Outline;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;1088;8606.113,3963.61;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1011;9078.998,3987.709;Inherit;False;Property;_EnableDebug;Enable Debug;92;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1015;9047.756,4161.302;Inherit;False;987;Debug;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1058;1760,2816;Inherit;False;352;549;;7;1068;1067;1066;1065;1064;1063;1062;Stencil Buffer;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;517;1313.557,2944.454;Inherit;False;IsTherePointLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1070;2192,3072;Inherit;False;Property;_Units;Units;110;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1069;2192,3008;Inherit;False;Property;_Factor;Factor;109;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1064;1808,3120;Inherit;False;Property;_PassFront;Pass Front;104;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1063;1809,3184;Inherit;False;Property;_FailFront;Fail Front;106;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;6827.561,4754.573;Inherit;False;339;Base;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;908;6761.561,4607.573;Inherit;False;Property;_OutlineColorIntensity;Outline Color Intensity;90;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;909;6799.561,4442.573;Inherit;False;Property;_OutlineColor;Outline Color;89;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1061;2192,2880;Inherit;False;Property;_ZWriteMode;ZWrite Mode;108;2;[IntRange];[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1072;3078.384,3640.15;Inherit;False;myVarName;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1078;1743.728,2673.112;Inherit;False;Property;_Opacity;Opacity;111;0;Create;True;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1056;7238.736,4246.586;Inherit;False;Property;_EnableOutline;Enable Outline;86;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1066;1808,2992;Inherit;False;Property;_WriteMask;Write Mask;100;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;911;6721.561,4287.573;Inherit;False;Property;_EnableCameraDistanceMult;Enable Camera Distance Mult;88;1;[ToggleUI];Create;True;0;2;Disable;0;Enable;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1067;1808,2928;Inherit;False;Property;_ReadMask;Read Mask;98;1;[IntRange];Create;True;0;0;0;True;0;False;255;255;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;910;6833.561,4351.573;Inherit;False;Property;_DepthOffset;Depth Offset;15;0;Create;True;0;0;0;False;0;False;1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;6801.561,4223.573;Inherit;False;Property;_OutlineThickness;Outline Thickness;87;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;989;1494.345,2683.989;Inherit;False;Property;_EditorVersion;Editor Version;1;1;[Enum];Create;True;0;2;Basic;0;Advanced;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1062;1808,3248;Inherit;False;Property;_ZFailFront;ZFail Front;107;1;[Enum];Create;True;0;9;Default;0;Keep;1;Zero;2;Replace;3;IncrSat;4;DecrSat;5;Invert;6;IncrWrap;7;DecrWrap;8;1;UnityEngine.Rendering.StencilOp;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;1016;9264.536,4043.815;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;907;6723.561,4682.573;Inherit;False;Property;_OutlineEnableBaseColorMult;Outline Enable Base Color Mult;91;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1065;1808,3056;Inherit;False;Property;_Comparison;Comparison;102;1;[Enum];Create;True;0;9;Default;0;Greater;1;Greater or Equal;2;Less;3;Less or Equal;4;Equal;5;Not Equal;6;Always;7;Never;8;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1057;7155.288,4375.559;Inherit;False;ASWOutline;-1;;1546;ea9f2d47913480c4f9e91454af7efa45;0;7;33;FLOAT;0;False;47;FLOAT;0;False;127;FLOAT;0.5;False;35;COLOR;0,0,0,0;False;37;FLOAT;0;False;36;FLOAT;0;False;31;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT4;109
Node;AmplifyShaderEditor.RangedFloatNode;1068;1808,2864;Inherit;False;Property;_Reference;Reference;96;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;255;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1071;2192,2944;Inherit;False;Property;_ZTestMode;ZTest Mode;26;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1084;9610.994,4134.884;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardAdd;0;1;ForwardAdd;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;True;1;LightMode=ForwardAdd;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1086;7596.993,4366.784;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Outline;0;3;Outline;3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;True;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;1;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;CullMode=Front;RenderType=TransparentCutout=RenderType;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1083;9610.994,4024.884;Float;False;True;-1;2;ASWFighterZGUI;100;8;.Aerthas/Arc System Works/Game Select/FighterZ/Opaque v8.1.4;fd5163ddf7350f946aff871fd3d7e3fe;True;ForwardBase;0;0;ForwardBase;3;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;RenderType=Opaque=RenderType;VRCFallback=Toon;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;True;True;True;255;True;1068;255;True;1067;255;True;1066;7;True;1065;1;True;1064;1;True;1063;1;True;1062;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;1061;True;3;True;1071;True;True;0;True;1069;0;True;1070;True;1;LightMode=ForwardBase;True;2;0;;0;0;Standard;0;0;5;True;True;False;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1085;8477.993,3772.784;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;Deferred;0;2;Deferred;4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Deferred;True;2;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1087;8477.993,3602.784;Float;False;False;-1;2;ASEMaterialInspector;100;8;New Amplify Shader;fd5163ddf7350f946aff871fd3d7e3fe;True;ShadowCaster;0;4;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;True;1061;True;3;True;1071;False;True;1;LightMode=ShadowCaster;False;0;;0;0;Standard;0;False;0
WireConnection;762;0;296;1
WireConnection;762;1;296;2
WireConnection;762;2;296;3
WireConnection;763;0;297;1
WireConnection;763;1;297;2
WireConnection;763;2;297;3
WireConnection;585;0;762;0
WireConnection;585;1;763;0
WireConnection;1036;0;585;0
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
WireConnection;807;0;806;0
WireConnection;995;0;994;0
WireConnection;995;2;1036;0
WireConnection;995;3;764;0
WireConnection;1029;0;1028;0
WireConnection;280;0;274;1
WireConnection;280;1;274;2
WireConnection;280;2;274;3
WireConnection;586;0;995;0
WireConnection;992;0;990;0
WireConnection;1033;0;1037;0
WireConnection;1033;1;586;0
WireConnection;1034;0;1026;0
WireConnection;357;0;274;4
WireConnection;277;0;280;0
WireConnection;1030;0;1038;0
WireConnection;1030;1;586;0
WireConnection;1030;2;1037;0
WireConnection;450;0;634;0
WireConnection;563;0;535;0
WireConnection;561;0;533;0
WireConnection;292;0;277;0
WireConnection;1031;0;1034;0
WireConnection;1031;2;1030;0
WireConnection;1031;3;1033;0
WireConnection;580;0;296;4
WireConnection;1032;0;991;0
WireConnection;1021;0;1018;0
WireConnection;1021;1;1031;0
WireConnection;1020;0;1019;0
WireConnection;1020;1;1031;0
WireConnection;1020;2;1018;0
WireConnection;581;0;297;4
WireConnection;576;0;292;2
WireConnection;574;0;292;1
WireConnection;1022;0;1032;0
WireConnection;1022;2;1020;0
WireConnection;1022;3;1021;0
WireConnection;573;0;292;0
WireConnection;587;0;995;0
WireConnection;637;12;525;0
WireConnection;637;17;562;0
WireConnection;637;16;564;0
WireConnection;637;29;434;0
WireConnection;637;28;435;0
WireConnection;637;33;471;0
WireConnection;637;34;472;0
WireConnection;578;0;587;0
WireConnection;339;0;1022;0
WireConnection;780;0;778;0
WireConnection;779;0;777;0
WireConnection;1077;5;637;0
WireConnection;1077;21;637;42
WireConnection;1077;6;637;52
WireConnection;1077;3;639;0
WireConnection;1077;4;640;0
WireConnection;1077;1;706;0
WireConnection;1077;2;629;0
WireConnection;1077;11;707;0
WireConnection;1077;10;641;0
WireConnection;918;1;1077;0
WireConnection;918;3;1077;8
WireConnection;918;2;1077;9
WireConnection;918;5;753;0
WireConnection;918;50;738;0
WireConnection;918;7;729;0
WireConnection;918;80;758;0
WireConnection;918;8;746;0
WireConnection;918;9;711;0
WireConnection;918;116;1089;0
WireConnection;918;10;716;0
WireConnection;918;11;727;0
WireConnection;918;124;1090;0
WireConnection;918;12;731;0
WireConnection;918;13;732;0
WireConnection;918;97;922;0
WireConnection;918;101;923;0
WireConnection;918;104;924;0
WireConnection;918;107;925;0
WireConnection;918;110;926;0
WireConnection;918;113;927;0
WireConnection;1091;32;1092;0
WireConnection;1091;31;1093;0
WireConnection;1091;17;974;0
WireConnection;1091;25;1043;0
WireConnection;1091;24;968;0
WireConnection;1091;20;967;0
WireConnection;1091;26;1045;0
WireConnection;1091;27;1046;0
WireConnection;1091;6;969;0
WireConnection;1091;7;973;0
WireConnection;1091;8;971;0
WireConnection;1091;9;972;0
WireConnection;1091;10;975;0
WireConnection;1091;22;976;0
WireConnection;1091;1;918;100
WireConnection;1091;2;918;103
WireConnection;1091;3;918;106
WireConnection;1091;4;918;109
WireConnection;1091;5;918;112
WireConnection;1091;21;918;115
WireConnection;1081;6;918;76
WireConnection;1081;29;918;69
WireConnection;1081;39;918;62
WireConnection;1081;41;918;0
WireConnection;1081;50;918;44
WireConnection;1081;60;918;54
WireConnection;1081;7;767;0
WireConnection;1081;8;768;0
WireConnection;1081;9;793;0
WireConnection;1081;64;804;0
WireConnection;1081;11;859;0
WireConnection;1081;67;860;0
WireConnection;1081;75;880;0
WireConnection;1081;76;881;0
WireConnection;1081;78;882;0
WireConnection;1081;81;885;0
WireConnection;1081;80;884;0
WireConnection;1081;79;883;0
WireConnection;1081;83;887;0
WireConnection;1081;82;888;0
WireConnection;1081;84;889;0
WireConnection;1081;85;894;0
WireConnection;1081;86;893;0
WireConnection;1081;87;892;0
WireConnection;1081;89;896;0
WireConnection;1081;88;897;0
WireConnection;1081;90;898;0
WireConnection;1081;94;1080;0
WireConnection;1081;91;877;0
WireConnection;1081;92;878;0
WireConnection;1081;93;879;0
WireConnection;872;0;871;0
WireConnection;1027;0;1026;0
WireConnection;787;0;1081;1
WireConnection;787;1;1081;0
WireConnection;787;2;1081;3
WireConnection;787;3;1081;2
WireConnection;787;4;1081;5
WireConnection;787;5;1081;4
WireConnection;920;0;1091;0
WireConnection;988;0;277;0
WireConnection;1049;0;1051;0
WireConnection;1049;1;787;0
WireConnection;1049;2;1050;0
WireConnection;1055;0;787;0
WireConnection;1048;0;1053;0
WireConnection;1048;2;1049;0
WireConnection;1048;3;1055;0
WireConnection;960;25;1082;0
WireConnection;960;10;632;0
WireConnection;960;5;544;0
WireConnection;960;14;873;0
WireConnection;960;6;867;0
WireConnection;960;7;869;0
WireConnection;960;19;950;0
WireConnection;993;0;991;0
WireConnection;1004;0;1000;0
WireConnection;1004;1;1048;0
WireConnection;1004;2;1001;0
WireConnection;997;0;787;0
WireConnection;947;0;960;16
WireConnection;944;0;960;0
WireConnection;984;0;979;0
WireConnection;984;3;978;0
WireConnection;986;48;980;0
WireConnection;986;59;985;0
WireConnection;986;47;983;0
WireConnection;986;50;981;0
WireConnection;986;54;984;0
WireConnection;986;55;982;0
WireConnection;1005;0;1003;0
WireConnection;1005;2;1004;0
WireConnection;1005;3;1048;0
WireConnection;1009;0;1005;0
WireConnection;1009;1;1006;0
WireConnection;1017;0;933;0
WireConnection;1017;1;1012;0
WireConnection;1017;2;1014;0
WireConnection;987;0;986;0
WireConnection;1088;0;1009;0
WireConnection;1088;1;1017;0
WireConnection;1088;2;1013;0
WireConnection;517;0;634;15
WireConnection;1072;0;1077;0
WireConnection;1016;0;1011;0
WireConnection;1016;2;1088;0
WireConnection;1016;3;1015;0
WireConnection;1057;33;912;0
WireConnection;1057;47;911;0
WireConnection;1057;127;910;0
WireConnection;1057;35;909;0
WireConnection;1057;37;908;0
WireConnection;1057;36;907;0
WireConnection;1057;31;904;0
WireConnection;1086;0;1057;0
WireConnection;1086;1;1056;0
WireConnection;1086;2;1057;109
WireConnection;1083;0;1016;0
ASEEND*/
//CHKSM=92685F4CF15D5FDDA0AFEDB91F59A716DC37F634
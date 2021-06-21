Shader /*ase_name*/ "Hidden/ASW/BaseTemplate" /*end*/
{
	Properties
	{
		/*ase_props*/
	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Cull Off
		CGINCLUDE
		#pragma target 3.0
		ENDCG

		/*ase_pass*/
		Pass
		{
			/*ase_main_pass*/
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			/*ase_all_modules*/
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			/*ase_pragma*/
			/*ase_globals*/

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				/*ase_vdata:p=p;n=n*/
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				/*ase_interp(1,):sp=sp.xyzw*/
			};

			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				/*ase_vert_code:v=appdata;o=v2f*/

				v.vertex.xyz += /*ase_vert_out:Local Vertex;Float3;_Vertex*/ float3(0,0,0) /*end*/;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				/*ase_frag_code:i=v2f*/

				outColor = /*ase_frag_out:Color;Float3;_Color*/float3(1,1,1)/*end*/;
				outAlpha = /*ase_frag_out:Alpha;Float;_Alpha*/1/*end*/;
				clip(outAlpha);
				return float4(outColor,outAlpha);
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			Name "ForwardAdd"
			Tags { "LightMode" = "ForwardAdd" }
			ZWrite Off
			Blend One One
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdadd_fullshadows
			#include "UnityCG.cginc"
			/*ase_pragma*/
			/*ase_globals*/

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				/*ase_vdata:p=p;n=n*/
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				/*ase_interp(1,):sp=sp.xyzw*/
			};

			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				/*ase_vert_code:v=appdata;o=v2f*/

				v.vertex.xyz += /*ase_vert_out:Local Vertex;Float3;_Vertex*/ float3(0,0,0) /*end*/;
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

			float4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				/*ase_frag_code:i=v2f*/

				outColor = /*ase_frag_out:Color;Float3;_Color*/float3(1,1,1)/*end*/;
				outAlpha = /*ase_frag_out:Alpha;Float;_Alpha*/1/*end*/;
				clip(outAlpha);
				return float4(outColor,outAlpha);
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			Name "Deferred"
			Tags { "LightMode" = "Deferred" }

			/*ase_all_modules*/
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_prepassfinal
			#include "UnityCG.cginc"
			/*ase_pragma*/
			/*ase_globals*/

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				/*ase_vdata:p=p;n=n*/
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				/*ase_interp(1,):sp=sp.xyzw*/
			};

			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				/*ase_vert_code:v=appdata;o=v2f*/

				v.vertex.xyz += /*ase_vert_out:Local Vertex;Float3;_Vertex*/ float3(0,0,0) /*end*/;
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

			void frag (v2f i /*ase_frag_input*/, out half4 outGBuffer0 : SV_Target0, out half4 outGBuffer1 : SV_Target1, out half4 outGBuffer2 : SV_Target2, out half4 outGBuffer3 : SV_Target3)
			{
				/*ase_frag_code:i=v2f*/

				outGBuffer0 = /*ase_frag_out:GBuffer0;Float4*/0/*end*/;
				outGBuffer1 = /*ase_frag_out:GBuffer1;Float4*/0/*end*/;
				outGBuffer2 = /*ase_frag_out:GBuffer2;Float4*/0/*end*/;
				outGBuffer3 = /*ase_frag_out:GBuffer3;Float4*/0/*end*/;
			}
			ENDCG
		}
		/*ase_pass*/
		Pass
		{
			Name "Outline"
			Tags { "CullMode" = "Front" }
			/*ase_all_modules*/
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			/*ase_pragma*/

			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				/*ase_vdata:p=p*/
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				/*ase_interp(0,):sp=sp.xyzw*/
			};

			/*ase_globals*/

			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				/*ase_vert_code:v=appdata;o=v2f*/

				v.vertex.xyz += /*ase_vert_out:Local Vertex;Float3*/ float3(0,0,0) /*end*/;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				float3 outOutlineColor;
				float outOutlineAlpha;

				/*ase_frag_code:i=v2f*/

				outOutlineColor = /*ase_frag_out:Color;Float3;_OutlineColor*/float3(1,1,1)/*end*/;
				outOutlineAlpha = /*ase_frag_out:Alpha;Float;_OutlineAlpha*/1/*end*/;
				clip(outOutlineAlpha);
				return float4(outOutlineColor,outOutlineAlpha);
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_hide_pass:SyncP*/
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite On
			ZTest LEqual
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_shadowcaster
			#include "UnityCG.cginc"
			/*ase_pragma*/
			/*ase_globals*/

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				/*ase_vdata:p=p;n=n*/
			};

			struct v2f
			{
				V2F_SHADOW_CASTER;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				/*ase_interp(1,):sp=sp.xyzw*/
			};


			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				/*ase_vert_code:v=appdata;o=v2f*/

				v.vertex.xyz += /*ase_vert_out:Local Vertex;Float3;_Vertex*/ float3(0,0,0) /*end*/;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}

			float4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				float3 outColor;
				float outAlpha;

				/*ase_frag_code:i=v2f*/

				outColor = /*ase_frag_out:Color;Float3;_Color*/float3(1,1,1)/*end*/;
				outAlpha = /*ase_frag_out:Alpha;Float;_Alpha*/1/*end*/;
				clip(outAlpha);
				SHADOW_CASTER_FRAGMENT(i)
			}
			ENDCG
		}
		/*ase_pass_end*/
	}
	CustomEditor "ASEMaterialInspector"
}

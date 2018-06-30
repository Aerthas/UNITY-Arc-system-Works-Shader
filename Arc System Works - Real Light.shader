// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33740,y:32644,varname:node_9361,prsc:2|emission-5252-OUT,custl-1941-OUT,olwid-6939-OUT,olcol-2254-OUT;n:type:ShaderForge.SFN_NormalVector,id:9684,x:30934,y:32471,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:7782,x:31218,y:32426,cmnt:Lambert,varname:node_7782,prsc:2,dt:1|A-9167-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32123,y:33114,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1941,x:32791,y:33027,cmnt:Diffuse Contribution,varname:node_1941,prsc:2|A-2455-OUT,B-5169-OUT;n:type:ShaderForge.SFN_AmbientLight,id:7528,x:32726,y:32482,varname:node_7528,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2460,x:33282,y:32776,cmnt:Ambient Light,varname:node_2460,prsc:2|A-6379-OUT,B-851-RGB;n:type:ShaderForge.SFN_Multiply,id:5169,x:32380,y:32297,varname:node_5169,prsc:2|A-1106-OUT,B-5644-RGB;n:type:ShaderForge.SFN_Multiply,id:8712,x:31599,y:32313,varname:node_8712,prsc:2|A-7383-OUT,B-2258-OUT;n:type:ShaderForge.SFN_Floor,id:4270,x:31946,y:32313,varname:node_4270,prsc:2|IN-9408-OUT;n:type:ShaderForge.SFN_Lerp,id:1106,x:32292,y:31868,varname:node_1106,prsc:2|A-1726-OUT,B-8407-OUT,T-3908-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6765,x:31835,y:31631,ptovrint:False,ptlb:Shadow Brightness,ptin:_ShadowBrightness,varname:_Light_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.4;n:type:ShaderForge.SFN_ValueProperty,id:8407,x:31858,y:31982,ptovrint:False,ptlb:Light Intensity,ptin:_LightIntensity,varname:node_7268,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Clamp,id:495,x:32924,y:32531,varname:node_495,prsc:2|IN-7528-RGB,MIN-8980-OUT,MAX-9987-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9987,x:32744,y:32716,ptovrint:False,ptlb:AmbMax,ptin:_AmbMax,varname:_AmbMin_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:8980,x:32744,y:32641,ptovrint:False,ptlb:AmbMin,ptin:_AmbMin,varname:node_588,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_ValueProperty,id:3362,x:33189,y:33271,ptovrint:False,ptlb:Outline Thickness,ptin:_OutlineThickness,varname:node_3362,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:2254,x:32739,y:33296,varname:node_2254,prsc:2|A-851-RGB,B-293-RGB;n:type:ShaderForge.SFN_Color,id:293,x:32549,y:33416,ptovrint:False,ptlb:Outline Color,ptin:_OutlineColor,varname:node_293,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1726,x:32061,y:31704,varname:node_1726,prsc:2|A-6765-OUT,B-6922-RGB;n:type:ShaderForge.SFN_Tex2d,id:6922,x:31835,y:31728,ptovrint:False,ptlb:SSS,ptin:_SSS,varname:node_6922,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6379,x:33104,y:32567,varname:node_6379,prsc:2|A-495-OUT,B-6240-RGB;n:type:ShaderForge.SFN_Color,id:6240,x:32901,y:32706,ptovrint:False,ptlb:Shadow Tint,ptin:_ShadowTint,varname:node_6240,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6705883,c2:0.6705883,c3:0.6705883,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:2258,x:31366,y:32498,ptovrint:False,ptlb:shadow_push,ptin:_shadow_push,varname:node_2258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:704.47;n:type:ShaderForge.SFN_Tex2d,id:8282,x:32067,y:32830,ptovrint:False,ptlb:ILM,ptin:_ILM,varname:node_8282,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:2455,x:32335,y:32792,varname:node_2455,prsc:2|A-3137-OUT,B-851-RGB,T-8282-A;n:type:ShaderForge.SFN_Vector1,id:3137,x:32067,y:32750,varname:node_3137,prsc:2,v1:-1;n:type:ShaderForge.SFN_ConstantClamp,id:9408,x:31783,y:32313,varname:node_9408,prsc:2,min:0,max:1|IN-8712-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3908,x:32100,y:32178,varname:node_3908,prsc:2,min:0,max:5|IN-4270-OUT;n:type:ShaderForge.SFN_Multiply,id:6939,x:33395,y:33201,varname:node_6939,prsc:2|A-3362-OUT,B-2787-OUT;n:type:ShaderForge.SFN_Vector1,id:2787,x:33178,y:33319,varname:node_2787,prsc:2,v1:1E-05;n:type:ShaderForge.SFN_Code,id:3845,x:32973,y:32994,varname:node_3845,prsc:2,code:QwByAGUAYQB0AGUAZAAgAGIAeQAgAFMAaABhAG0AdwBvAHcAIABhAG4AZAAgAEEAZQByAHQAaABhAHMAIABWAGUAcgBhAHMACgBQAGwAcwAgAG4AbwAgAGIAdQBsAGwAaQA=,output:2,fname:Function_node_3845,width:289,height:132;n:type:ShaderForge.SFN_Add,id:5252,x:33555,y:32644,varname:node_5252,prsc:2|A-479-OUT,B-2460-OUT;n:type:ShaderForge.SFN_Multiply,id:3172,x:33315,y:32273,varname:node_3172,prsc:2|A-725-RGB,B-9505-OUT;n:type:ShaderForge.SFN_Tex2d,id:725,x:33120,y:32273,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_725,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9505,x:33120,y:32457,ptovrint:False,ptlb:Emission Intensity,ptin:_EmissionIntensity,varname:node_9505,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:479,x:33536,y:32369,varname:node_479,prsc:2|A-3172-OUT,B-5118-RGB;n:type:ShaderForge.SFN_Color,id:5118,x:33315,y:32413,ptovrint:False,ptlb:Emission Tint,ptin:_EmissionTint,varname:node_5118,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7383,x:31431,y:32286,varname:node_7383,prsc:2|A-7782-OUT,B-5414-OUT;n:type:ShaderForge.SFN_LightVector,id:9167,x:30863,y:32260,varname:node_9167,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:5414,x:31008,y:32101,varname:node_5414,prsc:2;n:type:ShaderForge.SFN_LightColor,id:5644,x:32166,y:32369,varname:node_5644,prsc:2;proporder:851-8282-6922-725-9505-5118-6765-8407-9987-8980-3362-293-6240-2258;pass:END;sub:END;*/

Shader "Arc System Works/Real Light" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _ILM ("ILM", 2D) = "white" {}
        _SSS ("SSS", 2D) = "white" {}
        _Emission ("Emission", 2D) = "white" {}
        _EmissionIntensity ("Emission Intensity", Float ) = 0
        _EmissionTint ("Emission Tint", Color) = (1,1,1,1)
        _ShadowBrightness ("Shadow Brightness", Float ) = 0.4
        _LightIntensity ("Light Intensity", Float ) = 1
        _AmbMax ("AmbMax", Float ) = 1
        _AmbMin ("AmbMin", Float ) = 0.2
        _OutlineThickness ("Outline Thickness", Float ) = 2
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _ShadowTint ("Shadow Tint", Color) = (0.6705883,0.6705883,0.6705883,1)
        _shadow_push ("shadow_push", Float ) = 704.47
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _OutlineThickness;
            uniform float4 _OutlineColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*(_OutlineThickness*0.00001),1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                return fixed4((_Diffuse_var.rgb*_OutlineColor.rgb),0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _ShadowBrightness;
            uniform float _LightIntensity;
            uniform float _AmbMax;
            uniform float _AmbMin;
            uniform sampler2D _SSS; uniform float4 _SSS_ST;
            uniform float4 _ShadowTint;
            uniform float _shadow_push;
            uniform sampler2D _ILM; uniform float4 _ILM_ST;
            uniform sampler2D _Emission; uniform float4 _Emission_ST;
            uniform float _EmissionIntensity;
            uniform float4 _EmissionTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _Emission_var = tex2D(_Emission,TRANSFORM_TEX(i.uv0, _Emission));
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 emissive = (((_Emission_var.rgb*_EmissionIntensity)*_EmissionTint.rgb)+((clamp(UNITY_LIGHTMODEL_AMBIENT.rgb,_AmbMin,_AmbMax)*_ShadowTint.rgb)*_Diffuse_var.rgb));
                float node_3137 = (-1.0);
                float4 _ILM_var = tex2D(_ILM,TRANSFORM_TEX(i.uv0, _ILM));
                float4 _SSS_var = tex2D(_SSS,TRANSFORM_TEX(i.uv0, _SSS));
                float3 finalColor = emissive + (lerp(float3(node_3137,node_3137,node_3137),_Diffuse_var.rgb,_ILM_var.a)*(lerp((_ShadowBrightness*_SSS_var.rgb),float3(_LightIntensity,_LightIntensity,_LightIntensity),clamp(floor(clamp(((max(0,dot(lightDirection,normalDirection))*attenuation)*_shadow_push),0,1)),0,5))*_LightColor0.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _ShadowBrightness;
            uniform float _LightIntensity;
            uniform float _AmbMax;
            uniform float _AmbMin;
            uniform sampler2D _SSS; uniform float4 _SSS_ST;
            uniform float4 _ShadowTint;
            uniform float _shadow_push;
            uniform sampler2D _ILM; uniform float4 _ILM_ST;
            uniform sampler2D _Emission; uniform float4 _Emission_ST;
            uniform float _EmissionIntensity;
            uniform float4 _EmissionTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float node_3137 = (-1.0);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float4 _ILM_var = tex2D(_ILM,TRANSFORM_TEX(i.uv0, _ILM));
                float4 _SSS_var = tex2D(_SSS,TRANSFORM_TEX(i.uv0, _SSS));
                float3 finalColor = (lerp(float3(node_3137,node_3137,node_3137),_Diffuse_var.rgb,_ILM_var.a)*(lerp((_ShadowBrightness*_SSS_var.rgb),float3(_LightIntensity,_LightIntensity,_LightIntensity),clamp(floor(clamp(((max(0,dot(lightDirection,normalDirection))*attenuation)*_shadow_push),0,1)),0,5))*_LightColor0.rgb));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

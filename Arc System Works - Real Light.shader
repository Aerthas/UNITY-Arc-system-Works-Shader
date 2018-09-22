// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34660,y:33607,varname:node_9361,prsc:2|emission-2727-OUT,custl-1941-OUT,olwid-6939-OUT,olcol-2254-OUT;n:type:ShaderForge.SFN_NormalVector,id:9684,x:30739,y:32137,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:7782,x:30910,y:32015,cmnt:Lambert,varname:node_7782,prsc:2,dt:1|A-9167-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32269,y:33116,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1941,x:32711,y:32970,cmnt:Diffuse Contribution,varname:node_1941,prsc:2|A-5169-OUT,B-5502-OUT;n:type:ShaderForge.SFN_AmbientLight,id:7528,x:32726,y:32482,varname:node_7528,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2460,x:33338,y:32846,cmnt:Ambient Light,varname:node_2460,prsc:2|A-6379-OUT,B-5502-OUT;n:type:ShaderForge.SFN_Multiply,id:5169,x:32579,y:32324,varname:node_5169,prsc:2|A-7552-OUT,B-5644-RGB;n:type:ShaderForge.SFN_Multiply,id:8712,x:31272,y:32015,varname:node_8712,prsc:2|A-2258-OUT,B-7383-OUT;n:type:ShaderForge.SFN_Floor,id:4270,x:31597,y:32015,varname:node_4270,prsc:2|IN-9408-OUT;n:type:ShaderForge.SFN_Lerp,id:1106,x:32337,y:31881,varname:node_1106,prsc:2|A-1726-OUT,B-8407-OUT,T-3908-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6765,x:31835,y:31631,ptovrint:False,ptlb:Shadow Brightness,ptin:_ShadowBrightness,varname:_Light_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.03;n:type:ShaderForge.SFN_ValueProperty,id:8407,x:32061,y:31868,ptovrint:False,ptlb:Light Intensity,ptin:_LightIntensity,varname:node_7268,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Clamp,id:495,x:32924,y:32531,varname:node_495,prsc:2|IN-7528-RGB,MIN-8980-OUT,MAX-9987-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9987,x:32744,y:32716,ptovrint:False,ptlb:AmbMax,ptin:_AmbMax,varname:_AmbMin_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:8980,x:32744,y:32641,ptovrint:False,ptlb:AmbMin,ptin:_AmbMin,varname:node_588,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_ValueProperty,id:3362,x:33189,y:33271,ptovrint:False,ptlb:Outline Thickness,ptin:_OutlineThickness,varname:node_3362,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:2254,x:32907,y:33270,varname:node_2254,prsc:2|A-5502-OUT,B-293-RGB,C-2548-OUT;n:type:ShaderForge.SFN_Color,id:293,x:32549,y:33416,ptovrint:False,ptlb:Outline Color,ptin:_OutlineColor,varname:node_293,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1726,x:32276,y:31745,varname:node_1726,prsc:2|A-6765-OUT,B-6922-RGB;n:type:ShaderForge.SFN_Tex2d,id:6922,x:31835,y:31728,ptovrint:False,ptlb:SSS,ptin:_SSS,varname:node_6922,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6379,x:33118,y:32531,varname:node_6379,prsc:2|A-495-OUT,B-6240-RGB;n:type:ShaderForge.SFN_Color,id:6240,x:32868,y:32754,ptovrint:False,ptlb:Shadow Tint,ptin:_ShadowTint,varname:node_6240,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4196078,c2:0.4196078,c3:0.4196078,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:2258,x:31105,y:31942,ptovrint:False,ptlb:Shadow Push,ptin:_ShadowPush,varname:node_2258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:700;n:type:ShaderForge.SFN_Tex2d,id:8282,x:32522,y:31728,ptovrint:False,ptlb:ILM,ptin:_ILM,varname:node_8282,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:2455,x:33989,y:32737,varname:node_2455,prsc:2|A-3137-OUT,B-5252-OUT,T-8282-A;n:type:ShaderForge.SFN_Vector1,id:3137,x:33800,y:32689,varname:node_3137,prsc:2,v1:-1;n:type:ShaderForge.SFN_ConstantClamp,id:9408,x:31436,y:32015,varname:node_9408,prsc:2,min:0,max:1|IN-8712-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3908,x:31766,y:32015,varname:node_3908,prsc:2,min:0,max:5|IN-4270-OUT;n:type:ShaderForge.SFN_Multiply,id:6939,x:33395,y:33201,varname:node_6939,prsc:2|A-3362-OUT,B-2787-OUT;n:type:ShaderForge.SFN_Vector1,id:2787,x:33178,y:33319,varname:node_2787,prsc:2,v1:1E-05;n:type:ShaderForge.SFN_Code,id:3845,x:32973,y:32994,varname:node_3845,prsc:2,code:QwByAGUAYQB0AGUAZAAgAGIAeQAgAFMAaABhAG0AdwBvAHcAIABhAG4AZAAgAEEAZQByAHQAaABhAHMAIABWAGUAcgBhAHMACgBQAGwAcwAgAG4AbwAgAGIAdQBsAGwAaQA=,output:2,fname:Function_node_3845,width:289,height:132;n:type:ShaderForge.SFN_Add,id:5252,x:33670,y:32743,varname:node_5252,prsc:2|A-479-OUT,B-2460-OUT;n:type:ShaderForge.SFN_Multiply,id:3172,x:33327,y:32216,varname:node_3172,prsc:2|A-725-RGB,B-9505-OUT;n:type:ShaderForge.SFN_Tex2d,id:725,x:33082,y:32216,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_725,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9505,x:33082,y:32406,ptovrint:False,ptlb:Emission Intensity,ptin:_EmissionIntensity,varname:node_9505,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:479,x:33522,y:32393,varname:node_479,prsc:2|A-3172-OUT,B-5118-RGB;n:type:ShaderForge.SFN_Color,id:5118,x:33327,y:32406,ptovrint:False,ptlb:Emission Tint,ptin:_EmissionTint,varname:node_5118,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7383,x:31076,y:32054,varname:node_7383,prsc:2|A-5414-OUT,B-7782-OUT;n:type:ShaderForge.SFN_LightVector,id:9167,x:30739,y:32015,varname:node_9167,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:5414,x:30910,y:31897,varname:node_5414,prsc:2;n:type:ShaderForge.SFN_LightColor,id:5644,x:32367,y:32376,varname:node_5644,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:9929,x:31072,y:32242,ptovrint:False,ptlb:Shine Push,ptin:_ShinePush,varname:_shadow_push_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.02;n:type:ShaderForge.SFN_Multiply,id:5754,x:31273,y:32159,varname:node_5754,prsc:2|A-7383-OUT,B-9929-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:7170,x:31436,y:32159,varname:node_7170,prsc:2,min:0,max:2|IN-5754-OUT;n:type:ShaderForge.SFN_Floor,id:1834,x:31597,y:32159,varname:node_1834,prsc:2|IN-7170-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3200,x:31766,y:32159,varname:node_3200,prsc:2,min:0,max:5|IN-1834-OUT;n:type:ShaderForge.SFN_Add,id:5540,x:32527,y:32049,varname:node_5540,prsc:2|A-1106-OUT,B-4140-OUT;n:type:ShaderForge.SFN_Lerp,id:4140,x:32225,y:32221,varname:node_4140,prsc:2|A-7938-OUT,B-1801-OUT,T-3200-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1801,x:31962,y:32123,ptovrint:False,ptlb:Shine Brightness,ptin:_ShineBrightness,varname:_LightIntensity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:7938,x:31996,y:32042,varname:node_7938,prsc:2,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2548,x:32809,y:33468,ptovrint:False,ptlb:Outline Brightness,ptin:_OutlineBrightness,varname:node_2548,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Subtract,id:1439,x:33913,y:33004,varname:node_1439,prsc:2|A-2455-OUT,B-5252-OUT;n:type:ShaderForge.SFN_Add,id:2727,x:34422,y:33034,varname:node_2727,prsc:2|A-2455-OUT,B-4601-OUT;n:type:ShaderForge.SFN_Multiply,id:7480,x:34116,y:33158,varname:node_7480,prsc:2|A-1439-OUT,B-4396-RGB,C-6724-OUT;n:type:ShaderForge.SFN_Color,id:4396,x:33836,y:33170,ptovrint:False,ptlb:Body Lines Color,ptin:_BodyLinesColor,varname:node_4396,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Vector1,id:6724,x:33906,y:33332,varname:node_6724,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:4601,x:34158,y:33332,varname:node_4601,prsc:2|A-7480-OUT,B-3767-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3767,x:33982,y:33421,ptovrint:False,ptlb:Body Lines Brightness,ptin:_BodyLinesBrightness,varname:node_3767,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:831,x:32307,y:33356,ptovrint:False,ptlb:Diffuse Tint,ptin:_DiffuseTint,varname:node_831,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5502,x:32484,y:33133,varname:node_5502,prsc:2|A-851-RGB,B-831-RGB;n:type:ShaderForge.SFN_Add,id:7552,x:32838,y:31954,varname:node_7552,prsc:2|A-581-OUT,B-5540-OUT;n:type:ShaderForge.SFN_Multiply,id:581,x:32773,y:31712,varname:node_581,prsc:2|A-8282-G,B-3126-OUT;n:type:ShaderForge.SFN_Vector1,id:3126,x:32553,y:31915,varname:node_3126,prsc:2,v1:2;proporder:851-8282-6922-725-831-9505-5118-8407-9987-8980-3362-2548-293-3767-4396-2258-6765-6240-9929-1801;pass:END;sub:END;*/

Shader "Arc System Works/Real Light" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _ILM ("ILM", 2D) = "white" {}
        _SSS ("SSS", 2D) = "white" {}
        _Emission ("Emission", 2D) = "white" {}
        _DiffuseTint ("Diffuse Tint", Color) = (1,1,1,1)
        _EmissionIntensity ("Emission Intensity", Float ) = 0
        _EmissionTint ("Emission Tint", Color) = (1,1,1,1)
        _LightIntensity ("Light Intensity", Float ) = 1
        _AmbMax ("AmbMax", Float ) = 1
        _AmbMin ("AmbMin", Float ) = 0.2
        _OutlineThickness ("Outline Thickness", Float ) = 2
        _OutlineBrightness ("Outline Brightness", Float ) = 1
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _BodyLinesBrightness ("Body Lines Brightness", Float ) = 1
        _BodyLinesColor ("Body Lines Color", Color) = (0,0,0,1)
        _ShadowPush ("Shadow Push", Float ) = 700
        _ShadowBrightness ("Shadow Brightness", Float ) = 0.03
        _ShadowTint ("Shadow Tint", Color) = (0.4196078,0.4196078,0.4196078,1)
        _ShinePush ("Shine Push", Float ) = 1.02
        _ShineBrightness ("Shine Brightness", Float ) = 0.5
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
            uniform float _OutlineBrightness;
            uniform float4 _DiffuseTint;
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
                float3 node_5502 = (_Diffuse_var.rgb*_DiffuseTint.rgb);
                return fixed4((node_5502*_OutlineColor.rgb*_OutlineBrightness),0);
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
            uniform float _ShadowPush;
            uniform sampler2D _ILM; uniform float4 _ILM_ST;
            uniform sampler2D _Emission; uniform float4 _Emission_ST;
            uniform float _EmissionIntensity;
            uniform float4 _EmissionTint;
            uniform float _ShinePush;
            uniform float _ShineBrightness;
            uniform float4 _BodyLinesColor;
            uniform float _BodyLinesBrightness;
            uniform float4 _DiffuseTint;
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
                float node_3137 = (-1.0);
                float4 _Emission_var = tex2D(_Emission,TRANSFORM_TEX(i.uv0, _Emission));
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 node_5502 = (_Diffuse_var.rgb*_DiffuseTint.rgb);
                float3 node_5252 = (((_Emission_var.rgb*_EmissionIntensity)*_EmissionTint.rgb)+((clamp(UNITY_LIGHTMODEL_AMBIENT.rgb,_AmbMin,_AmbMax)*_ShadowTint.rgb)*node_5502));
                float4 _ILM_var = tex2D(_ILM,TRANSFORM_TEX(i.uv0, _ILM));
                float3 node_2455 = lerp(float3(node_3137,node_3137,node_3137),node_5252,_ILM_var.a);
                float3 emissive = (node_2455+(((node_2455-node_5252)*_BodyLinesColor.rgb*(-1.0))*_BodyLinesBrightness));
                float4 _SSS_var = tex2D(_SSS,TRANSFORM_TEX(i.uv0, _SSS));
                float node_7383 = (attenuation*max(0,dot(lightDirection,normalDirection)));
                float3 finalColor = emissive + ((((_ILM_var.g*2.0)+(lerp((_ShadowBrightness*_SSS_var.rgb),float3(_LightIntensity,_LightIntensity,_LightIntensity),clamp(floor(clamp((_ShadowPush*node_7383),0,1)),0,5))+lerp(0.0,_ShineBrightness,clamp(floor(clamp((node_7383*_ShinePush),0,2)),0,5))))*_LightColor0.rgb)*node_5502);
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
            uniform float _ShadowPush;
            uniform sampler2D _ILM; uniform float4 _ILM_ST;
            uniform sampler2D _Emission; uniform float4 _Emission_ST;
            uniform float _EmissionIntensity;
            uniform float4 _EmissionTint;
            uniform float _ShinePush;
            uniform float _ShineBrightness;
            uniform float4 _BodyLinesColor;
            uniform float _BodyLinesBrightness;
            uniform float4 _DiffuseTint;
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
                float4 _ILM_var = tex2D(_ILM,TRANSFORM_TEX(i.uv0, _ILM));
                float4 _SSS_var = tex2D(_SSS,TRANSFORM_TEX(i.uv0, _SSS));
                float node_7383 = (attenuation*max(0,dot(lightDirection,normalDirection)));
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 node_5502 = (_Diffuse_var.rgb*_DiffuseTint.rgb);
                float3 finalColor = ((((_ILM_var.g*2.0)+(lerp((_ShadowBrightness*_SSS_var.rgb),float3(_LightIntensity,_LightIntensity,_LightIntensity),clamp(floor(clamp((_ShadowPush*node_7383),0,1)),0,5))+lerp(0.0,_ShineBrightness,clamp(floor(clamp((node_7383*_ShinePush),0,2)),0,5))))*_LightColor0.rgb)*node_5502);
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

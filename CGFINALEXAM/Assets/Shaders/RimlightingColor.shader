Shader "Custom/RimlightingColor"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white"{}
        _ColorTint("Tint", Color) = (1.0, 0.6, 0.6, 1.0)
        _RimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
      _RimPower("Rim Power", Range(0.5, 0.8)) = 3.0
    }
    SubShader
    {
      Tags{
            "RenderType" = "Opaque" "Queue" = "Transparent"
            }
             Pass{
            ZWrite On
            ColorMask 0
            }
        CGPROGRAM

        #pragma surface surf Lambert finalcolor:mycolor
       
        struct Input{
            float2 uv_MainTex;
            float3 viewDir;
            };
        fixed4 _ColorTint;
        
        void mycolor (Input IN, SurfaceOutput o, inout fixed4 color){
            
            color *= _ColorTint;
            }
      
        sampler2D _MainTex;
        float4 _RimColor;
        float _RimPower;
        
        void surf (Input IN, inout SurfaceOutput o){
            o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = (_RimColor.rgb * pow(rim, _RimPower) * 10) +_SinTime.r;
            o.Alpha = pow(rim, _RimPower) +_SinTime.a;
            }
        ENDCG
    }
    FallBack "Diffuse"
}

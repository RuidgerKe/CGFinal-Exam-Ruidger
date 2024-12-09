Shader "Custom/CoinShader"
{
    Properties
    {
         _Color ("Color", Color) = (1, 1, 1, 1)
        _GoldTex ("Metallic (R)", 2D) = "white"{}
        
        _SpecColor ("Specular", Color) = (1, 1, 1, 1)
          _Outline ("OutlineWidth", Range(-1,1)) = 0
      _OutlineColor ("Color", Color) = (0, 0, 0, 1)
    }
    SubShader
    {
        Tags{
            "Queue" = "Geometry"
            }
         ZWrite off
         CGPROGRAM
      #pragma surface surf Lambert vertex:vert 

      struct Input {
          float2 uv_MainTex;
          };
        float _Outline;
        float4 _OutlineColor;
           void vert (inout appdata_full v) {
         v.vertex.xyz+= v.normal* _Outline;

         }
         sampler2D _MainTex;
        void surf (Input IN, inout SurfaceOutput o){
          o.Emission = _OutlineColor.rgb;

          }
        ENDCG
        ZWrite on
        CGPROGRAM
        #pragma surface surf StandardSpecular

        sampler2D _GoldTex;
        half _Metallic;
        fixed4 _Color;

        struct Input 
        {
            float2 uv_MetallicTex;
        };

        void surf(Input IN, inout SurfaceOutputStandardSpecular o)
        {
            o.Albedo = _Color.rgb;
            o.Smoothness = tex2D (_GoldTex, IN.uv_MetallicTex).r;
            o.Specular = _SpecColor.rgb;
            
        }


        ENDCG
    }
    FallBack "Diffuse"
}
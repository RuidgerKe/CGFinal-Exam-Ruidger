Shader "Custom/Scrolling"
{
    Properties
    {
         _MainTex ("Texture", 2D) = "white"{}
        _WindTex ("Texture", 2D) = "white"{}
        _ScrollX("Scroll X", Range(-5, 5)) = 1
        _ScrollY("Scroll Y", Range(-5,5)) = 1
        _BumpAmount ("Bump", Range(-10, 10)) = 1
        _Normal ("Normal", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM 
       #pragma surface surf Lambert

       sampler2D _MainTex;
       sampler2D _WindTex;
       float _ScrollX;
       float _ScrollY;
        sampler2D _Normal;
        half _BumpAmount;

       struct Input 
       {
           float2 uv_MainTex;
           float2 uv_Normal;

           };

       void surf (Input IN, inout SurfaceOutput o)
       {
       
         _ScrollX *= _Time;
           _ScrollY *= _Time;
           float3 grass = (tex2D(_MainTex, IN.uv_MainTex + float2(_ScrollX, _ScrollY)));
           float3 wind = (tex2D(_WindTex, IN.uv_MainTex + float2(_ScrollX/2.0, _ScrollY/2.0)));
           float3 normal = (tex2D(_Normal, IN.uv_MainTex + float2(_ScrollX/2.0, _ScrollY/2.0)));
           o.Normal =UnpackNormal(tex2D(_Normal, IN.uv_Normal));
            o.Normal *= float3 (_BumpAmount, _BumpAmount, 1);
           o.Albedo = (grass + wind + normal)/2.0;
           }

        ENDCG

 
    }
    FallBack "Diffuse"
}

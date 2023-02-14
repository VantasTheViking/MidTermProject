Shader "Custom/PhongBlinn"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _SpecColor("Color", Color) = (1,1,1,1)
        _Spec("Specular", Range(0,1)) = 0.5
        _Gloss("Gloss", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf BlinnPhong

        // Use shader model 3.0 target, to get nicer looking lighting


        struct Input
        {
            float2 uv_MainTex;
        };

        float4 _Color;
        half _Spec;
        fixed _Gloss;

        

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            
            o.Albedo = _Color.rgb;
            o.Specular = _Spec;
            o.Gloss = _Gloss;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

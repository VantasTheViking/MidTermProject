Shader "Custom/PhongBlinn"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _SpecColor("Color", Color) = (1,1,1,1)
        _Spec("Specular", Range(0,1)) = 0.5
        _Gloss("Gloss", Range(0, 1)) = 0.5
        _Str("Strenght", float) = 1 }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
        
        #pragma surface surf BlinnPhong

        // Use shader model 3.0 target, to get nicer looking lighting


        struct Input
        {
            float2 uv_MainTex;
        };

        float4 _Color;
        half _Spec;
        float _Str;
        fixed _Gloss;

        

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            
            o.Albedo = _Color.rgb;
            o.Specular = _Spec * _SpecColor * _Str;
            o.Gloss = _Gloss;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

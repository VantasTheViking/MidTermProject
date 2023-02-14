Shader "Custom/Tree"
{
    Properties
    {
        
        _MainTex ("MainTex", 2D) = "white" {}
        _Alpha ("Alpha", Float) = 0
        
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert alpha:fade

        // Use shader model 3.0 target, to get nicer looking lighting

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        float _Alpha;
        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
 
            o.Alpha = c.a * _Alpha;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

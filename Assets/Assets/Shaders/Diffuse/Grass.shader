Shader "Custom/Tree"
{
    Properties
    {

        _MainTex("MainTex", 2D) = "white" {}
        _Color("Color", Color) = (0,0,0,0)

    }
        SubShader
        {
            Tags { "Queue" = "Geometry" }


            CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf Lambert

            // Use shader model 3.0 target, to get nicer looking lighting

            sampler2D _MainTex;

            struct Input
            {
                float2 uv_MainTex;
            };

            
            fixed4 _Color;
            
            void surf(Input IN, inout SurfaceOutput o)
            {
                // Albedo comes from a texture tinted by color
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
                o.Albedo = c.rgb;

                
            }
            ENDCG
        }
            FallBack "Diffuse"
}

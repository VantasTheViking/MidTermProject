Shader "Custom/Rim"
{
    Properties
    {
        _Color("Color", Color) = (0,0,0,0)
        _RimColor ("Rim Color", Color)= (0,0.5,0.0)
        _RimPower ("Rim Power", range(0.5,8.0)) = 3.0
    }
    SubShader
    {
        Tags{"Queue" = "Geometry"}
        Pass {
                ZWrite On
                ColorMask 0
        }
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade
        struct Input {
            float viewDir;
        };
        float4 _Color;
        float4 _RimColor;
        float _RimPower;
        void surf(Input IN, inout SurfaceOutput o) {
            //half rim = dot(normalize(IN.viewDir), o.Normal);
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            //o.Emission = _RimColor.rgb * rim;
            o.Albedo = _Color.rgb;
            o.Emission = _RimColor.rgb * pow (rim,_RimPower) * 10;
            o.Alpha = pow(rim, _RimPower);
        }

        ENDCG
    }
    FallBack "Diffuse"
}

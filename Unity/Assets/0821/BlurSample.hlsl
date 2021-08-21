#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

float BasePattern(UnityTexture2D tex, UnitySamplerState samp, float2 uv)
{
    float t = tex.Sample(samp, uv).x;

    float d = 14 * length(uv - 0.5);
    float c = frac(d) > 0.5;
    c = max(c, d < 4);

    return min(t, c);
}

void BlurSample_float
  (UnityTexture2D tex, UnitySamplerState samp, float2 uv, out float3 output)
{
    float phi = SimplexNoise(uv * 3 + 7.5) * PI;
    float2 vec = float2(cos(phi), sin(phi));
    output = BasePattern(tex, samp, uv + vec * 0.025);
}

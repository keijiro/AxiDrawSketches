#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

void UVRemap_float
  (float2 uv, float frequency, float2 offset, float amplitude, out float2 output)
{
    float2 np = uv * frequency + offset;
    output = uv + SimplexNoiseGrad(np).xy * amplitude;
}

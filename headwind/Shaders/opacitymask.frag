#version 440

layout(location = 0) in vec2 texCoord;
layout(location = 1) in vec2 fragCoord;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    bool opacityMaskInvert;
};

layout(binding = 1) uniform sampler2D iSource;
layout(binding = 2) uniform sampler2D opacityMaskSource;


void main() {
    fragColor = texture(iSource, texCoord);
    {
        float opacityMaskAmount = texture(opacityMaskSource, texCoord).a;
        opacityMaskAmount = opacityMaskInvert ? 1.0 - opacityMaskAmount : opacityMaskAmount;
        fragColor = fragColor * opacityMaskAmount;
    }
    fragColor = fragColor * qt_Opacity;
}

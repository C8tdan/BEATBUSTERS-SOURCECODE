//currentlty learning glsl, this is my first test

#pragma header

const float iTime =3.0;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    uv = uv + vec2(0.3, 0.1);

    vec4 color = texture2D(bitmap, uv);
    gl_FragColor = color;
}
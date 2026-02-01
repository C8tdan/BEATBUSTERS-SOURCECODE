#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

void mainImage()
{
  vec2 p = fragCoord.xy/iResolution.xy - 0.5;
  
  // cartesian to polar coordinates
  float r = length(p);
  float a = atan(p.y, p.x);
  
  // distort
  //r = sqrt(r)*0.3; // pinch
  r = r*r*3.0; // bulge
  
  // polar to cartesian coordinates
  p = r * vec2(cos(a)*0.5, sin(a)*0.5);
  
  // sample the iChannel0
  vec4 color = texture(iChannel0, p + 0.5);
  fragColor = color;
}

// https://www.shadertoy.com/view/dssXRl
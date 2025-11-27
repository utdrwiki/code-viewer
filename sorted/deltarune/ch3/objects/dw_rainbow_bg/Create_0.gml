rainbow_mode = false;
rainbow_alpha = 0;
text_alpha = 0;
_uniUV = shader_get_uniform(shd_rainbow, "u_uv");
_uniTime = shader_get_uniform(shd_rainbow, "u_time");
_uniSpeed = shader_get_uniform(shd_rainbow, "u_speed");
_time = 0;
_speed = 0.75;

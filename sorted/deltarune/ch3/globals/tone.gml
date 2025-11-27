function tone_on(arg0, arg1, arg2, arg3, arg4)
{
    shader_set(shd_tone);
    shader_set_uniform_f(shader_get_uniform(shd_tone, "saturation"), arg0);
    shader_set_uniform_f(shader_get_uniform(shd_tone, "brightness"), arg1);
    shader_set_uniform_f(shader_get_uniform(shd_tone, "tone_factor"), arg2);
    shader_set_uniform_f(shader_get_uniform(shd_tone, "tone_dark"), color_get_red(arg3) / 255, color_get_green(arg3) / 255, color_get_blue(arg3) / 255);
    shader_set_uniform_f(shader_get_uniform(shd_tone, "tone_light"), color_get_red(arg4) / 255, color_get_green(arg4) / 255, color_get_blue(arg4) / 255);
}

function tone_off()
{
    shader_reset();
}

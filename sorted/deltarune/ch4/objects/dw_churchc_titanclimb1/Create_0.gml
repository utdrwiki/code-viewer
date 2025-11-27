depth = 20;
con = 0;
timer = 0;
init = 0;
siner = 0;
u_iTime = shader_get_uniform(shd_steam, "iTime");
u_iPosOffset = shader_get_uniform(shd_steam, "iPosOffset");
u_iTexCoordStretch = shader_get_uniform(shd_steam, "iTexCoordStretch");
u_uvs = shader_get_uniform(shd_steam, "uvs");
s_uvs = sprite_get_uvs(spr_perlin_noise_looping, 0);
cloudsurface = surface_create(320, 240);
scr_fadein(60);
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}

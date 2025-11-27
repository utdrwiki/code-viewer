draw_sprite_ext(spr_pixel_white, 0, x, y, 220, 120, 0, c_black, 1);
if (rainbow_mode)
{
    shader_set(shd_rainbow);
    var uv = sprite_get_uvs(spr_pixel_white, 0);
    shader_set_uniform_f(_uniUV, uv[0], uv[2]);
    shader_set_uniform_f(_uniSpeed, _speed);
    shader_set_uniform_f(_uniTime, _time);
    draw_sprite_ext(spr_pixel_white, 0, camerax() + 320, cameray() - 340, 220, 220, -45, c_white, rainbow_alpha);
    shader_reset();
    draw_set_alpha(text_alpha);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text_ext_transformed(camerax() + (view_wport[0] / 2), cameray() + 270, stringsetsubloc("Press ~1 to try again!", scr_get_input_name(4), "obj_dw_rainbow_bg_slash_Draw_0_gml_21_0"), 4, 9999, 2, 2, 0);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_set_alpha(1);
}

if (i_ex(obj_chefs_game) && obj_chefs_game.gameover)
    con = 2;
if (i_ex(obj_chefs_game) && obj_chefs_game.timer < 3)
    con = 2;
if (con == 1 && image_alpha < 1)
    image_alpha += 0.1;
if (con == 2)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
if (!i_ex(obj_gameover_minigame))
{
    var _x = camerax() + 634;
    var _y = cameray() + 416;
    var _y2 = cameray() + 446;
    var _string = "";
    var _string2 = "";
    var _string3 = stringsetsubloc("Throw ~1    Jump ~2", scr_get_input_name(4), scr_get_input_name(5), "obj_chef_controls_ui_slash_Draw_0_gml_19_0");
    var _string4 = stringsetloc("Throw       : Jump", "obj_chef_controls_ui_slash_Draw_0_gml_20_0");
    draw_set_halign(fa_right);
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_set_alpha(image_alpha);
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        var xSpr = scr_getbuttonsprite(global.input_g[5], false);
        var butxpos = _x - string_width(" : " + _string2) - sprite_get_width(xSpr) - 12;
        var _xx = 0;
        if (global.lang == "ja")
            _xx = 55;
        draw_sprite_ext(xSpr, 0, butxpos - 60 - _xx, _y + 4 + 30, 2, 2, 0, c_white, image_alpha);
        draw_set_colour(c_black);
        draw_text_transformed(_x - 1, _y2 - 1, " : " + _string4, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 - 1, " : " + _string4, 1, 1, 0);
        draw_text_transformed(_x - 1, _y2 + 1, " : " + _string4, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 + 1, " : " + _string4, 1, 1, 0);
        draw_set_colour(c_white);
        draw_text_transformed(_x, _y2, " : " + _string4, 1, 1, 0);
        xSpr = scr_getbuttonsprite(global.input_g[4], false);
        butxpos = _x - string_width(" : " + _string4) - sprite_get_width(xSpr) - 12;
        draw_sprite_ext(xSpr, 0, butxpos, _y2 + 4, 2, 2, 0, c_white, image_alpha);
    }
    else
    {
        draw_set_colour(c_black);
        draw_text_transformed(_x - 1, _y2 - 1, _string3, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 - 1, _string3, 1, 1, 0);
        draw_text_transformed(_x - 1, _y2 + 1, _string3, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 + 1, _string3, 1, 1, 0);
        draw_set_colour(c_white);
        draw_text_transformed(_x, _y2, _string3, 1, 1, 0);
    }
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}

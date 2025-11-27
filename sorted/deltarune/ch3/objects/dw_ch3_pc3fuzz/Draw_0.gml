if (view_current == 0)
{
    siner += 0.5;
    for (var i = 0; i < 9; i++)
    {
        for (var ii = 0; ii < 6; ii++)
        {
            draw_sprite_ext(spr_dw_teevie_tv_static, i + ii + siner, (x - 8) + (i * 40), (y - 4) + (ii * 40), 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_dw_teevie_tv_static, (i + ii + siner) - 0.5, (x - 8) + (i * 40), (y - 4) + (ii * 40), 2, 2, 0, c_white, 0.5);
        }
    }
    var ver = 1;
    if (ver == 0)
    {
        draw_set_font(scr_84_get_font("8bit"));
        for (var i = 0; i < 6; i++)
        {
            draw_set_color(c_gray);
            draw_text_transformed(54 + x + (i * 50) + 1, y + 114, "0", 2, 2, 0);
            draw_text_transformed((54 + x + (i * 50)) - 1, y + 114, "0", 2, 2, 0);
            draw_text_transformed(54 + x + (i * 50), y + 114 + 1, "0", 2, 2, 0);
            draw_text_transformed(54 + x + (i * 50), (y + 114) - 1, "0", 2, 2, 0);
            draw_text_transformed(54 + x + (i * 50) + 2, y + 114, "0", 2, 2, 0);
            draw_text_transformed((54 + x + (i * 50)) - 2, y + 114, "0", 2, 2, 0);
            draw_text_transformed(54 + x + (i * 50), y + 114 + 2, "0", 2, 2, 0);
            draw_text_transformed(54 + x + (i * 50), (y + 114) - 2, "0", 2, 2, 0);
            draw_set_color(merge_color(#CFB7CB, c_white, abs(sin((siner * ((i + (2 * pi)) * pi)) / 180))));
            draw_text_transformed(54 + x + (i * 50), y + 114, "0", 2, 2, 0);
        }
    }
    if (ver == 1)
    {
        draw_set_font(scr_84_get_font("8bit"));
        for (var i = 0; i < 12; i++)
        {
            for (var ii = 0; ii < 8; ii++)
            {
                draw_set_color(c_black);
                draw_set_alpha(0.1);
                draw_text_transformed(x + 2 + (i * 32) + (sin((siner * 2) / 30) * 2), y + 2 + (ii * 32), "0", 2, 2, 0);
                draw_text_transformed(x + 2 + (i * 32), y + 2 + (ii * 32) + (cos((siner * 2) / 30) * 2), "0", 2, 2, 0);
                draw_text_transformed(x + 2 + (i * 32) + (sin((siner * 2) / 30) * 4), y + 2 + (ii * 32), "0", 2, 2, 0);
                draw_text_transformed(x + 2 + (i * 32), y + 2 + (ii * 32) + (cos((siner * 2) / 30) * 4), "0", 2, 2, 0);
                draw_set_alpha(1);
                draw_set_color(c_white);
                draw_text_transformed(x + 2 + (i * 32), y + 2 + (ii * 32), "0", 2, 2, 0);
            }
        }
    }
    if (global.flag[1231] == 1)
    {
        depth = 999900;
        if (alpha == 0)
        {
            alpha = 0.01;
            scr_lerpvar("alpha", alpha, 1, 4, 2, "in");
        }
        draw_sprite_ext(spr_pxwhite, 0, x, y, 384, 256, 0, c_black, alpha);
    }
}

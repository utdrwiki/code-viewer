if (boss)
{
    if (i_ex(obj_tenna_zoom) && (obj_tenna_zoom.con < 2 || (obj_tenna_zoom.con == 2 && obj_tenna_zoom.timer < 11)))
    {
        if (i_ex(obj_growtangle))
        {
            draw_set_font(fnt_mainbig);
            draw_set_halign(fa_center);
            draw_set_color(c_dkgray);
            draw_set_alpha(0.6);
            draw_text_transformed(obj_growtangle.x + 2, ((obj_growtangle.y + (obj_growtangle.sprite_height / 2)) - 8) + 2, bounce_count, 4, 2, 0);
            draw_set_alpha(1);
            draw_set_color(#B2B2B2);
            draw_text_transformed(obj_growtangle.x, (obj_growtangle.y + (obj_growtangle.sprite_height / 2)) - 8, bounce_count, 4, 2, 0);
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            if (bounce_count <= 0)
            {
                if (global.turntimer > 10)
                    global.turntimer = 10;
            }
            else
            {
                global.turntimer = 11;
            }
        }
    }
}
if (i_ex(obj_tenna_enemy))
{
    index += 0.3;
    if (ballvar == 1)
        draw_sprite_ext(spr_ball_elnina, index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    if (ballvar == 2)
        draw_sprite_ext(spr_ball_lanino, index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
}
else
{
    draw_self();
}

scr_enemy_drawhurt_generic();
if (idlesprite == spr_zapper_cannon)
    scr_enemy_drawidle_generic(0.5);
else
    scr_enemy_drawidle_generic(0.2);
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (closedcaptioncon == 1)
    draw_sprite(spr_zapper_caption2, 0, camerax() + 320, cameray() + 60);
if (closedcaptioncon2 == 1)
    draw_sprite(spr_zapper_caption3, 0, camerax() + 320, cameray() + 230);
if (displayvolumetimer > 0)
{
    displayvolumetimer--;
    if ((displayvolumetimer % 3) == 0)
    {
        if (volumecount < volumecountdestination)
            volumecount++;
    }
    if (volumecount > volumecountdestination)
        volumecount--;
    var a = 0;
    var xx = camerax() + 186;
    var yy = cameray() + 290;
    draw_sprite(spr_zapper_volume_text, 0, (xx - 4) + 12, yy - 12);
    repeat (20)
    {
        a++;
        if (a <= volumecount)
            draw_sprite_ext(spr_zapper_volume, 0, xx + (a * 12), yy, 1.6, 1, 0, c_white, 1);
        else
            draw_sprite(spr_zapper_volume, 1, xx + (a * 12), yy);
    }
}
if (redalarm == true)
{
    sirensiner++;
    draw_set_blend_mode(bm_add);
    var sirensinermod = abs(sin(sirensiner / 15)) - lightfade;
    if (sirensinermod < 0)
        sirensinermod = 0;
    draw_set_alpha(sirensinermod);
    draw_triangle_color(0, 0, 560, 0, 0, 480, c_red, 0, 0, 0);
    draw_triangle_color(640, 0, 80, 0, 640, 480, c_red, 0, 0, 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
}

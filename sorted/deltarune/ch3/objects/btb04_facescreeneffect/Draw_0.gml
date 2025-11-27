animindex++;
if (active)
{
    image_blend = #4CFF00;
    draw_self();
    chromakey_mask_begin(65356, 5);
    draw_self();
    for (var i = 0; i < 36; i++)
        draw_sprite_ext(spr_sneo_bigcircle, 0, x, y, rad, rad, 0 + i, #4CFF00, 0);
    image_blend = c_white;
    chromakey_mask_end();
    chromakey_on();
    draw_sprite_tiled_ext(spr_ch3_staticeffect_soft, animindex, scr_even(animindex / 4), 0, 2, 2, c_white, 1);
    draw_sprite_tiled_ext(spr_ch3_staticeffect_soft, animindex - 0.5, scr_even(animindex / 4), 0, 2, 2, c_white, 0.5);
    chromakey_off();
}
draw_set_color(c_white);
draw_set_alpha(whiteoverlayindex);
ossafe_fill_rectangle(camerax() - 40, cameray() - 40, camerax() + 640 + 40, cameray() + 480 + 40, 0);
draw_set_alpha(1);

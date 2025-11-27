if (obj_room_teevie_rhythm.makeshads)
    bg_timer++;
draw_sprite_ext(spr_dw_teevie_rhythm_bg, 1, x, y, 2, 2, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(spr_dw_teevie_rhythm_bg, 1, x, y, 2, 2, image_angle, image_blend, 0.1 + (sin(bg_timer / 6) * 0.1));
draw_set_blend_mode(bm_normal);
if (obj_room_teevie_rhythm.makeshads)
{
    siner++;
    draw_set_blend_mode(bm_add);
    floorY = y + 280 + (cos(siner / 20) * (range / 2));
    draw_set_blend_mode(bm_normal);
    scr_draw_set_mask(true);
    draw_sprite(spr_rhythmgame_bg_overlay, 1, x, y);
    scr_draw_in_mask_begin();
    draw_set_color(#85A0E8);
    for (var i = 0; i < 3; i++)
        draw_ellipse(x + 20 + (i * 210), floorY - 20, x + 20 + 180 + (i * 210), floorY + 10, false);
    draw_set_color(c_white);
    scr_draw_in_mask_end();
}

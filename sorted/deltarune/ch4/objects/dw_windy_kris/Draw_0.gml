event_inherited();
if (battle_mode)
{
    d3d_set_fog(true, c_black, 0, 1);
    draw_sprite_ext(sprite_index, base_anim_index, x, y, 2, 2, 0, c_white, battle_alpha);
    if (sprite_index != spr_kris_block_up_wind_inbetween && sprite_index != spr_kris_block_up_wind_inbetween2)
        draw_sprite_ext(sprite_top, top_anim_index, x, y, 2, 2, 0, c_white, battle_alpha);
    d3d_set_fog(false, c_black, 0, 0);
    draw_sprite_ext(spr_heart_outline2, 0, x + 12, y + 40, 1, 1, 0, c_white, battle_alpha * 2);
}

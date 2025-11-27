if (!is_init)
    exit;
if (up_h() && auto)
    base_anim_index += base_anim_speed;
windspeedchangetimer++;
if (windspeedchangetimer == 35)
{
    top_anim_speed_max = choose(0.4, 0.5, 0.6, 0.7, 0.8);
    windspeedchangetimer = 0;
}
if (top_anim_speed_max > top_anim_speed)
    top_anim_speed += 0.05;
if (top_anim_speed_max < top_anim_speed)
    top_anim_speed -= 0.05;
top_anim_index += top_anim_speed;
if (char_name == "susie")
{
    sprite_top_offset_timer++;
    if (sprite_top_offset_timer == 8)
        sprite_top_offset = -2;
    if (sprite_top_offset_timer == 16)
    {
        sprite_top_offset = 0;
        sprite_top_offset_timer = 0;
    }
}
else if (char_name == "kris")
{
    if (obj_mainchara.y >= 3720)
    {
        sprite_index = spr_kris_block_up_wind_inbetween2;
        base_anim_index = 0;
    }
    if (obj_mainchara.y < 3720 && sprite_index == spr_kris_block_up_wind_inbetween2)
    {
        sprite_index = spr_kris_block_up_wind_inbetween;
        base_anim_index = 0;
    }
    if (auto && i_ex(obj_mainchara))
    {
        x = obj_mainchara.x;
        y = obj_mainchara.y;
        depth = obj_mainchara.depth - 1;
    }
    if (sprite_index == spr_kris_block_up_wind_inbetween && base_anim_index >= 3)
        sprite_index = spr_kris_walk_up_windy;
    if (sprite_index == spr_kris_block_up_wind_inbetween2 && base_anim_index >= 2)
    {
        sprite_index = spr_krisu_dark_1frame;
        base_anim_index = 0;
    }
}
if (visible)
{
    d3d_set_fog(true, c_red, 0, 1);
    draw_sprite_ext(sprite_index, base_anim_index, x, y - 2, 2, 2, 0, c_white, redalpha);
    draw_sprite_ext(sprite_index, base_anim_index, x + 2, y - 2, 2, 2, 0, c_white, redalpha);
    draw_sprite_ext(sprite_index, base_anim_index, x - 2, y - 2, 2, 2, 0, c_white, redalpha);
    draw_sprite_ext(sprite_index, base_anim_index, x, y + 2, 2, 2, 0, c_white, redalpha);
    draw_sprite_ext(sprite_index, base_anim_index, x + 2, y + 2, 2, 2, 0, c_white, redalpha);
    draw_sprite_ext(sprite_index, base_anim_index, x - 2, y + 2, 2, 2, 0, c_white, redalpha);
    if (sprite_index != spr_kris_block_up_wind_inbetween && sprite_index != spr_kris_block_up_wind_inbetween2)
    {
        draw_sprite_ext(sprite_top, top_anim_index, x, y - 2, 2, 2, 0, c_white, redalpha);
        draw_sprite_ext(sprite_top, top_anim_index, x + 2, y - 2, 2, 2, 0, c_white, redalpha);
        draw_sprite_ext(sprite_top, top_anim_index, x - 2, y - 2, 2, 2, 0, c_white, redalpha);
        draw_sprite_ext(sprite_top, top_anim_index, x, y + 2, 2, 2, 0, c_white, redalpha);
        draw_sprite_ext(sprite_top, top_anim_index, x + 2, y + 2, 2, 2, 0, c_white, redalpha);
        draw_sprite_ext(sprite_top, top_anim_index, x - 2, y + 2, 2, 2, 0, c_white, redalpha);
    }
    d3d_set_fog(false, c_black, 0, 0);
}
krisstartwindycon = 0;
krisstartwindytimer = 0;
draw_sprite_ext(sprite_index, base_anim_index, x, y, 2, 2, 0, c_white, 1);
if (sprite_index != spr_kris_block_up_wind_inbetween && sprite_index != spr_kris_block_up_wind_inbetween2)
    draw_sprite_ext(sprite_top, top_anim_index, x, y + sprite_top_offset, 2, 2, 0, c_white, 1);

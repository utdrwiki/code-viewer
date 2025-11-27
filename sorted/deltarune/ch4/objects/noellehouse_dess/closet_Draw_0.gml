if (is_open)
{
}
else
{
    if (kris_active)
    {
        kris_index += kris_anim_speed;
        draw_sprite_ext(kris_sprite, kris_index, kris_x, kris_y, 1, 1, 0, c_white, 1);
    }
    draw_sprite_ext(bg_noellehouse_dess_closet_door, 0, x, y + 45, 1, 1, 0, c_white, door_alpha);
    draw_sprite_ext(bg_noellehouse_dess_closet_door_slide, 0, door_xpos, y + 45 + 8, 1, 1, 0, c_white, door_alpha);
    draw_sprite_ext(bg_noellehouse_dess_wall, 0, x + 133, y + 45, 1, 1, 0, c_white, door_alpha);
    draw_sprite_ext(spr_pixel_white, 0, x, -20, 60, 16.5, 0, c_black, door_alpha);
    draw_sprite_ext(spr_pixel_white, 0, x + 152, y + 30, 15, 23, 0, c_black, door_alpha);
}

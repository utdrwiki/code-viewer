if (!stone_mode)
{
    draw_sprite_ext(body_sprite, body_anim, x + 2, y + 38, 2, 2, 0, c_white, 1);
    draw_sprite_ext(head_sprite, head_sprite_index, x, y, 2, 2, 0, c_white, 1);
}
else
{
    draw_sprite_ext(body_sprite, body_anim, x, y, 2, 2, 0, c_white, 1);
}

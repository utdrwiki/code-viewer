function draw_self_board()
{
    draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function draw_board_self()
{
    draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function draw_self_rounded()
{
    draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

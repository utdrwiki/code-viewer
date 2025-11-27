var _splid = 0;
var _dist = round(distance);
draw_sprite_part_ext_rot(sprite_index, 1, 0, 0, sprite_width, sprite_height / 2, x - _splid, y - _dist, image_xscale, image_yscale, 0, image_blend, 1);
draw_sprite_part_ext_rot(sprite_index, 1, 0, sprite_height / 2, sprite_width, sprite_height / 2, x + _splid, y + _dist, image_xscale, image_yscale, 0, image_blend, 1);
draw_sprite_part_ext_rot(sprite_index, 0, 0, 0, sprite_width, sprite_height / 2, x - _splid, y - _dist, image_xscale, image_yscale, 0, image_blend, 1);
draw_sprite_part_ext_rot(sprite_index, 0, 0, sprite_height / 2, sprite_width, sprite_height / 2, x + _splid, y + _dist, image_xscale, image_yscale, 0, image_blend, 1);
draw_set_color(c_white);
if (_dist == 0)
{
    ossafe_fill_rectangle(x - 74 - _splid, y - _dist, (x + 75) - _splid, y - _dist, false);
    ossafe_fill_rectangle((x - 74) + _splid, y + _dist, x + 75 + _splid, y + _dist, false);
}
else
{
    draw_sprite_ext(spr_rk_split_flame_edge, flame_index, x + 2, y - _dist - 1, 2, 2, 180, c_gray, 1);
    draw_sprite_ext(spr_rk_split_flame_edge, flame_index, x, y + _dist + 2, 2, 2, 0, c_gray, 1);
}
flame_index += 0.5;

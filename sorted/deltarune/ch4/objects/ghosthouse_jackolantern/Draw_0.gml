var shakey = 0;
var shakex = 0;
if (image_xscale > 1)
{
    shakex = choose(0, 1, -1);
    shakey = choose(0, 1, -1);
}
if (draw_hand == 1)
{
    hand_x = obj_your_tutu.x;
    hand_y = obj_your_tutu.y;
}
if (draw_hand)
    draw_sprite(spr_jackohandtern, 0, hand_x, hand_y);
var _squish = 1 - abs(1 - squish);
if (squish != 1)
{
    for (var _x = 0; _x < sprite_width; _x += 2)
        draw_sprite_part(sprite_index, image_index, _x, 0, 2, sprite_height, x + ((_x - sprite_xoffset) * _squish), y - sprite_yoffset);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (scr_debug())
    draw_text(16, 16, tutu);

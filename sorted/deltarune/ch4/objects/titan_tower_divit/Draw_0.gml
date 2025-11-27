rotationsiner += 0.1;
if (rotationsiner > 6.4)
    rotationsiner -= 6.4;
if (rotationsiner >= 0.53 && rotationsiner < 2.6)
    depth = obj_rotating_tower_controller.depth + 50;
else
    depth = obj_mainchara.depth - 10;
var a = sin(rotationsiner + 1.57);
if (a > 0)
{
}
else
{
}
draw_sprite_ext(sprite_index, image_index, x, y, a, image_yscale, image_angle, image_blend, image_alpha);
if (rotationsiner >= 0.53 && rotationsiner < 2.6)
    darken_alpha = 1;
if (rotationsiner >= 3.2 && rotationsiner < 6.4)
    darken_alpha = 0;
if (rotationsiner >= 0 && rotationsiner < 0.53)
    darken_alpha = lerp(0, 1, rotationsiner / 0.53);
if (rotationsiner >= 2.6 && rotationsiner < 3.2)
    darken_alpha = lerp(1, 0, (rotationsiner - 2.6) / 0.53);
d3d_set_fog(true, c_black, 0, 1);
draw_sprite_ext(sprite_index, image_index, x, y, a, image_yscale, image_angle, image_blend, darken_alpha);
d3d_set_fog(false, c_black, 0, 0);

if (path_position >= 0.45 && path_position < 0.84)
{
}
else
{
}
var yy = 0;
var siner = 0;
timer++;
repeat (10)
{
    draw_sprite_ext(sprite_index, 0, x + siner, y + yy, image_xscale * -1, image_yscale, 270, image_blend, image_alpha);
    yy -= 30;
}

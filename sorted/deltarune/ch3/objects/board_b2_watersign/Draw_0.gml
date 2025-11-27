siner++;
var amt = 0;
if (active)
{
    if (!grabbed)
        amt = sin(siner / 16) * 2;
}
draw_sprite_ext(sprite_index, image_index, scr_even(x), scr_even((y + amt) - 4), 2, 2, 0, image_blend, image_alpha);

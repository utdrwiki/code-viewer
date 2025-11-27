if (happiness >= 75)
{
    image_blend = c_white;
}
else if (happiness >= 50)
{
    image_blend = merge_colour(c_white, c_red, 0.25);
    if (random(6) < 1)
        xx = irandom_range(-2, 2);
    if (random(6) < 1)
        yy = irandom_range(-2, 2);
}
else if (happiness >= 25)
{
    image_blend = merge_colour(c_white, c_red, 0.5);
    if (random(2) < 1)
        xx = irandom_range(-2, 2);
    if (random(2) < 1)
        yy = irandom_range(-2, 2);
}
else if (happiness >= 10)
{
    image_blend = merge_colour(c_white, c_red, 0.75);
    xx = irandom_range(-2, 2);
    yy = irandom_range(-2, 2);
}
else if (happiness > 0)
{
    image_blend = merge_colour(c_white, c_red, 0.85);
    xx = irandom_range(-6, 6);
    yy = irandom_range(-6, 6);
}
else if (happiness <= 0)
{
    image_blend = c_red;
}
pet -= 1;
if (pet > 0)
{
    image_blend = merge_colour(c_white, c_lime, pet / pet_max);
}
else
{
}
scr_dso(sprite_index, image_index, x + xx, y + yy, xscale * image_xscale, image_yscale, 0, 1, image_alpha);
if (image_index == 1)
    scr_dso(sprite_index, 2, x + xx + (sin(x + (current_time / 200)) * 5), y + yy + (cos(y + (current_time / 240)) * 8), xscale * image_xscale, image_yscale, 0, 1, image_alpha, 1);
draw_sprite_ext(sprite_index, image_index, x + xx, y + yy, xscale * image_xscale, image_yscale, 0, image_blend, image_alpha);
if (image_index == 0)
{
    if (image_xscale == 1)
        draw_sprite_ext(sprite_index, 3, x + xx, y + yy, xscale * image_xscale, image_yscale, 0, c_white, image_alpha);
    else
        draw_sprite_ext(sprite_index, 4, x + xx, y + yy, xscale * image_xscale, image_yscale, 0, c_white, image_alpha);
}
if (image_index == 1)
    draw_sprite_ext(sprite_index, 2, x + xx + (sin(x + (current_time / 200)) * 5), y + yy + (cos(y + (current_time / 240)) * 8), xscale * image_xscale, image_yscale, 0, image_blend, image_alpha);

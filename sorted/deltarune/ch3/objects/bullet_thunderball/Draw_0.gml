if (!freeze)
{
    shakx = 0;
    shaky = 0;
}
draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale + (sin((timer * 0.5) - timerup) * 0.2), image_yscale - (sin((timer * 0.5) - timerup) * 0.2), image_angle, c_gray, image_alpha);
if (alarm[4] && alarm[4] < 7 && !freeze)
{
    shakx = choose(-2, 0, 2);
    shaky = choose(-2, 0, 2);
}
draw_sprite_ext(sprite_index, image_index, x + shakx, y + shaky, image_xscale + (sin(timer * 0.5) * 0.2), image_yscale - (sin(timer * 0.5) * 0.2), image_angle, image_blend, image_alpha);

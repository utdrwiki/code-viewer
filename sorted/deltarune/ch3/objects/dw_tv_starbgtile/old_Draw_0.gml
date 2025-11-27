xscroll += xscrollspeed;
yscroll += yscrollspeed;
if (scr_debug())
{
}
image_alpha = lerp(image_alpha, desiredImageAlpha, fadelerpspeed);
draw_sprite_tiled_ext(sprite_index, 0, camerax() + xscroll, cameray() + yscroll, 2, 2, c_white, image_alpha);

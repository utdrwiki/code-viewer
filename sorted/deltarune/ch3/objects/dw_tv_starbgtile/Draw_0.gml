xscroll += xscrollspeed;
yscroll += yscrollspeed;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")))
        desiredImageAlpha = 0;
    if (keyboard_check_pressed(ord("2")))
        desiredImageAlpha = 1;
    if (keyboard_check_pressed(ord("8")))
    {
        yscrollspeed = 0.5;
        scr_debug_print("Bg speed set to 15fps");
    }
    if (keyboard_check_pressed(ord("9")))
    {
        yscrollspeed = 2/3;
        scr_debug_print("Bg speed set to 20fps (will stutter)");
    }
    if (keyboard_check_pressed(ord("0")))
    {
        yscrollspeed = 1;
        scr_debug_print("Bg speed set to 30fps");
    }
}
image_alpha = lerp(image_alpha, desiredImageAlpha, fadelerpspeed);
draw_sprite_tiled_ext(sprite_index, yscroll, camerax() + xscroll, cameray() + yscroll, 2, 2, c_white, image_alpha);

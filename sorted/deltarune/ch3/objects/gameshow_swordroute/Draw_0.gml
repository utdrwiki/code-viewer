draw_set_color(c_white);
if (!nochange)
{
    if (colorchange > 0)
    {
        screencolor = merge_color(newcolor, screencolor, colorchange / colorchangetime);
        colorchange--;
    }
}
siner += 0.25;
draw_set_blend_mode(bm_add);
draw_sprite_ext(spr_gameshow_swordroute_tvglow, 0, 0, 320, 2, 2, 0, screencolor, screenalpha);
draw_set_blend_mode(bm_normal);
if (drawshadow)
{
    with (kris)
    {
        if (room == room_board_postshadowmantle)
        {
            if (place_meeting(x, y, obj_bpush2_stucktrigger) || other.shadowfade)
            {
                if (vspeed == 0)
                    other.krishadow = lerp(other.krishadow, 0, 0.25);
            }
            else
            {
            }
        }
        draw_self();
        draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, c_gray, 1 * other.krishadow);
        draw_sprite_ext(sprite_index, image_index, x, (y + (sprite_height * 2)) - 4, image_xscale, -image_yscale, image_angle, c_black, 0.8 * other.krishadow);
    }
}
draw_set_color(c_black);
ossafe_fill_rectangle(camerax() - 20, cameray() + 380, camerax() + 640 + 20, cameray() + 480 + 20);
draw_set_color(c_white);
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("C")))
    {
        var rgbstring = "R:" + string(color_get_red(screencolor)) + " | G: " + string(color_get_green(screencolor)) + " | B: " + string(color_get_blue(screencolor));
        var red = clamp(color_get_red(screencolor), 0, 255);
        var green = clamp(color_get_green(screencolor), 0, 255);
        var blue = clamp(color_get_blue(screencolor), 0, 255);
        var hexColor = string(dec_to_hex(red)) + string(dec_to_hex(green)) + string(dec_to_hex(blue));
        get_string("Screen hex Value:", hexColor);
    }
}
var count = 0;
var space = 10;
var border = 8;

if (drawoverlay == true)
{
    var lightColor = 13088418;
    var darkColor = 6242121;
    tone_on(tone_saturation, tone_brightness, tone_factor, darkColor, lightColor);
    draw_sprite_ext(global.screenshot, 0, camerax(), cameray(), 1, 1, 0, c_white, 1);
    tone_off();
    draw_set_alpha(grayalpha);
    draw_set_color(c_gray);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
    draw_set_color(c_white);
    draw_set_alpha(1);
    staticindex += 0.25;
    draw_sprite_tiled_ext(spr_static_effect, staticindex - 0.5, 0, 0, 2, 2, c_white, staticalpha);
    draw_sprite_tiled_ext(spr_static_effect, staticindex, 0, 0, 2, 2, c_white, staticalpha);
    draw_set_alpha(blackalpha);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
    draw_set_color(c_white);
    draw_set_alpha(1);
}

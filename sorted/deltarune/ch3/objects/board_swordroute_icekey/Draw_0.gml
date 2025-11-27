draw_self();
if (drawblue)
{
    draw_set_color(#1E76F0);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height, 0);
    draw_set_color(c_white);
    obj_gameshow_swordroute.screencolor = #1E76F0;
}
if (draw_static)
{
    statictimer += 0.5;
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height, 0);
    var staticalpha = 0.25;
    draw_sprite_ext(spr_static_effect, statictimer, 64, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer, 64, 288, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer, 320, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer, 320, 288, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 64, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 64, 288, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 320, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 320, 288, 2, 2, 0, c_white, staticalpha);
    obj_gameshow_swordroute.screencolor = #ADC7EB;
}
if (drawblack)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height, 0);
    draw_set_color(c_white);
    obj_gameshow_swordroute.screencolor = c_black;
}

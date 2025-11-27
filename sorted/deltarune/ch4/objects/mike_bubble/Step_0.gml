var _width = 64 + (obj_mike_controller.line_width / 2);
vspeed = 1;
counter += 100;
x = xstart + (sin(counter / 1600) * 80);
if (y > room_height)
{
    scr_sparkle(8);
    with (obj_mike_minigame_controller)
        game_over = true;
    instance_destroy();
}

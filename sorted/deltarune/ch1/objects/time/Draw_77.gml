if (scr_is_switch_os() || os_type == os_ps4 || os_type == os_ps5)
{
    var ww = window_get_width();
    var wh = window_get_height();
    var sw = surface_get_width(application_surface);
    var sh = surface_get_height(application_surface);
    var xx = floor((ww - (sw * global.window_scale)) / 2);
    var yy = floor((wh - (sh * global.window_scale)) / 2);
    global.window_xofs = xx;
    global.window_yofs = yy;
    if (scr_is_switch_os() && wh == 720)
        texture_set_interpolation(true);
    else
        texture_set_interpolation(false);
    if (global.screen_border_active && border_alpha >= 0)
    {
        scr_draw_screen_border(global.screen_border_id);
        if (border_alpha < 1)
        {
            draw_set_alpha(1 - border_alpha);
            draw_set_color(c_black);
            ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
            draw_set_alpha(1);
            draw_set_color(c_white);
        }
    }
    else
    {
        var room_id = room;
        if (instance_exists(obj_savepoint))
            global.disable_border = false;
        if (room_id == PLACE_CONTACT || room_id == 317 || room_id == PLACE_MENU || room_id == room_splashscreen || room_id == room_gameover || room_id == PLACE_DOG || room_id == room_dark1a || room_id == room_dark_eyepuzzle || room_id == ROOM_INITIALIZE)
            global.disable_border = true;
    }
    draw_enable_alphablend(false);
    draw_surface_ext(application_surface, xx, yy, global.window_scale, global.window_scale, 0, c_white, 1);
    if (paused)
    {
        if (sprite_exists(screenshot))
            draw_sprite_ext(screenshot, 0, xx, yy, global.window_scale, global.window_scale, 0, c_white, 1);
    }
    draw_enable_alphablend(true);
    texture_set_interpolation(false);
}
else
{
    global.window_xofs = 0;
    global.window_yofs = 0;
}

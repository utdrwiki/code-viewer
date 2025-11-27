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
if (global.screen_border_active)
{
    var border_id = global.screen_border_id;
    draw_enable_alphablend(false);
    if (border_id == "Dynamic" || border_id == "ダイナミック")
    {
        scr_draw_background_ps4(_border_image, 0, 0);
        if (_border_image_layer != -4)
        {
            draw_enable_alphablend(true);
            if (_border_image_layer == border_dw_titan_eyes)
            {
                _border_image_siner++;
                _border_image_alpha = 0.4 + (sin(_border_image_siner / 30) * 0.2);
            }
            else
            {
                _border_image_alpha = 1;
            }
            draw_set_alpha(_border_image_alpha);
            scr_draw_background_ps4(_border_image_layer, 0, 0);
            draw_set_alpha(1);
            draw_enable_alphablend(false);
            if (_border_image_layer == border_dw_titan_eyes)
            {
                if (_border_red_active)
                {
                    if (_border_red_alpha < 1)
                        _border_red_alpha += 0.13;
                    _border_red_timer++;
                    if (_border_red_timer >= 8)
                        _border_red_active = false;
                }
                else if (_border_red_alpha > 0)
                {
                    _border_red_alpha -= 0.025;
                }
                draw_enable_alphablend(true);
                draw_set_alpha(_border_red_alpha);
                scr_draw_background_ps4(border_dw_titan_eyes_red, 0, 0);
                draw_set_alpha(1);
                draw_enable_alphablend(false);
            }
        }
        global.disable_border = obj_time.border_alpha != 1;
    }
    draw_set_alpha(1);
    draw_enable_alphablend(true);
    if (_border_image != _border_image_temp)
    {
        draw_set_alpha(_border_image_temp_alpha);
        scr_draw_background_ps4(_border_image_temp, 0, 0);
        if (_border_image_layer != -4)
            scr_draw_background_ps4(_border_image_layer, 0, 0);
        _border_image_temp_alpha += _border_image_temp_alpha_amount;
        if (_border_image_temp_alpha > 1)
        {
            _border_image_temp_alpha = 0;
            _border_image = _border_image_temp;
        }
        draw_set_alpha(1);
    }
    if (custom_effect >= 0)
    {
        if (custom_effect_con == 0)
        {
            if (custom_effect_alpha < custom_effect_alpha_target)
                custom_effect_alpha += custom_effect_fade_speed;
        }
        if (custom_effect_con == 1)
        {
            custom_effect_alpha -= custom_effect_fade_speed;
            if (custom_effect_alpha <= 0)
            {
                custom_effect = -1;
                custom_effect_con = 0;
            }
        }
        draw_set_alpha(custom_effect_alpha);
        draw_set_color(custom_effect_color);
        ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
        draw_set_alpha(1);
        draw_set_color(c_white);
    }
    draw_set_alpha(overlay_alpha);
    draw_set_color(overlay_color);
    ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
    draw_set_alpha(1);
    draw_set_color(c_white);
    if (border_id == "Simple" || border_id == "シンプル")
    {
        scr_draw_background_ps4(border_line_1080, 0, 0);
        global.disable_border = obj_time.border_alpha != 1;
    }
}
else
{
    if (!variable_global_exists("currentroom"))
        global.currentroom = room;
    var room_id = global.currentroom;
    if (instance_exists(obj_savepoint))
        global.disable_border = false;
    if (room_id == PLACE_CONTACT || room_id == 1391 || room_id == PLACE_MENU || room_id == room_gameover || room_id == PLACE_DOG)
        global.disable_border = true;
}
draw_enable_alphablend(false);
draw_surface_ext(application_surface, xx, yy, global.window_scale, global.window_scale, 0, c_white, 1);
if (instance_exists(obj_time))
{
    var is_paused = false;
    with (obj_time)
        is_paused = paused;
    if (is_paused)
    {
        if (sprite_exists(obj_time.screenshot))
            draw_sprite_ext(obj_time.screenshot, 0, xx, yy, global.window_scale, global.window_scale, 0, c_white, 1);
    }
}
draw_enable_alphablend(true);
texture_set_interpolation(false);

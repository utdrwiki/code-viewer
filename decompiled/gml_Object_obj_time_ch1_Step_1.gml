if (!paused)
    global.time += 1
else
    return;
if scr_debug_ch1()
{
    if scr_84_debug_ch1(1)
        return;
    if keyboard_check_pressed(vk_f10)
    {
        screen_name = (string(screenshot_number) + "_shot.png")
        screen_save(screen_name)
        screenshot_number += 1
    }
}
if keyboard_check(vk_escape)
{
    if (quit_timer < 0)
        quit_timer = 0
    quit_timer += 1
    if (quit_timer >= 30)
        ossafe_game_end_ch1()
}
else
    quit_timer -= 2
if keyboard_check_pressed(vk_f4)
    fullscreen_toggle = true
if (fullscreen_toggle == true)
{
    fullscreen_toggle = false
    if window_get_fullscreen()
    {
        window_set_fullscreen(false)
        ossafe_ini_open_ch1("true_config.ini")
        ini_write_real("SCREEN", "FULLSCREEN", 0)
        ossafe_ini_close_ch1()
        ossafe_savedata_save_ch1()
    }
    else
    {
        window_set_fullscreen(true)
        ossafe_ini_open_ch1("true_config.ini")
        ini_write_real("SCREEN", "FULLSCREEN", 1)
        ossafe_ini_close_ch1()
        ossafe_savedata_save_ch1()
    }
}
if (window_center_toggle == 2)
{
    window_center()
    window_center_toggle = false
}
if (window_center_toggle == true)
    window_center_toggle = 2
for (i = 0; i < 10; i += 1)
{
    global.input_released[i] = false
    global.input_pressed[i] = false
}
if (instance_exists(obj_gamecontroller) && obj_gamecontroller.gamepad_active == true)
{
    for (var j = 0; j < 4; j++)
    {
        if (keyboard_check(global.input_k[j]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[j]) || scr_gamepad_axis_check_ch1(obj_gamecontroller.gamepad_id, j))
        {
            if (global.input_held[j] == false)
                global.input_pressed[j] = true
            global.input_held[j] = true
        }
        else
        {
            if (global.input_held[j] == true)
                global.input_released[j] = true
            global.input_held[j] = false
        }
    }
    for (var k = obj_sneo_smoke; k < obj_dw_city_mice3Fence; k++)
    {
        if (keyboard_check(global.input_k[k]) || gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[k]))
        {
            if (global.input_held[k] == false)
                global.input_pressed[k] = true
            global.input_held[k] = true
        }
        else
        {
            if (global.input_held[k] == true)
                global.input_released[k] = true
            global.input_held[k] = false
        }
    }
}
else
{
    for (var l = 0; l < 10; l++)
    {
        if keyboard_check(global.input_k[l])
        {
            if (global.input_held[l] == false)
                global.input_pressed[l] = true
            global.input_held[l] = true
        }
        else
        {
            if (global.input_held[l] == true)
                global.input_released[l] = true
            global.input_held[l] = false
        }
    }
}
if border_fade_out
{
    if (border_alpha > 0)
    {
        border_alpha -= border_fade_value
        if (border_alpha <= 0)
            border_alpha = 0
    }
}
else if border_fade_in
{
    if (border_alpha <= 1)
    {
        border_alpha += border_fade_value
        if (border_alpha >= 1)
            border_alpha = 1
    }
}
if scr_debug_ch1()
{
    if keyboard_check_pressed(ord("À"))
    {
        if (room_speed == 30)
            room_speed = (150 - (140 * keyboard_check(vk_control)))
        else
            room_speed = 30
    }
}

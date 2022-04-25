if (!audio_group_is_loaded(1))
    return;
if (!init_loaded)
    return;
if first_time
{
    audio_stop_all()
    room_goto(ROOM_INITIALIZE_ch1)
    return;
}
if (roominit == 0)
{
    surface_resize(application_surface, room_width, room_height)
    if (room == PLACE_CHAPTER_SELECT_2x)
        scale = 2
    roominit = 1
}
for (var i = 0; i < 10; i += 1)
{
    global.input_released[i] = false
    global.input_pressed[i] = false
}
if (obj_gamecontroller.gamepad_active == true)
{
    for (i = 0; i < 4; i += 1)
    {
        if (keyboard_check(global.input_k[i]) || (i_ex(obj_gamecontroller) && (gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i]) || scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, i))))
        {
            if (global.input_held[i] == false)
                global.input_pressed[i] = true
            global.input_held[i] = true
        }
        else
        {
            if (global.input_held[i] == true)
                global.input_released[i] = true
            global.input_held[i] = false
        }
    }
    for (i = 4; i < 10; i += 1)
    {
        if (keyboard_check(global.input_k[i]) || (instance_exists(obj_gamecontroller) && gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i])))
        {
            if (global.input_held[i] == false)
                global.input_pressed[i] = true
            global.input_held[i] = true
        }
        else
        {
            if (global.input_held[i] == true)
                global.input_released[i] = true
            global.input_held[i] = false
        }
    }
}
else
{
    for (i = 0; i < 10; i += 1)
    {
        if keyboard_check(global.input_k[i])
        {
            if (global.input_held[i] == false)
                global.input_pressed[i] = true
            global.input_held[i] = true
        }
        else
        {
            if (global.input_held[i] == true)
                global.input_released[i] = true
            global.input_held[i] = false
        }
    }
}

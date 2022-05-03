if (error_type == "save_failed")
    window_text = text_save_failed
else if (error_type == "save_data_corrupt")
    window_text = text_save_data_corrupt
else if (error_type == "temp_save_failed")
    window_text = text_temp_save_failed
if is_active
{
    if (type == "default")
    {
        if (room == PLACE_CHAPTER_SELECT_2x)
        {
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
        }
        if button1_p()
        {
            is_active = false
            global.savedata_pause = 0
            snd_play(snd_select)
            if (room == PLACE_CHAPTER_SELECT_2x)
            {
                if (global.savedata == -1 || global.savedata == undefined)
                    global.savedata = ds_map_create()
                ossafe_savedata_save()
            }
            else if (room == PLACE_MENU)
                room_restart()
            else
                instance_destroy()
        }
    }
}

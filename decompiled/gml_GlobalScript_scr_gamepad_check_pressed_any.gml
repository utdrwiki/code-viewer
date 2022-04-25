scr_gamepad_check_pressed_any = function() //gml_Script_scr_gamepad_check_pressed_any
{
    if (!i_ex(obj_gamecontroller))
        return 0;
    else
    {
        var button_pressed = 0
        var i = 0
        while (i < 10)
        {
            if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[i])
            {
                button_pressed = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
    }
    return button_pressed;
}


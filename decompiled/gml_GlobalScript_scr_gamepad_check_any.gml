scr_gamepad_check_any = function() //gml_Script_scr_gamepad_check_any
{
    if (!i_ex(obj_gamecontroller))
        return 0;
    else
    {
        var any_input = 0
        var i = 0
        while (i < 4)
        {
            if scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, i)
            {
                any_input = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
        i = 0
        while (i < 10)
        {
            if gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i])
            {
                any_input = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
    }
    return any_input;
}


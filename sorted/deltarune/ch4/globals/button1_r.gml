function button1_r()
{
    if (global.input_released[4])
        return 1;
    if (global.input_released[7])
    {
        return 1;
    }
    else if (gamepad_button_check_released(obj_gamecontroller.gamepad_id, gp_shoulderlb))
    {
        if (!obj_gamecontroller.gamepad_shoulderlb_reassign)
            return 1;
    }
}

function button1_h()
{
    if (global.input_held[4])
        return 1;
    if (global.input_held[7])
    {
        return 1;
    }
    else if (gamepad_button_check(obj_gamecontroller.gamepad_id, gp_shoulderlb))
    {
        if (!obj_gamecontroller.gamepad_shoulderlb_reassign)
            return 1;
    }
}

function scr_shoulder_l()
{
    var gpind = 0;
    with (obj_gamecontroller)
        gpind = gamepad_id;
    return gamepad_button_value(gpind, gp_shoulderl);
}

function scr_shoulder_r()
{
    var gpind = 0;
    with (obj_gamecontroller)
        gpind = gamepad_id;
    return gamepad_button_value(gpind, gp_shoulderr);
}

function scr_shoulder_lb()
{
    var gpind = 0;
    with (obj_gamecontroller)
        gpind = gamepad_id;
    return gamepad_button_value(gpind, gp_shoulderlb);
}

function scr_shoulder_rb()
{
    var gpind = 0;
    with (obj_gamecontroller)
        gpind = gamepad_id;
    return gamepad_button_value(gpind, gp_shoulderrb);
}

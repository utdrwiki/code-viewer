function scr_buttons_swapped()
{
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        if (global.button0 == gp_face1 && global.button1 == gp_face2)
            return false;
        else if (global.button0 == gp_face2 && global.button1 == gp_face1)
            return true;
        else
            return scr_buttons_swapped_ext();
    }
    else if (global.input_k[4] != ord("Z") || global.input_k[5] != ord("X"))
    {
        return scr_buttons_swapped_ext();
    }
    else
    {
        return false;
    }
}

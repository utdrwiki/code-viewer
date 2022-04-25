scr_debug_keycheck = function(argument0) //gml_Script_scr_debug_keycheck
{
    var key = argument0
    var is_pressed = 0
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        var alt_key = -4
        switch key
        {
            case 113:
                alt_key = gp_padu
                break
            case 114:
                alt_key = gp_padr
                break
            case 116:
                alt_key = gp_padd
                break
            case 117:
                alt_key = gp_padl
                break
            case 119:
                alt_key = gp_shoulderl
                break
            case 120:
                alt_key = gp_shoulderlb
                break
            case 121:
                alt_key = gp_shoulderr
                break
            case 86:
                alt_key = gp_select
                break
        }

        if gamepad_button_check(obj_gamecontroller.gamepad_id, gp_shoulderrb)
        {
            if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, alt_key)
                is_pressed = 1
        }
    }
    if ((!is_pressed) && (!global.is_console))
    {
        if keyboard_check_pressed(argument0)
            is_pressed = 1
    }
    return is_pressed;
}


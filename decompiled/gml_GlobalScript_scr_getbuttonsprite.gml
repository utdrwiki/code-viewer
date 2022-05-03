scr_getbuttonsprite = function(argument0, argument1) //gml_Script_scr_getbuttonsprite
{
    var control = argument0
    var isString = argument1
    var button = -4
    var is_dualshock = (os_type == os_ps4 || obj_gamecontroller.gamepad_type == true)
    var button_sprite = button_questionmark
    var invert = (is_dualshock && (global.typer == 50 || global.typer == 70 || global.typer == 71))
    if isString
    {
        if (control == "A")
        {
            button_sprite = button_xbox_left
            if (os_type == os_switch)
                button_sprite = button_switch_left_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_left_dark : button_ps4_dpad_left)
            return button_sprite;
        }
        if (control == "D")
        {
            button_sprite = button_xbox_right
            if (os_type == os_switch)
                button_sprite = button_switch_right_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_right_dark : button_ps4_dpad_right)
            return button_sprite;
        }
        if (control == "W")
        {
            button_sprite = button_xbox_up
            if (os_type == os_switch)
                button_sprite = button_switch_up_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_up_dark : button_ps4_dpad_up)
            return button_sprite;
        }
        if (control == "S")
        {
            button_sprite = button_xbox_down
            if (os_type == os_switch)
                button_sprite = button_switch_down_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_down_dark : button_ps4_dpad_down)
            return button_sprite;
        }
        if (control == "Z")
            button = global.button0
        if (control == "X")
            button = global.button1
        if (control == "C")
            button = global.button2
    }
    else
    {
        button = control
        if (control == gp_padl)
        {
            button_sprite = button_xbox_left
            if (os_type == os_switch)
                button_sprite = button_switch_left_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_left_dark : button_ps4_dpad_left)
            return button_sprite;
        }
        if (control == gp_padr)
        {
            button_sprite = button_xbox_right
            if (os_type == os_switch)
                button_sprite = button_switch_right_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_right_dark : button_ps4_dpad_right)
            return button_sprite;
        }
        if (control == gp_padu)
        {
            button_sprite = button_xbox_up
            if (os_type == os_switch)
                button_sprite = button_switch_up_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_up_dark : button_ps4_dpad_up)
            return button_sprite;
        }
        if (control == gp_padd)
        {
            button_sprite = button_xbox_down
            if (os_type == os_switch)
                button_sprite = button_switch_down_0
            else if is_dualshock
                button_sprite = (invert ? button_ps4_dpad_down_dark : button_ps4_dpad_down)
            return button_sprite;
        }
    }
    if (button == 32769)
    {
        button_sprite = button_xbox_a
        if is_dualshock
            button_sprite = button_ps4_cross_0
        if (os_type == os_switch)
            button_sprite = button_switch_b_0
        return button_sprite;
    }
    if (button == 32770)
    {
        button_sprite = button_xbox_b
        if is_dualshock
            button_sprite = button_ps4_circle_0
        if (os_type == os_switch)
            button_sprite = button_switch_a_0
        return button_sprite;
    }
    if (button == 32771)
    {
        button_sprite = button_xbox_x
        if is_dualshock
            button_sprite = button_ps4_square_0
        if (os_type == os_switch)
            button_sprite = button_switch_y_0
        return button_sprite;
    }
    if (button == 32772)
    {
        button_sprite = button_xbox_y
        if is_dualshock
            button_sprite = button_ps4_triangle_0
        if (os_type == os_switch)
            button_sprite = button_switch_x_0
        return button_sprite;
    }
    if (button == 32773)
    {
        button_sprite = button_xbox_left_bumper
        if is_dualshock
            button_sprite = button_ps4_l1
        if (os_type == os_switch)
            button_sprite = button_switch_l_0
        return button_sprite;
    }
    if (button == 32775)
    {
        button_sprite = button_xbox_left_trigger
        if is_dualshock
            button_sprite = button_ps4_l2
        if (os_type == os_switch)
            button_sprite = button_switch_zl_0
        return button_sprite;
    }
    if (button == 32774)
    {
        button_sprite = button_xbox_right_bumper
        if is_dualshock
            button_sprite = button_ps4_r1
        if (os_type == os_switch)
            button_sprite = button_switch_r_0
        return button_sprite;
    }
    if (button == 32776)
    {
        button_sprite = button_xbox_right_trigger
        if is_dualshock
            button_sprite = button_ps4_r2
        if (os_type == os_switch)
            button_sprite = button_switch_zr_0
        return button_sprite;
    }
    if (button == 32779)
    {
        button_sprite = button_xbox_left_stick
        if is_dualshock
            button_sprite = button_ps4_l3_0
        if (os_type == os_switch)
            button_sprite = button_switch_lStickClick_0
        return button_sprite;
    }
    if (button == 32780)
    {
        button_sprite = button_xbox_right_stick
        if is_dualshock
            button_sprite = button_ps4_r3_0
        if (os_type == os_switch)
            button_sprite = button_switch_rStickClick_0
        return button_sprite;
    }
    if (button == 32777)
    {
        button_sprite = button_xbox_menu
        if is_dualshock
            button_sprite = button_ps4_touchpad
        if (os_type == os_switch)
            button_sprite = button_switch_minus_0
        return button_sprite;
    }
    if (button == 32778)
    {
        button_sprite = button_xbox_share
        if is_dualshock
            return 2520;
        if (os_type == os_switch)
            button_sprite = button_switch_plus_0
        return button_sprite;
    }
    if (button == 32783)
    {
        button_sprite = button_xbox_left
        if (os_type == os_switch)
            button_sprite = button_switch_left_0
        else if is_dualshock
            button_sprite = (invert ? button_ps4_dpad_left_dark : button_ps4_dpad_left)
        return button_sprite;
    }
    if (button == 32784)
    {
        button_sprite = button_xbox_right
        if (os_type == os_switch)
            button_sprite = button_switch_right_0
        else if is_dualshock
            button_sprite = (invert ? button_ps4_dpad_right_dark : button_ps4_dpad_right)
        return button_sprite;
    }
    if (button == 32781)
    {
        button_sprite = button_xbox_up
        if (os_type == os_switch)
            button_sprite = button_switch_up_0
        else if is_dualshock
            button_sprite = (invert ? button_ps4_dpad_up_dark : button_ps4_dpad_up)
        return button_sprite;
    }
    if (button == 32782)
    {
        button_sprite = button_xbox_down
        if (os_type == os_switch)
            button_sprite = button_switch_down_0
        else if is_dualshock
            button_sprite = (invert ? button_ps4_dpad_down_dark : button_ps4_dpad_down)
        return button_sprite;
    }
    return button_sprite;
}


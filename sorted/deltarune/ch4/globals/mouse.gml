function scr_mouse_x()
{
    return mouse_x;
}

function scr_mouse_y()
{
    return mouse_y;
}

function scr_mouse_left()
{
    if (!(global.is_console || onSteamDeck()))
        return mouse_check_button(mb_left);
    else
        return button1_h();
}

function scr_mouse_leftclick()
{
    if (!(global.is_console || onSteamDeck()))
        return mouse_check_button_pressed(mb_left);
    else
        return button1_p();
}

function scr_mouse_leftrelease()
{
    if (!(global.is_console || onSteamDeck()))
        return mouse_check_button_released(mb_left);
    else
        return button1_r();
}

function scr_mouse_right()
{
    if (!(global.is_console || onSteamDeck()))
        return mouse_check_button(mb_right);
    else
        return button2_h();
}

function scr_mouse_rightclick()
{
    if (!(global.is_console || onSteamDeck()))
        return mouse_check_button_pressed(mb_right);
    else
        return button2_p();
}

function scr_mouse_rightrelease()
{
    if (!(global.is_console || onSteamDeck()))
        return mouse_check_button_released(mb_right);
    else
        return button1_r();
}

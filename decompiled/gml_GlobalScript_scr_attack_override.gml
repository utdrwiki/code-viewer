scr_attack_override = function(argument0, argument1, argument2) //gml_Script_scr_attack_override
{
    var __attackdebug = argument0
    if (argument1 > 10)
        argument1 = 10
    if (keyboard_check_pressed(vk_decimal) || keyboard_check_pressed(ord("½")))
    {
        __attackdebug = -1
        scr_debug_print((argument2 + " attack randomized."))
    }
    else
    {
        for (i = 0; i < argument1; i++)
        {
            if (keyboard_check_pressed(ord(string(i))) || keyboard_check_pressed((vk_numpad0 + i)))
                __attackdebug = i
        }
        for (i = argument1; i < 10; i++)
        {
            if (keyboard_check_pressed(ord(string(i))) || keyboard_check_pressed((vk_numpad0 + i)))
                scr_debug_print(((argument2 + " does not have an attack no. ") + string(i)))
        }
    }
    if (__attackdebug != argument0 && __attackdebug > -1)
        scr_debug_print(((argument2 + " attack set to no. ") + string(__attackdebug)))
    if keyboard_check_pressed(vk_tab)
    {
        if (window_get_height() == 480)
        {
            var __screensize = floor((display_get_height() / 480))
            window_set_size((640 * __screensize), (480 * __screensize))
        }
        else
            window_set_size(640, 480)
    }
    return __attackdebug;
}


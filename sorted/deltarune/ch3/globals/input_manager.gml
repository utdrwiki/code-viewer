function scr_input_manager_init()
{
    global.kbdPressedMap = ds_map_create();
    global.kbdRepeatDelaySec = 0.4166666666666667;
    global.kbdRepeatDurationSec = 0.1;
}

function scr_input_manager_process()
{
    global.kbdBlocked = false;
}

function sunkus_kb_block()
{
    global.kbdBlocked = true;
}

function sunkus_kb_check(arg0)
{
    return global.kbdBlocked ? false : keyboard_check(arg0);
}

function sunkus_kb_check_pressed_with_repeat(arg0)
{
    if (global.kbdBlocked)
        return false;
    if (keyboard_check_pressed(arg0))
    {
        ds_map_set(global.kbdPressedMap, arg0, global.kbdRepeatDelaySec);
        return true;
    }
    if (keyboard_check(arg0))
    {
        var time = ds_map_find_value(global.kbdPressedMap, arg0) - (delta_time / 1000000);
        if (time < 0)
        {
            ds_map_set(global.kbdPressedMap, arg0, global.kbdRepeatDurationSec);
            return true;
        }
        ds_map_set(global.kbdPressedMap, arg0, time);
    }
    return false;
}

function sunkus_kb_check_pressed(arg0)
{
    return global.kbdBlocked ? false : keyboard_check_pressed(arg0);
}

function sunkus_kb_check_released(arg0)
{
    return global.kbdBlocked ? false : keyboard_check_released(arg0);
}

function sunkus_kb_check_direct(arg0)
{
    return global.kbdBlocked ? false : keyboard_check_direct(arg0);
}

function sunkus_kb_clear(arg0)
{
    return global.kbdBlocked ? false : keyboard_clear(arg0);
}

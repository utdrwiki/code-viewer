function scr_flag_set(arg0, arg1)
{
    global.flag[arg0] = arg1;
    if (scr_debug())
        show_debug_message("*** flag [" + string(arg0) + "] updated: " + string(arg1) + " | " + scr_flag_name_get(arg0));
}

function scr_setflag(arg0, arg1)
{
    scr_flag_set(arg0, arg1);
}

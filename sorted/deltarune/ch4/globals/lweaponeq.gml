function scr_lweaponeq(arg0, arg1)
{
    if (arg0 >= 0)
        global.litem[arg0] = global.lweapon;
    global.lweapon = arg1;
    global.lwstrength = get_lw_weapon_strength(global.lweapon);
    script_execute(scr_litemname);
    if (arg0 != -1)
    {
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_26);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_26 = 26
}

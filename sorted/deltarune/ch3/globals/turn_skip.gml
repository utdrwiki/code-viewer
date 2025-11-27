function scr_turn_skip()
{
    if (scr_debug && scr_debug_keycheck(ord("V")) && global.turntimer > 0 && instance_exists(obj_growtangle) && scr_isphase("bullets"))
    {
        global.turntimer = 0;
        scr_debug_print("Attack skipped");
    }
}

scr_become_light_ch1 = function() //gml_Script_scr_become_light_ch1
{
    if (scr_litemcheck_ch1(5) == 0)
        scr_litemget_ch1(5)
    if scr_keyitemcheck_ch1(2)
    {
        if (scr_litemcheck_ch1(8) == 0)
            scr_litemget_ch1(8)
    }
    global.lhp = (ceil((global.hp[1] / global.maxhp[1])) * global.lmaxhp)
    if (global.lhp < 1)
        global.lhp = 1
    if (global.lhp > global.lmaxhp)
        global.lhp = global.lmaxhp
    global.lwstrength = 1
    if (global.charweapon[1] == 1)
        global.lweapon = 2
    if (global.charweapon[1] == 5)
        global.lweapon = 6
    if (global.charweapon[1] == 8)
        global.lweapon = 7
    global.darkzone = false
    return;
}


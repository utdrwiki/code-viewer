scr_fountain_levelup = function() //gml_Script_scr_fountain_levelup
{
    if (global.chapter == 2)
    {
        global.maxhp[1] = clamp(global.maxhp[1], 160, 999)
        global.maxhp[2] = clamp(global.maxhp[2], 190, 999)
        global.maxhp[3] = clamp(global.maxhp[3], 140, 999)
        for (var _i = global.flag[66]; _i < 2; _i++)
        {
            global.at[1] = (global.at[1] + 1)
            global.at[2] = (global.at[2] + 1)
            global.mag[2] = (global.mag[2] + 1)
            global.at[3] = (global.at[3] + 1)
            global.mag[3] = (global.mag[3] + 1)
        }
    }
    return;
}


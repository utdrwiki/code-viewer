scr_attackphase_ch1 = function() //gml_Script_scr_attackphase_ch1
{
    with (obj_battlecontroller_ch1)
    {
        techwon = false
        if (scr_monsterpop_ch1() == 0)
            techwon = true
        if (techwon == false)
        {
            fightphase = 1
            global.charturn = 3
            if (global.charaction[0] == 4 || global.charaction[0] == 2)
                fightphase = 0
            if (global.charaction[1] == 4 || global.charaction[1] == 2)
                fightphase = 0
            if (global.charaction[2] == 4 || global.charaction[2] == 2)
                fightphase = 0
            if (global.myfight == 4)
                fightphase = 1
            if (fightphase == 1)
            {
                global.myfight = 1
                instance_create_ch1((xx + 2), (yy + 365), obj_attackpress_ch1)
            }
            else
            {
                global.myfight = 4
                instance_create_ch1(0, 0, obj_spellphase_ch1)
            }
        }
        else
            scr_wincombat_ch1()
    }
    return;
}


scr_wincombat_ch1 = function() //gml_Script_scr_wincombat_ch1
{
    global.myfight = 7
    global.mnfight = -1
    with (obj_battlecontroller_ch1)
        victory = true
    for (i = 0; i < 3; i += 1)
    {
        if (global.monster[i] == true && instance_exists(global.monsterinstance[i]))
        {
            with (global.monsterinstance[i])
                scr_monsterdefeat_ch1()
        }
    }
    return;
}


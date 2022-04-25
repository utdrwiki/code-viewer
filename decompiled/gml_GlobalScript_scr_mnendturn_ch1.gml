scr_mnendturn_ch1 = function() //gml_Script_scr_mnendturn_ch1
{
    if (global.char[0] == 2)
        sus = 0
    if (global.char[1] == 2)
        sus = 1
    if (global.char[2] == 2)
        sus = 2
    techwon = false
    if (scr_monsterpop_ch1() == 0)
        techwon = true
    if (techwon == false)
    {
        scr_battlecursor_memory_reset_ch1()
        global.mnfight = 0
        global.myfight = 0
        global.bmenuno = 0
        global.charturn = 0
        skip = false
        for (i = 0; i < 3; i += 1)
        {
            with (global.charinstance[i])
                tu = 0
            hptarget = global.char[i]
            if (global.char[i] != 0 && global.hp[hptarget] <= 0)
            {
                healamt = ceil((global.maxhp[hptarget] / 8))
                dmgwr = instance_create_ch1(global.charinstance[i].x, ((global.charinstance[i].y + global.charinstance[i].myheight) - 24), obj_dmgwriter_ch1)
                with (dmgwr)
                {
                    delay = 1
                    type = 3
                }
                dmgwr.damage = scr_heal_ch1(i, healamt)
                if (global.hp[hptarget] >= 1)
                {
                    with (dmgwr)
                        specialmessage = 4
                }
            }
        }
        if (global.charmove[0] == false || global.charauto[global.char[0]] == true)
            global.charturn = 1
        if (global.charturn == 1)
        {
            if (global.charmove[1] == false || global.charauto[global.char[1]] == true)
                global.charturn = 2
        }
        if (global.charturn == 2)
        {
            if (global.charmove[2] == false || global.charauto[global.char[2]] == true)
                skip = true
        }
        for (i = 0; i < 3; i += 1)
        {
            global.acting[i] = false
            global.temptension[i] = global.tension
            global.charspecial[i] = 0
            global.targeted[i] = false
            global.charaction[i] = 0
            global.faceaction[i] = 0
        }
        with (obj_monsterparent_ch1)
        {
            attacked = false
            talked = false
            acting = false
        }
        if (skip == true)
        {
            if (global.char[0] == 2 && global.charauto[2] == true)
            {
                global.acting[0] = true
                global.myfight = 3
            }
            scr_endturn_ch1()
        }
        for (i = 0; i < 12; i += 1)
        {
            for (j = 0; j < 3; j += 1)
                tempitem[i][j] = global.item[i]
        }
    }
    else
        scr_wincombat_ch1()
    return;
}


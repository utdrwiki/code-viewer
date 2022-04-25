scr_endturn = function() //gml_Script_scr_endturn
{
    for (i = 0; i < 12; i += 1)
        global.item[i] = tempitem[i][global.charturn]
    for (i = 0; i < 12; i += 1)
    {
        for (j = 0; j < 3; j += 1)
            tempitem[i][j] = global.item[i]
    }
    moveswapped = false
    with (obj_writer)
        instance_destroy()
    with (obj_face)
        instance_destroy()
    with (obj_smallface)
        instance_destroy()
    global.attacking = false
    for (i = 0; i < 3; i += 1)
    {
        global.monsterattackname[i] = " "
        if (global.charauto[global.char[i]] == true && global.hp[global.char[i]] > 0)
        {
            if (global.monster[2] == true)
                global.chartarget[i] = 2
            if (global.monster[1] == true)
                global.chartarget[i] = 1
            if (global.monster[0] == true)
                global.chartarget[i] = 0
        }
        if (global.charaction[i] == 1)
            global.attacking = true
    }
    __noactors = true
    if (global.acting[0] == true)
        __noactors = false
    for (__noactorsi = 0; __noactorsi < 3; __noactorsi++)
    {
        if (global.actingsingle[__noactorsi] == true)
            __noactors = false
    }
    if (__noactors == true)
        scr_attackphase()
    else
    {
        global.charturn = 3
        global.myfight = 3
        global.currentactingchar = 0
        if (global.acting[0] == false)
            scr_nextact()
        if (global.chapter == 2 && instance_exists(obj_sweet_enemy) && global.actingsingle[0] == true && global.actingsingle[1] == false && global.actingsingle[2] == false)
            obj_sweet_enemy.simultotal_funny = true
        if (global.acting[0] == true && global.actingsimul[0] == true)
            scr_act_simul()
    }
    with (obj_battlecontroller)
    {
        messagepriority = -1
        attackpriority = -1
    }
    return;
}


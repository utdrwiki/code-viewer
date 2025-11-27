function scr_endturn()
{
    for (i = 0; i < 12; i += 1)
        global.item[i] = tempitem[i][global.charturn];
    for (i = 0; i < 12; i += 1)
    {
        for (j = 0; j < 3; j += 1)
            tempitem[i][j] = global.item[i];
    }
    moveswapped = 0;
    with (obj_writer)
        instance_destroy();
    if (global.chapter == 3 && i_ex(obj_tennabattleconvo_controller) && (obj_tennabattleconvo_controller.chattedduringbulletphase == true || obj_tennabattleconvo_controller.introcon < 3))
    {
    }
    else
    {
        with (obj_face)
            instance_destroy();
    }
    with (obj_smallface)
        instance_destroy();
    if (global.chapter == 3)
        idefendedthisturn = 0;
    global.attacking = 0;
    for (i = 0; i < 3; i += 1)
    {
        global.monsterattackname[i] = " ";
        if (global.charauto[global.char[i]] == 1 && global.hp[global.char[i]] > 0)
        {
            if (global.monster[2] == 1)
                global.chartarget[i] = 2;
            if (global.monster[1] == 1)
                global.chartarget[i] = 1;
            if (global.monster[0] == 1)
                global.chartarget[i] = 0;
        }
        if (global.charaction[i] == 1)
            global.attacking = 1;
    }
    __noactors = 1;
    if (global.acting[0] == 1)
        __noactors = 0;
    for (__noactorsi = 0; __noactorsi < 3; __noactorsi++)
    {
        if (global.actingsingle[__noactorsi] == 1)
            __noactors = 0;
    }
    if (__noactors == 1)
    {
        scr_attackphase();
    }
    else
    {
        global.charturn = 3;
        global.myfight = 3;
        global.currentactingchar = 0;
        if (global.acting[0] == 0)
            scr_nextact();
        if (global.acting[0] == 1 && global.actingsimul[0] == 1)
            scr_act_simul();
    }
    with (obj_battlecontroller)
    {
        messagepriority = -1;
        attackpriority = -1;
    }
}

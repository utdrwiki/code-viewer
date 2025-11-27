function scr_nextact()
{
    global.acting[0] = 0;
    global.acting[1] = 0;
    global.acting[2] = 0;
    global.actingsingle[global.currentactingchar] = 0;
    __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]];
    with (__minstance)
    {
        acting = 0;
        actcon = 0;
        actconsus = 0;
        actconral = 0;
        actconnoe = 0;
    }
    var singleactcomplete = 0;
    while (global.currentactingchar < 3)
    {
        global.currentactingchar++;
        if (global.currentactingchar < 3)
        {
            if (global.actingsingle[global.currentactingchar] == 1)
            {
                __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]];
                if (global.char[global.currentactingchar] == 2)
                {
                    with (__minstance)
                        actconsus = 1;
                    if (global.actingsimul[global.currentactingchar] == 0)
                        singleactcomplete = 1;
                    break;
                }
                if (global.char[global.currentactingchar] == 3)
                {
                    with (__minstance)
                        actconral = 1;
                    if (global.actingsimul[global.currentactingchar] == 0)
                        singleactcomplete = 1;
                    break;
                }
                if (global.char[global.currentactingchar] == 4)
                {
                    with (__minstance)
                        actconnoe = 1;
                    if (global.actingsimul[global.currentactingchar] == 0)
                        singleactcomplete = 1;
                    break;
                }
            }
        }
    }
    if (i_ex(obj_sound_of_justice_enemy) && obj_sound_of_justice_enemy.phase == 1)
    {
        global.charturn = 3;
        global.myfight = 3;
        global.currentactingchar = 0;
        if (global.acting[0] == 0)
            scr_nextact();
        if (global.acting[0] == 1 && global.actingsimul[0] == 1)
            scr_act_simul();
        exit;
    }
    if (global.currentactingchar >= 3)
    {
        with (obj_monsterparent)
        {
            acting = 0;
            actingsus = 0;
            actingral = 0;
            actingnoe = 0;
        }
        global.currentactingchar = 0;
        scr_attackphase();
    }
    else if (!singleactcomplete)
    {
        scr_act_simul();
    }
}

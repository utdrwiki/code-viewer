scr_nextact = function() //gml_Script_scr_nextact
{
    global.acting[0] = false
    global.acting[1] = false
    global.acting[2] = false
    global.actingsingle[global.currentactingchar] = false
    __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]]
    with (__minstance)
    {
        acting = false
        actcon = 0
        actconsus = 0
        actconral = 0
        actconnoe = 0
    }
    var singleactcomplete = 0
    while (global.currentactingchar < 3)
    {
        global.currentactingchar++
        if (global.currentactingchar < 3)
        {
            if (global.actingsingle[global.currentactingchar] == true)
            {
                __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]]
                if (global.char[global.currentactingchar] == 2)
                {
                    with (__minstance)
                        actconsus = 1
                    if (global.actingsimul[global.currentactingchar] == false)
                        singleactcomplete = 1
                    break
                }
                else if (global.char[global.currentactingchar] == 3)
                {
                    with (__minstance)
                        actconral = 1
                    if (global.actingsimul[global.currentactingchar] == false)
                        singleactcomplete = 1
                    break
                }
                else if (global.char[global.currentactingchar] == 4)
                {
                    with (__minstance)
                        actconnoe = 1
                    if (global.actingsimul[global.currentactingchar] == false)
                        singleactcomplete = 1
                    break
                }
                else
                    continue
            }
            else
                continue
        }
        else
            continue
    }
    if (global.currentactingchar >= 3)
    {
        with (obj_monsterparent)
        {
            acting = false
            actingsus = false
            actingral = false
            actingnoe = false
        }
        global.currentactingchar = 0
        scr_attackphase()
    }
    else if (!singleactcomplete)
        scr_act_simul()
    return;
}


scr_endturn_ch1 = function() //gml_Script_scr_endturn_ch1
{
    for (i = 0; i < 12; i += 1)
        global.item[i] = tempitem[i][global.charturn]
    for (i = 0; i < 12; i += 1)
    {
        for (j = 0; j < 3; j += 1)
            tempitem[i][j] = global.item[i]
    }
    moveswapped = false
    with (obj_writer_ch1)
        instance_destroy()
    with (obj_face_ch1)
        instance_destroy()
    with (obj_smallface_ch1)
        instance_destroy()
    global.attacking = false
    for (i = 0; i < 3; i += 1)
    {
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
    if (global.acting[0] == false)
        scr_attackphase_ch1()
    else
    {
        global.charturn = 3
        global.myfight = 3
    }
    return;
}


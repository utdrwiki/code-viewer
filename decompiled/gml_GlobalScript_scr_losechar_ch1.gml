scr_losechar_ch1 = function() //gml_Script_scr_losechar_ch1
{
    global.char[2] = 0
    global.char[1] = 0
    for (i = 0; i < 36; i += 1)
        global.submenucoord[i] = 0
    with (obj_darkcontroller_ch1)
    {
        chartotal = 0
        havechar[0] = false
        havechar[1] = false
        havechar[2] = false
        for (i = 0; i < 3; i += 1)
        {
            global.faceaction[i] = 0
            if (global.char[i] != 0)
                chartotal += 1
            if (global.char[i] == 1)
            {
                havechar[0] = true
                charpos[0] = i
            }
            if (global.char[i] == 2)
            {
                havechar[1] = true
                charpos[1] = i
            }
            if (global.char[i] == 3)
            {
                havechar[2] = true
                charpos[2] = i
            }
        }
    }
    return;
}


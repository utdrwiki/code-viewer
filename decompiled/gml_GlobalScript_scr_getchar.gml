scr_getchar = function(argument0) //gml_Script_scr_getchar
{
    getchar = 0
    if (global.char[0] == 0)
    {
        global.char[0] = argument0
        getchar = 1
    }
    if (global.char[1] == 0 && getchar == 0)
    {
        global.char[1] = argument0
        getchar = 1
    }
    if (global.char[2] == 0 && getchar == 0)
    {
        global.char[2] = argument0
        getchar = 1
    }
    with (obj_darkcontroller)
    {
        chartotal = 0
        havechar[0] = false
        havechar[1] = false
        havechar[2] = false
        havechar[3] = false
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
            if (global.char[i] == 4)
            {
                havechar[3] = true
                charpos[3] = i
            }
        }
    }
    return;
}


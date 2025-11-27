function scr_getchar(arg0)
{
    switch (arg0)
    {
        case "kr":
        case "kris":
            arg0 = 1;
            break;
        case "su":
        case "susie":
            arg0 = 2;
            break;
        case "ra":
        case "ralsei":
            arg0 = 3;
            break;
        case "no":
        case "noelle":
            arg0 = 4;
            break;
    }
    var characterToGet = arg0;
    getchar = 0;
    if (global.char[0] == 0)
    {
        global.char[0] = characterToGet;
        getchar = 1;
    }
    if (global.char[1] == 0 && getchar == 0)
    {
        global.char[1] = characterToGet;
        getchar = 1;
    }
    if (global.char[2] == 0 && getchar == 0)
    {
        global.char[2] = characterToGet;
        getchar = 1;
    }
    with (obj_darkcontroller)
    {
        chartotal = 0;
        havechar[0] = 0;
        havechar[1] = 0;
        havechar[2] = 0;
        havechar[3] = 0;
        for (i = 0; i < 3; i += 1)
        {
            global.faceaction[i] = 0;
            if (global.char[i] != 0)
                chartotal += 1;
            if (global.char[i] == 1)
            {
                havechar[0] = 1;
                charpos[0] = i;
            }
            if (global.char[i] == 2)
            {
                havechar[1] = 1;
                charpos[1] = i;
            }
            if (global.char[i] == 3)
            {
                havechar[2] = 1;
                charpos[2] = i;
            }
            if (global.char[i] == 4)
            {
                havechar[3] = 1;
                charpos[3] = i;
            }
        }
    }
}

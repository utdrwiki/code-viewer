function scr_get_outline_color(arg0, arg1 = 8421504, arg2 = 1)
{
    var col = arg1;
    var krcol = 15245824;
    var sucol = 13138410;
    var racol = 1959605;
    var gercol = 2533989;
    var nocol = 12320748;
    if (arg2 == 2)
    {
        col = 12736850;
        krcol = 13462088;
        sucol = 10305336;
        racol = 13265482;
        gercol = 12736850;
        nocol = 12736850;
    }
    if (arg0.object_index == obj_mainchara)
        col = krcol;
    if (arg0.object_index == obj_caterpillarchara)
    {
        if (arg0.name == "susie")
            col = sucol;
        else if (arg0.name == "ralsei")
            col = racol;
        else if (arg0.name == "noelle")
            col = nocol;
        else
            return 8421504;
    }
    if (object_get_parent(arg0.object_index) == 1276)
    {
        if (arg0.object_index == obj_herokris)
            col = krcol;
        else if (arg0.object_index == obj_herosusie)
            col = sucol;
        else if (arg0.object_index == obj_heroralsei)
            col = racol;
        else if (arg0.object_index == obj_heronoelle)
            col = nocol;
    }
    if (arg0.object_index == obj_actor)
    {
        if (arg0.name == "kris")
            col = krcol;
        if (arg0.name == "susie")
            col = sucol;
        if (arg0.name == "ralsei")
            col = racol;
        if (arg0.name == "noelle")
            col = nocol;
        if (arg0.name == "gerson")
            col = gercol;
    }
    if (room == room_dw_church_darkmaze)
    {
        with (obj_dw_church_darkmaze)
        {
            if (arg0 == germark)
                col = gercol;
            if (arg0 == gerson)
                col = gercol;
            if (arg0 == sumark)
                col = sucol;
            if (arg0 == ramark)
                col = racol;
        }
    }
    if (room == room_dw_church_intro_gerson)
    {
        with (obj_dw_church_intro_gerson)
        {
            if (arg0 == gerson)
                col = gercol;
        }
    }
    return col;
}

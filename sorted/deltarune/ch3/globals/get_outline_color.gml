function scr_get_outline_color(arg0)
{
    if (arg0.object_index == obj_mainchara)
    {
        return 15245824;
    }
    else if (arg0.object_index == obj_caterpillarchara)
    {
        if (arg0.name == "susie")
            return 13138410;
        else if (arg0.name == "ralsei")
            return 1959605;
        else if (arg0.name == "noelle")
            return 65535;
        else
            return 8421504;
    }
    else
    {
        return 8421504;
    }
}

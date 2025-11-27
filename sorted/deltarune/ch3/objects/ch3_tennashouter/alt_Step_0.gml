if (!init)
{
    with (object_index)
    {
        if (id != other.id)
            instance_destroy();
    }
    msgset(0, mystring);
    scr_speaker("tenna");
    writer = instance_create(x, y, obj_writer);
    with (writer)
    {
        myfont = scr_84_get_font("dotumche");
        charline = 24;
        hspace = (global.lang == "ja") ? 12 : 9;
        vspace = 18;
        skippable = other.skippable;
    }
    if (customlife != -1)
        lifetime = customlife;
    else
        lifetime = string_length(mystring) * 3;
    if (preset == 1)
    {
        tennasprite = 3185;
        txoff = 20;
        tyoff = 68;
        txscale = 0.5;
        tyscale = 0.5;
    }
    if (preset == 2)
    {
        tanimrate = 0.5;
        tennasprite = 1015;
        txoff = 20;
        tyoff = 68;
        txscale = 0.5;
        tyscale = 0.5;
    }
    if (preset == 3)
    {
        tanimrate = 0.5;
        tennasprite = 4959;
        txoff = 20;
        tyoff = 68;
        txscale = 0.5;
        tyscale = 0.5;
    }
    if (tcustanimrate != -1)
        tanimrate = tcustanimrate;
    init = 1;
}
if (init)
{
    lifetimer++;
    if (lifetimer >= lifetime)
        instance_destroy();
}

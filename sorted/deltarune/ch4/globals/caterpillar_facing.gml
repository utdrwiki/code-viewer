function scr_caterpillar_facing(arg0 = 0, arg1 = "all")
{
    with (obj_caterpillarchara)
    {
        if (name == arg1 || arg1 == "all")
        {
            for (var _i = 0; _i < 25; _i += 1)
                facing[_i] = arg0;
        }
    }
}

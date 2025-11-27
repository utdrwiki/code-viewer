function scr_setparty(arg0 = false, arg1 = false, arg2 = false)
{
    var kris = obj_mainchara;
    var slot = 0;
    var __make = true;
    if (!i_ex(kris))
        __make = false;
    scr_losechar();
    safe_delete(obj_caterpillarchara);
    if (arg0 == true)
    {
        scr_getchar(2);
        if (__make)
        {
            with (scr_makecaterpillar(kris.x, kris.y, 2, slot))
            {
                halign = (global.darkzone == 0) ? 3 : 6;
                valign = (global.darkzone == 0) ? 6 : 16;
                x -= halign;
                y -= valign;
            }
        }
        slot++;
    }
    if (arg1 == true)
    {
        scr_getchar(3);
        if (__make)
        {
            with (scr_makecaterpillar(kris.x, kris.y, 3, slot))
            {
                halign = 2;
                valign = 12;
                x -= halign;
                y -= valign;
            }
        }
        slot++;
    }
    if (arg2 == true)
    {
        scr_getchar(4);
        if (__make)
        {
            with (scr_makecaterpillar(kris.x, kris.y, 4, slot))
            {
                halign = (global.darkzone == 0) ? 2 : 4;
                valign = (global.darkzone == 0) ? 9 : 18;
                x -= halign;
                y -= valign;
            }
        }
        slot++;
    }
}

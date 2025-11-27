con = (global.plot < 350) ? 0 : -1;
customcon = 0;
susie_hide = false;
susie_shadow = 0;
if (con == 0)
{
    scr_losechar();
    scr_setparty(1, 0, 0);
    with (obj_caterpillarchara)
    {
        fun = 1;
        follow = 0;
        if (name == "susie")
        {
            x = 410;
            y = 254;
            sprite_index = usprite;
        }
    }
}

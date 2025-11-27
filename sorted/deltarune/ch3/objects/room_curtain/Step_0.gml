if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 15;
}
if (con == 2)
{
    con = 3;
    global.interact = 0;
    global.facing = 0;
    with (obj_mainchara)
    {
        fun = 0;
        cutscene = 0;
    }
    with (obj_caterpillarchara)
    {
        fun = 0;
        follow = 1;
        scr_caterpillar_interpolate();
    }
}

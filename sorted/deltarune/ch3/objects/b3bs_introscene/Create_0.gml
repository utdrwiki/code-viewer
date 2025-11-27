con = 0;
timer = 0;
if (global.plot >= 200)
{
    if (global.flag[1057] == 1)
    {
        global.flag[1057] = 2;
        scr_setparty(1, 1, 0);
        con = 1;
    }
    else
    {
        instance_create(140, 280, obj_savepoint);
        instance_create(x, y, obj_musicer_b3bs);
        instance_destroy();
    }
}

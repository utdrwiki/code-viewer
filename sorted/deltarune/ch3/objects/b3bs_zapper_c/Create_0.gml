dostuff = true;
if (scr_enemylostcheck("zapper"))
    dostuff = false;
if (dostuff)
{
    if (scr_debug())
        scr_setparty(1, 1, 0);
    con = 0;
    timer = 0;
    stealth = instance_create(0, 0, obj_b3bs_stealth);
    light = instance_create(242, 60, obj_dw__backstagelight);
    with (light)
    {
        type = 1;
        movetype = 1;
        movespeed = 100;
        rate = 80;
        timer = 420;
        image_blend = #CF7CCB;
    }
    scr_stealth_drawmarkers();
    with (instance_create(200, 240, obj_b3bs_stealthSolid))
        scr_size(5, 1);
}
else
{
    with (obj_dw_ch3_b3bs_zapperhead)
        instance_destroy();
    instance_destroy();
}

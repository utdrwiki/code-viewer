if (!darkinit)
{
    scr_populatechars();
    slight = instance_create(236, 246, obj_light_following);
    slight.target = susie;
    slight.xoff = 26;
    slight.yoff = 46;
    if (i_ex(ralsei))
    {
        rlight = instance_create(ralsei.x, ralsei.y, obj_light_following);
        rlight.target = ralsei;
        rlight.xoff = 18;
        rlight.yoff = 40;
    }
    klight = instance_create(406, 254, obj_light_following);
    klight.target = kris;
    klight.xoff = 18;
    klight.yoff = 38;
    darkinit = 1;
}
if (con == 1)
{
    setxy(388, 216, kris);
    setxy(210, 200, susie);
    con = 2;
}

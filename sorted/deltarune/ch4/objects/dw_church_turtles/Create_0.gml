layer_set_visible("DEBUG_ASSETS", 0);
scr_setparty(1, 1, 0);
if (global.plot > 141)
{
    with (obj_light_area_simple)
        y = 0;
    with (obj_light_area_simple_dim)
        y = 0;
}
battletimer = 0;
battlecon = 0;
domake = true;
plspeed[0] = 0;
encounterno = 151;
encounterflag = 1780;
gerson = -4;
con = 0;
timer = 0;
leavecon = 0;
if (global.flag[encounterflag] == 1)
    domake = false;
if (global.plot == 141)
{
    domake = true;
    encounterflag = 1781;
}
if (global.plot == 141)
{
    gerson = scr_marker_ext(1220, 314, spr_gerson_outfit_walk_cane, 2, 2, 0, 0, undefined, undefined);
    mysolid = instance_create(240, 400, obj_solidblocksized);
    mysolid.image_xscale = 20;
}
shadowinit = 0;

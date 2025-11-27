if (special == 3)
    sprite_index = spr_musicgate_breakable;
if (special > 0 && special <= 2)
{
    mysolid = instance_create(x, y + 80, obj_marker);
    mysolid.image_xscale = 2;
    mysolid.image_yscale = 2;
    if (special == 2)
        sprite_index = spr_dw_church_shelfpuz_2x2ladder;
}
else
{
    mysolid = instance_create(x, y + 80, obj_solidblocksized);
}
mysolid.extflag = "breakable";
scr_size(2, 2, mysolid);
init = 0;
scr_size(2, 2);
image_blend = c_white;
image_alpha = 1;
if (special == 0)
    scr_depth_alt();
else
    depth = 999999;
con = 0;
alpha = 0;
active = 0;
image_speed = 0;
siner = 0;

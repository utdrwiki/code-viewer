scr_musicer("darkchurch_intro.ogg", 0.7);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.flag[1529] = 0;
    scr_setparty(1, 1);
}
con = 0;
timer = 0;
siner = 0;
prophecy[0] = instance_create(620, 800, obj_dw_church_prophecy);
prophecy[1] = instance_create(1100, 800, obj_dw_church_prophecy);
prophecy[2] = instance_create(1440, 1432, obj_dw_church_prophecy);
prophecy[0].extflag = "knight2";
prophecy[1].extflag = "knight1";
prophecy[2].extflag = "knight1";
prop1interact = instance_create(1400, 1472, obj_trigger_interact);
scr_size(5, 3, prop1interact);
prop1interact.issolid = true;
prop1interact.strict = true;
proptrig[0] = -4;
proptrig[1] = -4;
proptrig[2] = -4;
roomglow = instance_create(0, 0, obj_roomglow);
presparkle = 0;

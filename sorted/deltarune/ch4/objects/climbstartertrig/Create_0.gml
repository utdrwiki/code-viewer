con = 0;
timer = 0;
jumpmarker = 0;
endtime = 999;
jumpmarker = 0;
camx = -4;
camy = -4;
mysolid = -4;
amsolid = false;
if (scr_debug())
{
    if (global.plot >= 230)
        global.flag[23] = 1;
}
if (global.flag[23] == 0)
{
    amsolid = true;
    mysolid = instance_create(x, y, obj_solidblock);
    mysolid.image_xscale = image_xscale;
    mysolid.image_yscale = image_yscale;
    mysolid.sprite_index = sprite_index;
}
myinteract = 0;

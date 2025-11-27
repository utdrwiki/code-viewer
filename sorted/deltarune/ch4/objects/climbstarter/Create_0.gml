con = 0;
timer = 0;
image_alpha = 0.1;
jumpmarker = 0;
endtime = 999;
jumpmarker = 0;
camx = -4;
camy = -4;
mysolid = -4;
amsolid = false;
forcetoclimb = false;
if (global.flag[23] == 0)
{
    amsolid = true;
    mysolid = instance_create(x, y, obj_solidblock);
    mysolid.image_xscale = image_xscale;
    mysolid.image_yscale = image_yscale;
    mysolid.sprite_index = sprite_index;
}
susieball = -4;
susietimer = 0;

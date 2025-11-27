ammo = 30;
timer = 0;
con = 0;
siner = 66;
savex = 0;
savey = 0;
image_alpha = 0;
image_xscale = 3;
image_yscale = 3;
x = camerax() + 200;
y = cameray() + 157;
xstart = x;
ystart = y;
shoottimer = 0;
disablesbattleui = false;
disabledebugui = false;
disableactui = false;
stopshooting = false;
if (disablesbattleui == true)
{
    with (obj_writer)
        instance_destroy();
}

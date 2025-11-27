image_xscale = 2;
image_yscale = 2;
image_speed = 0;
kris = 0;
with (obj_mainchara_board)
{
    if (name == "kris")
        other.kris = id;
}
timer = 0;
con = 0;
type = 0;
active = 0;
fakeheight = 44;
fakeheightspeed = 0;
fakey = -15;
savespeed = 0;
targetx = x;
targety = y;
distancex = 0;
distancey = 0;
if (kris != 0)
    depth = kris.depth - 1;
savedepth = depth;
init = 0;
flickershadow = 1;

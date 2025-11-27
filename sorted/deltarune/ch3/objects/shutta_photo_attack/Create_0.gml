flip_image = -1;
siner = 5;
flip = 1;
scale = 2;
image_xscale = 2;
image_yscale = 2;
flipping = false;
slider = 0;
slidetime = 15;
rotater = 0;
xspawn = 0;
yspawn = 0;
rspawn = 0;
fliptime = 8;
visible = false;
image_speed = 0;
backside = false;
startdepth = depth;
con = 0;
init = false;
photo = true;

function DoFlip(arg0 = -1)
{
    if (arg0 > -1)
        flip_image = arg0;
    siner = -fliptime;
    rspawn = image_angle;
    rotater = random_range(-5, 5);
}

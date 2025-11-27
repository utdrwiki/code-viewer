if (active == false && init == 0)
{
    x = room_width * 2;
    y = room_height * 2;
    image_xscale = 0.01;
    image_yscale = 0.01;
    init = 1;
}
if (active == true && init == 0)
{
    x = remx;
    y = remy;
    image_xscale = remsizex;
    image_yscale = remsizey;
    init = 1;
}
if (keyboard_check(ord("B")) && global.debug == true)
    image_alpha = 0.1;
else
    image_alpha = 0;

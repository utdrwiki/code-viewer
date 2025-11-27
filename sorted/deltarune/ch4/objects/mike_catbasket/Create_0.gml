depth = 2;
image_speed = 0;
action = 0;
xscale = 1;
yscale = 1;
timer = irandom(120);
move = false;
type = 0;
lastx = xstart;
y = cameray() + cameraheight() + 200;
last_cat_was_thrown = false;
cats = 0;
for (i = 0; i < 20; i++)
{
    scale[i] = 0;
    xx[i] = 0;
    yy[i] = 0;
}
scoreflash = 0;
keepalive = false;

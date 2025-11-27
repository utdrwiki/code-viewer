cageshake = 0;
cageamt = 0;
shaketimer = 0;
wagon_x = 235;
wagon_y = 165;
heartwagon = 0;
heartx = 0;
hearty = 0;
scr_depth();
depth = 9999;
if (global.plot >= 310 && global.plot < 320)
    heartwagon = 1;
else
    instance_destroy();

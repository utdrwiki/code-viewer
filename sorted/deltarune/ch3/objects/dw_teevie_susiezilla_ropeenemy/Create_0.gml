con = 0;
timer = 0;
siner = 0;
dangle = -480;
fakey = dangle;
active = 0;
release = false;
erase = true;
encounterflag = 592;
if (global.flag[encounterflag] == 1)
    instance_destroy();
y += irandom_range(-40, 40);
x += irandom_range(-40, 40);
x = scr_even(x);
y = scr_even(y);
y = clamp(y, 152, 300);

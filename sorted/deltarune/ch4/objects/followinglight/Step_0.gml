if (global.interact != 1 || timer <= 0)
    timer -= 0.2;
if (timer > 30)
    timer = 30;
if (timer < 0)
    timer -= 0.1;
if (timer < -10)
    timer = -10;
radius = scr_ease_out(timer / 30, 4) * 160;
siner++;
smallerLight = max(0, (sin(siner / 30) * 10) + radius);
biggerLight = max(0, (sin((siner - 10) / 30) * 10) + radius + 40);
image_xscale = (radius + 50) / 210;
image_yscale = (radius + 50) / 210;
if (radius < -50)
    radius = -50;

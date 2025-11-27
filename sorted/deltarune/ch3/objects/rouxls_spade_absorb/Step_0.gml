timer++;
if (timer <= 30)
    dir = lerp(startdir, dirend, timer / 30);
if (len > 0)
    len -= 5;
x = xstart + lengthdir_x(len, dir);
y = ystart + lengthdir_y(len, dir);
image_alpha += 0.15;

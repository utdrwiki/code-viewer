if (!lancer_visible)
    exit;
siner++;
image_index = round((siner / 3) * 0.3183098861837907);
var addx = cos(siner / 3) * 16;
var addy = sin(siner / 3) * 8;
x = xstart + addx;
y = ystart + addy;
if (addx <= -8)
    image_index = 0;
if (addy <= -4)
    image_index = 1;
if (addx >= 8)
    image_index = 2;
if (addy >= 4)
    image_index = 3;
draw_self();

if (global.debug == 1)
{
    if (keyboard_check_pressed(ord("N")))
        crazy = 1 - crazy;
}
if (crazy)
{
    siner++;
    y = ystart + (sin(xstart + (siner / 20)) * 10);
    x = xstart + (cos(xstart + (siner / 20)) * 40);
    auto += 10;
}

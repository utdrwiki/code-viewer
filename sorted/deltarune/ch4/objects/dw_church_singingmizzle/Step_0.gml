singtimer--;
var targalpha = 0;
if (singtimer > 0)
{
    targalpha = 0.7;
    if (singtimer >= (singtimermax - 8))
        targalpha = 1;
}
else if (singtimer > -8)
{
    targalpha = 0.7;
}
image_alpha = scr_approach(image_alpha, targalpha, 0.02);
if (image_alpha > 0)
{
    animtimer += 0.5;
    image_index = floor(animtimer / 4) % 3;
}

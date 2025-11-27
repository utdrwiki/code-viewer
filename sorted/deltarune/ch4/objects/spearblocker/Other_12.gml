if (diagonal_enabled)
{
    if (transformtimer < 10)
        transformtimer++;
}
var sidelength = lerp(28, 33, transformtimer / 10);
var progress = lerp(0, 17, transformtimer / 10);
var shakex = 0;
var shakey = 0;
if (shake > 0)
{
    shakex = -10 + random(20);
    shakey = -10 + random(20);
}
var xx = x + shakex;
var yy = y + shakey;
d_line(xx + sidelength, (yy - sidelength) + progress, xx + sidelength, (yy + sidelength) - progress);
d_line((xx - sidelength) + progress, yy - sidelength, (xx + sidelength) - progress, yy - sidelength);
d_line(xx - sidelength, (yy - sidelength) + progress, xx - sidelength, (yy + sidelength) - progress);
d_line((xx - sidelength) + progress, yy + sidelength, (xx + sidelength) - progress, yy + sidelength);
if (diagonal_enabled == 1)
{
    d_line(xx + sidelength, (yy - sidelength) + progress, (xx + sidelength) - progress, yy - sidelength);
    d_line(xx - sidelength, (yy - sidelength) + progress, (xx - sidelength) + progress, yy - sidelength);
    d_line(xx - sidelength, (yy + sidelength) - progress, (xx - sidelength) + progress, yy + sidelength);
    d_line((xx + sidelength) - progress, yy + sidelength, xx + sidelength, (yy + sidelength) - progress);
    if (transformflashtimer > 0)
    {
        transformflashtimer--;
        var parryalpha = 0;
        draw_set_alpha(parryalpha);
        d3d_set_fog(true, c_white, 0, 1);
        d_line(xx + sidelength, (yy - sidelength) + progress, (xx + sidelength) - progress, yy - sidelength);
        d_line(xx - sidelength, (yy - sidelength) + progress, (xx - sidelength) + progress, yy - sidelength);
        d_line(xx - sidelength, (yy + sidelength) - progress, (xx - sidelength) + progress, yy + sidelength);
        d_line((xx + sidelength) - progress, yy + sidelength, xx + sidelength, (yy + sidelength) - progress);
        d3d_set_fog(false, c_black, 0, 0);
        draw_set_alpha(0);
    }
}

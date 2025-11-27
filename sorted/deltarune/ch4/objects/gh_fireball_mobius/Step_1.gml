var old_x = x;
var old_y = y;
timer += ((pi / cycle_length) * rate);
timer2 += ((pi / cycle_length2) * rate);
x = round(basex + (sin(timer) * width));
y = round(basey + (cos(timer2) * height));
if (rate != 0)
{
    for (var i = 1; i <= trail_length; i++)
    {
        if (i_ex(orb[i]) && orb[i].suck == false)
        {
            var _timer = timer - ((((2 + (8 * i)) * pi) / cycle_length) * rate);
            var _timer2 = timer2 - ((((2 + (8 * i)) * pi) / cycle_length2) * rate);
            orb[i].x = basex + (sin(_timer) * width);
            orb[i].y = basey + (cos(_timer2) * height);
        }
    }
}
if (iris)
    iris_dir = round(scr_at_player() / 15) * 15;

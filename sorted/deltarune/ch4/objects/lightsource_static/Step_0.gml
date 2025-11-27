siner++;
if (radius < targetradius)
{
    radius += 4;
    radius = min(radius, targetradius);
}
smallerLight = max(0, (sin(siner / 30) * 10) + radius);
biggerLight = max(0, (sin((siner - 10) / 30) * 10) + radius + 40);
scr_depth();

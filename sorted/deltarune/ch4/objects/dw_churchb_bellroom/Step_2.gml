timer++;
layx = round(-140 - ((camerax() - 1120) / 10));
for (var i = 0; i < array_length(layarray); i++)
{
    layer_x(layarray[i], layx);
    layer_y(layarray[i], -80 + (sin(timer / 12) * 4));
}

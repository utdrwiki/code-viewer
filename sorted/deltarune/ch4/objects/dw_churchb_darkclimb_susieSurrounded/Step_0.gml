if (con == 0)
{
    var alivecount = 0;
    siner += 2;
    for (var i = 0; i < array_length(enem); i++)
    {
        if (i_ex(enem[i]))
        {
            alivecount++;
            enem[i].neutralcon = -1;
            enem[i].x = scr_even(x + 20 + lengthdir_x(20 + (sin((siner + (i * 8)) / 8) * 4), (i * (360 / count)) + (siner * 4)));
            enem[i].y = scr_even(y + 20 + lengthdir_y(20 + (sin((siner + (i * 8)) / 8) * 4), (i * (360 / count)) + (siner * 4)));
            enem[i].depth = 995 - i;
            enem[i].image_angle = (round(i + ((siner * 4) / 90)) - 1) * 90;
        }
    }
    if (alivecount == 0)
        con = 1;
}

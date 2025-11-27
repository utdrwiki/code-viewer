if (conc == 0)
{
    timerc++;
    if (timerc < 16)
    {
        yextra = lerp(-20, 0, timerc / 15);
        y = lerp(y, (ystart - 52) + yextra, timerc / 15);
        headangle = lerp(-15, 0, timerc / 15);
        bodyangle = lerp(-10, 0, timerc / 15);
    }
    yextra = lerp(-20, 0, timerc / 15);
    armangle = lerp(armangle, -10, timerc / 20);
    if (timerc == 21)
    {
        a = 0;
        b = 0;
        conc = 1;
        timerc = 0;
    }
}
if (conc == 1)
{
    timerc++;
    if (timerc == 10)
    {
        conc = 2;
        timerc = 0;
    }
}
if (conc == 2)
{
    timerc++;
    if (timerc == 1)
    {
        armindex = 1;
        armangle = -15;
        snd_play_x(snd_gunshot, 1, 1.3);
    }
    if (timerc == 2)
    {
        armindex = 0;
        armangle = -80;
        headangle = 15;
        bodyangle = 15;
        snd_play_x(snd_gunshot, 1, 1.3);
    }
    headangle = lerp(headangle, 0, timerc / 15);
    bodyangle = lerp(bodyangle, 0, timerc / 15);
    armangle = lerp(armangle, 0, timerc / 15);
    if (timerc == 10)
    {
        conc = 4;
        timerc = 0;
    }
}
if (conc == 3)
{
    timerc++;
    y = lerp(y, ystart, timerc / 10);
    if (timerc == 10)
        instance_destroy();
}
if (conc == 4)
{
    timerc++;
    if (timerc == 1)
    {
        headangle = -20;
        bodyangle = -20;
        armangle = -10;
        x = xstart + 6;
    }
    if (timerc == 2)
        x = xstart - 5;
    if (timerc == 3)
        x = xstart + 4;
    if (timerc == 4)
        x = xstart - 3;
    if (timerc == 5)
        x = xstart + 2;
    if (timerc == 6)
        x = xstart - 1;
    if (timerc == 7)
        x = xstart;
    if (timerc > 15)
        y = lerp(y, ystart, (timerc - 15) / 10);
    if (timerc == 26)
        instance_destroy();
}
draw_sprite_ext(spr_shootout_tenna_shoot_pieces, 0, x, y, scale, scale, headangle, image_blend, 1);
draw_sprite_ext(spr_shootout_tenna_shoot_pieces, 1, x, y, scale, scale, bodyangle, image_blend, 1);
draw_sprite_ext(spr_shootout_tenna_shoot_pieces2, armindex, x + (8 * scale), y + (6 * scale), scale, scale, armangle, image_blend, 1);

if (i_ex(obj_heart) || i_ex(obj_moveheart))
{
    var xx, yy;
    if (i_ex(obj_heart))
    {
        depth = obj_heart.depth + 2;
        xx = obj_heart.x + 10;
        yy = obj_heart.y + 4;
    }
    if (i_ex(obj_moveheart))
    {
        depth = obj_moveheart.depth + 2;
        xx = obj_moveheart.x + 10;
        yy = obj_moveheart.y + 4;
    }
    var idealangle = 0;
    var idealimagealpha = 0.7;
    if (right_h())
    {
        idealangle = -20;
        xx += 8;
    }
    if (left_h())
    {
        idealangle = 20;
        xx -= 8;
    }
    image_angle = lerp(image_angle, idealangle, 0.25);
    x = lerp(x, xx, 0.6);
    y = lerp(y, yy, 0.6);
    if (image_alpha < 0.7)
        image_alpha += 0.1;
    if (i_ex(obj_dmgwriter_boogie))
    {
        with (obj_dmgwriter_boogie)
        {
            damage = ceil(other.mercy);
            init = 0;
        }
        with (obj_dmgwriter_boogie)
        {
            killtimer = 0;
            killactive = 0;
            kill = 0;
        }
    }
}
else
{
    image_alpha = -0.4;
}

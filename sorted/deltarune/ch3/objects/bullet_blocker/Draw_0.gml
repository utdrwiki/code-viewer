if (i_ex(obj_heart))
{
    var _i = 10;
    if (x < (obj_heart.x + _i) && image_angle < 20)
        image_angle += 4;
    if (x > (obj_heart.x + _i) && image_angle > -20)
        image_angle -= 4;
    x = obj_heart.x + _i;
    y = obj_heart.y + _i;
    draw_self();
    if (i_ex(obj_dmgwriter_boogie))
    {
        with (obj_dmgwriter_boogie)
        {
            damage = other.mercy;
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
if (image_angle < 0)
    image_angle += 0.5;
if (image_angle > 0)
    image_angle -= 0.5;

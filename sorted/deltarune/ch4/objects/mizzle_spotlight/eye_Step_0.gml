if (con == 0)
{
    hspeed += choose(-0.025, 0.025);
    vspeed += choose(-0.025, 0.025);
    speed = clamp(speed, -0.125, 0.125);
}
if (con == 1)
{
    sprite_index = spr_almond;
    timer++;
    if (timer == 14 || (timer >= 8 && (timer % 2) == 1 && !irandom(3)))
    {
        con = 2;
        direction = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10) + 180;
        speed = 8;
        hspeed *= 2;
        vspeed *= 0.5;
    }
}
if (con == 2)
{
    if (x > (obj_heart.x + 10))
        hspeed -= 0.275;
    else
        hspeed += 0.275;
    if (y > (obj_heart.y + 10))
        vspeed -= 0.275;
    else
        vspeed += 0.275;
    direction = scr_rotatetowards(direction, point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10), 0.75);
    with (obj_mizzle_spotlight_eye)
    {
        if (id != other.id)
        {
            if (point_distance(other.x, other.y, x, y) < 32)
            {
                x += lengthdir_x(1, point_direction(other.x, other.y, x, y));
                y += lengthdir_y(1, point_direction(other.x, other.y, x, y));
            }
        }
    }
    speed = clamp(speed, -7, 7);
}
grazetimer++;
if (grazetimer == 10)
{
    grazetimer = 0;
    grazed = 0;
}

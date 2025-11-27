event_inherited();
if (cut == false)
{
    timer++;
    if (angle < 270)
        angle_spd += 0.1;
    else if (angle > 270)
        angle_spd -= 0.1;
    angle += angle_spd;
    if (timer < 25)
        extend_spd = scr_approach_curve(extend_spd, 20, 14);
    else if (timer < 32)
        extend_spd = scr_approach_curve(extend_spd, -5, 3);
    else if (timer < 36)
        extend_spd = scr_approach_curve(extend_spd, 3, 3);
    else if (timer < 40)
        extend_spd = scr_approach_curve(extend_spd, 0, 3);
    if (timer < 45)
        extend += extend_spd;
    x = centre_x + lengthdir_x(extend, angle);
    y = centre_y + lengthdir_y(extend, angle);
    if ((timer % 4) == 0)
        grazed = false;
    if (timer >= 45)
        extend = scr_approach(extend, point_distance(centre_x, centre_y, obj_heart.x, obj_heart.y), 1);
    if (collision_line(x + lengthdir_x(10, angle + 180), y + lengthdir_y(10, angle + 180), centre_x, centre_y, obj_saw, true, true))
    {
        cut = true;
        vspeed = y - yprevious;
        hspeed = x - xprevious;
        gravity = 0.35;
    }
}

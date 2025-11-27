timer++;
gigatimer++;
x += (cos(gigatimer * 0.1) * 0.15);
if (gigatimer)
    y += (sin(gigatimer * 0.05) * 0.15);
if ((gigatimer % 6) == 0)
{
    image_angle += 45;
    for (a = 0; a < 6; a++)
        ray[a] += irandom(4);
}
timer2++;
if (timer2 < 100 && (timer2 % 30) == 0)
    timermax--;
if (timer2 > 400 && (timer2 % 10) == 0)
    timermax++;
if (timer == timermax)
{
    var orbit = instance_create_depth(x, y, depth + 1, obj_lanino_solar_system_orbit);
    scr_bullet_inherit(orbit);
    orbit.scaler -= 0.0015 * intensity;
    if (intensity < 4)
    {
        with (orbit)
            event_user(0);
    }
    else
    {
        orbit.hratio = 1;
        orbit.vratio = 1;
    }
    count++;
    if (intensity < 3 && timer2 > 80 && count != 1 && count != 3 && count != 5 && count != 7 && count != 9)
    {
        var orbit2 = instance_create_depth(x, y, depth + 1, obj_lanino_solar_system_orbit);
        scr_bullet_inherit(orbit2);
        orbit2.orbit_angle = orbit.orbit_angle + 180;
        orbit2.hratio = orbit.hratio;
        orbit2.vratio = orbit.vratio;
        orbit2.orbit_face = orbit.orbit_face;
        orbit2.orbit_direction = orbit.orbit_direction;
        orbit2.orbit_expansion = 4;
        orbit.scaler -= 0.0015 * intensity;
        with (orbit2)
            event_user(0);
    }
    timer = irandom(10) - (intensity * 15);
}

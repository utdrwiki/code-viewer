if (vspeed >= minspeed)
    vspeed -= 0.05;
else
    vspeed = lerp(minspeed, maxspeed, clamp((y - ((cameray() + cameraheight()) - 200)) / 500, 0, 1));
if (y <= miny)
{
    y = miny;
    vspeed = 0;
}
if (i_ex(obj_climb_kris) && obj_climb_kris.y > y)
{
    if (y <= (obj_climb_kris.y - 100))
        y = obj_climb_kris.y - 100;
    global.inv--;
    if (global.inv < 0 && global.hp[global.char[0]] > 0)
    {
        global.heartx = obj_climb_kris.x - 6 - camerax();
        global.hearty = obj_climb_kris.y - 6 - cameray();
        event_user(5);
        vspeed = 4;
    }
}

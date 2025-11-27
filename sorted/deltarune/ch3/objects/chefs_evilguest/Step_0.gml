if (obj_chefs_game.gameover)
{
    if (!hit)
        speed = 0;
    exit;
}
if (hit)
{
    if (y > (room_height + 20))
        instance_destroy();
    image_angle += 50;
    exit;
}
depth = -y / 2;
if (stomped)
{
    speed = 0;
    exit;
}
if (movetype == 1)
{
    t++;
    x = xstart + (sin(t * xf) * xa);
    y = ystart + (sin(t * yf) * ya);
    depth = -y / 2;
}
if (movetype == 0)
{
    var _alarm = turnpause;
    if (abs(speed) > 0)
    {
        switch (direction)
        {
            case 180:
                if (x <= 180)
                {
                    speed = 0;
                    alarm[0] = _alarm;
                    nextdir = direction + dir_change;
                }
                break;
            case 90:
                if (y <= y_ceiling)
                {
                    y = y_ceiling;
                    speed = 0;
                    alarm[0] = _alarm;
                    nextdir = direction + dir_change;
                }
                break;
            case 0:
                if (x >= 460)
                {
                    speed = 0;
                    alarm[0] = _alarm;
                    nextdir = direction + dir_change;
                }
                break;
            case 270:
                if (y >= y_floor)
                {
                    speed = 0;
                    alarm[0] = _alarm;
                    nextdir = direction + dir_change;
                }
                break;
        }
    }
}

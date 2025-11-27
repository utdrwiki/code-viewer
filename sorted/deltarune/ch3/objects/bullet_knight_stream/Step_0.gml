timer++;
if (timer == 20)
    line_width = 0;
if (timer >= 20 && timer < 40)
{
    if (timer < 24)
        width_goal = 64 + (sin(timer * 2.35) * 16);
    else
        width_goal = 32 + (sin(timer * 2.35) * 16);
}
else if (timer >= 40)
{
    width_goal = 0;
}
else if (timer > 8)
{
    width_goal = 0;
}
if (timer > 15 && (timer % 8) == 0 && timer < 40)
{
    for (a = 1; a < 4; a++)
    {
        with (scr_fire_bullet(x1 + lengthdir_x(60 * a, direction + 270), y1 + lengthdir_y(60 * a, direction + 270), obj_regularbullet, direction + 180, 15, spr_diamondbullet))
        {
            visible = false;
            image_angle = direction;
        }
    }
    for (a = 1; a < 4; a++)
    {
        with (scr_fire_bullet(x1 + lengthdir_x(60 * a, direction + 90), y1 + lengthdir_y(60 * a, direction + 90), obj_regularbullet, direction + 180, 15, spr_diamondbullet))
        {
            visible = false;
            image_angle = direction;
        }
    }
}
if (timer == 50)
    instance_destroy();

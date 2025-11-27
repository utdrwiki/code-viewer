if (con == 0)
{
    acceleration += 1;
    height += acceleration;
    timer++;
    if (timer >= 50)
    {
        var x_predictive_track = (obj_susiezilla.x - 4) + ((obj_susiezilla.x - obj_susiezilla.xprevious) * (11 + irandom(12)));
        var y_predictive_track = (obj_susiezilla.y - 10) + ((obj_susiezilla.y - obj_susiezilla.yprevious) * (11 + irandom(12)));
        var x_track = choose((obj_susiezilla.x - 4 - 60) + random(120), x_predictive_track);
        var y_track = choose((obj_susiezilla.y - 4 - 60) + random(120), y_predictive_track);
        con = 1;
        height = 400;
        if (target_x != 0)
            x = target_x;
        else
            x = tracker ? x_track : random_range(camerax() + 40, camerax() + 600);
        if (target_y != 0)
            y = target_y;
        else
            y = tracker ? y_track : random_range(cameray() + 200, cameray() + 300);
        marker = instance_create(x, y, obj_susiezilla_missile_marker);
        alarm[0] = 30;
        image_yscale *= -1;
        scr_depth_pivot();
    }
}
if (con == 2)
{
    scr_depth_pivot();
    height -= 20;
    if (height <= 0)
    {
        instance_destroy(marker);
        var _explosion = instance_create(x, y + 10, obj_susiezilla_explosion);
        with (_explosion)
        {
            scr_depth_alt();
            depth -= 70;
        }
        instance_destroy();
    }
}
timer++;

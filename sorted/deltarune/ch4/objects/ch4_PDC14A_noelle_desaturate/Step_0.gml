if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    var marker_index = 0;
    for (var i = 0; i < instance_number(obj_marker); i++)
    {
        var marker = instance_find(obj_marker, i);
        if (marker.visible == 1)
        {
            var is_exception = false;
            for (var j = 0; j < array_length_1d(marker_exceptions); j++)
            {
                if (marker.sprite_index == marker_exceptions[j])
                {
                    is_exception = true;
                    break;
                }
            }
            if (is_exception)
            {
                continue;
            }
            else
            {
                marker_objects[marker_index] = marker;
                marker_index++;
            }
        }
    }
    marker_objects = scr_sort_by_depth(marker_objects, false);
    marker_index = 0;
    var snowflake_index = 0;
    for (var i = 0; i < array_length_1d(marker_objects); i++)
    {
        var marker = marker_objects[i];
        if (marker.y == 60)
        {
            snowflakes[snowflake_index] = marker;
            snowflake_index++;
        }
        else
        {
            marker_sprites[marker_index][0] = marker.sprite_index;
            marker_sprites[marker_index][1] = marker.image_index;
            marker_sprites[marker_index][2] = new Vector2(marker.x, marker.y);
            marker_sprites[marker_index][3] = marker.image_speed;
            marker_sprites[marker_index][4] = marker.image_alpha;
            marker_sprites[marker_index][5] = marker.image_blend;
            marker_index++;
        }
    }
}
if (con == 2)
{
    con = 3;
    for (var i = 0; i < array_length_1d(marker_objects); i++)
        marker_objects[i].visible = 0;
}
if (snowflakes_start)
{
    snowflakes_start = false;
    for (var i = 0; i < array_length_1d(snowflakes); i++)
    {
        var target_speed = choose(0.25, 0.3) + choose(-0.03, -0.02, -0.01, 0);
        var target_time = 60 + choose(-5, -2, 2, 5);
        with (snowflakes[i])
            scr_lerpvar("image_speed", 0, target_speed, target_time);
    }
}
if (snowflakes_stop)
{
    snowflakes_stop = false;
    for (var i = 0; i < array_length_1d(snowflakes); i++)
    {
        var target_speed = choose(0.03, 0.04, 0.05, 0.07);
        var target_time = 60 + choose(-5, -2, 2, 5);
        with (snowflakes[i])
            scr_lerpvar("image_speed", image_speed, target_speed, target_time);
    }
}
if (snowflakes_stop_fast)
{
    snowflakes_stop_fast = false;
    for (var i = 0; i < array_length_1d(snowflakes); i++)
    {
        with (snowflakes[i])
            image_speed = 0;
    }
}
if (con == 10)
{
    con = 11;
    alarm[0] = 31;
    scr_lerpvar("palette_index", 1, 0, 30);
}
if (con == 12)
{
    con = -1;
    for (var i = 0; i < array_length_1d(marker_objects); i++)
        marker_objects[i].visible = 1;
}

siner += 0.02;
for (var i = 0; i < array_length_1d(star); i++)
{
    star[i].x = star[i].xstart + sin(siner) + (i * 0.1);
    star[i].y = star[i].ystart + cos(siner) + (i * 0.1);
}
if (!star_event)
    exit;
if (!star_fall)
{
    loose_star.x = loose_star.xstart + sin(siner) + 0.8;
    loose_star.y = loose_star.ystart + cos(siner) + 0.8;
    if (!entered_zone)
    {
        if (point_in_rectangle(obj_mainchara.x, obj_mainchara.y, loose_star.xstart - 20, loose_star.ystart, loose_star.xstart + 20, loose_star.ystart + 40))
            entered_zone = true;
    }
    else if (!point_in_rectangle(obj_mainchara.x, obj_mainchara.y, loose_star.xstart - 80, loose_star.ystart, loose_star.xstart + 80, loose_star.ystart + 80))
    {
        star_fall = true;
        entered_zone = false;
    }
}
if (star_fall)
{
    star_fall_timer++;
    if (star_fall_timer == 1)
    {
        with (loose_star)
            scr_lerpvar("y", ystart, 188, 15, 4, "in");
    }
    if (star_fall_timer == 12)
        snd_play_x(snd_splat, 1, 1.2);
    if (star_fall_timer == 16)
    {
        scr_flag_set(1027, 1);
        star_event = false;
        with (loose_star)
            visible = 0;
        floor_cover.visible = 0;
    }
}

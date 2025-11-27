if (!audience_active)
    exit;
if (!audience_pause)
{
    move_timer++;
    if (move_timer == 1)
        scr_lerpvar("x_offset", x_offset, x_offset + choose(-10, 0, 10), 30);
    if (move_timer >= 60)
        move_timer = 0;
}
if (audience_show)
{
    audience_show = false;
    var _target_y = (target_y_pos > 0) ? target_y_pos : (cameray() + 450);
    scr_lerpvar("base_y_pos", base_y_pos, _target_y, 10, -1, "out");
}
if (audience_hide)
{
    audience_hide = false;
    scr_lerpvar("base_y_pos", base_y_pos, cameray() + view_hport[0] + 150, 22, 3, "out");
}
if (audience_hide_slow)
{
    audience_hide_slow = false;
    scr_lerpvar("base_y_pos", base_y_pos, cameray() + view_hport[0] + 150, 88, 3, "out");
}
if (rose_throw)
{
    rose_throw_timer--;
    if (rose_throw_timer == 0)
    {
        rose_throw_timer = rose_throw_time;
        var xloc = camerax() + irandom_range(0, 500);
        var yloc = cameray() + view_hport[0] + 40;
        var rose = instance_create(xloc, yloc, obj_tennarose_alt);
        var _max_width = (camerax() + view_wport[0]) - 180;
        if (rose_throw_full_width)
            _max_width = (camerax() + view_wport[0]) - 80;
        var targx = camerax() + irandom_range(camerax() + 100, _max_width);
        var targy = cameray() + 300 + irandom(5);
        rose.endx = targx;
        rose.endy = targy;
        rose.jumptime = 10 + irandom(5) + 10;
        rose.fakegravity = 0.8 + random(0.7);
        rose.jumpheight = 100 + irandom(50);
        rose.depth = 96020;
    }
}
if (audience_bounce)
{
    audience_bounce = false;
    audience_bounce_stop = false;
    scr_delay_var("audience_bounce_stop", true, 71);
    scr_lerpvar("siner_speed", siner_speed, 0.3, 10);
    scr_script_delayed(scr_lerpvar, 60, "siner_speed", 0.3, 0.15, 10);
    scr_lerpvar("base_y_pos", base_y_pos, base_y_pos - 22, 10, -1, "out");
    scr_script_delayed(scr_lerpvar, 60, "base_y_pos", base_y_pos - 22, base_y_pos, 10);
}

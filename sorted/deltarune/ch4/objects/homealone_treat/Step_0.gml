if (!pushed && x >= 520)
{
    pushed = true;
    scr_lerpvar("hspeed", 3, 0, 10);
    scr_lerpvar("vspeed", -1, 0, 5);
    global.interact = 1;
}
if (pushed && can_push)
{
    push_timer++;
    if (push_timer == 8)
    {
        vspeed = 0;
        visible = 0;
        pan_ypos = cameray();
        obj_homealone_heart.cutscene = 1;
        scr_pan_lerp(camerax(), 420, 15);
        with (obj_homealone_treat_launcher)
            shoot_treat = true;
    }
    if (push_timer == 108)
        scr_pan_lerp(camerax(), pan_ypos, 15);
    if (push_timer == 124)
    {
        can_push = false;
        obj_homealone_heart.cutscene = 0;
        global.interact = 0;
        instance_destroy();
    }
}
if (fallen)
    roll_timer++;

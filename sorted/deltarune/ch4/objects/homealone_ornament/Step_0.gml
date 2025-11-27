if (finished)
    exit;
if (!pushed && x >= 627)
{
    fallen = true;
    pushed = true;
    scr_lerpvar_instance(id, "image_angle", 0, -90, 5);
    scr_lerpvar_instance(id, "hspeed", 6, 0, 12);
    scr_lerpvar_instance(id, "vspeed", 0, 6, 4);
}
if (pushed && can_push)
{
    push_timer++;
    if (push_timer == 8)
    {
        vspeed = 0;
        can_push = false;
    }
}
if (fallen)
{
    roll_timer++;
    if (roll_timer == 15)
    {
        hspeed = -2;
        scr_lerpvar_instance(id, "vspeed", 1, 0, 60);
    }
    if (roll_timer > 15 && roll_timer < 80)
        image_angle += 10;
    if (roll_timer == 75)
    {
        scr_lerpvar_instance(id, "vspeed", 0, 10, 8);
        if (i_ex(obj_homealone_treat_catcher))
            depth = obj_homealone_treat_catcher.depth - 10;
    }
    if (roll_timer == 85)
    {
        with (obj_homealone_treat_catcher)
            image_index = 1;
    }
    if (roll_timer == 84)
    {
        hspeed = 0;
        vspeed = 0;
        scr_lerpvar_instance(id, "image_angle", image_angle, -90, 15);
        scr_lerpvar_instance(id, "hspeed", 9, 0, 16);
        scr_lerpvar_instance(id, "vspeed", -4, 13, 10);
        with (obj_homealone_treat_catcher)
        {
            is_disabled = true;
            scr_lerpvar_instance(id, "image_angle", 0, -270, 8);
            scr_lerpvar_instance(id, "hspeed", -4, 0, 5);
            scr_lerpvar_instance(id, "vspeed", 6, 0, 12);
        }
    }
    if (roll_timer == 94)
        scr_lerpvar_instance(id, "vspeed", 13, 0, 2);
    if (roll_timer == 96)
        scr_flag_set(783, 1);
}

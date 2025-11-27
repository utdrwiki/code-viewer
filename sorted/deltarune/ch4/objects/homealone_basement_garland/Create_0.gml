event_inherited();
can_interact = true;
basement_parent = instance_find(obj_noellehouse_basement, 0);
is_fallen = false;

trigger = function()
{
    can_interact = false;
    snd_play(snd_bump);
    global.interact = 1;
    with (obj_homealone_heart)
    {
        scr_lerpvar("x", x, x + 60, 12, 3, "out");
        scr_lerpvar("y", y, y + 30, 12, 3, "out");
    }
    scr_lerpvar("image_angle", 0, 50, 30, -2, "out");
    alarm[1] = 30;
    alarm[10] = 1;
    with (basement_parent)
        open_breaker();
};

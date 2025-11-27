event_inherited();
time = 99;
with (obj_susiezilla_gamecontroller)
{
    if (mode == 1 || mode == 2)
        other.time = 16;
}
with (obj_susiezilla_gamecontroller)
{
    if (mode >= 3)
        other.time = 18;
}
with (obj_susiezilla_gamecontroller)
{
    if (mode >= 5)
        other.time = 10;
}
digit = 1;
flip = false;
flip_scale = 1;
anim_timer = 0;

tick_down = function(arg0)
{
    var time_format = string_format(time, 2, 0);
    var old_time = string_char_at(string(time_format), digit);
    time = scr_approach(time, 0, arg0);
    time_format = string_format(time, 2, 0);
    var new_time = string_char_at(string(time_format), digit);
    if (old_time != new_time && !flip)
    {
        flip = true;
        scr_lerpvar("flip_scale", 1, 0, 3, 0);
        scr_script_delayed(scr_lerpvar, 3, "flip_scale", 0, 1, 3, 0);
        scr_script_delayed(scr_var, 6, "flip", false);
    }
};

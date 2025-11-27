with (obj_climb_destructableclimbarea)
{
    if (dangerous && place_meeting(x, y, other) && con == 0)
        con = 1;
}
with (obj_climb_appearingclimbarea)
{
    if (place_meeting(x, y, other))
        con = 1;
}
with (obj_climb_animationmarker)
{
    if (trigger_activated && place_meeting(x, y, other))
        event_user(10);
}
with (obj_climb_titan_kris_throw_off_sequence)
{
    if (place_meeting(x, y, other))
        event_user(0);
}
instance_destroy();

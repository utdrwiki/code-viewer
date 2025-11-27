if (collision_rectangle(x, y, x + sprite_width + 1, y + sprite_height, obj_solidblock, false, true))
{
    can_push = false;
    var _px = 1;
    i = _px;
    while (i >= 0)
    {
        if (!place_meeting(x + i, y, obj_solidblock))
        {
            _px = i;
            break;
        }
        i -= 0.1;
    }
    x += _px;
}
if (interact_event)
{
    interact_event = false;
    interacting = true;
    event_user(0);
}
if (auto_depth)
    scr_depth();

if (init == 0)
{
    scr_lerpvar("cursize", 0, maxsize, lifetime, 2, "out");
    scr_lerpvar("alpha", alpha, 0, lifetime);
    scr_doom(id, lifetime + 1);
    init = 1;
    with (obj_church_ripple)
    {
        if (id != other.id)
            depth += 1;
    }
}
if (dodraw)
    event_user(10);

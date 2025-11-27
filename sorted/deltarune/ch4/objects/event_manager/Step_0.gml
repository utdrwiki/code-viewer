if (!trophies_enabled)
    exit;
if (event_cooldown > 0)
    event_cooldown--;
if (os_type == os_ps4 || os_type == os_ps5)
    psn_tick();
if (!climb_timer_active)
    exit;
if (i_ex(obj_climb_kris))
{
    if (obj_climb_kris.climb_finished)
        exit;
    climb_timer++;
    if (climb_timer >= 2700)
    {
        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_24);
        climb_timer_active = false;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_24 = 24
}

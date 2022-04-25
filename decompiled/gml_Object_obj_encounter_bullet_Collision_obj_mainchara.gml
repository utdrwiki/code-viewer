if (active == true)
{
    with (creator)
    {
        global.ambush = 1
        event_user(0)
    }
}
with (obj_encounter_bullet)
{
    active = false
    instance_destroy()
}

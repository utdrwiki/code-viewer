timer++
if (timer > 5 && (!instance_exists(obj_chaseenemy)))
    spawned = true
if (spawned == true)
{
    spawntimer++
    if (spawntimer == 60)
    {
        chest = instance_create(x, y, obj_treasure_room)
        instance_destroy()
    }
}

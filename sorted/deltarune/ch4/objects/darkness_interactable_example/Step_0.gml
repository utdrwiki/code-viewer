event_inherited();
if (room == room_darkness_example_2)
{
    if (!instance_exists(obj_dialoguer) && special == 1)
    {
        with (obj_music_wobbler)
            active = true;
        if (!instance_exists(obj_screen_wobbler))
            instance_create(0, 0, obj_screen_wobbler);
        with (obj_screen_wobbler)
            active = true;
        special = 0;
    }
}

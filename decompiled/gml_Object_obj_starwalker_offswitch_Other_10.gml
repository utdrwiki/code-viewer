if (global.interact == 0)
{
    if instance_exists(obj_starwalker_overworld)
    {
        bellcon = true
        myinteract = 0
        image_speed = 0.25
        with (obj_overworldbulletparent)
        {
            active = false
            instance_destroy()
        }
        snd_play(snd_bell)
        if (obj_starwalker_overworld.beatcon == 0)
        {
            if (room == room_forest_starwalker && (!instance_exists(obj_npc_room)))
            {
                originalstarwalker = instance_create(2200, 200, obj_npc_room)
                if (x >= (room_width / 2))
                {
                    with (originalstarwalker)
                        x = 400
                }
            }
            with (obj_starwalker_overworld)
            {
                visible = false
                beatcon = 1
                beattimer = 0
                with (obj_mainchara)
                    battlemode = 0
                dead = instance_create((x - 92), (y - 74), obj_starwalker_battle)
                with (dead)
                {
                    walkcon = 1
                    walktimer = 0
                }
                with (shadow)
                    instance_destroy()
            }
        }
    }
}

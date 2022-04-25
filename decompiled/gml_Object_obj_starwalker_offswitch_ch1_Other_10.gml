if (global.interact == 0)
{
    if instance_exists(obj_starwalker_overworld_ch1)
    {
        bellcon = true
        myinteract = 0
        image_speed = 0.25
        with (obj_overworldbulletparent_ch1)
        {
            active = false
            instance_destroy()
        }
        snd_play_ch1(snd_bell_ch1)
        if (obj_starwalker_overworld_ch1.beatcon == 0)
        {
            if (room == room_forest_starwalker_ch1 && (!instance_exists(obj_npc_room_ch1)))
            {
                originalstarwalker = instance_create_ch1(2200, 200, obj_npc_room_ch1)
                if (x >= (room_width / 2))
                {
                    with (originalstarwalker)
                        x = 400
                }
            }
            with (obj_starwalker_overworld_ch1)
            {
                visible = false
                beatcon = 1
                beattimer = 0
                with (obj_mainchara_ch1)
                    battlemode = 0
                dead = instance_create_ch1((x - 92), (y - 74), obj_starwalker_battle_ch1)
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

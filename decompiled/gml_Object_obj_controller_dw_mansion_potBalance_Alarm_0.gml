if instance_exists(obj_npc_butler)
{
    with (obj_npc_butler)
    {
        if (image_xscale == -2)
            var modifier = -100
        else
            modifier = -36
        newenem = instance_create((x + modifier), y, obj_chaseenemy)
        with (newenem)
        {
            myencounter = 56
            sprite_index = spr_npc_swatchling_sweep_walk
            if (other.image_xscale == -2)
                facing = 1
            touchsprite = spr_npc_swatchling_sweep_walk
            radius = 10000
            ignoresolid = false
            alertcon = 0
            eraser = true
            noAlertSound = true
            frozen = false
        }
        instance_destroy()
    }
    snd_play(snd_b)
}
spawnVase = 2
triggered = 1
if (con == 0)
    global.interact = 0

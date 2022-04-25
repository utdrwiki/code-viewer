if instance_exists(obj_controller_dw_mansion_east_1f_a)
    obj_controller_dw_mansion_east_1f_a.triggered = 1
image_index = 1
snd_play(choose(164, 165))
brokenpot = scr_dark_marker(x, y, sprite_index)
brokenpot.image_index = 1
brokenpot.depth = 800000
if (room == room_dw_mansion_east_2f_c)
{
    if instance_exists(obj_npc_sign)
    {
        with (obj_npc_sign)
        {
            newenem = instance_create(x, y, obj_chaseenemy)
            with (newenem)
            {
                if (image_xscale > 0)
                    x -= sprite_width
                myencounter = 56
                sprite_index = spr_npc_swatchling_sweep
                touchsprite = spr_swatchling_hurt
                radius = 10000
                ignoresolid = true
                alertcon = 0
                eraser = true
            }
            instance_destroy()
        }
    }
    if instance_exists(obj_controller_dw_mansion_potBalance)
        obj_controller_dw_mansion_potBalance.triggered = 1
}
instance_destroy()

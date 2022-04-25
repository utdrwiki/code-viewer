con = -1
hacker = noone
if (global.chapter != 2)
    instance_destroy()
else if (global.flag[339] == 1)
{
    if (global.flag[357] == 1)
    {
        hacker_npc = instance_create(1650, 215, obj_npc_room)
        hacker_npc.sprite_index = spr_npc_cursor_walk_left
        with (hacker_npc)
            scr_depth()
    }
    layer_set_visible("TILES_Secret", 0)
    layer_set_visible("TILES_Secret_BG", 0)
}
else
{
    exitcollider = instance_create(950, 360, obj_solidblock)
    exitcollider.image_xscale = 4
    exitcollider.image_yscale = 4
    if (global.flag[357] == 1)
    {
        hacker = instance_create(150, 290, obj_readable_room1)
        hacker.visible = true
        hacker.sprite_index = spr_npc_cursor_walk_right
        hacker.image_xscale = 2
        hacker.image_yscale = 2
        with (hacker)
            scr_depth()
        hacker_init_path = 0
        pause_timer = 0
        hacker_pause = 0
        hacker_can_pause = 1
        with (hacker)
        {
            pathpause = 0
            currentspeed = 2
            path_start(path_hacker, 2, path_action_stop, 1)
        }
    }
}

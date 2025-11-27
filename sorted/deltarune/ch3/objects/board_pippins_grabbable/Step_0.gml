scr_depth_board();
if (active)
{
    scr_depth_board();
    if (grabbed == 0)
    {
        with (obj_board_grabobject)
        {
            if (grabbedid == other.id)
            {
                other.grabbed = 1;
                sprite_index = spr_board_npc_pippins_sideways;
                other.sprite_index = spr_board_npc_pippins_sideways;
            }
        }
    }
    pose--;
    if (pose > 1)
    {
        if (room != room_dw_b3bs_cheaterpippins)
            sprite_index = spr_board_pippins_pose;
    }
    else
    {
        sprite_index = spr_board_npc_pippins;
        if (grabbed)
            sprite_index = spr_board_npc_pippins_sideways;
    }
}
else
{
    pose = 0;
}
if (killme)
{
    if (!instance_exists(obj_board_grabobject))
    {
        killme = false;
        killed = true;
        corpse = scr_board_marker(x, y, sprite_index, 0, depth, 2);
        x = room_width * 999;
        y = room_height * 999;
    }
}
if (killed)
{
    if (obj_board_camera.con != 0)
    {
        with (corpse)
            scr_doom(id, 30);
        killed = false;
        grabbed = 0;
        sprite_index = spr_board_npc_pippins;
    }
}

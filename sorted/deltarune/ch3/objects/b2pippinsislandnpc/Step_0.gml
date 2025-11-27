event_inherited();
if (active)
{
    scr_depth_board();
    pose--;
    if (pose > 1)
        sprite_index = spr_board_pippins_pose;
    else
        sprite_index = spr_board_npc_pippins;
}

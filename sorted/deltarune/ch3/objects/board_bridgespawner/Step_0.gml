if (room == room_dw_puzzlecloset_3)
    active = true;
if (active)
{
    if (made == 0)
    {
        made = 1;
        bridge = instance_create(x, y, obj_board_bridge);
        bridge.size = 1;
        bridge.puzzleid = puzzleid;
        bridge.xoff = xoff;
        bridge.daddy = id;
        if (image_xscale > 2)
            bridge.size = 2;
        if (ralsei)
        {
            bridge.sprite_index = spr_board_ralsei_surfboard;
            bridge.depth = 999980;
        }
    }
}
else if (made)
{
    safe_delete(bridge);
    made = 0;
}

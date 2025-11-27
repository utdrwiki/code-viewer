if (global.chapter == 4)
{
    var deco_marker = scr_marker(619, 100, spr_townhall_decorations);
    with (deco_marker)
        depth = 989990;
    if (global.plot >= 100)
    {
        with (obj_doorparent)
        {
            if (y > 80 && y < 290)
            {
                var readable = instance_create(x, y, obj_readable_room1);
                if (global.plot >= 290)
                {
                    if (x <= 290)
                        readable.extflag = "church_door_night";
                }
                instance_destroy();
            }
        }
    }
    else
    {
        var wolf_npc = instance_create(590, 108, obj_npc_room_animated);
        wolf_npc.depth = deco_marker.depth - 10;
        with (wolf_npc)
        {
            extflag = "wolf_ribbon";
            image_speed = 0.1;
            sprite_index = spr_npc_ice_wolf_ribbon;
        }
        var trashcan_marker = scr_marker(478, 165, spr_trashcan_flowers);
        with (trashcan_marker)
            scr_depth();
        var trashcan_collider = instance_create(478, 165, obj_solidblockLight);
        var trashcan_readable = instance_create(trashcan_marker.x, trashcan_marker.y, obj_readable_room1);
    }
}

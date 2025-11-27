scr_losechar();
with (obj_caterpillarchara)
    instance_destroy();
var vines = instance_find(obj_dw_inbetween_room_vines, 0);
vines.depth = 990000;
door_marker = scr_dark_marker(276, 54, spr_dw_inbetween_room_door);
door_marker.depth = vines.depth - 10;
zapper_npc = instance_create(260, 60, obj_npc_room);
with (zapper_npc)
{
    extflag = "zapper";
    sprite_index = spr_npc_zapper_talk;
}
var is_moved = global.plot >= 120 && scr_flag_get(1074) > 0;
if (global.plot >= 160)
    is_moved = scr_flag_get(1075) > 0;
if (is_moved)
{
    with (zapper_npc)
    {
        x += 120;
        extflag = "zapper_moved";
    }
}
zapper_npc.depth = door_marker.depth - 10;
zapper_move = false;
zapper_move_start = false;
zapper_move_timer = 0;
if (global.plot >= 280)
{
    if (scr_flag_get(1174) >= 4)
    {
        with (zapper_npc)
            instance_destroy();
    }
}

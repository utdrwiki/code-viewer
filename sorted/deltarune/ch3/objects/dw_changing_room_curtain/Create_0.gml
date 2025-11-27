var room_marker = scr_dark_marker(982, 79, spr_dw_changing_room_curtain_back);
with (room_marker)
    scr_depth();
shadowman_marker = scr_dark_marker(1070, 97, spr_npc_shadowman_sock);
shadowman_marker.depth = room_marker.depth - 10;
if (global.plot >= 150)
    shadowman_marker.sprite_index = spr_npc_shadowman_sock_other;
curtain_marker = scr_dark_marker(room_marker.x, room_marker.y, spr_dw_changing_room_curtain);
curtain_marker.depth = shadowman_marker.depth - 10;
var readable = instance_create(room_marker.x, room_marker.y + 100, obj_readable_room1);
with (readable)
{
    extflag = "curtain_left";
    image_xscale = 10;
}
curtain_open = false;
curtain_open_timer = 0;
curtain_close = false;
curtain_start = false;
curtain_disabled = global.plot >= 205;
sock_marker = scr_dark_marker(1070, 160, spr_dw_changing_room_sock);
sock_marker.depth = shadowman_marker.depth;
sock_marker.visible = curtain_disabled;

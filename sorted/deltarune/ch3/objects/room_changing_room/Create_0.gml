con = -1;
pippins_npc = 0;
with (obj_caterpillarchara)
    visible = 0;
var empty_room = global.plot >= 205;
var shadow_mantle_defeat = scr_flag_get(1050) > 0;
var is_moved = false;
if (global.plot < 150)
{
    if (scr_flag_get(1029) == 1)
        is_moved = true;
}
if (global.plot >= 150 && global.plot < 205)
{
    if (scr_flag_get(1029) == 2 || scr_flag_get(1266) > 0)
        is_moved = true;
}
door_blocker = -4;
if (global.plot < 280 && !is_moved)
{
    door_blocker = instance_create(190, 150, obj_soliddark);
    with (door_blocker)
        image_xscale = 5;
}
if (global.plot < 280)
{
    var x_pos = is_moved ? 134 : 260;
    ramb_npc = instance_create(x_pos, 156, obj_npc_ramb);
    with (ramb_npc)
        scr_depth();
}
else if (scr_flag_get(1055) >= 3)
{
    var _door_cover = scr_marker(198, 89, spr_pixel_white);
    with (_door_cover)
    {
        image_blend = c_black;
        image_xscale = 41;
        image_yscale = 27;
        scr_depth();
    }
    with (obj_doorAny)
    {
        if (x <= 200)
            doorPreset = -1;
    }
}
else
{
    with (obj_doorAny)
    {
        if (x <= 200)
            instance_destroy();
    }
    var left_door_block = instance_create(200, 160, obj_solidblocksized);
    with (left_door_block)
        image_xscale = 4;
    var door_readable = instance_create(left_door_block.x, left_door_block.y, obj_readable_room1);
    with (door_readable)
    {
        image_xscale = 8;
        extflag = "door_blocked";
    }
}
ramb_move_start = false;
ramb_move_end = false;
ramb_move = false;
ramb_move_timer = 0;
ramb_explain = false;
ramb_explain_con = 0;
ramb_is_moved = is_moved;
mantle_note = false;
mantle_note_timer = 0;
vending_active = false;
var vending_machine = instance_create(400, 128, obj_npc_room);
vending_machine.sprite_index = spr_dw_green_room_vending;
with (vending_machine)
    scr_depth();
if (global.plot < 170)
{
    pippins_npc = instance_create(824, 130, obj_trigger_interact);
    pippins_npc.visible = true;
    pippins_npc.strict = true;
    scr_size(2, 2, pippins_npc);
    pippins_npc.sprite_index = spr_npc_pippins;
    pippins_npc.talked = 0;
    with (pippins_npc)
        scr_depth();
}
if (!shadow_mantle_defeat && !empty_room)
{
    if (global.plot < 160)
    {
        var rouxls_npc = instance_create(1258, 108, obj_npc_room_animated);
        rouxls_npc.sprite_index = spr_npc_rouxls_makeup;
        rouxls_npc.image_speed = 0.1;
        with (rouxls_npc)
            scr_depth();
    }
    else
    {
        var corkboard_right = instance_create(1220, 164, obj_readable_room1);
        with (corkboard_right)
        {
            extflag = "corkboard_right";
            image_xscale = 6;
        }
    }
}
var curtain_readable = instance_create(1436, 160, obj_readable_room1);
with (curtain_readable)
{
    extflag = "curtain_right";
    image_xscale = 8;
    image_yscale = 2;
}
var have_rabbick = scr_flag_get(613) > 0 || empty_room;
if (have_rabbick)
{
    var rabbick_npc = instance_create(1360, 200, obj_npc_room);
    rabbick_npc.sprite_index = shadow_mantle_defeat ? spr_npc_rabbick_surprised : spr_npc_rabbick;
    with (rabbick_npc)
    {
        extflag = "rabbick_default";
        scr_depth();
    }
    if (empty_room)
    {
        with (rabbick_npc)
            extflag = "rabbick_empty";
    }
    if (shadow_mantle_defeat)
    {
        with (rabbick_npc)
            extflag = "rabbick_mantle";
    }
}
if (empty_room)
{
    var corkboard_left = instance_create(780, 164, obj_readable_room1);
    with (corkboard_left)
    {
        extflag = "corkboard_left";
        image_xscale = 8;
    }
    var corkboard_right = instance_create(1220, 164, obj_readable_room1);
    with (corkboard_right)
    {
        extflag = "corkboard_right";
        image_xscale = 6;
    }
}
if (scr_flag_get(1076) == 1)
{
    scr_flag_set(1076, 2);
    with (obj_mainchara)
        usprite = spr_krisu_dark;
}
if (scr_flag_get(1077) == 1)
{
    scr_flag_set(1077, 2);
    with (obj_mainchara)
        usprite = spr_krisu_dark;
}
if (global.plot >= 280 && global.flag[1055] >= 3 && global.flag[1055] < 6)
{
    with (obj_solidblocksized_alt)
        instance_destroy();
}

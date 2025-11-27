con = -1;
var zapper_npc = instance_create(820, 74, obj_npc_room);
with (zapper_npc)
{
    sprite_index = spr_npc_zapper_talk;
    extflag = "zapper";
    scr_depth();
}
if (global.plot < 180)
{
    var no_counterfeit = global.plot >= 120 && global.plot < 160 && scr_flag_get(1076) == 0;
    var can_cheat = no_counterfeit && scr_flag_get(1173) < 4;
    if (global.plot >= 160)
    {
        no_counterfeit = scr_flag_get(1076) >= 1 && scr_flag_get(1077) == 0;
        var prev_s_rank = scr_flag_get(1173) >= 4 && scr_flag_get(1077) == 0;
        can_cheat = scr_flag_get(1174) < 4 && (no_counterfeit || prev_s_rank);
    }
    if (can_cheat)
    {
        pippins_cheater_marker = scr_dark_marker(1100, 488, spr_npc_pippins_jump_cool);
        pippins_cheater_marker.image_speed = 0.2;
        with (pippins_cheater_marker)
            scr_depth();
        pippins_cheater_readable = instance_create(pippins_cheater_marker.x + 8, pippins_cheater_marker.y + 16, obj_readable_room1);
        with (pippins_cheater_readable)
        {
            image_xscale = 3;
            image_yscale = 3;
            extflag = "pippins_cheater";
        }
        var board_flag = 1173;
        if (global.plot >= 160)
            board_flag = 1174;
        if (scr_flag_get(board_flag) == 0)
            pippins_cheater_readable.extflag = "pippins_z_rank";
        var pippins_cheater_block = instance_create(pippins_cheater_marker.x, pippins_cheater_marker.y + 32, obj_solidblocksized);
        with (pippins_cheater_block)
            image_xscale = 2;
    }
}
var pippins_marker = scr_dark_marker(948, 134, spr_npc_pippins_jump);
pippins_marker.image_speed = 0.2;
with (pippins_marker)
    scr_depth();
var pippins_readable = instance_create(pippins_marker.x + 8, pippins_marker.y + 16, obj_readable_room1);
with (pippins_readable)
{
    image_xscale = 3;
    image_yscale = 3;
    extflag = "pippins";
}
var pippins_block = instance_create(pippins_marker.x, pippins_marker.y + 32, obj_solidblocksized);
with (pippins_block)
    image_xscale = 2;
var vending_npc = instance_create(1084, 134, obj_npc_room);
with (vending_npc)
{
    sprite_index = spr_dw_tvland_preview_vending;
    extflag = "vending";
    scr_depth();
}
pippins_flee = false;
if (global.plot < 250)
{
    var _stanchions = instance_create(1080, 680, obj_dw_ch3_funny_stanchion_controller);
    with (_stanchions)
    {
        front_facing = false;
        scr_depth();
        image_xscale = 6;
        image_yscale = 2;
        init();
    }
}
else
{
    var snow_vfx = instance_create(0, 0, obj_dw_ch3_tvsnow);
    snow_vfx.bgdepth = 30000;
    with (zapper_npc)
    {
        sprite_index = spr_npc_zapper_stone;
        extflag = "zapper_stone";
        scr_depth();
    }
    with (pippins_marker)
    {
        sprite_index = spr_npc_pippins_up;
        scr_depth();
    }
    with (obj_border_controller)
        set_border(border_dw_blue_light);
}
if (global.plot < 160)
{
    var curtain_npc = instance_create(50, 650, obj_npc_room);
    with (curtain_npc)
    {
        extflag = "curtain";
        sprite_index = spr_dw_teevie_preview_curtain;
        normalanim = 4;
    }
}
else if (global.plot >= 160 && global.plot < 250)
{
    var shutta_npc = instance_create(92, 650, obj_npc_room);
    with (shutta_npc)
    {
        extflag = "shutta";
        sprite_index = spr_npc_shutta;
    }
}

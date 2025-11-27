var ver = 0;
if (global.plot >= 280)
    ver = 1;
if (ver == 0)
    musicer = scr_musicer("greenroom_detune.ogg");
else
    musicer = scr_musicer("tv_results_screen.ogg", undefined, 0.4);
scr_setparty(1, 1);
con = -1;
customcon = 0;
var counter = scr_dark_marker(800, 240, spr_dw_ranking_counter);
with (counter)
{
    image_xscale = 2;
    image_yscale = 2;
    scr_depth();
}
zapper_marker = scr_dark_marker(825, 126, spr_npc_zapper_talk);
zapper_marker.depth = counter.depth + 10;
zapper_talk_active = false;
zapper_readable = instance_create(zapper_marker.x + 40, zapper_marker.y + 100, obj_readable_room1);
with (zapper_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "zapper";
}
lanino_npc = -4;
talking_actor = -4;
talking_actor_current = -4;
board = 1;
board_flag = 1173;
if (global.plot >= 160)
{
    board_flag = 1174;
    board = 2;
    if (scr_flag_get(1187) > 0 && scr_flag_get(1187) < 2)
        scr_flag_set(1187, 0);
}
else
{
    lanino_npc = instance_create(540, 165, obj_npc_room);
    lanino_npc.extflag = "lanino";
    lanino_npc.sprite_index = spr_npc_lanino_talk;
    with (lanino_npc)
        scr_depth();
}
counterfeit_active = false;
if (global.plot < 160)
    counterfeit_active = scr_flag_get(1076) > 0;
else if (global.plot < 280)
    counterfeit_active = scr_flag_get(1077) > 0;
ranking_sign = instance_create(800, 46, obj_dw_ranking_hub_sign);
var _board = string(board);
var _ranking = scr_get_rank_letter(board_flag, true);
if (counterfeit_active)
    _ranking = "S";
with (ranking_sign)
{
    init_sign(_board, _ranking);
    scr_depth();
}
var doors = ["a", "b", "c"];
for (var i = 0; i < array_length(doors); i++)
{
    var _door = instance_create(140 + (i * 140), 134, obj_dw_ranking_door);
    var _is_unlocked = false;
    if (i == 0 && scr_flag_get(board_flag) >= 3)
        _is_unlocked = true;
    if (i == 1 && scr_flag_get(board_flag) >= 2)
        _is_unlocked = true;
    if (i == 2 && scr_flag_get(board_flag) >= 1)
        _is_unlocked = true;
    if (global.plot >= 280)
    {
        if (i != 1)
            _is_unlocked = false;
    }
    else if (counterfeit_active)
    {
        _is_unlocked = true;
    }
    _door.init_door(doors[i], _is_unlocked);
}
var vending_machine = instance_create(650, 170, obj_npc_room);
with (vending_machine)
{
    extflag = "vending";
    sprite_index = spr_dw_tvland_preview_vending;
}
var t_rank = scr_flag_get(board_flag) == 5;
if (global.plot >= 280)
    t_rank = false;
if (!t_rank)
{
    var t_rank_cover = scr_dark_marker(0, 0, spr_pixel_white);
    with (t_rank_cover)
    {
        image_blend = c_black;
        image_xscale = 20;
        image_yscale = 100;
        depth = 1000000;
    }
    var t_rank_block = instance_create(0, 280, obj_solidblocksized);
    with (t_rank_block)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
}
var z_rank = scr_flag_get(board_flag) == 0;
if (z_rank)
    zapper_readable.extflag = "z_rank";
z_rank_cover = -4;
z_rank_block = -4;
var z_rank_visible = scr_flag_get(1187) > 0;
if (global.plot >= 280)
{
    var snow_vfx = instance_create(0, 0, obj_dw_ch3_tvsnow);
    snow_vfx.bgdepth = 30000;
    z_rank_visible = scr_flag_get(board_flag) == 0 && scr_flag_get(1055) >= 3;
    with (zapper_marker)
        instance_destroy();
    with (zapper_readable)
        instance_destroy();
    var vending_machine_exchange = instance_create(850, 170, obj_npc_room);
    with (vending_machine_exchange)
    {
        extflag = "vending_exchange";
        sprite_index = spr_dw_tvland_preview_vending;
    }
}
if (!z_rank_visible)
{
    z_rank_cover = scr_dark_marker(960, 120, spr_pixel_white);
    with (z_rank_cover)
    {
        image_blend = c_black;
        image_xscale = 40;
        image_yscale = 60;
        depth = 1000000;
    }
    z_rank_block = instance_create(960, 120, obj_solidblocksized);
    with (z_rank_block)
        image_yscale = 6;
}

unlock_z_rank = function()
{
    snd_play(snd_impact);
    scr_shakescreen();
    with (z_rank_cover)
        instance_destroy();
    with (zapper_readable)
        instance_destroy();
    with (z_rank_block)
        instance_destroy();
};

repeat (array_length(global.keyitem))
    scr_keyitemremove(8);

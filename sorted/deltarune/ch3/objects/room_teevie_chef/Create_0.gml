layer_depth("TILES_Curtains", 90000);
con = (scr_flag_get(1148) == 0) ? 0 : -1;
if (scr_flag_get(1148) == 1)
    con = 50;
customcon = 0;
var save_point = instance_create(526, 271, obj_savepoint);
with (save_point)
    scr_depth();
var _counter_marker = scr_dark_marker(80, 236, spr_dw_kitchen_counter_tile);
with (_counter_marker)
    depth = 96990;
var _recruited_any = scr_get_total_recruits(3) > 0;
var _recruited_all = scr_recruited_all_in_chapter(3);
party_time = _recruited_any;
party_controller = -4;
if (party_time)
{
    party_controller = instance_create(0, 0, obj_dw_teevie_party_controller);
    with (party_controller)
        init(_recruited_all);
}
rouxls = instance_create(980, 256, obj_npc_room);
with (rouxls)
{
    sprite_index = spr_rouxls_chef;
    extflag = "rouxls";
    scr_depth();
    visible = 0;
}
rouxls_block = instance_create(rouxls.x + 30, rouxls.y + 70, obj_solidblocksized);
elnina_marker = instance_create(894, 280, obj_npc_room);
elnina_marker.sprite_index = spr_npc_elnina_float_land_sit;
elnina_marker.image_index = 1;
elnina_marker.extflag = "elnina";
lanino_marker = instance_create(1072, 280, obj_npc_room);
lanino_marker.sprite_index = spr_npc_lanino_float_land_sit;
lanino_marker.image_index = 1;
lanino_marker.extflag = "lanino";
snack_marker = scr_dark_marker(1000, 220, spr_dw_teevie_snack);
snack_marker.depth = _counter_marker.depth - 10;
snack_readable = instance_create(snack_marker.x + 4, snack_marker.y + 4, obj_readable_room1);
with (snack_readable)
{
    extflag = "snacks";
    image_xscale = 2;
    image_yscale = 3;
}
snack_marker_right = scr_dark_marker(1454, 220, spr_dw_teevie_snack);
snack_marker_right.depth = _counter_marker.depth - 10;
snack_right_readable = instance_create(snack_marker_right.x + 4, snack_marker_right.y + 4, obj_readable_room1);
with (snack_right_readable)
{
    extflag = "snacks";
    image_xscale = 2;
    image_yscale = 3;
}

clean_up = function()
{
    with (elnina_marker)
        instance_destroy();
    with (lanino_marker)
        instance_destroy();
    with (rouxls)
        instance_destroy();
    with (rouxls_block)
        instance_destroy();
    with (snack_marker_right)
        instance_destroy();
    with (snack_right_readable)
        instance_destroy();
};

if (con == 0)
{
    elnina_marker.y = -200;
    lanino_marker.y = -200;
}
else if (con == 50)
{
    elnina_marker.y = 280;
    lanino_marker.y = 280;
    lanino_marker.depth = _counter_marker.depth - 10;
    rouxls.depth = _counter_marker.depth - 10;
    rouxls.visible = 1;
}
else
{
    clean_up();
}
talking_actor_current = -4;
talking_actor = -4;
talking_both = false;
party_start = false;
party_stop = false;
party_shock = false;
release_rouxls = false;
rouxls_appear = -4;
rouxls_appear_timer = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.image_alpha = 0;
starwalker_marker = -4;
if (scr_flag_get(254) > 0)
{
    starwalker_marker = scr_dark_marker(-100, -100, spr_npc_originalstarwalker_walk_down);
    starwalker_marker.depth = 90000;
}
answer = -1;

answer_question = function(arg0)
{
    answer = arg0;
};

has_answer = function()
{
    return answer >= 0;
};

reset_answer = function()
{
    answer = -1;
};

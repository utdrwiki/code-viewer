con = -1;
if (room == room_dw_couch_overworld_03)
{
    var _wobbled = global.plot >= 22;
    if (!_wobbled)
        con = 10;
    special_wobbler = instance_create(1264, 335, obj_dw_wobbler);
    if (_wobbled)
    {
        special_wobbler.sprite_index = spr_dw_couch_shutta_hand;
        special_wobbler.x += 15;
        special_wobbler.y += 66;
    }
}
else if (room == room_dw_couch_points)
{
    con = 20;
    dustpile = -4;
    treasure_marker = -4;
    open_chest = false;
    chest_con = 0;
    points_display = -4;
    if (variable_global_exists("pause_follow"))
    {
        if (global.pause_follow)
        {
            scr_losechar();
            with (obj_caterpillarchara)
                instance_destroy();
        }
    }
    var _found_treasure = scr_flag_get(1101) > 0;
    var _found_points = scr_flag_get(1101) > 1;
    if (_found_treasure)
    {
        var _dustpile_marker = scr_dark_marker(390, 270, spr_dustpile_parts);
        _dustpile_marker.image_index = 3;
        with (_dustpile_marker)
            scr_depth();
        var _dustpile_block = instance_create(400, 330, obj_solidblock);
        with (_dustpile_block)
        {
            image_xscale = 5;
            image_yscale = 3;
        }
        treasure_marker = scr_dark_marker(432, 290, spr_treasurebox);
        treasure_marker.depth = _dustpile_marker.depth - 10;
        var _treasure_readable = instance_create(treasure_marker.x, treasure_marker.y, obj_readable_room1);
        with (_treasure_readable)
        {
            image_xscale = 2;
            image_yscale = 2;
            extflag = "points";
        }
        if (_found_points)
            treasure_marker.image_index = 1;
    }
    else
    {
        dustpile = instance_create(390, 270, obj_dustpile);
        with (dustpile)
            scr_depth();
    }
}
else if (room == room_dw_couch_overworld_intro_left)
{
    zapper_timer = 0;
    zapper = scr_dark_marker(140, 308, spr_dw_couch_zapper_sneeze);
    with (zapper)
    {
        image_index = 3;
        scr_depth();
    }
    if (scr_flag_get(1102) == 0)
        con = 30;
}

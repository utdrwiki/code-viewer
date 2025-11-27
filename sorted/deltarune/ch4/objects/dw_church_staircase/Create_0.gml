con = -1;
customcon = 0;
var _floor = instance_create(0, 0, obj_dw_church_staircase_floor);
_floor.depth = layer_get_depth("ASSETS_Staircase") - 10;
if (scr_flag_get(1567) == 0)
{
    layer_set_visible("TILES_COVER", 0);
    layer_set_visible("ASSETS_Bridge", 0);
    var exit_block = instance_create(200, 240, obj_solidblockDark);
    with (exit_block)
        image_yscale = 2;
}
else
{
    con = 0;
    susie_hide = false;
    susie_shadow = 0;
    kris_hide = false;
    kris_shadow = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    blackall.visible = 1;
    var exit_block = instance_create(240, 360, obj_solidblockDark);
    with (exit_block)
        image_xscale = 4;
    layer_set_visible("TILES_BATTLEBORDER", 0);
    layer_set_visible("TILES_COVER", 1);
    layer_set_visible("ASSETS_Bridge", 0);
    for (var i = 0; i < 3; i++)
    {
        with (instance_create(80 * i, 240, obj_dw_church_magicalglass_breakable))
            scr_darksize(id);
    }
    var cover_marker = scr_marker(240, 360, spr_blank_tile_black);
    with (cover_marker)
    {
        depth = layer_get_depth("TILES_COVER") + 10;
        image_xscale = 4;
        image_yscale = 3;
    }
    var lantern_cover_left = scr_marker(160, 240, spr_blank_tile_black);
    lantern_cover_left.depth = _floor.depth - 10;
    with (lantern_cover_left)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
    var lantern_cover_right = scr_marker(400, 240, spr_blank_tile_black);
    lantern_cover_right.depth = _floor.depth - 10;
    with (lantern_cover_right)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
    with (obj_overworld_bulletarea_no_dark)
        instance_destroy();
    if (scr_debug())
    {
        with (obj_border_controller)
        {
            set_border(border_dw_church_a, 1);
            show_border(1);
        }
    }
}

con = -1;
customcon = 0;
layer_set_visible("DEBUG_ASSETS", 0);
var desk_marker = scr_dark_marker(185, 220, spr_dw_church_bellhall_desk);
with (desk_marker)
    scr_depth();
var desk_solid = instance_create(desk_marker.x, desk_marker.y, obj_soliddark);
with (desk_solid)
    image_xscale = 2;
if (global.plot >= 170 && global.plot < 180 && scr_flag_get(844) == 0)
{
    con = 0;
    with (obj_mainchara)
        visible = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_alpha = 1;
    blackall.image_blend = c_black;
    gerson_marker = scr_dark_marker(175, 195, spr_gerson_bench_writing);
    gerson_marker.depth = desk_marker.depth - 10;
    gerson_marker.image_speed = 0.08;
    gerson_marker.image_index = 0;
    rope_pull = false;
}

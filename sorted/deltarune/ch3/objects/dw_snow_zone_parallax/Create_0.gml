y_offset = -10;
bg_height = sprite_get_height(spr_dw_snow_zone_bg_parallax_layer_1) * 2;
fountain_speed = 0.2;
make_save = 0;
repeat (5)
{
    with (obj_solidblock_diagonal_32)
    {
        var blslope = scr_marker(x, y, sprite_index);
        blslope.image_xscale = image_xscale;
        blslope.image_yscale = image_yscale;
        blslope.image_blend = c_black;
        blslope.depth = 200010;
    }
}
var door = scr_dark_marker(120, 140, spr_dw_puzzlecloset_door_open);
door.image_xscale = -2;
door.image_index = 5;
with (door)
    depth = 200000;
var black_cover = scr_dark_marker(0, 0, spr_pixel_white);
black_cover.image_blend = c_black;
black_cover.image_xscale = 30;
black_cover.image_yscale = 120;
black_cover.depth = door.depth + 10;
var entry_cover = scr_dark_marker(0, 320, spr_pixel_white);
entry_cover.image_blend = c_black;
entry_cover.image_xscale = 10;
entry_cover.image_yscale = 40;
entry_cover.depth = door.depth + 10;
entry_cover = scr_dark_marker(40, 360, spr_pixel_white);
entry_cover.image_blend = c_black;
entry_cover.image_xscale = 80;
entry_cover.image_yscale = 20;
entry_cover.depth = door.depth + 10;
var bottom_cover = scr_dark_marker(0, 440, spr_pixel_white);
bottom_cover.image_blend = c_black;
bottom_cover.image_xscale = room_width / 2;
bottom_cover.image_yscale = 80;
bottom_cover.depth = depth - 10;
bottom_cover = scr_dark_marker(360, 422, spr_pxwhite);
bottom_cover.image_blend = c_black;
bottom_cover.image_xscale = 124;
bottom_cover.image_yscale = 20;
bottom_cover.depth = depth - 10;

bg_surface = -4;
starry_wall_sprite = -4;
vine_sprite = -4;
bg_speed = -88;
bg_speed_y = 1;
xadj = 0;
yadj = 0;
tile_speed = 1;
tv_zone = room == room_dw_castle_tv_zone_1 || room == room_dw_castle_tv_zone_2 || room == room_dw_castle_tv_zone_3;
if (tv_zone)
    tile_speed = 0.4;
star_rows = 3;
if (room == room_dw_castle_tv_zone_1 || room == room_dw_castle_tv_zone_3)
    star_rows = 4;
wall_dark = 9997923;
wall_light = 8643752;
var max_amount = ((x + (image_xscale * 40)) - x) / 110;
for (var i = 0; i < max_amount; i++)
{
    var y_offset = ((i % 2) == 1) ? 4 : 10;
    var starting_index = ((i % 3) == 1) ? 1 : 0;
    var shine = scr_dark_marker((i * 55) + x, y + y_offset, spr_shine_white);
    with (shine)
    {
        image_index = starting_index;
        image_blend = #E8FFC8;
        image_speed = 0.08;
        depth = 1000099;
    }
    shine.depth = depth - 1;
}
max_amount = ((x + (image_xscale * 40)) - x) / 160;
for (var i = 0; i < max_amount; i++)
{
    var x_offset = 3;
    var y_offset = ((i % 2) == 0) ? 14 : 20;
    var starting_index = ((i % 2) == 0) ? 1 : 0;
    var shine = scr_dark_marker(x + 5 + (i * 75) + x_offset, y + 5 + y_offset, spr_shine_white);
    with (shine)
    {
        image_index = starting_index;
        image_blend = #E8FFC8;
        image_speed = 0.08;
    }
    shine.depth = depth - 1;
}

clean_up = function()
{
    if (surface_exists(bg_surface))
        surface_free(bg_surface);
    if (sprite_exists(starry_wall_sprite))
        sprite_delete(starry_wall_sprite);
    if (sprite_exists(vine_sprite))
        sprite_delete(vine_sprite);
};

siner = 0;
star[0] = scr_marker(503, 145, spr_dw_changing_room_stars);
star[1] = scr_marker(547, 112, spr_dw_changing_room_stars);
star[1].image_index = 1;
star[2] = scr_marker(614, 156, spr_dw_changing_room_stars);
star[2].image_index = 2;
star[3] = scr_marker(702, 153, spr_dw_changing_room_stars);
star[3].image_index = 3;
for (var i = 0; i < array_length_1d(star); i++)
{
    with (star[i])
        scr_depth();
}
star_event = scr_flag_get(1027) == 0;
if (star_event)
{
    floor_cover = scr_marker(640, 200, spr_dw_changing_room_floor_cover);
    with (floor_cover)
        depth = 98000;
    loose_star = scr_marker(665, 120, spr_dw_changing_room_star);
    loose_star.depth = floor_cover.depth - 10;
}
star_fall = false;
star_fall_timer = 0;
entered_zone = false;

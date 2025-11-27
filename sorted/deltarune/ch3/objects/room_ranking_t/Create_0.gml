con = -1;
type = 0;
if (global.plot >= 150)
    type = 1;
explain_vfx = -4;
explain_close_time = 12;
explain_close_timer = explain_close_time;
input_check = false;
pitch = 0.8;
var _book_marker = scr_dark_marker(185, 245, spr_castle_book_pillar);
with (_book_marker)
    depth = 900000;
var _book_shadow = instance_create(0, 0, obj_dw_ranking_t_shadow_char);
with (_book_shadow)
    init(_book_marker, 0, 0.4);
var _book_readable = instance_create(_book_marker.x + 2, _book_marker.y + 20, obj_readable_room1);
with (_book_readable)
{
    extflag = "book";
    image_xscale = 2;
    image_yscale = 2;
}
var _book_block = instance_create(_book_marker.x, _book_marker.y + 16, obj_solidblocksized);
with (_book_block)
    image_xscale = 1.2;

draw_set_font(fnt_mainbig);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (point_distance(room_width * 0.3, 32 + (room_height / 2), scr_mouse_x(), scr_mouse_y()) < 50)
{
    draw_set_colour(c_yellow);
    if (scr_mouse_leftclick())
    {
        global.mike_skip = 0;
        room_goto_next();
    }
}
else
{
    draw_set_colour(c_white);
}
draw_text(room_width * 0.3, room_height / 2, "Full Battle");
if (point_distance(room_width * 0.7, 32 + (room_height / 2), scr_mouse_x(), scr_mouse_y()) < 50)
{
    draw_set_colour(c_yellow);
    if (scr_mouse_leftclick())
    {
        global.mike_skip = 1;
        room_goto_next();
    }
}
else
{
    draw_set_colour(c_white);
}
draw_text(room_width * 0.7, room_height / 2, "Skip to\nfinal attack");
var xx = room_width * 0.7;
var yy = room_height * 0.75;
if (point_distance(xx, yy + 32, scr_mouse_x(), scr_mouse_y()) < 50)
{
    draw_set_colour(c_yellow);
    if (scr_mouse_leftclick())
        global.use_mic = !global.use_mic;
}
else
{
    draw_set_colour(c_white);
}
draw_text(xx, yy, "Use\nGamepad");
ossafe_fill_rectangle(xx - 64, yy - 10, xx - 84, yy + 10, 1);
if (!global.use_mic)
    draw_sprite(spr_heart, 0, xx - 82, yy - 7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_sprite(spr_mike_hand, 0, scr_mouse_x(), scr_mouse_y());

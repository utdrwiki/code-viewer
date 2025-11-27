var ver = 0;
if (asset_get_index("room_dw_inbetweenhall") > -1)
{
    if (room == room_dw_inbetweenhall)
        ver = 1;
}
if (ver == 0)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, 0, 79, 279);
    ossafe_fill_rectangle(0, 360, 79, room_height);
    ossafe_fill_rectangle(80, 0, 639, 119);
    ossafe_fill_rectangle(640, 0, 719, 239);
    ossafe_fill_rectangle(719, 0, 799, 119);
    ossafe_fill_rectangle(800, 0, room_width, 199);
    ossafe_fill_rectangle(960, 180, room_width, 279);
    ossafe_fill_rectangle(80, 360, 879, room_height);
    ossafe_fill_rectangle(960, 360, room_width, room_height);
    draw_set_color(c_white);
}

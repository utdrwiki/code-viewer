scr_darksize();
grabcount = 0;
breakable = 1;
scr_depth_board();
throwdist = 3;
snap = true;
extflag = "";
if (room == room_board_3b)
{
    sprite_index = spr_board_key;
    image_index = 6;
    image_speed = 0;
    breakable = false;
}
cangrab = true;

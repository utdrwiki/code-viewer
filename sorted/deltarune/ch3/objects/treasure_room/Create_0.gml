myinteract = 0;
talked = 0;
image_speed = 0;
itemflag = 104;
itemtype = "armor";
itemidchest = 4;
close = 0;
extratext = 0;
extraevent = 0;
flag = false;
if (global.darkzone == 1)
    scr_darksize();
if (room == room_dw_castle_west_cliff)
{
    itemidchest = 21;
    itemflag = 142;
    var qualify = 0;
    if (global.flag[468] > 0)
        qualify = 1;
    if (global.flag[142] == 1)
        qualify = 0;
    if (global.flag[571] == 1 || global.flag[468] == 2)
        itemtype = "weapon";
    else
        itemtype = "armor";
    if (qualify == 0)
    {
        instance_destroy();
        visible = 0;
    }
}
if (room == room_board_postshadowmantle || room == room_dw_green_room)
{
    itemtype = "armor";
    itemidchest = 23;
    itemflag = 1067;
}
if (room == room_dw_b3bs_cooltrashy)
{
    itemflag = 1100;
    itemidchest = 39;
    itemtype = "item";
}
if (room == room_dw_b3bs_watercooler)
{
    itemflag = 1138;
    itemidchest = 0;
    itemtype = "item";
}
if (room == room_dw_b3bs_mysterypuzzle)
{
    itemflag = 1139;
    itemidchest = 2;
    itemtype = "item";
}
if (room == room_dw_b3bs_zapper_c)
{
    itemflag = 1140;
    itemidchest = 1;
    itemtype = "points";
}
if (room == room_dw_teevie_susiebridge)
{
    itemflag = 1213;
    itemidchest = 300;
    itemtype = "points";
}
if (room == room_dw_teevie_large_01)
{
    itemtype = "item";
    itemidchest = 34;
    itemflag = 1267;
}
if (global.flag[itemflag] == 1)
    image_index = 1;
scr_depth();

myinteract = 0;
talked = 0;
image_speed = 0;
itemflag = 104;
itemtype = "armor";
itemidchest = 4;
close = 0;
extratext = 0;
extraevent = 0;
tempchest = false;
needsitem = false;
if (scr_debug())
{
    itemidchest = 0;
    itemflag = 1999;
    itemtype = "item";
}
noflag = false;
if (global.darkzone == 1)
{
    image_xscale = 2;
    image_yscale = 2;
}
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
if (room == room_dw_church_darkmaze || i_ex(obj_dw_church_darkmaze))
{
    itemflag = 871;
    itemtype = "nothing";
}
if (room == room_dw_church_pianopiece_left || i_ex(obj_dw_church_pianopiece_left))
{
    itemflag = 894;
    itemtype = "item";
    itemidchest = 62;
}
if (room == room_dw_church_worshiproom)
{
    itemtype = "armor";
    itemidchest = 51;
    itemflag = 1517;
}
if (room == room_dw_churchb_worshiproom)
{
    itemtype = "armor";
    itemidchest = 52;
    itemflag = 1517;
}
if (room == room_dw_churchb_library || i_ex(obj_dw_churchb_library))
{
    itemtype = "item";
    itemidchest = 2;
    itemflag = 1540;
}
if (extflag == "ripseqtreasure")
{
    itemtype = "item";
    itemidchest = 62;
    itemflag = 1550;
}
if (i_ex(obj_dw_churchb_prophecymaze))
{
    itemtype = "item";
    itemidchest = 62;
    itemflag = 1581;
}
if (i_ex(obj_dw_church_sideclimb))
{
    itemtype = "armor";
    itemidchest = 52;
    itemflag = 863;
}
if (i_ex(obj_dw_church_bookshelfpuzzle))
{
    itemtype = "weapon";
    itemidchest = 54;
    itemflag = 1582;
}
if (room == room_dw_churchb_libraryconnector || i_ex(obj_dw_churchb_libraryconnector))
{
    itemtype = "item";
    itemidchest = 61;
    itemflag = 1539;
}
if (room == room_dw_churchb_gallery || i_ex(obj_dw_churchb_gallery))
{
    itemflag = 1545;
    itemtype = "money";
    itemidchest = 500;
}
if (room == room_dw_church_rightconnect || i_ex(obj_dw_church_rightconnect))
{
    itemtype = "weapon";
    itemidchest = 53;
    itemflag = 1586;
}
if (room == room_dw_church_minorlegend || i_ex(obj_dw_church_minorlegend))
{
    itemtype = "item";
    itemidchest = 61;
    itemflag = 1587;
}
if (room == room_dw_church_pianopiece_right || i_ex(obj_dw_church_pianopiece_right))
{
    itemtype = "item";
    itemidchest = 2;
    itemflag = 1588;
}
if (room == room_dw_church_trueclimbadventure || i_ex(obj_dw_church_trueclimbadventure))
{
    itemflag = 1589;
    itemtype = "item";
    itemidchest = 28;
}
if (room == room_dw_church_jackenstein || i_ex(obj_dw_church_jackenstein))
{
    itemflag = 1590;
    itemtype = "money";
    itemidchest = 500;
}
if (room == room_dw_churchc_encounter2 || i_ex(obj_dw_churchc_encounter2))
{
    itemflag = 1614;
    itemtype = "money";
    itemidchest = 100;
    image_blend = c_black;
}
if (room == room_dw_churchc_treasurechest || i_ex(obj_dw_churchc_treasurechest))
{
    itemflag = 1616;
    itemtype = "armor";
    itemidchest = 50;
}
if (i_ex(obj_dw_churchc_prophecies) || room == room_dw_churchc_prophecies)
{
    itemflag = 1610;
    itemtype = "armor";
    itemidchest = 53;
}
if (room == room_dw_church_dogclimb)
{
    itemflag = 1638;
    itemtype = "item";
    itemidchest = 33;
}
if (room == room_dw_churchb_moneyfountain || instance_exists(obj_dw_churchb_moneyfountain))
{
    itemflag = 1537;
    var val = global.flag[898] + obj_dw_churchb_moneyfountain.bonus;
    itemtype = "item";
    itemidchest = 1;
    if (val >= 100)
    {
        itemtype = "item";
        itemidchest = 62;
    }
    if (val >= 500)
    {
        itemtype = "item";
        itemidchest = 2;
    }
    if (val >= 2000)
    {
        itemtype = "item";
        itemidchest = 63;
    }
    if (val >= 9999)
    {
        itemtype = "armor";
        itemidchest = 54;
    }
}
if (room == room_dw_castle_tv_zone_3)
{
    itemflag = 1703;
    itemtype = "item";
    itemidchest = 34;
}
if (global.flag[itemflag] == 1)
    image_index = 1;
scr_depth();
init = 0;

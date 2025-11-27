with (obj_darkcontroller)
    charcon = 0;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_index = 1;
var trashstart = stringsetloc("* (You dug through the trash...)/", "obj_dw_ch3_b3bs_trashcan_slash_Other_10_gml_13_0");
if (itemtype == "nothing")
{
    if (global.flag[itemflag] == 0)
        snd_play(snd_locker);
    global.flag[itemflag] = 1;
}
if (itemtype != "special")
{
    if (global.flag[itemflag] >= 1)
    {
        msgset(0, trashstart);
        msgnextloc("* (And found trash!)/%", "obj_dw_ch3_b3bs_trashcan_slash_Other_10_gml_20_0");
    }
    else
    {
        snd_play(snd_locker);
        msgset(0, trashstart);
        if (itemtype != "points")
        {
            var itemgetstring = scr_itemget_anytype_text(itemidchest, itemtype);
            msgnext(itemgetstring);
            if (noroom == 0)
                global.flag[itemflag] = 1;
            else
                close = 1;
        }
        else
        {
            global.flag[itemflag] = 1;
            msgnextsubloc("* (And found ~1 POINTs!)/%", string(itemidchest), "obj_dw_ch3_b3bs_trashcan_slash_Other_10_gml_44_0");
            makepoints = 1;
        }
    }
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    talked += 1;
}
else if (room == room_dw_b3bs_watercooler || room == room_dw_b3bs_rabbick_b)
{
    itemtype = "not special";
    talked += 1;
    global.flag[itemflag] = 1;
    scr_speaker("no_name");
    msgset(0, trashstart);
    msgnextloc("* ...and found a switch!/%", "obj_dw_ch3_b3bs_trashcan_slash_Other_10_gml_46_0");
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    myinteract = 3;
}

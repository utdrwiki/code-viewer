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
global.msg[0] = stringsetloc("* (It won't open.)/%", "obj_treasure_room_slash_Other_10_gml_14_0");
var empty = false;
if (global.flag[itemflag] == 1)
    empty = true;
if (tempchest == 1)
    empty = false;
if (empty)
{
    global.msg[0] = stringsetloc("* (The chest is empty.)/%", "obj_treasure_room_slash_Other_10_gml_18_0");
}
else
{
    snd_play(snd_locker);
    var itemgetstring = scr_itemget_anytype_text(itemidchest, itemtype);
    msgsetsubloc(0, "* (You opened the treasure chest.^1)&* (Inside was \\cY~1\\cW.)/", itemname, "obj_treasure_room_slash_Other_10_gml_65_0");
    msgnext(itemgetstring);
    if (itemtype == "nothing")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (You opened the treasure chest.)/", "obj_treasure_room_slash_Other_10_gml_30_0");
        msgnextloc("* (Inside was nothing.)/%", "obj_treasure_room_slash_Other_10_gml_31_0");
        noroom = 0;
        close = 0;
    }
    if (noroom == 0)
    {
        if (tempchest == 1)
            tempchest = 2;
        else
            global.flag[itemflag] = 1;
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_23, UnknownEnum.Value_939);
    }
    else
    {
        close = 1;
    }
}
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;

enum UnknownEnum
{
    Value_0,
    Value_23 = 23,
    Value_939 = 939
}

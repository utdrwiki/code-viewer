itemid = 36;
with (obj_darkcontroller)
    charcon = 0;
global.msc = 0;
global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
var itemgetstring = scr_itemget_anytype_text(itemid, "item");
msgsetloc(0, "* (You found a \\cYFlatSoda\\cW.)/", "obj_swordroute_event_susiesoda_slash_Other_10_gml_16_0");
msgnext(itemgetstring);
if (noroom == 0)
{
    snd_play(snd_item);
    taken = 1;
    image_alpha = 0;
}
else
{
    taken = 0;
}
myinteract = 3;
d = d_make();

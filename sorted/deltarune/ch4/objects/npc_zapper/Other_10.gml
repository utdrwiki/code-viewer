global.msg[0] = stringset("* Can you see me...?/%");
if (talked == 0)
{
    scr_speaker("no_name");
    msgsetloc(0, "* Boss^1, why don't ya let dis weakling retire^1, huh?/", "obj_npc_zapper_slash_Other_10_gml_8_0");
    msgnextloc("* He served me tea when I asked for somethin' TOUGH!!/", "obj_npc_zapper_slash_Other_10_gml_9_0");
    msgnextloc("* ..^1. Sorry^1, dis Swatcho guy I mean. Not Ralsei. He's fine./%", "obj_npc_zapper_slash_Other_10_gml_10_0");
}
else
{
    scr_speaker("no_name");
    msgsetloc(0, "* Oy^1, boss^1! Watch how good I am at cleanin'!/", "obj_npc_zapper_slash_Other_10_gml_14_0");
    msgnextloc("* I'm beatin' up the dust so bad it ain't come back!/", "obj_npc_zapper_slash_Other_10_gml_15_0");
    scr_anyface_next("susie", 0);
    msgnextloc("\\EK* (Damn^1, I should try that)/%", "obj_npc_zapper_slash_Other_10_gml_17_0");
}
talked++;
myinteract = 3;
global.msc = 0;
global.typer = 6;
global.fc = 0;
global.fc = 0;
global.interact = 1;
mydialoguer = instance_create(0, 0, obj_dialoguer);

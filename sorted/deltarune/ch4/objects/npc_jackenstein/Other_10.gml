global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;
if (global.darkzone == 1)
    image_speed = 0.2;
global.msg[0] = stringsetloc("* The gash weaves down as if you cry./%", "obj_npc_room_slash_Other_10_gml_13_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_npc_room)/%");
if (room == room_dw_church_jackenstein)
{
    scr_speaker("jackenstein");
    msgsetloc(0, "* YOUNG WOMUN..^1. THAINK YOU FOR THE WONDERFUL HEALING./", "obj_npc_jackenstein_slash_Other_10_gml_22_0");
    scr_anyface_next("susie", 20);
    msgnextloc("\\EK* Hey^1, it was nothing./", "obj_npc_jackenstein_slash_Other_10_gml_24_0");
    scr_anyface_next("jackenstein", 0);
    msgnextloc("* LET ME KNOW IF I CAN EVER REPAY YOU.../", "obj_npc_jackenstein_slash_Other_10_gml_26_0");
    msgnextloc("* I LIVE IN A HOAL/%", "obj_npc_jackenstein_slash_Other_10_gml_27_0");
    if (scr_keyitemcheck(31) == 0)
    {
        with (obj_ch4_DCA08D)
            con = 80;
        skip = 1;
        exit;
    }
}
remanimspeed = image_speed;
myinteract = 3;
if (skip == 0)
{
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    mydialoguer.jpspecial = jpspecial;
}
if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}
talked += 1;

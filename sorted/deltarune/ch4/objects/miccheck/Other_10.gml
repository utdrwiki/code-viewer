global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
nodialogue = 1;
global.currentroom = room;
nodialogue = 0;
if (scr_is_valid_mic_platform())
{
    scr_speaker("no_name");
    if (!global.use_mic)
    {
        msgsetloc(0, "* You're using the gamepad!/%", "obj_miccheck_slash_Other_10_gml_16_0");
        nomic = true;
    }
    else
    {
        nomic = false;
        if (global.flag[1663] == 0)
        {
            global.flag[1663] = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a mysterious microphone-shaped crystal.)/", "obj_miccheck_slash_Other_10_gml_44_0");
            msgnextloc("* (Peering into the crystal ball^1, the thoughts of microphones cross your mind...)/%", "obj_miccheck_slash_Other_10_gml_45_0");
        }
        else
        {
            myinteract = 3;
            exit;
        }
    }
}
else
{
    nomic = true;
    var key = [scr_get_input_name_console(32775), scr_get_input_name_console(32776)];
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a mysterious microphone-shaped crystal.)/", "obj_miccheck_slash_Other_10_gml_58_0");
    var latemessages = true;
    if (global.input_g[4] == gp_shoulderrb)
    {
        if (!obj_gamecontroller.gamepad_shoulderlb_reassign)
        {
            latemessages = false;
            msgnextsubloc("* (The crystal vibrates intensely. Please reassign buttons set to ~1 or ~2!)/%", key[0], key[1], "obj_miccheck_slash_Other_10_gml_67_0");
        }
        else
        {
            key[1] = key[0];
        }
    }
    if (latemessages)
    {
        msgnextsubloc("* (It's engraved with buttons shaped like ~1 and the letters \"VOL\".)/", key[1], "obj_miccheck_slash_Other_10_gml_59_0");
        msgnextloc("* (When pressed in^1, the whole room seems to make a noise...!)/%", "obj_miccheck_slash_Other_10_gml_60_0");
    }
}
myinteract = 3;
if (nodialogue == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;

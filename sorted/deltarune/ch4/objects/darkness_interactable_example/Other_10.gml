global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
global.msg[0] = stringsetloc("* The pain itself is reason why./%", "obj_npc_room_animated_slash_Other_10_gml_8_0");
global.msg[0] = stringset("* [NO TEXT] (obj_npc_room_animated)/%");
if (room == room_darkness_example_2)
{
    if (!instance_exists(obj_followinglight) || obj_followinglight.timer <= 0)
    {
        scr_speaker("no_name");
        if (talked == 0)
        {
            msgset(0, "* You would do well not to speak to me again./%");
        }
        else if (talked == 1)
        {
            msgset(0, "* SO/");
            msgnext("* YOU HAVE DECIDED TO \\cY@#$% AROUND\\cW/");
            msgnext("* AND NOW YOU SHALL SEE^1 \\cRWHAT^1 HAPPENS!\\cW/%");
            special = 1;
        }
        else if (talked == 2)
        {
            msgset(0, "* WOBBLE IN FEAR^1, \\cRFOOLISH MORTON!!!\\cW/%");
        }
        else
        {
            msgsetloc(0, "* sorry/%", "obj_darkness_interactable_example_slash_Other_10_gml_32_0");
            if (talked == 3)
            {
                with (obj_music_wobbler)
                    active = false;
                with (obj_screen_wobbler)
                    active = false;
            }
        }
    }
    else
    {
        if (talked <= 1)
        {
            msgset(0, "* (...^1? There's nothing here...)/%");
        }
        else if (talked > 3)
        {
            msgset(0, "* (You hear only the faintest murmur of embarassment.)/%");
        }
        else if (talked > 1)
        {
            scr_speaker("susie");
            msgset(0, "\\EC* You^1, uh..^1. feeling okay, Kris?/%");
        }
        talked--;
    }
}
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;

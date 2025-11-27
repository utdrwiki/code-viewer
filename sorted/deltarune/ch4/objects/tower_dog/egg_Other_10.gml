if (visible == true)
{
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (You received an Egg.)/%", "scr_text_slash_scr_text_gml_3215_0");
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    talked += 1;
    snd_play(snd_egg);
    scr_keyitemget(2);
    visible = false;
}

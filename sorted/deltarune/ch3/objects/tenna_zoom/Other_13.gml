if (minigametype == "chef board 4")
    room_goto(room_dw_chef_empty);
if (minigametype == "rythm board 4")
    room_goto(room_dw_rhythm_empty);
if (minigametype == "susiezilla board 4")
    room_goto(room_dw_susiezilla_empty);
if (i_ex(obj_tenna_enemy))
{
    minigametext = instance_create_depth(x, y - 150, depth + 10, obj_tenna_enemy_minigametext);
    minigametext.mystring = "test";
    if (minigametype == "susiezilla")
    {
        if (minigamedifficulty == 1)
            minigametext.mystring = stringsetloc("BREAK THE STATUE!", "obj_tenna_zoom_slash_Other_13_gml_27_0");
        if (minigamedifficulty == 2)
            minigametext.mystring = stringsetloc("PROTECT RALSEI!", "obj_tenna_zoom_slash_Other_13_gml_28_0");
        if (minigamedifficulty == 3)
        {
            minigametext.mystring = stringsetloc("FIGHT...?", "obj_tenna_zoom_slash_Other_13_gml_29_0");
            minigametext.timerspeed = 3;
        }
        if (minigamedifficulty == 4)
        {
            minigametext.mystring = stringsetloc("FIGHT...?", "obj_tenna_zoom_slash_Other_13_gml_30_0");
            minigametext.timerspeed = 3;
        }
        if (minigamedifficulty == 5)
            minigametext.mystring = stringsetloc("DESTROY HOUSES!", "obj_tenna_zoom_slash_Other_13_gml_31_0");
        if (minigamedifficulty == 6)
            minigametext.mystring = stringsetloc("DESTROY HOUSES!", "obj_tenna_zoom_slash_Other_13_gml_32_0");
        if (minigameinsanityintro == true)
        {
            with (obj_tenna_enemy_minigametext)
                instance_destroy();
        }
    }
    if (minigametype == "music")
    {
        minigametext.mystring = stringsetloc("PERFORM!", "obj_tenna_zoom_slash_Other_13_gml_37_0");
        minigametext.timerspeed = 3;
    }
    if (minigametype == "cooking")
    {
        if (minigamedifficulty == 0)
            minigametext.mystring = stringsetloc("DODGE FIRE!", "obj_tenna_zoom_slash_Other_13_gml_42_0");
        if (minigamedifficulty == 1)
            minigametext.mystring = stringsetloc("DODGE AND SERVE!", "obj_tenna_zoom_slash_Other_13_gml_43_0");
        if (minigamedifficulty == 2)
            minigametext.mystring = stringsetloc("DODGE FIRE!", "obj_tenna_zoom_slash_Other_13_gml_44_0");
        if (minigamedifficulty == 3)
            minigametext.mystring = stringsetloc("DODGE AND SERVE!", "obj_tenna_zoom_slash_Other_13_gml_45_0");
        if (minigameinsanityintro == true)
        {
            with (obj_tenna_enemy_minigametext)
                instance_destroy();
        }
    }
    if (minigametype == "cowboy")
    {
        if (minigamedifficulty == 0)
            minigametext.mystring = stringsetloc("SHOOT!", "obj_tenna_zoom_slash_Other_13_gml_50_0");
        if (minigamedifficulty == 1)
            minigametext.mystring = stringsetloc("DODGE!", "obj_tenna_zoom_slash_Other_13_gml_51_0");
        minigametext.timerspeed = 2;
    }
    if (minigametype == "battle")
    {
        minigametext.mystring = stringsetloc("PHOTO 3 SMILES!", "obj_tenna_zoom_slash_Other_13_gml_57_0");
        if (minigamedifficulty == 1)
        {
            minigametext.mystring = stringsetloc("SHOOT THE TARGETS!", "obj_tenna_zoom_slash_Other_13_gml_58_0");
            with (obj_tenna_enemy_minigametext)
                depth = obj_tensionbar.depth - 10;
        }
        if (minigamedifficulty == 2)
        {
            minigametext.mystring = stringsetloc("BOUNCE THE BALL!", "obj_tenna_zoom_slash_Other_13_gml_59_0");
            with (obj_tenna_enemy_minigametext)
                depth = obj_tensionbar.depth - 10;
        }
        if (minigamedifficulty == 3)
        {
            with (obj_tenna_enemy_minigametext)
                instance_destroy();
        }
    }
}

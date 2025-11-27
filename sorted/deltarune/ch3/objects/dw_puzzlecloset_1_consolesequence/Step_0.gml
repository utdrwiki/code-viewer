if (con == 40)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (A console and TV.)/", "obj_dw_puzzlecloset_1_consolesequence_slash_Step_0_gml_8_0");
    msgnextloc("* (It won't turn on...)/%", "obj_dw_puzzlecloset_1_consolesequence_slash_Step_0_gml_9_0");
    d_make();
    con = 41;
}
if (con == 41 && !d_ex())
{
    con = -1;
    global.interact = 0;
}
if (con == -1)
{
    if (global.flag[1133] == 1)
        con = 0;
}
if (con == 1)
{
    con = -2;
    global.facing = 2;
    obj_puzzlecloset_manager.camcontrol = false;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_pan(303, 0, 12);
    c_sel(kr);
    c_walkdirect(604, 272, 12);
    c_sel(su);
    c_walkdirect(644, 298, 25);
    c_sel(ra);
    c_walkdirect(558, 300, 30);
    c_wait(30);
    c_sel(kr);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait(30);
    if (global.flag[1055] > 0)
        c_var_instance(id, "con", 60);
    else
        c_var_instance(id, "con", 50);
    c_wait(1);
}
if (con == 50)
{
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* It's a game console..^1. But there are no controllers./", "obj_dw_puzzlecloset_1_consolesequence_slash_Step_0_gml_46_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* Don't worry^1, I made sure to take mine./%", "obj_dw_puzzlecloset_1_consolesequence_slash_Step_0_gml_48_0");
    c_var_instance(id, "con", 98);
    c_talk();
    c_wait_box(0);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_sel(kr);
    c_facing("d");
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw);
    c_wait_talk();
}
if (con == 60)
{
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* It's a game console..^1. But there are no.../", "obj_dw_puzzlecloset_1_consolesequence_slash_Step_0_gml_69_0");
    c_msgnextloc("\\EL* ..^1. huh? Kris^1, where'd you get that controller.../%", "obj_dw_puzzlecloset_1_consolesequence_slash_Step_0_gml_70_0");
    c_var_instance(id, "con", 98);
    c_talk();
    c_wait_box(0);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("l");
    c_sel(kr);
    c_facing("d");
    c_wait_box(1);
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait_talk();
}
if (con == 98)
{
    c_sel(kr);
    c_facing("u");
    global.facing = 2;
    c_var_instance(id, "con", 99);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    obj_mainchara.cutscene = true;
}
if (con == 99 && !i_ex(cutscene_master))
{
    global.facing = 2;
    with (obj_b3bs_console)
    {
        buffer = 3;
        cantuse = false;
        con = 0.2;
    }
    obj_puzzlecloset_manager.camcontrol = true;
    global.flag[1090] = 1;
    con = 100;
    x = room_width;
}

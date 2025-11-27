if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    con = 2;
    c_sel(kr);
    c_delayfacing(16, "u");
    c_sel(su);
    c_delayfacing(16, "u");
    c_sel(ra);
    c_facing("u");
    c_wait(30);
    var solved_no_hints = !global.flag[886] && !global.flag[891];
    var solved_one_hint = (global.flag[886] && !global.flag[891]) || (!global.flag[886] && global.flag[891]);
    if (solved_no_hints)
    {
        c_sel(ra);
        c_sprite(spr_ralsei_turn_right_subtle);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E1* Amazing^1, Kris^1! You already knew the answer.../", "obj_ch4_DCA08B_slash_Step_0_gml_42_0");
        c_msgnextloc("\\E2* ..^1. You must really..^1. know a lot of things^1, don't you./%", "obj_ch4_DCA08B_slash_Step_0_gml_43_0");
        c_talk();
        c_wait_box(1);
        c_sel(ra);
        c_facing("u");
        c_wait_talk();
    }
    else if (solved_one_hint)
    {
        c_sel(ra);
        c_sprite(spr_ralsei_turn_right_subtle);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E1* Amazing^1, Kris^1! You solved it without the second hint.../", "obj_ch4_DCA08B_slash_Step_0_gml_57_0");
        c_msgnextloc("\\EQ* ..^1. You must really..^1. be an expert on the prophecy./%", "obj_ch4_DCA08B_slash_Step_0_gml_58_0");
        c_talk();
        c_wait_box(1);
        c_sel(ra);
        c_facing("u");
        c_wait_talk();
    }
    else
    {
        c_sel(su);
        c_sprite(spr_susie_hand_hips);
        c_addxy(0, -4);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Nice^1, Kris!/", "obj_ch4_DCA08B_slash_Step_0_gml_73_0");
        c_msgnextloc("\\EA* All we had to do was follow the prophecy thing./%", "obj_ch4_DCA08B_slash_Step_0_gml_74_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_sprite(spr_susie_hand_up);
        c_addxy(0, -2);
        c_sel(kr);
        c_facing("r");
        c_sel(ra);
        c_facing("r");
        c_wait_talk();
        c_wait(30);
        c_sel(su);
        c_sprite(spr_susie_hand_hips);
        c_addxy(0, 2);
        c_speaker("susie");
        c_msgsetloc(0, "\\E2* If it's that easy^1, maybe we should just do whatever it says?/", "obj_ch4_DCA08B_slash_Step_0_gml_97_0");
        c_msgnextloc("\\E9* How about it^1, Ralsei. Wanna memorize it for us?/%", "obj_ch4_DCA08B_slash_Step_0_gml_98_0");
        c_talk();
        c_wait_box(1);
        c_sel(kr);
        c_facing("l");
        c_sel(su);
        c_facing("l");
        c_addxy(0, 4);
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_unhappy);
        c_autowalk(0);
        c_imagespeed(0.3);
        c_walk("l", 2, 6);
        c_delaycmd(7, "imagespeed", 0);
        c_wait_talk();
        c_wait(15);
        c_sel(ra);
        c_autowalk(1);
        c_imagespeed(0.3);
        c_walk("r", 2, 6);
        c_delaycmd(7, "imagespeed", 0);
        c_sel(su);
        c_sprite(spr_susie_walk_left_dw_unhappy);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EQ* ..^1. umm^1, that's okay^1, Susie. I already know it./", "obj_ch4_DCA08B_slash_Step_0_gml_130_0");
        c_facenext("susie", 10);
        c_msgnextloc("\\EA* Oh^1, okay^1, sweet./%", "obj_ch4_DCA08B_slash_Step_0_gml_132_0");
        c_talk();
        c_wait_box(2);
        c_sel(su);
        c_facing("l");
        c_wait_talk();
    }
    c_wait(5);
    c_pannable(1);
    c_panobj(kr_actor, 2);
    c_wait(3);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_customfunc(function()
    {
        global.facing = 0;
    });
    c_wait(1);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(850, 2);
    global.flag[886] = -1;
    global.flag[891] = -1;
    con = 99;
}

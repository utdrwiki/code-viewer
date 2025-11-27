if (con < 0)
    exit;
if (i_ex(obj_dw_transition))
    exit;
if (con == 0)
{
    global.interact = 1;
    con = 2;
    alarm[0] = 1;
}
if (con == 3)
{
    con = 4;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (obj_mainchara)
        fun = 0;
    with (obj_caterpillarchara)
        fun = 0;
    c_wait(10);
    c_sel(kr);
    c_setxy(388, 216);
    c_sel(su);
    c_setxy(210, 200);
    c_wait(30);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("r");
    c_wait(30);
    c_walkdirect_wait(272, su_actor.y, 15);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. What's with this place?/%", "obj_dw_church_a_intro1_slash_Step_0_gml_53_0");
    c_talk_wait();
    c_sel(su);
    c_facing("d");
    c_wait(12);
    c_facing("l");
    c_wait(12);
    c_facing("u");
    c_wait(30);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_head_scratch_dw);
    c_addxy(0, -6);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* ..^1. kinda gives me the creeps./%", "obj_dw_church_a_intro1_slash_Step_0_gml_70_0");
    c_talk_wait();
    c_halt();
    c_autowalk(1);
    c_facing("u");
    c_addxy(0, 6);
    c_wait(15);
    c_facing("r");
    c_wait(30);
    c_walkdirect_wait(325, su_actor.y, 15);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. Let's go./%", "obj_dw_church_a_intro1_slash_Step_0_gml_87_0");
    c_talk_wait();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 4 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.facing = 0;
    global.interact = 0;
    global.plot = 108;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("darkchurch_intro.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    var save_point = instance_create(300, 200, obj_savepoint);
    with (save_point)
        scr_depth();
    run_check = scr_flag_get(1636) == 0;
}
if (con == 10)
{
    con = 4;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    with (obj_mainchara)
        fun = 0;
    with (obj_caterpillarchara)
        fun = 0;
    c_sel(kr);
    c_setxy(300, 216);
    c_sprite(spr_kris_dw_landed);
    c_addxy(0, -4);
    c_sel(su);
    c_setxy(660, 235);
    c_wait(30);
    c_var_instance(blackall, "visible", false);
    c_wait(30);
    c_sel(kr);
    c_autowalk(0);
    c_imageindex(1);
    c_wait(6);
    c_facing("d");
    c_halt();
    c_addxy(0, 4);
    c_wait(30);
    c_sel(su);
    c_walkdirect_wait(445, 235, 40);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Hey^1, took you long enough./%", "obj_dw_church_a_intro1_slash_Step_0_gml_165_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect_wait(349, 235, 20);
    c_walkdirect_wait(349, 198, 12);
    c_facing("l");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Let's go./%", "obj_dw_church_a_intro1_slash_Step_0_gml_177_0");
    c_talk_wait();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (run_check)
{
    if (run_con < 0)
    {
        if (obj_mainchara.x < 560)
        {
            if (obj_mainchara.runcounter > 5)
            {
                run_timer = 0;
                run_check = false;
                con = -1;
            }
        }
        else
        {
            run_con = 0;
        }
    }
    if (run_con == 0 && global.interact == 0)
    {
        run_con = 1;
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EK* (Hey Kris^1, I know you're probably creeped out^1, but...)/", "obj_dw_church_a_intro1_slash_Step_0_gml_213_0");
        msgnextloc("\\E1* (You do know you can run^1, right?)/", "obj_dw_church_a_intro1_slash_Step_0_gml_214_0");
        msgnextloc("\\E0* (..^1. just saying.)/%", "obj_dw_church_a_intro1_slash_Step_0_gml_215_0");
        var d = d_make();
    }
    if (run_con == 1 && !d_ex())
    {
        run_con = -1;
        con = -1;
        global.interact = 0;
        run_timer = 0;
        run_check = false;
        scr_flag_set(1636, 1);
    }
}

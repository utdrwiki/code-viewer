if (global.plot >= 50 && global.plot < 90)
{
    if (leave_con == 0 && obj_mainchara.x >= 610)
        leave_con = 1;
    if (leave_con == 1)
    {
        leave_con++;
        global.interact = 1;
        obj_mainchara.x = 604;
        scr_speaker("noelle");
        msgsetloc(0, "\\EH* (Kris^1, please don't ruin this for me...)/%", "obj_ch4_PDC08_slash_Step_0_gml_18_0");
        d_make();
    }
    if (leave_con == 2 && !d_ex())
    {
        leave_con = 0;
        global.interact = 0;
        global.facing = 0;
    }
}
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
    scr_getchar(2);
    scr_getchar(4);
    scr_makecaterpillar(obj_mainchara.x + 20, obj_mainchara.y - 7, 2, 0);
    scr_makecaterpillar(obj_mainchara.x + 60, obj_mainchara.y - 7, 4, 1);
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    no = actor_count + 1;
    no_actor = instance_create(309, 370, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = spr_noelle_walk_right_lw;
    c_sel(kr);
    c_setxy(430, 379);
    c_sel(su);
    c_setxy(456, 373);
    c_wait(15);
    c_pannable(1);
    c_pan(200, 240, 1);
    c_wait(1);
    c_pan(160, 240, 40);
    c_sel(kr);
    c_walkdirect(348, 379, 50);
    c_sel(su);
    c_walkdirect(374, 373, 50);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    c_wait(60);
    var kept_waiting = scr_flag_get(1559) > 0;
    var had_tea_party = scr_flag_get(1559) == 1;
    var had_diner = scr_flag_get(1559) == 2;
    if (kept_waiting)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* Alright^1, ready to explore your house now!/", "obj_ch4_PDC08_slash_Step_0_gml_96_0");
        c_facenext("noelle", "4");
        c_msgnextloc("\\E4* Umm^1, great!/", "obj_ch4_PDC08_slash_Step_0_gml_98_0");
        c_msgnextloc("\\EH* ..^1. so^1, um^1, where did you two..^1. go?/", "obj_ch4_PDC08_slash_Step_0_gml_99_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* Oh. Uh.../%", "obj_ch4_PDC08_slash_Step_0_gml_101_0");
        c_talk();
        c_wait_box(2);
        c_sel(no);
        c_sprite(spr_noelle_walk_right_lw_smile);
        c_wait_box(3);
        c_sel(no);
        c_sprite(spr_noelle_walk_right_lw);
        c_sel(su);
        c_sprite(spr_susie_walk_left_awkward);
        c_wait_box(5);
        c_sel(su);
        c_facing("r");
        c_wait_talk();
        c_wait(30);
        c_sel(su);
        c_facing("l");
        if (had_diner)
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E9* Kris took me out to lunch at the diner. It was awesome./", "obj_ch4_PDC08_slash_Step_0_gml_131_0");
            c_msgnextloc("\\E7* Kinda feel like we got a little closer. Y'know./", "obj_ch4_PDC08_slash_Step_0_gml_132_0");
            c_facenext("noelle", 18);
            c_msgnextloc("\\EI* Oh...^1! I'm glad? You got closer? While I was waiting./", "obj_ch4_PDC08_slash_Step_0_gml_134_0");
            c_facenext("susie", 9);
            c_msgnextloc("\\E9* Yeah^1, me too./%", "obj_ch4_PDC08_slash_Step_0_gml_136_0");
            c_talk();
            c_wait_box(1);
            c_sel(su);
            c_autowalk(0);
            c_sprite(spr_susie_playful_punch);
            c_addxy(-12, 0);
            c_imageindex(0);
            c_wait(4);
            c_snd_play(snd_bump);
            c_imageindex(1);
            c_sel(kr);
            c_shakeobj();
            c_wait(4);
            c_sel(su);
            c_imageindex(0);
            c_wait_box(3);
            c_sel(su);
            c_facing("l");
            c_addxy(12, 0);
            c_halt();
            c_sel(no);
            c_sprite(spr_noelle_walk_right_lw_smile);
            c_wait_box(5);
            c_sel(no);
            c_facing("r");
            c_wait_talk();
            c_wait(60);
            c_sel(no);
            c_facing("u");
            c_shakeobj();
            c_speaker("noelle");
            c_msgsetloc(0, "\\E8* ..^1. Well^1, ANYWAYS^1! This is..^1. my house!/%", "obj_ch4_PDC08_slash_Step_0_gml_176_0");
            c_talk_wait();
        }
        else
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E7* Yeah^1, we were having^1, like^1, a tea party^1, and.../", "obj_ch4_PDC08_slash_Step_0_gml_181_0");
            c_facenext("noelle", "S");
            c_msgnextloc("\\ES* A TEA PARTY???/", "obj_ch4_PDC08_slash_Step_0_gml_183_0");
            c_facenext("susie", 20);
            c_msgnextloc("\\EK* Oops. I mean^1, uh.../", "obj_ch4_PDC08_slash_Step_0_gml_185_0");
            c_facenext("noelle", "R");
            c_msgnextloc("\\ER* Did you..^1. dress up???/", "obj_ch4_PDC08_slash_Step_0_gml_187_0");
            c_facenext("susie", "M");
            c_msgnextloc("\\EM* Uh^1, no^1! We were just^1, uh^1, reviewing the project./", "obj_ch4_PDC08_slash_Step_0_gml_189_0");
            c_facenext("noelle", "3");
            c_msgnextloc("\\E3* Oh. Right^1! So^1, this is my house.../%", "obj_ch4_PDC08_slash_Step_0_gml_191_0");
            c_talk();
            c_wait_box(2);
            c_sel(no);
            c_sprite(spr_noelle_shocked_lw);
            c_shakeobj();
            c_sel(su);
            c_sprite(spr_susie_walk_left_awkward);
            c_wait_box(6);
            c_sel(no);
            c_facing("r");
            c_sel(su);
            c_facing("l");
            c_wait_box(8);
            c_sel(su);
            c_facing("r");
            c_wait_box(10);
            c_sel(no);
            c_sprite(spr_noelle_walk_right_lw_smile);
            c_sel(su);
            c_facing("l");
            c_wait_talk();
        }
    }
    else
    {
        c_speaker("noelle");
        c_msgsetloc(0, "\\E4* Here's my house^1! Umm^1, sorry^1, it's not much^1, but.../%", "obj_ch4_PDC08_slash_Step_0_gml_225_0");
        c_talk_wait();
    }
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(no);
    c_facing("u");
    c_wait(5);
    c_pan(160, 10, 90);
    c_wait(150);
    c_sel(su);
    c_sprite(spr_susie_shocked_behind_left_lw);
    c_pan(160, 240, 90);
    c_wait(120);
    c_sel(su);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* The hell!? It's huge!/", "obj_ch4_PDC08_slash_Step_0_gml_259_0");
    c_msgnextloc("\\E6* I'm already getting lost just standing here!/", "obj_ch4_PDC08_slash_Step_0_gml_260_0");
    c_facenext("noelle", "4");
    c_msgnextloc("\\E4* O-oh^1, really!? Then^1, um^1, here^1! I'll show you around!/%", "obj_ch4_PDC08_slash_Step_0_gml_262_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("l");
    c_wait_box(3);
    c_sel(kr);
    c_facing("l");
    c_sel(no);
    c_facing("r");
    c_waittalk();
    c_sel(no);
    c_autodepth(0);
    c_depth(su_actor.depth + 10);
    c_walkdirect_wait(402, 370, 30);
    c_facing("l");
    c_var_instance(id, "noelle_joined", true);
    c_speaker("no_name");
    c_msgsetloc(0, "* (Noelle joined your study group.)/%", "obj_ch4_PDC08_slash_Step_0_gml_289_0");
    c_talk_wait();
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (noelle_joined)
{
    noelle_joined = false;
    if (!snd_is_playing(noelle_joined_track[1]))
    {
        noelle_joined_track[0] = snd_init("charjoined.ogg");
        noelle_joined_track[1] = mus_play(noelle_joined_track[0], 0.7, 1);
    }
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    global.interact = 0;
    global.facing = 0;
    global.plot = 50;
    mus_volume(global.currentsong[1], 1, 30);
    snd_free(noelle_joined_track[0]);
    con = 99;
}

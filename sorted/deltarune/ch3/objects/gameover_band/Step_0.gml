if (is_replay_gameover)
{
    if (con == -1)
        con = 0;
    if (con == 0 && !d_ex())
    {
        con = 1;
        alarm[0] = 60;
        with (gameover_parent)
            scr_lerpvar("blackalpha", 0, 1, 30);
    }
    if (con == 2 && !d_ex())
    {
        con = -1;
        snd_free_all();
        inst = instance_create(0, 0, obj_persistentfadein);
        global.interact = 3;
        global.facing = 0;
        global.entrance = 4;
        room_goto(room_dw_ranking_a);
    }
}
if (is_replay_gameover)
    exit;
if (tenna == -4)
{
    if (i_ex(obj_actor_tenna))
    {
        tenna = instance_find(obj_actor_tenna, 0);
        tenna.sprite_index = spr_tenna_pose_podium;
        tenna.image_index = 1;
        if (gameover_sequence == 2)
            tenna.sprite_index = spr_tenna_grasp;
        gameover_parent.tenna_arrive = true;
        init = true;
        alarm[0] = 30;
    }
}
if (!init)
    exit;
if (gameover_sequence == 1)
{
    if (con == 0)
    {
        con = 1;
        alarm[0] = 30;
        scr_speaker("tenna");
        msgsetloc(0, "* Ralsei^1! You sang brilliantly!/%", "obj_gameover_band_slash_Step_0_gml_35_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 2 && !d_ex())
    {
        con = 3;
        alarm[0] = 30;
        tenna.preset = 0;
        tenna.sprite_index = spr_tenna_grasp;
        tenna.image_index = 0;
        with (tenna)
            scr_shakeobj();
        scr_speaker("tenna");
        msgsetloc(0, "* Unfortunately^1, everyone else was..^1. terrible!!/%", "obj_gameover_band_slash_Step_0_gml_54_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 4 && !d_ex())
    {
        con = 5;
        alarm[0] = 30;
        tenna.preset = 0;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_whisper;
        tenna.image_index = 0;
        scr_speaker("tenna");
        msgsetloc(0, "* (Or maybe it was just some cutting-edge progressive rock.)/%", "obj_gameover_band_slash_Step_0_gml_73_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 6 && !d_ex())
    {
        con = 7;
        alarm[0] = 30;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_point_up;
        scr_speaker("tenna");
        msgsetloc(0, "* But don't worry. I^1, your loving agent^1, have booked you ANOTHER show!!/", "obj_gameover_band_slash_Step_0_gml_88_0");
        msgnextloc("* It starts in.../%", "obj_gameover_band_slash_Step_0_gml_89_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 8 && !d_ex())
    {
        con = 9;
        alarm[0] = 30;
        tenna.preset = 0;
        tenna.sprite_index = spr_tenna_grasp;
        with (tenna)
            scr_shakeobj();
        scr_speaker("tenna");
        msgsetloc(0, "* What!? 3 seconds!?/%", "obj_gameover_band_slash_Step_0_gml_106_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 10 && !d_ex())
    {
        con = 11;
        alarm[0] = 30;
        tenna.preset = 0;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_point_left;
        tenna.image_index = 0;
        scr_funnytext_init(0, 0, 0, scr_84_get_sprite("spr_funnytext_challenge"), 0, 0);
        scr_speaker("tenna");
        msgsetloc(0, "* Well^1, what are you doing!? Go and \\O0 again!/%", "obj_gameover_band_slash_Step_0_gml_125_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 12 && !d_ex())
    {
        con = 13;
        alarm[0] = 30;
        gameover_parent.con = 1;
        gameover_parent.timer = 0;
    }
    if (con == 14 && !d_ex())
    {
        con = 99;
        instance_destroy();
    }
}
if (gameover_sequence == 2)
{
    var _times_lost = scr_flag_get(1096);
    if (con == 0)
    {
        con = 1;
        alarm[0] = 30;
        scr_speaker("tenna");
        msgsetloc(0, "* Oh no^1! Another GAME OVER!?/", "obj_gameover_band_slash_Step_0_gml_158_0");
        switch (_times_lost)
        {
            case 2:
                msgnextloc("* The audience would be throwing tomatoes.../", "obj_gameover_band_slash_Step_0_gml_163_0");
                msgnextloc("* ..^1. if we didn't use them all on the cooking show!/%", "obj_gameover_band_slash_Step_0_gml_164_0");
                break;
            case 3:
                msgnextloc("* Hey^1, this isn't time to practice your free-form jazz!/%", "obj_gameover_band_slash_Step_0_gml_167_0");
                break;
            case 4:
                msgnextloc("* C'mon..^1. Just imagine you're at that big hippie concert!/", "obj_gameover_band_slash_Step_0_gml_170_0");
                msgnextloc("* ..^1. You don't know what I'm talking about? Nevermind!/%", "obj_gameover_band_slash_Step_0_gml_171_0");
                break;
            default:
                msgnextloc("* That's it!!^1! That's it!!^1! I'm paying off the audience and reviewers!!!/", "obj_gameover_band_slash_Step_0_gml_187_0");
                msgnextloc("* Your POPULARITY will never drop!!^1! Go wild!!!/%", "obj_gameover_band_slash_Step_0_gml_188_0");
                break;
        }
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 2 && !d_ex())
    {
        con = 7;
        alarm[0] = 30;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_point_at_screen;
        scr_funnytext_init(0, 0, 0, scr_84_get_sprite("spr_funnytext_challenge"), 0, 0);
        scr_speaker("tenna");
        msgsetloc(0, "* Alright^1, one more try^1! Let's&\\O0 again!^1!/%", "obj_gameover_band_slash_Step_0_gml_209_0");
        var d = d_make();
        d.side = 0;
    }
    if (con == 8 && !d_ex())
    {
        con = 9;
        alarm[0] = 30;
        scr_lerp_instance_var(tenna, "x", tenna.x, camerax() + view_wport[0] + 200, 40, 4, "in");
        gameover_parent.con = 1;
        gameover_parent.timer = 0;
    }
    if (con == 10 && !d_ex())
    {
        con = 99;
        with (obj_rhythmgame)
            event_user(1);
        instance_destroy();
    }
}

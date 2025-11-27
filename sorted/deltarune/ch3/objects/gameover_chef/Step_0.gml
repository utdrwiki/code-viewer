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
        global.entrance = 3;
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
        msgsetloc(0, "* Hey^1, you know those famous STARS they award to incredible restaurants...?/%", "obj_gameover_chef_slash_Step_0_gml_32_0");
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
        with (tenna)
            scr_shakeobj();
        scr_speaker("tenna");
        msgsetloc(0, "* You just got a NEGATIVE ONE!^1! The world's first Anti-Good Restaurant!!/%", "obj_gameover_chef_slash_Step_0_gml_49_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 4 && !d_ex())
    {
        con = 5;
        alarm[0] = 30;
        tenna.preset = 2;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_whisper;
        scr_speaker("tenna");
        msgsetloc(0, "* Gotta give it to ya^1, you're trailblazers!/%", "obj_gameover_chef_slash_Step_0_gml_66_0");
        var d = d_make();
        d.stay = 5;
        d.side = 0;
    }
    if (con == 6 && !d_ex())
    {
        con = 7;
        alarm[0] = 30;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_point_at_screen;
        scr_funnytext_init(0, 0, 0, scr_84_get_sprite("spr_funnytext_challenge"), 0, 0);
        scr_speaker("tenna");
        msgsetloc(0, "* Alright^1, one more try^1! Let's&\\O0 again!^1!/%", "obj_gameover_chef_slash_Step_0_gml_84_0");
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
        instance_destroy();
    }
}
if (gameover_sequence == 2)
{
    if (con == 0)
    {
        con = 1;
        alarm[0] = 30;
        scr_speaker("tenna");
        msgsetsubloc(0, "* You lost ~1 TIMES?!/", times_lost, "obj_gameover_chef_slash_Step_0_gml_121_0");
        switch (times_lost)
        {
            case 2:
                msgnextloc("* Can someone go check if the fire is defective!?/%", "obj_gameover_chef_slash_Step_0_gml_126_0");
                break;
            case 3:
                msgnextloc("* The audience is starting to question the quality of the popcorn!/%", "obj_gameover_chef_slash_Step_0_gml_129_0");
                break;
            case 4:
                msgnextloc("* If that famous angry chef gets here^1, we're gonna get shut down!/%", "obj_gameover_chef_slash_Step_0_gml_132_0");
                break;
            case 5:
                msgnextloc("* The food is going cold^1! The actor's union isn't gonna like this!/%", "obj_gameover_chef_slash_Step_0_gml_135_0");
                break;
            case 6:
                msgnextloc("* I'll admit it^1! I'm using imitation fire^1! But you can do it!/%", "obj_gameover_chef_slash_Step_0_gml_138_0");
                break;
            case 7:
                msgnextloc("* With the screen going so grey I thought this was an infomercial!/%", "obj_gameover_chef_slash_Step_0_gml_141_0");
                break;
            case 8:
                msgnextloc("* One more loss and Susie will be replaced with a paid actor!/%", "obj_gameover_chef_slash_Step_0_gml_144_0");
                break;
            default:
                msgnextloc("* All right^1, that's it. We're turning off the lose condition./", "obj_gameover_chef_slash_Step_0_gml_147_0");
                msgnextloc("* You happy!?/%", "obj_gameover_chef_slash_Step_0_gml_148_0");
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
        msgsetloc(0, "* Alright^1, one more try^1! Let's&\\O0 again!^1!/%", "obj_gameover_chef_slash_Step_0_gml_168_0");
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
        instance_destroy();
    }
}

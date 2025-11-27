if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    char_gacha_list = [];
    for (var i = 0; i < 3; i++)
    {
        var gachapon = scr_dark_marker(720 + (i * 120), 200, spr_dw_tv_gachaball_transparent);
        gachapon.depth = base_depth - (50 + i);
        gachapon.image_angle = ((i % 2) == 1) ? (45 - (i * 10)) : (0 + (i * 20));
        char_gacha_list[array_length_1d(char_gacha_list)] = gachapon;
    }
    icee_marker[0] = char_gacha_list[0];
    icee_marker[1] = char_gacha_list[1];
    icee_marker[2] = char_gacha_list[2];
    for (var i = 0; i < array_length(icee_marker); i++)
    {
        with (icee_marker[i])
        {
            scr_depth();
            depth -= (i * 5);
        }
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 800, cameray() + 280, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.preset = 1;
    te_actor.sprite_index = spr_tenna_grasp;
    c_sel(te);
    c_autodepth(0);
    c_depth(5000);
    c_sel(ra);
    c_facing("d");
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_down_feet);
    c_setxy(icee_marker[0].x - 18, icee_marker[0].y - 27);
    c_sel(su);
    c_facing("d");
    c_sprite(spr_susie_walk_down_feet);
    c_setxy(icee_marker[1].x - 26, icee_marker[1].y - 30);
    c_sel(kr);
    c_facing("d");
    c_sprite(spr_krisd_feet);
    c_setxy(icee_marker[2].x - 20, icee_marker[2].y - 13);
    c_autodepth(0);
    c_depth(icee_marker[2].depth + 10);
    c_wait(60);
    c_pannable(1);
    c_pan_wait(540, cameray(), 60);
    c_var_instance(id, "tenna_fly_timer", 0);
    c_var_instance(id, "tenna_fly", true);
    c_tenna_preset(4);
    c_speaker("tenna");
    c_msgsetloc(0, "* Where are you!? My contestants!?/", "obj_ch3_GSD02_slash_Step_0_gml_95_0");
    c_msgnextloc("* I'll give you funny goop that gets stuck on the carpet^1! A lifetime supply!/", "obj_ch3_GSD02_slash_Step_0_gml_99_0");
    c_msgnextloc("* Come baaaaack!!/%", "obj_ch3_GSD02_slash_Step_0_gml_100_0");
    c_talk();
    c_wait_box(5);
    c_var_instance(id, "tenna_fly_stop", true);
    c_wait_talk();
    c_wait_if(id, "tenna_fly", "=", false);
    c_wait(90);
    c_soundplay(snd_noise);
    c_lerp_var_instance(icee_marker[0], "y", icee_marker[0].y, icee_marker[0].y - 8, 8);
    c_wait(30);
    c_soundplay(snd_noise);
    c_lerp_var_instance(icee_marker[1], "y", icee_marker[1].y, icee_marker[1].y - 8, 8);
    c_wait(30);
    c_soundplay(snd_noise);
    c_lerp_var_instance(icee_marker[2], "y", icee_marker[2].y, icee_marker[2].y - 8, 8);
    c_wait(60);
    c_sel(ra);
    c_autowalk(1);
    c_facing("d");
    c_sel(su);
    c_autowalk(1);
    c_facing("d");
    c_sel(kr);
    c_autowalk(1);
    c_facing("d");
    c_sound_play(snd_wing);
    c_var_instance(id, "icee_throw", true);
    c_wait_if(id, "icee_throw", "=", false);
    c_wait(15);
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EM* Looks like he's gone.../", "obj_ch3_GSD02_slash_Step_0_gml_152_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* Now's our chance!^1! Let's get out of here!!/%", "obj_ch3_GSD02_slash_Step_0_gml_157_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 250;
    con = 99;
    scr_tempsave();
}
if (i_ex(obj_cutscene_master) && tenna_fly)
{
    tenna_fly_timer--;
    if (te_actor.sprite_index == spr_tenna_dance_cane)
    {
        te_actor.image_speed = 2;
    }
    else if (te_actor.wobbleamt == 40 && te_actor.wobblestate == 4)
    {
        te_actor.wobbletime = 2;
        te_actor.changespeed = 5;
    }
    else if (te_actor.sprite_index == spr_tenna_grasp_anim)
    {
        te_actor.image_speed = 0.5;
    }
    else if (te_actor.wobblestate == 5 && te_actor.wobbleamt == 30)
    {
    }
    else
    {
        te_actor.wobbletime = 2;
        te_actor.image_speed = 0.25;
    }
    if (tenna_fly_timer <= 0)
    {
        var fly_right = (tenna_fly_counter % 2) == 1;
        var target_x = fly_right ? (camerax() + view_wport[0] + 200) : (camerax() - 200);
        if (te_actor.x != target_x)
        {
            te_actor.x = scr_movetowards(te_actor.x, target_x, 24);
        }
        else if (!tenna_fly_stop)
        {
            te_actor.preset = choose(3, 4, 6, 5, 17, 12);
            for (var rerolls = 0; te_actor.preset == tenna_fly_prevchoice && rerolls < 10; rerolls++)
                te_actor.preset = choose(3, 4, 6, 5, 17, 12);
            tenna_fly_prevchoice = te_actor.preset;
            tenna_fly_timer = tenna_fly_time;
            tenna_fly_counter++;
        }
        else
        {
            tenna_fly = false;
        }
    }
}
if (icee_throw)
{
    icee_throw_timer++;
    if (icee_throw_timer == 1)
    {
        for (var i = 0; i < array_length(icee_marker); i++)
        {
            with (icee_marker[i])
            {
                vspeed = -21;
                gravity = 1;
            }
        }
    }
    if (icee_throw_timer == 16)
    {
        for (var i = 0; i < array_length(icee_marker); i++)
        {
            with (icee_marker[i])
                depth = 1000010;
        }
    }
    if (icee_throw_timer == 40)
    {
        sound_play(snd_bump);
        for (var i = 0; i < array_length(icee_marker); i++)
        {
            with (icee_marker[i])
            {
                gravity = 0;
                vspeed = 0;
            }
        }
        icee_throw = false;
    }
}

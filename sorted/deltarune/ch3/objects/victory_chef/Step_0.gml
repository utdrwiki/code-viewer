if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        y = cameray() - 100;
    }
    with (obj_caterpillarchara)
    {
        cutscene = 1;
        fun = 1;
        y = cameray() - 100;
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 200, cameray() + 400, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    c_sel(te);
    c_autowalk(0);
    c_tenna_preset(22);
    c_sel(kr);
    c_autodepth(0);
    c_depth(9990);
    c_sprite(spr_kris_chef);
    c_setxy(320, 280);
    c_visible(0);
    c_sel(su);
    c_autodepth(0);
    c_depth(9990);
    c_sprite(spr_susie_chef);
    c_setxy(95, 160);
    c_visible(0);
    c_sel(ra);
    c_autodepth(0);
    c_depth(9990);
    c_sprite(spr_ralsei_chef);
    c_setxy(497, 162);
    c_visible(0);
    with (obj_chefs_susie)
        image_speed = 0;
    with (obj_chefs_ralsei)
        image_speed = 0;
    with (obj_chefs_customer)
        image_speed = 0;
    with (obj_chefs_fire)
    {
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
    }
    with (obj_chefs_food)
    {
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
    }
}
if (con == 2)
{
    con = 3;
    alarm[0] = 30;
    c_wait(30);
    c_speaker("tenna");
    c_msgside("top");
    c_msgsetloc(0, "* THAAAAT'S IT!!!/%", "obj_victory_chef_slash_Step_0_gml_86_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 4 && customcon == 1 && !d_ex())
{
    con = 10;
    customcon = 0;
    with (obj_chefs_customer)
    {
        depth = 9000;
        if (sprEat == 4256)
        {
            scr_lerpvar("y", y, y + 40, 15, 2, "out");
        }
        else
        {
            var target_x = (image_xscale < 0) ? (camerax() - 200) : (view_wport[0] + 200);
            scr_lerpvar("x", x, target_x, 30, 2, "out");
        }
    }
    with (obj_chefs_fire)
    {
        scr_lerpvar("y", y, cameray() - 100, 15, 2, "out");
        scr_doom(id, 16);
    }
    with (obj_chefs_food)
    {
        scr_lerpvar("y", y, cameray() - 100, 15, 2, "out");
        scr_doom(id, 16);
    }
    with (obj_chefs_kris)
    {
        sprite_index = spr_kris_chef;
        scr_lerpvar("y", y, 280, 15, 2, "out");
        scr_lerpvar("x", x, 320, 15, 2, "out");
    }
    scr_delay_var("customcon", 1, 16);
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 11;
    customcon = 0;
    with (obj_chefs_kris)
        visible = 0;
    with (obj_chefs_susie)
        visible = 0;
    with (obj_chefs_ralsei)
        visible = 0;
    c_waitcustom_end();
    c_sel(te);
    c_autodepth(0);
    c_depth(9900);
    c_sel(kr);
    c_visible(1);
    c_sel(su);
    c_visible(1);
    c_sel(ra);
    c_visible(1);
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(te_actor, "x", 407, 16, 2, "out");
    c_wait(16);
    c_mus2("initloop", "baci_perugina.ogg", 0);
    c_wait(60);
    c_tenna_preset(22);
    c_speaker("tenna");
    c_msgsetloc(0, "* Well^1, would you LOOK at those smiling customers!?/%", "obj_victory_chef_slash_Step_0_gml_173_0");
    c_talk_wait();
    c_sel(te);
    c_autowalk(0);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(1);
    c_speaker("tenna");
    c_msgsetloc(0, "* They're happy as yet-to-be-cooked clams!/%", "obj_victory_chef_slash_Step_0_gml_183_0");
    c_talk_wait();
    c_tenna_preset(33);
    c_tenna_sprite(spr_tenna_point_left);
    c_var_lerp_to_instance(te_actor, "x", 496, 8, 2, "out");
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* And Kris^1, YOU'RE just as happy^1, aren't you?/", "obj_victory_chef_slash_Step_0_gml_194_0");
    c_msgnextloc("* You remember how FUN watching cooking shows was too^1, don't you!?/", "obj_victory_chef_slash_Step_0_gml_195_0");
    c_facenext("susie", "K");
    c_msgnextloc("\\EK* So did we win?/", "obj_victory_chef_slash_Step_0_gml_197_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* What do you THINK? That was the most UNFORGETTABLE show in prime time!!/", "obj_victory_chef_slash_Step_0_gml_199_0");
    c_msgnextloc("* MIKE^1! Show the results OF THE BOARD!!!/%", "obj_victory_chef_slash_Step_0_gml_200_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(22);
    c_var_lerp_to_instance(te_actor, "x", 407, 8, 2, "out");
    c_wait_box(5);
    c_tenna_preset(-1);
    c_tenna_sprite(spr_tenna_laugh_pose);
    c_wait_box(6);
    c_snd_play(snd_jump);
    c_tenna_preset(0);
    c_sprite(spr_tenna_attack);
    c_var_instance(te_actor, "x", 407);
    c_var_instance(te_actor, "scaled_bounce", true);
    c_var_lerp_to_instance(te_actor, "image_xscale", 3, 16);
    c_var_lerp_to_instance(te_actor, "image_yscale", 3, 16);
    c_var_lerp_to_instance(te_actor, "x", 333, 16);
    c_var_lerp_to_instance(te_actor, "y", 200, 8, 1, "out");
    c_wait(9);
    c_var_lerp_to_instance(te_actor, "y", 440, 8, 1, "in");
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait_talk();
    c_mus2("volume", 0, 30);
    c_waitcustom();
}
if (con == 11 && customcon == 1 && !d_ex())
{
    con = -1;
    customcon = 0;
    global.plot = 110;
    scr_script_delayed(snd_free_all, 30);
    instance_create(0, 0, obj_round_evaluation);
}
if (con == 6 && !d_ex())
{
    con = -1;
    global.plot = 110;
    room_goto(room_ch3_gameshowroom);
}

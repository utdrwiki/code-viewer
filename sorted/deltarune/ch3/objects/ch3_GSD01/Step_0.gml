if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + 493, cameray() + 274, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_pose_podium;
    te_actor.preset = 0;
    c_sel(kr);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_sel(te);
    c_visible(0);
    c_var_instance(blackall, "visible", 0);
    c_wait(5);
    c_var_instance(bg_vfx, "con", 1);
    c_wait(5);
    c_var_instance(blackall, "visible", 1);
    c_var_instance(bg_vfx, "show_overlay", false);
    c_sel(kr);
    c_visible(1);
    c_sel(ra);
    c_visible(1);
    c_sel(su);
    c_visible(1);
    c_sel(te);
    c_visible(1);
    c_var_instance(bg_vfx, "con", -1);
    c_var_instance(gameshow_screen, "visible", "1");
    c_var_instance(bg_vfx, "show_overlay", false);
    c_var_instance(blackall, "visible", 0);
    c_sel(kr);
    c_facing("d");
    c_setxy(84, 177);
    c_sel(su);
    c_autowalk(0);
    c_facing("d");
    c_setxy(163, 162);
    c_sel(ra);
    c_autowalk(0);
    c_facing("d");
    c_setxy(248, 166);
    c_var_instance(id, "show_fire", true);
    c_var_instance(id, "set_gacha", true);
    c_var_instance(gameshow_screen, "depth", 100000);
    c_var_instance(bg_vfx, "con", 2);
    c_var_instance(bg_vfx, "palette_index", 1);
    c_var_instance(bg_vfx, "color_changing", true);
    c_var_instance(gameshow_screen, "shakey_active", true);
    c_var_instance(id, "susie_punch", true);
    c_sel(ra);
    c_sprite(spr_ralsei_trapped_press);
    c_addxy(-2, 0);
    c_autowalk(0);
    c_imagespeed(0.1);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (show_fire)
{
    show_fire = false;
    _flames_vfx = instance_create(0, 0, obj_dw_gameshow_stage_fire);
    _flames_vfx.depth = 99000;
    with (obj_border_controller)
        set_border(border_dw_red_smiles);
}
if (con == 10 && !d_ex() && customcon == 1)
{
    con = 11;
    customcon = 0;
    with (obj_quiz_podium)
        visible = 0;
    if (bg_vfx == -4)
    {
        bg_vfx = instance_find(obj_ch3_GSC07_bg, 0);
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sel(kr);
        c_visible(0);
        c_sel(su);
        c_visible(0);
        c_sel(ra);
        c_visible(0);
        var kr_obj = -4;
        var su_obj = -4;
        var ra_obj = -4;
        with (obj_actor)
        {
            if (name == "kris")
                kr_obj = id;
            if (name == "susie")
                su_obj = id;
            if (name == "ralsei")
                ra_obj = id;
        }
        c_sel(kr);
        c_setxy(kr_obj.x, kr_obj.y);
        c_sprite(kr_obj.sprite_index);
        c_sel(su);
        c_autowalk(0);
        c_setxy(165, 167);
        c_sprite(su_obj.sprite_index);
        c_sel(ra);
        c_setxy(250, 166);
        c_sprite(ra_obj.sprite_index);
        c_autowalk(0);
        c_imagespeed(0.1);
        c_sel(kr);
        c_visible(1);
        c_sel(su);
        c_visible(1);
        c_sel(ra);
        c_visible(1);
        c_var_instance(id, "susie_punch", true);
        c_var_instance(kr_obj, "visible", 0);
        c_var_instance(su_obj, "visible", 0);
        c_var_instance(ra_obj, "visible", 0);
        te = actor_count + 1;
        te_actor = instance_find(obj_actor_tenna, 0);
        scr_actor_setup(te, te_actor, "tenna");
        te_actor.preset = 0;
        for (var i = 0; i < instance_number(obj_ch3_GSC07_gacha); i++)
        {
            gacha[i] = instance_find(obj_ch3_GSC07_gacha, i);
            if (gacha[i].mode == 1)
                gacha[i].actor_target = kr_actor;
            if (gacha[i].mode == 2)
                gacha[i].actor_target = ra_actor;
            if (gacha[i].mode == 3 || gacha[i].mode == 4)
                gacha[i].actor_target = su_actor;
        }
        with (obj_ch3_GSC07)
            scr_doom(kr_actor, 60);
        with (obj_ch3_GSC07)
            scr_doom(su_actor, 60);
        with (obj_ch3_GSC07)
            scr_doom(ra_actor, 60);
    }
    c_waitcustom_end();
    c_var_instance(id, "border_switch", true);
    c_var_instance(id, "set_lava", true);
    c_tenna_preset(2);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("d");
    c_wait(60);
    c_var_instance(id, "tenna_convo", stringsetloc("Now it's#my turn#to play!!!", "obj_ch3_GSD01_slash_Step_0_gml_221_0"));
    c_wait(convo_wait_time);
    c_wait_if(id, "convo_active", "=", false);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_var_instance(id, "flash_background", true);
    c_snd_play(snd_rocket);
    c_wait(90);
    c_var_instance(id, "susie_punch_sound", false);
    c_var_instance(id, "board_song_mode", "start");
    c_var_instance(id, "lava_start", true);
    c_wait(30);
    c_var_instance(id, "tenna_convo", stringsetloc("Hey, isn't#this fun!?", "obj_ch3_GSD01_slash_Step_0_gml_222_0"));
    c_wait_if(id, "convo_active", "=", false);
    c_wait(90);
    c_sel(te);
    c_tenna_sprite(spr_tenna_dance_cane);
    c_imagespeed(1);
    c_var_instance(id, "tenna_convo", stringsetloc("I'm not broken!#I don't have#burn-in!#I'm... fun!!!", "obj_ch3_GSD01_slash_Step_0_gml_239_0"));
    c_wait(convo_wait_time);
    c_wait_if(id, "convo_active", "=", false);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_var_instance(id, "tenna_convo", stringsetloc("C'mon,#say it!!!#I'm!!!#Fun!!!", "obj_ch3_GSD01_slash_Step_0_gml_243_0"));
    c_wait(convo_wait_time);
    c_wait_if(id, "convo_active", "=", false);
    c_wait(60);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_tie_adjust_c);
    c_var_instance(id, "tenna_convo", stringsetloc("... Fine.#You don't#wanna say it?", "obj_ch3_GSD01_slash_Step_0_gml_242_0"));
    c_wait(convo_wait_time);
    c_wait_if(id, "convo_active", "=", false);
    c_var_instance(id, "loop_start", true);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (flash_background)
{
    flash_background = false;
    with (obj_dw_gameshow_screen_lava)
        flash_background();
}
if (tenna_convo != "")
{
    convo_active = true;
    convo_min_timer = convo_dismiss_time;
    create_dialogue_balloon(tenna_convo);
    tenna_convo = "";
}
if (convo_active)
{
    var convo_done = false;
    convo_min_timer--;
    if (!i_ex(obj_tennatalkbubble))
    {
        convo_done = true;
    }
    else if (convo_min_timer < 0)
    {
        if (button1_p() || button3_h())
        {
            with (obj_tennatalkbubble)
                timer = lifetime;
        }
    }
    convo_active = !convo_done;
}
if (con == 11 && loop_start)
{
    con = 12;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "loop_start", false);
    c_var_instance(id, "tenna_move", true);
    if (event_count == 0)
    {
        c_var_instance(id, "quiz_chase", true);
        c_tenna_preset(2);
        c_var_instance(id, "tenna_convo", stringsetloc("Maybe a quiz#will help#you answer!!!", "obj_ch3_GSD01_slash_Step_0_gml_272_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (event_count == 1)
    {
        c_var_instance(id, "tenna_convo", stringsetloc("PHEW!#WHAT a#challenge,#folks!", "obj_ch3_GSD01_slash_Step_0_gml_309_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_sel(te);
        c_tenna_sprite(spr_tenna_point_droop);
        c_var_instance(id, "tenna_convo", stringsetloc("Now,#is it me or#does everyone#look a little#SLEEPY!?", "obj_ch3_GSD01_slash_Step_0_gml_313_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_laugh_pose_teeth);
        c_var_instance(id, "quiz_chase", true);
        c_var_instance(id, "tenna_convo", stringsetloc("C'mon, SUSIE!#What happened#to our late-night#TV marathon!?", "obj_ch3_GSD01_slash_Step_0_gml_317_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_preset(2);
        c_var_instance(id, "tenna_convo", stringsetloc("Let's wake up#those noggins#with a little#QUIZ!!!", "obj_ch3_GSD01_slash_Step_0_gml_323_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (event_count == 2)
    {
        c_var_instance(id, "tenna_convo", stringsetloc("Hey, so,#uh...#what the#HECK was that?", "obj_ch3_GSD01_slash_Step_0_gml_392_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_sel(te);
        c_tenna_sprite(spr_tenna_laugh_pose_teeth);
        c_var_instance(id, "tenna_convo", stringsetloc("Haha,#I'm with#YOU guys!#That was WEIRD!", "obj_ch3_GSD01_slash_Step_0_gml_399_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_point_up_b);
        c_var_instance(id, "quiz_chase", true);
        c_var_instance(id, "tenna_convo", stringsetloc("Let's get#back to normal!", "obj_ch3_GSD01_slash_Step_0_gml_407_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (event_count == 3)
    {
        c_tenna_sprite(spr_tenna_point_up_b);
        c_var_instance(id, "tenna_convo", stringsetloc("How did you#like my \"MARATHON!?\"#Hahaha!!", "obj_ch3_GSD01_slash_Step_0_gml_414_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "tenna_convo", stringsetloc("......#.....", "obj_ch3_GSD01_slash_Step_0_gml_418_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_laugh_pose_alt);
        c_var_instance(id, "tenna_convo", stringsetloc("Well don't#everyone say#what they think#at once!!!#Hahaha!", "obj_ch3_GSD01_slash_Step_0_gml_424_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "quiz_chase", true);
        c_tenna_sprite(spr_tenna_pose_podium);
        c_imageindex(1);
        c_var_instance(id, "tenna_convo", stringsetloc("Just kidding.#You WILL.", "obj_ch3_GSD01_slash_Step_0_gml_433_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    c_var_instance(id, "quiz_chase_catch", true);
    c_wait_if(lava_screen, "event_caught", "=", true);
    c_var_instance(id, "board_song_mode", "pause");
    c_var_instance(id, "quiz_start", true);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (con == 13 && customcon == 1 && !i_ex(obj_quizsequence))
{
    con = 14;
    customcon = 0;
    if (global.interact == 0)
        global.interact = 1;
    with (obj_ch3_GSC07_podiums)
        mode = 0;
    with (lava_screen)
        set_tenna(0);
    c_waitcustom_end();
    if (battle_count == 0)
    {
        c_sel(su);
        c_sprite(spr_susie_trapped_despondent);
        c_var_instance(id, "susie_punch", false);
        c_sel(ra);
        c_sprite(spr_ralsei_trapped_despondent);
    }
    if (battle_count == 1)
    {
        c_tenna_preset(0);
        c_sel(te);
        c_sprite(spr_tenna_sad_turned_a);
    }
    c_var_instance(id, "board_song_mode", "resume");
    c_var_instance(lava_screen, "runner_active", false);
    c_var_instance(id, "tenna_move", true);
    c_var_instance(id, "heal_check", true);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (con == 15 && customcon == 1 && !d_ex())
{
    con = 16;
    customcon = 0;
    c_var_instance(id, "board_song_mode", "resume");
    with (lava_screen)
        set_tenna(1);
    c_waitcustom_end();
    if (battle_count == 0)
    {
        c_tenna_sprite(spr_tenna_hooray_armsup);
        var heal_text = healed_previous ? stringsetloc(" earlier", "obj_ch3_GSD01_slash_Step_0_gml_422_0") : "";
        c_var_instance(id, "tenna_convo", stringsetsubloc("Wasn't#that quiz~1#just oodles of#fun, folks!?", heal_text, "obj_ch3_GSD01_slash_Step_0_gml_321_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "tenna_convo", stringsetloc("Just look at#that Fun-o-meter!!!#Haha!!!", "obj_ch3_GSD01_slash_Step_0_gml_428_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_lerp_to_instance(funometer, "x", (camerax() + 530) - 9, 12, 2, "out");
        c_snd_play(snd_wing);
        c_sel(te);
        c_tenna_preset(-1);
        c_tenna_sprite(spr_tenna_twirl);
        c_imagespeed(0.4);
        c_var_lerp_to_instance(te_actor, "x", camerax() + 423, 15, 3, "out");
        c_sel(te);
        c_delaycmd(16, "sprite", spr_tenna_laugh_pose_teeth);
        c_delaycmd(16, "imagespeed", 0);
        c_wait(60);
        c_var_instance(id, "battle_chase", true);
        c_wait(30);
        c_var_lerp_to_instance(funometer, "x", camerax() + view_wport[0] + 80, 12, 2, "out");
        c_snd_play(snd_wing);
        c_tenna_preset(-1);
        c_tenna_sprite(spr_tenna_twirl);
        c_imagespeed(0.4);
        c_var_lerp_to_instance(te_actor, "x", camerax() + 493, 15, 3, "out");
        c_sel(te);
        c_delaycmd(16, "sprite", spr_tenna_point_up_b);
        c_delaycmd(16, "imagespeed", 0);
        c_wait(16);
        c_var_instance(id, "tenna_convo", stringsetloc("I wonder#what's next?!#Looks like#a battle!", "obj_ch3_GSD01_slash_Step_0_gml_440_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (battle_count == 1)
    {
        c_sel(te);
        c_sprite(spr_tenna_sad_turned_a);
        c_var_instance(id, "tenna_convo", stringsetloc("I'm sorry.#I'm sorry#about the pipes.", "obj_ch3_GSD01_slash_Step_0_gml_454_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "tenna_convo", stringsetloc("I knew.#I KNEW#I shouldn't#have done it.", "obj_ch3_GSD01_slash_Step_0_gml_458_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_sad_turned_b);
        c_var_instance(id, "tenna_convo", stringsetloc("But you know,#every pipe goes#SOMEWHERE!#They had to go#SOMEWHERE!!!", "obj_ch3_GSD01_slash_Step_0_gml_462_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_sad);
        c_var_instance(id, "tenna_convo", stringsetloc("Wait, no.#Not another battle.#Please...", "obj_ch3_GSD01_slash_Step_0_gml_466_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "battle_chase", true);
        c_wait(30);
        c_tenna_sprite(spr_tenna_pose_headlowered_nose);
        c_var_instance(id, "tenna_convo", stringsetloc("The family's#fighting again.", "obj_ch3_GSD01_slash_Step_0_gml_475_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (battle_count == 2)
    {
        c_tenna_preset(0);
        c_tenna_sprite(spr_tenna_pose_podium);
        c_imageindex(1);
        c_var_instance(id, "tenna_convo", stringsetloc("AhhHHHH,#that was SO...#Normal!", "obj_ch3_GSD01_slash_Step_0_gml_609_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_point_up);
        c_var_instance(id, "tenna_convo", stringsetloc("MIKE!!!#How about we#ONLY have quizzes#from now on?", "obj_ch3_GSD01_slash_Step_0_gml_615_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "battle_chase", true);
        c_wait(30);
        c_tenna_sprite(spr_tenna_point_up_b);
        c_var_instance(id, "tenna_convo", stringsetloc("Or... uh,#we could have#a battle!#Great. GREAT.", "obj_ch3_GSD01_slash_Step_0_gml_625_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_tie_adjust_c);
        c_var_instance(id, "tenna_convo", stringsetloc("Love it#when you#listen to me, Mike.#Love it.", "obj_ch3_GSD01_slash_Step_0_gml_631_0_b"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (battle_count == 3)
    {
        c_tenna_preset(0);
        c_tenna_sprite(spr_tenna_pose_podium);
        c_imageindex(1);
        c_var_instance(id, "tenna_convo", stringsetloc("That battle earlier#was SO great...", "obj_ch3_GSD01_slash_Step_0_gml_640_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_point_up);
        c_var_instance(id, "tenna_convo", stringsetloc("Why don't we#do a RERUN!?", "obj_ch3_GSD01_slash_Step_0_gml_646_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_point_left);
        c_var_instance(id, "tenna_convo", stringsetloc("JUST like you#used to love,#Kris!", "obj_ch3_GSD01_slash_Step_0_gml_652_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_hooray_armsup);
        c_var_instance(id, "tenna_convo", stringsetloc("Saturday Morning Flavor!#Cartoon commercials!", "obj_ch3_GSD01_slash_Step_0_gml_658_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_dance_cabbage);
        c_imagespeed(1);
        c_var_instance(id, "tenna_convo", stringsetloc("Fresh from the Juice,#Fresh from the Juice!", "obj_ch3_GSD01_slash_Step_0_gml_665_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_point_up);
        c_imagespeed(0);
        c_var_instance(id, "battle_chase", true);
        c_var_instance(id, "tenna_convo", stringsetloc("Make sure you#don't get it#on your shoese!", "obj_ch3_GSD01_slash_Step_0_gml_674_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_hooray_armsup);
        c_var_instance(id, "tenna_convo", stringsetloc("Anyone#remember#THAT jingle!?#Haha!", "obj_ch3_GSD01_slash_Step_0_gml_680_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (battle_count == 4)
    {
        c_tenna_sprite(spr_tenna_hooray_armsup);
        c_var_instance(id, "tenna_convo", stringsetloc("Hey.#Anyone remember#that old jingle?", "obj_ch3_GSD01_slash_Step_0_gml_687_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_dance_cabbage);
        c_imagespeed(1);
        c_var_instance(id, "tenna_convo", stringsetloc("\"Fresh from the juice!\"#Haha! Anyone?", "obj_ch3_GSD01_slash_Step_0_gml_694_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_imagespeed(0);
        c_var_instance(id, "tenna_convo", stringsetloc("... Anyone?", "obj_ch3_GSD01_slash_Step_0_gml_700_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_pose_headraised_nose);
        c_var_instance(id, "battle_chase", true);
        c_var_instance(id, "tenna_convo", stringsetloc("...", "obj_ch3_GSD01_slash_Step_0_gml_708_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_pose_headlowered_nose);
        c_var_instance(id, "tenna_convo", stringsetloc("\"I love TV.\"#SAY IT.", "obj_ch3_GSD01_slash_Step_0_gml_714_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else
    {
        c_var_instance(id, "battle_chase", true);
        c_tenna_sprite(spr_tenna_laugh_pose_teeth);
        c_var_instance(id, "tenna_convo", stringsetloc("Haha!!#MORE RERUNS!!#MORE!!!!!!!", "obj_ch3_GSD01_slash_Step_0_gml_361_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    c_var_instance(id, "battle_chase_catch", true);
    c_wait_if(lava_screen, "event_caught", "=", true);
    c_var_instance(id, "board_song_mode", "pause");
    c_var_lerp_instance(te_actor, "x", te_actor.x, 800, 15, 3, "out");
    c_wait(16);
    c_var_instance(id, "battle_start", true);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (con == 22 && !d_ex() && customcon == 1)
{
    var max_event_count = (scr_flag_get(1219) == 0) ? 2 : 3;
    con = (event_count < max_event_count) ? 29 : 14;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "board_song_mode", "resume");
    c_var_instance(id, "tenna_idle", true);
    if ((battle_count == 2 && event_count == 1) || event_count == 1)
        c_tenna_sprite(spr_tenna_sad_turned_a);
    c_var_lerp_to_instance(te_actor, "x", 493, 15, -1, "out");
    c_wait(16);
    c_var_instance(id, "tenna_move", true);
    c_var_instance(id, "heal_check", true);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (tenna_idle)
{
    tenna_idle = false;
    with (lava_screen)
        set_tenna(0);
}
if (tenna_move)
{
    tenna_move = false;
    with (lava_screen)
        set_tenna(1);
}
if (tenna_pause)
{
    tenna_move = false;
    with (lava_screen)
        set_tenna(3);
}
if (heal_check && customcon == 1 && !d_ex())
{
    heal_check = false;
    customcon = 0;
    alarm[0] = 30;
    healed_previous = false;
    c_waitcustom_end();
    var need_heal = false;
    for (var i = 0; i < 3; i++)
    {
        if (global.hp[global.char[i]] < (global.maxhp[global.char[i]] / 2))
        {
            need_heal = true;
            break;
        }
    }
    if (need_heal)
    {
        healed_previous = true;
        c_var_instance(id, "spawn_heal", true);
        c_wait(30);
        c_tenna_preset(0);
        if ((battle_count == 2 && event_count == 1) || event_count == 1)
        {
            c_tenna_preset(0);
            c_tenna_sprite(spr_tenna_sad_turned_a);
            c_var_instance(id, "tenna_convo", stringsetloc("Oh...#a healing spot...", "obj_ch3_GSD01_slash_Step_0_gml_601_0"));
            c_wait(convo_wait_time);
            c_wait_if(id, "convo_active", "=", false);
        }
        else if (heal_count == 0)
        {
            heal_count++;
            c_var_instance(id, "susie_punch", false);
            if (event_count >= 1)
            {
                c_sel(su);
                c_sprite(spr_susie_trapped_lean);
                c_sel(ra);
                c_sprite(spr_ralsei_trapped_lean_01);
            }
            else
            {
                c_sel(su);
                c_sprite(spr_susie_trapped_despondent);
                c_sel(ra);
                c_sprite(spr_ralsei_trapped_despondent);
            }
            c_tenna_sprite(spr_tenna_pose_podium);
            c_imageindex(1);
            c_var_instance(id, "tenna_convo", stringsetloc("Wow!#A healing spot!#That way,#everyone can#keep playing!", "obj_ch3_GSD01_slash_Step_0_gml_459_0"));
            c_wait(convo_wait_time);
            c_wait_if(id, "convo_active", "=", false);
        }
        else
        {
            c_tenna_sprite(spr_tenna_pose_podium);
            c_imageindex(1);
            c_var_instance(id, "tenna_convo", stringsetloc("Here comes#a healing spring!", "obj_ch3_GSD01_slash_Step_0_gml_464_0"));
            c_wait(convo_wait_time);
            c_wait_if(id, "convo_active", "=", false);
        }
        c_var_instance(id, "activate_heal", true);
        c_wait(30);
        c_wait_if(lava_screen, "heal_active", "=", false);
    }
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 31;
    alarm[0] = 30;
    customcon = 0;
    c_waitcustom_end();
    if (event_count == 0)
    {
        c_tenna_preset(12);
        var heal_text = healed_previous ? stringsetloc(" earlier", "obj_ch3_GSD01_slash_Step_0_gml_631_0") : "";
        c_var_instance(id, "tenna_convo", stringsetsubloc("PHEW!#That battle~1#was a WORKOUT!!", heal_text, "obj_ch3_GSD01_slash_Step_0_gml_633_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_wait(15);
        c_tenna_preset(0);
        c_tenna_sprite(spr_tenna_pose);
        c_var_instance(id, "tenna_convo", stringsetloc("Let's never#fight again!#We're a HAPPY family,#aren't we, Kris!?", "obj_ch3_GSD01_slash_Step_0_gml_639_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_wait(15);
        c_tenna_sprite(spr_tenna_pose_podium);
        c_var_instance(id, "tenna_convo", stringsetloc("... Kris?", "obj_ch3_GSD01_slash_Step_0_gml_645_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "spawn_challenge", true);
        c_wait(15);
        c_tenna_sprite(spr_tenna_laugh_pose_teeth);
        c_var_instance(id, "tenna_convo", stringsetloc("HEY! LOOK!#Behind this door#lies another#PHYSICAL CHALLENGE!!!", "obj_ch3_GSD01_slash_Step_0_gml_496_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_wait(15);
        c_tenna_preset(2);
        c_var_instance(id, "tenna_convo", stringsetloc("GET READY,#FOLKS!!!", "obj_ch3_GSD01_slash_Step_0_gml_497_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (event_count == 1)
    {
        c_var_instance(id, "tenna_convo", stringsetloc("I know.#I know what#you need.", "obj_ch3_GSD01_slash_Step_0_gml_667_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "tenna_convo", stringsetloc("To get#your minds#off of this.#And your eyes#back on me.", "obj_ch3_GSD01_slash_Step_0_gml_671_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "spawn_challenge", true);
        c_wait(30);
        c_tenna_sprite(spr_tenna_sad_turned_b);
        c_var_instance(id, "tenna_convo", stringsetloc("A LITTLE#MUSIC!!!", "obj_ch3_GSD01_slash_Step_0_gml_675_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_dance_cane);
        c_sel(te);
        c_imagespeed(1);
        c_var_instance(id, "tenna_convo", stringsetloc("That's right!!#SHOW tunes!!#KRIS on the PIANO!!#You LOVE it,#don't ya, folks!?", "obj_ch3_GSD01_slash_Step_0_gml_679_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    else if (event_count == 2)
    {
        c_tenna_preset(18);
        c_var_instance(id, "tenna_convo", stringsetloc("Hey,#what's with those#GLOOBY faces!?", "obj_ch3_GSD01_slash_Step_0_gml_983_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_preset(0);
        c_var_instance(te_actor, "reversal", 0);
        c_tenna_sprite(spr_tenna_evil);
        c_var_instance(id, "tenna_convo", stringsetloc("WAKE UP!#It's a#MONSTER MOooOVIE#marathon!", "obj_ch3_GSD01_slash_Step_0_gml_991_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_var_instance(id, "spawn_challenge", true);
        c_tenna_sprite(spr_tenna_point_up_b);
        c_var_instance(id, "tenna_convo", stringsetloc("So stay up.", "obj_ch3_GSD01_slash_Step_0_gml_999_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
        c_tenna_sprite(spr_tenna_point_at_screen);
        c_var_instance(id, "tenna_convo", stringsetloc("And get. In.", "obj_ch3_GSD01_slash_Step_0_gml_1005_0"));
        c_wait(convo_wait_time);
        c_wait_if(id, "convo_active", "=", false);
    }
    c_var_instance(id, "activate_challenge", true);
    c_wait_if(lava_screen, "challenge_started", "=", true);
    c_wait(15);
    c_var_instance(id, "board_song_mode", "pause");
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (con == 32 && customcon == 1 && !d_ex())
{
    con = 99;
    if (i_ex(obj_ch3_screen_wipe))
    {
        with (obj_ch3_screen_wipe)
            instance_destroy();
    }
    room_persistent = true;
    var target_room = room;
    if (event_count == 0)
        target_room = room_dw_chef_empty;
    else if (event_count == 1)
        target_room = room_dw_rhythm_empty;
    else if (event_count == 2)
        target_room = room_dw_susiezilla_empty;
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.target_room = target_room;
    screen_wipe.start = true;
    scr_delay_var("con", 34, 10);
    exit;
}
if (con == 34 && customcon == 1)
{
    con = 11;
    customcon = 0;
    room_persistent = false;
    global.interact = 1;
    event_count++;
    with (lava_screen)
        set_tenna(0);
    c_waitcustom_end();
    c_var_instance(id, "board_song_mode", "resume");
    c_var_instance(lava_screen, "door_active", false);
    if (event_count == 1)
    {
        c_sel(su);
        c_sprite(spr_susie_trapped_lean);
        c_addxy(8, 0);
        c_sel(ra);
        c_sprite(spr_ralsei_trapped_lean_01);
    }
    if (event_count == 2)
    {
        c_tenna_sprite(spr_tenna_shocked);
        c_sel(ra);
        c_sprite(spr_ralsei_trapped_lean_02);
    }
    c_wait(15);
    c_var_instance(id, "loop_start", true);
    c_var_instance(id, "customcon", 1);
    c_waitcustom();
}
if (quiz_chase)
{
    quiz_chase = false;
    with (lava_screen)
        event_chase("quiz");
}
if (quiz_chase_catch)
{
    quiz_chase_catch = false;
    with (lava_screen)
        event_catch();
}
if (quiz_start)
{
    quiz_start = false;
    con = 13;
    var _quiz = scr_quizsetup_full(1, 15 + event_count, true, lava_screen.depth - 100);
    _quiz.depth = lava_screen.depth - 100;
    _quiz.newdepth = 90000;
    with (obj_ch3_GSC07_podiums)
        scr_delay_var("mode", 1, 55);
    scr_var_delay("customcon", 1, 55);
}
if (battle_chase)
{
    battle_chase = false;
    with (lava_screen)
        event_chase("battle");
}
if (battle_chase_catch)
{
    battle_chase_catch = false;
    with (lava_screen)
        event_catch();
}
if (battle_start && !d_ex() && customcon == 1)
{
    battle_start = false;
    battle_active = true;
    if (battle_count > 0)
        current_encounterno = 134;
    if (scr_flag_get(1086) == 1 || battle_count > 2)
        current_encounterno = 135;
    create_battle(current_encounterno);
}
if (battle_active && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        with (lava_screen)
            runner_active = false;
        with (lava_screen)
            set_tenna(0);
        battle_active = false;
        con = 19;
        alarm[0] = 30;
        snd_volume(global.batmusic[1], 0, 25);
    }
}
if (con == 20)
{
    con = 21;
    alarm[0] = 30;
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    with (obj_actor)
        visible = 1;
    var won_battle = false;
    if (i_ex(obj_tenna_board4_enemy))
        won_battle = obj_tenna_board4_enemy.battleresult;
    if (won_battle && scr_flag_get(1086) == 0 && current_encounterno == 134)
        scr_flag_set(1086, 1);
    if (i_ex(obj_monsterparent))
    {
        with (obj_monsterparent)
            instance_destroy();
    }
    if (i_ex(obj_bulletparent))
    {
        with (obj_bulletparent)
            instance_destroy();
    }
    if (i_ex(obj_heroparent))
    {
        with (obj_heroparent)
            instance_destroy();
    }
    if (i_ex(obj_battlecontroller))
        instance_destroy(obj_battlecontroller);
}
if (spawn_heal)
{
    spawn_heal = false;
    with (lava_screen)
        spawn_heal_spot();
}
if (activate_heal)
{
    activate_heal = false;
    with (lava_screen)
        heal_activate = true;
    scr_delay_var("heal_party", true, 15);
}
if (heal_party)
{
    heal_party = false;
    snd_play(snd_power);
    scr_healall(999);
    with (obj_ch3_GSC07_gacha)
    {
        healanim = instance_create(x, y, obj_healanim);
        healanim.target = actor_target;
        var healamt = instance_create(actor_target.x, actor_target.y, obj_dmgwriter);
        with (healamt)
        {
            type = 3;
            specialmessage = 3;
        }
    }
}
if (spawn_challenge)
{
    spawn_challenge = false;
    with (lava_screen)
        spawn_physical_challenge();
}
if (activate_challenge)
{
    activate_challenge = false;
    with (lava_screen)
        challenge_activate = true;
}
if (set_lava)
{
    set_lava = false;
    lava_screen = instance_create(0, 0, obj_dw_gameshow_screen_lava);
    lava_screen.depth = 610000;
    with (lava_screen)
        star_transition();
    with (gameshow_screen)
        instance_destroy();
}
if (lava_start)
{
    lava_start = false;
    with (lava_screen)
        set_tenna(1);
}
if (board_song_mode != board_song_mode_current)
{
    board_song_mode_current = board_song_mode;
    set_board_song(board_song_mode);
}
if (susie_punch)
{
    susie_punch_timer++;
    if (susie_punch_timer == 8)
    {
        with (su_actor)
        {
            sprite_index = spr_susie_trapped_punch;
            image_index = 0;
            image_speed = 0.5;
        }
    }
    if (susie_punch_timer > 8)
    {
        if (susie_punch_timer == 12)
        {
            with (su_actor)
                scr_shakeobj();
        }
        if (susie_punch_sound && susie_punch_timer == 14)
            snd_play_x(snd_impact, 0.45, 0.8);
        if (susie_punch_timer == 16)
        {
            susie_punch_timer = 0;
            su_actor.image_speed = 0;
        }
    }
}
if (set_gacha)
{
    set_gacha = false;
    var kris_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    kris_gacha.actor_target = kr_actor;
    kris_gacha.mode = 1;
    kris_gacha.depth = 97100;
    with (kris_gacha)
        catch_character();
    var susie_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    susie_gacha.actor_target = su_actor;
    susie_gacha.mode = 4;
    susie_gacha.depth = 97000;
    with (susie_gacha)
        catch_character();
    var ralsei_gacha = instance_create(0, 0, obj_ch3_GSC07_gacha);
    ralsei_gacha.actor_target = ra_actor;
    ralsei_gacha.mode = 2;
    ralsei_gacha.depth = 97100;
    with (ralsei_gacha)
        catch_character();
}

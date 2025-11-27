if (global.plot >= 95)
{
    if (leave_con == 0 && obj_mainchara.y <= 220 && obj_mainchara.x >= 290 && obj_mainchara.x < 350)
        leave_con = 1;
    if (leave_con == 1)
    {
        leave_con++;
        global.interact = 1;
        obj_mainchara.y += 6;
        scr_speaker("susie");
        msgsetloc(0, "\\E1* (Dude..^1. we can't go back in there now.)/", "obj_ch4_PDC14B_slash_Step_0_gml_17_0");
        msgnextloc("\\EC* (..^1. Her mom is totally watching us through the window.)/%", "obj_ch4_PDC14B_slash_Step_0_gml_18_0");
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
    scr_getchar(2);
    scr_makecaterpillar(obj_mainchara.x + 40, obj_mainchara.y - 7, 2, 0);
    with (obj_caterpillarchara)
        visible = 0;
    asgore_npc = instance_create(355 + x_offset, 231, obj_npc_room_animated);
    asgore_npc.sprite_index = spr_asgore_eating_sit_down;
    asgore_npc.image_speed = 0.25;
    asgore_npc.extflag = "asgore";
    kris_marker = scr_marker(310, 270, spr_krisd);
    kris_marker.depth = 5000;
    kris_marker.visible = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    as = actor_count + 1;
    as_actor = instance_create(asgore_npc.x, asgore_npc.y, obj_actor);
    scr_actor_setup(as, as_actor, "asgore");
    as_actor.sprite_index = asgore_npc.sprite_index;
    c_sel(as);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_var_instance(asgore_npc, "visible", 0);
    c_pannable(1);
    c_pan(160, 150, 1);
    c_sel(kr);
    c_setxy(310, 212);
    c_sel(su);
    c_setxy(265, 250);
    c_facing("susieunhappy");
    c_facing("d");
    c_wait(2);
    c_snd_play(snd_doorclose);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    c_sel(kr);
    c_walkdirect(310, 256, 30);
    c_wait(25);
    c_sel(su);
    c_facing("r");
    c_wait(5);
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border();
    });
    c_wait(30);
    c_sel(su);
    c_facing("r");
    c_sel(kr);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* Well^1, that was..^1. awkward./", "obj_ch4_PDC14B_slash_Step_0_gml_116_0");
    c_msgnextloc("\\E4* The hell was up with her mom?/%", "obj_ch4_PDC14B_slash_Step_0_gml_117_0");
    c_talk_wait();
    c_sel(su);
    c_facing("d");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Everything was going great until she stepped in./", "obj_ch4_PDC14B_slash_Step_0_gml_125_0");
    c_msgnextloc("\\ED* Then the room dropped like 5 degrees.../%", "obj_ch4_PDC14B_slash_Step_0_gml_126_0");
    c_talk_wait();
    c_sel(su);
    c_emote("!", 30);
    c_wait(30);
    c_sel(su);
    c_walkdirect_wait(286, 250, 10);
    c_autowalk(0);
    c_soundplay(snd_grab);
    c_sprite(spr_susie_kris_shake_neutral);
    c_setxy(323, 252);
    c_imagespeed(0.25);
    c_sel(kr);
    c_visible(0);
    c_sel(as);
    c_sprite(spr_asgore_eating_sit_left);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* The code^1! Kris^1, we forgot about the code!/", "obj_ch4_PDC14B_slash_Step_0_gml_152_0");
    c_msgnextloc("\\Ec* Damn^1, it's all her fault!/%", "obj_ch4_PDC14B_slash_Step_0_gml_153_0");
    c_talk_wait();
    c_wait(15);
    c_sel(as);
    c_halt();
    c_sprite(spr_asgore_housekeeper_snacktray_down);
    c_soundplay(snd_wing);
    c_wait(30);
    c_sprite(spr_asgore_housekeeper_snacktray_left);
    c_imagespeed(0.25);
    c_walkdirect_wait(311, 232, 10);
    c_halt();
    c_wait(5);
    c_sprite(spr_asgore_snacktray_pat);
    c_imagespeed(0.25);
    c_sel(su);
    c_halt();
    c_speaker("asgore");
    c_msgsetloc(0, "\\E5* There there./", "obj_ch4_PDC14B_slash_Step_0_gml_176_0");
    c_msgnextloc("\\E0* Don't worry too hard about things./", "obj_ch4_PDC14B_slash_Step_0_gml_177_0");
    c_msgnextloc("\\E6* Carol is lovely once you get to know her./", "obj_ch4_PDC14B_slash_Step_0_gml_178_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* Uh..^1. yeah. I bet./%", "obj_ch4_PDC14B_slash_Step_0_gml_180_0");
    c_talk_wait();
    c_wait(60);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E0* .../", "obj_ch4_PDC14B_slash_Step_0_gml_189_0");
    c_msgnextloc("\\E5* So what are you two up to now?/", "obj_ch4_PDC14B_slash_Step_0_gml_190_0");
    c_facenext("susie", "0");
    c_msgnextloc("\\E0* Umm^1, we were probably.../%", "obj_ch4_PDC14B_slash_Step_0_gml_192_0");
    c_talk();
    c_wait_box(1);
    c_sel(as);
    c_imagespeed(0);
    c_sprite(spr_asgore_snacktray_pat_eyes_open);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_kris_shake_neutral_look_back);
    c_wait_talk();
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_kris_shake_neutral);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Gonna go back to Kris's house./", "obj_ch4_PDC14B_slash_Step_0_gml_214_0");
    c_facenext("asgore", 5);
    c_msgnextloc("\\E5* Ahh^1, I see^1! Home is where the heart is!/%", "obj_ch4_PDC14B_slash_Step_0_gml_216_0");
    c_talk_wait();
    c_wait(30);
    c_sel(as);
    c_sprite(spr_asgore_housekeeper_snacktray_left);
    c_imagespeed(0.25);
    c_walkdirect_wait(355 + x_offset, 231, 15);
    c_halt();
    c_wait(15);
    c_sprite(spr_asgore_housekeeper_snacktray_down);
    c_wait(70);
    c_wait(15);
    c_sprite(spr_asgore_housekeeper_snacktray_left);
    c_addxy(-6, 0);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E4* May I offer either of you two a cheesed cracker?/", "obj_ch4_PDC14B_slash_Step_0_gml_240_0");
    c_facenext("susie", 0);
    c_msgnextloc("\\E0* .../%", "obj_ch4_PDC14B_slash_Step_0_gml_242_0");
    c_talk_wait();
    c_sel(su);
    c_facing("r");
    c_sel(kr);
    c_visible(1);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. y'know what^1, sure./%", "obj_ch4_PDC14B_slash_Step_0_gml_254_0");
    c_talk_wait();
    c_sel(as);
    c_sprite(spr_asgore_housekeeper_snacktray_down);
    c_addxy(6, 0);
    c_wait(15);
    c_sprite(spr_asgore_walk_down_housekeeper);
    c_var_instance(platter_marker, "visible", 1);
    c_soundplay(snd_noise);
    c_wait(5);
    c_sel(as);
    c_imagespeed(0.25);
    c_walk_wait("u", 4, 5);
    c_var_instance(platter_marker, "depth", 97070);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(337, 250, 15);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_susie_wheelbarrow);
    c_shakeobj();
    c_soundplay(snd_grab);
    c_sel(su);
    c_visible(0);
    c_wait(30);
    c_sel(kr);
    c_imagespeed(0.2);
    c_sprite(spr_kris_susie_wheelbarrow_walk);
    c_var_instance(id, "random_shake", true);
    c_wait(4);
    c_script_instance(id, snd_play, 12, snd_chomp);
    c_wait(11);
    c_sprite(spr_kris_susie_wheelbarrow_particles);
    c_var_lerp_to_instance(id, "vaccuum_pos_x", 345 + x_offset, 15);
    c_var_lerp_instance(id, "vaccuum_pos_y", 256, 265, 15);
    c_wait(30);
    c_var_instance(platter_marker, "image_index", 1);
    c_wait(30);
    c_var_lerp_to_instance(id, "vaccuum_pos_x", 325, 15);
    c_var_instance(platter_marker, "image_index", 2);
    c_wait(30);
    c_var_lerp_to_instance(id, "vaccuum_pos_x", 345 + x_offset, 15);
    c_var_instance(platter_marker, "image_index", 3);
    c_wait(30);
    c_var_instance(platter_marker, "image_index", 4);
    c_sprite(spr_kris_susie_wheelbarrow_walk);
    c_var_lerp_to_instance(id, "vaccuum_pos_x", 310, 15);
    c_var_lerp_instance(id, "vaccuum_pos_y", 265, 256, 15);
    c_wait(11);
    c_script_instance_stop(id, snd_play);
    c_wait(4);
    c_var_instance(id, "random_shake", false);
    c_soundplay(snd_noise);
    c_sel(kr);
    c_halt();
    c_autowalk(1);
    c_facing("d");
    c_setxy(310, 256);
    c_sel(su);
    c_visible(1);
    c_facing("susielighteyes");
    c_facing("d");
    c_wait(30);
    c_msgside("bottom");
    c_speaker("asgore");
    c_msgsetloc(0, "\\E5* Delicious^1, aren't they^1, Kris?/", "obj_ch4_PDC14B_slash_Step_0_gml_353_0");
    c_facenext("susie", 7);
    c_msgnextloc("\\E7* Yeah^1, actually^1! Thanks!/", "obj_ch4_PDC14B_slash_Step_0_gml_355_0");
    c_facenext("asgore", 5);
    c_msgnextloc("\\E5* Tata for now^1! Have a great day^1, Kris!/%", "obj_ch4_PDC14B_slash_Step_0_gml_357_0");
    c_talk_wait();
    c_sel(kr);
    c_walkdirect(310, 270, 30);
    c_wait(10);
    c_sel(su);
    c_walkdirect_wait(307, 252, 20);
    c_facing("d");
    c_sel(kr);
    c_facing("d");
    c_var_instance(asgore_npc, "image_index", 0);
    c_var_instance(asgore_npc, "sprite_index", spr_asgore_walk_down_housekeeper);
    c_var_instance(asgore_npc, "image_speed", 0);
    c_var_instance(asgore_npc, "x", 355 + x_offset);
    c_var_instance(asgore_npc, "y", 211);
    c_var_instance(asgore_npc, "visible", 1);
    c_pan(161, 167, 30);
    c_var_instance(kris_marker, "visible", 1);
    c_wait(31);
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
    global.plot = 95;
    with (kris_marker)
        instance_destroy();
    with (obj_ch4_PDC14B_snacktray)
        con = 1;
    con = 20;
}
if (random_shake)
{
    shake_timer++;
    if (shake_timer >= 2)
    {
        shake_timer = 0;
        kr_actor.x = vaccuum_pos_x + choose(-4, -1, 1, 4);
        kr_actor.y = vaccuum_pos_y + choose(-4, -2, 2, 4);
    }
}
if (con == 20)
{
    if (obj_mainchara.x >= 880 && global.interact == 0)
    {
        con = 21;
        global.interact = 1;
    }
}
if (con == 21)
{
    con = 22;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_facing("u");
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Hey..^1. Hey Kris./", "obj_ch4_PDC14B_slash_Step_0_gml_445_0");
    c_msgnextloc("\\ED* I didn't want to say it near your dad^1, but.../", "obj_ch4_PDC14B_slash_Step_0_gml_446_0");
    c_msgnextloc("\\EV* I saw it./", "obj_ch4_PDC14B_slash_Step_0_gml_447_0");
    c_msgnextloc("\\EV* I saw it^1, in the guitar./", "obj_ch4_PDC14B_slash_Step_0_gml_448_0");
    c_msgnextloc("\\EV* There was..^1. a code^1, for the Shelter./", "obj_ch4_PDC14B_slash_Step_0_gml_449_0");
    c_msgnextloc("\\EV* ..^1. Didn't get to write it down^1, but.../", "obj_ch4_PDC14B_slash_Step_0_gml_450_0");
    c_msgnextloc("\\Eb* Damn it^1! We were so close to something./", "obj_ch4_PDC14B_slash_Step_0_gml_451_0");
    c_msgnextloc("\\EV* ..^1. Guess we just gotta..^1. try again tomorrow./%", "obj_ch4_PDC14B_slash_Step_0_gml_452_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_head_down);
    c_wait_box(4);
    c_sel(su);
    c_facing("u");
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_head_down);
    c_wait_talk();
    c_sel(su);
    c_facing("r");
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 22 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.interact = 0;
}
if (con == 50)
{
    con = 51;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
    with (platter_marker)
        clean_up();
    scr_getchar(2);
    scr_makecaterpillar(obj_mainchara.x + 40, obj_mainchara.y - 7, 2, 0);
    with (obj_caterpillarchara)
        visible = 0;
    kris_marker = scr_marker(310, 256, spr_krisd);
    kris_marker.depth = 5000;
    kris_marker.visible = 0;
}
if (con == 52)
{
    con = 53;
    customcon = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var y_offset = -10;
    as = actor_count + 1;
    as_actor = instance_create(312, 297 + y_offset, obj_actor);
    scr_actor_setup(as, as_actor, "asgore");
    as_actor.sprite_index = spr_asgored;
    c_sel(as);
    c_facing("u");
    c_pannable(1);
    c_pan(161, 143, 1);
    c_sel(kr);
    c_setxy(310, 212);
    c_sel(su);
    c_setxy(279, 314 + y_offset);
    c_facing("susieunhappy");
    c_facing("u");
    c_wait(2);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    c_sel(kr);
    c_walkdirect_wait(310, 256 + y_offset, 30);
    c_wait(30);
    c_msgside("top");
    c_speaker("asgore");
    c_msgsetloc(0, "\\E0* Kris^1! How are you doing...?/", "obj_ch4_PDC14B_slash_Step_0_gml_490_0");
    c_msgnextloc("\\E2* .../", "obj_ch4_PDC14B_slash_Step_0_gml_491_0");
    c_msgnextloc("\\E3* ..^1. Kris^1, if you aren't feeling your best.../", "obj_ch4_PDC14B_slash_Step_0_gml_492_0");
    c_msgnextloc("\\E2* Perhaps you should just..^1. go straight home and rest./", "obj_ch4_PDC14B_slash_Step_0_gml_493_0");
    c_msgnextloc("\\E1* Here./%", "obj_ch4_PDC14B_slash_Step_0_gml_494_0");
    c_talk_wait();
    c_sel(as);
    c_walkdirect_wait(296, 253, 15);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E0* I borrowed some sweets and made you a hot chocolate./", "obj_ch4_PDC14B_slash_Step_0_gml_503_0");
    c_msgnextloc("\\E3* It's your favorite. Marshmallows^1, melted candy bars.../", "obj_ch4_PDC14B_slash_Step_0_gml_504_0");
    c_msgnextloc("\\E6* And a little pinch of cinnamon spice./", "obj_ch4_PDC14B_slash_Step_0_gml_505_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* (You got the Hot Chocolate.)/%", "obj_ch4_PDC14B_slash_Step_0_gml_507_0");
    c_talk();
    c_wait_box(4);
    c_snd_play(snd_item);
    c_wait_talk();
    c_sel(as);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(296, 270 + y_offset, 15);
    c_halt();
    c_wait(30);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E1* See you around^1, Kris./%", "obj_ch4_PDC14B_slash_Step_0_gml_530_0");
    c_talk_wait();
    c_wait(15);
    c_sel(as);
    c_autowalk(1);
    c_facing("l");
    c_wait(6);
    c_facing("d");
    c_wait(15);
    c_walkdirect(296, 400, 60);
    c_wait(10);
    c_sel(su);
    c_facing("r");
    c_wait(5);
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_wait(60);
    c_sel(su);
    c_facing("r");
    c_wait(6);
    c_facing("u");
    c_wait(30);
    c_sel(su);
    c_walkdirect(279, 250 + y_offset, 30);
    c_delayfacing(31, "r");
    c_wait(15);
    c_sel(kr);
    c_facing("l");
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* ..^1. Guess we can go./%", "obj_ch4_PDC14B_slash_Step_0_gml_579_0");
    c_talk_wait();
    c_wait(31);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border();
    });
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 53 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 95;
    scr_litemget(1);
    scr_flag_set(1527, 1);
    with (kris_marker)
        instance_destroy();
    con = 60;
    with (obj_event_manager)
        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_18);
}
if (con == 60 && obj_mainchara.x >= 800)
{
    con = 61;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sprite(spr_susie_head_down_right);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* So hey. While you were keeping Noelle busy.../", "obj_ch4_PDC14B_slash_Step_0_gml_633_0");
    c_msgnextloc("\\EK* I looked inside that room next door./", "obj_ch4_PDC14B_slash_Step_0_gml_634_0");
    c_msgnextloc("\\ED* There..^1. was this weird guitar in there./", "obj_ch4_PDC14B_slash_Step_0_gml_635_0");
    c_msgnextloc("\\E0* And on the inside of it.../", "obj_ch4_PDC14B_slash_Step_0_gml_636_0");
    c_msgnextloc("\\E2* There was..^1. a code to the Shelter!/", "obj_ch4_PDC14B_slash_Step_0_gml_637_0");
    c_msgnextloc("\\EC* ..^1. didn't get to write it down though./", "obj_ch4_PDC14B_slash_Step_0_gml_638_0");
    c_msgnextloc("\\E0* When I went to the living room with it.../", "obj_ch4_PDC14B_slash_Step_0_gml_639_0");
    c_msgnextloc("\\EK* ..^1. Your dad caught me and started talking to me.../", "obj_ch4_PDC14B_slash_Step_0_gml_640_0");
    c_msgnextloc("\\EC* Until^1, ugh^1, Noelle's mom showed up^1, SUPER PISSED./", "obj_ch4_PDC14B_slash_Step_0_gml_641_0");
    c_msgnextloc("\\ED* ..^1. great. The hell are we gonna go back there now?/%", "obj_ch4_PDC14B_slash_Step_0_gml_642_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("r");
    c_wait_box(2);
    c_sprite(spr_susie_head_down_right);
    c_wait_box(3);
    c_facing("r");
    c_wait_box(4);
    c_walk("r", 2, 4);
    c_wait_box(5);
    c_sprite(spr_susie_head_down_right);
    c_wait_box(6);
    c_facing("r");
    c_wait_box(7);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch);
    c_imagespeed(0.2);
    c_addxy(-2, -2);
    c_wait_box(8);
    c_autowalk(1);
    c_facing("l");
    c_halt();
    c_addxy(2, 2);
    c_wait_box(9);
    c_sprite(spr_susie_head_down_left);
    c_wait_talk();
    c_sel(su);
    c_facing("d");
    c_wait(6);
    c_facing("r");
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 61 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.interact = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_18 = 18
}

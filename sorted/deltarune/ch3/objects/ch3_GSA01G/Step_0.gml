if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 1;
}
if (con == 1)
{
    customcon = 0;
    con = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = 3;
    te_actor = instance_create((camerax() + 532) - 8, cameray() + 276, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_point_up;
    te_actor.preset = 0;
    te2 = 4;
    te_actor2 = instance_create(camerax() + 280, cameray() - 400, obj_actor_tenna);
    scr_actor_setup(te2, te_actor2, "tenna2");
    te_actor2.sprite_index = spr_tenna_dance_cane;
    te_actor2.preset = 1;
    su_actor.x = 158;
    su_actor.y = 184;
    ra_actor.x = 92;
    ra_actor.y = 198;
    kr_actor.x = 24;
    kr_actor.y = 218;
    c_sel(su);
    c_facing("r");
    c_sprite(spr_susie_sheeh);
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_sprite(spr_ralsei_surprised_down);
    global.facing = 0;
    c_sel(te);
    snd_free_all();
}
if (con == 2 || scr_cutscene_loaded())
{
    con = 3;
    c_wait((textfade + tennafade) - 6);
    c_tenna_preset(2);
    c_var_instance(id, "muscon", 0.5);
    c_wait(30);
    scr_funnytext_init(0, 0, -16, scr_84_get_sprite("spr_funnytext_lovely"), 0, 0);
    scr_funnytext_init(1, 0, 0, scr_84_get_sprite("spr_funnytext_stars"), 0, 0);
    c_var_instance(id, "confetti_time", 40.1);
    c_speaker("tenna");
    c_tenna_preset(2);
    c_msgsetloc(0, "* What \\O0 contestants we've got TODAY^1, folks---!!!/", "obj_ch3_GSA01G_slash_Step_0_gml_93_0");
    c_facenext("ralsei", 21);
    c_msgnextloc("\\EL* Con..^1. Contestants?/", "obj_ch3_GSA01G_slash_Step_0_gml_95_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* YES!!^1! You three are the&\\O1 of today's SHOW!!!/%", "obj_ch3_GSA01G_slash_Step_0_gml_98_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_wait_box(4);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_left);
    c_wait_box(5);
    c_tenna_preset(0);
    c_var_instance(id, "tenna_snap", true);
    c_wait(20);
    c_sel(te);
    c_sprite(spr_tenna_snap);
    c_imageindex(4);
    c_var_instance(id, "border_switch", true);
    c_var_lerp_instance(bgleft, "x", bgleft.x, -320, 24, 1, "out");
    c_var_lerp_instance(bgright, "x", bgright.x, 640, 24, 1, "out");
    c_var_instance(id, "muscon", 1);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_behind);
    c_sel(su);
    c_sprite(spr_susie_shocked_behind);
    c_sel(kr);
    c_facing("u");
    c_wait(24);
    c_var_instance(mystery_sign, "banner_drop", true);
    c_wait(10);
    c_sel(kr);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(te);
    c_tenna_preset(1);
    c_speaker("tenna");
    c_msgsetloc(0, "* Mr. Tenna's Marvelous Mystery Board.../%", "obj_ch3_GSA01G_slash_Step_0_gml_153_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_var_instance(mystery_sign, "sign_drop", true);
    c_wait(6);
    c_shake();
    c_soundplay(snd_impact);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_behind);
    c_sel(su);
    c_sprite(spr_susie_shocked_behind);
    c_wait(7);
    var tv_time_sprite = (global.lang == "ja") ? 4245 : 2843;
    scr_funnytext_init(2, -10, -10, tv_time_sprite, 0, 0);
    c_sel(te);
    c_speaker("tenna");
    c_msgsetloc(0, "* \\O2!!!/%", "obj_ch3_GSA01G_slash_Step_0_gml_175_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_down);
    c_sel(su);
    c_facing("susieunhappy");
    c_sprite(spr_susie_sheeh);
    c_sel(te);
    c_var_instance(audience_cheer, "audience_active", true);
    c_var_instance(audience_cheer, "audience_show", true);
    c_tenna_preset(6);
    c_var_instance(te_actor, "image_speed", 0.25);
    c_var_instance(id, "rosecon", 1);
    c_wait(90);
    c_sel(ra);
    c_facing("r");
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EF* Wh..^1. what!?/%", "obj_ch3_GSA01G_slash_Step_0_gml_199_0");
    c_talk_wait();
    c_msgsetloc(0, "\\EH* What the hell are you doing!?/%", "obj_ch3_GSA01G_slash_Step_0_gml_201_0");
    c_sel(su);
    c_sprite(spr_susie_exasperated);
    c_shakeobj(su);
    c_talk_wait();
    c_sel(te);
    c_var_instance(id, "rosecon", 3);
    c_var_instance(te_actor, "image_speed", 0);
    c_var_instance(te_actor, "reversal", 0);
    c_tenna_preset(2);
    c_wait(1);
    c_tenna_sprite(spr_tenna_point_left);
    c_soundplay(snd_whip_crack_only);
    c_speaker("tenna");
    c_msgsetloc(0, "* What am \\cYI\\cW doing? You should be wondering what \\cYYOU'RE\\cW doing!/", "obj_ch3_GSA01G_slash_Step_0_gml_219_0");
    c_msgnextloc("* You're about to play the greatest game of YOUR life!/%", "obj_ch3_GSA01G_slash_Step_0_gml_220_0");
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_var_lerp_add("x", -14, 7, 2, "out");
    c_talk_wait();
    c_facing("r");
    c_walkto_actor(su_actor, 10, 0, 10);
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_soundplay(snd_splat);
    var y_offset = (global.lang == "ja") ? -20 : -10;
    scr_funnytext_init(3, 0, y_offset, scr_84_get_sprite("spr_funnytext_physical_challenges"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Answer CRAZY QUESTIONS!^1! Pass&\\O3.../%", "obj_ch3_GSA01G_slash_Step_0_gml_241_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_point_up);
    scr_funnytext_init(4, 0, -14, scr_84_get_sprite("spr_funnytext_prizes"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* And you'll all win some TV-Tastic \\O4!!!/%", "obj_ch3_GSA01G_slash_Step_0_gml_252_0");
    c_talk_wait();
    c_setxy(room_width * 10, room_width * 10);
    c_setxy_instance(tennamarker1, 370, 358);
    c_var_instance(tennamarker1, "image_angle", -15.68224);
    c_var_instance(tennamarker1, "sprite_index", spr_tenna_laugh_pose);
    c_var_instance(tennamarker1, "bounce", 1);
    c_var_instance(prize1splash, "visible", 1);
    c_var_instance(prize1object, "visible", 1);
    c_var_lerp_to_instance(prize1object, "image_index", 1, 20);
    c_snd_play_x(snd_badexplosion, 0.2, 1.5);
    c_snd_play_x(snd_coin, 0.5, 1);
    c_speaker("tenna");
    c_msgsetloc(0, "\\s0* FLORAL COWBOY BATH CURTAINS!!! %%", "obj_ch3_GSA01G_slash_Step_0_gml_273_0");
    c_talk_wait();
    c_var_instance(prize2splash, "visible", 1);
    c_var_instance(prize2object, "visible", 1);
    c_var_lerp_to_instance(prize2object, "image_index", 1, 20);
    c_setxy_instance(tennamarker1, 360, -40);
    c_var_instance(tennamarker1, "image_angle", 157.7185);
    c_var_instance(tennamarker1, "sprite_index", spr_tenna_pose);
    c_var_instance(tennamarker1, "bounce", 1);
    c_snd_play_x(snd_badexplosion, 0.2, 1.5);
    c_snd_play_x(snd_coin, 0.5, 1);
    c_speaker("tenna");
    c_msgsetloc(0, "\\s0* A BRAND NEW FAMILY CAR!!! %%", "obj_ch3_GSA01G_slash_Step_0_gml_286_0");
    c_talk_wait();
    c_var_instance(prize3splash, "visible", 1);
    c_var_instance(prize3object, "visible", 1);
    c_setxy_instance(tennamarker1, 440, -80);
    c_var_instance(tennamarker1, "image_angle", 162.3843);
    c_var_instance(tennamarker1, "sprite_index", spr_tenna_point_up);
    c_var_instance(tennamarker1, "bounce", 1);
    c_setxy_instance(tennamarker2, 240, 400);
    c_var_instance(tennamarker2, "image_angle", 342.3843);
    c_var_instance(tennamarker2, "sprite_index", spr_tenna_point_up);
    c_var_instance(tennamarker2, "bounce", 1);
    c_snd_play_x(snd_badexplosion, 0.2, 1.5);
    c_snd_play_x(snd_coin, 0.5, 1);
    c_speaker("tenna");
    c_msgsetloc(0, "\\s0* BIG BRO'S TALKER-BACKER!! %%", "obj_ch3_GSA01G_slash_Step_0_gml_303_0");
    c_talk_wait();
    c_var_instance(prize4splash, "visible", 1);
    c_var_instance(prize4object, "visible", 1);
    c_var_lerp_to_instance(prize4object, "image_index", 1, 20);
    c_setxy_instance(tennamarker1, 640, 80);
    c_var_instance(tennamarker1, "image_angle", 90);
    c_var_instance(tennamarker1, "sprite_index", spr_tenna_bow);
    c_var_instance(tennamarker1, "image_index", 0);
    c_var_instance(tennamarker1, "image_speed", 0);
    c_var_instance(tennamarker1, "bounce", 1);
    c_setxy_instance(tennamarker2, 1200, 1200);
    c_snd_play_x(snd_badexplosion, 0.2, 1.5);
    c_snd_play_x(snd_coin, 0.5, 1);
    c_speaker("tenna");
    c_msgsetloc(0, "\\s0* KITCHEN SINK FUR-GUARD!! %%", "obj_ch3_GSA01G_slash_Step_0_gml_319_0");
    c_talk_wait();
    c_var_instance(prize5splash, "visible", 1);
    c_var_instance(prize5object, "visible", 1);
    c_var_lerp_to_instance(prize5object, "image_index", 1, 20);
    c_setxy_instance(tennamarker1, -40, 160);
    c_var_instance(tennamarker1, "image_angle", -74.89133);
    c_var_instance(tennamarker1, "sprite_index", spr_tenna_point_up);
    c_var_instance(tennamarker1, "bounce", 1);
    c_snd_play_x(snd_badexplosion, 0.2, 1.5);
    c_snd_play_x(snd_coin, 0.5, 1);
    c_speaker("tenna");
    c_msgsetloc(0, "\\s0* CHOCOLATE CHEWY ROLL-UM'S!!! %%", "obj_ch3_GSA01G_slash_Step_0_gml_331_0");
    c_talk_wait();
    c_var_instance(prize6splash, "visible", 1);
    c_var_instance(prize6object, "visible", 1);
    c_setxy_instance(tennamarker1, 520, 360);
    c_var_instance(tennamarker1, "image_angle", 12.886);
    c_var_instance(tennamarker1, "sprite_index", spr_tenna_pose);
    c_var_instance(tennamarker1, "bounce", 1);
    c_snd_play_x(snd_badexplosion, 0.2, 1.5);
    c_snd_play_x(snd_coin, 0.5, 1);
    c_speaker("tenna");
    c_msgsetloc(0, "\\s0* A GENUINE RALSEI PLUSH!! %%", "obj_ch3_GSA01G_slash_Step_0_gml_343_0");
    c_talk_wait();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EU\\s0* Hey I didn't agree to%%", "obj_ch3_GSA01G_slash_Step_0_gml_347_0");
    c_talk_wait();
    c_var_instance(tennamarker1, "image_alpha", 0);
    c_var_instance(tennamarker2, "image_alpha", 0);
    c_sel(te);
    c_autodepth(0);
    c_depth(8000);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_setxy(320, 400);
    c_var_instance(te_actor, "xscale", 3);
    c_var_instance(te_actor, "yscale", 3);
    c_speaker("tenna");
    c_msgsetloc(0, "* AND THAT'S!/", "obj_ch3_GSA01G_slash_Step_0_gml_367_0");
    c_msgnextloc("* NOT!/", "obj_ch3_GSA01G_slash_Step_0_gml_369_0");
    c_msgnextloc("* ALL!/%", "obj_ch3_GSA01G_slash_Step_0_gml_370_0");
    c_talk();
    c_snd_play_x(snd_carhonk, 1, 2);
    c_wait_box(1);
    c_setxy(320, 450);
    var biggerer = 0.8;
    c_var_instance(te_actor, "xscale", 3 + (biggerer * 1));
    c_var_instance(te_actor, "yscale", 3 + (biggerer * 1));
    c_snd_play(snd_squeaky);
    c_wait_box(2);
    c_setxy(320, 510);
    c_var_instance(te_actor, "xscale", 3 + (biggerer * 2));
    c_var_instance(te_actor, "yscale", 3 + (biggerer * 2));
    c_snd_play(snd_badexplosion);
    c_waittalk();
    c_tenna_preset(30);
    c_snd_play_x(snd_cape_2, 1, 1);
    var _twirltime = 12;
    c_var_lerp_instance(te_actor, "image_xscale", 3 + (biggerer * 2), 2, _twirltime, 5, "out");
    c_var_lerp_instance(te_actor, "image_yscale", 3 + (biggerer * 2), 2, _twirltime, 5, "out");
    c_var_instance(te_actor, "xscale", 2);
    c_var_instance(te_actor, "yscale", 2);
    c_var_lerp_instance(te_actor, "x", 320, 500, _twirltime, 2, "in");
    c_var_lerp_instance(te_actor, "y", 400, cameray() + 278, _twirltime, 5, "out");
    c_var_instance(startile2, "desiredImageAlpha", 1);
    c_speaker("tenna");
    c_wait(_twirltime);
    c_tenna_preset(2);
    c_tenna_sprite(spr_tenna_listening);
    c_var_instance(id, "whipcrack", 1);
    c_msgsetloc(0, "* Hey Doctor Tennaville^1! What's today's prescription?/%", "obj_ch3_GSA01G_slash_Step_0_gml_419_0");
    c_talk_wait();
    c_var_lerp_instance(te_actor, "x", 450, 830, 18, 1, "out");
    c_wait(6);
    c_sel(te2);
    c_autodepth(0);
    c_depth(8000);
    c_tenna_preset(25);
    c_var_instance(te_actor2, "image_speed", 0);
    c_setxy(308, -20);
    c_var_lerp_instance(te_actor2, "y", -20, 290, 14, 2, "in");
    c_wait(14);
    c_soundplay(snd_impact);
    c_var_instance(te_actor2, "image_speed", 1);
    c_wait(8);
    c_speaker("tenna");
    y_offset = (global.lang == "ja") ? -10 : -14;
    scr_funnytext_init(5, 0, y_offset, scr_84_get_sprite("spr_funnytext_grand_prize"), 0, 0);
    c_msgsetloc(0, "* Why, it looks like a prescription for..^1. ONE&\\O5!?/%", "obj_ch3_GSA01G_slash_Step_0_gml_444_0");
    c_talk_wait();
    c_setxy_instance(gachadispenser, 320, -192);
    var falltime = 16;
    var squishdelay = 11;
    c_soundplay(snd_fall);
    c_var_lerp_instance(gachadispenser, "y", -192, 190, falltime, 2, "in");
    c_wait(squishdelay);
    c_sel(te2);
    c_var_instance(te_actor2, "drawtype", 1);
    c_var_lerp_instance(te_actor2, "image_yscale", 2, 0, falltime - squishdelay, 2, "in");
    c_wait(falltime - squishdelay);
    c_soundplay(snd_splat);
    c_shake();
    c_wait(4);
    c_sel(te2);
    c_setxy(room_width * 20, room_width * 20);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose);
    c_setxy(room_width + 120, 316);
    c_var_lerp_instance(te_actor, "x", camerax() + 640, 528, 12, 1, "out");
    c_wait(12);
    c_speaker("tenna");
    c_msgsetloc(0, "* That's right^1! Today's&\\O5 is this season's MOST popular item.../%", "obj_ch3_GSA01G_slash_Step_0_gml_486_0");
    c_talk_wait();
    c_var_instance(id, "gachadispensercon", 1);
    c_wait(24);
    c_var_instance(id, "gachadispensercon", -1);
    c_wait(2);
    c_var_lerp_to_instance(gachadispenser, "image_yscale", 2.25, 3, 5, "out");
    c_var_lerp_to_instance(gachadispenser, "image_xscale", 1.5, 3, 5, "out");
    c_wait(3);
    c_var_lerp_to_instance(gachadispenser, "image_yscale", 1.5, 3, 5, "inout");
    c_var_lerp_to_instance(gachadispenser, "image_xscale", 2.5, 3, 5, "inout");
    c_wait(3);
    c_snd_play(snd_wing);
    c_var_instance(id, "torieladcon", 1);
    c_var_instance(ball, "visible", 1);
    c_var_lerp_instance(ball, "image_xscale", 1, 2, 15, 2, "out");
    c_var_lerp_instance(ball, "image_yscale", 1, 2, 15, 2, "out");
    c_var_lerp_to_instance(gachadispenser, "image_yscale", 1.75, 3, 5, "in");
    c_var_lerp_to_instance(gachadispenser, "image_xscale", 2.25, 3, 5, "in");
    c_wait(3);
    c_var_lerp_to_instance(gachadispenser, "image_yscale", 2, 15, -2, "out");
    c_var_lerp_to_instance(gachadispenser, "image_xscale", 2, 15, -2, "out");
    c_wait(8);
    c_var_lerp_instance(ball, "y", ball.y, ball.y - 64, 30);
    c_var_lerp_instance(bgwhite, "image_alpha", 0, 1, 30);
    c_wait(30);
    c_var_instance(ball_dark, "x", ball.x);
    c_var_instance(ball_dark, "y", ball.y - 64);
    c_var_instance(ball_dark, "image_xscale", 2);
    c_var_instance(ball_dark, "image_yscale", 2);
    c_var_instance(ball_dark, "visible", 1);
    c_wait(1);
    c_var_lerp_instance(ball, "image_alpha", 1, 0, 20, 3, "out");
    c_wait(21);
    c_setxy_instance(gachadispenser, room_width * 4, room_height * 4);
    c_setxy_instance(prize1splash, room_width * 4, room_height * 4);
    c_setxy_instance(prize1object, room_width * 4, room_height * 4);
    c_setxy_instance(prize2splash, room_width * 4, room_height * 4);
    c_setxy_instance(prize2object, room_width * 4, room_height * 4);
    c_setxy_instance(prize3splash, room_width * 4, room_height * 4);
    c_setxy_instance(prize3object, room_width * 4, room_height * 4);
    c_setxy_instance(prize4splash, room_width * 4, room_height * 4);
    c_setxy_instance(prize4object, room_width * 4, room_height * 4);
    c_setxy_instance(prize5splash, room_width * 4, room_height * 4);
    c_setxy_instance(prize5object, room_width * 4, room_height * 4);
    c_setxy_instance(prize6splash, room_width * 4, room_height * 4);
    c_setxy_instance(prize6object, room_width * 4, room_height * 4);
    c_var_instance(startile2, "visible", false);
    c_setxy_instance(ball, room_width * 4, room_height * 4);
    c_wait(15);
    c_sel(te);
    c_sprite(spr_tenna_point_at_screen);
    c_setxy(320, cameray() + view_hport[0] + 680);
    c_var_instance(te_actor, "xscale", 3 + (biggerer * 2));
    c_var_instance(te_actor, "yscale", 3 + (biggerer * 2));
    c_sel(su);
    c_setxy(su_actor.x + 60, su_actor.y);
    c_sel(ra);
    c_setxy(ra_actor.x + 60, ra_actor.y);
    c_sel(kr);
    c_setxy(kr_actor.x + 60, kr_actor.y);
    c_wait(30);
    c_wait_if(id, "torieladcon", "=", 10);
    c_sel(te);
    c_autodepth(0);
    c_depth(ball_dark.depth - 10);
    c_var_lerp_to("y", 510, 15, 2, "out");
    c_wait(5);
    c_snd_play(snd_whip_crack_only);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* Hey^1, bet you wanna know what's INSIDE^1, don't ya^1, folks!?\\M1/%", "obj_ch3_GSA01G_slash_Step_0_gml_610_0");
    c_talk_wait();
    c_wait_if(id, "laugh_track_finish", "=", true);
    c_var_instance(balltop, "visible", 0);
    c_var_instance(ballbot, "visible", 0);
    c_var_instance(ball_dark, "visible", 0);
    c_snd_play(snd_jump);
    c_var_lerp_instance(bgwhite, "image_alpha", 1, 0, 15);
    c_sel(te);
    c_tenna_preset(-1);
    c_tenna_sprite(spr_tenna_twirl);
    c_imagespeed(0.4);
    c_jump(500, 276, 120, 15);
    c_var_lerp_to_instance(te_actor, "xscale", 2, 15);
    c_var_lerp_to_instance(te_actor, "yscale", 2, 15);
    c_wait(15);
    c_var_instance(bgwhite, "visible", 0);
    c_snd_play(snd_bump);
    c_sel(te);
    c_tenna_preset(2);
    scr_funnytext_init(7, 0, -10, scr_84_get_sprite("spr_funnytext_win_big"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Well^1, great news^1, CADOOS and CADETTES^1! EVERYTHING can be YOURS!/", "obj_ch3_GSA01G_slash_Step_0_gml_642_0");
    c_msgnextloc("* All you have to do is.../", "obj_ch3_GSA01G_slash_Step_0_gml_643_0");
    c_msgnextloc("\\O7/%", "obj_ch3_GSA01G_slash_Step_0_gml_644_0");
    c_talk();
    c_wait_box(1);
    c_sel(te);
    c_autodepth(1);
    c_tenna_sprite(spr_tenna_hooray);
    c_halt();
    c_wait_box(2);
    c_var_instance(id, "crowd_cheer_loop", true);
    c_var_instance(id, "confetti_time", 40);
    c_var_instance(id, "rosecon", 1);
    c_snd_play(snd_applause_single);
    c_var_instance(audience_cheer, "audience_bounce", true);
    c_tenna_sprite(spr_tenna_point_up);
    c_wait_talk();
    c_wait(60);
    c_var_instance(id, "rosecon", 3);
    c_var_instance(id, "crowd_cheer_loop", false);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_wait(30);
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_left);
    c_snd_play(snd_slidewhistle);
    c_var_lerp_instance(funometer, "x", -400, 17, 12, 2, "out");
    c_var_instance(funometer, "fun", 0.8);
    scr_funnytext_init(8, -10, -10, scr_84_get_sprite("spr_funnytext_fun_o_meter"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* WOW!!^1! I've never seen the \\O8 like THIS^1, folks!!!/", "obj_ch3_GSA01G_slash_Step_0_gml_695_0");
    c_msgnextloc("* Now don't touch that DIAL^1, because TONIGHT^1, WE are gonna have one HECK of a.../", "obj_ch3_GSA01G_slash_Step_0_gml_696_0");
    c_facenext("susie", "V");
    c_msgnextloc("\\EV* Who the hell is \"WE\"?/", "obj_ch3_GSA01G_slash_Step_0_gml_698_0");
    c_facenext("tenna", 0);
    c_msgnextloc("* Well^1, uh..^1. this is a GAME SHOW^1, and you guys are the CONTESTANTs..^1. right?/", "obj_ch3_GSA01G_slash_Step_0_gml_700_0");
    c_facenext("susie", "W");
    c_msgnextloc("\\EW* Lemme be a little clearer.../", "obj_ch3_GSA01G_slash_Step_0_gml_702_0");
    c_msgnextloc("\\EH* We aren't being on your STUPID SHOW!!/%", "obj_ch3_GSA01G_slash_Step_0_gml_703_0");
    c_talk();
    c_wait_box(1);
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down);
    c_addxy(0, 4);
    c_var_instance(mystery_sign, "is_animated", false);
    c_var_instance(id, "bg_scroll_stop", true);
    c_mus("pause");
    c_var_instance(audience_cheer, "audience_pause", true);
    c_sel(te);
    c_tenna_preset(0);
    c_wait_box(5);
    c_sel(te);
    c_tenna_sprite(spr_tenna_tie_adjust_a);
    c_wait_box(7);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_wait_box(8);
    c_var_instance(id, "muscon", 2.75);
    c_soundplay(snd_impact);
    c_shake();
    c_sel(su);
    c_sprite(spr_susie_exasperated);
    c_halt();
    c_addxy(0, -4);
    c_sel(te);
    c_sprite(spr_tenna_frightened);
    c_imageindex(1);
    c_wait_talk();
    c_sel(te);
    c_tenna_sprite(spr_tenna_hurt);
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* You..^1. you aren't?/%", "obj_ch3_GSA01G_slash_Step_0_gml_768_0_b");
    c_talk_wait();
    c_var_instance(id, "bg_darken", true);
    c_var_instance(funometer, "fun", 0.6);
    c_sel(te);
    c_tenna_preset(26);
    c_wait(30);
    c_wait(10);
    c_var_instance(audience_cheer, "audience_hide", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh. Well^1, uh..^1. that's just.../%", "obj_ch3_GSA01G_slash_Step_0_gml_790_0");
    c_talk_wait();
    c_var_instance(id, "muscon", 2);
    c_var_instance(funometer, "fun", 0.4);
    c_sel(te);
    c_autowalk(0);
    c_sprite(spr_tenna_armsup_annoyed);
    c_imagespeed(0.2);
    c_var_lerp_to_instance(te_actor, "speedscale", 0.4, 30);
    c_var_lerp_to_instance(te_actor, "image_yscale", 1.5, 15, -1, "out");
    c_var_lerp_to_instance(te_actor, "image_xscale", 1.8, 15, -1, "out");
    c_wait(5);
    c_speaker("tenna");
    c_msgsetloc(0, "* That's just hunky-doody^1, y'know^1! You do YOU^1! Meanwhile^1, I^1, uh.../%", "obj_ch3_GSA01G_slash_Step_0_gml_814_0");
    c_talk_wait();
    c_sprite(spr_tenna_sad_turned_a);
    c_var_instance(te_actor, "wobblestate", 17);
    c_var_lerp_to_instance(te_actor, "image_yscale", 1, 15, -1, "out");
    c_var_lerp_to_instance(te_actor, "image_xscale", 2.2, 15, -1, "out");
    c_var_lerp_to_instance(funometer, "image_angle", -10, 60, -2, "out");
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* Guess it'll just be..^1. me and the logo^1! Ha./%", "obj_ch3_GSA01G_slash_Step_0_gml_828_0");
    c_talk_wait();
    c_wait(15);
    c_sel(kr);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait(30);
    c_var_instance(id, "ominous_fade", true);
    c_var_instance(mystery_sign, "gray_mode", true);
    c_wait(75);
    c_var_instance(id, "ominous_stop", true);
    c_wait(60);
    c_sel(ra);
    c_facing("r");
    c_sel(kr);
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Umm^1, Susie...?/", "obj_ch3_GSA01G_slash_Step_0_gml_865_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* ..^1. what?/%", "obj_ch3_GSA01G_slash_Step_0_gml_867_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_walkdirect_wait(169, 188, 15);
    c_wait(5);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* .../", "obj_ch3_GSA01G_slash_Step_0_gml_880_0");
    c_msgnextloc("\\EQ* Susie^1, I.../", "obj_ch3_GSA01G_slash_Step_0_gml_881_0");
    c_msgnextloc("\\Ea* I know..^1. I can't go to the festival with you..^1. but.../", "obj_ch3_GSA01G_slash_Step_0_gml_882_0");
    c_msgnextloc("\\EQ* If I can^1, I still..^1. want to have fun with you and Kris./", "obj_ch3_GSA01G_slash_Step_0_gml_847_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* ..^1. Ralsei.../", "obj_ch3_GSA01G_slash_Step_0_gml_849_0");
    c_facenext("ralsei", 26);
    c_msgnextloc("\\EQ* Maybe.../", "obj_ch3_GSA01G_slash_Step_0_gml_851_0");
    c_msgnextloc("\\EK* Maybe we could just try playing this game?/", "obj_ch3_GSA01G_slash_Step_0_gml_852_0");
    c_msgnextloc("\\EJ* If we can't watch TV^1, maybe we can..^1. be on it?/%", "obj_ch3_GSA01G_slash_Step_0_gml_853_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right);
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_var_lerp_to_instance(funometer, "image_angle", -10, 60, -2, "out");
    c_wait_box(3);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_wait_box(5);
    c_sel(su);
    c_sprite(spr_susie_look_down_left);
    c_wait_box(6);
    c_sel(ra);
    c_facing("r");
    c_wait_box(8);
    c_facing("u");
    c_waittalk();
    c_sel(su);
    c_facing("u");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../%", "obj_ch3_GSA01G_slash_Step_0_gml_875_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("ralseinohat");
    c_facing("r");
    c_sel(su);
    c_wait(30);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_addxy(0, -6);
    c_imagespeed(0.2);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Alright^1, FINE. We'll give it a shot./%", "obj_ch3_GSA01G_slash_Step_0_gml_892_0");
    c_talk_wait();
    c_wait(6);
    c_sel(te);
    c_sprite(spr_tenna_sad);
    c_var_instance(te_actor, "wobblestate", 6);
    c_var_lerp_to_instance(te_actor, "image_yscale", 1.25, 15, -1, "out");
    c_var_lerp_to_instance(te_actor, "image_xscale", 2, 15, -1, "out");
    c_wait(7);
    c_sel(su);
    c_autowalk(1);
    c_facing("susiedarkeyes");
    c_facing("r");
    c_addxy(0, 6);
    c_speaker("tenna");
    c_msgsetloc(0, "* You..^1. you'll give it a shot^1? My game?/", "obj_ch3_GSA01G_slash_Step_0_gml_902_0");
    c_facenext("susie", 1);
    c_msgnextloc("\\E3* ..^1.I guess./%", "obj_ch3_GSA01G_slash_Step_0_gml_904_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_walkdirect_wait(su_actor.x + 60 + 20, su_actor.y, 15);
    c_wait_talk();
    c_saveload_l(saveload);
    c_var_instance(id, "muscon", 2.5);
    c_wait(10);
    c_var_instance(id, "muscon", 2.75);
    c_tenna_preset(27);
    c_var_lerp_to_instance(id, "tenna_shake", 6, 20);
    c_var_lerp_to_instance(te_actor, "image_yscale", 2, 29, 7, "in");
    c_var_instance(te_actor, "image_xscale", 2);
    c_wait(26);
    c_var_instance(id, "tenna_shake", -1);
    c_sel(te);
    c_imageindex(1);
    c_wait(2);
    c_imageindex(2);
    c_var_instance(id, "muscon", 3);
    c_var_lerp_to_instance(funometer, "image_angle", 0, 4);
    c_var_lerp_to_instance(funometer, "fun", 1, 20);
    c_var_instance(mystery_sign, "is_animated", true);
    c_var_instance(mystery_sign, "recovery_mode", true);
    c_tenna_preset(28);
    c_wait(1);
    c_var_instance(funometer, "funspeed", 0.1);
    c_var_instance(te_actor, "image_xscale", 2);
    c_var_instance(te_actor, "image_yscale", 2);
    c_var_instance(te_actor, "speedscale", 3);
    c_var_instance(mystery_sign, "is_animated", true);
    c_snd_play(snd_applause_single);
    c_var_instance(audience_cheer, "audience_pause", false);
    c_var_instance(audience_cheer, "audience_show", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh^1, you WILL!?!? Oh^1, you THRILL!?/%", "obj_ch3_GSA01G_slash_Step_0_gml_959_0");
    c_talk_wait();
    c_tenna_preset(5);
    c_speaker("tenna");
    c_var_instance(te_actor, "speedscale", 3);
    c_msgsetloc(0, "* Mike!^1! The lights!^1! The sounds!^1! The whatzits!^1! The doo-zits!!/", "obj_ch3_GSA01G_slash_Step_0_gml_965_0");
    c_msgnextloc("* Turn 'em all on!!/%", "obj_ch3_GSA01G_slash_Step_0_gml_966_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(te_actor, "speedscale", 5);
    c_waittalk();
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    con = 4;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(te_actor, "speedscale", 1);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_whisper);
    scr_funnytext_init(0, 0, 0, scr_84_get_sprite("spr_funnytext_coffee"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* \\O0/%", "obj_ch3_GSA01G_slash_Step_0_gml_983_0");
    c_talk();
    c_wait_box_end();
    c_soundplay(snd_laughtrack_short_bc_temp);
    c_waittalk();
    c_setxy(500, 290);
    c_tenna_preset(1);
    c_wait(1);
    c_tenna_sprite(spr_tenna_bow);
    c_var_instance(te_actor, "image_speed", 0.25);
    c_var_lerp_instance(te_actor, "x", 500, 940, 120, 1, "out");
    c_speaker("tenna");
    c_msgsetloc(0, "* Right over here^1, ladies and germs!!/%", "obj_ch3_GSA01G_slash_Step_0_gml_998_0");
    c_talk_wait();
    c_snd_play_x(snd_wing, 1, 0.5);
    c_mus2("volume", 0.5, 60);
    c_mus2("pitch", 1, 60);
    c_var_instance(curtain_marker, "depth", 6000);
    c_var_lerp_to_instance(curtain_marker, "y", 0, 30, 3, "in");
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(kr);
    c_facing("u");
    c_wait(31);
    c_waitcustom();
}
if (con == 4 && customcon == 1)
{
    con = 5;
    room_goto(room_dw_tv_curtain);
}
rosetimer++;
if (rosecon == 1)
{
    var _audience = snd_init("berdly_audience.ogg");
    cheerloop = mus_loop(_audience);
    rosecon = 2;
}
if (rosecon == 2)
{
    if ((rosetimer % 3) == 0)
    {
        rosecounter++;
        if (rosecounter == 200)
        {
            var dogchance = irandom(100);
            if (dogchance == 72)
            {
                var dog = instance_create(camerax() + 320 + irandom_range(-200, 200), cameray() + 326, obj_marker);
                dog.sprite_index = spr_dog_walk;
                scr_darksize(dog);
                dog.image_xscale = -2;
                dog.image_speed = 0;
                with (dog)
                    scr_depth();
                var waittime = irandom_range(4, 12);
                with (dog)
                    scr_jump_to_point(obj_actor_tenna.x + irandom_range(-50, 40), obj_actor_tenna.y + 14, 10 + irandom(10), 20);
                with (dog)
                    scr_script_delayed(scr_var, 20 + waittime, "hspeed", "6");
                with (dog)
                    scr_script_delayed(scr_var, 20 + waittime, "image_speed", "1");
            }
            rosecounter = 0;
        }
        var xloc = camerax() + 320 + scr_even(irandom_range(-200, 200));
        var yloc = cameray() + 366;
        var rose = instance_create(xloc, yloc, obj_tennarose);
        if (i_ex(obj_actor_tenna))
        {
            var targx = obj_actor_tenna.x + irandom_range(-100, 80);
            var targy = obj_actor_tenna.y + 10 + irandom(20);
            rose.fadein = true;
            rose.image_alpha = 0;
            rose.endx = targx;
            rose.endy = targy;
            rose.jumptime = 10 + irandom(10) + 10;
            rose.jumpspeed = 13 + irandom(5);
        }
    }
}
if (rosecon == 3)
{
    mus_fade(cheerloop, 15);
    rosecon = 0;
}
if (gachadispensercon == 1)
{
    gachatimer++;
    if (i_ex(gachadispenser))
    {
        gachadispenser.x = 320 + irandom_range(-4, 4);
        gachadispenser.y = 190 + irandom_range(-4, 4);
    }
    gachaymod = irandom_range(-4, 4);
}
if (gachadispensercon == -1)
{
    gachadispensercon = 0;
    if (i_ex(gachadispenser))
    {
        gachadispenser.x = 320;
        gachadispenser.y = 190;
    }
}
if (torielfloatcon > 0)
{
    tsin++;
    toriel.x = toriel_anchor.x;
    toriel.y = toriel_anchor.y + (sin(tsin / 8) * 10);
    if (i_ex(prize_light))
    {
        prize_light.x = toriel_anchor.x + 47;
        prize_light.y = toriel_anchor.y + 52;
    }
    if (torielfloatcon == 1)
    {
        if ((tsin % 4) == 0)
        {
            var shine = instance_create(toriel.x + 47 + irandom_range(-30, 30), toriel.y + 46, obj_afterimage);
            shine.image_speed = 0.25;
            shine.image_alpha = 2;
            shine.sprite_index = spr_shine;
            shine.visible = true;
            shine.gravity = 0.25;
            shine.depth = 7002;
            scr_darksize(shine);
        }
    }
}
if (torielfloatcon == -1)
{
    torielfloatcon = 0;
    with (obj_afterimage)
    {
        if (visible && sprite_index == spr_shine)
        {
            var _dist = point_distance(other.toriel.x + 47, other.toriel.y + 46, x, y);
            direction = lerp(direction, point_direction(other.toriel.x + 47, other.toriel.y + 46, x, y), 0.5);
            speed += remap_clamped(0, 100, 20, 0, _dist);
        }
    }
}
if (torieladcon == 1)
{
    torieladtimer++;
    if (torieladtimer == 1)
    {
        msgsetloc(0, "\\s0Encased in our patented MYSTERY BALL.../%", "obj_ch3_GSA01G_slash_Step_0_gml_1171_0");
        var writer1 = instance_create(camerax() + 50, cameray() + 50, obj_writer);
        writer1.mycolor = c_black;
        writer1.special = 0;
    }
    if (torieladtimer > 30 && !i_ex(obj_writer))
    {
        msgsetloc(0, "\\s0This Dark World's ONE AND GREATEST TREASURE!/%", "obj_ch3_GSA01G_slash_Step_0_gml_1178_0");
        var writer2 = instance_create(camerax() + 50, cameray() + 250, obj_writer);
        writer2.special = 0;
        writer2.mycolor = c_black;
        torieladcon = 2;
    }
}
if (torieladcon == 2 && !i_ex(obj_writer))
    torieladcon = 10;
if (muscon == 0.5)
{
    wind_song = mus_initloop("wind_highplace.ogg");
    snd_volume(wind_song, 0, 0);
    snd_volume(wind_song, 1, 30);
    muscon = 0;
}
if (muscon == 1)
{
    snd_stop(wind_song);
    perugina = mus_initloop("baci_perugina.ogg");
    peruginapitch = 0;
    snd_pitch(perugina, 0.01);
    snd_pitch_time(perugina, 1, 24);
    muscon = 0;
}
if (muscon == 1.5)
{
    snd_resume(perugina);
    snd_pitch_time(perugina, 0.6, 24);
    with (obj_dw_tv_starbgtile)
    {
        scr_lerpvar("xscrollspeed", xscrollspeed, -0.7, 4);
        scr_lerpvar("yscrollspeed", yscrollspeed, 0.7, 4);
        desiredImageAlpha = 0.3;
    }
    muscon = 0;
}
if (muscon == 2)
{
    snd_resume(perugina);
    snd_pitch_time(perugina, 0.3, 24);
    muscon = 0;
}
if (muscon == 2.5)
{
    mus_volume(perugina, 0, 10);
    muscon = 0;
}
if (muscon == 2.75)
{
    snd_pause(perugina);
    muscon = 0;
}
if (muscon == 3)
{
    audio_sound_gain(perugina, global.flag[16], 0);
    snd_resume(perugina);
    snd_pitch_time(perugina, 1.2, 24);
    with (obj_dw_tv_starbgtile)
    {
        scr_lerpvar("xscrollspeed", 0, -2, 4);
        scr_lerpvar("yscrollspeed", 0, 2, 4);
        desiredImageAlpha = 1;
    }
    muscon = 0;
}
if (whipcrack > 0)
{
    snd_play_pitch(snd_whip_crack_only, whipcrack);
    whipcrack = 0;
}
if (scr_debug() && keyboard_check_pressed(ord("H")))
    confetti_time = 40;
if (prize_shine < 0)
{
    instance_destroy(prize_light);
    prize_shine = 0;
}
if (prize_shine > 0)
{
    prize_light.visible = true;
    prize_light.length = 0;
    prize_light.x = toriel.x + 47;
    prize_light.y = toriel.y + 52;
    prize_shine = 0;
}
if (confetti_time < 0)
{
    var _confetti = instance_create(camerax() + 360, cameray() + 250, obj_confetti_overworld);
    _confetti.height = 260;
    confetti_time = 0;
}
if (confetti_time > 0)
{
    if ((confetti_time % 1) == 0.1)
    {
        confetti_time = floor(confetti_time);
        scr_confetti_preload(camerax() - 10, cameray() + 300, 15, floor(confetti_time / 2), 20, 200, 340, 2);
        scr_confetti_preload(camerax() + 640 + 10, cameray() + 300, 165, ceil(confetti_time / 2), 20, 200, 340, 2);
    }
    else if ((confetti_time % 1) == 0.2)
    {
        scr_confetti_fire();
    }
    else
    {
        scr_confetti_ext(camerax() - 10, cameray() + 300, 15, floor(confetti_time / 2), 20, 200, 340, 2);
        scr_confetti_ext(camerax() + 640 + 10, cameray() + 300, 165, ceil(confetti_time / 2), 20, 200, 340, 2);
    }
    confetti_time = 0;
}
if (tenna_shake > 0)
{
    if (!v_ex("shake_flip"))
        other.shake_flip = 1;
    with (te_actor)
    {
        shakex = other.tenna_shake * other.shake_flip;
        other.shake_flip *= -1;
        shakey = random_range(-other.tenna_shake, other.tenna_shake);
    }
}
if (tenna_shake == -1)
{
    tenna_shake = 0;
    with (te_actor)
        shakex = 0;
}
if (tenna_snap)
{
    tenna_snap = false;
    tenna_snap_obj = instance_create(te_actor.x, te_actor.y, obj_tenna_snap);
    tenna_snap_obj.con = 1;
    te_actor.visible = 0;
    with (te_actor)
        scr_delay_var("visible", true, 30);
    scr_doom(tenna_snap_obj, 30);
}
if (global.flag[20] == 1)
    laugh_track = true;
if (laugh_track)
{
    laugh_track_timer++;
    if (laugh_track_timer == 1)
        snd_play(snd_crowd_laughter_single);
    if (laugh_track_timer >= 90 && !d_ex())
    {
        laugh_track = false;
        laugh_track_timer = 0;
        global.flag[20] = 0;
        laugh_track_finish = true;
    }
}
if (ominous_fade)
{
    ominous_fade = false;
    ominous_track[0] = snd_init("ominous_message.ogg");
    ominous_track[1] = mus_play(ominous_track[0]);
}
if (ominous_stop)
{
    ominous_stop = false;
    snd_free(ominous_track[0]);
}
if (bg_scroll_stop)
{
    bg_scroll_stop = false;
    with (obj_dw_tv_starbgtile)
    {
        scr_lerpvar("xscrollspeed", xscrollspeed, 0, 4);
        scr_lerpvar("yscrollspeed", yscrollspeed, 0, 4);
    }
}
if (crowd_cheer_loop)
{
    ooaatimer++;
    if (ooaatimer > ooaa_max)
    {
        var snd = 453;
        var snd_pick = irandom(1);
        switch (snd_pick)
        {
            case 1:
                snd = 451;
                break;
        }
        var pitch = random_range(0.75, 1.5);
        snd_play_x(snd, 1, pitch);
        ooaatimer = 0;
        ooaa_max = irandom(140) + 30;
    }
}
if (bg_darken)
{
    bg_darken = false;
    with (obj_dw_tv_starbgtile)
        desiredImageAlpha = 0.1;
}
if (border_switch)
{
    border_switch = false;
    with (obj_border_controller)
        set_border(border_dw_blue_stars);
}

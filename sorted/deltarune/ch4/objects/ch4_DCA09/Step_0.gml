if (con < 0)
    exit;
if (con == 0 && obj_mainchara.x >= 400 && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    con = 99;
    c_mus2("volume", 0, 30);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* So^1, that^1, uh^1, piano thingy.../", "obj_ch4_DCA09_slash_Step_0_gml_27_0");
    c_msgnextloc("\\EA* ..^1. maybe the notes we gotta play are in a book?/%", "obj_ch4_DCA09_slash_Step_0_gml_28_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_wait(30);
    c_pannable(1);
    c_pan(400, cameray(), 60);
    c_sel(kr);
    var krposbookget = scr_heromarker("kris", "subookget");
    c_walkdirect_speed(krposbookget[0], krposbookget[1], 4);
    c_sel(ra);
    var raposbookget = scr_heromarker("ralsei", "subookget");
    c_walkdirect_speed(raposbookget[0], raposbookget[1], 4);
    c_sel(su);
    c_autodepth(0);
    c_depth(kr_actor.depth - 2);
    var suposbookget = scr_heromarker("susie", "subookget");
    var walkspeed = 6;
    var dist = max(round(point_distance(su_actor.x, su_actor.y, suposbookget[0], suposbookget[1]) / walkspeed), 1);
    c_walkdirect(suposbookget[0], suposbookget[1], dist);
    c_wait(dist);
    c_setxy(suposbookget[0], suposbookget[1]);
    c_facing("u");
    c_wait_if(kr_actor, "x", ">=", krposbookget[0]);
    c_sel(kr);
    c_facing("u");
    c_setxy(krposbookget[0], krposbookget[1]);
    c_wait_if(ra_actor, "x", ">=", raposbookget[0]);
    c_sel(ra);
    c_setxy(raposbookget[0], raposbookget[1]);
    c_facing("u");
    c_wait(15);
    c_sel(su);
    c_emote("...", 30);
    c_sprite(spr_susie_hand_hips);
    c_addxy(0, -4);
    c_wait(30);
    c_sel(su);
    c_flip("x");
    c_wait(30);
    c_sel(su);
    c_facing("u");
    c_flip("x");
    c_addxy(0, 4);
    c_emote("!", 30);
    c_wait(30);
    c_facing("l");
    c_sel(ra);
    c_facing("r");
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Hey guys^1! There's something weird about this one!/", "obj_ch4_DCA09_slash_Step_0_gml_131_0");
    c_msgnextloc("\\EN* It looks just like the one that the old man.../", "obj_ch4_DCA09_slash_Step_0_gml_132_0");
    c_msgnextloc("\\ED* .../%", "obj_ch4_DCA09_slash_Step_0_gml_133_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("u");
    c_wait_talk();
    c_wait(15);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_reach_up);
    if (!side_b)
    {
        c_imagespeed(0.2);
        c_wait(16);
        c_halt();
    }
    c_jump_in_place(12, 12);
    c_wait(4);
    c_sound_play(snd_grab);
    c_var_instance(book_marker, "image_blend", 0);
    c_wait(4);
    c_autowalk(1);
    c_facing("u");
    c_wait(30);
    c_sound_play(snd_locker);
    c_shake();
    c_var_instance(door_marker, "image_index", 1);
    c_facing("r");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, look^1, it did something!/%", "obj_ch4_DCA09_slash_Step_0_gml_173_0");
    c_talk_wait();
    c_wait(15);
    c_sel(kr);
    c_walkdirect(650, 190, 30);
    c_sel(ra);
    c_walkdirect(570, 178, 30);
    c_sel(su);
    c_walkdirect_speed_wait(692, 174, 6);
    c_walkdirect_speed(692, 110, 6);
    c_wait(8);
    c_var_instance(id, "susie_hide", true);
    c_wait(15);
    c_visible(0);
    c_wait(60);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E9* .../", "obj_ch4_DCA09_slash_Step_0_gml_196_0");
    c_msgnextloc("\\E0* Kris^1, rather than following her.../", "obj_ch4_DCA09_slash_Step_0_gml_197_0");
    c_msgnextloc("\\EQ* Why don't we just..^1. close our eyes.../", "obj_ch4_DCA09_slash_Step_0_gml_198_0");
    c_msgnextloc("\\EQ* And think about what she might be doing in there?/%", "obj_ch4_DCA09_slash_Step_0_gml_199_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_autowalk(0);
    c_halt();
    c_walkdirect(605, 178, 8);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(2);
    c_sel(kr);
    c_facing("l");
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_wait_box(3);
    c_sel(ra);
    c_facing("r");
    c_wait_talk();
    c_msc(1373);
    c_talk_wait();
    c_waitcustom();
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 15;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Then^1, let's close our eyes.../%", "obj_ch4_DCA09_slash_Step_0_gml_244_0");
    c_talk_wait();
    c_customfunc(function()
    {
        with (obj_border_controller)
            hide_border(0.025);
    });
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(50);
    c_sel(ra);
    c_autowalk(1);
    c_walk("l", 4, 60);
    c_wait(60);
    c_waitcustom();
}
if (con == 15 && customcon == 1)
{
    con = 60;
    if (scr_debug())
        scr_flag_set(844, 0);
    room_persistent = true;
    room_goto(room_dw_church_bellhall_curtain);
    exit;
}
if (con == 20 && customcon == 1 && !d_ex())
{
    con = 99;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_autowalk(0);
    c_walk("l", 2, 8);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(2);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* H-huh? But^1, you know^1, Susie might want to be.../", "obj_ch4_DCA09_slash_Step_0_gml_299_0");
    c_msgnextloc("\\EK* It^1, it might be nice if she had this chance to.../", "obj_ch4_DCA09_slash_Step_0_gml_300_0");
    c_msgnextloc("\\E4* .../", "obj_ch4_DCA09_slash_Step_0_gml_301_0");
    c_msgnextloc("\\EQ* Perhaps if you just closed them for a moment?/%", "obj_ch4_DCA09_slash_Step_0_gml_302_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right);
    c_wait_box(2);
    c_facing("u");
    c_wait_box(3);
    c_facing("r");
    c_walk("r", 2, 8);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(2);
    c_wait_talk();
    c_wait(5);
    c_msc(1375);
    c_talk_wait();
    c_waitcustom();
}
if (con == 30 && customcon == 1 && !d_ex())
{
    con = 99;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* .../", "obj_ch4_DCA09_slash_Step_0_gml_340_0");
    c_msgnextloc("\\EQ* Perhaps if you just^1, closed your eyes in general?/", "obj_ch4_DCA09_slash_Step_0_gml_341_0");
    c_msgnextloc("\\EQ* Maybe we could think of someone else?/%", "obj_ch4_DCA09_slash_Step_0_gml_342_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("u");
    c_wait_box(2);
    c_facing("r");
    c_wait_talk();
    c_msc(1377);
    c_talk_wait();
    c_waitcustom();
}
if (con == 35 && customcon == 1 && !d_ex())
{
    con = 70;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ee* .../", "obj_ch4_DCA09_slash_Step_0_gml_370_0");
    c_msgnextloc("\\Ee* If that's what you want^1, Kris!/%", "obj_ch4_DCA09_slash_Step_0_gml_371_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(1);
    c_setxy(695, 113);
    c_visible(1);
    c_var_instance(id, "susie_show", true);
    c_walkdirect(695, 174, 20);
    c_wait(10);
    c_customfunc(function()
    {
        snd_play(snd_doorclose);
        close_door();
    });
    c_wait(20);
    c_wait(30);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* I got the puzzle solution^1, let's just go!/%", "obj_ch4_DCA09_slash_Step_0_gml_391_0");
    c_talk_wait();
    c_wait(5);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk("l", 4, 16);
    c_delaycmd(17, "imagespeed", 0);
    c_sel(su);
    c_walkdirect_speed_wait(595, 174, 6);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_var_instance(id, "set_party", true);
    c_mus("free_all");
    c_mus2("initloop", "church_wip.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 40 && customcon == 1 && !d_ex())
{
    con = 60;
    customcon = 0;
    scr_flag_set(845, 1);
    c_waitcustom_end();
    c_customfunc(function()
    {
        with (obj_border_controller)
            hide_border(0.025);
    });
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(50);
    c_sel(ra);
    c_autowalk(1);
    c_walk("l", 4, 60);
    c_wait(90);
    c_mus2("initloop", "mus_knightthought.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You closed your eyes.)/", "obj_ch4_DCA09_slash_Step_0_gml_453_0");
    c_msgnextloc("* (The image of the Knight began to fade into your mind.)/", "obj_ch4_DCA09_slash_Step_0_gml_454_0");
    c_msgnextloc("* (The image changes..^1. the helmet begins to come off.)/", "obj_ch4_DCA09_slash_Step_0_gml_455_0");
    c_msgnextloc("* (Suddenly^1, you tried extremely hard to picture Jockington.)/", "obj_ch4_DCA09_slash_Step_0_gml_456_0");
    c_msgnextloc("* (Jockington is in a nest^1, and the soccer balls are his eggs.)/", "obj_ch4_DCA09_slash_Step_0_gml_457_0");
    c_msgnextloc("* (Temmie shows up^1, and is mad that one of the soccer balls is...)/", "obj_ch4_DCA09_slash_Step_0_gml_458_0");
    c_msgnextloc("* (...)/", "obj_ch4_DCA09_slash_Step_0_gml_459_0");
    c_msgnextloc("* (You realized you could just open your eyes.)/%", "obj_ch4_DCA09_slash_Step_0_gml_460_0");
    c_talk();
    c_wait_box(3);
    c_mus("free_all");
    c_wait_box(4);
    c_mus2("initloop", "mus_temloopshort.ogg", 0);
    c_wait_box(7);
    c_mus("free_all");
    c_wait_talk();
    c_waitcustom();
}
if (con == 50 && customcon == 1 && !d_ex())
{
    con = 51;
    customcon = 0;
    scr_flag_set(846, 1);
    c_waitcustom_end();
    c_customfunc(function()
    {
        with (obj_border_controller)
            hide_border(0.0125);
    });
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 120);
    c_wait(110);
    c_sel(ra);
    c_autowalk(1);
    c_walk("l", 4, 60);
    c_wait(120);
    c_var_instance(id, "drip_move", true);
    c_var_instance(drip_marker, "x", camerax() + (view_wport[0] / 2));
    c_var_instance(drip_marker, "y", cameray() + (view_hport[0] / 2));
    c_var_lerp_instance(drip_marker, "image_alpha", 0, 1, 300);
    c_wait(300);
    c_waitcustom();
}
if (drip_move)
{
    drip_siner++;
    drip_marker.x = camerax() + (view_wport[0] / 2) + (sin(drip_siner / 62) * 3);
    drip_marker.y = cameray() + (view_hport[0] / 2) + (cos(drip_siner / 25) * 2.4);
}
if (con == 51 && !d_ex() && customcon == 1)
{
    con = 53;
    scr_speaker("noelle");
    global.fc = 0;
    msgsetloc(0, "* Thank you.../%", "obj_ch4_DCA09_slash_Step_0_gml_525_0");
    var d = d_make();
    d.skippable = 0;
}
if (con == 53 && i_ex(obj_writer))
{
    con = 56;
    with (obj_writer)
    {
        skippable = 0;
        rate = 150;
        shake = 1;
        preventcskip = true;
        scr_var_delay("rate", 15, 150);
    }
}
if (con == 56 && i_ex(obj_writer))
{
    if (obj_writer.reachedend == 1)
        con = 58;
}
if (con == 58 && !d_ex() && customcon == 1)
{
    con = 70;
    customcon = 0;
    close_door();
    sound_play_x(snd_ominous_stab_harsh_2, 0.8, 0.5);
    scr_script_delayed(snd_stop_all, 15);
    c_waitcustom_end();
    c_var_instance(id, "susie_show", true);
    c_sel(ra);
    c_setxy(360, 178);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_dw_landed);
    c_imageindex(1);
    c_addxy(0, -4);
    c_sel(su);
    c_setxy(695, 174);
    c_visible(1);
    c_sprite(spr_susie_kneel_heal_alt);
    c_var_instance(blackall, "image_blend", 255);
    c_wait(29);
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border(1);
    });
    c_wait(1);
    c_var_instance(drip_marker, "visible", 0);
    c_var_instance(id, "drip_move", false);
    c_var_instance(blackall, "image_alpha", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* Kris^1! Hey^1, Kris^1! Y..^1. you okay!?/", "obj_ch4_DCA09_slash_Step_0_gml_588_0");
    c_msgnextloc("\\ED* You were just standing there^1, with your eyes closed.../", "obj_ch4_DCA09_slash_Step_0_gml_589_0");
    c_msgnextloc("\\E6* Then you just started..^1. breathing hard^1, and.../", "obj_ch4_DCA09_slash_Step_0_gml_590_0");
    c_msgnextloc("\\ES* Here^1, get up./%", "obj_ch4_DCA09_slash_Step_0_gml_591_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(1);
    c_facing("d");
    c_addxy(0, 4);
    c_delayfacing(75, "l");
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait(60);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_right_sad_subtle);
    c_imagespeed(0.2);
    c_walkdirect_speed_wait(541, 178, 6);
    c_halt();
    c_emote("!", 30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Ralsei^1, where the heck were you?/", "obj_ch4_DCA09_slash_Step_0_gml_619_0");
    c_facenext("ralsei", "e");
    c_msgnextloc("\\Ee* H-huh? I was..^1. um..^1. I.../", "obj_ch4_DCA09_slash_Step_0_gml_621_0");
    c_facenext("susie", "4");
    c_msgnextloc("\\E4* I got the puzzle solution^1, let's just go!/%", "obj_ch4_DCA09_slash_Step_0_gml_623_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_smile_up_right);
    c_wait_talk();
    c_wait(5);
    c_sel(su);
    c_walkdirect_speed_wait(595, 174, 6);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_var_instance(id, "set_party", true);
    c_mus("free_all");
    c_mus2("initloop", "church_wip.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 60 && customcon == 1 && !d_ex())
{
    room_persistent = false;
    con = 70;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_setxy(360, 178);
    c_sel(su);
    c_setxy(695, 113);
    c_visible(1);
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border();
    });
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_walk_down_paper);
    c_imagespeed(0.2);
    c_var_instance(id, "susie_show", true);
    c_walkdirect(695, 174, 20);
    c_wait(10);
    c_customfunc(function()
    {
        snd_play(snd_doorclose);
        close_door();
    });
    c_wait(10);
    c_halt();
    c_wait(60);
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Hey^1, I^1, uh^1, got the music copied down^1, kinda./", "obj_ch4_DCA09_slash_Step_0_gml_695_0");
    c_msgnextloc("\\EK* Might not be perfect^1, but^1, uh.../%", "obj_ch4_DCA09_slash_Step_0_gml_696_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_right_head_down);
    c_imagespeed(0.2);
    c_walkdirect_speed_wait(541, 178, 3);
    c_halt();
    c_sel(su);
    c_sprite(spr_susie_walk_down_paper_look_left);
    c_imageindex(1);
    c_sel(ra);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Ralsei^1, where the heck were you?/", "obj_ch4_DCA09_slash_Step_0_gml_715_0");
    c_facenext("ralsei", "e");
    c_msgnextloc("\\Ee* H-huh? I was..^1. um..^1. I.../", "obj_ch4_DCA09_slash_Step_0_gml_717_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* I got the puzzle solution^1, let's just go!/%", "obj_ch4_DCA09_slash_Step_0_gml_719_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_smile_up_right);
    c_wait_box(3);
    c_sel(su);
    c_imageindex(0);
    c_wait_talk();
    c_wait(5);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_speed_wait(595, 174, 6);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_var_instance(id, "set_party", true);
    c_mus("free_all");
    c_mus2("initloop", "church_wip.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 70 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 180;
    with (obj_caterpillarchara)
    {
        follow = 1;
        fun = 0;
        scr_caterpillar_interpolate();
    }
    con = 99;
    scr_tempsave();
}
if (susie_hide)
{
    susie_shadow = clamp(susie_shadow + 0.2, 0, 1);
    var shadow = susie_shadow;
    with (su_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (susie_shadow >= 1)
        susie_hide = false;
}
if (susie_show)
{
    susie_shadow = clamp(susie_shadow - 0.2, 0, 1);
    var shadow = susie_shadow;
    with (su_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (susie_shadow <= 0)
        susie_show = false;
}
if (set_party)
{
    set_party = false;
    var sus_x = su_actor.x;
    var sus_y = su_actor.y;
    var ral_x = ra_actor.x;
    var ral_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        follow = 0;
        fun = 1;
        if (name == "susie")
        {
            x = sus_x;
            y = sus_y;
        }
        else
        {
            x = ral_x;
            y = ral_y;
        }
        visible = 1;
        sprite_index = rsprite;
    }
}
if (blood_drip)
{
    blood_drip = false;
    with (drip_marker)
        setxy(camerax() + (view_wport[0] / 2), cameray() + (view_hport[0] / 2));
    drip_marker.visible = 1;
    scr_lerpvar_instance(drip_marker, "image_xscale", 0, 2, 5);
    scr_lerpvar_instance(drip_marker, "image_yscale", 0, 2, 5);
    scr_script_delayed(scr_lerpvar_instance, 8, drip_marker, "y", drip_marker.y, drip_marker.y + 10, 10);
    scr_script_delayed(scr_lerpvar_instance, 18, drip_marker, "image_alpha", 1, 0, 5);
}
if (set_text_speed)
{
    set_text_speed = false;
    scr_writer_setspeed(15);
}

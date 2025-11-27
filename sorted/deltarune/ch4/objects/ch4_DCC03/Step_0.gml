with (obj_layershader)
    colour = [1, 0, 0];
if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    su = actor_count + 1;
    su_actor = instance_create(-100, -100, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = spr_susie_arm_up;
    ra = actor_count + 2;
    ra_actor = instance_create(-100, -100, obj_actor);
    scr_actor_setup(ra, ra_actor, "ralsei");
    ra_actor.sprite_index = spr_ralsei_running_right;
    susie_blood = scr_dark_marker_fancy(4080, 395, spr_susie_blood);
    susie_blood.target = su_actor;
    with (susie_blood)
    {
        step_func = function()
        {
            image_index = target.image_index;
            depth = target.depth - 500;
        };
    }
    susie_blood.depth = su_actor.depth - 500;
    with (obj_roomglow)
        create_highlight(obj_actor);
    c_mus2("initloop", "heartbeat.ogg", 0);
    c_customfunc(function()
    {
        with (obj_hsv_shifter)
        {
            hue_start = 290;
            hue_target = 230;
            val_start = 0.8;
            val_target = 0.9;
            heartbeat_mode = true;
        }
    });
    c_pannable(1);
    c_pan(0, 720, 1);
    c_sel(su);
    c_setxy(4080, 395);
    c_sprite(spr_susie_arm_up);
    c_autowalk(0);
    c_imagespeed(0.1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_setxy(315, 907);
    c_autowalk(0);
    c_sprite(spr_ralsei_running_right);
    c_imagespeed(0.4);
    c_walkdirect(580, 907, 20);
    c_delayfacing(21, "u");
    c_delaycmd(21, "imagespeed", 0);
    c_sel(kr);
    c_setxy(300, 1230);
    c_walkdirect_wait(300, 920, 40);
    c_facing("r");
    c_pannable(1);
    c_pan(160, cameray(), 20);
    c_wait(30);
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\El* No.../%", "obj_ch4_DCC03_slash_Step_0_gml_99_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_running_right);
    c_imagespeed(0.4);
    c_walkdirect(860, 907, 20);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eg* SUSIE^1, STOP!!!/%", "obj_ch4_DCC03_slash_Step_0_gml_111_0");
    c_talk_wait();
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_sel(ra);
    c_setxy(3480, 399);
    c_sprite(spr_ralsei_surprised_right);
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    if (global.interact == 1)
    {
        con = 4;
        regain_control();
        var exit_block = instance_create(280, 1200, obj_solidblockDark);
        with (exit_block)
            image_xscale = 2;
        var exit_readable = instance_create(exit_block.x, exit_block.y, obj_readable_room1);
        with (exit_readable)
        {
            extflag = "final";
            image_xscale = 4;
        }
    }
}
if (con == 4)
{
    if (obj_mainchara.x >= 3280)
    {
        con = 5;
        lose_control();
    }
}
if (con == 5 && customcon == 1)
{
    con = 6;
    customcon = 0;
    c_waitcustom_end();
    var kr_y_pos = 410;
    var kr_x_pos = 3385;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "r");
    c_pannable(1);
    c_pan(3220, 180, 30);
    c_wait(31);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eg* SUSIE^1, DON'T LOOK--/%", "obj_ch4_DCC03_slash_Step_0_gml_175_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_subtle_right);
    c_var_instance(final_prophecy, "destroy", 1);
    c_instance(3220 + camerawidth(), su_actor.y, 524);
    c_wait(1);
    c_customfunc(function()
    {
        with (obj_hsv_shifter)
            instance_destroy();
        with (obj_layershader)
            opacity -= 0.3;
    });
    c_mus("free_all");
    c_wait(60);
    c_pan(3760, 180, 60);
    c_sel(ra);
    c_autowalk(0);
    c_autodepth(0);
    c_depth(su_actor.depth - 10);
    c_sprite(spr_ralsei_walk_right_sad_subtle);
    c_imagespeed(0.2);
    c_walkdirect(4048, 399, 60);
    c_delaycmd(61, "imagespeed", 0);
    c_sel(kr);
    c_walkdirect_wait(3840, 410, 60);
    c_wait_talk();
    c_sel(ra);
    c_imagespeed(0.2);
    c_sprite(spr_ralsei_shake_stress);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\El* S-Susie^1, I'm sorry^1, I--%%", "obj_ch4_DCC03_slash_Step_0_gml_214_0");
    c_talk_wait();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eg* I^1, I'm sorry^1, I--%%", "obj_ch4_DCC03_slash_Step_0_gml_220_0");
    c_talk_wait();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eh* I'm sorry^1, I--%%", "obj_ch4_DCC03_slash_Step_0_gml_226_0");
    c_talk_wait();
    c_sel(ra);
    c_halt();
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Shut up./%", "obj_ch4_DCC03_slash_Step_0_gml_237_0");
    c_talk_wait();
    c_sel(ra);
    c_walk("l", 2, 12);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_right_sad_subtle);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(4);
    c_imageindex(0);
    c_wait(60);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right);
    c_customfunc(function()
    {
        with (susie_blood)
            instance_destroy();
    });
    c_snd_play(snd_suslaugh);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_laugh_up);
    c_imagespeed(0.2);
    c_wait(60);
    c_mus2("initloop", "tin_night.ogg", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EW* The hell are you apologizing for?/", "obj_ch4_DCC03_slash_Step_0_gml_272_0");
    c_msgnextloc("\\EX* You're worried about THAT!? Seriously!?/%", "obj_ch4_DCC03_slash_Step_0_gml_273_0");
    c_talk_wait();
    c_var_lerp_to_instance(su_actor, "image_speed", 0, 60);
    c_wait(90);
    c_sel(su);
    c_sprite(spr_susie_laugh_look);
    c_halt();
    c_var_lerp_instance(su_actor, "image_index", 0, 6, 18);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EX* ..^1. this stupid prophecy?/%", "obj_ch4_DCC03_slash_Step_0_gml_290_0");
    c_talk_wait();
    c_snd_play(snd_suslaugh);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_laugh_up);
    c_imagespeed(0.2);
    c_wait(60);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Like something like that would happen./%", "obj_ch4_DCC03_slash_Step_0_gml_306_0");
    c_talk_wait();
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* I wouldn't let it happen..^1. Kris wouldn't let it happen.../", "obj_ch4_DCC03_slash_Step_0_gml_312_0");
    c_msgnextloc("\\EW* And obviously YOU wouldn't let it happen./", "obj_ch4_DCC03_slash_Step_0_gml_313_0");
    c_msgnextloc("\\EV* So.../%", "obj_ch4_DCC03_slash_Step_0_gml_314_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_full_turn);
    c_halt();
    c_var_lerp("image_index", 0, 6, 24);
    c_wait(40);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_sad_subtle);
    c_speaker("susie");
    c_msgsetloc(0, "\\EW* Why wouldn't you laugh?/", "obj_ch4_DCC03_slash_Step_0_gml_329_0");
    c_msgnextloc("\\EQ* It's just stupid./%", "obj_ch4_DCC03_slash_Step_0_gml_330_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_sad);
    c_wait_talk();
    c_wait(15);
    c_sel(ra);
    c_sprite(spr_ralsei_susie_lift_head_r);
    c_var_lerp_instance(ra_actor, "image_index", 0, 4, 20);
    c_sel(su);
    c_sprite(spr_ralsei_susie_lift_head_s);
    c_var_lerp_instance(su_actor, "image_index", 0, 4, 20);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* So stop crying^1, 'k?/", "obj_ch4_DCC03_slash_Step_0_gml_359_0");
    c_msgnextloc("\\E2* Everything's gonna be all right./%", "obj_ch4_DCC03_slash_Step_0_gml_360_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_sad_subtle);
    c_sel(su);
    c_facing("susiedark");
    c_facing("l");
    c_addxy(-16, 0);
    c_visible(1);
    c_wait(6);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_walk_back_arm);
    c_walkdirect_wait(su_actor.x + 24, su_actor.y, 12);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Heh./", "obj_ch4_DCC03_slash_Step_0_gml_383_0");
    c_msgnextloc("\\EQ* Hey^1, Kris./", "obj_ch4_DCC03_slash_Step_0_gml_384_0");
    c_msgnextloc("\\E2* Let's go seal the fountain^1, OK?/%", "obj_ch4_DCC03_slash_Step_0_gml_385_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_sad);
    c_wait_talk();
    c_sel(ra);
    c_delaycmd(15, "sprite", spr_ralsei_turn_right_subtle);
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect_wait(su_actor.x + 400, su_actor.y, 90);
    c_sel(kr);
    c_walkdirect_wait(3920, 410, 30);
    c_waitcustom();
}
if (con == 6 && !d_ex() && customcon == 1)
{
    con = 7;
    create_npc(ra_actor, "ralsei");
}
if (con == 7 && !d_ex() && customcon == 1)
{
    con = 8;
    customcon = 0;
    c_waitcustom_end();
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_terminatekillactors();
}
if (con == 8 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    global.plot = 270;
    scr_setparty(0, 0, 0);
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    global.interact = 1;
    scr_flag_set(1591, 1);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ra = actor_count + 1;
    ra_actor = instance_create(npc_marker.x, npc_marker.y, obj_actor);
    scr_actor_setup(ra, ra_actor, "ralsei");
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0);
    ra_actor.sprite_index = npc_marker.sprite_index;
    ra_actor.image_index = npc_marker.image_index;
    with (obj_roomglow)
        create_highlight(obj_actor);
    remove_npc();
    c_sel(kr);
    if (kr_actor.x > 4075 && kr_actor.y < 410)
    {
        c_walkdirect_wait(kr_actor.x, 420, 12);
        c_walkdirect_wait(ra_actor.x - 60, 420, 20);
    }
    c_pannable(1);
    c_pan(3700, 180, 15);
    c_walkdirect_wait(ra_actor.x - 50, 410, 15);
    c_facing("r");
    c_sel(ra);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Susie.../", "obj_ch4_DCC03_slash_Step_0_gml_497_0");
    c_msgnextloc("* ..^1. she's.../", "obj_ch4_DCC03_slash_Step_0_gml_498_0");
    c_msgnextloc("* She's a really really nice person^1, Kris./", "obj_ch4_DCC03_slash_Step_0_gml_499_0");
    c_msgnextloc("* How can she be so kind...?/", "obj_ch4_DCC03_slash_Step_0_gml_500_0");
    c_msgnextloc("* ..^1. how?/%", "obj_ch4_DCC03_slash_Step_0_gml_501_0");
    c_talk();
    c_wait_talk();
    c_wait(60);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "* I'm sorry^1, Kris./", "obj_ch4_DCC03_slash_Step_0_gml_523_0");
    c_msgnextloc("* I'm sorry I didn't say the whole prophecy at first./", "obj_ch4_DCC03_slash_Step_0_gml_524_0");
    c_msgnextloc("* I just/", "obj_ch4_DCC03_slash_Step_0_gml_525_0");
    c_msgnextloc("* I thought if I said something different/", "obj_ch4_DCC03_slash_Step_0_gml_526_0");
    c_msgnextloc("* If we did something different/", "obj_ch4_DCC03_slash_Step_0_gml_527_0");
    c_msgnextloc("* If we were just kind enough/", "obj_ch4_DCC03_slash_Step_0_gml_528_0");
    c_msgnextloc("* Perhaps by the time we got here..^1. it would change./", "obj_ch4_DCC03_slash_Step_0_gml_529_0");
    c_msgnextloc("* But..^1. but no matter what we do.../%", "obj_ch4_DCC03_slash_Step_0_gml_530_0");
    c_talk();
    c_wait_talk();
    c_wait(15);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_lift_head);
    c_imageindex(0);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ef* Our fate..^1./%", "obj_ch4_DCC03_slash_Step_0_gml_556_0");
    c_talk_wait();
    c_wait(15);
    c_imageindex(3);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ee* ..^1. is already decided./%", "obj_ch4_DCC03_slash_Step_0_gml_564_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_kneel_start);
    c_halt();
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(ra_actor, "image_index", 3, 12);
    c_wait(12);
    c_shakeobj();
    c_wait(30);
    c_sprite(spr_ralsei_kneel_cry);
    c_halt();
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "* ..^1./", "obj_ch4_DCC03_slash_Step_0_gml_585_0");
    c_msgnextloc("* S-sorry..^1. don't look at me..^1. I.../", "obj_ch4_DCC03_slash_Step_0_gml_586_0");
    c_msgnextloc("* I don't mean to always.../", "obj_ch4_DCC03_slash_Step_0_gml_587_0");
    c_msgnextloc("* Make everything about me.../", "obj_ch4_DCC03_slash_Step_0_gml_588_0");
    c_msgnextloc("* I'm sorry. I.../%", "obj_ch4_DCC03_slash_Step_0_gml_589_0");
    c_talk();
    c_wait_box(1);
    c_imagespeed(0.1);
    c_wait_box(3);
    c_halt();
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe);
    c_imagespeed(0.1);
    c_wait(30);
    c_halt();
    c_sprite(spr_ralsei_face_wipe_post);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Everything's OK^1, Kris. Look^1, I.../", "obj_ch4_DCC03_slash_Step_0_gml_609_0");
    c_msgnextloc("\\EP* I'm smiling!/%", "obj_ch4_DCC03_slash_Step_0_gml_610_0");
    c_talk_wait();
    c_wait(30);
    c_msc(1393);
    c_talk_wait();
    c_waitcustom();
}
if (con == 15 && !d_ex() && customcon == 1)
{
    con = 30;
    customcon = 0;
    scr_flag_set(875, 1);
    c_waitcustom_end();
    c_var_instance(kris_head_marker, "x", kr_actor.x + 14);
    c_var_instance(kris_head_marker, "y", kr_actor.y);
    c_var_instance(kris_head_marker, "depth", ra_actor.depth - 10);
    with (obj_roomglow)
        create_highlight(other.kris_head_marker, true, false);
    c_sel(kr);
    c_walkdirect_wait(kr_actor.x + 14, kr_actor.y, 15);
    c_wait(20);
    c_autowalk(0);
    c_sprite(spr_kris_kneel_start);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 0, 6, 20);
    c_var_instance(kris_head_marker, "visible", 1);
    c_var_lerp_instance(kris_head_marker, "image_index", 0, 6, 20);
    c_wait(26);
    c_sprite(spr_kris_kneel_hand_raise);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 0, 4, 20);
    c_wait(50);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EO* K..^1. Kris? Kris^1, you.../", "obj_ch4_DCC03_slash_Step_0_gml_659_0");
    c_msgnextloc("\\Ea* Haha.../%", "obj_ch4_DCC03_slash_Step_0_gml_660_0");
    c_talk_wait();
    c_wait(60);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post_sad);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\En* I..^1. I'm scared.../", "obj_ch4_DCC03_slash_Step_0_gml_671_0");
    c_msgnextloc("\\Em* It's getting harder and harder/", "obj_ch4_DCC03_slash_Step_0_gml_672_0");
    c_msgnextloc("\\Ee* To just stand there smiling all the time./", "obj_ch4_DCC03_slash_Step_0_gml_673_0");
    c_msgnextloc("\\Ef* To be the one/", "obj_ch4_DCC03_slash_Step_0_gml_674_0");
    c_msgnextloc("\\Em* Pretending I'm not afraid^1, too./", "obj_ch4_DCC03_slash_Step_0_gml_675_0");
    c_msgnextloc("\\Ef* But/", "obj_ch4_DCC03_slash_Step_0_gml_676_0");
    c_msgnextloc("\\Ec* I/", "obj_ch4_DCC03_slash_Step_0_gml_677_0");
    c_msgnextloc("\\EQ* Being with you two.../", "obj_ch4_DCC03_slash_Step_0_gml_678_0");
    c_msgnextloc("\\En* I.../", "obj_ch4_DCC03_slash_Step_0_gml_679_0");
    c_msgnextloc("\\EQ* The more I'm with you two^1, I realize.../", "obj_ch4_DCC03_slash_Step_0_gml_680_0");
    c_msgnextloc("\\Ee* Friendship..^1. isn't just.../", "obj_ch4_DCC03_slash_Step_0_gml_681_0");
    c_msgnextloc("\\Em* About being happy all the time./", "obj_ch4_DCC03_slash_Step_0_gml_682_0");
    c_msgnextloc("\\En* It's something far^1, far greater than I could've imagined.../", "obj_ch4_DCC03_slash_Step_0_gml_683_0");
    c_msgnextloc("\\En* .../%", "obj_ch4_DCC03_slash_Step_0_gml_684_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post);
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post_sad);
    c_wait_box(6);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post);
    c_wait_box(8);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post_sad);
    c_wait_box(9);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post);
    c_wait_box(11);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post_sad);
    c_wait_box(13);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post);
    c_wait_talk();
    c_wait(30);
    if (!scr_sideb_active())
    {
        c_sel(ra);
        c_sprite(spr_ralsei_face_wipe_post);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\En* I..^1. I want to. I want to believe again./", "obj_ch4_DCC03_slash_Step_0_gml_725_0");
        c_msgnextloc("\\Ep* I want to believe..^1. it can change!/", "obj_ch4_DCC03_slash_Step_0_gml_726_0");
        c_msgnextloc("\\Eo* That there isn't just one ending!/", "obj_ch4_DCC03_slash_Step_0_gml_727_0");
        c_msgnextloc("\\En* Susie's hope..^1. Her naive hope.../", "obj_ch4_DCC03_slash_Step_0_gml_728_0");
        c_msgnextloc("\\EQ* It's..^1. infectious^1, isn't it^1, Kris?/", "obj_ch4_DCC03_slash_Step_0_gml_729_0");
        c_msgnextloc("\\En* ..^1. So^1, until we see fate with our own eyes.../", "obj_ch4_DCC03_slash_Step_0_gml_730_0");
        c_msgnextloc("\\EQ* Let's believe^1, too./%", "obj_ch4_DCC03_slash_Step_0_gml_731_0");
        c_talk();
        c_wait_box(3);
        c_sel(ra);
        c_sprite(spr_ralsei_face_wipe_post_sad);
        c_wait_box(6);
        c_sel(ra);
        c_sprite(spr_ralsei_face_wipe_post);
        c_wait_talk();
    }
    else
    {
        c_sel(ra);
        c_sprite(spr_ralsei_face_wipe_post);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\En* I..^1. I want to. I want to believe again./", "obj_ch4_DCC03_slash_Step_0_gml_749_0");
        c_msgnextloc("\\Eq* I want to believe..^1. it can change!/", "obj_ch4_DCC03_slash_Step_0_gml_750_0");
        c_msgnextloc("\\Eo* That there isn't just one ending!/", "obj_ch4_DCC03_slash_Step_0_gml_751_0");
        c_msgnextloc("\\Em* But.../", "obj_ch4_DCC03_slash_Step_0_gml_752_0");
        c_msgnextloc("\\EQ* What would that be...?/", "obj_ch4_DCC03_slash_Step_0_gml_753_0");
        c_msgnextloc("\\Ee* If there was something else^1, what would it be...?/", "obj_ch4_DCC03_slash_Step_0_gml_754_0");
        c_msgnextloc("\\Ef* And how do we know/", "obj_ch4_DCC03_slash_Step_0_gml_755_0");
        c_msgnextloc("\\El* It wouldn't be something even worse?/", "obj_ch4_DCC03_slash_Step_0_gml_756_0");
        c_msgnextloc("\\Ef* .../", "obj_ch4_DCC03_slash_Step_0_gml_757_0");
        c_msgnextloc("\\Ea* ..^1. Kris.../", "obj_ch4_DCC03_slash_Step_0_gml_758_0");
        c_msgnextloc("\\Ee* Nevermind. I'll see you tomorrow^1, okay?/%", "obj_ch4_DCC03_slash_Step_0_gml_759_0");
        c_talk();
        c_wait_box(3);
        c_sel(ra);
        c_sprite(spr_ralsei_face_wipe_post_sad);
        c_wait_box(6);
        c_sel(ra);
        c_sprite(spr_ralsei_face_wipe_post);
        c_wait_talk();
    }
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_kris_kneel_hand_down);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 0, 4, 20);
    c_wait(30);
    c_sprite(spr_kris_kneel_stand);
    c_halt();
    c_var_lerp_instance(kr_actor, "image_index", 0, 5, 20);
    c_var_instance(kris_head_marker, "sprite_index", spr_kris_kneel_stand_head);
    c_var_lerp_instance(kris_head_marker, "image_index", 0, 5, 20);
    c_wait(30);
    c_imagespeed(0.2);
    c_sprite(spr_krisr_dark);
    c_autodepth(0);
    c_depth(ra_actor.depth - 10);
    c_var_instance(kris_head_marker, "visible", 0);
    c_walkdirect_wait(kr_actor.x, kr_actor.y, 15);
    c_halt();
    c_sel(ra);
    c_sprite(spr_ralsei_kneel_stand);
    c_halt();
    c_var_lerp_instance(ra_actor, "image_index", 0, 4, 16);
    c_wait(20);
    c_sprite(spr_ralsei_lift_head_post);
    c_halt();
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* ..^1. Kris^1, you can go to the fountain now./", "obj_ch4_DCC03_slash_Step_0_gml_808_0");
    c_msgnextloc("\\EQ* Susie's waiting./%", "obj_ch4_DCC03_slash_Step_0_gml_809_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("u");
    c_halt();
    c_waitcustom();
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = 30;
    customcon = 0;
    scr_flag_set(875, 2);
    c_waitcustom_end();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Of..^1. of course^1! You can count on me!/", "obj_ch4_DCC03_slash_Step_0_gml_832_0");
    c_msgnextloc("\\Ej* I'll..^1. make sure we.../", "obj_ch4_DCC03_slash_Step_0_gml_833_0");
    c_msgnextloc("\\Ej* ..^1. have a wonderful adventure tomorrow!/", "obj_ch4_DCC03_slash_Step_0_gml_834_0");
    c_msgnextloc("\\Ej* The next day^1, too.../", "obj_ch4_DCC03_slash_Step_0_gml_835_0");
    c_msgnextloc("\\Ej* After all^1, that's what you want^1, isn't it?/", "obj_ch4_DCC03_slash_Step_0_gml_836_0");
    c_msgnextloc("\\Ej*  .../%", "obj_ch4_DCC03_slash_Step_0_gml_837_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_face_wipe_post);
    c_halt();
    c_wait_talk();
    c_sel(ra);
    c_facing("u");
    c_waitcustom();
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 40;
    customcon = 0;
    global.facing = 0;
    create_npc(ra_actor, "ralsei_okay");
    c_waitcustom_end();
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    with (obj_floorshadow)
    {
        if (target == other.npc_marker)
        {
            ignorepreset = true;
            yoff = -12;
        }
    }
}
if (con == 40 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    if (scr_flag_get(875) == 1)
        con = 45;
}
if (con == 45)
{
    if (obj_mainchara.x >= 4310 && global.interact == 0)
    {
        con = 46;
        global.interact = 1;
        with (npc_marker)
            sprite_index = spr_ralsei_walk_right_head_down;
        scr_speaker("ralsei");
        msgsetloc(0, "\\E0* Umm..^1. Kris?/", "obj_ch4_DCC03_slash_Step_0_gml_910_0");
        msgnextloc("\\EI* You were/%", "obj_ch4_DCC03_slash_Step_0_gml_911_0");
        var d = d_make();
        d.stay = 5;
    }
}
if (con == 46 && !d_ex())
{
    con = 47;
    with (npc_marker)
        sprite_index = spr_ralsei_walk_right_smile;
    scr_speaker("ralsei");
    msgsetloc(0, "\\EQ* You were cool when you played the piano earlier!/%", "obj_ch4_DCC03_slash_Step_0_gml_927_0");
    d_make();
}
if (con == 47 && !d_ex())
{
    con = 50;
    with (npc_marker)
        sprite_index = spr_ralsei_walk_up;
}
if (con == 48 && !d_ex())
{
    con = 49;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (It seems the way is blocked.)/", "obj_ch4_DCC03_slash_Step_0_gml_949_0");
    msgnextloc("* (You put out your hand...)/", "obj_ch4_DCC03_slash_Step_0_gml_950_0");
    msgnextloc("* (And^1, just out of view^1, just perfectly out of view^1,/", "obj_ch4_DCC03_slash_Step_0_gml_951_0");
    msgnextloc("* Another hand pressed against yours/", "obj_ch4_DCC03_slash_Step_0_gml_952_0");
    msgnextloc("* And pushed you back.)/%", "obj_ch4_DCC03_slash_Step_0_gml_953_0");
    d_make();
}
if (con == 49 && !d_ex())
{
    con = 50;
    snd_play_x(snd_guitar_hit_03, 0, 1);
    scr_flag_set(1634, 1);
}
if (con == 50 && !d_ex())
{
    con = -1;
    global.interact = 0;
}

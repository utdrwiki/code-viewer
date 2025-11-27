if (con < 0)
    exit;
if (con == 1 && obj_mainchara.x < 18)
{
    con = 2;
    global.interact = 1;
    obj_mainchara.x = 18;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    scr_speaker("susie");
    msgsetloc(0, "\\E0* (Tenna looks busy...)/%", "obj_room_interstitial_slash_Step_0_gml_15_0");
    var d = d_make();
    d.side = 0;
}
if (con == 2 && !d_ex())
{
    con = 1;
    global.interact = 0;
    global.facing = 0;
}
if (con == 10 && !d_ex())
{
    con = 11;
    alarm[0] = 1;
    global.interact = 1;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(493, cameray() - 200, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_hooray_armsup;
    tenna = te_actor;
    global.facing = 0;
    c_var_lerp_instance(te_actor, "y", cameray() - 20, cameray() + 274, 24, -3, "out");
    c_var_instance(id, "bouncesnd", 1);
    c_wait(9);
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    if (su_actor.x >= 380)
    {
        c_sel(su);
        var _target_y = (su_actor.y > 226) ? 226 : su_actor.y;
        c_jump(294, _target_y, 25, 10);
    }
    if (ra_actor.x >= 400)
    {
        c_sel(ra);
        var _target_y = (ra_actor.y > 236) ? 236 : ra_actor.y;
        c_jump(234, _target_y, 25, 10);
    }
    c_shake();
    c_mus("free_all");
    c_wait(8);
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* TV-tastic!!^1! Then let's rock and roll^1, folks!!!/%", "obj_room_interstitial_slash_Step_0_gml_71_0");
    c_talk_wait();
    c_var_instance(blackall, "depth", te_actor.depth + 10);
    c_sel(kr);
    c_autodepth(0);
    c_depth(te_actor.depth + 20);
    c_sel(su);
    c_autodepth(0);
    c_depth(te_actor.depth + 30);
    c_sel(ra);
    c_autodepth(0);
    c_depth(te_actor.depth + 40);
    c_waitcustom();
}
if (con == 12 && customcon == 1 && !d_ex())
{
    con = 13;
    with (obj_border_controller)
        hide_border(0.1);
}
if (con == 13 && customcon == 1)
{
    con = 14;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(blackall, "image_alpha", 0);
    c_var_instance(blackall, "visible", 1);
    c_var_lerp_to_instance(blackall, "image_alpha", 1, 10);
    c_wait(15);
    c_waitcustom();
}
if (con == 14 && !d_ex() && customcon == 1)
{
    con = -1;
    customcon = 0;
    room_goto(room_ch3_gameshowroom);
}
if (con == 45 && global.interact == 0 && obj_mainchara.x < 400)
{
    con = 50;
    global.interact = 1;
}
if (con == 50)
{
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (scr_flag_get(1199) == 1)
    {
        end_sequence();
        c_var_lerp_to_instance(_blackall, "image_alpha", 0, 30);
        c_mus2("volume", 1, 30);
        c_sel(su);
        c_setxy(camerax() - 80, 198);
        c_sel(kr);
        c_setxy(260, 214);
        c_facing("d");
        c_sel(ra);
        c_setxy(348, 203);
        c_facing("d");
        c_wait(30);
    }
    else
    {
        con = 51;
        alarm[0] = 1;
        c_sel(kr);
        c_facing("l");
        c_sel(ra);
        c_facing("l");
        c_sel(su);
        c_emote("!", 30);
        c_wait(30);
        c_sel(su);
        c_walkdirect_speed_wait(205, su_actor.y, 9);
        c_facing("l");
        c_msgside("top");
        c_speaker("susie");
        c_msgsetloc(0, "\\E2* Hey^1! There's Tenna onstage over there...!/", "obj_room_interstitial_slash_Step_0_gml_284_0");
        c_msgnextloc("\\EA* ..^1. maybe we could talk to him for a sec?/", "obj_room_interstitial_slash_Step_0_gml_285_0");
        c_msgnextloc("\\E2* Y'know^1, get some hints about the next board...?/", "obj_room_interstitial_slash_Step_0_gml_286_0");
        c_msgnextloc("\\E9* Anyway^1, let's go!/%", "obj_room_interstitial_slash_Step_0_gml_287_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susie_head_scratch_dw);
        c_addxy(0, -6);
        c_imagespeed(0.2);
        c_wait_box(2);
        c_sel(su);
        c_autowalk(1);
        c_facing("r");
        c_addxy(0, 6);
        c_halt();
        c_wait_box(3);
        c_sel(su);
        c_facing("l");
        c_wait_talk();
        c_sel(su);
        c_walkdirect_speed(camerax() - 80, su_actor.y, 9);
        c_wait(30);
        c_sel(kr);
        c_walkdirect_speed(260, 214, 4);
        c_sel(ra);
        c_walkdirect_speed_wait(348, 203, 6);
        c_msgside("bottom");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EA* W-wait./%", "obj_room_interstitial_slash_Step_0_gml_323_0");
        c_talk_wait();
        c_sel(kr);
        c_facing("r");
        c_sel(ra);
        c_sprite(spr_ralsei_head_down_sad_left);
        c_wait(5);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E0* Kris^1, maybe we should let Susie go.../%", "obj_room_interstitial_slash_Step_0_gml_336_0");
        c_talk_wait();
        c_sel(ra);
        c_facing("l");
        c_msc(1361);
        c_talk_wait();
    }
    c_waitcustom();
}
if (con == 55 && !d_ex() && customcon == 1)
{
    con = 56;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* Then^1, let's close our eyes and think about what she's doing now.../%", "obj_room_interstitial_slash_Step_0_gml_365_0");
    c_talk_wait();
    c_mus2("volume", 0, 30);
    c_var_instance(_blackall, "image_alpha", 0);
    c_var_instance(_blackall, "visible", 1);
    c_var_lerp_to_instance(_blackall, "image_alpha", 1, 30);
    c_wait(60);
    c_waitcustom();
}
if (con == 56 && !d_ex() && customcon == 1)
{
    con = 57;
    customcon = 0;
    room_goto(room_board_empty);
}
if (con == 60 && !d_ex() && customcon == 1)
{
    con = 61;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_facing("d");
    c_wait(15);
    c_msc(1363);
    c_talk_wait();
    c_waitcustom();
}
if (con == 65 && !d_ex() && customcon == 1)
{
    con = 66;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("l");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Sure^1! We can chill^1! With our^1, um^1, eyes open./%", "obj_room_interstitial_slash_Step_0_gml_422_0");
    c_talk_wait();
    c_wait(60);
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_wait(60);
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("l");
    c_msc(1365);
    c_talk_wait();
    c_waitcustom();
}
if (con == 70 && !d_ex() && customcon == 1)
{
    con = 71;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_blush);
    c_msc(1367);
    c_talk_wait();
    c_waitcustom();
}
if (con == 75 && !d_ex() && customcon == 1)
{
    end_sequence();
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_unhappy);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* Huh? I'm not quite sure what you.../%", "obj_room_interstitial_slash_Step_0_gml_478_0");
    c_talk_wait();
    c_sprite(spr_ralsei_head_down_sad_left);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* W-well^1, I.../", "obj_room_interstitial_slash_Step_0_gml_486_0");
    c_msgnextloc("\\Ed* Kris^1, I'm sorry^1, but.../", "obj_room_interstitial_slash_Step_0_gml_487_0");
    c_msgnextloc("\\EQ* This is..^1. my face./%", "obj_room_interstitial_slash_Step_0_gml_488_0");
    c_talk_wait();
    c_sprite(spr_ralsei_walk_left_unhappy);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ee* And if there's one thing I like about myself^1, it's this.../%", "obj_room_interstitial_slash_Step_0_gml_496_0");
    c_talk_wait();
    c_sprite(spr_ralsei_head_down_sad_left);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ea* So^1, even if you think it's boring^1, or too similar to.../%", "obj_room_interstitial_slash_Step_0_gml_504_0");
    c_talk_wait();
    c_sprite(spr_ralsei_smile_up);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* D-don't laugh^1, Kris. If you think it's the same as.../", "obj_room_interstitial_slash_Step_0_gml_512_0");
    c_msgnextloc("\\EQ* OK^1, I get it^1! You don't think it's too similar^1! But.../", "obj_room_interstitial_slash_Step_0_gml_513_0");
    c_msgnextloc("\\EU* Kris!/%", "obj_room_interstitial_slash_Step_0_gml_514_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_wait_box(2);
    c_sprite(spr_ralsei_walk_left_blush);
    c_wait_talk();
    c_facing("l");
    c_wait(30);
    c_waitcustom();
}
if (con == 80 && !d_ex() && customcon == 1)
{
    end_sequence();
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_blush);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E1* H-huh? thanks^1! I.../%", "obj_room_interstitial_slash_Step_0_gml_546_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* (Wait^1, is that a compliment...?)/%", "obj_room_interstitial_slash_Step_0_gml_555_0");
    c_talk_wait();
    c_wait(15);
    c_sprite(spr_ralsei_head_down_sad_left);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* I know^1, um..^1. I look like a monster^1, but.../", "obj_room_interstitial_slash_Step_0_gml_564_0");
    c_msgnextloc("\\Ea* At the end of the day^1, I'm not..^1. a Lightner./", "obj_room_interstitial_slash_Step_0_gml_565_0");
    c_msgnextloc("\\EQ* I'm just a shadow. Like everything else./%", "obj_room_interstitial_slash_Step_0_gml_566_0");
    c_talk_wait();
    c_facing("l");
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* So it's up to you..^1. How you think of me./%", "obj_room_interstitial_slash_Step_0_gml_574_0");
    c_talk_wait();
    c_wait(30);
    c_waitcustom();
}
if (con == 85 && !d_ex() && customcon == 1)
{
    end_sequence();
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_blush);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\ED* H-huh? Thanks^1! I.../%", "obj_room_interstitial_slash_Step_0_gml_597_0");
    c_talk_wait();
    c_sprite(spr_ralsei_walk_blush_hide);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E1* Well^1, I couldn't be more happy hearing something like that.../%", "obj_room_interstitial_slash_Step_0_gml_604_0");
    c_talk_wait();
    c_sprite(spr_ralsei_walk_blush_peek);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* That means both you AND Susie think I'm cute./%", "obj_room_interstitial_slash_Step_0_gml_611_0");
    c_talk_wait();
    c_sprite(spr_ralsei_walk_blush_hide);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\ED* S-sorry^1! I'm being proud./", "obj_room_interstitial_slash_Step_0_gml_618_0");
    c_msgnextloc("\\E2* (I shouldn't let this put me in such a good mood...)/%", "obj_room_interstitial_slash_Step_0_gml_619_0");
    c_talk_wait();
    c_wait(30);
    c_waitcustom();
}
if (con == 90 && !d_ex() && customcon == 1)
{
    con = 100;
    customcon = 0;
    snd_play(snd_item);
    with (door_marker)
        turn_on();
    c_waitcustom_end();
    c_sel(kr);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_sel(su);
    c_setxy(camerax() - 80, 198);
    c_walkdirect_speed_wait(160, 198, 6);
    c_facing("r");
    c_wait(30);
    c_msc(1369);
    c_talk_wait();
    c_waitcustom();
}
if (con == 95 && !d_ex() && customcon == 1)
{
    con = (scr_flag_get(1199) == 1) ? 97 : 99;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_facing("u");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. uh^1, okay. Weirdos./%", "obj_room_interstitial_slash_Step_0_gml_670_0");
    c_talk_wait();
    if (scr_flag_get(1199) == 1)
    {
        c_wait(15);
        c_sel(su);
        c_facing("l");
        c_speaker("susie");
        c_msgsetloc(0, "\\EN* You know^1, I thought he was a weirdo at first^1, but.../", "obj_room_interstitial_slash_Step_0_gml_682_0");
        c_msgnextloc("\\E2* Tenna's not such a bad guy^1, y'know^1, Kris...? Just kinda lonely./%", "obj_room_interstitial_slash_Step_0_gml_683_0");
        c_talk();
        c_wait_box(1);
        c_sprite(spr_susie_look_down_left);
        c_wait_talk();
        c_wait(5);
        c_msc(1371);
        c_talk_wait();
    }
    c_waitcustom();
}
if (con == 99 && customcon == 1 && !d_ex())
{
    con = 110;
    customcon = 0;
    c_waitcustom_end();
    if (scr_flag_get(1199) == 1)
    {
        if (global.choice == 0)
        {
            scr_flag_set(1201, 1);
            c_sel(su);
            c_facing("l");
            c_speaker("susie");
            c_msgsetloc(0, "\\E9* (Right? I knew you were actually having fun^1, too.)/%", "obj_room_interstitial_slash_Step_0_gml_718_0");
            c_talk_wait();
        }
        else
        {
            scr_flag_set(1201, 2);
            c_sel(su);
            c_facing("r");
            c_speaker("susie");
            c_msgsetloc(0, "\\EK* (Oh^1, okay^1, that's what he was talking about.)/%", "obj_room_interstitial_slash_Step_0_gml_728_0");
            c_talk_wait();
        }
    }
    c_sel(su);
    c_walkdirect_speed(315, su_actor.y, 6);
    c_wait(15);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk_wait("r", 4, 8);
    c_halt();
    c_wait(10);
    c_sel(su);
    c_facing("l");
    c_wait(15);
    c_waitcustom();
}
if (con == 110 && !d_ex() && customcon == 1)
{
    con = 120;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 120 && !i_ex(obj_cutscene_master))
{
    con = 1;
    global.interact = 0;
    global.facing = 0;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    global.plot = 122;
}
if (con == 130 && obj_mainchara.x < 16)
{
    con = 131;
    global.interact = 1;
    obj_mainchara.x += 8;
    global.msc = prompt_id;
    scr_text(global.msc);
    var d = d_make();
    d.side = 0;
}
if (con == 135 && !d_ex())
{
    con = 136;
    alarm[0] = 45;
    global.interact = 1;
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        image_speed = 0.2;
        sprite_index = lsprite;
        hspeed = -4;
    }
    with (obj_caterpillarchara)
    {
        follow = 0;
        cutscene = 1;
        fun = 1;
        if (scr_flag_get(1208) == 0)
        {
            image_speed = 0.2;
            sprite_index = lsprite;
            hspeed = -4;
        }
    }
    scr_lerp_instance_var(_blackall, "image_alpha", 0, 1, 40);
    snd_volume(global.currentsong[1], 0, 30);
}
if (con == 137 && !d_ex())
{
    con = -1;
    instance_create(0, 0, obj_persistentfadein);
    snd_free_all();
    global.interact = 3;
    room_goto(room_board_empty);
}
if (con == 140 && !d_ex())
{
    con = 130;
    global.interact = 0;
}
if (con == 150)
{
    con = 151;
    global.interact = 1;
    scr_lerp_var_instance(_blackall, "image_alpha", 1, 0, 30);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    su_actor.rsprite = spr_susie_walk_right_look_down_dw;
    c_mus2("volume", 1, 30);
    c_sel(su);
    c_setxy(camerax() - 80, 200);
    c_sel(kr);
    c_setxy(camerax() - 80, 216);
    c_sel(ra);
    c_setxy(camerax() - 80, 204);
    c_sel(su);
    c_walkdirect_speed(378, 200, 6);
    c_wait(15);
    c_sel(kr);
    c_walkdirect_speed(304, 216, 6);
    c_wait(15);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_walkdirect_speed_wait(223, 204, 6);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* .../", "obj_room_interstitial_slash_Step_0_gml_892_0");
    c_msgnextloc("\\ED* ..^1. man./", "obj_room_interstitial_slash_Step_0_gml_893_0");
    c_msgnextloc("\\E4* There's nothing that pisses me off more.../", "obj_room_interstitial_slash_Step_0_gml_894_0");
    c_msgnextloc("\\ED* ..^1. than people who don't tell you the whole deal./", "obj_room_interstitial_slash_Step_0_gml_895_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* ..^1. You mean^1, Tenna...?/", "obj_room_interstitial_slash_Step_0_gml_897_0");
    c_facenext("susie", "4");
    c_msgnextloc("\\E4* Yeah. I dunno what^1, but..^1. he's hiding something./", "obj_room_interstitial_slash_Step_0_gml_899_0");
    c_msgnextloc("\\ED* ..^1. Let's go take a look around^1, Kris./%", "obj_room_interstitial_slash_Step_0_gml_900_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down_left);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_wait_box(5);
    c_sel(ra);
    c_facing("r");
    c_wait_box(7);
    c_sel(su);
    c_facing("u");
    c_wait_box(8);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_talk();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 151 && !i_ex(obj_cutscene_master))
{
    con = 130;
    global.interact = 0;
    global.facing = 0;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    scr_flag_set(1208, 2);
}
if (bouncesnd)
{
    bouncesnd = 0;
    snd_play_delay(snd_impact, 9, 0.9);
    snd_play_delay(snd_impact, 18, 0.7);
    snd_play_delay(snd_impact, 22, 0.5);
    snd_play_delay(snd_impact, 24, 0.3);
}

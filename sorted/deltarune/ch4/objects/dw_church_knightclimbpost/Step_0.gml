var xx = camerax();
var yy = cameray();
scr_populatechars();
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    var pos = scr_heromarker("kr", "knightend");
    setxy(pos[0], pos[1], kris);
    pos = scr_heromarker("ra", "knightend");
    ralsei.fun = 1;
    ralsei.sprite_index = spr_ralsei_surprised_left_walk;
    setxy(pos[0], pos[1], ralsei);
    pos = scr_heromarker("su", "knightend");
    setxy(pos[0], pos[1], susie);
    global.interact = 1;
    global.facing = 2;
    scr_caterpillar_interpolate("all");
    scr_caterpillar_facing(3, "all");
}
if (con == 2)
{
    if (scr_debug() && global.tempflag[90] == 2)
    {
        con = 5;
        with (roaring_knight)
            instance_destroy();
        giant_door_marker.image_index = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sel(kr);
        c_facing("l");
        c_setxy(1718, 1692);
        c_sel(su);
        c_facing("susieunhappy");
        c_sel(ra);
        c_setxy(ra_actor.x - 80, ra_actor.y);
        c_waitcustom();
    }
    else
    {
        con = 3;
        alarm[0] = 1;
    }
}
if (con == 4)
{
    con = 5;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_walkdirect(kr_actor.x, kr_actor.y - 60, 15);
    c_delayfacing(16, "l");
    c_sel(su);
    c_autowalk(0);
    c_facing("susieunhappy");
    c_sprite(spr_susie_walk_left_angry);
    c_addxy(-20, -40);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_walkdirect(ra_actor.x - 40, ra_actor.y, 12);
    c_delaycmd(13, "imagespeed", 0);
    c_delaycmd(13, "imageindex", 0);
    c_pannable(1);
    c_pan(camerax() - 200, cameray() - 180, 30);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* S..^1. Susie^1! D-Don't.../%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_114_0");
    c_talk_wait();
    c_pannable(1);
    c_pan_wait(camerax() - 500, cameray() - 340, 30);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_angry_pose_left);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\EI* What^1, and just let this loser get away!?/%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_127_0");
    c_talk_wait();
    var run_speed = 10;
    var k_x_pos = 1500;
    var k_y_pos = 300;
    var kr_x_pos_left = 240;
    var k_move_time = scr_calculate_move_distance(roaring_knight.xstart, roaring_knight.ystart, k_x_pos, k_y_pos, run_speed + 1);
    var k_move_time_left = scr_calculate_move_distance(k_x_pos, k_y_pos, kr_x_pos_left, k_y_pos, run_speed - 1);
    c_var_lerp_to_instance(roaring_knight, "x", k_x_pos, k_move_time, 2);
    c_var_lerp_to_instance(roaring_knight, "ystart", k_y_pos, k_move_time, 2);
    c_wait(10);
    var su_x_pos = 1500;
    var su_y_pos = 400;
    var su_x_pos_left = 490;
    var su_move_time = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, run_speed);
    var su_move_time_left = scr_calculate_move_distance(su_x_pos, su_y_pos, su_x_pos_left, su_y_pos, run_speed + 1);
    c_pan(camerax() - 1080, cameray() - 1040, su_move_time);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_serious_left);
    c_imagespeed(0.4);
    c_walkdirect(su_x_pos, su_y_pos, su_move_time);
    c_delaywalkdirect(su_move_time + 1, su_x_pos_left, su_y_pos, su_move_time_left);
    c_delaycmd4(su_move_time + 1, "pan", 0, cameray() - 1040, su_move_time_left - 6);
    c_wait(k_move_time - 10);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_transition);
    c_var_instance(roaring_knight, "image_index", 9);
    c_var_instance(roaring_knight, "image_speed", -0.4);
    c_wait(18);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_fly);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_lerp_to_instance(roaring_knight, "x", kr_x_pos_left, k_move_time_left - 18);
    c_delaycmd((k_move_time_left + 1) - 18, "sprite", spr_susie_surprised_step_back_left);
    c_delaycmd((k_move_time_left + 1) - 18, "imagespeed", 0);
    c_delaycmd((k_move_time_left + 1) - 18, "imageindex", 1);
    c_delaycmd((k_move_time_left + 1) - 18, "shakeobj_x", 2);
    c_delaycmd4((k_move_time_left + 1) - 18, "var", roaring_knight, "state", -1);
    c_delaycmd4((k_move_time_left + 1) - 18, "var", roaring_knight, "visible", 0);
    c_wait((k_move_time_left + 1) - 18);
    c_mus("free_all");
    c_var_instance(giant_door_marker, "image_index", 1);
    c_snd_play(snd_impact);
    c_shake();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_serious_left);
    c_imagespeed(0.4);
    c_walkdirect_wait(326, su_y_pos, 16);
    c_sprite(spr_susie_kick_up_dw);
    c_halt();
    c_autowalk(0);
    c_var_lerp_to("image_index", 5, 12);
    c_wait_if(su_actor, "image_index", ">=", 2);
    c_snd_play(snd_impact);
    c_shake();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EI* Hey^1! The hell are you doing^1, you goddamn coward...!?/%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_221_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_facing("u");
    c_wait(30);
    c_customfunc(function()
    {
        camera_pan = true;
        camera_pan_timer = 0;
        camera_y_pos = cameray();
        camera_x_pos = camerax();
        camera_x_target = 2379;
        camera_y_target = 1128;
    });
    c_wait(120);
    c_waitcustom();
}
if (con == 5 && !d_ex() && customcon == 1)
{
    con = 10;
    customcon = 0;
    global.facing = 0;
    with (ralsei)
        fun = 0;
    c_waitcustom_end();
    c_sel(su);
    c_setxy(camerax() - 80, 1265);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_walk_right_dw_look_down);
    c_walkdirect(2414, 1315, 60);
    c_delaycmd(61, "imagespeed", 0);
    c_delaycmd(61, "imageindex", 0);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_imagespeed(0.1);
    c_walkdirect_wait(ra_actor.x + 80, ra_actor.y, 40);
    c_halt();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ec* Damnit..^1. I let them..^1. get away./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_375_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_left);
    c_imagespeed(0.2);
    c_walkdirect_wait((ra_actor.x + 80) - 13, ra_actor.y, 12);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* ..^1. it's alright^1, Susie. We did our best./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_387_0");
    c_facenext("susie", "c");
    c_msgnextloc("\\Ec* Yeah^1, but it..^1. it's not good enough!/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_389_0");
    c_msgnextloc("\\Eb* Every time^1, they're just one step ahead of us./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_390_0");
    c_msgnextloc("\\EV* If we keep letting them get away^1, then.../%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_391_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_unhappy);
    c_sel(su);
    c_sprite(spr_susie_look_back_right);
    c_wait_box(3);
    c_sel(su);
    c_facing("r");
    c_wait_box(4);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_look_down_arm_shake);
    c_halt();
    c_wait_talk();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_look_down_arm_shake);
    c_imagespeed(0.3);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* How are we gonna protect Toriel? Undyne...? ..^1. anybody?/%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_427_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad);
    c_imagespeed(0.1);
    c_walkdirect_wait(ra_actor.x + 80, ra_actor.y, 20);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E8* ..^1. Susie.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_441_0");
    c_msgnextloc("\\Ea* I understand how you're feeling^1, but.../%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_442_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_wait_talk();
    c_sel(su);
    c_halt();
    c_sel(ra);
    c_sprite(spr_ralsei_smile_up);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E0* We..^1. have our own advantages^1, too!/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_459_0");
    c_msgnextloc("\\E5* The Knight only seems to show its face in the Dark World./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_460_0");
    c_msgnextloc("\\E0* If we can just seal the Fountain over to the right.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_461_0");
    c_msgnextloc("\\EQ* Then..^1. it'll at least..^1. buy us a little more time./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_462_0");
    c_msgnextloc("\\E8* ..^1. until we..^1. have to face our difficulties again./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_463_0");
    c_facenext("susie", 13);
    c_msgnextloc("\\ED* ..^1. yeah. You're right./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_465_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("u");
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_turn_right_subtle);
    c_wait_box(3);
    c_sel(ra);
    c_facing("u");
    c_wait_box(4);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_up_sad);
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_look_down);
    c_sel(ra);
    c_facing("l");
    c_wait_talk();
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect(kr_actor.x - 80, 1315, 30);
    c_delaycmd(31, "imageindex", 0);
    c_delaycmd(31, "imagespeed", 0);
    c_wait(10);
    c_sel(ra);
    c_facing("d");
    c_autowalk(0);
    c_imagespeed(0.4);
    c_walk_wait("u", 2, 6);
    c_halt();
    c_wait(8);
    c_imagespeed(0.4);
    c_walk_wait("d", 2, 6);
    c_halt();
    c_sel(ra);
    c_facing("r");
    c_wait(30);
    c_sel(su);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* Kris. Let's go.../%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_523_0");
    c_talk_wait();
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 10 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    global.plot = 195;
    scr_tempsave();
}
if (camera_pan)
{
    camera_pan_timer++;
    if (camera_pan_timer == 1)
    {
        scr_lerpvar("camera_y_pos", cameray(), camera_y_target, 90, 3, "inout");
        scr_lerpvar("camera_x_pos", camerax(), camera_x_target, 90, 3, "inout");
    }
    camera_set_view_pos(view_get_camera(0), camera_x_pos, camera_y_pos);
    if (camera_pan_timer >= 100)
    {
        camera_pan = false;
        camera_pan_timer = 0;
    }
}
if (con == 20)
{
    con = 21;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 22)
{
    con = 25;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_facing("u");
    c_setxy(giant_door_marker.x + 72, giant_door_marker.y + 260 + 8);
    c_wait(30);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("u");
    c_setxy(giant_door_marker.x + 122, giant_door_marker.y + 242 + 8);
    c_sel(ra);
    c_setxy(680, 466);
    c_pannable(1);
    c_pan(40, 140, 1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_customfunc(function()
    {
        with (obj_border_controller)
        {
            set_border(border_dw_church_a);
            show_border();
        }
    });
    c_wait(90);
    c_sel(su);
    c_sprite(spr_susie_up_look_left);
    c_wait(15);
    c_sprite(spr_susie_up_look_right);
    c_wait(15);
    c_facing("u");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. It's..^1. the same as before./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_628_0");
    c_msgnextloc("\\EV* The first time./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_629_0");
    c_talk_wait();
    c_sel(ra);
    c_walkdirect_wait(335, 466, 60);
    c_facing("u");
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EA* ..^1. I suppose the original Dark World.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_640_0");
    c_msgnextloc("\\E5* Was formed partially of the fountain inside there^1, too./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_641_0");
    c_msgnextloc("\\EA* The Knight's two fountains.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_642_0");
    c_msgnextloc("\\E0* So^1, it makes sense..^1. it would be a similar world as before./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_643_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_turn_left_subtle);
    c_wait_box(2);
    c_sel(ra);
    c_facing("u");
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_up_sad);
    c_wait_talk();
    c_wait(60);
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_sprite(spr_susie_up_look_left);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. just similar^1, huh./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_670_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait(30);
    c_sel(su);
    c_facing("l");
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* Kris^1, the Knight is waiting in there.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_690_0");
    c_msgnextloc("\\ED* ..^1. there's..^1. no time to think about anything else./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_691_0");
    c_msgnextloc("\\E1* Let's go./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_692_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_box(2);
    c_sel(su);
    c_facing("d");
    c_sel(kr);
    c_facing("d");
    c_wait_talk();
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_customfunc(function()
    {
        flamefade = true;
        event_user(9);
    });
    c_waitcustom();
}
if (con == 25 && customcon == 1 && !d_ex())
{
    if (global.interact == 1)
    {
        regain_control();
        scr_tempsave();
    }
    else if (((obj_mainchara.y < 420 && (obj_mainchara.x >= 310 && obj_mainchara.x < 450)) || obj_mainchara.x >= 450) && global.interact == 0)
    {
        con = 30;
        lose_control();
    }
}
if (con == 30 && customcon == 1 && !d_ex())
{
    con = 31;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* W..^1. wait./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_750_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* What?/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_752_0");
    c_facenext("ralsei", "J");
    c_msgnextloc("\\EJ* .../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_754_0");
    c_msgnextloc("\\E1* Can we..^1. pose?/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_755_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* Fine^1, dumbass./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_757_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    var su_x_pos = kr_actor.x + 70;
    var su_y_pos = kr_actor.y - 16;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_actor.y, 8);
    var su_walktime_y = scr_calculate_move_distance(su_x_pos, su_actor.y, su_x_pos, su_y_pos, 6);
    c_sel(su);
    c_walkdirect(su_x_pos, su_actor.y, su_walktime);
    c_delaywalkdirect(su_walktime + 1, su_x_pos, su_y_pos, su_walktime_y);
    c_delayfacing(su_walktime + 1 + su_walktime_y + 1, "d");
    var ra_x_pos = kr_actor.x - 80;
    var ra_y_pos = kr_actor.y - 14;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_actor.y, 8);
    var ra_walktime_y = scr_calculate_move_distance(ra_x_pos, ra_actor.y, ra_x_pos, ra_y_pos, 6);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect(ra_x_pos, ra_actor.y, ra_walktime);
    c_delaywalkdirect(ra_walktime + 1, ra_x_pos, ra_y_pos, ra_walktime_y);
    c_delayfacing(ra_walktime + 1 + ra_walktime_y + 2, "d");
    c_wait_if(su_actor, "y", "=", su_y_pos);
    c_wait_if(ra_actor, "y", "=", ra_y_pos);
    c_wait(15);
    c_soundplay(snd_swing);
    c_sel(kr);
    c_spin(2);
    c_sel(su);
    c_spin(2);
    c_sel(ra);
    c_spin(2);
    c_wait(16);
    c_soundplay(snd_bell);
    c_sel(kr);
    c_sprite(spr_kris_pose);
    c_addxy(-2, -2);
    c_spin(0);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_addxy(2, 2);
    c_spin(0);
    c_sel(ra);
    c_sprite(spr_ralsei_pose);
    c_addxy(-10, 0);
    c_spin(0);
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    c_addxy(2, 2);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 31 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    with (obj_mainchara)
        cutscene = 0;
    global.plot = 243;
    scr_tempsave();
}
if (con == 40 && !d_ex())
{
    con = 41;
    snd_free_all();
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_pannable(1);
    c_pan(40, 140, 1);
    c_wait(1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(70);
    c_customfunc(function()
    {
        camera_y_pos = cameray();
        camera_x_pos = camerax();
        camera_x_target = 680;
        camera_y_target = 140;
    });
    c_var_instance(id, "pillar_pan", true);
    c_wait(90);
    c_customfunc(function()
    {
        with (pillar)
            scr_lerpvar("alphadist", 1, 0, 60, 3, "out");
    });
    c_wait(90);
    c_customfunc(function()
    {
        with (obj_dw_leave_ch4)
            particle_active = false;
    });
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_mus2("volume", 0, 30);
    c_wait(60);
    c_customfunc(function()
    {
        snd_free_all();
        instance_create(0, 0, obj_persistentfadein);
        global.flag[1659] = 1;
        global.interact = 3;
        var room_id = scr_get_ini_value(global.chapter, global.filechoice, "Room");
        var target_room = scr_get_room_by_id(room_id);
        room_goto(target_room);
    });
    c_waitcustom();
}
if (pillar_pan)
{
    pillar_pan_timer++;
    if (pillar_pan_timer == 1)
    {
        scr_lerpvar("camera_y_pos", cameray(), camera_y_target, 90, 3, "inout");
        scr_lerpvar("camera_x_pos", camerax(), camera_x_target, 90, 3, "inout");
    }
    camera_set_view_pos(view_get_camera(0), camera_x_pos, camera_y_pos);
    if (pillar_pan_timer >= 100)
    {
        pillar_pan = false;
        pillar_pan_timer = 0;
    }
}
if (pillar_active)
{
    if (pillar_con == 0)
    {
        var triggered = false;
        with (pillar_trigger)
        {
            if (place_meeting(x, y, obj_mainchara))
                triggered = true;
        }
        if (triggered)
            pillar_con = 1;
    }
    if (pillar_con == 1 && global.interact == 0 && !d_ex())
    {
        pillar_con = -1;
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_pannable(1);
        c_pan(580, cameray(), 20);
        var kr_x_pos = 830;
        var kr_y_pos = 450;
        var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, 2);
        c_sel(kr);
        c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
        c_delayfacing(kr_walktime + 1, "r");
        var su_x_pos = kr_x_pos - 60;
        var su_y_pos = kr_y_pos - 16;
        var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, 4);
        c_sel(su);
        c_walkdirect(su_x_pos, su_y_pos, su_walktime);
        c_delayfacing(su_walktime + 1, "r");
        var ra_x_pos = kr_x_pos - 120;
        var ra_y_pos = kr_y_pos - 12;
        var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, 4);
        c_sel(ra);
        c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
        c_delayfacing(ra_walktime + 1, "r");
        c_wait(30);
        if (global.flag[1660] == 0)
        {
            pillar_con = 2;
            c_customfunc(function()
            {
                global.msc = -99;
                global.choice = -1;
                global.choicemsg = [stringsetloc("#Go back#to Castle Town", "obj_dw_church_knightclimbpost_slash_Step_0_gml_914_0"), stringsetloc("#Stay here", "obj_dw_church_knightclimbpost_slash_Step_0_gml_915_0")];
            });
            c_speaker("susie");
            c_msgsetloc(0, "\\EC* Huh? It looks like..^1. that thing in Castle town./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_920_0");
            c_facenext("ralsei", "6");
            c_msgnextloc("\\E6* A way back to the Light World.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_922_0");
            c_msgnextloc("\\E5* Did..^1. the door to the Church crack open...?/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_923_0");
            c_facenext("susie", "C");
            c_msgnextloc("\\EC* What do we do?/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_925_0");
            c_msgnext("\\C2");
            c_customfunc(function()
            {
                var d = d_make();
                d.side = 1;
            });
        }
        else
        {
            pillar_con = 3;
            c_customfunc(function()
            {
                global.msc = -99;
                global.choice = -1;
                global.choicemsg = [stringsetloc("#Return to#Castle Town", "obj_dw_church_knightclimbpost_slash_Step_0_gml_942_0"), stringsetloc("#Stay here", "obj_dw_church_knightclimbpost_slash_Step_0_gml_943_0")];
            });
            c_speaker("no_name");
            c_msgsetloc(0, "* (It's a pillar of light...)/", "obj_dw_church_knightclimbpost_slash_Step_0_gml_948_0");
            c_msgnext("\\C2");
            c_customfunc(function()
            {
                var d = d_make();
                d.side = 1;
            });
        }
        c_waitcustom();
    }
    if (pillar_con == 2 && global.choice != -1 && customcon == 1)
    {
        pillar_con = 10;
        customcon = 0;
        global.flag[1660] = 1;
        k_d(3);
        c_waitcustom_end();
        if (global.choice == 0)
        {
            pillar_con = 5;
        }
        else if (global.choice == 1)
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\ED* Yeah..^1. we can't go back now./%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_978_0");
            c_talk_wait();
        }
        c_waitcustom();
    }
    if (pillar_con == 3 && global.choice != -1 && customcon == 1)
    {
        pillar_con = 10;
        customcon = 0;
        k_d(3);
        c_waitcustom_end();
        if (global.choice == 0)
            pillar_con = 5;
        c_waitcustom();
    }
    if (pillar_con == 5 && !d_ex() && customcon == 1)
    {
        pillar_con = -1;
        c_waitcustom_end();
        if (global.flag[1661] == 0)
        {
            c_sel(kr);
            c_walkdirect_wait(kr_actor.x + 40, kr_actor.y, 20);
            c_sel(su);
            c_sprite(spr_susie_surprised_subtle_right);
            c_sel(ra);
            c_sprite(spr_ralsei_walk_right_unhappy);
            c_speaker("susie");
            c_msgsetloc(0, "\\EC* W..^1. Wait./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1025_0");
            c_msgnextloc("\\ED* We can't leave now..^1. Toriel might be.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1026_0");
            c_facenext("ralsei", "Q");
            c_msgnextloc("\\EQ* Umm^1, Susie^1, if you stay^1, I should stay^1, too.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1028_0");
            c_facenext("susie", "D");
            c_msgnextloc("\\ED* .../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1030_0");
            c_msgnextloc("\\E0* Kris^1, if you're gonna go.../", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1031_0");
            c_msgnextloc("\\E1* Go fast and direct. No messing around./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1032_0");
            c_facenext("ralsei", "Q");
            c_msgnextloc("\\EQ* Come back quick^1, Kris...!/%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1034_0");
            c_talk();
            c_wait_box(1);
            c_sel(su);
            c_sprite(spr_susie_look_down_right_dw);
            c_wait_box(3);
            c_sel(ra);
            c_sprite(spr_ralsei_walk_right_sad_subtle);
            c_wait_box(6);
            c_sel(su);
            c_sprite(spr_susie_walk_right_dw_unhappy);
            c_sel(ra);
            c_sprite(spr_ralsei_walk_right_unhappy);
            c_wait_box(7);
            c_sel(su);
            c_sprite(spr_susie_look_down_right_dw);
            c_wait_box(9);
            c_sel(su);
            c_facing("r");
            c_sel(ra);
            c_sprite(spr_ralsei_walk_right);
            c_wait_talk();
        }
        c_customfunc(function()
        {
            global.flag[1661] += 1;
        });
        c_actortokris();
        c_customfunc(function()
        {
            scr_losechar();
            with (pillar)
                con = 10;
            global.tempflag[58] = 1;
        });
        c_waitcustom();
    }
    if (pillar_con == 10 && !d_ex() && customcon == 1)
    {
        pillar_con = 20;
        customcon = 0;
        global.facing = 0;
        c_waitcustom_end();
        c_pannable(1);
        c_panobj(kr_actor, 15);
        c_wait(16);
        c_pannable(0);
        c_sel(kr);
        c_facing("d");
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (pillar_con == 20 && !d_ex() && !i_ex(obj_cutscene_master))
    {
        pillar_con = 0;
        global.interact = 0;
        pillar_trigger.x = pillar_trigger.xstart + 40;
    }
    if (pillar_con == 30)
    {
        pillar_con = 31;
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        var kr_x_pos = 830;
        var kr_y_pos = 450;
        c_customfunc(function()
        {
            with (obj_mainchara)
            {
                x = 830;
                y = 450;
            }
        });
        c_sel(kr);
        c_setxy(kr_x_pos, kr_y_pos);
        c_facing("l");
        c_sel(su);
        c_setxy(kr_x_pos - 70, kr_y_pos - 16);
        c_facing("r");
        c_sel(ra);
        c_setxy(kr_x_pos - 130, kr_y_pos - 12);
        c_facing("r");
        c_pannable(1);
        c_pan(529, 248, 1);
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
        c_wait(30);
        c_pannable(0);
        if (global.flag[1661] == 1)
        {
            c_wait(15);
            c_speaker("susie");
            c_msgsetloc(0, "\\EC* ..^1. Took you long enough./", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1166_0");
            c_facenext("ralsei", "Q");
            c_msgnextloc("\\EQ* Hope you^1, um^1, had a good time^1, Kris!/%", "obj_dw_church_knightclimbpost_slash_Step_0_gml_1168_0");
            c_talk_wait();
        }
        c_sel(kr);
        c_facing("d");
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (pillar_con == 31 && !i_ex(obj_cutscene_master))
    {
        pillar_con = 0;
        global.interact = 0;
    }
}

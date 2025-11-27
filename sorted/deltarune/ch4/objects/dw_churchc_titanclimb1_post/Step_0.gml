scr_populatechars();
if (!init)
    init = 1;
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
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_autowalk(0);
    c_setxy(384, 680);
    c_sprite(spr_kris_dw_landed);
    c_addxy(0, -4);
    c_sel(su);
    c_autowalk(0);
    c_facing("susieunhappy");
    c_setxy(315, 663);
    c_sprite(spr_susie_dw_landed);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_setxy(270, 668);
    c_sprite(spr_ralsei_kneel_serious);
    c_customfunc(function()
    {
        overlay_controller.base_x_pos = kr_actor.x + 28;
        overlay_controller.target = kr_actor;
    });
    c_pannable(1);
    c_pan(0, 480, 1);
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 60);
    c_wait(4);
    c_sel(kr);
    c_autodepth(0);
    c_depth(105);
    c_wait(57);
    c_sel(kr);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_addxy(0, 4);
    c_autodepth(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. huff..^1. puff.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_92_0");
    c_msgnextloc("\\El* Looks like we're safe.../%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_93_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_addxy(8, 0);
    c_wait_talk();
    c_sel(ra);
    c_facing("d");
    c_wait(30);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ee* ..^1. for the time being./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_119_0");
    c_msgnextloc("\\E8* If we stay here.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_120_0");
    c_msgnextloc("\\Eb* ..^1. it's only a matter of time until it finds us./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_121_0");
    c_facenext("susie", "e");
    c_msgnextloc("\\Ee* Ralsei^1, what..^1. the hell is that thing?/%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_123_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_sad);
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad);
    c_wait_box(4);
    c_sel(ra);
    c_facing("d");
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_talk();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_sad);
    c_sel(su);
    c_facing("l");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\ET* When the Fountain's power becomes too strong.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_153_0");
    c_msgnextloc("\\ET* When the flow of darkness roars wild.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_154_0");
    c_msgnextloc("\\EZ* It makes..^1. that./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_155_0");
    c_msgnextloc("\\Ef* A Titan./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_156_0");
    c_msgnextloc("\\Ef* It's the fear-of-dark./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_157_0");
    c_msgnextloc("\\Ef* It's the bump-in-the-night./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_158_0");
    c_msgnextloc("\\Ef* It's the shadow of the backside of your mind./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_159_0");
    c_msgnextloc("\\Ef* It has no consciousness./", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_160_0");
    c_msgnextloc("\\EZ* It only exists to destroy./%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_161_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("d");
    c_wait_box(2);
    c_sel(ra);
    c_facing("l");
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad);
    c_wait_box(4);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_wait_box(6);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad);
    c_wait_box(7);
    c_sel(ra);
    c_facing("l");
    c_wait_box(8);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back_left);
    c_wait_talk();
    c_wait(30);
    c_sel(ra);
    c_facing("d");
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_speaker("susie");
    c_msgsetloc(0, "\\Eh* Well..^1. uh.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_207_0");
    c_msgnextloc("\\Eh* How the hell are we supposed to..^1. beat it?/", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_208_0");
    c_facenext("ralsei", "e");
    c_msgnextloc("\\Ee* I.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_210_0");
    c_msgnextloc("\\Ef* ..^1. I don't think we can..^1. It's hatching so fast./%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_211_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("l");
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_sad_subtle);
    c_wait_box(4);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_sad);
    c_wait_talk();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_sad_subtle);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ef* .../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_234_0");
    c_msgnextloc("\\ET* Unless.../%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_235_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_head_down);
    c_wait_talk();
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ep* Kris^1, you can seal Fountains^1, can't you?/", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_252_0");
    c_msgnextloc("\\Eq* Maybe..^1. if the Titan..^1. is anything like a Fountain.../", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_253_0");
    c_msgnextloc("\\ER* You could.../%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_254_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("d");
    c_wait_box(2);
    c_sel(ra);
    c_facing("r");
    c_wait_talk();
    c_var_instance(titan_hand, "pull_start", true);
    c_wait(15);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_surprised_step_back_left);
    c_halt();
    c_delaycmd(4, "imageindex", 1);
    c_delaywalk(4, "r", 4, 16);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk("r", 4, 16);
    c_delaycmd(17, "imagespeed", 0);
    c_sel(kr);
    c_facing("l");
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk("r", 4, 16);
    c_delaycmd(17, "imagespeed", 0);
    c_wait_if(titan_hand, "pull_start", "=", false);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* It..^1. it's found us!/%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_304_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    con = 4;
    customcon = 0;
    c_waitcustom_end();
    c_pannable(1);
    var offset = 840;
    var time_offset = 0;
    c_pan(camerax() + 620 + offset, cameray(), 150 - time_offset);
    c_delaycmd4((150 - time_offset) + 1, "pan", camerax() + 720 + offset + 340, 0, 60);
    var run_speed = 10;
    var kr_y_pos = kr_actor.y;
    var kr_x_pos = 890 + offset;
    var kr_x_pos_top = 2196;
    var kr_x_pos_top_right = 2343;
    var kr_y_pos_top = 230;
    var kr_y_pos_top_final = 245;
    var kr_walktime_right = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, run_speed);
    var kr_walktime_top = scr_calculate_move_distance(kr_x_pos, kr_actor.y, kr_x_pos_top, kr_y_pos_top, run_speed);
    var kr_walktime_top_right = scr_calculate_move_distance(kr_x_pos_top, kr_y_pos_top, kr_x_pos_top_right, kr_y_pos_top_final, run_speed);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_run_right);
    c_imagespeed(0.4);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime_right);
    c_delaywalkdirect(kr_walktime_right + 1, kr_x_pos_top, kr_y_pos_top, kr_walktime_top);
    c_delaywalkdirect(kr_walktime_right + 1 + kr_walktime_top + 1, kr_x_pos_top_right, kr_y_pos_top_final, kr_walktime_top_right);
    c_delaycmd4(kr_walktime_right + 1 + kr_walktime_top + 1 + kr_walktime_top_right + 1, "imagespeed", 0);
    c_delaycmd4(kr_walktime_right + 1 + kr_walktime_top + 1 + kr_walktime_top_right + 1, "autowalk", 1);
    c_delayfacing(kr_walktime_right + 1 + kr_walktime_top + 1 + kr_walktime_top_right + 1, "d");
    var su_y_pos = su_actor.y;
    var su_x_pos = 890 + offset;
    var su_x_pos_top = 2196;
    var su_x_pos_top_right = 2275;
    var su_y_pos_top = 210;
    var su_y_pos_top_final = 225;
    var su_walktime_right = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, run_speed);
    var su_walktime_top = scr_calculate_move_distance(su_x_pos, su_actor.y, su_x_pos_top, su_y_pos_top, run_speed);
    var su_walktime_top_right = scr_calculate_move_distance(su_x_pos_top, su_y_pos_top, su_x_pos_top_right, su_y_pos_top_final, run_speed);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_serious_right);
    c_imagespeed(0.4);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime_right);
    c_delaywalkdirect(su_walktime_right + 1, su_x_pos_top, su_y_pos_top, su_walktime_top);
    c_delaywalkdirect(su_walktime_right + 1 + su_walktime_top + 1, su_x_pos_top_right, su_y_pos_top_final, su_walktime_top_right);
    c_delaycmd4(su_walktime_right + 1 + su_walktime_top + 1 + su_walktime_top_right + 1, "imagespeed", 0);
    c_delaycmd4(su_walktime_right + 1 + su_walktime_top + 1 + su_walktime_top_right + 1, "autowalk", 1);
    c_delayfacing(su_walktime_right + 1 + su_walktime_top + 1 + su_walktime_top_right + 1, "d");
    c_wait(2);
    var ra_y_pos = ra_actor.y;
    var ra_x_pos = 890 + offset;
    var ra_x_pos_top = 2196;
    var ra_x_pos_top_right = 2220;
    var ra_y_pos_top = 215;
    var ra_y_pos_top_final = 230;
    var ra_walktime_right = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, run_speed);
    var ra_walktime_top = scr_calculate_move_distance(ra_x_pos, ra_actor.y, ra_x_pos_top, ra_y_pos_top, run_speed);
    var ra_walktime_top_right = scr_calculate_move_distance(ra_x_pos_top, ra_y_pos_top, ra_x_pos_top_right, ra_y_pos_top_final, run_speed);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_run_right);
    c_imagespeed(0.4);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime_right);
    c_delaywalkdirect(ra_walktime_right + 1, ra_x_pos_top, ra_y_pos_top, ra_walktime_top);
    c_delaywalkdirect(ra_walktime_right + 1 + ra_walktime_top + 1, ra_x_pos_top_right, ra_y_pos_top_final, ra_walktime_top_right);
    c_delaycmd4(ra_walktime_right + 1 + ra_walktime_top + 1 + ra_walktime_top_right + 1, "imagespeed", 0);
    c_delaycmd4(ra_walktime_right + 1 + ra_walktime_top + 1 + ra_walktime_top_right + 1, "autowalk", 1);
    c_delayfacing(ra_walktime_right + 1 + ra_walktime_top + 1 + ra_walktime_top_right + 1, "d");
    c_wait_if(ra_actor, "x", ">=", (camerax() + 480) - 80);
    c_var_instance(titan_hand, "floor_index", 1);
    c_var_instance(titan_hand, "pull_start", true);
    c_wait_if(titan_hand, "pull_start", "=", false);
    c_wait_if(ra_actor, "x", ">=", (camerax() + 580) - 320);
    c_var_instance(titan_hand, "floor_index", 3);
    c_var_instance(titan_hand, "pull_start", true);
    c_wait_if(ra_actor, "x", ">=", (camerax() + 780) - 320);
    c_wait_if(titan_hand, "pull_start", "=", false);
    c_var_instance(titan_hand, "floor_index", 5);
    c_var_instance(titan_hand, "pull_start", true);
    c_wait_if(ra_actor, "x", ">=", (camerax() + 980) - 320);
    c_wait_if(titan_hand, "pull_start", "=", false);
    c_var_instance(titan_hand, "floor_index", 6);
    c_var_instance(titan_hand, "pull_start", true);
    c_wait_if(ra_actor, "y", "<", ra_y_pos_top_final);
    c_wait(30);
    c_sel(ra);
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ep* Let's find a place to climb back on^1, fast.../%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_426_0");
    c_talk_wait();
    c_lerp_var_instance(overlay_controller, "x_pos_offset", overlay_controller.x_pos_offset, 16, 20);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_sel(kr);
    c_facing("d");
    c_waitcustom();
}
if (con == 4 && customcon == 1 && !d_ex())
{
    if (global.interact == 1)
    {
        con = 5;
        regain_control();
    }
}
if (con == 5)
{
    if (obj_mainchara.x >= 2880)
    {
        con = 6;
        lose_control();
    }
}
if (con == 6 && customcon == 1 && !d_ex())
{
    con = 7;
    customcon = 0;
    c_waitcustom_end();
    var run_speed = 10;
    var camera_x_pos = 2840;
    var camera_pan_time = scr_calculate_move_distance(camerax(), cameray(), camera_x_pos, cameray());
    c_pannable(1);
    c_pan(camera_x_pos, 28, camera_pan_time);
    var kr_y_pos = 234;
    var kr_x_pos = 3140;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, run_speed);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    var su_y_pos = 217;
    var su_x_pos = 3193;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, run_speed);
    c_sel(su);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "u");
    var ra_y_pos = 223;
    var ra_x_pos = 3075;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, run_speed);
    c_sel(ra);
    c_autodepth(0);
    c_depth(96000);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "u");
    c_wait(camera_pan_time + 30);
    c_msc(1447);
    c_talk_wait();
    c_waitcustom();
}
if (con == 8 && customcon == 1 && !d_ex())
{
    con = 9;
    customcon = 0;
    c_waitcustom_end();
    if (sparkle_marker == -4)
    {
        global.facing = 0;
        c_pannable(1);
        c_panobj(kr_actor, 10);
        c_wait(11);
        c_sel(kr);
        c_facing("d");
        c_wait(1);
        c_customfunc(create_sparkle);
        c_customfunc(regain_control);
    }
    c_waitcustom();
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 20;
    customcon = 0;
    if (sparkle_marker != -4)
    {
        lose_control();
        remove_sparkle();
        c_waitcustom_end();
        var camera_x_pos = 2840;
        var camera_pan_time = scr_calculate_move_distance(camerax(), cameray(), camera_x_pos, cameray());
        c_pannable(1);
        c_pan(camera_x_pos, cameray(), camera_pan_time);
        var kr_y_pos = 234;
        var kr_x_pos = 3140;
        var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos);
        c_sel(kr);
        c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
        c_delayfacing(kr_walktime + 1, "u");
        var su_y_pos = 217;
        var su_x_pos = 3193;
        var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos);
        c_sel(su);
        c_autodepth(0);
        c_depth(kr_actor.depth - 10);
        c_walkdirect(su_x_pos, su_y_pos, su_walktime);
        c_delayfacing(su_walktime + 1, "u");
        var ra_y_pos = 223;
        var ra_x_pos = 3075;
        var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos);
        c_sel(ra);
        c_autodepth(0);
        c_depth(96000);
        c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
        c_delayfacing(ra_walktime + 1, "u");
        c_wait(camera_pan_time + 60);
    }
    else
    {
        c_waitcustom_end();
    }
    c_var_lerp_to_instance(overlay_controller, "overlay_alpha", 1, 60, 2, "out");
    c_wait(60);
    c_customfunc(create_spawn);
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_wait(90);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EZ* Wh-what?^1! It's..^1. it's already spawning!?/%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_626_0");
    c_talk_wait();
    c_customfunc(hide_spawn);
    c_wait(30);
    c_var_lerp_to_instance(overlay_controller, "overlay_alpha", 0, 30);
    c_customfunc(function()
    {
        scr_tempsave();
    });
    c_waitcustom();
}
if (con == 15 && !d_ex() && global.interact == 0)
{
    con = 20;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var kr_y_pos = 234;
    var kr_x_pos = 3140;
    c_sel(kr);
    c_setxy(kr_x_pos, kr_y_pos);
    c_facing("d");
    var su_y_pos = 217;
    var su_x_pos = 3193;
    c_sel(su);
    c_autowalk(1);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_setxy(su_x_pos, su_y_pos);
    c_facing("susieunhappy");
    c_facing("d");
    var ra_y_pos = 223;
    var ra_x_pos = 3075;
    c_sel(ra);
    c_autodepth(0);
    c_depth(96000);
    c_setxy(ra_x_pos, ra_y_pos);
    c_facing("ralseiunhappy");
    c_facing("d");
    c_pannable(1);
    var camera_x_pos = 2840;
    c_pan(camera_x_pos, 28, 1);
    c_customfunc(function()
    {
        overlay_controller.base_x_pos = kr_actor.x + 28;
        overlay_controller.target = kr_actor;
        overlay_controller.x_pos_offset = 20;
    });
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 30);
    c_wait(30);
    c_customfunc(function()
    {
        with (darkness_controller)
            fade_out();
    });
    c_wait(30);
    c_var_lerp_to_instance(overlay_controller, "overlay_alpha", 0, 30);
    c_waitcustom();
}
if (con == 20 && customcon == 1 && !d_ex())
{
    con = 25;
    if (global.tempflag[97] == 0)
        global.tempflag[97] = 1;
    snd_free_all();
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("titan_spawn.ogg");
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    obj_mainchara.x = kr_x;
    obj_mainchara.y = kr_y;
    obj_mainchara.visible = 1;
    var su_x = su_actor.x;
    var su_y = su_actor.y;
    var ra_x = ra_actor.x;
    var ra_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = su_x;
            y = su_y;
        }
        else if (name == "ralsei")
        {
            x = ra_x;
            y = ra_y;
        }
        scr_caterpillar_interpolate();
        visible = 1;
    }
    with (obj_actor)
        visible = 0;
    encounterflag = 177;
    global.flag[54] = encounterflag;
    scr_battle(177, 0, 0, 0, 0);
    global.flag[9] = 1;
}
if (con == 25 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        con = 26;
        alarm[0] = 25;
        global.interact = 1;
        with (obj_mainchara)
            freeze = 1;
        scr_lerp_var_instance(overlay_controller, "overlay_alpha", overlay_controller.overlay_alpha, 0.5, 30);
        snd_volume(global.batmusic[0], 0, 25);
    }
}
if (con == 27)
{
    con = 30;
    global.interact = 1;
    global.facing = 0;
    c_waitcustom_end();
    c_mus("free_all");
    c_customfunc(function()
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("titan_tower.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        }
    });
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ep* Is..^1. everyone all right...?/", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_799_0");
    c_facenext("susie", "l");
    c_msgnextloc("\\El* Yeah..^1. let's get back on./%", "obj_dw_churchc_titanclimb1_post_slash_Step_0_gml_801_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_talk();
    c_pannable(1);
    c_panobj(kr_actor, 10);
    c_wait(11);
    c_sel(kr);
    c_facing("d");
    c_wait(1);
    c_customfunc(function()
    {
        with (obj_mainchara)
            freeze = 0;
    });
    c_customfunc(create_sparkle);
    c_customfunc(regain_control);
    c_waitcustom();
}
if (con == 50)
{
    con = 60;
    customcon = 0;
    lose_control();
    remove_sparkle();
    c_waitcustom_end();
    var camera_x_pos = 2840;
    var camera_pan_time = scr_calculate_move_distance(camerax(), cameray(), camera_x_pos, cameray());
    c_pannable(1);
    c_pan(camera_x_pos, cameray(), camera_pan_time);
    var kr_y_pos = 234;
    var kr_x_pos = 3140;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    var su_y_pos = 217;
    var su_x_pos = 3193;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos);
    c_sel(su);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "u");
    var ra_y_pos = 223;
    var ra_x_pos = 3075;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos);
    c_sel(ra);
    c_autodepth(0);
    c_depth(96000);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "u");
    c_wait(camera_pan_time + 1);
    c_wait(30);
    c_sel(kr);
    c_walk_wait("u", 4, 6);
    c_autowalk(0);
    c_sprite(spr_kris_jump_up_ready);
    c_wait(4);
    c_snd_play(snd_jump);
    c_sprite(spr_kris_jump_up);
    c_autodepth(0);
    c_depth(100810);
    c_customfunc(function()
    {
        with (kr_actor)
        {
            image_speed = 0.2;
            vspeed = -8;
            gravity = 1;
        }
    });
    c_wait(15);
    c_sel(su);
    c_walk_wait("u", 4, 5);
    c_autowalk(0);
    c_sprite(spr_susie_jump_up_ready);
    c_wait(4);
    c_snd_play(snd_jump);
    c_sprite(spr_susie_jump_up);
    c_autodepth(0);
    c_depth(100810);
    c_customfunc(function()
    {
        with (su_actor)
        {
            image_speed = 0.2;
            vspeed = -10;
            gravity = 1;
        }
    });
    c_wait(15);
    c_sel(ra);
    c_walk_wait("u", 4, 5);
    c_autowalk(0);
    c_sprite(spr_ralsei_jump_up_ready);
    c_wait(4);
    c_snd_play(snd_jump);
    c_sprite(spr_ralsei_jump_up);
    c_autodepth(0);
    c_depth(100810);
    c_customfunc(function()
    {
        with (ra_actor)
        {
            image_speed = 0.2;
            vspeed = -10;
            gravity = 1;
        }
    });
    c_wait(30);
    c_customfunc(function()
    {
        blackall.image_blend = c_black;
        scr_lerp_var_instance(blackall, "image_alpha", 0, 1, 30);
    });
    c_wait(60);
    c_waitcustom();
}
if (con == 60 && customcon == 1)
{
    con = -1;
    room_goto(room_dw_churchc_titanclimb2);
}

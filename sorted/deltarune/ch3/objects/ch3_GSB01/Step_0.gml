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
    te = actor_count + 1;
    te_actor = instance_create(493, cameray() + 274, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_hooray_armsup;
    c_sel(kr);
    c_facing("d");
    c_setxy(84, 176);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_setxy(164, 162);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_setxy(248, 166);
    c_var_instance(gameshow_screen, "screen_state", "tv_logo");
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_wait(30);
    c_sel(te);
    c_var_instance(tenna_marker, "visible", 0);
    c_wait(30);
    scr_funnytext_init(0, 0, -14, 2843, 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* WELCOME back^1, everyone^1, to the show that'll make you SCREAM at your SCREEN^1,/", "obj_ch3_GSB01_slash_Step_0_gml_56_0");
    c_msgnextloc("*\\O0 !!/%", "obj_ch3_GSB01_slash_Step_0_gml_58_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(gameshow_screen, "screen_state", "tv_logo");
    c_wait_talk();
    c_mus2("initloop", "berdly_audience.ogg", 0);
    c_var_instance(audience_cheer, "audience_active", true);
    c_var_instance(audience_cheer, "audience_show", true);
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_wait(60);
    c_mus2("volume", 0, 15);
    c_var_instance(audience_cheer, "audience_hide", true);
    c_tenna_sprite(spr_tenna_point_left);
    c_mus2("initloop", "ch3_tvtime.ogg", 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Today's episode is brought to you by our sponsor.../%", "obj_ch3_GSB01_slash_Step_0_gml_87_0");
    c_talk_wait();
    c_var_instance(gameshow_screen, "screen_state", "dark_fountain");
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_wait(30);
    scr_funnytext_init(1, -20, -30, scr_84_get_sprite("spr_funnytext_dark_fountain"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* The gushing pillar of darkness that gives us all form -&\\O1!!\\M1/%", "obj_ch3_GSB01_slash_Step_0_gml_100_0");
    c_talk_wait();
    c_wait(30);
    c_tenna_sprite(spr_tenna_whisper);
    scr_funnytext_init(2, 0, 0, scr_84_get_sprite("spr_funnytext_board"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Now available in unsettling obsidian and pulsating rainbow!/", "obj_ch3_GSB01_slash_Step_0_gml_112_0");
    c_msgnextloc("* Now^1, MIKE^1, the \\O2^1, please!/%", "obj_ch3_GSB01_slash_Step_0_gml_113_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(id, "audience_hide", true);
    c_tenna_preset(2);
    c_wait_talk();
    c_var_instance(id, "border_switch", true);
    c_sound_play(snd_item);
    c_var_instance(gameshow_screen, "screen_state", "island_board");
    c_wait(30);
    c_sel(kr);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait(30);
    c_tenna_sprite(spr_tenna_point_up);
    c_speaker("tenna");
    c_msgsetloc(0, "* Slather on that sunscreen^1, everyone^1! Because.../", "obj_ch3_GSB01_slash_Step_0_gml_145_0");
    c_msgnextloc("* Today's second - and FINAL - board will be an aquatic adventure to a desert island!/", "obj_ch3_GSB01_slash_Step_0_gml_146_0");
    c_msgnextloc("* That's right -- an all-expenses paid trip to a beautiful tropical paradise!!/", "obj_ch3_GSB01_slash_Step_0_gml_148_0");
    c_msgnextloc("* Haha^1! Wish I could go but I'm just a big electric box attached to the wall!^1! Haha!!/", "obj_ch3_GSB01_slash_Step_0_gml_150_0");
    scr_funnytext_init(3, 0, 0, scr_84_get_sprite("spr_funnytext_tan"), 0, 0);
    c_msgnextloc("* \\O3\\M2/%", "obj_ch3_GSB01_slash_Step_0_gml_154_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_point_up_twofingers);
    c_wait_box(2);
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium);
    c_imageindex(1);
    c_wait_box(3);
    c_var_instance(gameshow_screen, "screen_state", "tv_fallen");
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.2);
    c_wait_box(4);
    c_var_instance(gameshow_screen, "screen_state", "tv_sepia");
    c_tenna_sprite(spr_tenna_whisper);
    c_halt();
    c_wait_talk();
    c_wait(30);
    c_var_instance(gameshow_screen, "screen_state", "island_board");
    c_tenna_preset(2);
    c_speaker("tenna");
    c_msgsetloc(0, "* For this BOARD's GOAL^1, you'll be aiming to enter the floating ATLANTIS STADIUM!/", "obj_ch3_GSB01_slash_Step_0_gml_187_0");
    c_msgnextloc("* Legend has it^1, the best way there is our super high budget RAINBOW BRIDGE!/", "obj_ch3_GSB01_slash_Step_0_gml_189_0");
    c_msgnextloc("* However^1, the RAINBOW only appears if TWO \\O4 meet at LOVER'S CLIFF!/", "obj_ch3_GSB01_slash_Step_0_gml_191_0");
    c_msgnextloc("* By the way^1, don't forget to take lots of PHOTOS while you're on vacation!/", "obj_ch3_GSB01_slash_Step_0_gml_193_0");
    c_msgnextloc("* Now^1, we're gonna have some real fun in the sun today^1, SO DON'T TOUCH THAT DIAL!/", "obj_ch3_GSB01_slash_Step_0_gml_195_0");
    c_msgnextloc("* \\O5/%", "obj_ch3_GSB01_slash_Step_0_gml_197_0");
    c_msgnextloc("* Now^1, without further ado.../%", "obj_ch3_GSB01_slash_Step_0_gml_198_0");
    c_talk();
    c_wait_box(2);
    c_tenna_sprite(spr_tenna_pose);
    scr_funnytext_init(4, 0, -10, scr_84_get_sprite("spr_funnytext_lovers"), 0, 0);
    c_wait_box(3);
    c_tenna_sprite(spr_tenna_whisper);
    c_wait_box(4);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_wait_box(5);
    scr_funnytext_init(5, 0, 0, scr_84_get_sprite("spr_funnytext_gentle"), 0, 0);
    c_tenna_sprite(spr_tenna_whisper);
    c_wait_box(6);
    c_tenna_sprite(spr_tenna_hooray_armsup);
    c_wait_talk();
    c_mus("free_all");
    c_tenna_sprite(spr_tenna_point_at_screen);
    c_wait(15);
    c_var_instance(tv_time, "show_text", true);
    c_wait(10);
    c_wait_if(tv_time, "is_active", "=", false);
    c_var_instance(id, "screen_wipe_start", true);
    c_var_instance(audience_cheer, "audience_active", false);
    c_wait(100);
    c_mus("free_all");
    c_terminatekillactors();
}
if (global.flag[20] == 1)
{
    global.flag[20] = 0;
    audience_con++;
    if (audience_con == 1)
        audience_show = true;
}
if (global.flag[20] == 2)
{
    laugh_con++;
    if (laugh_con == 1)
        laugh_track = true;
}
if (laugh_track)
{
    laugh_track_timer++;
    if (laugh_track_timer == 1)
        snd_play(snd_laughtrack_short_temp);
    if (laugh_track_timer >= 30 && !d_ex())
    {
        laugh_track = false;
        laugh_track_timer = 0;
        laugh_con = 0;
        global.flag[20] = 0;
    }
}
if (audience_show)
{
    audience_show = false;
    var cheer_audio = snd_init("berdly_audience.ogg");
    cheer_loop = mus_loop(cheer_audio);
    with (audience_cheer)
    {
        audience_active = true;
        audience_show = true;
    }
}
if (audience_hide)
{
    audience_hide = false;
    mus_fade(cheer_loop, 15);
    with (audience_cheer)
        audience_hide = true;
}
if (screen_wipe_start)
{
    screen_wipe_start = false;
    global.plot = 130;
    con = -1;
    if (i_ex(obj_ch3_screen_wipe))
    {
        with (obj_ch3_screen_wipe)
            instance_destroy();
    }
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.target_room = room_board_2;
    screen_wipe.start = true;
}
if (border_switch)
{
    border_switch = false;
    with (obj_border_controller)
        set_border(border_dw_blue_stars);
}

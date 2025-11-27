if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    with (obj_mainchara)
    {
        x = 0;
        y = 0;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_kris_run_down);
    c_imagespeed(0.25);
    c_setxy(145, -40);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_delaycmd4(100, "var", id, "deep_audio_start", true);
    c_sel(su);
    c_walkdirect(145, 970, 200);
    c_delaywalkdirect(201, 30, 1053, 30);
    c_delaywalkdirect(231, 30, 1105, 20);
    c_delaycmd(251, "sprite", spr_susie_kris_run_right_shocked);
    c_delaycmd4(251, "addxy", -16, 27, 0, 0);
    c_delaycmd(251, "imagespeed", 0);
    c_delaycmd(251, "imageindex", 1);
    c_delaycmd(255, "imageindex", 2);
    c_delaycmd(259, "imageindex", 3);
    c_delaywalkdirect(251, 64, 1132, 10);
    c_delaycmd(261, "sprite", spr_susie_kris_stop_recoil);
    c_delaycmd(261, "imagespeed", 0);
    c_delaycmd(261, "imageindex", 0);
    c_delaycmd(265, "imageindex", 1);
    c_delaycmd(269, "imageindex", 2);
    c_delaycmd(273, "imageindex", 3);
    c_delaycmd(277, "imageindex", 4);
    c_wait(30);
    c_pannable(1);
    c_pan(0, 1000, 190);
    c_wait(15);
    c_wait(209);
    c_waitcustom();
}
if (con == 3 && customcon == 1)
{
    con = 4;
    with (smoke)
        instance_destroy();
}
if (con == 4 && customcon == 1)
{
    con = 5;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "deep_audio_stop", true);
    c_mus2("free_all");
    c_soundplay(snd_locker);
    c_var_instance(shelter_marker, "sprite_index", spr_shelter);
    c_shake();
    c_wait(30);
    c_sel(su);
    c_imagespeed(0);
    c_imageindex(0);
    c_sprite(spr_susie_kris_stop_run);
    c_wait(6);
    c_imageindex(1);
    c_sel(kr);
    c_autodepth(0);
    c_depth(su_actor.depth - 100);
    c_setxy(67, 1135);
    c_facing("r");
    c_visible(1);
    c_sel(kr);
    c_walkdirect(120, 1155, 15);
    c_delayfacing(16, "u");
    c_sel(su);
    c_sprite(spr_susie_diagonal_run);
    c_imageindex(0);
    c_var_lerp_to("image_index", 5, 8);
    c_walkdirect_wait(113, su_actor.y - 1, 8);
    c_wait(1);
    c_sprite(spr_susie_diagonal_run_transition);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(4);
    c_imageindex(3);
    c_wait(4);
    c_sprite(spr_susie_bang_door_up);
    c_imageindex(0);
    c_setxy(145, su_actor.y - 4);
    c_imageindex(0);
    c_var_instance(id, "hit_door", true);
    c_msgside("top");
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* HEY^1! HEY OPEN UP!/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_180_0");
    c_msgnextloc("* Undyne...^1! Officer Undyne^1, say something!!/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_142_0");
    c_msgnextloc("* H-hey..^1. hey^1, this is a joke^1, right!?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_143_0");
    c_msgnextloc("* You're about to come out of there^1, right!?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_144_0");
    c_msgnextloc("* .../%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_145_0");
    c_talk_wait();
    c_wait(15);
    c_wait_if(id, "punch_timer", "=", 0);
    c_var_instance(id, "punch_anim", 8);
    c_wait_if(id, "punch_timer", "=", 0);
    c_var_instance(id, "punch_anim", 12);
    c_wait_if(id, "punch_timer", "=", 0);
    c_shake();
    c_var_instance(id, "panel_fall", true);
    c_var_instance(id, "hit_door", false);
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_surprised_subtle);
    c_walk("l", 2, 8);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(30);
    c_imagespeed(0.2);
    c_walkdirect_wait(170, su_actor.y - 4, 18);
    c_autowalk(1);
    c_facing("u");
    c_halt();
    c_var_instance(id, "crickets_start", true);
    c_wait(15);
    c_sprite(spr_susie_head_down);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* What the..^1. what the hell is this?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_226_0");
    c_msgnextloc("* It's some sort of..^1. electronic..^1. lock?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_227_0");
    c_msgnextloc("* Kris^1, what the hell is going on...!?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_228_0");
    c_msgnextloc("* Why..^1. why did they take Undyne in here?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_229_0");
    c_msgnextloc("* And..^1. why were they trying to take..^1. Toriel?/%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_230_0_b");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_walk_up_lw);
    c_wait_box(2);
    c_sprite(spr_susie_head_down_left);
    c_wait_box(3);
    c_sprite(spr_susie_walk_up_lw);
    c_wait_box(4);
    c_sprite(spr_susie_head_down);
    c_halt();
    c_wait_talk();
    c_wait(1);
    c_autowalk(0);
    c_sprite(spr_susie_diagonal_run_transition);
    c_addxy(-32, 4);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(4);
    c_imageindex(3);
    c_wait(4);
    c_sprite(spr_susie_bang_door_up);
    c_snd_play(snd_impact);
    c_shake();
    c_addxy(32, -3);
    c_halt();
    c_wait(15);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\Ec* What the hell are they doing^1, Kris? Like^1, if the cops.../%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_201_0");
    c_talk();
    c_wait_talk();
    c_wait(30);
    c_var_instance(id, "punch_anim", 4);
    c_var_instance(id, "hit_door", true);
    c_wait_if(id, "punch_timer", "=", 0);
    c_shake();
    c_var_instance(id, "hit_door", false);
    c_wait(15);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* .../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_213_0");
    c_msgnextloc("* It's no good..^1. the door^1, it's solid steel.../%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_214_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_bang_door_up);
    c_halt();
    c_wait_talk();
    c_wait(15);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* This..^1. weird panel. If we could just..^1. get someone to tell us how it works.../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_230_0");
    c_msgnextloc("* But..^1. we can't^1, right?/%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_231_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_bang_door_stop);
    c_imageindex(1);
    c_wait_talk();
    c_wait(30);
    c_sprite(spr_susie_slump_arms_lower);
    c_imageindex(0);
    c_var_lerp_to("image_index", 3, 30);
    c_wait(30);
    c_sprite(spr_susie_slump_arms_down);
    c_imageindex(0);
    c_wait(6);
    c_imageindex(1);
    c_wait(19);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* We can't tell anyone about this^1, right? Because.../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_247_0");
    c_msgnextloc("* ..^1. Because you saw that smoke^1, right^1, Kris?/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_248_0_b");
    c_msgnextloc("* There's..^1. gotta be a dark world in there./", "obj_ch3_PTB04_shelter_slash_Step_0_gml_249_0");
    c_msgnextloc("* ..^1. if anybody else went in there^1, they'd.../%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_250_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_head_down);
    c_wait_box(2);
    c_sprite(spr_susie_head_down_right);
    c_wait_box(3);
    c_sprite(spr_susie_head_down);
    c_wait_talk();
    c_sel(su);
    c_emote("!", 30);
    c_sprite(spr_susie_walk_up_lw);
    c_wait(30);
    c_autowalk(0);
    c_sprite(spr_susie_diagonal_run_transition);
    c_addxy(-32, 4);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(4);
    c_imageindex(3);
    c_wait(4);
    c_sprite(spr_susie_bang_door_up);
    c_snd_play(snd_impact);
    c_shake();
    c_addxy(32, -3);
    c_halt();
    c_wait(15);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* .../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_273_0");
    c_msgnextloc("* Toriel...^1! She's still in the.../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_274_0");
    c_msgnextloc("* .../%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_275_0");
    c_talk();
    c_wait_box(1);
    c_wait_box(2);
    c_wait_talk();
    c_wait(15);
    c_sprite(spr_susie_bang_door_up);
    c_halt();
    c_var_instance(id, "punch_anim", 4);
    c_var_instance(id, "hit_door", true);
    c_wait_if(id, "punch_timer", "=", 0);
    c_shake();
    c_var_instance(id, "hit_door", false);
    c_wait(15);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* Damn it. I..^1. I hate to give up here^1, Kris^1, but.../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_276_0");
    c_msgnextloc("* I.../%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_277_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_slump_arms_lower);
    c_imageindex(0);
    c_var_lerp_to("image_index", 3, 30);
    c_wait(30);
    c_sprite(spr_susie_slump_arms_down);
    c_imageindex(0);
    c_wait(6);
    c_imageindex(1);
    c_wait(15);
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_walk_head_down);
    c_imageindex(0);
    c_imagespeed(0.1);
    c_walkdirect_wait(76, 1125, 80);
    c_halt();
    c_wait(90);
    c_imagespeed(0.2);
    c_walkdirect_wait(25, 1125, 60);
    c_halt();
    c_sel(kr);
    c_facing("u");
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* .../", "obj_ch3_PTB04_shelter_slash_Step_0_gml_306_0");
    c_msgnextloc("* Let's..^1. just go seal that fountain./%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_307_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susieu);
    c_imagespeed(0.2);
    c_walkdirect(25, 1084, 30);
    c_delaywalkdirect(16, 143, 1010, 90);
    c_delaywalkdirect(106, 143, 940, 60);
    c_wait(200);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(177, 1133, 60);
    c_halt();
    c_wait(30);
    c_waitcustom();
}
if (con == 5 && customcon == 1 && !d_ex())
{
    con = 6;
    scr_speaker("no_name");
    global.typer = 2;
    msgsetloc(0, "* (On the shelter was a strange panel.)/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_485_0");
    msgnextloc("* (It looked like a digital security lock...)/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_486_0");
    msgnextloc("* (There were three entry fields^1, and three symbols besides them.)/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_487_0");
    msgnextloc("* (One^3 had a pine tree beside it.)/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_488_0");
    msgnextloc("* (One^3 had an officer's badge beside it.)/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_489_0");
    msgnextloc("* (And one^3 had the DELTA RUNE.)/", "obj_ch3_PTB04_shelter_slash_Step_0_gml_490_0");
    msgnextloc("* (...)/%", "obj_ch3_PTB04_shelter_slash_Step_0_gml_491_0");
    var d = d_make();
    d.side = 0;
}
if (con == 6 && !d_ex())
{
    con = 7;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "crickets_stop", true);
    c_sel(kr);
    c_walk("d", 0.4, 16);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_wait(60);
    c_sound_play_x(snd_dooropen, 1, 0.2);
    c_sound_play_x(snd_dooropen, 1, 0.3);
    c_var_instance(shelter_marker, "sprite_index", spr_shelter_open_door);
    c_var_instance(shelter_marker, "image_speed", 0);
    c_var_instance(shelter_marker, "image_index", 0);
    c_wait(8);
    c_var_instance(shelter_marker, "image_index", 1);
    c_wait(8);
    c_var_instance(shelter_marker, "image_index", 2);
    c_wait(8);
    c_var_instance(shelter_marker, "image_index", 3);
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_wait(15);
    c_wait(238);
    c_var_instance(id, "border_hide", true);
    c_wait(2);
    c_var_instance(blackall, "image_alpha", 1);
    c_mus("free_all");
    c_waitcustom();
}
if (con == 7 && customcon == 1)
{
    con = 8;
    if (global.flag[930] == 0 && scr_keyitemcheck(2) == 0)
    {
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_3);
    }
    with (obj_event_manager)
        trigger_event(UnknownEnum.Value_2, UnknownEnum.Value_1);
    scr_complete_save_file();
}
if (con == 8 && customcon == 1)
{
    con = 9;
    customcon = 0;
    c_waitcustom_end();
    c_wait(60);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 9 && !i_ex(obj_cutscene_master))
{
    global.plot = 350;
    con = 99;
    snd_free_all();
    room_goto(room_ed);
}
if (hit_door)
{
    hit_timer--;
    if (hit_timer <= 0 && !hit_finished)
    {
        punch_timer++;
        if (punch_timer == 1)
        {
            su_actor.image_speed = 0;
            su_actor.image_index = 0;
            snd_play(snd_impact);
        }
        if (punch_timer == (1 + punch_anim))
            su_actor.image_index = 1;
        if (punch_timer == (1 + (punch_anim * 2)))
            su_actor.image_index = 2;
        if (punch_timer == (1 + (punch_anim * 3)))
            su_actor.image_index = 3;
        if (punch_timer == (1 + (punch_anim * 4)))
            su_actor.image_index = 4;
        if (punch_timer >= (1 + (punch_anim * 4) + 2))
            punch_timer = 0;
    }
}
if (deep_audio_start)
{
    deep_audio_start = false;
    var deep_audio = snd_init("deep_noise.ogg");
    deep_loop = mus_loop(deep_audio);
    mus_volume(deep_loop, 0, 0);
    mus_volume(deep_loop, 1, 60);
}
if (deep_audio_stop)
{
    deep_audio_stop = false;
    mus_volume(deep_loop, 0, 30);
}
if (crickets_start)
{
    crickets_start = false;
    if (crickets_track == -4)
    {
        var crickets_audio = snd_init("night_ambience.ogg");
        crickets_track = mus_loop(crickets_audio);
        mus_volume(crickets_track, 0, 0);
        mus_volume(crickets_track, 0.5, 60);
    }
}
if (crickets_stop)
{
    crickets_stop = false;
    mus_volume(crickets_track, 0, 30);
}
if (border_hide)
{
    border_hide = false;
    with (obj_border_controller)
    {
        hide_border();
        stop_custom_effect();
    }
}
if (panel_fall)
{
    panel_fall = false;
    with (obj_town_shelter_event)
        panel_fall = true;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}

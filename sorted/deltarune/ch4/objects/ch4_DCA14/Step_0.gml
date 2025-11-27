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
    c_sel(kr);
    c_setxy(150, 240);
    c_walkdirect(150, 120, 60);
    c_delaywalkdirect(61, 124, 120, 16);
    c_delayfacing(78, "u");
    c_sel(su);
    c_facing("susieunhappy");
    c_setxy(148, 260);
    c_walkdirect(148, 114, 90);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(60);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Hey old man^1, you sleeping in here?/%", "obj_ch4_DCA14_slash_Step_0_gml_42_0");
    c_talk_wait();
    c_wait_if(su_actor, "image_index", "<=", 0);
    c_wait(15);
    c_sel(su);
    c_facing("l");
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. guess not.../%", "obj_ch4_DCA14_slash_Step_0_gml_54_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(118, 111, 12);
    c_delaycmd(13, "imagespeed", 0);
    c_delaycmd(13, "imageindex", 0);
    c_sel(su);
    c_facing("u");
    c_walkdirect_wait(156, 98, 12);
    c_walkdirect_wait(156, 73, 12);
    c_walkdirect_wait(132, 73, 12);
    c_facing("d");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Hey^1, this is that priest guy's desk./", "obj_ch4_DCA14_slash_Step_0_gml_76_0");
    c_msgnextloc("\\E0* The code to the door could be in here.../%", "obj_ch4_DCA14_slash_Step_0_gml_77_0");
    c_talk_wait();
    c_sel(kr);
    c_autodepth(0);
    c_depth(98450);
    c_sel(su);
    c_walkdirect_wait(132, 77, 6);
    c_snd_play(snd_noise);
    c_snd_play(snd_wing);
    c_autowalk(0);
    c_sprite(spr_susie_drawer_rummage_start);
    c_halt();
    c_autodepth(0);
    c_depth(98460);
    c_var_lerp_to("image_index", 2, 8);
    c_wait(15);
    c_sprite(spr_susie_drawer_rummage_loop);
    c_imagespeed(0.2);
    c_wait(30);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Huh...?/", "obj_ch4_DCA14_slash_Step_0_gml_108_0");
    c_msgnextloc("\\EZ* Dude^1, there's a glass case in here./", "obj_ch4_DCA14_slash_Step_0_gml_109_0");
    c_msgnextloc("\\EK* But..^1. it's weird. The outside is clean^1, but.../%", "obj_ch4_DCA14_slash_Step_0_gml_110_0");
    c_talk_wait();
    c_sel(su);
    c_imagespeed(0.2);
    c_wait(16);
    c_halt();
    c_sprite(spr_susie_drawer_remove);
    c_halt();
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    con = 4;
    anim_player.init(su_actor, 1283, anim_timestamps);
    anim_player.event_connect("frame_change", snd_play, 5, [261]);
    anim_player.event_connect("anim_end", continue_cutscene);
    anim_player.start();
}
if (con == 5 && customcon == 1 && !d_ex())
{
    con = 6;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw_unhappy);
    c_depth(98790);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* The inside is..^1. covered in dust?/%", "obj_ch4_DCA14_slash_Step_0_gml_150_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(0);
    c_walkdirect(kr_actor.x, 120, 12);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(4);
    c_imageindex(3);
    c_wait(4);
    c_imageindex(0);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* ..^1. huh? Dude^1, it's just a dusty.../%", "obj_ch4_DCA14_slash_Step_0_gml_170_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_wall_walk);
    c_emote("!", 30);
    c_wait(30);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(142, 70, 12);
    c_halt();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* H..^1. hell no^1, you don't mean.../", "obj_ch4_DCA14_slash_Step_0_gml_187_0");
    c_msgnextloc("\\Ec* When monsters die^1, their dust is..^1. is buried.../%", "obj_ch4_DCA14_slash_Step_0_gml_188_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_wall_back);
    c_halt();
    c_var_lerp_to("image_index", 5, 12);
    c_walkdirect_wait(152, 60, 12);
    c_snd_play(snd_bump);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* Hey^1, Kris!?/", "obj_ch4_DCA14_slash_Step_0_gml_201_0");
    c_msgnextloc("\\Eb* Why the hell does the pastor have that in his...!?/%", "obj_ch4_DCA14_slash_Step_0_gml_202_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_wall_point);
    c_imagespeed(0.2);
    c_wait_talk();
    c_sel(su);
    c_emote("?", 30, 12, 8);
    c_halt();
    c_wait(30);
    c_sel(su);
    c_snd_play(snd_noise);
    c_sprite(spr_susie_walk_down_shock);
    c_halt();
    c_wait(30);
    c_imagespeed(0.2);
    c_walkdirect_wait(142, 66, 30);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* Huh? There's a hammer inside..^1. and a.../%", "obj_ch4_DCA14_slash_Step_0_gml_229_0");
    c_talk_wait();
    c_imagespeed(0.2);
    c_walkdirect_wait(132, 76, 30);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\Ec* ..^1. A photo of.../%", "obj_ch4_DCA14_slash_Step_0_gml_238_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_wall_walk);
    c_imagespeed(0.2);
    c_walkdirect_wait(132, 70, 10);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* The old man!?/%", "obj_ch4_DCA14_slash_Step_0_gml_250_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 6 && customcon == 1 && !d_ex())
{
    con = 7;
    alarm[0] = 90;
    with (obj_room_church_office)
        show_lightning();
}
if (con == 8 && customcon == 1 && !d_ex())
{
    con = 9;
    customcon = 0;
    global.plot = 220;
    with (obj_caterpillarchara)
        init_clothes = false;
    c_waitcustom_end();
    c_wait(60);
    c_sel(su);
    c_autowalk(1);
    c_facing("d");
    c_waitcustom();
}
if (con == 9 && customcon == 1)
{
    con = 10;
    if (!snd_is_playing(music_track[1]))
    {
        music_track[0] = snd_init("noelle_normal.ogg");
        music_track[1] = mus_loop_ext(music_track[0], 0.7, 1);
    }
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 11;
    customcon = 0;
    c_waitcustom_end();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. The old man.../", "obj_ch4_DCA14_slash_Step_0_gml_310_0");
    c_msgnextloc("\\EV* I don't really get it^1, but.../", "obj_ch4_DCA14_slash_Step_0_gml_311_0");
    c_msgnextloc("\\EV* Somehow^1, the Dark World^1, it.../", "obj_ch4_DCA14_slash_Step_0_gml_312_0");
    c_msgnextloc("\\ED* For a moment^1, it must've like..^1. revived him./", "obj_ch4_DCA14_slash_Step_0_gml_313_0");
    c_msgnextloc("\\ER* .../", "obj_ch4_DCA14_slash_Step_0_gml_314_0");
    c_msgnextloc("\\ES* ..^1. But^1, I think he knew.../", "obj_ch4_DCA14_slash_Step_0_gml_315_0");
    c_msgnextloc("\\ER* I think he knew he was.../%", "obj_ch4_DCA14_slash_Step_0_gml_316_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("r");
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_head_down_right);
    c_wait_box(3);
    c_sel(su);
    c_facing("d");
    c_wait_box(5);
    c_sel(su);
    c_facing("r");
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_head_down_right);
    c_wait_talk();
    c_wait(60);
    c_sel(su);
    c_facing("d");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\ET* Kris^1, he wanted me to write a letter./", "obj_ch4_DCA14_slash_Step_0_gml_350_0");
    c_msgnextloc("\\ES* A letter to \"Alvin\"..^1. I think that's..^1. this pastor guy./", "obj_ch4_DCA14_slash_Step_0_gml_351_0");
    c_msgnextloc("\\ED* .../", "obj_ch4_DCA14_slash_Step_0_gml_352_0");
    c_msgnextloc("\\ED* Gimme a sec./%", "obj_ch4_DCA14_slash_Step_0_gml_353_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("l");
    c_wait_box(2);
    c_sel(su);
    c_facing("d");
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(132, 76, 30);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(120);
    c_var_instance(letter_marker, "visible", 1);
    c_sel(kr);
    c_setxy(100, 120);
    c_facing("u");
    c_sel(su);
    c_setxy(124, 113);
    c_facing("u");
    c_depth(98450);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_waitcustom();
}
if (con == 11 && customcon == 1 && !d_ex())
{
    con = 12;
    mus_volume(music_track[1], 0, 90);
}
if (con == 12 && customcon == 1 && !d_ex())
{
    con = 13;
    customcon = 0;
    c_waitcustom_end();
    c_wait(90);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_speaker("susie");
    c_msgsetloc(0, "\\ES* Alright. Got it./", "obj_ch4_DCA14_slash_Step_0_gml_418_0");
    c_msgnextloc("\\ET* Let's go^1, Kris./%", "obj_ch4_DCA14_slash_Step_0_gml_419_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 13 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    con = -1;
    if (!snd_is_playing(music_track[1]))
        snd_free(music_track[0]);
    mus_volume(global.currentsong[1], 1, 30);
    mus_volume(global.currentsong[3], 1, 30);
    var case_readable = instance_create(136, 118, obj_readable_room1);
    with (case_readable)
    {
        extflag = "case";
        image_yscale = 0.5;
    }
}

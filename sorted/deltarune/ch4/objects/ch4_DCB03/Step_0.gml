if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
    if (array_length(global.currentsong) <= 2 || !snd_is_playing(global.currentsong[3]))
    {
        global.currentsong[2] = snd_init("raining_in_church2.ogg");
        global.currentsong[3] = mus_loop(global.currentsong[2]);
        mus_volume(global.currentsong[3], 0, 0);
        mus_volume(global.currentsong[3], 0.75, 30);
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(296, 90);
    c_sel(su);
    c_setxy(324, 82);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. Back again./", "obj_ch4_DCB03_slash_Step_0_gml_52_0");
    c_msgnextloc("\\EV* .../%", "obj_ch4_DCB03_slash_Step_0_gml_53_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_head_down_left);
    c_wait_talk();
    c_wait(15);
    c_sel(kr);
    c_delayfacing(6, "u");
    c_sel(su);
    c_walkdirect_wait(309, 63, 16);
    c_wait(30);
    c_autowalk(0);
    c_sprite(spr_susie_door_interactions);
    c_halt();
    c_wait(30);
    c_snd_play(snd_noise);
    c_var_instance(door_lock, "visible", 0);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_head_down_left_more);
    c_speaker("susie");
    c_msgsetloc(0, "\\EO* ..^1. huh..^1. it really worked./%", "obj_ch4_DCB03_slash_Step_0_gml_93_0");
    c_talk_wait();
    c_sel(su);
    c_facing("u");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Now.../%", "obj_ch4_DCB03_slash_Step_0_gml_101_0");
    c_talk_wait();
    c_sprite(spr_susie_door_interactions);
    c_imageindex(5);
    c_lerp_var_instance(su_actor, "image_index", 5, 8, 12);
    c_wait_if(su_actor, "image_index", ">=", 6);
    c_var_instance(darkness_vfx, "is_active", true);
    c_mus("free_all");
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("pitch", 0.6, 0);
    c_mus2("volume", 1, 150);
    c_mus2("pitch", 1.5, 150);
    c_var_instance(door_vfx, "open_door", true);
    c_wait(30);
    c_sel(su);
    c_facing("u");
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(324, 72, 12);
    c_delaycmd(13, "imagespeed", 0);
    c_sel(kr);
    c_walkdirect(296, 80, 12);
    c_wait_if(darkness_vfx, "ceiltimer", ">=", 600);
    c_mus2("volume", 0, 60);
    c_wait_if(darkness_vfx, "ceiltimer", ">=", 800);
    c_wait(30);
    c_waitcustom();
}
if (con == 3 && customcon == 1)
{
    con = -1;
    global.interact = 1;
    if (array_length(global.currentsong) >= 2)
        snd_free(global.currentsong[2]);
    snd_free_all();
    scr_become_dark();
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_dw_church_knightclimb_post);
}

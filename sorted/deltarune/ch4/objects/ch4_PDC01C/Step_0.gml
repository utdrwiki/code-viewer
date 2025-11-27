if (con < 0)
    exit;
if (con == 0 && global.plot == 10 && obj_mainchara.x < 395)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    if (!i_ex(obj_caterpillarchara))
    {
        if (!scr_havechar(2))
            scr_getchar(2);
        scr_makecaterpillar(-100, -100, 2, 0);
    }
    with (obj_caterpillarchara)
    {
        follow = 0;
        visible = 0;
    }
}
if (con == 2)
{
    con = 3;
    global.plot = 11;
    with (obj_mainchara)
        init_clothes = false;
    with (obj_caterpillarchara)
        init_clothes = false;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    actor_talker = instance_create(0, 0, obj_actor_talk);
    to = actor_count + 1;
    to_actor = instance_create(toriel_marker.x, toriel_marker.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = spr_toriel_dt;
    c_var_instance(actor_talker, "talking_actor", to_actor);
    c_var_instance(actor_talker, "paused", true);
    c_var_instance(toriel_marker, "visible", 0);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_breakfast_eating_loop);
    c_setxy(susie_marker.x, susie_marker.y);
    c_autodepth(0);
    c_depth(susie_marker.depth);
    c_imagespeed(susie_marker.image_speed);
    c_imageindex(susie_marker.image_index);
    c_var_instance(susie_marker, "visible", 0);
    c_pannable(1);
    c_pan(175, cameray(), 60);
    c_sel(kr);
    c_walkdirect_wait(305, 161, 60);
    c_wait(5);
    c_facing("d");
    c_sel(to);
    c_walkdirect_wait(278, 147, 30);
    c_wait(5);
    c_autowalk(0);
    c_halt();
    c_sel(kr);
    c_visible(0);
    c_sel(to);
    c_sprite(spr_toriel_kris_pinch_cheek);
    c_setxy(279, 147);
    c_imagespeed(0.15);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E9* Oh^1, Kris. You were sleeping like a puppy./", "obj_ch4_PDC01C_slash_Step_0_gml_105_0");
    c_msgnextloc("\\E0* Did you rest well?/%", "obj_ch4_PDC01C_slash_Step_0_gml_106_0");
    c_talk_wait();
    c_halt();
    c_sprite(spr_toriel_kris_pinch_cheek_concerned);
    c_wait(15);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E3* Come to think of it^1, I had some very strange dreams./%", "obj_ch4_PDC01C_slash_Step_0_gml_115_0");
    c_talk_wait();
    c_sel(kr);
    c_visible(1);
    c_sel(to);
    c_sprite(spr_toriel_r);
    c_imagespeed(0.25);
    c_walkdirect_wait(249, 147, 15);
    c_sprite(spr_toriel_d);
    c_walk_wait("d", 3, 3);
    c_halt();
    c_wait(5);
    c_var_instance(actor_talker, "paused", false);
    c_sprite(spr_toriel_dt);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E4* Oh well^1! No more TV just before bed!/%", "obj_ch4_PDC01C_slash_Step_0_gml_136_0");
    c_talk_wait();
    c_halt();
    c_sel(su);
    c_sprite(spr_susie_breakfast_eating_talking);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Kris^1, how the hell'd you sleep through breakfast like THIS!?/", "obj_ch4_PDC01C_slash_Step_0_gml_147_0");
    c_msgnextloc("\\E5* Butterscotch pancakes? INFINITE omelettes?/", "obj_ch4_PDC01C_slash_Step_0_gml_148_0");
    c_msgnextloc("\\EL* Living like this's gotta be a sin./", "obj_ch4_PDC01C_slash_Step_0_gml_149_0");
    c_facenext("toriel", 0);
    c_msgnextloc("\\E0* Oh^1, sinning^1! That reminds me!/", "obj_ch4_PDC01C_slash_Step_0_gml_151_0");
    c_msgnextloc("\\E4* Susie^1, how would you like to go to service with us today?/%", "obj_ch4_PDC01C_slash_Step_0_gml_152_0");
    c_talk();
    c_wait_box(4);
    c_sel(to);
    c_sprite(spr_toriel_dt);
    c_wait_box(5);
    c_sel(to);
    c_imagespeed(0);
    c_sprite(spr_toriel_down_right);
    c_sel(su);
    c_sprite(spr_susie_breakfast_looking_loop);
    c_halt();
    c_waittalk();
    c_sel(to);
    c_halt();
    c_wait(5);
    c_sel(su);
    c_imageindex(1);
    c_wait(90);
    c_imageindex(2);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_breakfast_polite_eating_loop);
    c_imageindex(0);
    c_wait(10);
    c_imageindex(1);
    c_soundplay(snd_swallow);
    c_wait(10);
    c_sprite(spr_susie_breakfast_polite_look);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Sure./%", "obj_ch4_PDC01C_slash_Step_0_gml_203_0");
    c_talk_wait();
    c_var_instance(actor_talker, "paused", true);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_laugh);
    c_imagespeed(0.25);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E9* Oh^1, wonderful^1! Just let me find some clothes for you.../", "obj_ch4_PDC01C_slash_Step_0_gml_215_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* Peachy./%", "obj_ch4_PDC01C_slash_Step_0_gml_217_0");
    c_talk();
    c_wait_box(2);
    c_sel(to);
    c_sprite(spr_toriel_d);
    c_imagespeed(0.25);
    c_walk_wait("u", 3, 3);
    c_halt();
    c_autowalk(1);
    c_walk_wait("l", 3, 60);
    c_waittalk();
    c_soundplay(snd_escaped);
    c_wait(60);
    c_snd_play(snd_wing);
    c_sel(su);
    c_sprite(spr_susie_breakfast_mad);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* THE HELL!? WE HAVE TO GO TO CHURCH!?/", "obj_ch4_PDC01C_slash_Step_0_gml_245_0");
    c_msgnextloc("\\EC* Damn it. I KNEW these pancakes were a trap./%", "obj_ch4_PDC01C_slash_Step_0_gml_246_0");
    c_talk_wait();
    c_wait(5);
    c_snd_play(snd_wing);
    c_sel(kr);
    c_walk_wait("r", 3, 8);
    c_walkdirect(327, 133, 15);
    c_delayfacing(16, "r");
    c_var_instance(plate_marker, "visible", 1);
    c_var_instance(chair_marker, "depth", 10000);
    c_var_instance(chair_left_marker, "depth", 10000);
    c_sel(su);
    c_autowalk(1);
    c_autodepth(1);
    c_var_lerp_to_instance(plate_marker, "x", plate_marker.x - 10, 5);
    c_walkdirect_wait(350, 127, 15);
    c_facing("r");
    c_wait(5);
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Well^1, time for me to get the hell out.../%", "obj_ch4_PDC01C_slash_Step_0_gml_279_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_sheeh_lw);
    c_addxy(0, 1);
    c_shakeobj();
    c_snd_play(snd_noise);
    c_emote("!", 30);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Kris. Wait a sec./", "obj_ch4_PDC01C_slash_Step_0_gml_292_0");
    c_msgnextloc("\\E1* You..^1. Remember last night^1, right?/", "obj_ch4_PDC01C_slash_Step_0_gml_296_0");
    c_msgnextloc("\\ED* Undyne..^1. that place she was taken to./", "obj_ch4_PDC01C_slash_Step_0_gml_300_0");
    c_msgnextloc("\\E0* The shelter./", "obj_ch4_PDC01C_slash_Step_0_gml_301_0");
    c_msgnextloc("\\E1* ..^1. it's like..^1. close to the church^1, right?/", "obj_ch4_PDC01C_slash_Step_0_gml_305_0");
    c_msgnextloc("\\E0* It's probably a long shot^1, but.../", "obj_ch4_PDC01C_slash_Step_0_gml_306_0");
    c_msgnextloc("\\E1* Maybe someone around there knows how to get in?/", "obj_ch4_PDC01C_slash_Step_0_gml_307_0");
    c_msgnextloc("\\ED* I mean..^1. if we don't hurry and save her^1, then.../", "obj_ch4_PDC01C_slash_Step_0_gml_308_0");
    c_facenext("toriel", "4");
    c_msgnextloc("\\E4* Susie^1, Kris^1, come and try on your clothes!/", "obj_ch4_PDC01C_slash_Step_0_gml_313_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* J..^1. Just a sec!!/%", "obj_ch4_PDC01C_slash_Step_0_gml_315_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("l");
    c_addxy(0, -1);
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(4);
    c_sel(su);
    c_facing("l");
    c_wait_box(5);
    c_sel(su);
    c_sprite(spr_susie_head_down_left);
    c_wait_box(6);
    c_sel(su);
    c_facing("l");
    c_wait_box(7);
    c_sel(su);
    c_sprite(spr_susie_head_down_right);
    c_wait_box(9);
    c_sprite(spr_susie_sheeh_lw);
    c_addxy(0, 1);
    c_snd_play(snd_noise);
    c_shakeobj();
    c_sel(kr);
    c_facing("l");
    c_waittalk();
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect(120, 133, 30);
    c_sel(su);
    c_autowalk(1);
    c_addxy(0, -1);
    c_walkdirect_wait(145, 127, 30);
    c_soundplay(snd_escaped);
    c_wait(150);
    c_var_instance(id, "update_plot", true);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E0* Here^1, try these on.../%", "obj_ch4_PDC01C_slash_Step_0_gml_380_0");
    c_talk_wait();
    c_wait(15);
    c_sel(kr);
    c_sprite(spr_kris_walk_down_church);
    c_halt();
    c_autowalk(0);
    c_setxy(140, 126);
    c_sel(su);
    c_sprite(spr_susie_annoyed_church);
    c_halt();
    c_autowalk(0);
    c_setxy(110, 120);
    c_sound_play_x(snd_slidewhistle, 1, 0.7);
    c_walkdirect(290, 120, 60);
    c_sel(kr);
    c_walkdirect_wait(320, 126, 60);
    c_sel(to);
    c_setxy(140, 112);
    c_autowalk(0);
    c_sprite(spr_toriel_walk_right_church);
    c_imagespeed(0.25);
    c_walkdirect_wait(260, 112, 60);
    c_halt();
    c_wait(5);
    c_var_instance(actor_talker, "paused", false);
    c_sprite(spr_toriel_talk_right_church);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E0* Sorry^1, Susie^1, all that fits you are Asriel's old clothes.../%", "obj_ch4_PDC01C_slash_Step_0_gml_422_0");
    c_talk_wait();
    c_imagespeed(0);
    c_wait(5);
    c_var_instance(actor_talker, "paused", true);
    c_sprite(spr_toriel_laughing_church);
    c_imagespeed(0.25);
    c_msc(1244);
    c_talk_wait();
}
if (con == 4 && !d_ex())
{
    con = 5;
    alarm[0] = 1;
    global.facing = 0;
    c_wait(5);
    if (global.choice == 0)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E5* (Shut up!!^1! Don't say that!!)/%", "obj_ch4_PDC01C_slash_Step_0_gml_451_0");
        c_talk_wait();
    }
    if (global.choice == 1)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E5* (Shut up!!^1! This is your fault!!)/%", "obj_ch4_PDC01C_slash_Step_0_gml_458_0");
        c_talk_wait();
    }
    c_var_instance(actor_talker, "paused", false);
    c_sel(to);
    c_halt();
    c_sprite(spr_toriel_talk_down_church);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E0* Well^1, shall we all.../", "obj_ch4_PDC01C_slash_Step_0_gml_470_0");
    c_msgnextloc("\\E1* Er^1, walk over together?/%", "obj_ch4_PDC01C_slash_Step_0_gml_471_0");
    c_talk_wait();
    c_sel(to);
    c_imagespeed(0);
    c_wait(5);
    c_sprite(spr_toriel_walk_down_church);
    c_imagespeed(0.25);
    c_walkdirect_wait(260, 130, 15);
    c_sprite(spr_toriel_walk_right_church);
    c_walkdirect_wait(520, 130, 60);
    c_wait(10);
    c_soundplay(snd_doorclose);
    c_wait(5);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church);
    c_halt();
    c_sel(kr);
    c_sprite(spr_kris_walk_left_church);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. well^1, let's just get this over with./%", "obj_ch4_PDC01C_slash_Step_0_gml_500_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_down_church);
    c_halt();
    c_sel(kr);
    c_sprite(spr_kris_walk_down_church);
    c_halt();
    c_pan(171, 0, 15);
    c_wait(31);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 6 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    var front_door = instance_create(594, 149, obj_doorX_musfade);
    with (front_door)
    {
        doorFacing = 0;
        doorPreset = 1;
        doorFadeMusic = 1;
    }
    instance_destroy(door_readable);
    with (obj_caterpillarchara)
    {
        follow = 1;
        visible = 1;
    }
    with (obj_ch4_PDC01B)
    {
        with (sparkle_marker)
            instance_destroy();
        with (sparkle_readable)
            instance_destroy();
    }
    con = -1;
}
if (update_plot)
{
    update_plot = false;
    global.plot = 15;
}

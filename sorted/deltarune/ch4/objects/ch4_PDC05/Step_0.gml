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
    to = actor_count + 1;
    to_actor = instance_create(toriel_marker.x, toriel_marker.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_marker.sprite_index;
    as = actor_count + 2;
    as_actor = instance_create(495, 447, obj_actor);
    scr_actor_setup(as, as_actor, "asgore");
    as_actor.sprite_index = spr_asgorel;
    su = actor_count + 3;
    su_actor = instance_create(512, 320, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = spr_susie_walk_down_church;
    c_sel(su);
    c_setxy(susie_marker.x, susie_marker.y);
    c_wait(1);
    c_var_instance(toriel_marker, "visible", 0);
    c_var_instance(susie_marker, "visible", 0);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(susie_marker.x, susie_marker.y + 12, 15);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(305, 320, 15);
    c_pannable(1);
    c_pan(190, 240, 30);
    c_wait(15);
    c_soundplay(snd_doorclose);
    c_var_instance(door_marker, "image_index", 0);
    c_sel(kr);
    c_halt();
    c_sel(su);
    c_halt();
    c_wait(15);
    c_sel(to);
    c_emote("!", 30);
    c_wait(30);
    c_sprite(spr_toriel_talk_left_church);
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_kris_walk_right_church);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church);
    c_sel(to);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E0* Oh^1, Kris^1, Susie. How about going to the diner?/", "obj_ch4_PDC05_slash_Step_0_gml_85_0");
    c_msgnextloc("\\E1* I have to come back to church in a few hours for choir practice.../", "obj_ch4_PDC05_slash_Step_0_gml_87_0");
    c_msgnextloc("\\E0* It would be nice to have a little treat before then./%", "obj_ch4_PDC05_slash_Step_0_gml_88_0");
    c_talk();
    c_wait_box(0);
    c_sprite(spr_toriel_talk_left_church);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_waittalk();
    c_halt();
    c_var_instance(id, "leaf_fall", true);
    c_sound_play(snd_wing);
    c_sel(as);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(380, 319, 30);
    c_delaycmd(31, "imagespeed", 0);
    c_delaycmd(31, "imageindex", 0);
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church_neutral);
    c_sel(to);
    c_emote("!", 30);
    c_sprite(spr_toriel_walk_right_church_unhappy);
    c_wait(21);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E5* Oh^1, Tori^1! What a coincidence seeing you here!/", "obj_ch4_PDC05_slash_Step_0_gml_124_0");
    c_msgnextloc("\\E6* Just after church ended too./%", "obj_ch4_PDC05_slash_Step_0_gml_125_0");
    c_talk_wait();
    c_sel(to);
    c_sprite(spr_toriel_talk_right_church_unhappy);
    c_wait(60);
    c_imagespeed(0.25);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E1* Oh^1, err..^1. hello^1, Asgore. We -/", "obj_ch4_PDC05_slash_Step_0_gml_137_0");
    c_facenext("asgore", 4);
    c_msgnextloc("\\E4* Oh^1, Tori. Would you look at that!/%", "obj_ch4_PDC05_slash_Step_0_gml_139_0");
    c_talk();
    c_wait_box(2);
    c_sel(to);
    c_halt();
    c_waittalk();
    c_sel(as);
    c_sprite(spr_asgore_flower_kneel);
    c_soundplay(snd_noise);
    c_setxy(365, 320);
    c_imagespeed(0.15);
    c_wait(10);
    c_soundplay(snd_wing);
    c_wait(10);
    c_imagespeed(0);
    c_wait(5);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E6* Seems I had some extra flowers lying around and.../", "obj_ch4_PDC05_slash_Step_0_gml_163_0");
    c_facenext("toriel", 1);
    c_msgnextloc("\\E1* Asgore^1, I.../%", "obj_ch4_PDC05_slash_Step_0_gml_165_0");
    c_talk();
    c_wait_box(2);
    c_sel(to);
    c_imagespeed(0.25);
    c_waittalk();
    c_sel(to);
    c_halt();
    c_sel(to);
    c_sprite(spr_toriel_walk_up_church);
    c_wait(30);
    c_sel(as);
    c_sprite(spr_asgore_flower_pause);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E1* I think I have to go^1, I'm sorry. Can we talk later?/", "obj_ch4_PDC05_slash_Step_0_gml_187_0");
    c_facenext("asgore", "0");
    c_msgnextloc("\\E0* Of course!/%", "obj_ch4_PDC05_slash_Step_0_gml_189_0");
    c_talk();
    c_wait_box(2);
    c_sel(as);
    c_sprite(spr_asgore_flower_kneel);
    c_imageindex(3);
    c_waittalk();
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_walk_up_church);
    c_imagespeed(0.25);
    c_wait(5);
    c_walk_wait("u", 4, 5);
    c_sprite(spr_toriel_walk_right_church_unhappy);
    c_imagespeed(0.25);
    c_wait(5);
    c_walk("r", 4, 20);
    c_delaywalk(21, "u", 4, 40);
    c_delaycmd(21, "sprite", spr_toriel_walk_up_church);
    c_delaycmd(25, "imagespeed", 0.25);
    c_wait(15);
    c_sel(as);
    c_sprite(spr_asgore_flower_pause);
    c_wait(60);
    c_sel(as);
    c_sprite(spr_asgore_flower_dejected);
    c_wait(30);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E2* ..^1. ah./", "obj_ch4_PDC05_slash_Step_0_gml_229_0");
    c_msgnextloc("\\E3* Well^1, little blossoms^1, we tried our best./", "obj_ch4_PDC05_slash_Step_0_gml_230_0");
    c_msgnextloc("\\E0* Just hope Asriel will be able to see us all..^1. back to normal./", "obj_ch4_PDC05_slash_Step_0_gml_231_0");
    c_msgnextloc("\\E4* ...!/%", "obj_ch4_PDC05_slash_Step_0_gml_232_0");
    c_talk();
    c_wait_box(3);
    c_sel(as);
    c_sprite(spr_asgore_flower_surprise);
    c_emote("!", 30, 15);
    c_waittalk();
    c_wait(15);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E1* Oh^1, Kris^1! How are you doing!/", "obj_ch4_PDC05_slash_Step_0_gml_247_0");
    c_msgnextloc("\\E5* Would you like some flowers?/%", "obj_ch4_PDC05_slash_Step_0_gml_248_0");
    c_talk();
    c_wait_box(1);
    c_sel(as);
    c_sprite(spr_asgorel);
    c_addxy(10, 0);
    c_wait(5);
    c_waittalk();
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect_wait(290, 319, 30);
    c_halt();
    c_sprite(spr_asgore_flower_walk_up);
    c_imagespeed(0.25);
    c_walk_wait("u", 3, 4);
    c_halt();
    c_wait(5);
    c_soundplay(snd_item);
    c_sprite(spr_asgoreu);
    c_wait(15);
    c_sel(kr);
    c_sprite(spr_kris_flower_put_away);
    c_imagespeed(0);
    c_imageindex(1);
    c_sel(as);
    c_imagespeed(0.25);
    c_walk_wait("d", 3, 5);
    c_halt();
    c_speaker("asgore");
    c_msgsetloc(0, "\\E6* Here. Share with your friend./%", "obj_ch4_PDC05_slash_Step_0_gml_290_0");
    c_talk_wait();
    c_sel(as);
    c_sprite(spr_asgorer);
    c_wait(5);
    c_speaker("asgore");
    c_msgsetloc(0, "\\E5* See you later^1, alligator./%", "obj_ch4_PDC05_slash_Step_0_gml_299_0");
    c_talk_wait();
    c_imagespeed(0.25);
    c_walkdirect_wait(404, 319, 20);
    c_sprite(spr_asgoreu);
    c_walkdirect_wait(404, 150, 50);
    c_sel(kr);
    c_imageindex(4);
    c_soundplay(snd_whip_hard);
    c_wait(3);
    c_sprite(spr_kris_walk_down_church);
    c_imageindex(0);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* .../%", "obj_ch4_PDC05_slash_Step_0_gml_320_0");
    c_talk_wait();
    c_wait(30);
    c_sprite(spr_kris_walk_left_church);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Hey^1, let's change the hell out of these clothes./%", "obj_ch4_PDC05_slash_Step_0_gml_329_0");
    c_talk_wait();
    c_snd_play(snd_jump);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_delaycmd(2, "sprite", spr_susie_walk_up_church);
    c_delaycmd(4, "sprite", spr_susie_walk_right_church);
    c_delaycmd(6, "sprite", spr_susie_walk_down_church);
    c_delaycmd(8, "sprite", spr_susie_walk_left_church);
    c_delaycmd(10, "sprite", spr_susie_walk_up_lw);
    c_delaycmd(12, "sprite", spr_susie_walk_right_lw);
    c_delaycmd(14, "sprite", spr_susie_walk_down_lw);
    c_sel(kr);
    c_sprite(spr_kris_walk_right_church);
    c_wait(2);
    c_sprite(spr_krisu);
    c_wait(2);
    c_sprite(spr_kris_walk_left_church);
    c_wait(2);
    c_sprite(spr_kris_walk_down_church);
    c_wait(2);
    c_sprite(spr_kris_walk_right_church);
    c_wait(1);
    c_var_instance(id, "clothes_fly", true);
    c_soundplay(snd_wing);
    c_wait(1);
    c_sprite(spr_krisu);
    c_wait(2);
    c_facing("l");
    c_wait(2);
    c_facing("d");
    c_wait(80);
    c_sel(su);
    c_autowalk(1);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Now what? Wanna check up on Ralsei at school?/", "obj_ch4_PDC05_slash_Step_0_gml_371_0");
    c_msgnextloc("\\E0* We should probably catch him up on the plan./", "obj_ch4_PDC05_slash_Step_0_gml_372_0");
    c_msgnextloc("\\EL* ..^1. or I guess we could go to Noelle's first./", "obj_ch4_PDC05_slash_Step_0_gml_373_0");
    c_msgnextloc("\\E2* Whatever you wanna do^1, do it. It's the weekend./%", "obj_ch4_PDC05_slash_Step_0_gml_374_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("d");
    c_wait_box(3);
    c_sel(su);
    c_facing("r");
    c_waittalk();
    c_wait(5);
    c_var_instance(id, "susie_change", true);
    c_pannable(1);
    c_panobj(kr_actor, 22);
    c_wait(23);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.currentsong[0] = snd_init("town_day.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 0.97);
    con = 99;
}
if (susie_change)
{
    susie_change = false;
    global.plot = 40;
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    with (obj_mainchara)
    {
        init_clothes = false;
        x = kr_x;
        y = kr_y;
    }
    var su_x = su_actor.x;
    var su_y = su_actor.y;
    scr_makecaterpillar(su_actor.x, su_actor.y, 2, 0);
    with (obj_caterpillarchara)
    {
        visible = 0;
        init_clothes = false;
        sprite_index = rsprite;
        x = su_x;
        y = su_y;
        scr_caterpillar_interpolate();
    }
}
if (leaf_fall)
{
    leaf_fall_timer++;
    if (leaf_fall_timer == 1)
    {
        for (var i = 0; i < 10; i++)
        {
            var leaf_marker = scr_marker(480 + irandom(20), 460 + irandom(30), spr_lw_tree_leaf_01);
            leaf_marker.depth = 5010;
            leaf_marker.image_speed = 0.2;
            leaf_marker.hspeed = -8 + (i + 0.5);
            leaf_marker.vspeed = -15;
            leaf_marker.friction = 1;
            leaf_marker.gravity = 1;
            leaf_marker.image_angle = irandom(180);
            scr_script_delayed(scr_lerp_instance_var, 40, leaf_marker, "image_alpha", 1, 0, 20);
            scr_doom(leaf_marker, 60);
        }
    }
    if (leaf_fall_timer == 60)
    {
        leaf_fall = false;
        leaf_fall_timer = 0;
    }
}
if (clothes_fly)
{
    clothes_fly_timer++;
    if (clothes_fly_timer == 1)
    {
        susie_clothes_marker.visible = 1;
        kris_clothes_marker.visible = 1;
        susie_clothes_marker.hspeed = -10;
        susie_clothes_marker.vspeed = -12;
        susie_clothes_marker.gravity = 2.5;
        susie_clothes_marker.friction = 1;
        kris_clothes_marker.hspeed = 10;
        kris_clothes_marker.vspeed = -12;
        kris_clothes_marker.gravity = 2.5;
        kris_clothes_marker.friction = 1;
    }
    if (clothes_fly_timer == 10)
    {
        susie_clothes_marker.vspeed = 0;
        susie_clothes_marker.gravity = 0;
        susie_clothes_marker.sprite_index = spr_susie_clothes_land;
        susie_clothes_marker.y += 18;
        susie_clothes_marker.x -= 6;
        kris_clothes_marker.vspeed = 0;
        kris_clothes_marker.gravity = 0;
        kris_clothes_marker.sprite_index = spr_kris_clothes_land;
        kris_clothes_marker.y += 18;
        kris_clothes_marker.x += 6;
        sound_play_x(snd_wing, 0.75, 0.5);
    }
    if (clothes_fly_timer == 60)
    {
        clothes_fly = false;
        clothes_fly_timer = 0;
        with (susie_clothes_marker)
            depth = 900000;
        with (kris_clothes_marker)
            depth = 900000;
        susie_clothes_readable = instance_create(susie_clothes_marker.x, susie_clothes_marker.y, obj_readable_room1);
        kris_clothes_readable = instance_create(kris_clothes_marker.x, kris_clothes_marker.y, obj_readable_room1);
    }
}

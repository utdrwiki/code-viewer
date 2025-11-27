scr_populatechars();
if (!init)
{
    obj_cloud_controller_new.harmless = 1;
    obj_cloud_controller_new.miny = 640;
    obj_cloud_controller_new.minspeed = -1;
    obj_cloud_controller_new.maxspeed = -4;
    obj_cloud_controller_new.y += 200;
    obj_cloud_controller_new.cloud_angle = 1;
    obj_cloud_controller_new.sloped = 1;
    obj_cloud_controller_new.rotatespeed = 0;
    with (obj_cloud_render_new)
    {
        followcamera = true;
        distance_from_kris += 200;
        xoffset = 0;
        if (front)
            depth = 25;
        else
            depth = 1000320;
    }
    init = 1;
    var pos1 = scr_heromarker("gen", "p1");
    var pos2 = scr_heromarker("gen", "p2");
    var pos3 = scr_heromarker("gen", "p3");
    prophecy[0] = instance_create(pos1[0] + 150, pos1[1] + 90, obj_dw_church_prophecy);
    prophecy[1] = instance_create(pos2[0] + 150, pos2[1] + 90, obj_dw_church_prophecy);
    prophecy[2] = instance_create(pos3[0] + 150, pos3[1] + 90, obj_dw_church_prophecy);
    prophecy[0].extflag = "main1";
    prophecy[1].extflag = "main2";
    prophecy[2].extflag = "main3";
    prophecy[0].fade_edges = true;
    prophecy[1].fade_edges = true;
    prophecy[2].fade_edges = true;
    var losscount = global.tempflag[96];
    if (losscount >= 2)
    {
        var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 4329)
                cup = scr_makenpc_fromasset(spritesArray[i]);
        }
        var gen = scr_genmarker("tr1");
        with (instance_create(gen.x, gen.y, obj_treasure_room))
        {
            itemtype = "item";
            itemidchest = 62;
            tempchest = 1;
        }
        gen = scr_genmarker("tr2");
        with (instance_create(gen.x, gen.y, obj_treasure_room))
        {
            itemtype = "item";
            itemidchest = 61;
            tempchest = 1;
        }
    }
    if (losscount >= 3)
    {
        with (obj_solidblocksized_alt)
        {
            if (extflag == "treasureblock")
                instance_destroy();
        }
        layer_set_visible("TILES_FOREXPANSION", true);
        var gen = scr_genmarker("tr3");
        with (instance_create(gen.x, gen.y, obj_treasure_room))
        {
            itemtype = "item";
            itemidchest = 61;
            tempchest = 1;
        }
    }
    if (losscount >= 4)
    {
        var gen = scr_genmarker("tr4");
        with (instance_create(gen.x, gen.y, obj_treasure_room))
        {
            itemtype = "item";
            itemidchest = 61;
            tempchest = 1;
        }
    }
    if (losscount >= 5)
    {
        var gen = scr_genmarker("tr5");
        with (instance_create(gen.x, gen.y, obj_treasure_room))
        {
            itemtype = "item";
            itemidchest = 61;
            tempchest = 1;
        }
    }
    if (losscount >= 6)
    {
        var gen = scr_genmarker("tr6");
        with (instance_create(gen.x, gen.y, obj_treasure_room))
        {
            itemtype = "item";
            itemidchest = 61;
            tempchest = 1;
        }
    }
}
var prophecyactive = 0;
var whichproph = -1;
with (obj_trigger)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        prophecyactive = 1;
        if (extflag == "1")
            whichproph = 1;
        if (extflag == "2")
            whichproph = 2;
        if (extflag == "3")
            whichproph = 3;
    }
}
with (obj_dw_church_prophecy)
    active = false;
if (whichproph == 1)
    prophecy[0].active = true;
if (whichproph == 2)
    prophecy[1].active = true;
if (whichproph == 3)
    prophecy[2].active = true;
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
    c_autodepth(0);
    c_depth(10);
    c_setxy(320, 202);
    c_sprite(spr_kris_dw_landed);
    c_addxy(0, -4);
    c_sel(su);
    c_autowalk(0);
    c_facing("susieunhappy");
    c_setxy(400, 185);
    c_sprite(spr_susie_dw_landed);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_setxy(240, 188);
    c_sprite(spr_ralsei_kneel_serious);
    c_mus2("volume", 0, 60);
    c_var_instance(id, "wind_track_start", true);
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 60);
    c_wait(61);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Hahh..^1. hahh.../", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_218_0");
    c_msgnextloc("\\El* Doesn't..^1. look like we can go much higher.../%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_219_0");
    c_talk_wait();
    c_sel(kr);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_addxy(0, 4);
    c_wait(8);
    c_sel(su);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_wait(60);
    c_sel(su);
    c_autowalk(1);
    c_facing("l");
    c_wait(8);
    c_sprite(spr_susie_surprised_step_back_left);
    c_sel(kr);
    c_autowalk(1);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\El* ..^1. Ralsei^1, are you okay...?/", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_250_0");
    c_facenext("ralsei", "e");
    c_msgnextloc("\\Ee* I..^1. I'm fine. Just..^1. a little rattled./%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_252_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_shakeobj();
    c_wait_talk();
    c_sel(kr);
    c_facing("d");
    c_delaycmd4(38, "var", id, "beam_fx", true);
    c_delaycmd4(38, "var", id, "heal_fx_kris", true);
    c_delaycmd4(42, "var", id, "heal_fx_ralsei", true);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_heal_full);
    c_addxy(0, 10);
    c_halt();
    c_var_lerp_to_instance(su_actor, "image_index", 18, 56);
    c_wait(60);
    c_sel(su);
    c_facing("l");
    c_addxy(0, -10);
    c_halt();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_down_subtle);
    c_wait(30);
    c_sprite(spr_ralsei_walk_right);
    c_sel(kr);
    c_facing("r");
    c_wait(30);
    c_sel(ra);
    c_facing("ralseinohat");
    c_walk_wait("r", 4, 4);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\ED* Susie.../", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_305_0");
    c_facenext("susie", "k");
    c_msgnextloc("\\Ek* Don't mention it./%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_307_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw);
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(311, 185, 15);
    c_delayfacing(16, "r");
    c_sel(kr);
    c_walkdirect_wait(387, 202, 15);
    c_wait(15);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\El* Let's..^1. go./%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_334_0");
    c_talk_wait();
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_sel(kr);
    c_facing("d");
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    if (global.interact == 1)
    {
        con = 4;
        regain_control();
    }
}
if (con == 4)
{
    if (obj_mainchara.x >= 3486)
    {
        con = 5;
        lose_control();
    }
}
if (con == 5 && customcon == 1 && !d_ex())
{
    con = 20;
    customcon = 0;
    with (obj_cloud_controller_new)
    {
        miny = 320;
        scr_lerpvar("minspeed", 0, -2.2, 50, 3, "in");
        scr_lerpvar("maxspeed", 0, -2.2, 50, 3, "in");
        scr_script_delayed(scr_lerpvar, 120, "minspeed", -2.2, 0, 50, 3, "out");
        scr_script_delayed(scr_lerpvar, 120, "maxspeed", -2.2, 0, 50, 3, "out");
    }
    c_waitcustom_end();
    var run_speed = 6;
    var camera_x_pos = 3800;
    var camera_speed = shortened ? 8 : 6;
    var camera_pan_time = scr_calculate_move_distance(camerax(), cameray(), camera_x_pos, cameray(), camera_speed);
    c_pannable(1);
    c_pan(camera_x_pos, cameray(), camera_pan_time);
    var kr_y_pos = 140;
    var kr_x_pos = 3942;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, run_speed);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "r");
    var su_y_pos = 170;
    var su_x_pos = 3898;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, run_speed);
    c_sel(su);
    c_autowalk(1);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "r");
    var ra_y_pos = 200;
    var ra_x_pos = 3866;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, run_speed);
    c_sel(ra);
    c_autodepth(0);
    c_depth(kr_actor.depth - 20);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "r");
    if (!shortened)
    {
        c_wait(camera_pan_time + 60);
        c_msgside("bottom");
        c_speaker("susie");
        c_msgsetloc(0, "\\El* End..^1. of the line^1, huh./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_425_0");
        c_facenext("ralsei", "Q");
        c_msgnextloc("\\EQ* It..^1. seems so./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_427_0");
        c_facenext("susie", "l");
        c_msgnextloc("\\El* Guess we just..^1. wait for the Titan to show up^1, huh./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_429_0");
        c_facenext("ralsei", "f");
        c_msgnextloc("\\Ef* ..^1. no./%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_431_0");
        c_talk();
        c_wait_box(2);
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_sad_subtle);
        c_wait_box(4);
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_wait_box(6);
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_sad);
        c_wait_talk();
        c_wait(30);
        c_var_instance(id, "wind_track_fade", true);
        c_var_instance(211, "introcon", 0);
        c_var_instance(211, "introtimer", 0);
        c_wait(90);
        c_mus2("initloop", "GALLERY.ogg", 0);
        c_mus2("pitch", 0.75, 1);
        c_mus2("volume", 0, 0);
        c_mus2("volume", 0.8, 60);
        c_wait(90);
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_head_down);
        c_sel(su);
        c_sprite(spr_susie_surprised_step_back);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ee* It's already..^1. been here the whole time./%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_470_0");
        c_talk_wait();
        c_sel(ra);
        c_facing("r");
        c_sel(su);
        c_facing("r");
        c_sel(kr);
        c_facing("r");
        c_wait(30);
        c_sel(su);
        c_sprite(spr_susie_point_right);
        c_addxy(8, 58);
        c_shakeobj();
        c_speaker("susie");
        c_msgsetloc(0, "\\El* H..^1. Hey dumbass!/", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_490_0");
        c_msgnextloc("\\EV* Don't know if you got the memo..^1. but.../", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_491_0");
        c_msgnextloc("\\EX* We're heroes./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_492_0");
        c_msgnextloc("\\El* And there's a whole lot of stuff written in our lives/", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_493_0");
        c_msgnextloc("\\Ek* ..^1. we haven't gotten to see yet./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_494_0");
        c_msgnextloc("\\El* So get out of our way./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_495_0");
        c_msgnextloc("\\EV* Or..^1. as soon as my hands stop shaking.../", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_496_0");
        c_msgnextloc("\\El* My axe is gonna chop you in half^1, got it!?/%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_497_0");
        c_talk();
        c_wait_box(2);
        c_sel(su);
        c_autowalk(0);
        c_sprite(spr_susie_walk_right_dw);
        c_addxy(-8, -58);
        c_wait_box(3);
        c_sel(su);
        c_facing("r");
        c_wait_box(4);
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_wait_box(5);
        c_sel(su);
        c_facing("r");
        c_wait_box(6);
        c_sel(su);
        c_sprite(spr_susie_look_down_right_dw);
        c_wait_box(7);
        c_sprite(spr_susie_point_right);
        c_addxy(8, 58);
        c_shakeobj();
        c_wait_talk();
        c_sel(su);
        c_facing("r");
        c_addxy(-8, -58);
        c_wait(4);
        c_var_instance(211, "introcon", 2);
        c_var_instance(211, "introtimer", 0);
        c_wait(150);
        c_speaker("susie");
        c_msgsetloc(0, "\\El* Kris^1! Ralsei^1! Let's go!!/%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_541_0");
        c_talk_wait();
        c_customfunc(function()
        {
            scr_tempsave();
        });
    }
    else
    {
        c_var_instance(id, "wind_track_fade", true);
        c_wait(camera_pan_time);
        c_var_instance(211, "introcon", 0);
        c_var_instance(211, "introtimer", 0);
        c_wait(90);
        c_var_instance(211, "introcon", 2);
        c_var_instance(211, "introtimer", 0);
        c_wait(150);
    }
    c_waitcustom();
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 15;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var kr_y_pos = 201;
    var kr_x_pos = 3682;
    c_sel(kr);
    c_setxy(kr_x_pos, kr_y_pos);
    c_facing("r");
    var su_y_pos = 185;
    var su_x_pos = 3628;
    c_sel(su);
    c_autowalk(1);
    c_autodepth(0);
    c_depth(kr_actor.depth - 10);
    c_setxy(su_x_pos, su_y_pos);
    c_facing("susieunhappy");
    c_facing("r");
    var ra_y_pos = 189;
    var ra_x_pos = 3584;
    c_sel(ra);
    c_autodepth(0);
    c_depth(96000);
    c_setxy(ra_x_pos, ra_y_pos);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_pannable(1);
    c_pan(3381, cameray(), 1);
    c_var_instance(id, "wind_track_start", true);
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 30);
    c_wait(30);
    c_waitcustom();
}
if (con == 15 && !d_ex() && customcon == 1)
{
    if (global.interact == 1)
    {
        con = 16;
        regain_control();
    }
}
if (con == 16)
{
    if (obj_mainchara.x >= 3877)
    {
        con = 5;
        lose_control();
    }
}
if (con == -1 && timer < 1000)
{
    timer++;
    if (timer >= 60)
    {
        if (obj_cloud_controller_new.miny < 600)
            obj_cloud_controller_new.miny += ((timer - 60) / 40);
        with (obj_cloud_render_new)
            distance_from_kris += ((other.timer - 60) / 20);
    }
    if (timer == 180)
    {
        instance_destroy(obj_cloud_render_new);
        instance_destroy(obj_cloud_controller_new);
        timer = 99999;
    }
}
if (con == 20 && !d_ex() && customcon == 1)
{
    con = -1;
    timer = 0;
    global.tempflag[96]++;
    global.flag[1640] = global.tempflag[96];
    snd_free_all();
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
    global.flag[9] = 2;
    global.batmusic[0] = snd_init("titan_battle.ogg");
    instance_create(camerax(), cameray(), obj_titan_background_balls);
    scr_lerpvar("background_spotlight_alpha", 0, 0.35, 60, "out");
    scr_lerpvar("background_orb_alpha", 0, 1, 60, "out");
    encounterflag = 175;
    global.flag[54] = encounterflag;
    scr_battle(175, 1, 0, 0, 0);
    with (obj_battleback)
        instance_destroy();
    global.flag[9] = 1;
}
if (i_ex(obj_titan_enemy))
{
    if (obj_titan_enemy.phase == 3)
        background_spotlight_alpha = scr_approach(background_spotlight_alpha, 0.5, 0.05);
    if (obj_titan_enemy.phase == 5)
        background_spotlight_alpha = scr_approach(background_spotlight_alpha, 0.85, 0.05);
    if (obj_titan_enemy.phase == 7)
    {
        background_spotlight_alpha = scr_approach(background_spotlight_alpha, 0, 0.05);
        scr_lerpvar("background_orb_alpha", 1, 0, 60, "out");
    }
}
if (heal_fx_kris)
{
    heal_fx_kris = false;
    snd_play(snd_power);
    var healamt = instance_create(kr_actor.x, kr_actor.y, obj_dmgwriter);
    with (healamt)
    {
        delay = 4;
        type = 3;
        specialmessage = 3;
    }
    healamt.damage = global.maxhp[global.char[0]];
    var healanim = instance_create(kr_actor.x, kr_actor.y, obj_healanim);
    healanim.target = kr_actor.id;
    global.hp[global.char[0]] = global.maxhp[global.char[0]];
    global.hp[global.char[1]] = global.maxhp[global.char[1]];
    global.hp[global.char[2]] = global.maxhp[global.char[2]];
}
if (heal_fx_ralsei)
{
    heal_fx_ralsei = false;
    snd_play(snd_power);
    var healamt = instance_create(ra_actor.x, ra_actor.y, obj_dmgwriter);
    with (healamt)
    {
        delay = 4;
        type = 3;
        specialmessage = 3;
    }
    healamt.damage = global.maxhp[global.char[2]];
    var healanim = instance_create(ra_actor.x, ra_actor.y, obj_healanim);
    healanim.target = ra_actor.id;
}
if (beam_fx)
{
    beam_fx = false;
    beam_marker.x = su_actor.x;
    beam_marker.y = su_actor.y + 30;
    beam_marker.image_xscale = -2;
    beam_marker.visible = 1;
    with (beam_marker)
    {
        hspeed = -24;
        scr_doom(id, 60);
    }
}
if (wind_track_start)
{
    wind_track_start = false;
    wind_track[0] = snd_init("wind_highplace.ogg");
    wind_track[1] = mus_loop(wind_track[0]);
    mus_volume(wind_track[1], 0, 0);
    mus_volume(wind_track[1], 1, 60);
}
if (wind_track_fade)
{
    wind_track_fade = false;
    mus_volume(wind_track[1], 0, 60);
}
with (cup)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* My..^1. My heroes^1! It was difficult^1, but.../", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_842_0");
        msgnextloc("* I managed..^1. to climb up..^1. to..^1. support you./", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_843_0");
        var endstring = stringsetloc("* Please..^1. take what is in the treasure box./%", "obj_dw_churchc_titanclimb2_post_slash_Step_0_gml_844_0");
        msgnext(endstring);
        if (talked)
            msgset(0, endstring);
        d_make();
        talked++;
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}

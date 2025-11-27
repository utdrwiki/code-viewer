if (con < 0)
    exit;
if (con == 0 && obj_mainchara.y <= starting_y_pos && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    roomglow.create_highlight(obj_actor);
}
if (con == 1)
{
    con = 2;
    c_sel(su);
    c_emote("!", 30);
    c_wait(60);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_point);
    c_imagespeed(0.2);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* You...!/%", "obj_ch4_DCC01_slash_Step_0_gml_46_0");
    c_talk_wait();
    c_pannable(1);
    c_pan_wait(camerax(), starting_y_pos - 500, 60);
    c_wait(90);
    c_waitcustom();
}
if (con == 2 && customcon == 1 && !d_ex())
{
    con = 3;
    alarm[0] = 20;
    attack = instance_create(su_actor.x, su_actor.y, obj_rudebuster_anim);
    attack.target = roaring_knight;
}
if (con == 4 && customcon == 1)
{
    con = 5;
    customcon = 0;
    var offset = 2;
    c_waitcustom_end();
    c_var_instance(roaring_knight, "state", 1);
    c_var_instance(roaring_knight, "spear_dodge", 1);
    c_wait(15 - offset);
    c_customfunc(function()
    {
        attack = instance_create(su_actor.x, su_actor.y, obj_rudebuster_anim);
        attack.target = roaring_knight;
    });
    c_wait(15 + offset);
    c_var_instance(roaring_knight, "spear_dodge", 1);
    c_wait(15 - offset);
    c_customfunc(function()
    {
        attack = instance_create(su_actor.x, su_actor.y, obj_rudebuster_anim);
        attack.target = roaring_knight;
    });
    c_wait(15 + offset);
    c_var_instance(roaring_knight, "spear_dodge", 1);
    c_wait(30);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_fly);
    c_var_instance(roaring_knight, "image_speed", 0.2);
    c_var_lerp_to_instance(roaring_knight, "x", roaring_knight.xstart, 14);
    c_var_lerp_to_instance(roaring_knight, "y", roaring_knight.ystart, 14);
    c_wait(30);
    c_snd_play(snd_knight_teleport);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_ball_transition_down);
    c_var_lerp_instance(roaring_knight, "image_index", 0, 4, 14);
    c_wait(18);
    c_customfunc(function()
    {
        var anim_player = instance_create(0, 0, obj_anim_custom);
        var anim_timestamps = [200, 200, 150, 150, 200, 500, 200, 60, 60, 60, 60, 60];
        anim_player.init(roaring_knight, 4568, anim_timestamps);
        anim_player.start();
    });
    c_wait(30);
    c_sel(su);
    c_setxy(295, cameray() + view_hport[0] + 40);
    c_sel(ra);
    c_setxy(247, cameray() + view_hport[0] + 40);
    c_sel(kr);
    c_setxy(350, cameray() + view_hport[0] + 40);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(295, starting_y_pos - 286, 30);
    c_sel(ra);
    c_delaywalkdirect(8, 247, starting_y_pos - 270, 30);
    c_sel(kr);
    c_delaywalkdirect(8, 350, starting_y_pos - 258, 30);
    c_wait(60);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_point);
    c_imagespeed(0.2);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\Em* Nowhere to run this time^1, dumbass!/", "obj_ch4_DCC01_slash_Step_0_gml_162_0");
    c_msgnextloc("\\En* I dunno where you've put Toriel^1, but..^1. it's over!/", "obj_ch4_DCC01_slash_Step_0_gml_163_0");
    c_msgnextloc("\\EI* The Fountain's just past you^1, isn't it?/%", "obj_ch4_DCC01_slash_Step_0_gml_164_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_shock_up);
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_point);
    c_imagespeed(0.2);
    c_wait_talk();
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_down_look_back);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_var_lerp_instance(roaring_knight, "image_index", 0, 8, 21);
    c_wait(40);
    c_sel(su);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* That means..^1. we don't even have to beat you./", "obj_ch4_DCC01_slash_Step_0_gml_189_0");
    c_msgnextloc("\\EX* All we have to do is get PAST you..^1. and it's over./", "obj_ch4_DCC01_slash_Step_0_gml_190_0");
    c_msgnextloc("\\EV* ..^1. You.../", "obj_ch4_DCC01_slash_Step_0_gml_191_0");
    c_msgnextloc("\\Em* You can't beat us in the Light World^1, can you?!/", "obj_ch4_DCC01_slash_Step_0_gml_192_0");
    c_msgnextloc("\\Eo* That's..^1. why you keep running^1, isn't it?/%", "obj_ch4_DCC01_slash_Step_0_gml_193_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_wait_box(2);
    c_sel(su);
    c_walk("u", 4, 2);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_down_look_forward);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0);
    c_var_lerp_instance(roaring_knight, "image_index", 0, 6, 14);
    c_wait_box(3);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_point);
    c_imagespeed(0.2);
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_shock_up);
    c_wait_talk();
    c_wait(30);
    c_var_instance(roaring_knight, "state", 5);
    c_customfunc(function()
    {
        if (laugh_audio == -4)
            laugh_audio = audio_play_sound(snd_knight_laugh, 50, 1);
    });
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_point);
    c_imagespeed(0.2);
    c_speaker("susie");
    c_msgsetloc(0, "\\En* Hey..^1. hey^1, what's so funny?/", "obj_ch4_DCC01_slash_Step_0_gml_235_0");
    c_msgnextloc("\\En* Kris^1, why..^1. are they laughing...?/", "obj_ch4_DCC01_slash_Step_0_gml_236_0");
    c_msgnextloc("\\Em* You're laughing 'cause you know I'm right^1, don't you!?/%", "obj_ch4_DCC01_slash_Step_0_gml_237_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_halt();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_shock_up);
    c_shakeobj();
    c_wait_talk();
    c_mus("free_all");
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_point);
    c_shakeobj();
    c_var_instance(roaring_knight, "image_speed", 0);
    c_var_instance(roaring_knight, "state", 0);
    c_var_instance(roaring_knight, "sprite_index", spr_roaring_knight_laugh_stop);
    c_var_instance(roaring_knight, "image_index", 0);
    c_customfunc(function()
    {
        if (laugh_audio != -4)
        {
            audio_stop_sound(laugh_audio);
            laugh_audio = -4;
        }
    });
    c_waitcustom();
}
if (con == 5 && !d_ex() && customcon == 1)
{
    con = 6;
    scr_speaker("susie");
    msgsetloc(0, "\\Eo* You lose that Fountain^1, it's over!!/%", "obj_ch4_DCC01_slash_Step_0_gml_275_0");
    var d = d_make();
    d.skippable = false;
    d.side = 1;
}
if (con == 6 && i_ex(obj_writer))
{
    con = 7;
    with (obj_writer)
        rate = 4;
}
if (con == 7 && !d_ex() && customcon == 1)
{
    con = 8;
    customcon = 0;
    c_waitcustom_end();
    c_wait(15);
    c_var_instance(roaring_knight, "state", 3);
    c_var_instance(roaring_knight, "con", 0);
    c_wait(15);
    c_sel(ra);
    c_customfunc(function()
    {
        var hit_marker = scr_dark_marker(ra_actor.x + 6, ra_actor.y - 16, spr_shock_fx);
        with (hit_marker)
        {
            scr_lerpvar("image_index", 0, 3, 16);
            scr_doom(id, 17);
        }
    });
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ek* Don't.../%", "obj_ch4_DCC01_slash_Step_0_gml_312_0");
    c_talk_wait();
    c_sel(ra);
    c_walkdirect_wait(ra_actor.x, ra_actor.y - 28, 8);
    c_var_instance(roaring_knight, "con", 1);
    c_wait(30);
    c_autowalk(0);
    c_halt();
    c_sprite(spr_ralsei_up_shock);
    c_imageindex(1);
    c_shakeobj();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eg* DON'T MAKE ANOTHER FOUNTAIN!!!/%", "obj_ch4_DCC01_slash_Step_0_gml_330_0");
    c_talk_wait();
    c_wait(15);
    c_wait_if(roaring_knight, "state", "=", -1);
    c_var_instance(self, "stepcon", 1);
    c_var_instance(self, "steptimer", 0);
    c_wait(12);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_behind);
    c_addxy(0, 20);
    c_sel(su);
    c_sprite(spr_susie_shock_up);
    c_var_instance(roaring_knight, "state", 4);
    c_var_instance(roaring_knight, "con", 0);
    c_wait_if(roaring_knight, "con", ">=", 7);
    c_wait(5);
    c_pan(camerax(), starting_y_pos - 660, 10);
    c_wait_if(roaring_knight, "con", "=", 10);
    c_wait(40);
    c_waitcustom();
}
if (roomglow.active)
    roomglow.glow = min(roomglow.glow + 0.1, 1);
if (stepcon == 1)
{
    steptimer++;
    var lerpval = -(cos((pi * steptimer) / 60) - 1) / 2;
    cameray_set(lerp(starting_y_pos - 500, starting_y_pos - 660 - 320 - 500, lerpval));
    if (steptimer == 60)
    {
        steptimer = 0;
        stepcon = 0;
    }
}
if (stepcon == 2)
{
    var lerpval = -(cos((pi * steptimer) / 140) - 1) / 2;
    steptimer++;
    cameray_set(lerp(starting_y_pos - 660, starting_y_pos - 660 - 320 - 3500, lerpval));
    if (steptimer == 140)
    {
        steptimer = 0;
        stepcon = 0;
        roomglow.active = false;
        roomglow.glow = 1;
        roomglow.actind = 1;
    }
}
if (con == 8 && customcon == 1)
{
    con = -1;
    with (obj_sprhighlight)
    {
        match_depth = 0;
        depth = -5;
    }
    roomglow.active = 1;
    roaring_knight.depth = fountain.fountain_marker.depth + 10;
    fountain.start(continue_cutscene);
}
if (con == 20 && customcon == 1)
{
    con = 20.5;
    customcon = 0;
    c_waitcustom_end();
    c_wait(40);
    c_pannable(1);
    c_var_instance(self, "stepcon", 2);
    c_var_instance(self, "steptimer", 0);
    c_waitcustom();
}
if (con == 21 && customcon == 1)
{
    snd_stop(snd_petrify_titanblast);
    stepcon = -1;
    con = 50;
    customcon = 0;
    c_waitcustom_end();
    c_pannable(1);
    c_pan_wait(0, starting_y_pos - 500, 1);
    c_wait(15);
    c_sel(ra);
    c_emote("!", 15);
    c_sel(su);
    c_facing("u");
    c_emote("!", 15);
    c_wait(15);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_sprite(spr_ralsei_run_left);
    c_walkdirect(ra_actor.x - 60, ra_actor.y + 40, 5);
    c_delaycmd(6, "imagespeed", 0);
    c_delayfacing(6, "u");
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_sprite(spr_susie_run_serious_right);
    c_walkdirect(su_actor.x + 120, su_actor.y + 10, 8);
    c_delaycmd(9, "sprite", spr_susie_kneel_up);
    c_delaycmd(9, "imagespeed", 0);
    c_delayfacing(24, "u");
    c_sel(kr);
    c_walkdirect(kr_actor.x + 40, kr_actor.y + 20, 5);
    c_delaycmd(9, "sprite", spr_krisu_kneel_b);
    c_wait(5);
    c_customfunc(function()
    {
        with (scr_marker(camerax(), cameray(), spr_pxwhite))
        {
            scr_lerpvar("image_alpha", 1, 0, 12);
            image_xscale = 640;
            image_yscale = 480;
        }
        var beam = snd_play(snd_petrify_titanblast, 1, 1);
        audio_sound_set_track_position(beam, 1.5);
        scr_shakescreen(10, 10);
        with (instance_create(260, starting_y_pos + 200, obj_marker_fancy))
        {
            depth = -50;
            image_yscale = 2;
            image_xscale = 1.5;
            sprite_index = spr_tower_titanbeam_midsection;
            image_angle = 172;
            timer = 0;
            
            step_func = function()
            {
                timer++;
                if (timer == 15)
                    scr_lerpvar("image_xscale", 1.5, 0, 10, 1, "in");
            };
            
            scr_doom(self, 60);
        }
    });
    c_wait(6);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_kneel_serious);
    c_shakeobj();
    c_delayfacing(40, "u");
    c_wait(11);
    c_sel(kr);
    c_shakeobj();
    c_delayfacing(20, "u");
    c_wait(60);
    c_mus2("initloop", "titan_tower.ogg", 0);
    c_sel(su);
    c_sprite(spr_susie_point);
    c_shakeobj();
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\Ee* Wh..^1. what is that thing!?/%", "obj_ch4_DCC01_slash_Step_0_gml_486_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(0);
    c_halt();
    c_delaycmd(3, "imageindex", 1);
    c_delaycmd(6, "imageindex", 2);
    c_walk_wait("d", 2, 6);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EZ* It's..^1. It's a Titan!!/", "obj_ch4_DCC01_slash_Step_0_gml_498_0");
    c_facenext("susie", "h");
    c_msgnextloc("\\Eh* The hell is a.../%", "obj_ch4_DCC01_slash_Step_0_gml_500_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_point2);
    c_wait_talk();
    c_wait(5);
    c_sel(ra);
    c_emote("!", 45);
    c_sel(su);
    c_facing("u");
    c_emote("!", 45);
    c_customfunc(function()
    {
        var beam = snd_play(snd_petrify_titanblast, 1, 1);
    });
    c_wait(40);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0);
    c_sprite(spr_ralsei_running_left);
    c_walkdirect(ra_actor.x - 80, ra_actor.y + 20, 5);
    c_delaycmd(6, "imagespeed", 0);
    c_delaycmd(6, "sprite", spr_ralsei_kneel_serious);
    c_delayfacing(25, "u");
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_sprite(spr_susie_run_serious_right);
    c_walkdirect(su_actor.x + 195, su_actor.y + 10, 5);
    c_delaycmd(6, "imagespeed", 0);
    c_delaycmd(6, "sprite", spr_susie_kneel_up);
    c_delayfacing(28, "u");
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_sprite(spr_kris_run_right);
    c_walkdirect(kr_actor.x + 125, kr_actor.y + 20, 5);
    c_delaycmd(6, "sprite", spr_kris_dw_landed);
    c_delaycmd(6, "imageindex", 0);
    c_delaycmd(6, "imagespeed", 0);
    c_delayfacing(36, "u");
    c_wait(5);
    c_customfunc(function()
    {
        with (scr_marker(camerax(), cameray(), spr_pxwhite))
        {
            scr_lerpvar("image_alpha", 1, 0, 12);
            image_xscale = 640;
            image_yscale = 480;
        }
        scr_shakescreen(10, 10);
        with (instance_create(235, starting_y_pos + 200, obj_marker_fancy))
        {
            depth = -50;
            image_yscale = 2;
            image_xscale = 2;
            sprite_index = spr_tower_titanbeam_midsection;
            image_angle = 165;
            timer = 0;
            
            step_func = function()
            {
                timer++;
                if (timer == 15)
                    scr_lerpvar("image_xscale", 2, 0, 10, 1, "in");
            };
            
            scr_doom(self, 60);
        }
    });
    c_wait(60);
    c_sel(ra);
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Eo* There's..^1. there's no time to explain!!/", "obj_ch4_DCC01_slash_Step_0_gml_553_0");
    c_msgnextloc("\\Eo* Everyone^1, climb on^1! It won't attack itself!!/%", "obj_ch4_DCC01_slash_Step_0_gml_554_0");
    c_talk_wait();
    c_sprite(spr_ralsei_run_right);
    c_imagespeed(0.4);
    c_walkdirect(267, 1653, 15);
    c_delaycmd(11, "imagespeed", 0);
    c_delayfacing(11, "u");
    c_sel(su);
    c_sprite(spr_susie_run_serious_left);
    c_imagespeed(0.4);
    c_walkdirect(349, 1648, 15);
    c_wait(15);
    c_snd_play(snd_jump);
    c_sel(su);
    c_autodepth(0);
    c_sprite(spr_susie_dw_fall_ball);
    c_autowalk(0);
    c_jump(332, 1575, 16, 8);
    c_wait(9);
    c_sprite(spr_susie_climb);
    c_wait(2);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect(301, 1662, 18);
    c_facing("u");
    c_wait(3);
    c_sel(su);
    c_imagespeed(0.2);
    c_var("vspeed", -8);
    c_snd_play(snd_jump);
    c_sel(ra);
    c_autodepth(0);
    c_sprite(spr_ralsei_jump_ball);
    c_autowalk(0);
    c_imagespeed(0.4);
    c_jump(267, 1580, 16, 8);
    c_wait(9);
    c_sprite(spr_ralsei_climb);
    c_halt();
    c_imageindex(2);
    c_wait(5);
    c_imagespeed(0.2);
    c_var("vspeed", -8);
    c_sel(kr);
    c_wait(2);
    c_snd_play(snd_jump);
    c_autodepth(0);
    c_sprite(spr_kris_fall_ball);
    c_autowalk(0);
    c_jump(301, 1580, 16, 8);
    c_wait(9);
    c_sprite(spr_kris_climb_new);
    c_addxy(24, 40);
    c_wait(5);
    c_imagespeed(0.2);
    c_var("vspeed", -8);
    c_wait(20);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(90);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.plot = 250;
    room_goto(room_dw_churchc_titanclimb1);
}

if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    scr_setparty(1, 1, 0);
}
if (con == 2)
{
    con = 10;
    alarm[0] = 30;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_sprite(spr_kris_fell);
    c_setxy(162, 120);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_fell);
    c_setxy(295, 103);
    c_sel(ra);
    c_setxy(655, 170);
    c_facing("u");
    c_wait(5);
    c_var_instance(blackall, "image_alpha", 0);
    c_wait(90);
    c_sound_play(snd_noise);
    c_sel(kr);
    c_sprite(spr_krisb_defeat);
    c_shakeobj();
    c_sel(su);
    c_sprite(spr_susie_dw_landed);
    c_imageindex(1);
    c_shakeobj();
    c_wait(60);
    c_sound_play(snd_wing);
    c_sel(su);
    c_autowalk(1);
    c_facing("susieunhappy");
    c_facing("d");
    c_sel(kr);
    c_facing("d");
    c_wait(30);
    c_sel(su);
    c_facing("l");
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\Eb* Damnit..^1. what is it doing here...?/", "obj_ch4_DCA02_slash_Step_0_gml_81_0");
    c_msgnextloc("\\Ec* I guess it made the fountain^1, and now.../", "obj_ch4_DCA02_slash_Step_0_gml_82_0");
    c_msgnextloc("\\Ee* ..^1. it's looking for someone else to.../", "obj_ch4_DCA02_slash_Step_0_gml_83_0");
    c_msgnextloc("\\EV* .../", "obj_ch4_DCA02_slash_Step_0_gml_84_0");
    c_msgnextloc("\\EV* ..^1. let's go./%", "obj_ch4_DCA02_slash_Step_0_gml_85_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_talk();
    c_sel(su);
    c_facing("l");
    c_waitcustom();
}
if (con == 11 && !d_ex() && customcon == 1)
{
    con = 12;
    scr_flag_set(7, 1);
    obj_mainchara.x = kr_actor.x;
    obj_mainchara.y = kr_actor.y;
    with (kr_actor)
        visible = 0;
    with (obj_mainchara)
        visible = 1;
    global.interact = 0;
}
if (con == 12)
{
    var walk_limit_reached = false;
    with (kr_actor)
    {
        if (distance_to_object(obj_mainchara) > 30)
            walk_limit_reached = true;
    }
    if (walk_limit_reached && global.interact == 0)
    {
        con = 20;
        global.interact = 1;
        kr_actor.x = obj_mainchara.x;
        kr_actor.y = obj_mainchara.y;
        kr_actor.sprite_index = obj_mainchara.image_index;
        kr_actor.image_index = 0;
        kr_actor.visible = 1;
        susie_heal_pos_x = kr_actor.x + 54;
        susie_heal_pos_y = kr_actor.y - 12;
        with (obj_mainchara)
            visible = 0;
    }
}
if (con == 20 && customcon == 1)
{
    con = 20;
    customcon = 0;
    alarm[0] = 30;
    global.facing = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_emote("!", 30);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_dw_landed);
    c_imageindex(1);
    c_shakeobj();
    c_sound_play(snd_hurt1);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* K..^1. Kris!?/%", "obj_ch4_DCA02_slash_Step_0_gml_180_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect_wait(su_actor.x, susie_heal_pos_y, 8);
    c_walkdirect_wait(susie_heal_pos_x, susie_heal_pos_y, 8);
    c_sprite(spr_susie_look_react);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* Kris^1, you..^1. the glass^1, I didn't notice..^1. it.../", "obj_ch4_DCA02_slash_Step_0_gml_193_0");
    c_msgnextloc("\\ER* You're bleeding.../", "obj_ch4_DCA02_slash_Step_0_gml_194_0");
    c_msgnextloc("\\ES* Umm^1, I'll..^1. Here^1, let me heal it!/%", "obj_ch4_DCA02_slash_Step_0_gml_195_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_look_back);
    c_wait_talk();
    c_wait(5);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_kneel_heal);
    c_halt();
    c_sel(kr);
    c_visible(0);
    c_wait(6);
    c_sel(su);
    c_imageindex(1);
    c_wait(6);
    c_imageindex(2);
    c_wait(6);
    c_imageindex(3);
    c_wait(6);
    c_wait(15);
    c_sound_play(snd_ghostappear);
    c_var_instance(id, "susie_heal", true);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* Th..^1. that wasn't enough^1, huh.../%", "obj_ch4_DCA02_slash_Step_0_gml_233_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("u");
    c_wait(60);
    c_script_instance(id, snd_play, 1, snd_txtral);
    c_wait(3);
    c_script_instance_stop(id, snd_play);
    c_wait(60);
    c_sel(su);
    c_imageindex(4);
    c_emote("!", 30, 30, 20);
    c_script_instance(id, snd_play, 1, snd_txtral);
    c_wait(5);
    c_script_instance_stop(id, snd_play);
    c_wait(30);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\E8* ..^1. where..^1. is it.../%", "obj_ch4_DCA02_slash_Step_0_gml_268_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(1);
    c_facing("l");
    c_sel(kr);
    c_visible(1);
    c_sel(su);
    c_walkdirect_speed_wait(kr_actor.x + 60, kr_actor.y - 12, 4);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, Ralsei^1! Ralsei!/", "obj_ch4_DCA02_slash_Step_0_gml_288_0");
    c_facenext("ralsei", 12);
    c_msgnextloc("\\EC* ..^1. S-Susie!?/%", "obj_ch4_DCA02_slash_Step_0_gml_290_0");
    c_talk_wait();
    c_sel(ra);
    c_walkdirect_speed_wait(ra_actor.x, ra_actor.y + 62, 8);
    c_walkdirect_speed(kr_actor.x + 72, ra_actor.y + 62, 8);
    c_wait(15);
    c_wait_if(ra_actor, "x", "<=", kr_actor.x + 72);
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("u");
    c_speaker("susie");
    c_msgsetloc(0, "\\ER* Hey^1, Ralsei^1, Kris is.../", "obj_ch4_DCA02_slash_Step_0_gml_310_0");
    c_facenext("ralsei", 12);
    c_msgnextloc("\\EC* Kris...!?/%", "obj_ch4_DCA02_slash_Step_0_gml_312_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_walkdirect_speed(kr_actor.x + 72, kr_actor.y + 18, 6);
    c_wait_if(ra_actor, "y", "<=", kr_actor.y + 18);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left);
    c_wait_talk();
    c_wait(15);
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\ET* Could you tell me how to.../", "obj_ch4_DCA02_slash_Step_0_gml_331_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* Susie^1, could you move out of the way?/%", "obj_ch4_DCA02_slash_Step_0_gml_333_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_walkdirect(kr_actor.x + 72, kr_actor.y - 7, 8);
    c_delayfacing(9, "l");
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back_left);
    c_imageindex(0);
    c_autowalk(0);
    c_walkdirect_speed(kr_actor.x + 120, kr_actor.y - 12, 6);
    c_imageindex(1);
    c_wait(10);
    c_imageindex(0);
    c_halt();
    c_wait_talk();
    c_wait(15);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_spell_left);
    c_addxy(-65, -8);
    c_imageindex(0);
    c_imagespeed(0.2);
    c_wait(20);
    c_var_instance(id, "ralsei_heal", true);
    c_wait(25);
    c_autowalk(1);
    c_facing("l");
    c_addxy(65, 8);
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_sel(ra);
    c_autowalk(0);
    c_walkdirect_speed(kr_actor.x + 64, kr_actor.y - 7, 6);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Kris..^1. Kris^1, are you okay?/%", "obj_ch4_DCA02_slash_Step_0_gml_384_0");
    c_talk_wait();
    c_sound_play(snd_wing);
    c_sel(kr);
    c_autowalk(1);
    c_facing("d");
    c_addxy(0, 5);
    c_wait(15);
    c_facing("r");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* Umm^1, I tried to uh^1, heal^1, but.../%", "obj_ch4_DCA02_slash_Step_0_gml_399_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_autowalk(0);
    c_walk("r", 1, 8);
    c_imageindex(1);
    c_wait(8);
    c_imageindex(2);
    c_wait(30);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_sel(su);
    c_facing("l");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ea* Susie^1, I know you were just trying to help^1, but.../", "obj_ch4_DCA02_slash_Step_0_gml_418_0");
    c_msgnextloc("\\EQ* If someone's really hurt^1, don't..^1. try to fix it alone^1, okay?/", "obj_ch4_DCA02_slash_Step_0_gml_419_0");
    c_facenext("susie", "S");
    c_msgnextloc("\\ES* ..^1. uh^1, yeah. Okay. Got it./%", "obj_ch4_DCA02_slash_Step_0_gml_421_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_autowalk(1);
    c_facing("ralseinohat");
    c_facing("r");
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down_left_dw);
    c_wait_talk();
    c_wait(15);
    c_sel(ra);
    c_walkdirect_speed(kr_actor.x + 120, kr_actor.y - 7, 4);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_speed_wait(kr_actor.x + 60, kr_actor.y - 12, 4);
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_actortokris();
    c_actortocaterpillar();
    c_waitcustom();
}
if (con == 21 && !d_ex() && customcon == 1)
{
    con = 22;
    scr_flag_set(7, 0);
    global.interact = 0;
}
if (con == 22)
{
    var walk_limit_reached = obj_mainchara.x >= 480;
    if (walk_limit_reached)
    {
        con = 30;
        global.interact = 1;
    }
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 31;
    customcon = 0;
    c_waitcustom_end();
    scr_maincharacters_actors();
    global.facing = 0;
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(kr);
    c_facing("r");
    c_msgside("top");
    c_speaker("susie");
    c_msgsetsubloc(0, "\\E3* So^1, hey^1, uh^1, ~1's together!/", scr_get_team_name(), "obj_ch4_DCA02_slash_Step_0_gml_505_0");
    c_msgnextloc("\\E2* We gonna^1, uh^1, pose now?/", "obj_ch4_DCA02_slash_Step_0_gml_506_0");
    c_facenext("ralsei", 26);
    c_msgnextloc("\\EQ* Right^1! Um^1, sure!/%", "obj_ch4_DCA02_slash_Step_0_gml_508_0");
    c_talk_wait();
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
    c_sel(su);
    c_delaycmd(15, "sprite", spr_susie_pose_awkward);
    c_sel(ra);
    c_addxy(10, 0);
    c_walkdirect_speed(ra_actor.x, 207, 6);
    c_delaywalkdirect(7, 700, 207, 40);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Anyway^1, let's go.../%", "obj_ch4_DCA02_slash_Step_0_gml_550_0");
    c_talk_wait();
    c_wait(30);
    c_sel(kr);
    c_addxy(2, 2);
    c_facing("r");
    c_sel(su);
    c_addxy(-2, -2);
    c_facing("susieunhappy");
    c_facing("r");
    c_wait(30);
    c_sel(ra);
    c_setxy(-100, cameray() - 100);
    c_visible(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* .../%", "obj_ch4_DCA02_slash_Step_0_gml_571_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 31 && !i_ex(obj_cutscene_master))
{
    con = 99;
    scr_flag_set(7, 0);
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
        {
            follow = 0;
            fun = 1;
            visible = 0;
        }
    }
    global.interact = 0;
    global.facing = 0;
    global.plot = 120;
}
if (susie_heal)
{
    susie_heal_timer++;
    heal_siner += 0.8;
    if (susie_heal_timer == 1)
    {
        kris_heal_marker.x = kr_actor.x;
        kris_heal_marker.y = kr_actor.y;
        kris_heal_marker.depth = su_actor.depth - 100;
        var heal_effect = scr_dark_marker(su_actor.x, su_actor.y + 68, spr_susie_heal_effect);
        with (heal_effect)
        {
            image_blend = c_lime;
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 0.5, 15);
            scr_script_delayed(scr_lerpvar, 20, "image_alpha", 0.5, 0, 15);
        }
    }
    if (susie_heal_timer >= 1 && susie_heal_timer <= 2)
    {
        for (i = 0; i < 2; i += 1)
        {
            star[starcount] = instance_create(kr_actor.x + random(kr_actor.sprite_width), kr_actor.y + random(kr_actor.sprite_height), obj_marker);
            with (star[starcount])
            {
                image_angle = random(360);
                depth = -10;
                image_xscale = 1;
                image_yscale = 1;
                image_alpha = 2;
                image_speed = 0.25;
                hspeed = 2 - random(2);
                vspeed = -3 - random(2);
                friction = 0.2;
            }
            star[starcount].sprite_index = spr_sparestar_anim;
            star[starcount].image_blend = c_lime;
            starcount += 1;
        }
    }
    if (susie_heal_timer >= 2 && susie_heal_timer <= 30)
    {
        for (i = 0; i < starcount; i += 1)
        {
            with (star[i])
            {
                image_angle -= 10;
                image_alpha -= 0.1;
                if (image_alpha <= 0)
                    instance_destroy();
            }
        }
    }
    kris_color_blend = clamp(kris_color_blend + (sin(heal_siner) / 2), 0, 1);
    kris_heal_marker.image_blend = merge_color(c_white, c_gray, kris_color_blend);
    if (susie_heal_timer >= 30)
    {
        kris_heal_marker.image_blend = c_white;
        kris_heal_marker.visible = 0;
        susie_heal = false;
    }
}
if (ralsei_heal)
{
    ralsei_heal = false;
    snd_play(snd_spellcast);
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
}

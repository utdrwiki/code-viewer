if (hlinit == 0)
{
    topblack = scr_marker_ext(0, 0, spr_pxwhite, 7680, 1920, undefined, undefined, c_black, 700000, undefined, undefined, 0.5);
    scr_populatechars();
    hl[0] = scr_sprhighlight(kris, undefined);
    hl[1] = scr_sprhighlight(ralsei, undefined);
    hl[2] = scr_sprhighlight(susie, undefined);
    hlinit = 1;
}
if (con < 0)
    exit;
if (con == 0 && global.interact == 0 && !d_ex())
{
    var trig = 0;
    var dist = 180;
    var dbalpha = (lerp_ease_in(0, 1, clamp(camerax(), 0, dist), dist) / dist) + 0.5;
    kris.image_blend = merge_color(c_white, c_black, clamp(dbalpha, 0, 1));
    susie.image_blend = merge_color(c_white, c_black, clamp(dbalpha, 0, 1));
    ralsei.image_blend = merge_color(c_white, c_black, clamp(dbalpha, 0, 1));
    for (var i = 0; i < 3; i++)
        hl[i].image_alpha = -1 + (dbalpha * 2);
    topblack.image_alpha = dbalpha;
    with (obj_border_controller)
    {
        custom_effect_alpha = dbalpha;
        custom_effect_alpha_target = dbalpha;
    }
    with (obj_trigger)
    {
        if (extflag == "trig1")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        instance_create(720, 240, obj_solidblocksized);
        con = 1;
        global.interact = 1;
        global.facing = 0;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        kris.image_blend = c_white;
        ralsei.image_blend = c_white;
        susie.image_blend = c_white;
    }
}
if (con == 1)
{
    con = 2;
    c_pannable(1);
    c_pan(490, cameray(), 20);
    c_sel(kr);
    c_walkdirect(860, 198, 20);
    c_delayfacing(21, "r");
    c_sel(su);
    c_walkdirect(790, 182, 20);
    c_delayfacing(21, "l");
    c_sel(ra);
    c_walkdirect_wait(734, 186, 20);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. hey^1, Ralsei. If you know the whole prophecy already.../", "obj_ch4_DCA08C_slash_Step_0_gml_67_0");
    c_msgnextloc("\\E1* ..^1. why didn't you just say how to do the piano?/", "obj_ch4_DCA08C_slash_Step_0_gml_68_0");
    c_facenext("ralsei", "C");
    c_msgnextloc("\\EC* H-huh...? Well^1, I just thought.../", "obj_ch4_DCA08C_slash_Step_0_gml_70_0");
    c_msgnextloc("\\EQ* I just thought^1, isn't it better if I don't..^1. say anything?/%", "obj_ch4_DCA08C_slash_Step_0_gml_71_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_sel(kr);
    c_facing("l");
    c_wait_box(3);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.3);
    c_walk("l", 2, 6);
    c_delaycmd(7, "imagespeed", 0);
    c_wait_box(4);
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_wait_talk();
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* .../", "obj_ch4_DCA08C_slash_Step_0_gml_101_0");
    c_msgnextloc("\\EC* Why?/%", "obj_ch4_DCA08C_slash_Step_0_gml_102_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(0);
    c_imageindex(0);
    c_imagespeed(0.3);
    c_walk("l", 4, 6);
    c_delaycmd(7, "imagespeed", 0);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_wait_talk();
    c_wait(60);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* Um.../%", "obj_ch4_DCA08C_slash_Step_0_gml_125_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_speed_wait(730, 186, 6);
    c_sel(su);
    c_facing("susieunhappy");
    c_delayfacing(2, "u");
    c_delayfacing(8, "r");
    c_sel(kr);
    c_delayfacing(15, "u");
    c_delayfacing(20, "r");
    c_sel(ra);
    c_walkdirect_speed_wait(914, 186, 8);
    c_facing("u");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* H-Hey^1, I think I found a light!/%", "obj_ch4_DCA08C_slash_Step_0_gml_148_0");
    c_talk_wait();
    c_mus("free_all");
    c_sel(ra);
    c_walk_wait("u", 4, 6);
    c_wait(7);
    c_snd_play(snd_noise);
    c_wait(9);
    c_customfunc(function()
    {
        with (obj_border_controller)
        {
            custom_effect_alpha = 0;
            custom_effect_alpha_target = 0;
            stop_custom_effect();
        }
    });
    c_wait(1);
    c_var_instance(switch_marker, "visible", true);
    c_var_instance(switch_marker, "image_index", 1);
    c_var_instance(id, "drawblack", false);
    c_var_instance(topblack, "image_alpha", 0);
    c_snd_play(snd_locker);
    c_shake();
    c_emote("!", 30);
    c_sprite(spr_ralsei_surprised_down);
    c_shakeobj();
    c_sel(su);
    c_emote("!", 30);
    c_sprite(spr_susie_shock_r);
    c_shakeobj();
    c_sel(kr);
    c_facing("d");
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* Wh-whoops!!/%", "obj_ch4_DCA08C_slash_Step_0_gml_183_0");
    c_talk_wait();
    c_wait(5);
    c_sel(kr);
    c_autowalk(0);
    c_sel(su);
    c_autowalk(0);
    c_sel(ra);
    c_autowalk(0);
    c_sound_play(snd_closet_fall);
    c_var_instance(ra_actor, "gravity", 1);
    c_var_instance(ra_actor, "vspeed", -6);
    c_wait(8);
    c_var_instance(su_actor, "gravity", 1);
    c_var_instance(su_actor, "vspeed", -6);
    c_wait(8);
    c_var_instance(kr_actor, "gravity", 1);
    c_var_instance(kr_actor, "vspeed", -6);
    c_wait(15);
    c_var_lerp_to_instance(blackall, "image_alpha", 1, 30);
    c_var_lerp_to_instance(id, "alph", 0, 30);
    c_wait(20);
    c_var_instance(ra_actor, "gravity", 0);
    c_var_instance(ra_actor, "vspeed", 0);
    c_var_instance(su_actor, "gravity", 0);
    c_var_instance(su_actor, "vspeed", 0);
    c_var_instance(kr_actor, "gravity", 0);
    c_var_instance(kr_actor, "vspeed", 0);
    c_wait(60);
    c_sound_play(snd_sussurprise);
    c_wait(5);
    c_sound_play(snd_closet_impact);
    c_sound_play(snd_splat);
    c_pan(580, 480, 1);
    c_var_instance(id, "dovis", 1);
    c_wait(90);
    c_sel(su);
    c_setxy(776, 622);
    c_sprite(spr_susie_dw_landed);
    c_halt();
    c_imageindex(1);
    c_sel(kr);
    c_setxy(881, 640);
    c_sprite(spr_kris_fallen_dark);
    c_halt();
    c_imageindex(1);
    c_sel(ra);
    c_setxy(976, 642);
    c_sprite(spr_ralsei_splat_caterpillar);
    c_halt();
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 30);
    c_wait(45);
    c_sel(ra);
    c_shakeobj();
    c_sound_play(snd_noise);
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* O..^1. ow.../%", "obj_ch4_DCA08C_slash_Step_0_gml_270_0");
    c_talk_wait();
    c_wait(5);
    c_sel(ra);
    c_shakeobj();
    c_sound_play(snd_noise);
    c_wait(15);
    c_sound_play(snd_wing);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("d");
    c_setxy(1010, 628);
    c_wait(15);
    c_facing("l");
    c_sel(su);
    c_sound_play(snd_wing);
    c_facing("r");
    c_halt();
    c_emote("!", 30);
    c_wait(30);
    c_autowalk(1);
    c_walkdirect_wait(824, 624, 8);
    c_wait(1);
    c_autowalk(0);
    c_sprite(spr_susie_kneel_heal_right);
    c_halt();
    c_wait(6);
    c_imageindex(1);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EN* Here^1, lemme.../%", "obj_ch4_DCA08C_slash_Step_0_gml_310_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(1);
    c_walk_wait("l", 4, 8);
    c_var_instance(id, "ralsei_heal", true);
    c_sel(su);
    c_imageindex(2);
    c_wait_if(id, "ralsei_heal", "=", false);
    c_wait(30);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_sel(kr);
    c_sound_play(snd_wing);
    c_facing("d");
    c_wait(15);
    c_facing("r");
    c_sel(ra);
    c_autowalk(1);
    c_facing("ralseinohat");
    c_facing("l");
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Everyone feeling better?/", "obj_ch4_DCA08C_slash_Step_0_gml_349_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* ..^1. uh^1, yeah. Thanks./%", "obj_ch4_DCA08C_slash_Step_0_gml_351_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_talk();
    c_wait(5);
    c_sel(ra);
    c_walkdirect_speed_wait(770, 628, 6);
    c_facing("r");
    c_mus("free_all");
    c_mus2("initloop", "darkchurch_intro.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_wait(15);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    with (krlight)
        preset = 1;
    with (sulight)
        preset = 2;
    with (ralight)
        preset = 3;
    scr_flag_set(850, 3);
    con = 99;
}
if (ralsei_heal)
{
    ralsei_heal_timer++;
    if (ralsei_heal_timer == 1)
    {
        snd_play(snd_spellcast);
        ra_actor.auto_walk = 0;
        ra_actor.sprite_index = spr_ralsei_spell;
        with (ra_actor)
            scr_flip("x");
        ra_actor.x -= 60;
        ra_actor.y -= 7;
        ra_actor.image_speed = 0.3;
        ra_actor.image_index = 0;
    }
    if (ralsei_heal_timer == 15)
    {
        snd_play(snd_power);
        var actors = [kr_actor, su_actor, ra_actor];
        for (var i = 0; i < array_length(actors); i++)
        {
            var targx = actors[i].x;
            var targy = actors[i].y;
            if (i == 2)
            {
                targx -= 80;
                targy -= 5;
            }
            if (i == 1)
                targx -= 5;
            if (i == 0)
            {
                targx -= 10;
                targy -= 4;
            }
            targx += 40;
            var healamt = instance_create(targx, targy, obj_dmgwriter);
            with (healamt)
            {
                delay = 4;
                type = 3;
                specialmessage = 3;
            }
            healamt.damage = global.maxhp[global.char[i]];
            healamt.nohbounce = true;
            healamt.hspeed = 0;
            var healanim = instance_create(targx, targy, obj_healanim);
            healanim.target = actors[i].id;
            global.hp[global.char[i]] = global.maxhp[global.char[i]];
        }
    }
    if (ralsei_heal_timer == 38)
    {
        ra_actor.sprite_index = spr_ralsei_walk_left;
        with (ra_actor)
            scr_flip("x");
        ra_actor.x -= 20;
        ra_actor.y += 7;
        ra_actor.image_speed = 0;
        ra_actor.image_index = 0;
    }
    if (ralsei_heal_timer == 90)
    {
        ralsei_heal_timer = 0;
        ralsei_heal = false;
    }
}
if (dovis == 1)
{
    safe_delete(hl[0]);
    safe_delete(hl[1]);
    safe_delete(hl[2]);
    dovis = 0;
    krlight = instance_create(x, y, obj_light_following);
    with (krlight)
        setxy(899, 678);
    sulight = instance_create(x, y, obj_light_following);
    sulight.preset = 4;
    ralight = instance_create(x, y, obj_light_following);
    ralight.preset = 5;
    with (obj_light_following)
        size = clamp(distance_to_point(2122, 1960) / 5, 40, 200);
    with (obj_mainchara)
        setxy(886, 656);
    with (obj_darkness_overlay)
        active = true;
}

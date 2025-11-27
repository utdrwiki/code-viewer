if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    mus_volume(global.currentsong[1], 0, 30);
    mus_volume(global.currentsong[3], 0, 30);
}
if (con == 2)
{
    con = 3;
    with (sparkle_marker)
        visible = 0;
    with (sparkle_readable)
        instance_destroy();
    bg_vfx = instance_find(obj_church_night_vfx, 0);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_walkdirect(292, 67, 25);
    c_facing("susieunhappy");
    c_delayfacing(26, "u");
    c_sel(kr);
    c_walkdirect_wait(325, 74, 15);
    c_facing("u");
    c_wait(30);
    c_sel(kr);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. Kris.../", "obj_ch4_DCA15_slash_Step_0_gml_48_0");
    c_msgnextloc("\\E1* We..^1. haven't gotten any closer to opening this door./", "obj_ch4_DCA15_slash_Step_0_gml_49_0");
    c_msgnextloc("\\E0* .../", "obj_ch4_DCA15_slash_Step_0_gml_50_0");
    c_msgnextloc("\\EL* But..^1. I have an idea./", "obj_ch4_DCA15_slash_Step_0_gml_51_0");
    c_msgnextloc("\\E2* I think he might know./", "obj_ch4_DCA15_slash_Step_0_gml_52_0");
    c_msgnextloc("\\EA* The old man. He could know..^1. how to open it./", "obj_ch4_DCA15_slash_Step_0_gml_53_0");
    c_msgnextloc("\\EQ* Kris^1, you're thinking what I'm thinking^1, right?/", "obj_ch4_DCA15_slash_Step_0_gml_54_0");
    c_msgnextloc("\\EX* ..^1. Let's make a Dark World./%", "obj_ch4_DCA15_slash_Step_0_gml_55_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("r");
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch);
    c_imagespeed(0.2);
    c_addxy(-2, -1);
    c_wait_box(4);
    c_sel(su);
    c_halt();
    c_sprite(spr_susie_walk_up_lw);
    c_addxy(2, 1);
    c_wait_box(5);
    c_sel(su);
    c_facing("l");
    c_wait_box(6);
    c_sel(su);
    c_sprite(spr_susie_head_down_left);
    c_wait_box(7);
    c_sel(su);
    c_facing("susielighteyes");
    c_facing("l");
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(292, 107, 20);
    c_delayfacing(21, "u");
    c_sel(kr);
    c_walkdirect(331, 113, 20);
    c_delayfacing(21, "u");
    c_wait(60);
    c_sel(kr);
    c_emote("...", 30);
    c_sel(su);
    c_emote("...", 30);
    c_wait(60);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("r");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. So^1, uh^1, how the hell do you do that again?/", "obj_ch4_DCA15_slash_Step_0_gml_124_0");
    c_msgnextloc("\\EN* Queen said..^1. concentrate and stab into the earth./", "obj_ch4_DCA15_slash_Step_0_gml_126_0");
    c_msgnextloc("\\E2* Got anything sharp?/%", "obj_ch4_DCA15_slash_Step_0_gml_128_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("u");
    c_wait_box(2);
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_var_instance(anim_marker, "x", 292);
    c_var_instance(anim_marker, "y", 107);
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_var_instance(id, "animate_start", true);
    c_wait_if(id, "anim_index", "=", 6);
    c_snd_play(snd_wing);
    c_wait_if(id, "animate_start", "=", false);
    c_wait(30);
    c_var_instance(id, "animate_start", true);
    c_wait_if(id, "anim_index", "=", 2);
    c_snd_play(snd_bump);
    c_wait_if(id, "animate_start", "=", false);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Heh.../", "obj_ch4_DCA15_slash_Step_0_gml_170_0");
    c_msgnextloc("\\EK* ..^1. hey^1, Kris^1, you NORMALLY carry this around?/%", "obj_ch4_DCA15_slash_Step_0_gml_171_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(anim_marker, "sprite_index", spr_susie_kris_knife_blush);
    c_wait_talk();
    c_wait(30);
    c_sel(kr);
    c_facing("l");
    c_visible(1);
    c_var_instance(anim_marker, "sprite_index", spr_susie_knife_walk_right);
    c_var_instance(anim_marker, "image_index", 0);
    c_snd_play(snd_noise);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_knife_walk_right);
    c_setxy(292, 107);
    c_visible(1);
    c_var_instance(anim_marker, "visible", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EQ* Alright..^1. well^1, let's give it a try./%", "obj_ch4_DCA15_slash_Step_0_gml_203_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(0);
    c_autodepth(0);
    c_sprite(spr_krisu);
    c_imagespeed(0.2);
    c_walkdirect(368, 100, 30);
    c_delaycmd(31, "imagespeed", 0);
    c_delaycmd(31, "imageindex", 0);
    c_delaycmd(31, "sprite", spr_kris_diagonal);
    c_delaycmd(31, "depth", 100620);
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect_wait(320, 107, 30);
    c_halt();
    c_wait(15);
    c_sprite(spr_susie_knife_transition);
    c_var_lerp("image_index", 0, 5, 24);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EX* Concentrate on what I want^1, and.../%", "obj_ch4_DCA15_slash_Step_0_gml_230_0");
    c_talk_wait();
    c_wait(15);
    c_var_instance(anim_marker, "x", 320);
    c_var_instance(anim_marker, "y", 107);
    c_var_instance(anim_marker, "sprite_index", spr_susie_fountain_make);
    c_var_instance(anim_marker, "visible", 1);
    c_sel(su);
    c_visible(0);
    c_snd_play(snd_wing);
    c_var_instance(id, "animate_start", true);
    c_wait_if(id, "anim_index", "=", 3);
    c_var_instance(id, "animate_pause", true);
    c_customfunc(function()
    {
        target_flash_active = true;
        scr_delay_var("target_flash_active", false, 20);
    });
    c_wait(20);
    c_var_instance(id, "animate_pause", false);
    c_wait_if(id, "anim_index", "=", 5);
    c_snd_play(snd_grab);
    c_var_instance(fountain_make, "active", 1);
    c_wait(4);
    c_sel(kr);
    c_autodepth(1);
    c_var_lerp_to_instance(bg_vfx.overlay, "image_alpha", 0, 30, 2, "out");
    c_var_lerp_to_instance(white_bg, "image_alpha", 1, 30, 2, "out");
    c_wait_if(id, "anim_index", "=", 6);
    c_wait_if(id, "animate_start", "=", false);
    c_var_instance(anim_marker, "sprite_index", spr_susie_fountain_make_loop);
    c_var_instance(anim_marker, "image_index", 0);
    c_var_instance(anim_marker, "image_speed", 0.4);
    c_var_instance(kris_glow_overlay, "x", 368);
    c_var_instance(kris_glow_overlay, "y", 100);
    c_var_instance(kris_glow_overlay, "image_alpha", 1);
    c_var_instance(kris_glow_overlay, "image_speed", 0.4);
    c_wait(90);
    c_var_lerp_to_instance(kris_glow_overlay, "image_speed", 0, 60, 2, "out");
    c_var_lerp_to_instance(kris_glow_overlay, "image_alpha", 0, 60, 2, "out");
    c_var_lerp_to_instance(white_bg, "image_alpha", 0, 60, 2, "out");
    c_var_lerp_to_instance(bg_vfx.overlay, "image_alpha", 0.5, 60, 2, "out");
    c_wait_if(fountain_make, "releasetimer", "=", 1);
    c_var_instance(id, "animate_start", true);
    c_wait_if(id, "animate_start", "=", false);
    c_wait_if(fountain_make, "ceiltimer", ">=", 800);
    c_wait(30);
    c_waitcustom();
}
if (con == 3 && customcon == 1 && !d_ex())
{
    global.plot = 225;
    global.interact = 3;
    con = -1;
    if (array_length(global.currentsong) >= 2)
        snd_free(global.currentsong[2]);
    with (fountain_make)
        instance_destroy();
    scr_become_dark();
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_dw_churchb_fountain);
}
if (target_flash_active)
{
    snd_play(snd_fountain_target);
    blazetimer++;
    anim = instance_create((su_actor.x - 40) + (blazetimer * 6), su_actor.y + random(20), obj_animation);
    anim.sprite_index = spr_kris_make_fountain_flash;
    anim.image_speed = 0.5;
    anim.depth = 100520;
}
if (animate_start)
{
    if (anim_marker == -4)
        anim_marker = scr_marker(camerax() + (view_wport[0] / 2), cameray() + (view_hport[0] / 2), anim_sprite[anim_sprite_index][0]);
    if (!anim_init)
    {
        anim_init = true;
        anim_marker.sprite_index = anim_sprite[anim_sprite_index][0];
        anim_marker.image_index = anim_index;
        anim_marker.image_speed = 0;
        anim_timer = anim_sprite[anim_sprite_index][1][anim_index] / anim_modifier;
    }
    if (animate_pause)
        exit;
    anim_timer--;
    if (anim_timer <= 0)
    {
        anim_index++;
        if (anim_index < array_length(anim_sprite[anim_sprite_index][1]))
        {
            anim_timer = anim_sprite[anim_sprite_index][1][anim_index] / anim_modifier;
            anim_marker.image_index = anim_index;
        }
        else
        {
            animate_start = false;
            anim_init = false;
            anim_timer = 0;
            anim_index = 0;
            if (anim_sprite_index < (array_length(anim_sprite) - 1))
                anim_sprite_index++;
        }
    }
}

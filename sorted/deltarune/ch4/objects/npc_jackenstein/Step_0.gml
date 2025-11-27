event_inherited();
var rmx = 686;
var rmy = 370;
if (state != current_state)
{
    state = current_state;
    state_init = false;
    state_loaded = false;
}
if (state == 0)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 1)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_run;
        anim_speed = 0.4;
        anim_index = 0;
    }
    if (state_loaded)
        exit;
    run_timer++;
    if (run_timer < 60)
    {
        if ((run_timer % 6) == 1)
            snd_play_x(snd_noise, 0.8, 1.8);
    }
    if (run_timer == 60)
    {
        visible = 0;
        defeatanim = instance_create(x, y, obj_defeatanim_x);
        defeatanim.sprite_index = current_sprite_index;
        defeatanim.image_index = 0;
        defeatanim.image_speed = 0.4;
        defeatanim.image_xscale = image_xscale;
        defeatanim.image_yscale = image_yscale;
        defeatanim.sweat_offset_x = 90;
        defeatanim.sweat_offset_y = -6;
    }
    if (run_timer == 90)
    {
        x = 2080 + rmx;
        current_sprite_index = spr_npc_jackenstein_cover_face_right;
        hspeed = 0;
        var shake = instance_create(x, y, obj_shake);
        shake.permashake = 1;
        with (shake)
            scr_delay_var("permashake", 0, 30);
        snd_play(snd_closet_impact);
        snd_play(snd_closet_impact);
        snd_play(snd_closet_impact);
        snd_play(snd_glassbreak);
    }
    if (run_timer == 150)
    {
        visible = 1;
        state_loaded = true;
    }
}
if (state == 2)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_scared;
        anim_speed = grief ? 0.8 : 0.4;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 3)
{
    if (!state_init)
    {
        scr_script_delayed(snd_play, 5, snd_wing);
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_lift_head_both;
        anim_speed = 0;
        scr_lerpvar("anim_index", 0, 4, 15);
        scr_delay_var("state_loaded", true, 16);
    }
}
if (state == 4)
{
    if (!state_init)
    {
        snd_play(snd_whip_crack_only);
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_lift_head_both;
        anim_speed = 0;
        scr_lerpvar("anim_index", 5, 7, 4);
        scr_delay_var("state_loaded", true, 5);
    }
}
if (state == 5)
{
    visible = true;
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein;
        anim_speed = 0;
        anim_index = 0;
    }
    flash_timer++;
    if (flash_timer == 1)
        scr_lerpvar("beam_siner_amt", 0, 0.8, 30, 3, "out");
    beam_siner += beam_siner_amt;
    if (flash_timer < 30)
        beam_alpha = clamp(beam_alpha + (sin(beam_siner) / 2), 0.2, 0.8);
    else
        beam_alpha = scr_movetowards(beam_alpha, 1, 0.2);
    if (flash_timer == 45)
    {
        play_sound = true;
        sound_index = audio_play_sound(snd_quake_nes, 1, 1);
        scr_lerpvar("beam_width", 0, 5, 5, 4, "out");
        scr_lerpvar("beam_rotation_amt", 0, 0.2, 5, 4, "out");
    }
    if (play_sound)
    {
        play_sound_pitch += 0.2;
        audio_sound_pitch(sound_index, play_sound_pitch);
    }
    else if (sound_index != -4)
    {
        audio_stop_sound(sound_index);
    }
    if (flash_timer == 70)
    {
        scr_lerpvar("beam_width", 3, 60, 15, 4, "out");
        scr_lerpvar("beam_rotation_amt", 0.2, 3, 5, 4, "out");
        scr_delay_var("play_sound", false, 45);
        scr_delay_var("state_loaded", true, 45);
    }
    beam_rotation += beam_rotation_amt;
}
if (state == 6)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_clutch_head;
        anim_speed = 0.4;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 7)
{
    if (!state_init)
    {
        state_init = true;
        heal_marker = scr_dark_marker(x + 98, y - 10, spr_npc_jackenstein_scared_face);
        heal_marker.depth = depth - 10;
        heal_marker.visible = 0;
        heal_marker.image_alpha = 0;
        heal_marker.image_blend = c_green;
        darkened = false;
        current_sprite_index = spr_npc_jackenstein_scared;
        anim_speed = 0.4;
        anim_index = 0;
        depth = 100000;
        heal_timer = 0;
    }
    if (state_loaded)
        exit;
    heal_timer++;
    if (heal_timer == 1)
    {
        heal_marker.visible = 1;
        heal_marker.image_index = 0;
        heal_marker.image_speed = anim_speed;
        scr_lerpvar_instance(heal_marker, "image_alpha", 0, 1, 10);
    }
    if (heal_timer == 15)
    {
        snd_play(snd_power);
        var healanim = instance_create(heal_marker.x, heal_marker.y, obj_healanim);
        healanim.target = heal_marker.id;
    }
    if (heal_timer == 30)
        scr_lerpvar_instance(heal_marker, "image_alpha", 1, 0, 10);
    if (heal_timer == 60)
    {
        anim_speed = 0;
        state_loaded = true;
        grief = false;
    }
}
if (state == 8)
{
    if (!state_init)
    {
        state_init = true;
        heal_marker = scr_dark_marker(x + 96, y - 20, spr_npc_jackenstein_scared_head);
        heal_marker.depth = depth - 10;
        heal_marker.visible = 0;
        heal_marker.image_alpha = 0;
        darkened = false;
        current_sprite_index = spr_npc_jackenstein_scared;
        anim_speed = grief ? 0.8 : 0.4;
        anim_index = 0;
        depth = 100000;
        heal_timer = 0;
    }
    if (state_loaded)
        exit;
    heal_timer++;
    if (heal_timer == 1)
    {
        heal_marker.visible = 1;
        heal_marker.image_index = 0;
        heal_marker.image_speed = anim_speed;
        scr_lerpvar_instance(heal_marker, "image_alpha", 0, 1, 10);
    }
    if (heal_timer == 15)
    {
        if (obj_mainchara.x >= (1670 + rmx))
            snd_play(snd_power);
        var healanim = instance_create(heal_marker.x, heal_marker.y, obj_healanim_overworld);
        healanim.target = heal_marker.id;
    }
    if (heal_timer == 30)
        scr_lerpvar_instance(heal_marker, "image_alpha", 1, 0, 10);
    if (heal_timer == 50)
        state_loaded = true;
}
if (state == 9)
{
    if (!state_init)
    {
        state_init = true;
        hug_timer = 0;
        current_sprite_index = spr_jackenstein_party_hug;
        anim_speed = 0;
        anim_index = 0;
        scr_lerpvar("anim_index", 0, 5, 30);
    }
    hug_timer++;
    if (hug_timer == 31)
    {
        current_sprite_index = spr_jackenstein_party_nuzzle;
        anim_speed = 0.2;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 10)
{
    if (!state_init)
    {
        state_init = true;
        hug_timer = 0;
        current_sprite_index = spr_jackenstein_party_hug;
        anim_speed = 0;
        anim_index = 5;
        state_loaded = true;
    }
    hug_timer++;
    if (hug_timer == 6)
        current_state = 0;
}
if (state == 11)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_cover_face;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
        snd_play(snd_wing);
        scr_shakeobj();
    }
}
if (state == 12)
{
    if (!state_init)
    {
        state_init = true;
        heal_marker = scr_dark_marker(x + 16, y + 26, spr_npc_jackenstein_clutch_head_isolate);
        heal_marker.depth = depth - 10;
        heal_marker.visible = 0;
        heal_marker.image_alpha = 0;
        darkened = false;
        current_sprite_index = spr_npc_jackenstein_clutch_head;
        anim_speed = 0.4;
        anim_index = 0;
        depth = 100000;
        heal_timer = 0;
    }
    if (state_loaded)
        exit;
    heal_timer++;
    if (heal_timer == 1)
    {
        heal_marker.visible = 1;
        heal_marker.image_index = 0;
        heal_marker.image_speed = anim_speed;
        scr_lerpvar_instance(heal_marker, "image_alpha", 0, 1, 10);
    }
    if (heal_timer == 15)
    {
        snd_play(snd_power);
        var healanim = instance_create(heal_marker.x, heal_marker.y, obj_healanim);
        healanim.target = heal_marker.id;
    }
    if (heal_timer == 30)
        scr_lerpvar_instance(heal_marker, "image_alpha", 1, 0, 10);
    if (heal_timer == 50)
    {
        with (heal_marker)
            instance_destroy();
        anim_speed = 0;
        grief = true;
        state_loaded = true;
    }
}
if (state == 13)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_npc_jackenstein_talk;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
    }
    if (i_ex(obj_writer) && global.typer == 83)
    {
        if (obj_writer.halt >= 1)
        {
            anim_speed = 0;
            anim_index = 0;
        }
        else
        {
            anim_speed = 0.2;
        }
    }
    else
    {
        anim_speed = 0;
        anim_index = 0;
    }
}

if (global.plot < 62)
    exit;
if (vent_close)
{
    vent_close = false;
    sound_play(snd_wing);
    scr_lerp_var_instance(vent_cover_broken_marker, "image_angle", vent_cover_broken_marker.image_angle, 0, 3);
}
if (vent_shake)
{
    vent_shake = false;
    sound_play(snd_noise);
    with (vent_cover_broken_marker)
        scr_shakeobj();
}
if (vent_fall)
{
    vent_fall = false;
    sound_play(snd_wing);
    scr_lerp_var_instance(vent_cover_broken_marker, "image_angle", 0, -90, 8, -1, "out");
}
with (obj_homealone_heart)
    scr_depth();
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 3;
    global.facing = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(150, 240);
    c_autowalk(0);
    c_sprite(spr_dkris_ul_soul);
    c_halt();
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
    if (global.plot >= 63)
    {
        c_wait(30);
        c_imagespeed(0.15);
        c_walkdirect_wait(144, 110, 30);
        c_halt();
        c_wait(15);
        c_var_instance(id, "vent_close", true);
        c_sprite(spr_dkris_ul_soul_fix_vent);
        c_wait(4);
        c_imageindex(1);
        c_var_instance(id, "vent_shake", true);
        c_wait(40);
        c_sprite(spr_dkris_dl_soul_walk);
        c_imageindex(0);
        c_wait(30);
        c_imagespeed(0.15);
        c_walkdirect_wait(145, 148, 30);
        c_halt();
    }
    else
    {
        c_imagespeed(0.15);
        c_walkdirect_wait(145, 148, 60);
        c_halt();
        c_wait(15);
    }
    c_sprite(spr_homealone_kris_throw);
    c_halt();
    c_wait(30);
    c_imageindex(1);
    c_wait(20);
    c_var_lerp_to_instance(kr_actor, "image_index", 4, 8);
    c_wait(4);
    c_snd_play(snd_hurt1);
    c_soundplay(snd_grab);
    c_var_instance(id, "shake_present", true);
    c_shakeobj();
    c_wait(30);
    c_sprite(spr_dkris_dl);
    c_autodepth(0);
    c_depth(present_cover_marker.depth - 10);
    if (global.plot >= 63)
    {
        c_imagespeed(0.15);
        c_walk_wait("d", 2, 25);
        c_halt();
        c_sprite(spr_dkris_ul);
        c_wait(60);
        c_imagespeed(0.15);
        c_sprite(spr_dkris_dl);
        c_walk_wait("d", 3, 30);
    }
    else
    {
        c_wait(30);
        c_imagespeed(0.15);
        c_walk_wait("d", 1, 120);
    }
    c_customfunc(function()
    {
        with (scr_marker_fromasset(findsprite(spr_pxwhite_1, "SafetyBlocks"), -40))
            scr_doom(id, 30);
        with (scr_marker_fromasset(findsprite(spr_pxwhite, "SafetyBlocks"), -40))
            scr_doom(id, 30);
    });
    c_shake();
    c_soundplay(snd_impact);
    c_soundplay(snd_doorclose);
    c_var_instance(door_marker, "visible", 1);
    if (global.plot >= 63)
    {
        c_var_instance(id, "vent_shake", true);
        c_wait(15);
        c_var_instance(id, "vent_fall", true);
    }
    c_wait(30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (present[0].x >= 160 && temp_collider != -4)
{
    with (temp_collider)
        instance_destroy();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    heart = instance_create(131, 175, obj_homealone_heart);
    with (obj_mainchara)
    {
        cutscene = 1;
        freeze = 1;
        visible = 0;
    }
    heart_control = true;
    show_heart = true;
    if (global.plot < 63)
        global.plot = 63;
    scr_flag_set(7, 1);
    con = 99;
}
if (heart_control)
{
    if (show_heart)
    {
        var pressed_up = up_p();
        if (!pressed_up)
        {
            heart_timer++;
            if (heart_timer == 1800)
            {
                show_heart = false;
                heart_timer = 0;
                global.interact = 1;
                with (obj_homealone_heart)
                {
                    x = 131;
                    scr_lerpvar("y", y, y - 15, 30);
                }
            }
        }
        else
        {
            global.interact = 1;
            with (obj_homealone_heart)
            {
                x = 131;
                scr_lerpvar("y", y, y - 15, 30);
            }
            heart_timer = 0;
            show_heart = false;
        }
    }
    if (global.interact == 1)
    {
        heart_timer++;
        if (heart_timer == 45)
        {
            global.interact = 0;
            show_controls = true;
        }
    }
    if (show_controls)
    {
        if (!sunkus_kb_check_pressed(1) && !scr_gamepad_check_any())
        {
            controls_timer++;
            if (controls_timer == 1800)
            {
                writer_fadein = true;
                with (writer)
                    scr_lerpvar("writingy", writingy, writingy - 30, 20);
            }
        }
        else
        {
            writer_fadeout = true;
            with (writer)
                scr_lerpvar("writingy", writingy, writingy + 30, 10);
        }
        if (writer_fadein)
        {
            writer_blend = clamp(writer_blend + 0.05, 0, 1);
            var blend = writer_blend;
            with (writer)
                mycolor = merge_color(c_black, c_white, blend);
            if (blend >= #010000)
                writer_fadein = false;
        }
        if (writer_fadeout)
        {
            writer_blend = clamp(writer_blend - 0.15, 0, 1);
            var blend = writer_blend;
            with (writer)
                mycolor = merge_color(c_black, c_white, blend);
            if (blend <= c_black)
            {
                writer_fadeout = false;
                show_heart = false;
                show_controls = false;
                heart_control = false;
            }
        }
    }
}
if (shake_present)
{
    shake_present = false;
    with (present_marker)
        scr_shakeobj();
    with (present_cover_marker)
        scr_shakeobj();
}

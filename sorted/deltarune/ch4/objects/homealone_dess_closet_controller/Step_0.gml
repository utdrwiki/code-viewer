if (con < 0)
    exit;
if (con == 1)
{
    con = 99;
    global.interact = 1;
    with (obj_homealone_heart)
        instance_destroy();
    closet = instance_create(108, 1, obj_noellehouse_dess_closet);
    closet.depth = 30000;
    if (!i_ex(obj_homealone_heart))
    {
        heart = instance_create(110, 65, obj_homealone_heart);
        heart.depth = 40000;
        heart.cutscene = 1;
        with (obj_mainchara)
        {
            y = -200;
            cutscene = 1;
            freeze = 1;
            visible = 0;
        }
    }
    kris = instance_create(135, 78, obj_homealone_dess_closet_kris);
    kris.visible = false;
    kris.depth = obj_homealone_heart.depth - 20;
    pile_marker = scr_marker(closet.x + 1, closet.y + 68, spr_noellehouse_dess_closet_pile);
    pile_marker.depth = kris.depth - 100;
    santa[0] = instance_create(144, closet.y + 45, obj_homealone_dancing_santa_mini);
    santa[1] = instance_create(174, closet.y + 63, obj_homealone_dancing_santa_mini);
    santa[1].santa_type = 1;
    for (var i = 0; i < array_length_1d(santa); i++)
        santa[i].depth = pile_marker.depth + 200;
    target_santa = -4;
    pan_closet = false;
    heart_pushback = false;
    kris_ready = 0;
    push_velocity = 0;
    push_timer = 0;
    present = instance_create(162, closet.y + 40, obj_homealone_present);
    present.depth = pile_marker.depth + 200;
    present2 = instance_create(222, closet.y + 45, obj_homealone_present);
    present2.sprite_index = spr_noellehouse_present_thin;
    present2.depth = pile_marker.depth + 200;
    present2.movespeed = 2;
    var santa_xpos_a = santa[0].x;
    var santa_ypos_a = santa[0].y;
    var santa_xpos_b = santa[1].x + 10;
    var santa_ypos_b = santa[1].y;
    with (kris)
    {
        santax[0] = santa_xpos_a;
        santay[0] = santa_ypos_a;
        santax[1] = santa_xpos_b;
        santay[1] = santa_ypos_b;
    }
    guitar_marker = instance_create(277, 40, obj_homealone_dess_guitar);
    guitar_marker.depth = obj_homealone_heart.depth + 20;
    ladder_marker = scr_marker(295, 69, spr_noellehouse_dess_closet_ladder);
    ladder_marker.depth = kris.depth + 10;
    with (obj_npc_room)
        instance_destroy();
    kris_pickup = true;
    with (kris)
    {
        x = 184;
        image_speed = 0;
        pickup_stick = true;
    }
    kris_press_santa = false;
    kris_swing_heart = false;
    shelf_cover[0] = scr_marker(162, 58, spr_noellehouse_dess_closet_shelf_cover);
    shelf_cover[1] = scr_marker(132, 58, spr_noellehouse_dess_closet_shelf_cover);
    shelf_cover[2] = scr_marker(193, 58, spr_noellehouse_dess_closet_shelf_cover);
    shelf_cover[3] = scr_marker(281, 58, spr_noellehouse_dess_closet_shelf_cover);
    for (var i = 0; i < array_length_1d(shelf_cover); i++)
    {
        shelf_cover[i].image_xscale = 1.2;
        shelf_cover[i].depth = obj_homealone_heart.depth - 5;
    }
}
if (open_closet)
{
    open_closet = false;
    with (closet)
        open_door = true;
}
if (close_closet)
{
    close_closet = false;
    with (closet)
        close_door = true;
}
if (closet_fadein)
{
    closet_fadein = false;
    kris.visible = true;
    with (closet)
    {
        kris_active = false;
        closet_fadein = true;
    }
    scr_delay_var("pan_closet", true, 30);
    scr_delay_var("kris_pickup", true, 30);
}
if (pan_closet)
{
    if (camerax() != 20 || cameray() != -20)
    {
        camerax_set(scr_movetowards(camerax(), 20, 1));
        cameray_set(scr_movetowards(cameray(), -20, 1));
    }
    else
    {
        pan_closet = false;
        global.interact = 0;
    }
}
if (finish_sequence)
{
    with (obj_homealone_heart)
    {
        x = scr_movetowards(x, other.guitar_marker.x + 20, 2);
        y = scr_movetowards(y, other.guitar_marker.y + 10, 2);
    }
    finish_timer++;
    if (finish_timer == 1)
    {
        snd_play(snd_susie_strum_mistake);
        global.interact = 1;
        with (obj_homealone_dancing_santa_mini)
        {
            if (is_active)
            {
                turn_on = false;
                alarm[0] = 1;
            }
        }
    }
    else if (finish_timer == 8)
    {
        with (obj_homealone_dess_convo)
            interrupt_convo();
        with (kris)
        {
            kris_ready = 0;
            visible = 0;
        }
        var _kris_x = kris.x;
        var _kris_y = kris.y;
        var _kris_sprite = 5572;
        var _emote = scr_marker(_kris_x + 10, _kris_y - 10, spr_exc);
        scr_doom(_emote, 31);
        with (closet)
        {
            kris_sprite = _kris_sprite;
            kris_x = _kris_x;
            kris_y = _kris_y;
            kris_active = true;
            scr_lerpvar("kris_index", 0, 2, 6);
        }
        finish_con = 1;
        scr_delay_var("finish_con", 5, 31);
    }
    if (finish_con == 5)
    {
        if (closet.kris_x != 232)
        {
            with (closet)
            {
                kris_sprite = spr_noellehouse_dess_kris_walk_right;
                kris_anim_speed = 0.2;
                kris_x = scr_movetowards(kris_x, 232, 6);
            }
        }
        else
        {
            finish_con = 6;
        }
    }
    if (finish_con == 6)
    {
        finish_con = 7;
        scr_delay_var("finish_con", 8, 45);
        with (closet)
        {
            kris_sprite = spr_noellehouse_dess_kris_hockey_swing;
            kris_index = 0;
            kris_anim_speed = 0;
            scr_delay_var("kris_index", 1, 20);
            scr_script_delayed(scr_lerpvar, 20, "kris_y", kris_y, kris_y - 30, 12, 3, "out");
            scr_script_delayed(scr_lerpvar, 20, "kris_x", kris_x, kris_x + 10, 12, 3, "out");
        }
        with (obj_noellehouse_dess_closet)
            scr_script_delayed(scr_lerpvar, 24, "door_alpha", 0, 1, 6);
        with (obj_homealone_vent_overlay)
            scr_delay_var("dess_closet_alpha_target", 0.5, 16);
    }
    if (finish_con == 8)
    {
        finish_con = -1;
        with (obj_noellehouse_dess)
            con = 50;
    }
}

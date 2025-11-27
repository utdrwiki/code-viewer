if (heart == 0)
    heart = instance_find(obj_homealone_heart, 0);
if (i_ex(heart))
    hearttargetx = clamp(heart.x + 26, 144, 276);
if (scr_debug())
{
    if (keyboard_check_pressed(ord("Q")))
    {
        santaactive[0] = 1;
        snd_play_volume(snd_santa_laugh, 0.6);
    }
    if (keyboard_check_pressed(ord("W")))
    {
        santaactive[1] = 1;
        snd_play_volume(snd_santa_laugh_low_energy, 0.6);
    }
}
if (attackhit == 1)
{
    if (i_ex(obj_homealone_heart))
    {
        push_velocity += 8;
        var velocity = push_velocity;
        if (abs(obj_homealone_heart.x - 110) > 4 || abs(obj_homealone_heart.y - 30) > 4)
        {
            with (obj_homealone_heart)
                scr_obj_movetowards_point(110, 30, velocity);
        }
        else
        {
            push_timer++;
            if (push_timer == 1)
            {
                with (obj_homealone_heart)
                {
                    x += 2;
                    scr_minishakeobj();
                }
            }
            if (push_timer >= 4)
            {
                push_timer = 0;
                attackhit = 0;
                push_velocity = 0;
                global.interact = 0;
            }
        }
    }
}
if (is_tired)
    exit;
if (kris_ready == 0)
{
    if (pickup_stick)
    {
        animate_timer++;
        sprite_index = spr_noellehouse_dess_kris_hockey_pickup;
        image_speed = 0;
        image_index = (animate_timer * 0.05) % 5;
        if (heart.x >= 120)
        {
            kris_ready = 1;
            animate_timer = 0;
        }
    }
}
else if (kris_ready == 1)
{
    if (pickup_stick)
    {
        animate_timer++;
        if (animate_timer == 1)
        {
            sprite_index = spr_noellehouse_dess_kris_hockey_pickup;
            image_speed = 0;
            image_index = 6;
        }
        if (animate_timer == 6)
            image_index = 7;
        if (animate_timer == 11)
        {
            snd_play(snd_grab);
            image_index = 8;
            stick_marker.visible = 0;
        }
        if (animate_timer == 14)
            image_index = 9;
        if (animate_timer == 17)
            image_index = 10;
        if (animate_timer == 26)
        {
            pickup_stick = false;
            animate_timer = 0;
            kris_ready = 2;
        }
    }
}
if (kris_ready < 2)
    exit;
if (mode == 0)
{
    if (heart.y >= 44 && heart.x >= 120 && !(heart.x <= 160 && heart.y >= 50) && abs(x - hearttargetx) < 30 && santaactive[0] == 0 && santaactive[1] == 0)
    {
        attackjump = 1;
        if (heart.y >= 62)
            attackjump = 0;
        walkcon = -1;
        mode = 1;
        attackcon = 0;
        attacktimer = 0;
        speed = 0;
        gravity = 0;
        friction = 0;
    }
    if (attacktired > 0)
        attacktired -= 0.1;
    if (walkcon == 0)
    {
        sprite_index = spr_noellehouse_dess_kris_walk_left;
        walktimer++;
        if (santaactive[0] || santaactive[1])
            walktimer = walkthreshold;
        if (walktimer >= walkthreshold)
        {
            santawalk = -1;
            if (santaactive[0] == 1)
            {
                walktargetx = santax[0];
                santawalk = 0;
            }
            else if (santaactive[1] == 1)
            {
                walktargetx = santax[1];
                santawalk = 1;
            }
            else if (x >= heart.x)
            {
                walktargetx = heart.x - (4 + irandom(18));
            }
            else
            {
                walktargetx = heart.x + (4 + irandom(18));
            }
            walkcon = 1;
            var _distance = x - walktargetx;
            hspeed = -(_distance / 10);
            if (santawalk < 0)
                hspeed = clamp(hspeed, -6, 6);
            image_speed = abs(hspeed / 8);
            walktimer = irandom(3);
            if (santawalk >= 0)
                walktimer = 0;
            image_index = 1;
        }
    }
    if (walkcon == 1)
    {
        var finishedwalking = 0;
        walktimer++;
        if (walktimer >= 11)
            finishedwalking = 1;
        if (santawalk < 0 && abs(x - hearttargetx) > 30)
            finishedwalking = 0;
        if ((x <= 140 && hspeed < 0) || (x >= 280 && hspeed > 0))
        {
            finishedwalking = 1;
        }
        else if (x <= 140 || x >= 280)
        {
            if (walktimer >= 11)
                finishedwalking = 1;
        }
        if (finishedwalking)
        {
            hspeed = 0;
            image_speed = 0;
            image_index = 0;
            walktimer = irandom(10);
            walkcon = 0;
            if (santawalk >= 0)
            {
                santatimer = 0;
                walktimer = 0;
                mode = 2;
            }
        }
    }
}
if (mode == 1)
{
    if (attackcon == 0)
    {
        sprite_index = spr_noellehouse_dess_kris_hockey_swing_left;
        image_speed = 0;
        image_index = 0;
        attacktargetx = hearttargetx;
        var _distance = x - attacktargetx;
        if (abs(_distance) < 4)
        {
            attackcon = 2;
        }
        else
        {
            hspeed = -(_distance / 6);
            attackcon = 1;
            vspeed = -3;
            gravity = 1;
        }
    }
    if (attackcon == 1)
    {
        attacktimer++;
        if (attacktimer >= 6)
        {
            if (attackjump == 0)
            {
                friction = 2;
            }
            else
            {
                vspeed = -6 - random(1);
                gravity = 1;
                hspeed = -2;
            }
            attackcon = 2;
            attacktimer = 0;
        }
    }
    if (attackcon == 2)
    {
        attacktimer++;
        if (attacktimer >= 4)
        {
            attackcon = 3;
            attacktimer = 0;
            if (attackjump == 0)
            {
                hspeed = -7;
                friction = 1;
            }
        }
    }
    if (attackcon == 3)
    {
        if (attacktimer == 0)
            snd_play(snd_swing);
        if (gravity == 0)
            friction = 1;
        image_index += 0.5;
        if (image_index > 3)
            image_index = 3;
        if (image_index >= 1 && image_index < 2)
        {
            var hitHeart = 0;
            if (collision_rectangle(x - 10, y - 14, x + 32, y + 32, heart, 1, 1))
                hitHeart = 1;
            if (collision_rectangle(x - 22, y, x + 32, y + 20, heart, 1, 1))
                hitHeart = 1;
            if (collision_rectangle(x - 16, y - 6, x + 2, y + 2, heart, 1, 1))
                hitHeart = 1;
            if (hitHeart == 1)
            {
                if (attackhit == 0)
                {
                    attackhit = 1;
                    snd_play(snd_hurt1);
                    hearthits++;
                    if (hearthits == 1 || hearthits == 5 || hearthits == 10 || hearthits == 20 || hearthits == 30)
                        global.lhp--;
                    global.interact = 1;
                    var d = obj_homealone_heart.depth;
                    obj_homealone_heart.depth = 30000;
                    with (obj_homealone_heart)
                        scr_delay_var("depth", d, 18);
                    with (obj_event_manager)
                        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_8, UnknownEnum.Value_937);
                }
            }
        }
        attacktimer++;
        if (attacktimer >= (17 + attacktired))
        {
            attacktimer = 0;
            mode = 0;
            attack_number++;
            walkcon = 0;
            attackcon = 0;
            friction = 0;
            gravity = 0;
            speed = 0;
            if (attacktired < 10)
                attacktired++;
            attackhit = 0;
        }
    }
}
if (mode == 2)
{
    cringe = false;
    notice = false;
    sprite_index = spr_noellehouse_dess_kris_reach_stick;
    if (santawalk == 1)
        sprite_index = spr_noellehouse_dess_kris_hockey_mid_stand_left;
    image_speed = 0.1;
    santatimer++;
    var targetTime = 50;
    if (santawalk == 1)
        targetTime = 70;
    if (santatimer >= targetTime)
    {
        var type = santawalk;
        with (obj_homealone_dancing_santa_mini)
        {
            if (santa_type == type && is_active)
            {
                turn_on = false;
                alarm[0] = 1;
            }
        }
        snd_play(snd_noise);
        santaactive[santawalk] = 0;
        santatimer = 0;
        mode = 0;
        walkcon = 0;
        walktimer = walkthreshold;
        image_index = 0;
        image_speed = 0;
    }
}
if (notice && vspeed == 0)
{
    var _emote = scr_marker(x + 10, y - 10, spr_exc);
    scr_doom(_emote, 31);
    notice = false;
    notice_mode = true;
    cringe_mode = false;
    notice_timer = 90;
    global.interact = 0;
    mode = -1;
    sprite_index = spr_noellehouse_dess_kris_notice;
    image_index = 0;
    image_speed = 0;
    hspeed = 0;
    scr_shakeobj();
}
if (notice_mode)
{
    notice_timer--;
    if (notice_timer <= 0)
    {
        notice_mode = false;
        reset();
    }
}
if (cringe)
{
    var _emote = scr_marker(x + 10, y - 10, spr_exc);
    scr_doom(_emote, 31);
    cringe = false;
    cringe_mode = true;
    hspeed = 0;
    notice_mode = false;
    global.interact = 0;
    notice_timer = 90;
    mode = -1;
    sprite_index = spr_noellehouse_dess_kris_cringe;
    image_index = 0;
    image_speed = 0;
    scr_shakeobj();
}
if (cringe_mode)
{
    notice_timer--;
    if (notice_timer <= 0)
    {
        cringe_mode = false;
        reset();
    }
}
if (tired_mode && attackhit == 0)
{
    if (attack_number >= 5)
    {
        tired_mode = false;
        is_tired = true;
        mode = -1;
        global.interact = 0;
        sprite_index = spr_noellehouse_dess_kris_hockey_tired;
        image_index = 0;
        image_speed = 0.1;
        hspeed = 0;
        scr_shakeobj();
    }
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_937 = 937
}

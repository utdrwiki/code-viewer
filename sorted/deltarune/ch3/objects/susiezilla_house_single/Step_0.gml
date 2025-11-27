if (type != 99)
{
    scr_depth();
    depth += 2000;
    if (i_ex(obj_tenna_enemy))
        depth = 1000 - y;
}
if (type == 99)
{
    if (solidmade == 0)
    {
        mysolid = instance_create(x + 4, (y + 40) - 14, obj_solidblocksized);
        with (mysolid)
        {
            image_xscale = 0.8;
            image_yscale = 0.35;
        }
        solidmade = 1;
    }
}
if (hitstop <= 0)
{
    iframes--;
    if (myhealth <= 0)
    {
        if (!explo)
        {
            snd_stop(snd_punchmed);
            snd_stop(snd_explosion_mmx);
            snd_play(snd_explosion_mmx);
            var explosion = instance_create(x, y, obj_marker_animateOnce);
            explosion.image_speed = 0.5;
            explosion.depth = depth - 100;
            explosion.sprite_index = spr_susiezilla_houseexplosion;
            scr_darksize(explosion);
            explo = true;
            image_index = 1;
            if (dontsayperfect == false)
                scr_tenna_add_score(3);
            with (obj_susiezilla_gamecontroller)
            {
                if (perfect_timer == -1 || perfect_timer > 0)
                {
                    perfect_timer = 15;
                    perfect_counter--;
                    if (perfect_counter == 0 && other.dontsayperfect == false)
                    {
                        snd_play(snd_applause);
                        snd_play(snd_crowd_ooh);
                        instance_create_depth(clamp(other.x + 20, xorig + 160, (xorig + width) - 160), other.y + 30, depth - 900000, obj_susiezilla_perfect_chain);
                        with (obj_susiezilla_singlescreen_hud_score)
                            score_change(50);
                        scr_tenna_add_score(20);
                    }
                }
            }
            if (i_ex(obj_susiezilla_statue))
                instance_create_depth(x + 20, y + 20, obj_susiezilla_statue.depth - 1, obj_susiezilla_repair_spark);
        }
    }
    if (myhealth > 0 && iframes < 0)
    {
        var makesplash = 0;
        if (place_meeting(x, y, obj_susiezilla_player))
        {
            var suplay = instance_place(x, y, obj_susiezilla_player);
            if (suplay.hitactive && sprite_index == spr_susiezilla_house && image_index == 0 && (obj_susiezilla_gamecontroller.alarm[0] > 1 || obj_susiezilla_gamecontroller.mode == 5 || obj_susiezilla_gamecontroller.mode == 6))
            {
                iframes = 10;
                with (suplay)
                    event_user(0);
                suplay.hitstop = 2;
                hitstop = 4;
                drawshake = hitstop;
                myhealth--;
                snd_stop(snd_punchmed);
                snd_play(snd_punchmed);
                makesplash = true;
                if (suplay.dashcon == 2)
                    suplay.dashtimer = max(0, suplay.dashtimer - 10);
            }
        }
        with (obj_susiezilla_singlescreen_shadowguy_in_dozer)
        {
            if (collision_rectangle(x - 64, y + 24, x + 64, y - 40, other.id, false, true))
            {
                with (other.id)
                {
                    iframes = 10;
                    hitstop = 4;
                    drawshake = hitstop;
                    myhealth--;
                    snd_stop(snd_punchmed);
                    snd_play(snd_punchmed);
                    makesplash = true;
                }
                break;
            }
        }
        if (place_meeting(x, y, obj_susiezilla_activehitbox))
        {
            var _hit = instance_place(x, y, obj_susiezilla_activehitbox);
            if (_hit.daddy.canhit == 1)
            {
                iframes = 10;
                hitstop = 4;
                drawshake = hitstop;
                myhealth--;
                snd_stop(snd_punchmed);
                snd_play(snd_punchmed);
                makesplash = true;
            }
        }
        if (makesplash)
        {
            makesplash = false;
            var hitmarker = scr_dark_marker(x + 0, y, spr_dogcar_hit);
            scr_doom(hitmarker, 4);
            scr_scale(3, hitmarker);
            scr_lerpvar_instance(hitmarker, "image_xscale", hitmarker.image_xscale, 1, 4);
            scr_lerpvar_instance(hitmarker, "image_yscale", hitmarker.image_yscale, 1, 4);
            hitmarker.depth = depth - 100;
        }
    }
}
hitstop--;
if (type == 1)
{
    delay--;
    if (delay <= 0)
    {
        siner++;
        x -= 8;
    }
}
if (type == 2)
{
    timer++;
    if (timer == 1)
    {
        path_start(path_house2, 12, path_action_restart, true);
        path_position = _path_position;
    }
    image_blend = c_red;
}
if (type == 3)
{
    delay--;
    if (delay <= 0)
    {
        x += 24;
        if (x > 700)
            x = 0;
    }
}
if (type == 4)
{
    timer++;
    if (timer == 1)
        path_start(path_house3, 10, path_action_restart, true);
}
if (type == 5)
{
    timer++;
    if (timer == 1)
    {
        path_start(path_house1, 10, path_action_restart, true);
        path_position = _path_position;
    }
}
myxcenter = x + 20;
myycenter = y + 20;
if (room == room_dw_teevie_susiezilla)
{
    if (sprite_index == spr_susiezilla_house)
    {
        if (myhealth == 0)
        {
            brokemefail++;
            if (brokemefail > 3)
            {
                scr_marker_ext(x, y, sprite_index, 2, 2, 0, image_index, image_blend, depth);
                instance_destroy();
                exit;
            }
        }
    }
}

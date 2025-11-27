if (scr_debug() && keyboard_check_pressed(ord("V")) && con == 1)
{
    con = 2;
    timer = 0;
    event_user(2);
    with (obj_tenna_enemy)
    {
        tenna_actor.x = tenna_actor.xstart;
        tenna_actor.y = tenna_actor.ystart;
    }
}
if (global.turntimer < 4)
    global.turntimer = 4;
if (con == 0)
{
    var _continue = true;
    for (var i = 0; i < instance_number(obj_animation); i++)
    {
        anim[i] = instance_find(obj_animation, i);
        if (anim[i].sprite_index == spr_susiezilla_houseexplosion)
            _continue = false;
    }
    if (!i_ex(obj_popularboy_act) && _continue)
        timer++;
    if (timer == 1)
    {
        with (obj_face)
            instance_destroy();
        with (obj_writer)
            instance_destroy();
        with (obj_dmgwriter)
            instance_destroy();
        if (i_ex(obj_tenna_enemy))
        {
            obj_herokris.visible = false;
            obj_herosusie.visible = false;
            obj_heroralsei.visible = false;
            obj_tenna_enemy.ralseiplushmarker.visible = false;
            if (obj_tenna_enemy.popularboy)
                obj_tenna_enemy.ralseiplushmarker.visible = false;
            markkris = instance_create_depth(obj_herokris.x, obj_herokris.y, -9999997, obj_marker);
            markkris.sprite_index = obj_herokris.thissprite;
            markkris.image_index = obj_herokris.index;
            markkris.image_xscale = 2;
            markkris.image_yscale = 2;
            markkris.image_speed = 0.16666666666666666;
            if (obj_herokris.thissprite == obj_herokris.defendsprite)
                markkris.image_speed = 0;
            marksusie = instance_create_depth(obj_herosusie.x, obj_herosusie.y, -9999998, obj_marker);
            marksusie.sprite_index = obj_herosusie.thissprite;
            marksusie.image_index = obj_herosusie.index;
            marksusie.image_xscale = 2;
            marksusie.image_yscale = 2;
            marksusie.image_speed = 0.16666666666666666;
            if (obj_herosusie.thissprite == obj_herosusie.defendsprite)
                marksusie.image_speed = 0;
            if ((obj_tenna_enemy.popularboy && global.hp[3] > 0) || madeplush == true)
            {
                markralsei = instance_create_depth(obj_heroralsei.x, obj_heroralsei.y, -9999999, obj_marker);
                markralsei.sprite_index = obj_tenna_enemy.ralseiplushmarker.sprite_index;
                markralsei.image_index = 0;
                markralsei.image_speed = 0;
                madeplush = true;
            }
            else
            {
                markralsei = instance_create_depth(obj_heroralsei.x, obj_heroralsei.y, -9999999, obj_marker);
                markralsei.sprite_index = obj_heroralsei.thissprite;
                markralsei.image_index = obj_heroralsei.index;
                markralsei.image_xscale = 2;
                markralsei.image_yscale = 2;
                markralsei.image_speed = 0.16666666666666666;
                if (obj_heroralsei.thissprite == obj_heroralsei.defendsprite)
                    markralsei.image_speed = 0;
            }
            krisxoff = sprite_get_xoffset(obj_herokris.thissprite);
            krisyoff = sprite_get_yoffset(obj_herokris.thissprite);
            susiexoff = sprite_get_xoffset(obj_herosusie.thissprite);
            susieyoff = sprite_get_yoffset(obj_herosusie.thissprite);
            ralseixoff = sprite_get_xoffset(obj_heroralsei.thissprite);
            ralseiyoff = sprite_get_yoffset(obj_heroralsei.thissprite);
        }
    }
    if (timer == 2)
    {
        with (obj_dmgwriter)
            instance_destroy();
        with (obj_face)
            instance_destroy();
        with (obj_writer)
            instance_destroy();
        if (screenshot != -1)
            sprite_delete(screenshot);
        screenshot = sprite_create_from_surface(application_surface, 0, 0, view_wport, view_hport, 0, 0, 0, 0);
        if (i_ex(obj_border_controller))
        {
            depth = obj_border_controller.depth + 1;
            with (obj_tenna_enemy_bg)
                depth = obj_border_controller.depth + 2;
        }
        event_user(1);
    }
    if (type == 1)
    {
        time = 70;
        if (timer > 1)
            image_alpha -= 0.1;
        if (timer == 35)
            snd_stop(snd_tv_static);
        if (timer == 21)
            zoomcon = 1;
    }
    else
    {
        time = 35;
        if (timer > 1 && image_alpha > 0)
            image_alpha -= 0.2;
        if (timer == 18)
            snd_stop(snd_tv_static);
        if (timer == 11)
            zoomcon = 1;
    }
    if (zoomcon == 1)
    {
        if (type == 1)
        {
            scr_lerpvar("surface_scale", surface_scale, 500, time, 3, "in");
            scr_lerpvar("yoffset", yoffset, 100, 17, 3, "in");
            scr_lerpvar("surface_scale2", surface_scale2, 1, 17, 3, "in");
            scr_lerpvar("anchor_x2", anchor_x2, 0, 17, 3, "in");
            scr_lerpvar("anchor_y2", anchor_y2, 0, 17, 3, "in");
            var _time = 10;
            with (markkris)
                scr_lerpvar("x", x, -200, _time, 3, "in");
            with (marksusie)
                scr_lerpvar("x", x, -300, _time, 3, "in");
            with (marksusie)
                scr_lerpvar("y", y, cameray() + (cameraheight() / 2), _time, 3, "in");
            with (markralsei)
                scr_lerpvar("x", x, -400, _time, 3, "in");
            with (markralsei)
                scr_lerpvar("y", y, cameray() + cameraheight(), _time, 3, "in");
            with (markkris)
                scr_lerpvar("image_xscale", image_xscale, 500, other.time - 10, 3, "in");
            with (markkris)
                scr_lerpvar("image_yscale", image_yscale, 500, other.time - 10, 3, "in");
            with (marksusie)
                scr_lerpvar("image_xscale", image_xscale, 500, other.time - 10, 3, "in");
            with (marksusie)
                scr_lerpvar("image_yscale", image_yscale, 500, other.time - 10, 3, "in");
            with (markralsei)
                scr_lerpvar("image_xscale", image_xscale, 500, other.time - 10, 3, "in");
            with (markralsei)
                scr_lerpvar("image_yscale", image_yscale, 500, other.time - 10, 3, "in");
        }
        else
        {
            scr_lerpvar("surface_scale", surface_scale, 500, time, 3, "in");
            scr_lerpvar("yoffset", yoffset, 100, 9, 3, "in");
            scr_lerpvar("surface_scale2", surface_scale2, 1, 9, 3, "in");
            scr_lerpvar("anchor_x2", anchor_x2, 0, 9, 3, "in");
            scr_lerpvar("anchor_y2", anchor_y2, 0, 9, 3, "in");
            var _time = 5;
            if (i_ex(obj_tenna_enemy))
            {
                with (markkris)
                    scr_lerpvar("x", x, -200, _time, 3, "in");
                with (marksusie)
                    scr_lerpvar("x", x, -300, _time, 3, "in");
                with (marksusie)
                    scr_lerpvar("y", y, cameray() + (cameraheight() / 2), _time, 3, "in");
                with (markralsei)
                    scr_lerpvar("x", x, -400, _time, 3, "in");
                with (markralsei)
                    scr_lerpvar("y", y, cameray() + cameraheight(), _time, 3, "in");
                with (markkris)
                    scr_lerpvar("image_xscale", image_xscale, 500, other.time - 10, 3, "in");
                with (markkris)
                    scr_lerpvar("image_yscale", image_yscale, 500, other.time - 10, 3, "in");
                with (marksusie)
                    scr_lerpvar("image_xscale", image_xscale, 500, other.time - 10, 3, "in");
                with (marksusie)
                    scr_lerpvar("image_yscale", image_yscale, 500, other.time - 10, 3, "in");
                with (markralsei)
                    scr_lerpvar("image_xscale", image_xscale, 500, other.time - 10, 3, "in");
                with (markralsei)
                    scr_lerpvar("image_yscale", image_yscale, 500, other.time - 10, 3, "in");
            }
        }
        zoomcon = 2;
    }
    if ((timer == 20 && type == 1) || (timer == 10 && type == 2))
    {
        if (i_ex(obj_tenna_enemy))
        {
            with (markkris)
                image_alpha = 0;
            with (marksusie)
                image_alpha = 0;
            with (markralsei)
                image_alpha = 0;
        }
    }
    if ((timer == 40 && type == 1) || (timer == 20 && type == 2))
    {
        timer = 0;
        zoomcon = 0;
        con = 1;
        image_alpha = 0;
        with (obj_tenna_enemy_bg)
            minigametimecon = 0;
        event_user(3);
    }
}
if (con == 1)
{
    if (minigameinsanity == true || minigameinsanityintro == true)
    {
        minigameinsanitytimer++;
        if (minigameinsanitytimer == (minigameinsanitytimermax - 5) && minigameinsanitytimermax == 30 && i_ex(obj_tenna_enemy) && obj_tenna_enemy.minigameinsanitycount == 4)
        {
            with (obj_tenna_enemy)
                stopshoot = 1;
            with (obj_screen_channel_change)
            {
                lifetime = 70;
                lightemuptimer = 0;
                lightemupcon = 1;
                event_user(0);
            }
        }
        if (minigameinsanitytimer > minigameinsanitytimermax)
        {
            minigameinsanitytimer = 0;
            minigameinsanity = true;
            if (minigameinsanitytimermax > 40)
                minigameinsanitytimermax -= 10;
            if (minigameinsanitytimermax <= 40)
                minigameinsanitytimermax -= 1;
            if (minigameinsanitytimermax < 30)
                minigameinsanitytimermax = 30;
            if (!i_ex(obj_screen_channel_change))
            {
                var _inst = instance_create(x, y, obj_screen_channel_change);
                _inst.depth = obj_tenna_minigame_ui.depth - 100;
                with (obj_screen_channel_change)
                    lifetime = 7;
            }
            with (obj_screen_channel_change)
            {
                if (lightemupcon == 0)
                    event_user(0);
            }
            with (obj_tenna_minigame_ui)
                channelnumber++;
            event_user(2);
            var randomchosen = -1;
            if (global.flag[1197] > 0)
                randomchosen = choose(0, 0, 0, 1, 3, 4, 5, 6, 7);
            else
                randomchosen = choose(0, 0, 0, 1, 2, 3, 4, 5);
            if (minigameinsanitytimermax <= 60)
                randomchosen = choose(1, 2, 4, 5);
            repeat (3)
            {
                if (randomchosen == randomchosenprev1 || randomchosen == randomchosenprev2)
                    randomchosen += 2;
                if (minigameinsanitytimermax <= 60)
                {
                    if (randomchosen > 5)
                    {
                        randomchosen -= 5;
                        if (randomchosen == 0 || randomchosen == 3)
                            randomchosen = 1;
                    }
                }
                else
                {
                    if (global.flag[1197] == 0 && randomchosen > 5)
                        randomchosen -= 5;
                    if (global.flag[1197] > 0 && randomchosen > 7)
                        randomchosen -= 7;
                }
            }
            if (extravar == 0)
                randomchosenprev1 = randomchosen;
            if (extravar == 1)
                randomchosenprev2 = randomchosen;
            extravar++;
            if (extravar == 1)
                extravar = 0;
            if (randomchosen == 0)
                minigametype = "music";
            if (randomchosen == 1)
            {
                minigametype = "cooking";
                minigamedifficulty = 0;
            }
            if (randomchosen == 2)
            {
                minigametype = "cowboy";
                minigamedifficulty = 0;
            }
            if (randomchosen == 3)
            {
                minigametype = "cowboy";
                minigamedifficulty = 1;
            }
            if (randomchosen == 4)
            {
                minigametype = "battle";
                minigamedifficulty = 1;
            }
            if (randomchosen == 5)
            {
                minigametype = "battle";
                minigamedifficulty = 2;
            }
            if (randomchosen == 6)
            {
                minigametype = "susiezilla";
                minigamedifficulty = 2;
            }
            if (randomchosen == 7)
            {
                minigametype = "susiezilla";
                minigamedifficulty = 4;
            }
            if (minigameinsanitytimermax == 30)
            {
                obj_tenna_enemy.minigameinsanitycount++;
                if (obj_tenna_enemy.minigameinsanitycount == 5)
                {
                    minigametype = "battle";
                    minigamedifficulty = 3;
                    minigameinsanity = false;
                    minigameinsanityintro = false;
                    with (obj_tenna_enemy)
                        phaseturn = 18;
                }
            }
            event_user(1);
            if (minigametype == "cooking" || (minigametype == "battle" && minigamedifficulty == 3))
                event_user(3);
            timer = 0;
        }
    }
    if (minigametype == "music" && minigameinsanity == false)
    {
        timer++;
        if (timer == 300)
        {
            con = 2;
            timer = -1;
        }
    }
    if (minigametype == "susiezilla" && minigamedifficulty == 2 && minigameinsanity == false)
    {
        timer++;
        if (timer == 300)
        {
            con = 2;
            timer = -1;
        }
    }
    if (minigametype == "battle")
    {
        timer++;
        if ((timer == 20 && minigamedifficulty == 2 && minigameinsanity == false) || (timer == 1 && minigamedifficulty == 2 && minigameinsanity == true))
        {
            var _y = 0;
            if (minigameinsanity)
            {
                if (timer == 1)
                {
                    _y = 120;
                    var bouncybullet = instance_create_depth((obj_growtangle.x - 30) + irandom(60), cameray() + 10 + _y, depth + 10, obj_elnina_bouncingbullet);
                    bouncybullet.difficulty = 2;
                    bouncybullet.bounce_count = 12;
                    bouncybullet.damage = 55;
                    bouncybullet.grazepoints = 3;
                    bouncybullet.timepoints = 1;
                    bouncybullet.inv = -1;
                    bouncybullet.target = 4;
                    bouncybullet.image_blend = c_ltgray;
                    bouncybullet.forceminigametocontinue = true;
                    if (timer == 1)
                        bouncybullet.vspeed = -10;
                    if (timer == 1)
                        bouncybullet.hspeed = (2 + random(3)) * choose(-1, 1);
                    _y = 80;
                    bouncybullet = instance_create_depth((obj_growtangle.x - 30) + irandom(60), cameray() + 10 + _y, depth + 10, obj_elnina_bouncingbullet);
                    bouncybullet.difficulty = 2;
                    bouncybullet.damage = 55;
                    bouncybullet.bounce_count = 12;
                    bouncybullet.grazepoints = 3;
                    bouncybullet.timepoints = 1;
                    bouncybullet.inv = -1;
                    bouncybullet.target = 4;
                    bouncybullet.image_blend = c_ltgray;
                    bouncybullet.forceminigametocontinue = true;
                    if (timer == 1)
                        bouncybullet.vspeed = -8;
                    if (timer == 1)
                        bouncybullet.hspeed = (2 + random(3)) * choose(-1, 1);
                }
            }
            else
            {
                if (obj_tenna_enemy.umbrellawithouttakingdamage == 0)
                {
                    var bouncybullet = instance_create_depth((obj_growtangle.x - 30) + irandom(60), cameray() + 10 + _y, depth + 10, obj_elnina_bouncingbullet);
                    bouncybullet.difficulty = 2;
                    bouncybullet.damage = 55;
                    bouncybullet.bounce_count = 12;
                    bouncybullet.grazepoints = 3;
                    bouncybullet.timepoints = 1;
                    bouncybullet.inv = -1;
                    bouncybullet.target = 4;
                    bouncybullet.image_blend = c_ltgray;
                    if (minigameinsanity && timer == 1)
                        bouncybullet.vspeed = 1;
                    if (minigameinsanity && timer == 1)
                        bouncybullet.hspeed = (2 + random(3)) * choose(-1, 1);
                }
                if (obj_tenna_enemy.umbrellawithouttakingdamage == 1)
                {
                    var bouncybullet = instance_create_depth((obj_growtangle.x - 30) + irandom(60), cameray() + 10 + _y, depth + 10, obj_elnina_bouncingbullet);
                    bouncybullet.difficulty = 2;
                    bouncybullet.bounce_count = 12;
                    bouncybullet.damage = 55;
                    bouncybullet.grazepoints = 3;
                    bouncybullet.timepoints = 1;
                    bouncybullet.inv = -1;
                    bouncybullet.target = 4;
                    bouncybullet.image_blend = c_yellow;
                    if (minigameinsanity && timer == 1)
                        bouncybullet.vspeed = 1;
                    if (minigameinsanity && timer == 1)
                        bouncybullet.hspeed = (2 + random(3)) * choose(-1, 1);
                }
            }
        }
        if (minigameinsanity == false)
        {
            if ((minigamedifficulty == 0 && timer == 200) || (minigamedifficulty == 1 && ((i_ex(obj_tenna_minigame_ui) && obj_tenna_minigame_ui.timer >= 270) || obj_tenna_enemy.minigamefailcount > 2)) || (minigamedifficulty == 2 && obj_tenna_enemy.minigamefailcount > 2) || (minigamedifficulty == 2 && timer == 300))
            {
                with (obj_clearbullets_fx)
                    instance_destroy();
                con = 2;
                timer = -1;
            }
        }
    }
}
if (con == 2)
{
    timer++;
    global.inv = 30;
    if (timer == 5)
        xcon = 1;
    if (timer == 1)
    {
        var _time = 10;
        time = 25;
        if (type == 2)
        {
            _time = 5;
            time = 13;
        }
        scr_lerpvar("surface_scale", 15, 1, time, 3, "in");
        scr_lerpvar("yoffset", yoffset, 0, time, 3, "in");
        if (i_ex(obj_tenna_enemy))
        {
            with (markkris)
                scr_lerpvar("x", x, xstart, _time, 3, "in");
            with (marksusie)
                scr_lerpvar("x", x, xstart, _time, 3, "in");
            with (marksusie)
                scr_lerpvar("y", y, ystart, _time, 3, "in");
            with (markralsei)
                scr_lerpvar("x", x, xstart, _time, 3, "in");
            with (markralsei)
                scr_lerpvar("y", y, ystart, _time, 3, "in");
            with (markkris)
                scr_lerpvar("image_xscale", image_xscale, 2, other.time, 3, "in");
            with (markkris)
                scr_lerpvar("image_yscale", image_yscale, 2, other.time, 3, "in");
            with (marksusie)
                scr_lerpvar("image_xscale", image_xscale, 2, other.time, 3, "in");
            with (marksusie)
                scr_lerpvar("image_yscale", image_yscale, 2, other.time, 3, "in");
            if (obj_tenna_enemy.popularboy)
            {
                with (markralsei)
                    scr_lerpvar("image_xscale", image_xscale, 1, other.time, 3, "in");
                with (markralsei)
                    scr_lerpvar("image_yscale", image_yscale, 1, other.time, 3, "in");
            }
            else
            {
                with (markralsei)
                    scr_lerpvar("image_xscale", image_xscale, 2, other.time, 3, "in");
                with (markralsei)
                    scr_lerpvar("image_yscale", image_yscale, 2, other.time, 3, "in");
            }
        }
    }
    if ((timer == 14 && type == 1) || (timer == 7 && type == 2))
    {
        scr_lerpvar("surface_scale2", surface_scale2, 0.15, time - 13, 3, "in");
        scr_lerpvar("anchor_x2", anchor_x2, xstart - 40, time - 13, 3, "in");
    }
    if ((timer == 16 && type == 1) || (timer == 8 && type == 2))
        scr_lerpvar("anchor_y2", anchor_y2, ystart - 40, time - 15, 3, "in");
    if ((timer == 27 && type == 1) || (timer == 14 && type == 2))
    {
        if (i_ex(obj_tenna_enemy))
        {
            with (markkris)
                image_alpha = 1;
            with (marksusie)
                image_alpha = 1;
            with (markralsei)
                image_alpha = 1;
        }
        with (obj_elnina_bouncingbullet)
            instance_destroy();
        with (obj_regularbullet)
        {
            if (sprite_index == spr_shutta_lightning)
                instance_destroy();
        }
    }
    if ((timer > 27 && type == 1) || (timer > 14 && type == 2))
        image_alpha += 0.2;
    if ((timer == 28 && type == 1) || (timer == 14 && type == 2))
        snd_play_x(snd_tv_static, 0.25, 1);
    if ((timer == 39 && type == 1) || (timer == 19 && type == 2))
    {
        if (minigametype2 == "none" && i_ex(obj_tenna_enemy))
        {
            obj_tenna_enemy.tenna_actor.x = camerax() + 320;
            obj_tenna_enemy.tenna_actor.y = cameray() + 254;
        }
    }
    if ((timer == 40 && type == 1) || (timer == 20 && type == 2))
    {
        snd_stop(snd_tv_static);
        if (i_ex(obj_tenna_enemy))
        {
            with (obj_tenna_minigame_ui)
            {
                enabled = false;
                if (i_ex(obj_tenna_enemy_bg))
                    obj_tenna_enemy_bg.addscore += obj_tenna_minigame_ui.myscore;
                obj_tenna_minigame_ui.myscore = 0;
                timer = 0;
            }
            sprite_set_offset(markkris.sprite_index, krisxoff, krisyoff);
            sprite_set_offset(marksusie.sprite_index, susiexoff, susieyoff);
            sprite_set_offset(markralsei.sprite_index, ralseixoff, ralseiyoff);
            obj_herokris.visible = true;
            obj_herosusie.visible = true;
            obj_heroralsei.visible = true;
            obj_tenna_enemy.ralseiplushmarker.visible = true;
            if (obj_tenna_enemy.popularboy)
                obj_tenna_enemy.ralseiplushmarker.visible = true;
            with (markkris)
                instance_destroy();
            with (marksusie)
                instance_destroy();
            with (markralsei)
                instance_destroy();
            event_user(2);
        }
        for (var i = 0; i < 3; i += 1)
        {
            if (global.char[i] == 1)
                global.charinstance[i].depth = 200 - (i * 20);
            if (global.char[i] == 2)
                global.charinstance[i].depth = 200 - (i * 20);
            if (global.char[i] == 3)
                global.charinstance[i].depth = 200 - (i * 20);
        }
        with (obj_tenna_enemy)
            pointsmultiplierthisturn = 5;
        if (minigametype2 == "none" && i_ex(obj_tenna_enemy))
        {
            obj_tenna_enemy.minigametransition_con = 3;
            instance_destroy();
        }
        else
        {
            timer = 0;
            con = 3;
            with (obj_tenna_enemy)
                minigamefailcon = 1;
            if (screenshot != -1)
                sprite_delete(screenshot);
            screenshot = -1;
        }
    }
}
if (con == 3)
{
    if (obj_tenna_enemy.minigamefailcon == 0)
    {
        minigametype = minigametype2;
        minigamedifficulty = minigamedifficulty2;
        minigametype2 = "none";
        minigametype2 = minigametype3;
        minigamedifficulty2 = minigamedifficulty3;
        minigametype3 = "none";
        zoomcon = 0;
        timer = 0;
        xcon = 0;
        surface_scale = 1;
        surface_scale2 = 0.15;
        index = 0;
        zoomcon = 0;
        timer = 0;
        time = 70;
        con = 0;
        hurt_counter = 0;
        image_alpha = 2;
        snd_play_x(snd_tv_static, 0.25, 1);
        redx_1_alpha = 0;
        redx_1_scale = 9;
        redx_2_alpha = 0;
        redx_2_scale = 9;
        redx_3_alpha = 0;
        redx_3_scale = 9;
    }
}

reticle_over_good_shot = false;
if (place_meeting(x, y, obj_regularbullet))
    reticle_over_good_shot = true;
switch (subact_state)
{
    case "init":
        with (obj_heroparent)
            scr_move_to_point_over_time(x - 170, y, 8);
        var enemyselected = false;
        for (var i = 0; i < instance_number(obj_monsterparent); i++)
        {
            _enemy[i] = instance_find(obj_monsterparent, i);
            if (_enemy[i].object_index == obj_shadowman_enemy && enemyselected == false)
            {
                with (_enemy[i])
                    scr_move_to_point_over_time(camerax() + 540, cameray() + 120, 8);
                bullettarget = _enemy[i];
                enemyselected = true;
            }
            else if (_enemy[i].object_index == obj_zapper_enemy && enemyselected == false)
            {
                with (_enemy[i])
                    scr_move_to_point_over_time(camerax() + 480, cameray() + 80, 8);
                bullettarget = _enemy[i];
                enemyselected = true;
            }
            else
            {
                with (_enemy[i])
                    scr_move_to_point_over_time(x + 200, y, 8);
            }
        }
        instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
        with (obj_growtangle)
        {
            maxxscale = 3;
            maxyscale = 3;
        }
        subact_state = "shoot";
        break;
    case "shoot":
        timerb++;
        pipetimer++;
        if (pipetimer == 1)
        {
            if (bullettarget.object_index == obj_shadowman_enemy)
            {
                bullettarget.idlesprite = spr_shadowman_firing;
                bullettarget.siner = 0;
            }
            if (bullettarget.object_index == obj_zapper_enemy)
            {
                bullettarget.idlesprite = spr_zapper_cannon;
                bullettarget.siner = 0;
            }
        }
        if (pipetimer == 10)
        {
            reticle1 = instance_create((obj_growtangle.x - 100) + irandom(40), (obj_growtangle.y - 100) + irandom(40), obj_shutta_reticle);
            reticle2 = instance_create((obj_growtangle.x + 100) - irandom(40), (obj_growtangle.y - 100) + irandom(40), obj_shutta_reticle);
            reticle3 = instance_create((obj_growtangle.x - 100) + irandom(40), (obj_growtangle.y + 100) - irandom(40), obj_shutta_reticle);
            reticle4 = instance_create((obj_growtangle.x + 100) - irandom(40), (obj_growtangle.y + 100) - irandom(40), obj_shutta_reticle);
            reticle5 = instance_create((obj_growtangle.x - 100) + irandom(200), (obj_growtangle.y - 100) + irandom(100), obj_shutta_reticle);
            reticle6 = instance_create((obj_growtangle.x - 100) + irandom(200), (obj_growtangle.y - 100) + irandom(100), obj_shutta_reticle);
            var _rand = choose(0, 1, 2, 3);
            if (_rand == 0)
            {
                secrettargetx = (obj_growtangle.x - 70) + irandom(30);
                secrettargety = (obj_growtangle.y - 50) + irandom(100);
            }
            if (_rand == 1)
            {
                secrettargetx = (obj_growtangle.x + 70) - irandom(30);
                secrettargety = (obj_growtangle.y - 50) + irandom(100);
            }
            if (_rand == 2)
            {
                secrettargetx = (obj_growtangle.x - 50) + irandom(100);
                secrettargety = (obj_growtangle.y - 70) + irandom(30);
            }
            if (_rand == 3)
            {
                secrettargetx = (obj_growtangle.x - 50) + irandom(100);
                secrettargety = (obj_growtangle.y + 70) - irandom(30);
            }
        }
        if (pipetimer == 8 && bullettarget.object_index == obj_zapper_enemy)
            bullettarget.idlesprite = spr_zapper_aim;
        if ((pipetimer == 30 && bullettarget.object_index == obj_shadowman_enemy) || (pipetimer == 30 && bullettarget.object_index == obj_zapper_enemy))
        {
            var xx = 0;
            var yy = 0;
            var targetx = 0;
            var targety = 0;
            var _a = 0;
            if (bullettarget.object_index == obj_shadowman_enemy)
            {
                xx = bullettarget.x - 60;
                yy = bullettarget.y + 66;
            }
            if (bullettarget.object_index == obj_zapper_enemy)
            {
                xx = bullettarget.x + 16;
                yy = bullettarget.y + 80;
                bullettarget.idlesprite = spr_zapper_cannon;
                bullettarget.siner = 5;
            }
            repeat (6)
            {
                if (_a == 0)
                    targetx = reticle1.x;
                if (_a == 0)
                    targety = reticle1.y;
                if (_a == 1)
                    targetx = reticle2.x;
                if (_a == 1)
                    targety = reticle2.y;
                if (_a == 2)
                    targetx = reticle3.x;
                if (_a == 2)
                    targety = reticle3.y;
                if (_a == 3)
                    targetx = reticle4.x;
                if (_a == 3)
                    targety = reticle4.y;
                if (_a == 4)
                    targetx = reticle5.x;
                if (_a == 4)
                    targety = reticle5.y;
                if (_a == 5)
                    targetx = reticle6.x;
                if (_a == 5)
                    targety = reticle6.y;
                var tommybullet = scr_fire_bullet(xx, yy, obj_shutta_reticle_bullet, point_direction(xx, yy, targetx, targety), 0, spr_tommygun_bullet);
                tommybullet.image_angle = tommybullet.direction;
                tommybullet.depth = depth + 1;
                tommybullet.x = xx;
                tommybullet.y = yy;
                tommybullet.targetx = targetx;
                tommybullet.targety = targety;
                _a++;
            }
        }
        if (pipetimer == 35)
        {
            with (obj_shutta_reticle)
                con = 1;
        }
        if (pipetimer == 43 && bullettarget.object_index == obj_zapper_enemy)
            bullettarget.idlesprite = spr_zapper_aim;
        if (timer == timer_duration)
        {
            subact_state = "post_capture";
            enemy.sprite_index = spr_shutta_idle;
            enemy.image_speed = 0.16666666666666666;
            timerb = 0;
            if (bullettarget.object_index == obj_zapper_enemy)
                bullettarget.idlesprite = spr_zapper_jump;
        }
        break;
    case "capture":
        subact_state = "shoot";
        flash_alpha = 1;
        if (got_kris && closest_hero == "kris")
        {
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_kris;
                if (global.flag[513] > 0)
                    obj_shutta_photo_controller.endmessage = message_kris2;
            }
            global.flag[513] = 1;
        }
        else if (got_susie && closest_hero == "susie")
        {
            enemy.photosuccesscount++;
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_susie;
                if (global.flag[514] > 0)
                    obj_shutta_photo_controller.endmessage = message_susie2;
            }
            global.flag[514] = 1;
        }
        else if (got_ralsei && closest_hero == "ralsei")
        {
            enemy.photosuccesscount++;
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                if (global.flag[515] == 0)
                    obj_shutta_photo_controller.endmessage = message_ralsei;
                if (global.flag[515] > 0)
                    obj_shutta_photo_controller.endmessage = message_ralsei2;
            }
            global.flag[515] = 1;
        }
        else if (place_meeting(x, y, obj_shutta_reticle_bullet) || place_meeting(x, y, obj_shutta_reticle_bullet2) || place_meeting(x, y, obj_shutta_nobyact_fakebullet))
        {
            with (obj_shutta_reticle_bullet)
            {
                if (place_meeting(x, y, obj_shutta_photo_controller))
                {
                    obj_shutta_photo_controller.mercygained += 3;
                    inst = scr_afterimage();
                    inst.fadeSpeed = 0.1;
                    inst = scr_afterimage();
                    inst.sprite_index = spr_board_sparkle;
                    inst.vspeed = -1;
                    inst.image_xscale = 2;
                    inst.image_yscale = 2;
                    instance_destroy();
                }
            }
            with (obj_shutta_reticle_bullet2)
            {
                if (place_meeting(x, y, obj_shutta_photo_controller))
                {
                    obj_shutta_photo_controller.mercygained += 3;
                    inst = scr_afterimage();
                    inst = scr_afterimage();
                    inst.sprite_index = spr_board_sparkle;
                    inst.vspeed = -1;
                    inst.image_index = choose(0, 1);
                    inst.image_xscale = 2;
                    inst.image_yscale = 2;
                    instance_destroy();
                }
            }
            obj_shutta_photo_controller.endmessage = message_nicephoto;
        }
        else
        {
            obj_shutta_photo_controller.endmessage = message_default;
        }
        with (obj_heroparent)
            scr_move_to_point_over_time(xstart, y, 3);
        with (enemy)
        {
            scr_move_to_point_over_time(xstart, ystart, 3);
            timerb = 0;
            pipetimer = 0;
            sprite_index = spr_shutta_idle;
        }
        break;
    case "post_capture":
        timerb++;
        if (i_ex(obj_growtangle) && obj_growtangle.growcon != 3)
            obj_growtangle.growcon = 3;
        with (obj_shutta_nobyacttest)
            instance_destroy();
        with (obj_shutta_nobyact_fakebullet)
            instance_destroy();
        with (obj_heroparent)
        {
            x = xstart;
            y = ystart;
        }
        with (enemy)
        {
            x = xstart;
            y = ystart;
            timerb = 0;
            pipetimer = 0;
            sprite_index = spr_shutta_idle;
        }
        with (obj_monsterparent)
        {
            x = xstart;
            y = ystart;
        }
        if (bullettarget.object_index == obj_shadowman_enemy)
            bullettarget.idlesprite = spr_shadowman_idle_b;
        if (bullettarget.object_index == obj_zapper_enemy)
            bullettarget.idlesprite = spr_zapper_jump;
        break;
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}

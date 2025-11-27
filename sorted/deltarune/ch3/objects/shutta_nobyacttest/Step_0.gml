if (type == 0)
{
    if (init == 0)
    {
        ralseimax = 16;
        for (var i = 0; i < ralseimax; i++)
        {
            ralseiactor[i] = instance_create(camerax() + 140 + random(300), cameray() + 40 + random(190), obj_actor);
            ralseiactor[i].usprite = spr_ralsei_walk_up;
            ralseiactor[i].dsprite = spr_ch3_shutta_act_ralsei_walk_down_pippins;
            ralseiactor[i].rsprite = spr_ch3_shutta_act_ralsei_walk_right_pippins;
            ralseiactor[i].lsprite = spr_ch3_shutta_act_ralsei_walk_left_pippins;
            ralseiactor[i].sprite_index = spr_ralsei_walk_up;
            ralseiactor[i].image_speed = 0.25;
            ralseiactor[i].image_index = random(3);
            ralseiactor[i].image_xscale = 2;
            ralseiactor[i].image_yscale = 2;
            ralseiactor[i].mask_index = spr_ralsei_walk_left_sad;
            ralseiactor[i].ralseitimer = random(10);
            ralseiactor[i].ralseicon = 0;
            ralseiactor[i].auto_walk = 0;
            ralseiactor[i].depthbonus = -100;
        }
        with (ralseiactor[0])
        {
            dsprite = spr_ralsei_walk_down;
            rsprite = spr_ralsei_walk_right;
            lsprite = spr_ralsei_walk_left;
        }
        init = 1;
    }
    if (con == 0)
    {
        with (obj_actor)
        {
            if (usprite == spr_ralsei_walk_up)
            {
                depth = -1000 + y;
                ralseitimer++;
                if (ralseitimer >= 30)
                {
                    if (speed == 0)
                    {
                        speed = 2;
                        direction = choose(0, 90, 180, 270);
                        ralseitimer = random(20);
                    }
                    else
                    {
                        speed = 0;
                        ralseitimer = random(10);
                        if (direction != 90)
                        {
                            if (dsprite == spr_ralsei_walk_down)
                                ralseitimer = 15 + random(5);
                        }
                    }
                }
                if (x > (camerax() + 520))
                {
                    x -= 4;
                    hspeed = -hspeed;
                }
                if (x < (camerax() + 140))
                {
                    x += 4;
                    hspeed = -hspeed;
                }
                if (y > (cameray() + 200))
                {
                    y -= 4;
                    vspeed = -vspeed;
                }
                if (y < (cameray() + 0))
                {
                    y += 4;
                    vspeed = -vspeed;
                }
            }
        }
    }
}
if (type == 1)
{
    if (init == 0)
    {
        init = 1;
        _lancergotchi = instance_create(0, 0, obj_lancergotchi);
        _lancergotchi.x = (camerax() + 320) - 18;
        _lancergotchi.y = cameray() + 400;
    }
}
if (type == 2)
{
    var xx = camerax() + 320;
    var yy = cameray() + 220;
    var shuttahcount = 4;
    if (difficulty == 1)
        shuttahcount = 7;
    if (init == 0)
    {
        angle = random(360);
        init = 1;
        con = 1;
        radius = 190;
        for (var i = 0; i < shuttahcount; i++)
        {
            shutta[i] = instance_create(xx + lengthdir_x(radius, angle + ((i / shuttahcount) * 360)), yy + lengthdir_y(radius / 3, angle + ((i / shuttahcount) * 360)), obj_shutta_nobyact_shutta);
            if (difficulty == 0)
                shutta[i].tutorial = true;
        }
        shutta[0].sprite_index = spr_shutta_jump;
        if (shutta[0].x < (camerax() + (camerawidth() / 2)))
            obj_shutta_photo_controller.x = shutta[0].x + 250;
        else
            obj_shutta_photo_controller.x = shutta[0].x - 250;
        timer = 55;
        with (obj_shutta_photo_controller)
            rotatingvar = true;
    }
    if (init >= 1)
    {
        if (startrotating)
            siner++;
        if (startrotating && obj_shutta_photo_controller.fastphoto == true)
            siner++;
        if (difficulty == 0)
            angle += (sin(siner / 26) * 5);
        if (difficulty == 1)
            angle += (sin(siner / 20) * 10);
        for (var i = 0; i < shuttahcount; i++)
        {
            shutta[i].x = xx + lengthdir_x(radius, angle + ((i / shuttahcount) * 360));
            shutta[i].y = yy + lengthdir_y(radius / 3, angle + ((i / shuttahcount) * 360));
        }
    }
    timer++;
    if (timer == 60)
    {
        with (obj_shutta_nobyact_shutta)
            con = 1;
    }
    if ((obj_shutta_photo_controller.fastphoto == true && timer >= 85) || timer >= 170)
        timer = 4 + irandom(20);
}
if (type == 3)
{
    if (init == 0)
    {
        var tvcount = 16;
        for (var i = 0; i < tvcount; i++)
            tv[i] = instance_create(camerax() + 320, cameray() + 120, obj_shutta_nobyact_tv);
        tv[0].type = 1;
        tv[1].type = 1;
        tv[2].type = 1;
        with (obj_shutta_nobyact_tv)
        {
            if (type != 0)
                depth = obj_shutta_photo_controller.depth + 4;
        }
        init = 1;
    }
    timer++;
    if ((timer % 45) == 0)
    {
        with (tv[0])
        {
            if (con == 0)
                con = 1;
        }
    }
    if ((timer % 45) == 15)
    {
        with (tv[1])
        {
            if (con == 0)
                con = 1;
        }
    }
    if ((timer % 45) == 30)
    {
        with (tv[2])
        {
            if (con == 0)
                con = 1;
        }
    }
    photocooldowntimer--;
    if (photocooldowntimer == 1)
        obj_shutta_photo_controller.disablemovement = false;
    if (button1_p() && photocooldowntimer < 0)
    {
        var foundsmiling = 0;
        with (obj_shutta_nobyact_tv)
        {
            if (smiling == 1 && place_meeting(x, y, obj_shutta_photo_controller))
            {
                foundsmiling++;
                con = 20;
                other.smilecount--;
                scr_tenna_add_score(10);
                snd_play_x(snd_coin, 0.9, 1);
                if (other.smilecount == 0)
                    scr_tenna_add_score(round((215 - obj_tenna_minigame_ui.timer) / 5));
            }
        }
        if (foundsmiling == 0)
        {
            with (obj_shutta_nobyact_tv)
            {
                if (type == 0 && place_meeting(x, y, obj_shutta_photo_controller))
                {
                    myimage = choose(3, 7);
                    timer = 0;
                    con = 11;
                    statictimer = 15;
                }
            }
        }
        with (obj_shutta_photo_controller)
        {
            flash_alpha = 0.9;
            snd_play_volume(snd_camera_flash, 0.8);
        }
        photocooldowntimer = 30;
    }
    var typecount = 0;
    with (obj_shutta_nobyact_tv)
    {
        if (type == 1)
            typecount++;
    }
    if (typecount == 0)
    {
        if ((timer % 3) == 0)
        {
            with (obj_shutta_nobyact_tv)
            {
                speed = 0;
                myimage = choose(2, 1);
                image_alpha -= 0.05;
                if (image_alpha <= 0)
                    instance_destroy();
            }
        }
    }
}
if (type == 4)
{
    var firex = camerax() + 480;
    var firey = cameray() + 170;
    if (i_ex(obj_shutta_photo_controller) && obj_shutta_photo_controller.bullettarget.object_index == obj_shadowman_enemy)
    {
        firex = camerax() + 490;
        firey = cameray() + 186;
    }
    timer++;
    if (timer < 24 && (timer % 6) == 0)
    {
        with (obj_shutta_photo_controller)
        {
            if (bullettarget.object_index == obj_shadowman_enemy)
            {
                bullettarget.guntimer = 28;
                snd_play(snd_gunshot);
            }
            else
            {
                snd_play(snd_bump);
            }
        }
        var fakebullet = instance_create(firex, firey, obj_shutta_nobyact_fakebullet);
        fakebullet.type = 1;
        scr_lerpvar_instance(fakebullet, "x", firex, camerax() + 320 + random_range(-60, 60), 24, 1, "out");
        scr_lerpvar_instance(fakebullet, "y", firey, cameray() + 180 + random_range(-60, 60), 24, 1, "out");
        scr_lerpvar_instance(fakebullet, "image_xscale", 0.2, 1.4, 24, 1, "out");
        scr_lerpvar_instance(fakebullet, "image_yscale", 0.2, 1.4, 24, 1, "out");
        with (fakebullet)
            scr_var_delayed("con", 1, 30);
    }
    if (timer == 87 && i_ex(obj_shutta_photo_controller))
    {
        if (obj_shutta_photo_controller.timer > (obj_shutta_photo_controller.timer_duration - 30))
            timer = 100;
    }
    if (timer == 88)
    {
        with (obj_shutta_photo_controller)
        {
            pipetimer = 1;
            if (bullettarget.object_index == obj_zapper_enemy)
            {
                bullettarget.siner = 4;
                bullettarget.idlesprite = spr_zapper_cannon;
            }
        }
    }
    if (timer == 90)
        timer = 0;
    photocooldowntimer--;
    if (button1_p() && photocooldowntimer < 0)
    {
        photocooldowntimer = 30;
        with (obj_shutta_photo_controller)
            flash_alpha = 0.9;
        snd_play_volume(snd_camera_flash, 0.8);
        with (obj_shutta_nobyact_fakebullet)
        {
            if (place_meeting(x, y, obj_shutta_photo_controller) && photographed == 0)
            {
                event_user(0);
                with (obj_shutta_photo_controller)
                    mercygained += 4;
            }
        }
        with (obj_shutta_photo_controller)
        {
            if (timer < (timer_duration - 10))
                timer = timer_duration - 10;
            with (obj_dmgwriter)
                instance_destroy();
            mercygained = round(mercygained);
            if (mercygained > 100)
                mercygained = 100;
            if (mercygained > 0)
                endmessage = message_nicephoto;
            with (obj_monsterparent)
                scr_mercyadd(myself, other.mercygained);
            mercygained = 0;
            tookaphoto = true;
        }
    }
}
delaydeath--;
if (delaydeath == 0)
{
    instance_destroy();
    with (obj_shutta_nobyact_shutta)
        instance_destroy();
}

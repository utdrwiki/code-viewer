if (place_meeting(x, y, obj_board_swordhitbox) && hurttimer == 0)
{
    snd_stop(snd_board_bosshit);
    snd_play(snd_board_bosshit);
    with (obj_board_controller)
    {
        crt_glitch = 6;
        crt_glitchstrength = 8;
    }
    hurttimer = 8;
    if (phasetransitioncon == 1)
    {
        hp -= 0.2;
    }
    else if (hp < 5)
    {
        if (dashcon != 0)
            hp -= 1;
        else
            hp -= 0.1;
    }
    else
    {
        if (timeshitthisphase == -2)
            hp -= 2;
        if (timeshitthisphase == -1)
            hp -= 1.5;
        if (timeshitthisphase == 0)
            hp--;
        if (timeshitthisphase == 1)
            hp -= 0.75;
        if (timeshitthisphase == 2)
            hp -= 0.5;
        if (timeshitthisphase > 2)
            hp -= 0.2;
        damagetakenduringattack++;
        timeshitthisphase++;
        if (spawnenemies == 1)
            hitsduringenemies++;
    }
    snd_stop(snd_board_mantle_dash_slow);
    if ((phase != 4 || phasetransitioncon == 1) && hp < 4)
        hp = 4;
    if (hp < 1 || (hp < 2 && global.shadow_mantle_losses >= 7))
    {
        snd_free(global.currentsong[0]);
        instance_create(x, y, obj_shadow_mantle_enemy_outro);
        instance_destroy();
        with (obj_shadow_mantle_clone)
            instance_destroy();
        with (obj_shadow_mantle_cloud_bullet)
            instance_destroy();
        with (obj_shadow_mantle_bomb)
            instance_destroy();
        with (obj_shadow_mantle_cloud)
            instance_destroy();
        with (obj_shadow_mantle_enemy_spawn)
            instance_destroy();
        with (obj_shadow_mantle_fire_controller)
            instance_destroy();
        with (obj_shadow_mantle_fire)
            instance_destroy();
        with (obj_spawn_pos)
            instance_destroy();
        with (obj_shadow_mantle_fire3)
            instance_destroy();
        with (obj_shadow_mantle_groundfire)
            instance_destroy();
        with (obj___)
            instance_destroy();
        exit;
    }
}
scr_depth_board();
if (!i_ex(obj_shadow_mantle_enemy_spawn) && !i_ex(obj___) && burstwavecon == 0 && spawnenemies == 0 && dashcon == 0 && flamewavecon == 0 && telegraphtimer == 0 && phasetransitioncon == 0)
{
    hspeed = 0;
    vspeed = 0;
    attacktimer++;
}
if ((hp <= 22 && phase == 1) || (hp <= 13 && phase == 2) || (hp <= 4 && phase == 3))
{
    burstwavecon = 0;
    burstwavetimer = 0;
    spawnenemies = 0;
    spawnenemiestimer = 0;
    dashcon = 0;
    dashtimer = 0;
    dashused = 0;
    dashcount = 0;
    flamewavecon = 0;
    flamewavetimer = 0;
    telegraphtimer = 0;
    phasetransitioncon = 0;
    attacktimer = 20;
    darkcandydrop = false;
    sprite_index = spr_shadow_mantle_idle;
    image_speed = 1/3;
    speed = 0;
    gravity = 0;
    friction = 0;
    hspeed = 0;
    vspeed = 0;
    path_end();
    with (obj_shadow_mantle_fire)
        instance_destroy();
    with (obj_shadow_mantle_fire_controller)
        instance_destroy();
}
if (attacktimer >= 20)
{
    if (timeshitthisphase > 0)
        timeshitthisphase = 0;
    else if (timeshitthisphase == 0)
        timeshitthisphase = -1;
    else if (timeshitthisphase == -1)
        timeshitthisphase = -2;
    with (obj_shadow_mantle_fire)
        instance_destroy();
    attacktimer = 0;
    damagetakenduringattack = 0;
    movecon = 0;
    movetimer = 0;
    dashcount = 0;
    telegraphtimer = 0;
    telegraphused = 0;
    hitsduringenemies = 0;
    hspeed = 0;
    vspeed = 0;
    speed = 0;
    var attackchosen = false;
    if (hp > 22)
    {
        if (burstwaveused == 0 && flamewaveused == 0)
        {
            if (global.shadow_mantle_losses == 0)
                flamewaveused = 1;
            else if (choose(1, 2) == 1)
                burstwaveused = 1;
            else
                flamewaveused = 1;
        }
        if (burstwaveused == 0)
        {
            burstwaveused = 1;
            flamewaveused = 0;
            burstwavecon = 1;
            movestyle = "cardinal";
        }
        else if (flamewaveused == 0)
        {
            flamewaveused = 1;
            burstwaveused = 0;
            flamewavecon = 1;
        }
    }
    if (hp > 13 && hp <= 22)
    {
        if (phase == 1)
        {
            phase = 2;
            phasetransitioncon = 1;
            phasetransitiontimer = 0;
            movetimer = 0;
            movecon = 0;
            movestyle = "to point and stop";
            enemywaveused = 1;
        }
        else
        {
            if (dashused == 0 && enemywaveused == 0)
            {
                if (choose(1, 2) == 1)
                    enemywaveused = 1;
                else
                    dashused = 1;
            }
            if (enemywaveused == 0)
            {
                enemywaveused = 1;
                dashused = 0;
                spawnenemies = 1;
            }
            else if (dashused == 0)
            {
                dashused = 1;
                enemywaveused = 0;
                dashcon = 2;
                movestyle = "to point and stop";
            }
        }
    }
    if (hp > 4 && hp <= 13)
    {
        if (phase == 2)
        {
            phase = 3;
            phasetransitioncon = 1;
            phasetransitiontimer = 0;
            movetimer = 0;
            movecon = 0;
            movestyle = "to point and stop";
        }
        else
        {
            var attack = choose(2, 2, 2);
            if (burstwaveused == 1 && enemywaveused == 1 && flamewaveused == 1)
            {
                if (lastused != "burstwave")
                    burstwaveused = 0;
                if (lastused != "enemywave")
                    enemywaveused = 0;
                if (lastused != "flamewave")
                    flamewaveused = 0;
            }
            repeat (4)
            {
                if (hp <= 4)
                {
                    hp = 4;
                    dashcon = 2;
                    dashtimer = 5;
                    movestyle = "to point and stop";
                }
                else if (attackchosen == false)
                {
                    if (attack == 0 && burstwaveused == 0)
                    {
                        burstwaveused = 1;
                        attackchosen = true;
                        burstwavecon = 1;
                        movestyle = "cardinal";
                        lastused = "burstwave";
                    }
                    else if (attack == 1 && enemywaveused == 0)
                    {
                        enemywaveused = 1;
                        attackchosen = true;
                        spawnenemies = 1;
                        lastused = "enemywave";
                    }
                    else if (attack == 2 && flamewaveused == 0)
                    {
                        flamewaveused = 1;
                        attackchosen = true;
                        flamewavecon = 1;
                        lastused = "flamewave";
                    }
                    else
                    {
                        attack++;
                        if (attack > 2)
                            attack = 0;
                    }
                }
            }
        }
    }
    if (hp <= 4)
    {
        if (phase == 3)
        {
            phase = 4;
            phasetransitioncon = 1;
            phasetransitiontimer = 0;
            movetimer = 0;
            movecon = 0;
            movestyle = "to point and stop";
        }
        else
        {
            var attack = choose(0, 1, 2);
            dashcon = 2;
            movestyle = "to point and stop";
        }
    }
}
if (burstwavecon == 1)
{
    burstwavetimer++;
    if (hp > 13)
    {
        if (burstwavetimer == 1)
        {
            sprite_index = spr_shadow_mantle_release;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 11)
        {
            bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(9) * 32) + 16;
            bullet.targety = 96 + (irandom(1) * 32) + 29;
        }
        if (burstwavetimer == 17)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 21)
        {
            bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(9) * 32) + 16;
            bullet.targety = 160 + (irandom(1) * 32) + 29;
        }
        if (burstwavetimer == 27)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 31)
        {
            bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(9) * 32) + 16;
            bullet.targety = 224 + (irandom(1) * 32) + 29;
        }
        if (burstwavetimer == 121)
        {
            sprite_index = spr_shadow_mantle_release;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 131)
        {
            bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(9) * 32) + 16;
            bullet.targety = 96 + (irandom(1) * 32) + 29;
        }
        if (burstwavetimer == 137)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 141)
        {
            bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(9) * 32) + 16;
            bullet.targety = 160 + (irandom(1) * 32) + 29;
        }
        if (burstwavetimer == 147)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 151)
        {
            bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(9) * 32) + 16;
            bullet.targety = 224 + (irandom(1) * 32) + 29;
        }
    }
    else
    {
        if (burstwavetimer == 1)
        {
            sprite_index = spr_shadow_mantle_release;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 11)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(4) * 32) + 16;
            bullet.targety = 96 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 17)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 21)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 320 + (irandom(4) * 32) + 16;
            bullet.targety = 96 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 27)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 31)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(4) * 32) + 16;
            bullet.targety = 192 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 37)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 41)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 320 + (irandom(4) * 32) + 16;
            bullet.targety = 192 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 81)
        {
            sprite_index = spr_shadow_mantle_release;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 91)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(4) * 32) + 16;
            bullet.targety = 96 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 97)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 101)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 320 + (irandom(4) * 32) + 16;
            bullet.targety = 96 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 107)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 111)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 160 + (irandom(4) * 32) + 16;
            bullet.targety = 192 + (irandom(2) * 32) + 29;
        }
        if (burstwavetimer == 117)
        {
            sprite_index = spr_shadow_mantle_release_abbreviated;
            image_speed = 0.5;
            image_index = 0;
        }
        if (burstwavetimer == 121)
        {
            bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
            bullet.depth = depth - 5;
            bullet.targetx = 320 + (irandom(4) * 32) + 16;
            bullet.targety = 192 + (irandom(2) * 32) + 29;
        }
    }
    if ((hp > 13 && burstwavetimer >= 182) || (hp <= 13 && burstwavetimer >= 152))
    {
        movestyle = "none";
        hspeed = 0;
        vspeed = 0;
        if (telegraphtimer == 0 && damagetakenduringattack == 0)
        {
            sprite_index = spr_shadow_mantle_laugh;
            image_speed = 0.1;
            snd_play_pitch(snd_board_mantle_laugh_mid, 1.3);
            telegraphtimer = 61;
        }
        if (telegraphtimer <= 1 || (damagetakenduringattack >= 1 && telegraphtimer > 0 && telegraphtimer <= 31))
        {
            burstwavecon = 0;
            burstwavetimer = 0;
            sprite_index = spr_shadow_mantle_idle;
            image_speed = 1/3;
        }
    }
}
if (spawnenemies == 1)
{
    spawnenemiestimer++;
    if (spawnenemiestimer == 1)
    {
        sprite_index = choose(spr_shadow_mantle_side_r, spr_shadow_mantle_side_l);
        image_speed = 1/3;
    }
    if (spawnenemiestimer == 15 || spawnenemiestimer == 30 || spawnenemiestimer == 45 || spawnenemiestimer == 60 || spawnenemiestimer == 75)
    {
        snd_stop(snd_board_summon);
        snd_play(snd_board_summon);
        spawn = instance_create(x, y, obj_shadow_mantle_enemy_spawn);
    }
    if (spawnenemiestimer == 30 || spawnenemiestimer == 75)
        spawn.move_type = 1;
    if (spawnenemiestimer == 75)
        hitsduringenemies = 0;
    if (spawnenemiestimer == 77)
    {
        hitsduringenemies++;
        sprite_index = spr_shadow_mantle_laugh;
        image_speed = 0.1;
        image_xscale = 1;
        snd_play_pitch(snd_board_mantle_laugh_mid, 1.3);
    }
    if (spawnenemiestimer == 106)
    {
        sprite_index = spr_shadow_mantle_idle;
        image_speed = 1/3;
        image_xscale = 1;
    }
    if (spawnenemiestimer == 126)
        spawnenemiestimer = 76;
    if (spawnenemiestimer >= 77 && hitsduringenemies > 4)
    {
        sprite_index = spr_shadow_mantle_idle;
        image_speed = 1/3;
        image_xscale = 1;
        spawnenemies = 0;
        spawnenemiestimer = 0;
        dashcount = 0;
        dashused = 1;
        enemywaveused = 0;
        damagetakenduringattack = 0;
        timeshitthisphase = 0;
        dashcon = 2;
        dashtimer = -1;
        telegraphtimer = 0;
        movestyle = "to point and stop";
        waittimer = 0;
    }
}
if (flamewavecon == 1)
{
    flamewavetimer++;
    if (flamewavetimer == 1)
        movestyle = "path";
    if (flamewavetimer == 10 || flamewavetimer == 60 || flamewavetimer == 110 || flamewavetimer == 160)
    {
        if (hp > 13)
            _type = 4;
        else
            _type = 5;
        fire = instance_create(x, y, obj_shadow_mantle_fire_controller);
        fire._type = _type;
        if (flamewavetimer == 10)
            fire._type = 4.5;
    }
    if ((flamewavetimer == 20 || flamewavetimer == 50 || flamewavetimer == 80 || flamewavetimer == 110) && hp <= 13 && _type == 5)
    {
        sprite_index = spr_shadow_mantle_release;
        image_speed = 0.5;
        image_index = 0;
    }
    if ((flamewavetimer == 30 || flamewavetimer == 60 || flamewavetimer == 90 || flamewavetimer == 120) && hp <= 13 && _type == 5)
    {
        bullet = instance_create(x + 16, y + 16, obj_shadow_mantle_bomb);
        bullet.depth = depth - 5;
        bullet.targetx = 160 + (irandom(9) * 32) + 16;
        bullet.targety = 96 + (irandom(5) * 32) + 29;
    }
    if (flamewavetimer == 210)
    {
        flamewavecon = 0;
        flamewavetimer = 0;
    }
}
if (phasetransitioncon == 1)
{
    phasetransitiontimer++;
    if (phasetransitiontimer == 1)
        ohmygodimonfire = 0;
    if (phasetransitiontimer == 25)
    {
        snd_play_pitch(snd_board_mantle_move, 0.7);
        with (obj_shadow_mantle_bg)
            con = 1;
    }
    if (phasetransitiontimer == 46)
    {
        if (phase == 4)
        {
            sprite_index = spr_shadow_mantle_dash;
            ohmygodimonfire = 1;
            phasetransitioncon = 2;
            phasetransitiontimer = 0;
        }
    }
    if (phasetransitiontimer >= 47 && !i_ex(obj_shadow_mantle_fire_controller))
    {
        phasetransitioncon = 0;
        phasetransitiontimer = 0;
        attacktimer = 20;
        ohmygodimonfire = 0;
    }
}
if (phasetransitioncon == 2)
{
    phasetransitiontimer++;
    if (phasetransitiontimer == 1)
    {
        sprite_index = spr_shadow_mantle_dash;
        image_speed = 0.5;
        snd_play(snd_board_torch_high);
        ohmygodimonfire = 1;
    }
    if ((phasetransitiontimer % 5) == 0 && phasetransitiontimer < 52)
        snd_play(snd_board_torch_high);
    if ((phasetransitiontimer % 2) == 0 && phasetransitiontimer < 45)
    {
        var rand = irandom(360);
        instance_create(x + 16 + lengthdir_x(42, rand), y + 16 + lengthdir_y(42, rand), obj_shadow_mantle_transition_particle);
    }
    if (phasetransitiontimer > 10 && phasetransitiontimer < 52)
    {
        if (sprite_index == spr_shadow_mantle_dash)
            sprite_index = spr_shadow_mantle_onfire;
        else
            sprite_index = spr_shadow_mantle_dash;
    }
    if (phasetransitiontimer == 45)
    {
        var offset = 19.5;
        var len = 24;
        fire1 = instance_create(x + 16 + lengthdir_x(len, 67.5 + offset), y + 16 + lengthdir_y(len, 67.5 + offset), obj_board_marker);
        fire1.sprite_index = spr_shadow_mantle_fire;
        fire1.image_xscale = 2;
        fire1.image_yscale = 2;
        fire1.depth = 10000;
        fire2 = instance_create(x + 16 + lengthdir_x(len, 187.54 + offset), y + 16 + lengthdir_y(len, 187.54 + offset), obj_board_marker);
        fire2.sprite_index = spr_shadow_mantle_fire;
        fire2.image_xscale = 2;
        fire2.image_yscale = 2;
        fire2.depth = 10000;
        fire3 = instance_create(x + 16 + lengthdir_x(len, 307.54 + offset), y + 16 + lengthdir_y(len, 307.54 + offset), obj_board_marker);
        fire3.sprite_index = spr_shadow_mantle_fire;
        fire3.image_xscale = 2;
        fire3.image_yscale = 2;
        fire3.depth = 10000;
    }
    if (phasetransitiontimer > 52 && phasetransitiontimer < 72)
    {
        with (fire1)
        {
            if (visible == true)
                visible = false;
            else
                visible = true;
        }
        with (fire2)
        {
            if (visible == true)
                visible = false;
            else
                visible = true;
        }
        with (fire3)
        {
            if (visible == true)
                visible = false;
            else
                visible = true;
        }
    }
    if (phasetransitiontimer == 42)
    {
        fire = instance_create(x, y, obj_shadow_mantle_fire_controller);
        fire._type = 8;
    }
    if (phasetransitiontimer == 72)
    {
        sprite_index = spr_shadow_mantle_idle;
        ohmygodimonfire = 0;
        with (fire1)
            instance_destroy();
        with (fire2)
            instance_destroy();
        with (fire3)
            instance_destroy();
    }
    if (phasetransitiontimer >= 83 && !i_ex(obj_shadow_mantle_fire_controller))
    {
        phasetransitioncon = 0;
        phasetransitiontimer = 0;
        attacktimer = -10;
        ohmygodimonfire = 0;
    }
}
if (dashcon == 1)
{
    dashtimer++;
    if (dashtimer == 1)
    {
        if ((dashcount > 2 || (damagetakenduringattack > 2 && dashcount > 1)) && hp > 4)
        {
            show_debug_message("dashcount: " + string(dashcount));
            show_debug_message("damagetakenduringattack: " + string(damagetakenduringattack));
            vspeed = 16;
            x = 224 + (irandom(5) * 32);
            dashcon = 1.5;
            dashtimer = 0;
        }
        else
        {
            if (choose(1, 2) == 1)
            {
                direction = point_direction(x + 16, y + 16, obj_mainchara_board.x + 16, obj_mainchara_board.y + 16);
                gravity = 0.24;
            }
            else
            {
                direction = point_direction(x + 16, y + 16, obj_mainchara_board.x + 16 + choose(66, -66), obj_mainchara_board.y + 16);
                gravity = 0.24;
            }
            gravity_direction = direction;
            if (global.shadow_mantle_losses >= 7)
                gravity = 0.2;
            snd_play_delay(snd_board_mantle_dash_slow, 5, 1, 0.95 + random(0.1));
            speed = 2;
            dashtimer = 28;
            dashcon = 2;
            dashcount++;
        }
    }
}
if (dashcon == 1.5)
{
    if (y > (cameray() + 152) || telegraphtimer > 0)
    {
        gravity = 0;
        speed = 0;
        ohmygodimonfire = 0;
        if (telegraphtimer == 0)
        {
            sprite_index = spr_shadow_mantle_laugh;
            image_speed = 0.1;
            snd_play_pitch(snd_board_mantle_laugh_mid, 1.3);
            telegraphtimer = 46;
        }
        if (telegraphtimer == 1)
        {
            sprite_index = spr_shadow_mantle_idle;
            image_speed = 1/3;
            attacktimer = 19;
            dashcon = 0;
            telegraphtimer = 0;
        }
    }
}
if (dashcon == 0 && phasetransitioncon == 0)
    ohmygodimonfire = 0;
if (dashcon == 2)
{
    dashtimer++;
    if (dashtimer == 10 && friction == 0)
    {
        sprite_index = spr_shadow_mantle_dash;
        image_speed = 0.5;
        snd_play_volume(snd_board_mantle_dash_prepare, 1.2);
        ohmygodimonfire = 1;
        if (choose(1, 2) == 1)
            direction = point_direction(x + 16, y + 16, obj_mainchara_board.x + 16, obj_mainchara_board.y + 16);
        else
            direction = point_direction(x + 16, y + 16, obj_mainchara_board.x + 16 + choose(66, -66), obj_mainchara_board.y + 16);
        if (direction < 200 || direction > 330)
            direction = 200 + irandom(130);
        gravity_direction = direction;
        if (distance_to_object(obj_mainchara_board) >= 70)
        {
            friction = 0.4;
            speed = -6;
        }
        else
        {
            friction = 0.14;
            speed = -4;
            dashtimer = 0;
        }
    }
    if (dashtimer == 28)
    {
        snd_stop(snd_board_mantle_dash_slow);
        snd_play_pitch(snd_board_mantle_dash_slow, 0.95 + random(0.1));
        friction = 0;
        gravity = 0.5;
        speed = 10;
    }
    if (dashcount > 0 && hp <= 4)
    {
        if (dashtimer == 44)
            instance_create_depth(160 + (irandom(9) * 32), 20, depth + 1, obj_shadow_mantle_clone);
        if (dashtimer == 58)
            instance_create_depth(160 + (irandom(9) * 32), 20, depth + 1, obj_shadow_mantle_clone);
    }
    if (dashtimer >= 30 && (dashtimer % 2) == 0)
    {
        if (hp >= 5)
            gravity += 0.03;
        else if (global.shadow_mantle_losses < 7)
            gravity += 0.03;
        else if (global.shadow_mantle_losses < 14)
            gravity += 0.023;
        else
            gravity += 0.017;
        instance_create_depth(x + 16, y + 16, depth + 1, obj_shadow_mantle_groundfire);
    }
    if (y > (cameray() + cameraheight()) || y < (cameray() - 100) || x < (camerax() + 32) || x > (camerax() + camerawidth()))
    {
        dashtimer = 0;
        dashcon = 1;
        speed = 0;
        gravity = 0;
        direction = 270;
        gravity_direction = 270;
        x = 160 + (irandom(9) * 32);
        y = cameray() - 10;
    }
    if (ohmygodimonfire == 1)
    {
        dashhitboxtimer++;
        if (dashhitboxtimer > 20)
            instance_create_depth(x + 16 + lengthdir_x(speed, direction), y + 16 + lengthdir_y(speed, direction), depth - 99999, obj_shadow_mantle_dash_hitbox);
    }
    else
    {
        dashhitboxtimer = 0;
    }
}
siner++;
y += sin(siner / 3);
if (movestyle == "to point and stop")
{
    if (movetimer > 6)
        movetimer = 0;
    if (movecon == 0)
    {
        hspeed = 0;
        vspeed = 0;
        speed = 0;
        if (phasetransitioncon == 1)
        {
            targetx = 304;
            targety = 174;
        }
        else if (spawnenemies == 1)
        {
        }
        else
        {
            targetx = 160 + (irandom(9) * 32);
            targety = 96 + (irandom(5) * 32);
            if (dashcon == 2)
            {
                targetx = (obj_mainchara_board.x - 40) + irandom(80);
                if (targetx < 160)
                    targetx = 160;
                if (targetx > 446)
                    targetx = 446;
                targety = 96;
            }
        }
        movecon = 1;
        movetimer = 0;
    }
    if (movecon == 1)
    {
        if (image_blend != c_purple)
            image_blend = c_purple;
        else
            image_blend = c_white;
        movetimer++;
        x = lerp(x, targetx, movetimer / 6);
        y = lerp(y, targety, movetimer / 6);
        if (movetimer == 6)
        {
            image_blend = c_white;
            movecon = 0;
            movetimer = 0;
            movestyle = "none";
        }
    }
}
if (movestyle == "move slowly to points")
{
    if (movecon == 0)
    {
        speed = 0;
        hspeed = 0;
        vspeed = 0;
        targetx = 160 + (irandom(9) * 32);
        targety = 96 + (irandom(5) * 32);
        move_towards_point(targetx, targety, 1);
        movecon = 1;
    }
    if (movecon == 1)
    {
        movetimer++;
        if (movetimer == 60)
        {
            movecon = 0;
            movetimer = 0;
        }
    }
}
if (movestyle == "cardinal")
{
    if (movecon == 0)
    {
        speed = 0;
        var spd = 5;
        if (hp <= 13)
            spd = 7;
        var rand = choose(0, 1, 2, 3);
        if (rand == 0)
        {
            hspeed = spd;
            vspeed = 0;
        }
        if (rand == 1)
        {
            vspeed = -spd;
            hspeed = 0;
        }
        if (rand == 2)
        {
            hspeed = -spd;
            vspeed = 0;
        }
        if (rand == 3)
        {
            vspeed = spd;
            hspeed = 0;
        }
        if ((y + 16) < 150)
        {
            vspeed = spd;
            hspeed = 0;
        }
        if ((y + 16) > 228)
        {
            vspeed = -spd;
            hspeed = 0;
        }
        if ((x + 16) < 215)
        {
            vspeed = 0;
            hspeed = spd;
        }
        if ((x + 16) > 420)
        {
            vspeed = 0;
            hspeed = -spd;
        }
        movecon = 1;
    }
    if (movecon == 1)
    {
        movetimer++;
        if (movetimer == 20)
        {
            movecon = 0;
            movetimer = 0;
        }
    }
    if (x > (camerax() + camerawidth()))
    {
        hspeed = -5;
        vspeed = 0;
        movetimer = 0;
        movecon = 0;
    }
    if (x < (camerax() + 32))
    {
        hspeed = 5;
        vspeed = 0;
        movetimer = 0;
        movecon = 0;
    }
    if (y > (cameray() + cameraheight() + 32))
    {
        hspeed = 0;
        vspeed = -5;
        movetimer = 0;
        movecon = 0;
    }
    if (y < cameray())
    {
        hspeed = 0;
        vspeed = 5;
        movetimer = 0;
        movecon = 0;
    }
}
if (movestyle == "path")
{
    speed = 0;
    hspeed = 0;
    vspeed = 0;
    var spd = 0.15;
    x = lerp(x, obj_shadow_mantle_path.x, spd);
    y = lerp(y, obj_shadow_mantle_path.y, spd);
}
else
{
    firetrailtimer = 0;
}
if (sprite_index == spr_shadow_mantle_laugh)
    image_speed = lerp(0.6, 0.1, telegraphtimer / 61);

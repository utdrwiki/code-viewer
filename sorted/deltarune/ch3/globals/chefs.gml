function scr_chefs()
{
    if (instance_exists(obj_chefs_game))
        return true;
    else
        return false;
}

function scr_chefs_start(arg0)
{
    if (scr_chefs())
        exit;
    instance_create(0, 0, obj_chefs_init);
    obj_chefs_game.microgame = arg0;
    obj_chefs_spawner.firedie = 1;
    obj_chefs_game.hbx_visible = 0;
    obj_chefs_game.bananacoins = 0;
    obj_chefs_spawner.no_fire = 0;
    switch (obj_chefs_game.microgame)
    {
        default:
            obj_chefs_game.alarm[0] = 60;
            obj_chefs_game.alarm[1] = 30;
            obj_chefs_spawner.alarm[0] += 60;
            obj_chefs_customer_spawner.alarm[0] += 60;
            break;
        case 1:
            var i = 1;
            with (obj_chefs_spawner)
            {
                mode = 1;
                side = i;
                freq = 50;
                alarm[0] = 10 + irandom(10);
                visible = false;
                i = -1;
            }
            instance_destroy(obj_chefs_customer_spawner);
            with (obj_chefs_susie)
                instance_destroy();
            with (obj_chefs_ralsei)
                instance_destroy();
            tinytenna1 = instance_create(140, 200, obj_tenna_chef_marker1);
            tinytenna2 = instance_create(540, 200, obj_tenna_chef_marker1);
            tinytenna2.type = 1;
            with (instance_create(320, 40, obj_chefs_fireguest))
            {
                depth++;
                visible = false;
            }
            obj_chefs_game.timer = 10;
            obj_chefs_game.timer_max = 10;
            with (obj_chefs_kris)
            {
                mask_index = spr_kris_chef_walk;
                audio_stop_sound(snd_egg);
            }
            break;
        case 2:
            instance_destroy(obj_chefs_spawner);
            instance_destroy(obj_chefs_customer_spawner);
            instance_destroy(obj_chefs_susie);
            instance_destroy(obj_chefs_ralsei);
            with (instance_create(0, -16, obj_chefs_spawner))
                alarm[0] = 5;
            var i = 0;
            repeat (5)
            {
                with (instance_create(300, 420, obj_chefs_evilguest))
                {
                    alarm[0] = 30 + (i * 60);
                    image_xscale = 1;
                    image_yscale = 1;
                    ya = 30;
                    xa = 60;
                    xf = 0.15 - (i * 0.01);
                    yf = 0.05 + (i * 0.01);
                    t = (i * 10) + irandom(60);
                    movetype = 1;
                    movespeed = 6 + min(i * 2, 6);
                }
                i++;
            }
            obj_chefs_game.timer = 16;
            obj_chefs_game.timer_max = 16;
            with (obj_chefs_kris)
                audio_stop_sound(snd_egg);
            break;
        case 3:
            with (obj_chefs_spawner)
            {
                if (mode == 0)
                    freq = 30;
                if (mode == 1)
                    freq = 50;
                alarm[0] = 10 + irandom(10);
            }
            instance_destroy(obj_chefs_customer_spawner);
            with (obj_chefs_susie)
            {
                with (instance_create(x, y, obj_chefs_vfx))
                {
                    sprite_index = spr_shadowman_leave;
                    image_xscale = 2;
                    image_yscale = 2;
                    image_speed = 1;
                }
                instance_destroy();
            }
            with (obj_chefs_ralsei)
            {
                with (instance_create(x, y, obj_chefs_vfx))
                {
                    sprite_index = spr_shadowman_leave;
                    image_xscale = -2;
                    image_yscale = 2;
                    image_speed = 1;
                    image_index = 1;
                }
                instance_destroy();
            }
            with (instance_create(300, 420, obj_chefs_evilguest))
            {
                image_xscale = 2;
                image_yscale = 2;
                ya = 60;
                movetype = 1;
            }
            with (instance_create(340, 440, obj_chefs_evilguest))
            {
                image_xscale = 2;
                image_yscale = 2;
                movetype = 1;
                yf = 0.2;
                xf *= -1.1;
                depth -= 10;
                sprite_index = spr_shadowman_run3;
            }
            obj_chefs_game.timer = 12;
            obj_chefs_game.timer_max = 12;
            with (obj_chefs_kris)
                audio_stop_sound(snd_egg);
            break;
        case 4:
            instance_destroy(obj_chefs_customer_spawner);
            with (obj_chefs_spawner)
            {
                mode = 0;
                alarm[0] = 1 + irandom(5);
            }
            with (instance_create(300, 420, obj_chefs_customer))
            {
                tenna = true;
                image_speed = 0;
                movespeed = 10;
                moves = 20;
                foods_needed = 6;
                special = 1;
                movetype = 1;
                var _firewhip = instance_create(x, y, obj_chefs_firewhip);
                _firewhip.fixate = id;
            }
            obj_chefs_game.timer = 16;
            obj_chefs_game.timer_max = 16;
            with (obj_chefs_kris)
                x -= 80;
            break;
        case 5:
            instance_destroy(obj_chefs_customer_spawner);
            instance_create(0, -16, obj_chefs_spawner);
            instance_create(0, -16, obj_chefs_spawner);
            with (obj_chefs_spawner)
            {
                mode = 0;
                alarm[0] = 1 + irandom(5);
            }
            with (instance_create(300, 420, obj_chefs_customer))
            {
                sprite_index = spr_tenna_grasp_chef;
                image_speed = 0;
                movespeed = 10;
                moves = 20;
                foods_needed = 10;
                special = 1;
                movetype = 1;
                var _firewhip = instance_create(x, y, obj_chefs_firewhip);
                _firewhip.fixate = id;
            }
            obj_chefs_game.timer = 16;
            obj_chefs_game.timer_max = 16;
            with (obj_chefs_kris)
                x -= 80;
            break;
        case 6:
            var i = 1;
            with (obj_chefs_spawner)
            {
                mode = 1;
                side = i;
                freq = 90;
                alarm[0] = 45 + (45 * i);
                visible = false;
                i = -1;
            }
            instance_destroy(obj_chefs_customer_spawner);
            with (obj_chefs_susie)
                instance_destroy();
            with (obj_chefs_ralsei)
                instance_destroy();
            tinytenna1 = instance_create(90, 140, obj_tenna_chef_marker1);
            tinytenna2 = instance_create(500, 140, obj_tenna_chef_marker1);
            tinytenna2.type = 1;
            with (instance_create(320, 40, obj_chefs_fireguest))
            {
                depth++;
                visible = false;
            }
            obj_chefs_game.timer = 10;
            obj_chefs_game.timer_max = 10;
            with (obj_chefs_kris)
            {
                mask_index = spr_kris_chef_walk;
                audio_stop_sound(snd_egg);
            }
            break;
    }
}

function scr_chefs_end()
{
    instance_destroy(obj_chefs_100pts);
    instance_destroy(obj_chefs_coinvfx);
    instance_destroy(obj_chefs_customer);
    instance_destroy(obj_chefs_customer_spawner);
    instance_destroy(obj_chefs_evilguest);
    instance_destroy(obj_chefs_fire);
    instance_destroy(obj_chefs_fireguest);
    instance_destroy(obj_chefs_food);
    instance_destroy(obj_chefs_foodnotice);
    instance_destroy(obj_chefs_game);
    instance_destroy(obj_chefs_init);
    instance_destroy(obj_chefs_jumpcatchtxt);
    instance_destroy(obj_chefs_kris);
    instance_destroy(obj_chefs_ralsei);
    instance_destroy(obj_chefs_scoretxt);
    instance_destroy(obj_chefs_spawner);
    instance_destroy(obj_chefs_stackbox);
    instance_destroy(obj_chefs_susie);
    instance_destroy(obj_chefs_toggles);
    instance_destroy(obj_chefs_vfx);
}

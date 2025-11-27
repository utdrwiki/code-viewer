if (i_ex(obj_tenna_enemy))
{
    with (obj_tenna_minigame_ui)
    {
        enabled = true;
        minigametype = other.minigametype;
        minigamedifficulty = other.minigamedifficulty;
    }
    if (minigametype == "susiezilla")
    {
        with (instance_create(camerax(), cameray(), obj_susiezilla_gamecontroller))
        {
            if (other.minigamedifficulty == 1)
                setup(1);
            if (other.minigamedifficulty == 2)
                setup(2);
            if (other.minigamedifficulty == 3)
                setup(3);
            if (other.minigamedifficulty == 4)
                setup(4);
            if (other.minigamedifficulty == 5)
                setup(5);
            if (other.minigamedifficulty == 6)
                setup(6);
            if (other.minigamedifficulty == 7)
                setup(7);
        }
    }
    if (minigametype == "music")
    {
        instance_create(camerax(), cameray(), obj_rhythmgame);
        with (obj_rhythmgame)
        {
            tenna_boss = true;
            turn_length = 360;
        }
    }
    if (minigametype == "cooking")
    {
        counter_marker = scr_dark_marker(0, 310, spr_dw_kitchen_counter);
        counter_marker.depth = 99000;
        su_stove = scr_dark_marker(46, 178, spr_dw_chef_stove);
        su_stove.depth = 98010;
        su_stove.image_speed = 0.2;
        ra_stove = scr_dark_marker(554, 178, spr_dw_chef_stove);
        ra_stove.depth = 98010;
        ra_stove.image_speed = 0.2;
        instance_create_depth(0, 0, depth + 10, obj_chefs_init);
        obj_chefs_spawner.firedie = 1;
        obj_chefs_game.hbx_visible = 0;
        obj_chefs_game.bananacoins = 0;
        obj_chefs_spawner.no_fire = 0;
        if (minigamedifficulty == 0)
        {
            obj_chefs_game.microgame = 6;
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
            tinytenna1 = instance_create_depth(90, 140, obj_tenna_minigame_ui.depth + 10, obj_tenna_chef_marker1);
            tinytenna2 = instance_create_depth(500, 140, obj_tenna_minigame_ui.depth + 10, obj_tenna_chef_marker1);
            tinytenna2.type = 1;
            with (instance_create_depth(320, 40, depth + 10, obj_chefs_fireguest))
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
        }
        if (minigamedifficulty == 2)
        {
            obj_chefs_game.microgame = 1;
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
            tinytenna1 = instance_create_depth(140, 200, depth + 10, obj_tenna_chef_marker1);
            tinytenna2 = instance_create_depth(540, 200, depth + 10, obj_tenna_chef_marker1);
            tinytenna2.type = 1;
            with (instance_create_depth(320, 40, depth + 10, obj_chefs_fireguest))
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
        }
    }
    if (minigametype == "cowboy")
    {
        with (obj_shootout_window)
            instance_destroy();
        with (obj_shootout_fire)
            instance_destroy();
        with (obj_shootout_bullet_line)
            instance_destroy();
        with (obj_shootout_cactus)
            instance_destroy();
        with (obj_shootout_heart)
            instance_destroy();
        with (obj_shootout_kris)
            instance_destroy();
        with (obj_shootout_horse)
            instance_destroy();
        with (obj_shootout_hazard)
            instance_destroy();
        with (obj_shootout_susie)
            instance_destroy();
        with (obj_shootout_text)
            instance_destroy();
        with (obj_shootout_dog_item)
            instance_destroy();
        with (obj_shootout_line)
            instance_destroy();
        with (obj_shootout_dust)
            instance_destroy();
        with (obj_shootout_carriage)
            instance_destroy();
        with (obj_shootout_tenna_reticle)
            instance_destroy();
        with (obj_afterimage)
            instance_destroy();
        with (obj_oflash)
            instance_destroy();
        with (obj_shootout_vfx_mockup_shot)
            instance_destroy();
        with (obj_shootout_big_tenna)
            instance_destroy();
        instance_create_depth(camerax(), cameray(), obj_tenna_minigame_ui.depth + 10, obj_shootout_controller);
        if (minigamedifficulty == 0)
            obj_shootout_controller.shootout_type = 2;
        if (minigamedifficulty == 1)
        {
            obj_shootout_controller.shootout_type = 3;
            instance_create_depth(camerax(), cameray() + 90, obj_tenna_minigame_ui.depth + 1, obj_shootout_big_tenna);
        }
        with (obj_shootout_controller)
        {
            back_layer1 = layer_create(99007);
            fg = layer_background_create(back_layer1, spr_desert_loop_foreground);
            layer_background_htiled(fg, true);
            layer_background_stretch(fg, true);
            layer_background_speed(fg, -8);
            back_layer2 = layer_create(99008);
            md = layer_background_create(back_layer2, spr_desert_loop_middle_2);
            layer_background_htiled(md, true);
            layer_background_stretch(md, true);
            layer_background_speed(fg, -4);
            back_layer3 = layer_create(99009);
            md_back = layer_background_create(back_layer3, spr_desert_loop_middle_back_3);
            layer_background_htiled(md_back, true);
            layer_background_stretch(md_back, true);
            layer_background_speed(fg, -2);
            back_layer4 = layer_create(99010);
            bg = layer_background_create(back_layer4, spr_desert_loop_backrgound_4);
            layer_background_htiled(bg, true);
            layer_background_stretch(bg, true);
            layer_background_speed(fg, -1);
        }
    }
    if (minigametype == "battle")
    {
        if (minigamedifficulty == 0)
            minigamedifficulty = choose(1, 2);
        if (minigamedifficulty == 1)
        {
            inst = instance_create(x, y, obj_battleback);
            inst.image_alpha = 1;
            with (obj_tenna_enemy)
            {
                global.monsterattackname[myself] = "sharpshoot test";
                dc = instance_create_depth(x, y, depth + 10, obj_dbulletcontroller);
                dc.creator = myself;
                dc.creatorid = id;
                dc.target = mytarget;
                dc.damage = global.monsterat[myself] * 5;
                dc.type = 150;
                dc.minigamedifficulty = 1;
            }
        }
        if (minigamedifficulty == 2)
        {
            instance_create(x, y, obj_battleback);
            with (obj_tenna_enemy)
            {
                instance_create_depth(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 200, depth + 10, obj_growtangle);
                global.inv = 0;
                instance_create_depth(obj_herokris.x + 10, obj_herokris.y + 40, depth + 10, obj_moveheart);
                blocker = instance_create_depth(x, y, depth + 10, obj_elnina_umbrella);
                blocker.sprite_index = spr_ch3_elnina_umbrella;
                inst = instance_create_depth(camerax() + 80, cameray() - 320, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 110;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 160, cameray() - 240, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 110;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 80, cameray() - 160, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 110;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 160, cameray() - 80, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 110;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 80, cameray(), depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 110;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 160, cameray() + 80, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 120;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 80, cameray() + 160, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 97;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 160, cameray() + 240, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 2124;
                inst.temp = 120;
                inst.vspeed = 2;
                inst = instance_create_depth(camerax() + 420, cameray() - 240, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 2;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 500, cameray() - 160, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 2;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 420, cameray() - 80, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 2;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 500, cameray(), depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 2;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 420, cameray() - 80, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 24;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 500, cameray(), depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 2;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 420, cameray() + 80, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 24;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 500, cameray() + 160, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 45;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 420, cameray() + 240, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 45;
                inst.vspeed = -2;
                inst = instance_create_depth(camerax() + 500, cameray() + 320, depth + 10, obj_umbrella_tv);
                inst.weathersprite = 1035;
                inst.temp = 45;
                inst.vspeed = -2;
                with (obj_umbrella_tv)
                    depth = obj_growtangle.depth - 1;
            }
        }
        if (minigamedifficulty == 3)
        {
            with (obj_tenna_enemy_bg)
            {
                speedup = 1;
                slowdown = 0;
            }
            with (obj_tenna_enemy)
            {
                global.monsterattackname[myself] = "lightemup";
                dc = instance_create_depth(x, y, depth + 10, obj_dbulletcontroller);
                dc.creator = myself;
                dc.creatorid = id;
                dc.target = mytarget;
                dc.damage = global.monsterat[myself] * 5;
                dc.type = 150;
                dc.minigamedifficulty = 1;
            }
        }
    }
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

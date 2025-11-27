function scr_spearshot(arg0, arg1, arg2, arg3)
{
    if (arg3 == 1)
    {
        instance_create(x - 5, y + 4, obj_gerson_green_switch);
    }
    else if (arg3 == 2)
    {
        ham = instance_create(obj_heart.x - 20, obj_heart.y - 20, obj_giant_hammer);
        ham.type = 2;
        ham.dir = arg0;
    }
    else if (arg3 == 3)
    {
        with (obj_spearblocker)
            diagonal_transform = 1;
        with (obj_hammer_of_justice_enemy)
            diagonal_enabled = 1;
    }
    else if (arg3 == 400)
    {
        if (obj_hammer_of_justice_enemy.visible == true)
        {
            obj_hammer_of_justice_enemy.visible = false;
            gers = instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
            gers.depth = obj_hammer_of_justice_enemy.depth;
        }
    }
    else if (arg3 == 4)
    {
        if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.visible == true)
        {
            obj_hammer_of_justice_enemy.visible = false;
            gers = instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
            gers.depth = obj_hammer_of_justice_enemy.depth;
        }
        if (arg2 == -5)
        {
            gers = instance_create(camerax() + arg0, cameray() + arg1, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = -3;
            gers.image_alpha = 0;
            gers.image_angle = 90;
        }
        else if (arg2 == -4)
        {
            gers = instance_create(obj_growtangle.x + arg0 + lengthdir_x(130, obj_hammer_of_justice_enemy.swingdown_ex * 45), obj_growtangle.y + arg1 + 20 + lengthdir_y(130, obj_hammer_of_justice_enemy.swingdown_ex * 45), obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = -4;
            gers.image_angle = obj_hammer_of_justice_enemy.swingdown_ex * 45;
            gers.image_alpha = 0;
            obj_hammer_of_justice_enemy.swingdown_ex++;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 1)
                gers.special = 4;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 2)
                gers.special = 1;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 3)
                gers.special = 3;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 4)
                gers.special = 2;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 5)
                gers.special = 4;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 6)
                gers.special = 1;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 7)
                gers.special = 3;
            if (obj_hammer_of_justice_enemy.swingdown_ex == 8)
                gers.special = 2;
        }
        else if (arg2 == -3)
        {
            gers = instance_create(obj_growtangle.x + arg0 + lengthdir_x(130, obj_hammer_of_justice_enemy.swingdown_ex * 45), obj_growtangle.y + arg1 + 20 + lengthdir_y(130, obj_hammer_of_justice_enemy.swingdown_ex * 45), obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = obj_hammer_of_justice_enemy.swingdown_ex * 45;
            gers.image_alpha = 0;
            obj_hammer_of_justice_enemy.swingdown_ex++;
        }
        else if (arg2 == 10)
        {
            gers = instance_create(obj_growtangle.x + 116, obj_heart.y + 26, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_alpha = 0;
        }
        else if (arg2 == 11)
        {
            gers = instance_create(obj_growtangle.x + 116, obj_growtangle.y + 55, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_alpha = 0;
        }
        else if (arg2 == 12)
        {
            gers = instance_create(obj_growtangle.x - 116, obj_growtangle.y - 65, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = 180;
            gers.image_alpha = 0;
        }
        else if (arg2 == 13)
        {
            gers = instance_create(obj_growtangle.x + 116, obj_growtangle.y + 41, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_alpha = 0;
        }
        else if (arg2 == 14)
        {
            gers = instance_create(obj_growtangle.x - 116, obj_growtangle.y - 49, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = 180;
            gers.image_alpha = 0;
        }
        else if (arg2 == 15)
        {
            gers = instance_create(obj_growtangle.x - 116, (obj_growtangle.y + 41) - 40, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = 180;
            gers.image_alpha = 0;
        }
        else if (arg2 == 16)
        {
            gers = instance_create(obj_growtangle.x + 116, (obj_growtangle.y - 49) + 46, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = 0;
            gers.image_alpha = 0;
        }
        else if (arg2 == 17)
        {
            gers = instance_create(obj_growtangle.x - 41, obj_growtangle.y + 115, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = 270;
            gers.image_alpha = 0;
        }
        else if (arg2 == 18)
        {
            gers = instance_create(obj_growtangle.x + 7, obj_growtangle.y + 115, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_angle = 270;
            gers.image_alpha = 0;
        }
        else
        {
            gers = instance_create(camerax() + arg0, cameray() + arg1, obj_gerson_teleport);
            gers.type = 2;
            gers.swingdowntype = arg2;
            gers.image_alpha = 0;
        }
    }
    else if (arg3 == 5)
    {
        instance_create(arg0, arg1, obj_gerson_box_hit_controller);
    }
    else if (arg3 == 6)
    {
        instance_create(arg0, arg1, obj_gerson_bell_attack_controller);
    }
    else if (arg3 == 7)
    {
        instance_create(arg0, arg1, obj_gerson_hammer_bro_attack_controller);
    }
    else if (arg3 == 8)
    {
        obj_hammer_of_justice_enemy.goldcon = 1;
    }
    else if (arg3 == 9)
    {
        obj_hammer_of_justice_enemy.sprite_index = spr_gerson_laugh;
        obj_hammer_of_justice_enemy.state = 12;
    }
    else if (arg3 == 10)
    {
        obj_hammer_of_justice_enemy.visible = false;
        obj_hammer_of_justice_enemy.sprite_index = spr_gerson_idle;
        obj_hammer_of_justice_enemy.state = 0;
        gers = instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
        gers.type = 10;
        global.turntimer = 2;
    }
    else if (arg3 == 10.5)
    {
        obj_hammer_of_justice_enemy.visible = false;
        obj_hammer_of_justice_enemy.sprite_index = spr_gerson_idle;
        obj_hammer_of_justice_enemy.state = 0;
        gers = instance_create(obj_hammer_of_justice_enemy.x + 60, obj_hammer_of_justice_enemy.y + 35, obj_gerson_teleport);
        gers.type = 10;
    }
    else if (arg3 == 11)
    {
        if (obj_hammer_of_justice_enemy.visible == true)
            gers = instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
        gers = instance_create(obj_growtangle.x - 150, obj_growtangle.y + 15, obj_gerson_teleport);
        gers.type = 4;
    }
    else if (arg3 == 12)
    {
        if (obj_hammer_of_justice_enemy.visible == true)
        {
            obj_hammer_of_justice_enemy.visible = false;
            gers = instance_create(obj_hammer_of_justice_enemy.x + 45, obj_hammer_of_justice_enemy.y + 45, obj_gerson_teleport);
        }
        if (i_ex(obj_growtangle))
        {
            gers = instance_create(obj_growtangle.x + 150, obj_growtangle.y + 15, obj_gerson_teleport);
            gers.type = 5;
        }
    }
    else if (arg3 == 13)
    {
        if (i_ex(obj_hammer_of_justice_enemy))
        {
            obj_hammer_of_justice_enemy.visible = false;
            gers = instance_create_depth(x, y, depth, obj_gerson_squishes_box);
            gers.type = 5;
        }
    }
    else if (arg3 == 14)
    {
        if (i_ex(obj_spearblocker))
        {
            _inst = instance_create(obj_spearblocker.x + lengthdir_x(arg2, arg0 + 180), obj_spearblocker.y + lengthdir_y(arg2, arg0 + 180), obj_spearshot);
            _inst.direction = arg0;
            _inst.fakespeed = 0;
            _inst.len = arg2;
            _inst.image_angle = _inst.direction;
            _inst.image_alpha = 0;
            _inst.fadespear = 1;
            _inst.fadespeed = 25;
            _inst.fadespeartimermax = arg1;
            if (argument_count == 5)
                _inst.fadespeardist = argument4;
        }
    }
    else if (arg3 == 16)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.swingaround = 1;
    }
    else if (arg3 == 17)
    {
        _inst = instance_create(obj_spearblocker.x + lengthdir_x(arg2, arg0 + 180), obj_spearblocker.y + lengthdir_y(arg2, arg0 + 180), obj_spearshot);
        _inst.direction = arg0;
        _inst.fakespeed = 0.2;
        _inst.len = arg2;
        _inst.image_angle = _inst.direction;
        _inst.image_alpha = 0;
        _inst.fadespear = 3;
        _inst.fadewaitmax = arg1;
    }
    else if (arg3 == 18)
    {
        _inst = instance_create(obj_spearblocker.x + lengthdir_x(arg2, arg0 + 180), obj_spearblocker.y + lengthdir_y(arg2, arg0 + 180), obj_spearshot);
        _inst.direction = arg0;
        _inst.fakespeed = 0.2;
        _inst.len = arg2;
        _inst.image_angle = _inst.direction;
        _inst.image_alpha = 0;
        _inst.fadespear = 4;
        _inst.fadewaitmax = arg1;
    }
    else if (arg3 == 19)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 1;
        _inst.hp = 2;
        _inst.maxhp = 2;
    }
    else if (arg3 == 20)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.hp = 3;
        _inst.maxhp = 3;
    }
    else if (arg3 == 20.1)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.hp = 2;
        _inst.maxhp = 2;
    }
    else if (arg3 == 21)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.hp = 9;
        _inst.maxhp = 9;
    }
    else if (arg3 == 21.6)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 1;
        _inst.hp = 6;
        _inst.maxhp = 6;
    }
    else if (arg3 == 21.65)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.hp = 6;
        _inst.maxhp = 6;
    }
    else if (arg3 == 21.66)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.hp = 5;
        _inst.maxhp = 5;
    }
    else if (arg3 == 21.9)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 1;
        _inst.hp = 9;
        _inst.maxhp = 9;
    }
    else if (arg3 == 22)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.fastbounce = 1;
        _inst.hp = 3;
        _inst.maxhp = 3;
    }
    else if (arg3 == 23)
    {
        fasterheart = true;
    }
    else if (arg3 == 24)
    {
        gers = instance_create(arg0, arg1, obj_gerson_speen);
        gers.type = 6;
        with (gers)
            event_user(0);
    }
    else if (arg3 == 25)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.longspear = 1;
        if (argument_count == 5)
            _inst.longnotepieces = argument4;
    }
    else if (arg3 == 26)
    {
        global.monsterattackname[myself] = "gerson rudebuster";
        dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
        dc.type = 250;
    }
    else if (arg3 == 27)
    {
        inst = instance_create(x, y, obj_gerson_growtangle_transform);
        inst.shrink = true;
    }
    else if (arg3 == 28)
    {
        swingdown_multitelegraph = arg0;
    }
    else if (arg3 == 29)
    {
        instance_create(x, y, obj_gerson_darken);
    }
    else if (arg3 == 30)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.breakshield = 1;
        _inst.sprite_index = spr_spear_arrow;
    }
    else if (arg3 == 31)
    {
        instance_create(x, y, obj_gerson_growtangle);
    }
    else if (arg3 == 32)
    {
        if (i_ex(obj_growtangle))
        {
            if (arg2 >= 0)
            {
                _inst = instance_create(obj_growtangle.x + arg0, obj_growtangle.y + arg1, obj_gerson_swing_down_new);
                _inst.image_angle = arg2;
                _inst.direction = arg2 + 270;
                _inst.gravity_direction = arg2 + 270;
            }
            if (arg2 == -1)
            {
                _inst = instance_create(obj_growtangle.x + 70, obj_heart.y, obj_gerson_swing_down_new);
                _inst.image_angle = 270;
                _inst.direction = 540;
                _inst.gravity_direction = 540;
            }
            if (arg2 == -2)
            {
                _inst = instance_create(obj_growtangle.x - 70, obj_heart.y, obj_gerson_swing_down_new);
                _inst.image_angle = 90;
                _inst.direction = 360;
                _inst.gravity_direction = 360;
            }
            if (arg2 == -3)
            {
                _inst = instance_create(obj_growtangle.x + arg0, obj_growtangle.y + arg1, obj_gerson_swing_down_new);
                _inst.image_angle = arg2;
                _inst.direction = arg2 + 270;
                _inst.gravity_direction = arg2 + 270;
                _inst.version = 1;
            }
        }
    }
    else if (arg3 == 33)
    {
        with (obj_gerson_darken)
            con = 1;
    }
    else if (arg3 == 34)
    {
        if (introtalkcon == 0)
            introtalkcon = 1;
    }
    else if (arg3 == 35)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.redhammer = 1;
        _inst.grav = 0.3;
    }
    else if (arg3 == 355)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.redhammer = 1;
        _inst.redhammerfakeout = 1;
    }
    else if (arg3 == 36)
    {
        if (!i_ex(obj_spearblocker))
            instance_create(x, y, obj_spearblocker);
    }
    else if (arg3 == 37)
    {
        if (i_ex(obj_gerson_darkness_overlay))
            obj_gerson_darkness_overlay.scalecon = arg0;
    }
    else if (arg3 == 37)
    {
    }
    else if (arg3 == 38)
    {
        snd_play_x(snd_soundbattle_leadin, 1, arg0);
    }
    else if (arg3 == 39)
    {
        snd_play_x(snd_soundbattle_leadin_short, 1, arg0);
    }
    else if (arg3 == 40)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 1;
        _inst.slowbounce = 1;
        _inst.hp = 3;
        _inst.maxhp = 3;
    }
    else if (arg3 == 40.4)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 1;
        _inst.slowbounce = 1;
        _inst.hp = 2;
        _inst.maxhp = 2;
    }
    else if (arg3 == 40.5)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 1;
        _inst.hp = 4;
        _inst.maxhp = 4;
    }
    else if (arg3 == 40.6)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 1;
        _inst.hp = 3;
        _inst.maxhp = 3;
        _inst.gigashell = true;
    }
    else if (arg3 == 40.75)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 1;
        _inst.hp = 3;
        _inst.maxhp = 3;
    }
    else if (arg3 == 41)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 2;
        _inst.hp = 3;
        _inst.maxhp = 3;
    }
    else if (arg3 == 41.1)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 2;
        _inst.hp = 3;
        _inst.maxhp = 3;
        _inst.gigashell = true;
    }
    else if (arg3 == 42)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 3;
        _inst.hp = 3;
        _inst.maxhp = 3;
    }
    else if (arg3 == 42.1)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 3;
        _inst.hp = 2;
        _inst.maxhp = 2;
        _inst.gigashell = true;
    }
    else if (arg3 == 42.2)
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = 0;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        _inst.bouncespear = 2;
        _inst.slowbounce = 4;
        _inst.hp = 3;
        _inst.maxhp = 3;
        _inst.gigashell = true;
    }
    else if (arg3 == 43)
    {
        if (i_ex(obj_spearblocker))
        {
            obj_spearblocker.shadowpowertarget = arg0;
            obj_spearblocker.shadowpowertimermax = arg1;
            obj_spearblocker.shadowpowercon = 1;
            obj_spearblocker.shadowpowertimer = 0;
        }
    }
    else if (arg3 == 50)
    {
        instance_create(arg0, arg1, obj_box_throw_controller);
    }
    else if (arg3 == 51)
    {
        instance_create(arg0, arg1, obj_hammer_bounce_controller);
    }
    else if (arg3 == 52)
    {
        instance_create(arg0, arg1, obj_gerson_shell_kick_controller);
    }
    else if (arg3 == 53)
    {
        instance_create(arg0, arg1, obj_gerson_box_rumble_controller);
    }
    else if (arg3 == 54)
    {
        with (obj_sound_of_justice_enemy)
            redflashcon = 1;
    }
    else if (arg3 == 55)
    {
        with (obj_spearblocker)
            vanish = 1;
        with (obj_spearshot)
            instance_destroy();
        scr_heartcolor("red");
    }
    else
    {
        _inst = instance_create(-9999, -9999, obj_spearshot);
        _inst.special = arg3;
        _inst.direction = arg0;
        _inst.fakespeed = arg1;
        _inst.len = arg1 * arg2;
        _inst.image_angle = _inst.direction;
        if (i_ex(obj_sound_of_justice_enemy) && obj_sound_of_justice_enemy.susiedown == false)
        {
            if (arg0 == 0)
                snd_play(snd_statue_left);
            if (arg0 == 270)
                snd_play(snd_statue_up);
            if (arg0 == 180)
                snd_play(snd_statue_right);
            if (arg0 == 90)
                snd_play(snd_statue_down);
            if (argument_count == 5 && argument4 > 0)
            {
                inst = instance_create(x, y, obj_gerson_gradient_telegraph);
                inst.image_alpha = argument4;
                if (arg0 == 0)
                    inst.side = "left";
                if (arg0 == 90)
                    inst.side = "down";
                if (arg0 == 180)
                    inst.side = "right";
                if (arg0 == 270)
                    inst.side = "up";
            }
        }
        if (argument_count == 5 && !i_ex(obj_sound_of_justice_enemy))
            _inst.swingaround = argument4;
        if (arg3 > 20)
        {
            _inst.image_angle = arg3;
            if (_inst.image_angle == 360)
                _inst.image_angle = 0;
        }
    }
}

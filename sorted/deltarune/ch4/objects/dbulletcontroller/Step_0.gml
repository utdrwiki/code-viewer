if (type != 113)
{
    for (var i = 0; i < instance_number(obj_dbulletcontroller); i += 1)
    {
        enemy[i] = instance_find(obj_dbulletcontroller, i);
        if (enemy[i].type == 113 && enemy[i].side < 40)
            exit;
    }
}
if (init == 0)
{
    sameattack = scr_monsterattacknamecount(global.monsterattackname[creator]);
    if (sameattack > 1)
    {
        if (creator == 2)
            sameattacker = sameattack - 1;
        else if (creator == 1)
            sameattacker = (sameattack == 3) ? creator : (global.monsterattackname[0] == global.monsterattackname[1]);
    }
    if (instance_exists(obj_growtangle))
    {
        miny = obj_growtangle.y - (obj_growtangle.sprite_height / 2);
        maxy = obj_growtangle.y + (obj_growtangle.sprite_height / 2);
        minx = obj_growtangle.x - (obj_growtangle.sprite_width / 2);
        maxx = obj_growtangle.x + (obj_growtangle.sprite_width / 2);
    }
    init = 1;
}
btimer += 1;
if (type == 0)
{
    if (btimer >= (timermax * ratio))
    {
        btimer = 0;
        var dir = 30 + random(120);
        radius = 140 + random(80);
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
        bm.grazepoints = grazepoints;
        if (bm.y < (__view_get(e__VW.YView, 0) + 40))
            bm.y = __view_get(e__VW.YView, 0) + 40;
        bm.damage = damage;
        bm.target = target;
    }
}
if (type == 1)
{
    if (btimer >= (9 * ratio))
    {
        btimer = 0;
        radius = 140 + random(40);
        var yy = radius * side;
        var xx = -100 + random(200);
        num = choose(0, 1, 2, 3);
        if (num == 3)
            xx = -10 + random(20);
        d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_vert);
        d.damage = damage;
        d.target = target;
    }
}
if (type == 3)
{
    if (made == 0)
    {
        if (i_ex(creatorid))
        {
            with (creatorid)
                image_alpha = 0;
            var slasher = instance_create(creatorid.x, creatorid.y, obj_dknight_slasher);
            scr_bullet_inherit(slasher);
            slasher.timepoints = 2;
            slasher.grazepoints = 6;
        }
        made = 1;
    }
}
else if (type == 4 && (sameattack < 3 || creator < 2))
{
    if (btimer > 7)
    {
        btimer = 0;
        var xx = x - (made * 30);
        var yy = maxy;
        d = instance_create(xx, yy, obj_chainbullet);
        d.damage = damage;
        d.grazepoints = 4;
        d.direction = 90;
        d.childSpeed = 7;
        d.childgravity = 0.25;
        d.firingSpeed = 2;
        d.target = target;
        d.sprite_index = spr_diamondbullet_vert;
        made++;
    }
}
else if (type == 30)
{
    if (btimer >= (20 * ratio))
    {
        var xx = __view_get(e__VW.XView, 0) - 20;
        if (side == 1)
            xx = __view_get(e__VW.XView, 0) + 660;
        var yy = miny + random(maxy - miny);
        bul = instance_create(xx, yy, obj_clubsbullet);
        bul.speed = 12;
        bul.damage = damage;
        bul.target = target;
        bul.grazepoints = 4;
        if (side == 1)
        {
            bul.direction = 180;
            bul.image_angle = 180;
        }
        btimer = 0;
    }
}
else if (type == 31)
{
    if (btimer >= (30 * ratio))
    {
        btimer = 0;
        var dir;
        if (side == -1)
            dir = 225;
        if (side == 1)
            dir = 315;
        radius = 400;
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_clubsbullet_dark);
        d.damage = damage;
        d.target = target;
        d.grazepoints = 4;
        d.direction = dir + 180;
        d.speed = 20;
        d.friction = 1;
        with (d)
            image_angle = direction;
        if (side == 1)
            side = -1;
        else
            side = 1;
    }
}
else if (type == 32)
{
    if (init == 1)
    {
        dd = 0;
        dd2 = 0;
        phase = 0;
        strikes = 0;
        if (special == 1)
            global.turntimer = 5400;
        var xx = obj_growtangle.x;
        var yy = obj_growtangle.y;
        d = instance_create(xx + 1, yy, obj_bulletparent);
        d.sprite_index = spr_tm_grid;
        d.image_angle = 45;
        d.image_blend = c_gray;
        d.element = 6;
        d.depth = obj_growtangle.depth - 1;
        for (var i = 0; i < 4; i++)
        {
            xx = obj_growtangle.x;
            yy = obj_growtangle.y;
            if (i == 0 || i == 3)
                yy += ((i == 0) ? -50 : 50);
            else
                xx += ((i == 1) ? -50 : 50);
            d = instance_create(xx, yy, obj_bulletparent);
            d.sprite_index = spr_tm_letters;
            d.image_speed = 0;
            d.image_index = i;
            d.element = 6;
            d.image_blend = c_gray;
            d.depth = obj_growtangle.depth - 1;
        }
        obj_growtangle.target_angle = 45;
        obj_growtangle.image_angle = 45;
        d = scr_bullet_create(x - 22, y - 6, obj_tm_quizzler);
        made++;
        d.depth = global.monsterinstance[creator].depth;
        d.controller = self;
        d.element = 6;
        d.dojo = special < -2;
        d.creator = creator;
        global.monsterinstance[creator].lastQuizLetter = -1;
        d.difficulty = difficulty;
        init = 2;
        global.turntimer += 120;
        btimer = 0;
    }
    var attacktimer = 90;
    if (difficulty > 0)
        attacktimer = (difficulty == 3) ? 40 : 60;
    var quizReady = !instance_exists(obj_tm_quizzler);
    if ((made == 4 || special < -2) && quizReady && btimer >= 0)
    {
        if (special == 1)
        {
            special = -2;
            btimer = -20;
        }
        else if (special == -2)
        {
            special = -1;
            difficulty++;
            dd = scr_dark_marker_animated(x + 80, y + 4, spr_tm_pleased_effect, 1);
            dd2 = scr_dark_marker(x + 74, y + 66, spr_cutscene_26_tasquemanager);
            var _maru = instance_create(x + (phase * 40), y + 175, obj_bulletparent);
            _maru.sprite_index = spr_tm_maru;
            _maru.image_xscale = 2;
            _maru.image_yscale = 2;
            _maru = instance_create(obj_growtangle.x, obj_growtangle.y, obj_tm_quiz_result);
            _maru.sprite_index = spr_tm_maru_big;
            _maru.image_xscale = 3;
            _maru.image_yscale = 3;
            _maru.depth = obj_heart.depth - 15;
            _maru.max_time = 45;
            dd.depth = dd2.depth - 1;
            with (obj_tasque_manager_enemy)
                visible = 0;
            snd_play(snd_coin);
            btimer = -45;
            phase++;
        }
        else if (special == -1)
        {
            if (i_ex(dd))
                instance_destroy(dd);
            if (i_ex(dd2))
                instance_destroy(dd2);
            made = 0;
            with (obj_tasque_manager_enemy)
                visible = 1;
            if (strikes == 3)
            {
                global.flag[36] = 1;
                global.flag[39] = 1;
                global.turntimer = 10;
                btimer = -40;
                obj_tasque_manager_enemy.hspeed = 10;
                exit;
            }
            if (phase == 3)
            {
                special = -5;
                global.flag[39] = 1;
                global.turntimer = 10;
                btimer = -40;
                obj_tasque_manager_enemy.hspeed = 10;
            }
            else
            {
                special = 1;
                btimer = attacktimer - 10;
            }
        }
        else if (special == -4 && global.encounterno == 89)
        {
            special = -3;
            btimer = -20;
        }
        else if (special == -3)
        {
            special = -1;
            made = 4;
            dd2 = scr_dark_marker(x, y, spr_tm_hurt);
            with (obj_tasque_manager_enemy)
                visible = 0;
            snd_play(snd_error);
            if (global.encounterno == 89)
            {
                var _batsu = instance_create(x + (strikes * 40), y + 215, obj_bulletparent);
                _batsu.sprite_index = spr_tm_batsu;
                _batsu.image_xscale = 2;
                _batsu.image_yscale = 2;
                _batsu.element = 6;
                strikes++;
                btimer = -45;
                _batsu = instance_create(obj_growtangle.x, obj_growtangle.y, obj_tm_quiz_result);
                _batsu.sprite_index = spr_tm_batsu_big;
                _batsu.image_xscale = 3;
                _batsu.image_yscale = 3;
                _batsu.depth = obj_heart.depth - 15;
                _batsu.max_time = 45;
            }
        }
    }
    else if (quizReady && btimer > attacktimer && special >= 0 && made < 4)
    {
        if (special == 1)
            made++;
        d = scr_bullet_create(x - 22, y - 6, obj_tm_quizzler);
        d.element = 6;
        d.creator = creator;
        d.controller = self;
        d.difficulty = difficulty;
        d.turnlength = 90;
        btimer = 0;
        if (special == 1)
            d.dojo = true;
    }
}
else if (type == 33)
{
    if (made == 0)
    {
        made = 1;
        tail = instance_create(obj_clubsenemy.x + 144, obj_clubsenemy.y + 125, obj_clovertail_intro);
        tail.damage = damage;
        tail.target = target;
    }
}
else if (type == 34)
{
    if (btimer >= (14 * (difficulty + 1)))
    {
        if (init == 1 || side == 1)
        {
            side = irandom(2);
            init = 2;
        }
        else
        {
            side = (side + irandom(1)) % 3;
        }
        snd_play_x(snd_spearappear, 1, 1.2);
        d = instance_create(x, y, obj_werewerewire_laserbullet);
        d.grazepoints = 4;
        d.damage = damage;
        d.target = target;
        d.attackdirection = side;
        btimer = 0;
    }
}
else if (type == 35)
{
    if (init == 1)
    {
        global.turntimer = 3600;
        difficulty = 0;
        var xx = obj_growtangle.x;
        var yy = obj_growtangle.y;
        d = instance_create(xx + 1, yy, obj_bulletparent);
        d.sprite_index = spr_tm_grid;
        d.image_angle = 45;
        d.image_blend = c_gray;
        d.depth = obj_growtangle.depth - 1;
        for (var i = 0; i < 4; i++)
        {
            xx = obj_growtangle.x;
            yy = obj_growtangle.y;
            if (i == 0 || i == 3)
                yy += ((i == 0) ? -50 : 50);
            else
                xx += ((i == 1) ? -50 : 50);
            d = instance_create(xx, yy, obj_bulletparent);
            d.sprite_index = spr_tm_letters;
            d.image_speed = 0;
            d.image_index = i;
            d.image_blend = c_gray;
            d.depth = obj_growtangle.depth - 1;
        }
        obj_growtangle.target_angle = 45;
        obj_growtangle.image_angle = 45;
        d = scr_bullet_create(x, y, obj_tm_quizzler);
        d.depth = global.monsterinstance[creator].depth;
        d.creator = creator;
        d.difficulty = difficulty;
        d.dojo = true;
        init = 2;
        global.turntimer += 120;
        btimer = 0;
    }
}
else if (type == 48)
{
    if (btimer >= 135 && !i_ex(obj_ch2_dojo_puzzlebullet_maker))
    {
        var xmod = 0;
        if (roundcount == 1)
            xmod = irandom(20) * choose(-1, 1);
        if (roundcount == 2)
            xmod = irandom(30) * choose(-1, 1);
        if (roundcount == 3)
            xmod = irandom(40) * choose(-1, 1);
        if (roundcount == 4)
            xmod = irandom(60) * choose(-1, 1);
        if (roundcount > 4)
            xmod = irandom(80) * choose(-1, 1);
        bm = instance_create(320 + xmod, 40, obj_ch2_dojo_puzzlebullet_maker);
        bm.grazepoints = grazepoints;
        bm.damage = 1;
        bm.target = target;
        switch (roundcount)
        {
            case 0:
                bm.times = 7;
                bm.timetarg = 18;
                bm.bulletspeed = 6;
                break;
            case 1:
                bm.times = 7;
                bm.timetarg = 15;
                bm.bulletspeed = 6;
                break;
            case 2:
                bm.times = 7;
                bm.timetarg = 13;
                bm.bulletspeed = 6;
                break;
            case 3:
                bm.times = 7;
                bm.timetarg = 11;
                bm.bulletspeed = 6;
                break;
            default:
                bm.times = 7;
                bm.timetarg = 10;
                bm.bulletspeed = 6;
                break;
        }
        btimer = 0;
        roundcount++;
    }
}
if (type == 49)
{
    if (btimer >= (timermax * ratio))
    {
        btimer = 0;
        var dir = 30 + random(120);
        radius = 140 + random(80);
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
        bm.grazepoints = grazepoints;
        if (bm.y < (__view_get(e__VW.YView, 0) + 40))
            bm.y = __view_get(e__VW.YView, 0) + 40;
        bm.damage = damage;
        bm.target = target;
    }
}
if (type == 65)
{
    if (!made)
    {
        if (i_ex(creatorid))
        {
            with (creatorid)
                image_alpha = 0;
            var pop = scr_monsterpop();
            var zapper_lasermanager = instance_create(creatorid.x - 18, creatorid.y - 28, obj_zapper_laser_manager);
            scr_bullet_inherit(zapper_lasermanager);
            zapper_lasermanager.sameattacker = sameattacker;
            zapper_lasermanager.creator = creator;
            zapper_lasermanager.depth -= creator;
            zapper_lasermanager.sameattack = sameattack;
            zapper_lasermanager.damage = 55;
            if (pop != sameattack)
                zapper_lasermanager.nuisance = true;
            with (zapper_lasermanager)
            {
                alarm[0] = 30 + (3 * sameattacker);
                event_user(0);
            }
        }
        made = true;
    }
    if (i_ex(obj_growtangle))
    {
        if (obj_growtangle.growcon == 2 && !instance_exists(obj_zapper_laser_linedraw))
            instance_create_depth(0, 0, obj_growtangle.depth - 1, obj_zapper_laser_linedraw);
    }
}
if (type == 66)
{
    if (!made)
    {
        if (i_ex(creatorid))
        {
            creatorid.image_alpha = 0;
            var zapper_cannonmanager = instance_create(creatorid.x - 18, creatorid.y - 28, obj_zapper_cannon_manager);
            scr_bullet_inherit(zapper_cannonmanager);
            zapper_cannonmanager.depth -= creator;
            zapper_cannonmanager.damage = 55;
            var zapper_cannon_reload_ratio = 1;
            if (scr_monsterpop() != sameattack)
                zapper_cannon_reload_ratio = ratio;
            with (zapper_cannonmanager)
            {
                event_user(0);
                alarm[1] += other.sameattacker * reload * zapper_cannon_reload_ratio;
                reload *= (other.sameattack * zapper_cannon_reload_ratio);
            }
        }
        made = true;
    }
}
if (type == 100)
{
    if (!made)
    {
        made = true;
        btimer = 40;
    }
    if (((btimer - 40) % ceil(24 * ratio)) == (10 * sameattacker))
    {
        var dist = 135 + random(20);
        var dir;
        if (sameattack == 1)
            dir = 15 + random(30) + (60 * irandom(2));
        else if (sameattack == 2)
            dir = 15 + random(30) + (120 * sameattacker);
        else
            dir = 15 + random(20) + (65 * sameattacker);
        if (i_ex(creatorid))
        {
            with (instance_create(obj_growtangle.x + lengthdir_x(dist, dir), obj_growtangle.y + lengthdir_y(dist * 0.75, dir), obj_flame_manager))
            {
                speedtarg = 6;
                widthmod = 1.25;
                if (other.ratio == 1)
                    bullets = 3;
                target = other.target;
                event_user(0);
            }
        }
    }
}
if (type == 101)
{
    if (difficulty == 1)
    {
        with (obj_dbulletcontroller)
            ratio = 4;
        ratio = 0.86;
    }
    if (btimer >= (12 * ratio) && i_ex(obj_growtangle))
    {
        var swipe_width = 50 + (sameattack * 5);
        if (scr_monsterpop() > sameattack)
            swipe_width += (40 - (10 * sameattack));
        var aim_override = 0;
        side = choose(-1, 1);
        var xx, yy, temp_angle;
        if (sameattacker < 1)
        {
            xx = (obj_growtangle.x - 40) + irandom(80);
            yy = obj_growtangle.y - 160;
            if (irandom(4) || aim_override == 4)
            {
                temp_angle = 254 + irandom(32);
                aim_override = 0;
            }
            else
            {
                temp_angle = point_direction(xx, yy, obj_heart.x, obj_heart.y);
                aim_override++;
            }
        }
        else
        {
            xx = obj_growtangle.x + (160 * side);
            yy = (obj_growtangle.y - 60) + irandom(120);
            if (irandom(4))
            {
                temp_angle = ((90 + (side * 90)) - 16) + irandom(32);
                aim_override = 0;
            }
            else
            {
                temp_angle = point_direction(xx, yy, obj_heart.x, obj_heart.y);
                aim_override++;
            }
        }
        if (sameattacker != 2)
        {
            for (aa = 0; aa < (3 - (sameattack == 2)); aa++)
            {
                if (sameattacker == 0)
                    d = instance_create((xx - (swipe_width * side)) + (aa * (swipe_width * side)), yy, obj_regularbullet);
                else
                    d = instance_create(xx, (yy - (swipe_width * side)) + (aa * (swipe_width * side)), obj_regularbullet);
                scr_bullet_inherit(d);
                d.direction = temp_angle;
                d.image_angle = temp_angle;
                d.speed = 3;
                if (aa == 1)
                    d.speed = 2;
                d.friction = -0.05;
                d.sprite_index = spr_diamondbullet2;
                d.gravity_direction = d.direction;
                d.image_alpha = 0;
                d.active = 1;
                d.grazepoints = 2;
                d.damage = 65;
                with (d)
                    scr_script_delayed(scr_var, 15, "friction", -0.85);
                with (d)
                    scr_lerpvar_instance(id, "image_alpha", 0, 1, 10);
                with (d)
                    scr_script_delayed(scr_lerpvar_instance, 15, id, "image_xscale", image_xscale, 2.75, 13);
                with (d)
                    scr_script_delayed(scr_lerpvar_instance, 15, id, "image_yscale", image_yscale, 0.5, 13);
                with (d)
                    scr_script_delayed(scr_var, 30, "friction", 1.2);
                with (d)
                    scr_script_delayed(scr_lerpvar_instance, 30, id, "image_xscale", 2.75, 1, 10);
                with (d)
                    scr_script_delayed(scr_lerpvar_instance, 30, id, "image_yscale", 0.5, 1, 10);
                with (d)
                    scr_script_delayed(scr_var, 35, "friction", 0);
                with (d)
                    scr_script_delayed(scr_lerpvar_instance, 40, id, "image_alpha", 1, 0, 10);
            }
        }
        btimer = 0;
    }
}
if (type == 101.5)
{
    if (made == false)
    {
        made = true;
        special = obj_gerson_cane_bullet.hitcount - 1;
    }
    if (n == 1)
    {
        n = 0;
        var swipe_width = 20;
        var attack1 = "left";
        var attack2 = "above";
        if (special == 4)
        {
            special = 0;
            global.turntimer = 60;
        }
        if (special == 1)
        {
            attack1 = "left";
            attack2 = "bottom";
        }
        if (special == 2)
        {
            attack1 = "right";
            attack2 = "bottom";
        }
        if (special == 3)
        {
            attack1 = "right";
            attack2 = "top";
        }
        if (special == 0)
        {
            attack1 = "left";
            attack2 = "top";
        }
        var xx;
        if (attack1 == "left")
            xx = obj_growtangle.x - 35;
        else
            xx = obj_growtangle.x + 35;
        var yy = obj_growtangle.y - 160;
        var temp_angle = 270;
        for (aa = 0; aa < 5; aa++)
        {
            if (aa < 4)
                d = instance_create((xx - (swipe_width * side)) + (aa * (swipe_width * side)), yy, obj_regularbullet);
            if (aa == 4)
            {
                if (attack1 == "left")
                    d = instance_create(obj_growtangle.x + 67, yy, obj_regularbullet);
                if (attack1 == "right")
                    d = instance_create(obj_growtangle.x - 67, yy, obj_regularbullet);
            }
            scr_bullet_inherit(d);
            d.direction = temp_angle;
            d.image_angle = temp_angle;
            d.speed = 3;
            if (aa == 1)
                d.speed = 2;
            d.friction = -0.05;
            d.sprite_index = spr_diamondbullet;
            d.gravity_direction = d.direction;
            d.image_alpha = 0;
            d.active = 1;
            d.damage = 65;
            d.grazepoints = 16;
            with (d)
                scr_script_delayed(scr_var, 15, "friction", -0.85);
            with (d)
                scr_lerpvar_instance(id, "image_alpha", 0, 1, 10);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 15, id, "image_xscale", image_xscale, 2.75, 13);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 15, id, "image_yscale", image_yscale, 0.5, 13);
            with (d)
                scr_script_delayed(scr_var, 30, "friction", 1.2);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 30, id, "image_xscale", 2.75, 1, 10);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 30, id, "image_yscale", 0.5, 1, 10);
            with (d)
                scr_script_delayed(scr_var, 35, "friction", 0);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 40, id, "image_alpha", 1, 0, 10);
        }
        xx = obj_growtangle.x + (160 * side);
        if (attack2 == "top")
            yy = obj_growtangle.y - 35;
        else
            yy = obj_growtangle.y + 35;
        temp_angle = 90 + (side * 90);
        for (aa = 0; aa < 5; aa++)
        {
            if (aa < 4)
                d = instance_create(xx, (yy - (swipe_width * side)) + (aa * (swipe_width * side)), obj_regularbullet);
            if (aa == 4)
            {
                if (attack2 == "top")
                    d = instance_create(xx, obj_growtangle.y + 67, obj_regularbullet);
                if (attack2 == "bottom")
                    d = instance_create(xx, obj_growtangle.y - 67, obj_regularbullet);
            }
            scr_bullet_inherit(d);
            d.direction = temp_angle;
            d.image_angle = temp_angle;
            d.speed = 3;
            if (aa == 1)
                d.speed = 2;
            d.friction = -0.05;
            d.sprite_index = spr_diamondbullet;
            d.gravity_direction = d.direction;
            d.image_alpha = 0;
            d.active = 1;
            d.grazepoints = 7;
            d.damage = 65;
            with (d)
                scr_script_delayed(scr_var, 15, "friction", -0.85);
            with (d)
                scr_lerpvar_instance(id, "image_alpha", 0, 1, 10);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 15, id, "image_xscale", image_xscale, 2.75, 13);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 15, id, "image_yscale", image_yscale, 0.5, 13);
            with (d)
                scr_script_delayed(scr_var, 30, "friction", 1.2);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 30, id, "image_xscale", 2.75, 1, 10);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 30, id, "image_yscale", 0.5, 1, 10);
            with (d)
                scr_script_delayed(scr_var, 35, "friction", 0);
            with (d)
                scr_script_delayed(scr_lerpvar_instance, 40, id, "image_alpha", 1, 0, 10);
        }
        btimer = 100;
        obj_gerson_cane_bullet.bulletcount++;
        if (obj_gerson_cane_bullet.bulletcount == 3)
        {
            obj_gerson_cane_bullet.bulletcount = 0;
            side = choose(-1, 1);
        }
    }
}
if (type == 102)
{
    if (made == 0)
    {
        if (i_ex(creatorid))
        {
            with (creatorid)
                image_alpha = 0;
            var bat = instance_create(creatorid.x, creatorid.y, obj_halo_bat_circle);
            scr_bullet_inherit(bat);
            bat.timepoints = 2;
            bat.grazepoints = 2;
            bat.ratio = ratio;
            bat.timer_shoot = round(17 * ratio);
            bat.timer += 10 * sameattacker;
            bat.targangle = (360 / sameattack) * sameattacker;
            bat.damage = 65;
            bat.target = target;
        }
        made = 1;
    }
}
if (type == 103)
{
    if (made == 0)
    {
        made = 1;
        if (i_ex(creatorid))
        {
            with (creatorid)
                image_alpha = 0;
            var bat = instance_create(creatorid.x, creatorid.y, obj_halo_bat_aim);
            scr_bullet_inherit(bat);
            bat.timer = 8 - floor(sameattacker * 10 * ratio);
            bat.ratio = ratio;
            bat.sameattacker = sameattacker;
            bat.sameattack = sameattack;
            bat.damage = 65;
            bat.grazepoints = 2;
        }
    }
}
if (type == 105)
{
    if (!made)
    {
        made = true;
        if (special == 0)
        {
            if (i_ex(creatorid))
            {
                scr_lerpvar_instance(obj_growtangle.id, "image_yscale", obj_growtangle.image_yscale, 1.5, 5);
                var censer = instance_create(creatorid.x + 60, creatorid.y + 50, obj_incense_censer);
                censer.ratio = ratio;
                censer.creatorid = creatorid;
                censer.damage = 65;
                if (difficulty == 1)
                    censer.lightup = true;
                scr_bullet_inherit(censer);
            }
        }
        else if (!instance_exists(obj_incense_cloud_manager))
        {
            var cloudman = instance_create(obj_growtangle.x, obj_growtangle.y, obj_incense_cloud_manager);
            cloudman.sameattack = scr_monsterpop();
            scr_bullet_inherit(cloudman);
            with (cloudman)
                event_user(0);
        }
    }
}
if (type == 106)
{
    if (made == 0)
    {
        made = 1;
        if (i_ex(creatorid))
        {
            var bat = instance_create(obj_growtangle.x, obj_growtangle.y - 200, obj_pendulum);
            scr_bullet_inherit(bat);
            bat.timer = 8 - floor(sameattacker * 10 * ratio);
            bat.ratio = ratio;
            bat.sameattacker = sameattacker;
            bat.sameattack = sameattack;
        }
    }
}
if (type == 107)
{
    if (made == 0)
        made = true;
    if ((btimer - (6 * sameattacker)) > (30 + (10 * ratio)) && global.turntimer > 20)
    {
        random_set_seed(global.time);
        btimer = 0;
        var section = (140 / sameattack) * sameattacker;
        var doy = (obj_growtangle.y - 70) + irandom(140 / sameattack) + section;
        random_set_seed(id + global.time);
        var saw = scr_fire_bullet(obj_growtangle.x - 135, doy, obj_saw, 0, -5 - random(2), spr_saw);
        saw.alarm[0] = 1;
        saw.delay = ceil(saw.delay * sqrt(ratio));
        saw.gravity_direction = 0;
        saw.gravity = 0.5;
    }
}
if (type == 108.5)
{
    if (!made && obj_growtangle.growcon == 2)
    {
        var _ribbick_repeat;
        if (!instance_exists(obj_ribbick_battle_frog))
            _ribbick_repeat = 2;
        else
            _ribbick_repeat = 1;
        var _ribbick_frog;
        repeat (_ribbick_repeat)
        {
            _ribbick_frog = instance_create(scr_get_box(4) + irandom_range(-51, 53), scr_get_box(3) - 22, obj_ribbick_battle_frog);
            if (i_ex(obj_growtangle))
                _ribbick_frog.depth = obj_growtangle.depth - 1;
            _ribbick_frog.target = target;
            _ribbick_frog.damage = 70;
        }
        scr_bullet_inherit(_ribbick_frog);
        var _ribbick_frogcount = instance_number(obj_ribbick_battle_frog);
        var _ribbick_froglist = ds_list_create();
        with (obj_ribbick_battle_frog)
            ds_list_add(_ribbick_froglist, id);
        ds_list_shuffle(_ribbick_froglist);
        for (a = 0; a < ds_list_size(_ribbick_froglist); a++)
        {
            var _ribbick_current_frog = ds_list_find_value(_ribbick_froglist, a);
            var _ribbick_count_ratio = 1;
            if (scr_monsterpop() == 2)
                _ribbick_count_ratio = 2;
            if (scr_monsterpop() == 3)
                _ribbick_count_ratio = 5;
            _ribbick_current_frog.alarm[0] = 10 + floor(((10 + (_ribbick_count_ratio * 30)) / _ribbick_frogcount) * (a + 0.25));
            _ribbick_current_frog.wait_time = 10 + (10 + (_ribbick_count_ratio * 30));
        }
        ds_list_shuffle(_ribbick_froglist);
        for (a = 0; a < ds_list_size(_ribbick_froglist); a++)
        {
            var _ribbick_current_frog = ds_list_find_value(_ribbick_froglist, a);
            _ribbick_current_frog.x = scr_get_box(2) + 34 + ((84 / (ds_list_size(_ribbick_froglist) - 1)) * a) + irandom_range(-5, 5);
            _ribbick_current_frog.image_xscale = sign(scr_get_box(4) - _ribbick_current_frog.x);
            if (_ribbick_current_frog.image_xscale == 0)
                _ribbick_current_frog.image_xscale = 1;
        }
        ds_list_destroy(_ribbick_froglist);
        made = true;
    }
}
if (type == 111.5)
{
    if (!made)
    {
        if (!instance_exists(obj_ribbick_battle_fly_manager))
        {
            var _ribbick_fly = instance_create(x, y, obj_ribbick_battle_fly_manager);
            scr_bullet_inherit(_ribbick_fly);
            _ribbick_fly.ratio = ratio;
            _ribbick_fly.sameattack = sameattack;
            _ribbick_fly.target = target;
            _ribbick_fly.damage = 70;
        }
    }
}
if (type == 109.5)
{
    bmax = 34;
    if (scr_monsterpop() == 2)
        bmax = 46;
    if (scr_monsterpop() == 3)
        bmax = 60;
    if (btimer >= bmax)
    {
        rab = instance_create(obj_battlesolid.x + obj_battlesolid.sprite_width, obj_battlesolid.y, obj_rabbitbullet);
        scr_bullet_inherit(rab);
        rab.damage = 55;
        btimer = 0;
    }
}
if (type == 110)
{
    if (sameattacker)
        exit;
    if (!made)
    {
        made = true;
        alm_activated = false;
        wobble = 0;
        btimer = 0;
        var init_eye_amount;
        if (scr_monsterpop() == 1)
            init_eye_amount = 16;
        else if (scr_monsterpop() >= 2 && instance_number(obj_mizzle_enemy) >= 2)
            init_eye_amount = 24;
        else
            init_eye_amount = 1;
        for (ah = init_eye_amount; ah > 0; ah--)
        {
            var yoffset = irandom_range(-10, 10);
            var bullet = scr_fire_bullet((obj_growtangle.x + 150 + irandom_range(-30, 30)) - (ah * 10), obj_growtangle.y + yoffset + irandom_range(-30, 30) + wobble, obj_bullet_almond, 180, 4, spr_almond);
            with (bullet)
                event_user(0);
            scr_bullet_inherit(bullet);
            if (i_ex(bullet))
            {
                bullet.wobble = btimer;
                bullet.image_blend = c_gray;
                bullet.image_alpha = 0;
                bullet.danger_level = sameattack;
                scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 16);
            }
            var dist = 10 + irandom(10);
            var dir = irandom(360);
            bullet = scr_fire_bullet((obj_growtangle.x + 150 + irandom_range(-30, 30)) - (ah * 10), obj_growtangle.y + yoffset + irandom_range(-30, 10) + wobble + 60, obj_bullet_almond, 180, 4, spr_almond);
            with (bullet)
                event_user(0);
            if (i_ex(bullet))
            {
                scr_bullet_inherit(bullet);
                bullet.wobble = btimer;
                bullet.image_blend = c_gray;
                bullet.image_alpha = 0;
                bullet.danger_level = sameattack;
                scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 16);
            }
            dist = 10 + irandom(10);
            dir = irandom(360);
            bullet = scr_fire_bullet((obj_growtangle.x + 150 + irandom_range(-30, 30)) - (ah * 10), (obj_growtangle.y + yoffset + irandom_range(-10, 30) + wobble) - 60, obj_bullet_almond, 180, 4, spr_almond);
            with (bullet)
                event_user(0);
            if (i_ex(bullet))
            {
                scr_bullet_inherit(bullet);
                bullet.wobble = btimer;
                bullet.image_blend = c_gray;
                bullet.image_alpha = 0;
                bullet.danger_level = sameattack;
                scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 16);
            }
        }
        with (obj_bullet_almond)
        {
            if (point_distance(x, y, obj_heart.x + 10, obj_heart.y + 10) < 64)
                instance_destroy();
        }
    }
    wobble += cos(btimer * 0.075);
    var _almondamount;
    if (scr_monsterpop() == 1)
        _almondamount = 12;
    else if (scr_monsterpop() >= 2 && instance_number(obj_mizzle_enemy) >= 2)
        _almondamount = 2;
    else
        _almondamount = 24;
    if (!alm_activated)
    {
        if ((btimer % _almondamount) == 0)
        {
            var yoffset = irandom_range(-10, 10);
            var bullet = scr_fire_bullet(obj_growtangle.x + 150 + irandom_range(-30, 30), obj_growtangle.y + yoffset + irandom_range(-30, 30) + wobble, obj_bullet_almond, 180, 4, spr_almond);
            with (bullet)
                event_user(0);
            if (i_ex(bullet))
            {
                scr_bullet_inherit(bullet);
                bullet.wobble = btimer;
                bullet.image_blend = c_gray;
                bullet.image_alpha = 0;
                bullet.danger_level = sameattack;
                scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 16);
            }
            var dist = 10 + irandom(10);
            var dir = irandom(360);
            bullet = scr_fire_bullet(obj_growtangle.x + 150 + irandom_range(-30, 30), obj_growtangle.y + yoffset + irandom_range(-30, 10) + wobble + 60, obj_bullet_almond, 180, 4, spr_almond);
            with (bullet)
                event_user(0);
            if (i_ex(bullet))
            {
                scr_bullet_inherit(bullet);
                bullet.wobble = btimer;
                bullet.image_blend = c_gray;
                bullet.image_alpha = 0;
                bullet.danger_level = sameattack;
                scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 16);
            }
            dist = 10 + irandom(10);
            dir = irandom(360);
            bullet = scr_fire_bullet(obj_growtangle.x + 150 + irandom_range(-30, 30), (obj_growtangle.y + yoffset + irandom_range(-10, 30) + wobble) - 60, obj_bullet_almond, 180, 4, spr_almond);
            with (bullet)
                event_user(0);
            if (i_ex(bullet))
            {
                scr_bullet_inherit(bullet);
                bullet.wobble = btimer;
                bullet.image_blend = c_gray;
                bullet.image_alpha = 0;
                bullet.danger_level = sameattack;
                scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 16);
            }
        }
    }
}
if (type == 110.5)
{
    if (!made)
    {
        made = true;
        if (sameattacker)
            exit;
        var mizzle_spotlighter = instance_create(x, y, obj_mizzle_spotlight_controller_b);
        scr_bullet_inherit(mizzle_spotlighter);
        mizzle_spotlighter.sameattack = sameattack;
        mizzle_spotlighter.set_info();
    }
}
if (type == 111)
{
    if (sameattacker)
        exit;
    if (!made)
    {
        made = true;
        btimer = 0;
        side = 1;
        offset = 0;
        coat_pop = instance_number(obj_mizzle_enemy);
        instance_create(0, 0, obj_coathanger_renderer);
    }
    if (sameattack == scr_monsterpop())
    {
        with (obj_regularbullet)
        {
            if (sprite_index == spr_holydropletbullet2)
                x += ((sin(global.time * 0.1) * 1.5) / scr_monsterpop());
        }
    }
    var _miz_cd;
    if (scr_monsterpop() == sameattack)
        _miz_cd = 19 + (scr_monsterpop() * 3);
    else
        _miz_cd = 22 + (scr_monsterpop() * 6);
    if ((btimer % _miz_cd) == 0)
    {
        var do_this = true;
        with (obj_mizzle_spotlight_controller_b)
        {
            if (alert)
                do_this = false;
        }
        offset = irandom_range(-60, 60);
        var circ = 7 + (3 * sameattack);
        if (do_this)
        {
            for (a = 0; a < circ; a++)
            {
                var cside = 90 + (90 * side);
                spiral = instance_create(obj_growtangle.x + lengthdir_x(128, (cside - 5) + (10 * a) + offset), obj_growtangle.y + lengthdir_y(128, (cside - 5) + (10 * a) + offset), obj_holywater_spiral);
                scr_bullet_inherit(spiral);
                spiral = instance_create(obj_growtangle.x + lengthdir_x(128, ((cside + 5) - (10 * a)) + offset), obj_growtangle.y + lengthdir_y(128, ((cside + 5) - (10 * a)) + offset), obj_holywater_spiral);
                scr_bullet_inherit(spiral);
            }
        }
        side *= -1;
    }
}
if (type == 112)
{
}
if (type == 113)
{
    if (sameattacker)
        exit;
    if (!made)
    {
        btimer = 0 - irandom(10);
        made = true;
        special = choose(0, 1);
        with (obj_dbulletcontroller)
        {
            if (type == 110)
                btimer = -50;
            if (type == 111)
                btimer = -50;
        }
    }
    side++;
    special = choose(0, 1);
    if (btimer > 0 && global.turntimer > 20)
    {
        btimer = -40 - irandom(30);
        var tempx = obj_growtangle.x - 68;
        if (special == 1)
            tempx = obj_growtangle.x + 68;
        with (instance_create(tempx, obj_growtangle.y, obj_holywater_act_line))
        {
            image_speed = 0;
            sprite_index = spr_organ_bar;
            image_xscale = 0.2;
            image_yscale = 2;
            destroyonhit = false;
            active = false;
            parentid = other.creatorid;
            damage = other.damage;
            target = other.target;
            if (other.difficulty == 0)
                type = 1;
            if (other.special == 0)
            {
                hspeed = 0.5;
                gravity_direction = 0;
                gravity = 0.24;
            }
            else
            {
                hspeed = -0.5;
                gravity_direction = 180;
                gravity = 0.24;
            }
        }
    }
}
if (type == 108)
{
    if (!made)
    {
        var _organnotemanager = instance_create(0, 0, obj_organnote_manager);
        scr_bullet_inherit(_organnotemanager);
        _organnotemanager.sameattacker = other.sameattacker;
        _organnotemanager.sameattack = sameattack;
        _organnotemanager.damage = other.damage;
        _organnotemanager.target = other.target;
        with (_organnotemanager)
            event_user(0);
        made = true;
    }
}
if (type == 109)
{
    if (!made)
    {
        var _sameattack = 0;
        for (var i = 0; i < instance_number(obj_dbulletcontroller); i++)
        {
            enemy[i] = instance_find(obj_dbulletcontroller, i);
            if (enemy[i].type == 109)
                _sameattack++;
        }
        if (!i_ex(obj_organ_vertical_pillar_manager))
        {
            var _organbarmanager = instance_create(0, 0, obj_organ_vertical_pillar_manager);
            scr_bullet_inherit(_organbarmanager);
            _organbarmanager.sameattacker = other.sameattacker;
            _organbarmanager.sameattack = _sameattack;
            _organbarmanager.creatorid = creatorid;
            _organbarmanager.difficulty = difficulty;
            _organbarmanager.pop = scr_monsterpop();
            _organbarmanager.damage = damage;
            _organbarmanager.target = target;
            if (sameattack == scr_monsterpop())
            {
                _organbarmanager.start_time = 15;
                _organbarmanager.onlybars = true;
            }
            with (_organbarmanager)
                event_user(0);
            if (sameattack == scr_monsterpop())
                _organbarmanager.interval = floor(_organbarmanager.interval * 1.5);
            if (difficulty && scr_monsterpop() == 1)
            {
                var _organnotemanager = instance_create(0, 0, obj_organnote_manager);
                scr_bullet_inherit(_organnotemanager);
                _organnotemanager.sameattacker = other.sameattacker;
                _organnotemanager.sameattack = sameattack;
                with (_organnotemanager)
                    event_user(0);
            }
        }
        made = true;
    }
}
if (type == 112.5)
{
    if (made == false)
    {
        made = true;
        if (scr_debug() && keyboard_check(vk_shift))
            special += 1;
        if (scr_debug() && keyboard_check(vk_control))
            special += 2;
        if (scr_debug() && keyboard_check(vk_alt))
            special += 4;
        for (var i = 0; i < instance_number(obj_pippins_enemy); i++)
        {
            enemy[i] = instance_find(obj_pippins_enemy, i);
            if (enemy[i].bet)
                special = 1;
            if (enemy[i].fixedbet)
                special = 2;
            if (enemy[i].cheat)
                special = 4;
        }
        if (instance_number(obj_pippins_enemy) == 3)
            n = 4;
        if (instance_number(obj_pippins_enemy) == 2)
            n = 3;
        if (instance_number(obj_pippins_enemy) == 1)
            n = 2;
        if (i_ex(obj_zapper_enemy))
            n = 3;
        if (special == 2)
            n++;
        if (special == 4)
            n--;
        difficulty = irandom(5);
    }
    if (n > 0 && btimer > 99)
    {
        n--;
        btimer = 88;
        var flags = special;
        show_debug_message("flags: " + string(flags));
        with (instance_create((obj_growtangle.x - 60) + random(120), obj_growtangle.y - 90 - random(30), obj_bullet_dice))
        {
            if (flags & 1)
                mercified = true;
            if (flags & 2)
            {
                slowed_rotate = 1.5;
                mercified = true;
            }
            if (flags & 4)
                sprite_index = spr_bullet_dice_all4s;
            target = other.target;
            damage = 70;
            if (other.difficulty == 0)
            {
                if (other.n == 0)
                    image_index = 1;
                if (other.n == 1)
                    image_index = 5;
                if (other.n == 2)
                    image_index = 5;
                if (other.n == 3)
                    image_index = 5;
            }
            if (other.difficulty == 1)
            {
                if (other.n == 0)
                    image_index = 5;
                if (other.n == 1)
                    image_index = 8;
                if (other.n == 2)
                    image_index = 12;
                if (other.n == 3)
                    image_index = 8;
            }
            if (other.difficulty == 2)
            {
                if (other.n == 0)
                    image_index = 5;
                if (other.n == 1)
                    image_index = 5;
                if (other.n == 2)
                    image_index = 1;
                if (other.n == 3)
                    image_index = 5;
            }
            if (other.difficulty == 3)
            {
                if (other.n == 0)
                    image_index = 12;
                if (other.n == 1)
                    image_index = 5;
                if (other.n == 2)
                    image_index = 5;
                if (other.n == 3)
                    image_index = 8;
            }
            if (other.difficulty == 4)
            {
                if (other.n == 0)
                    image_index = 5;
                if (other.n == 1)
                    image_index = 5;
                if (other.n == 2)
                    image_index = 12;
                if (other.n == 3)
                    image_index = 12;
            }
            if (other.difficulty == 5)
            {
                if (other.n == 0)
                    image_index = 5;
                if (other.n == 1)
                    image_index = 1;
                if (other.n == 2)
                    image_index = 5;
                if (other.n == 3)
                    image_index = 8;
            }
        }
    }
    if (!i_ex(obj_bullet_dice) && global.turntimer > 30)
        global.turntimer = 30;
}
if (type == 120)
{
    if (init == 1)
    {
        init++;
        var _attack = instance_create(obj_growtangle.x, obj_growtangle.y, obj_darkness_sound_attack);
        scr_bullet_inherit(_attack);
        _attack.difficulty = difficulty;
    }
}
if (type == 130)
{
    if (!made)
    {
        var _mascot_attack = instance_create(obj_growtangle.x, obj_growtangle.y, obj_elnina_mascotattack);
        _mascot_attack.attacktype = special;
        _mascot_attack.favored = side;
        _mascot_attack.type = difficulty;
        scr_bullet_inherit(_mascot_attack);
        made = true;
    }
    if (special != 4)
        exit;
    if (global.turntimer < 500 && init == 1)
    {
        global.typer = 50;
        init = 2;
    }
    if (global.turntimer < 400 && init == 2)
    {
        init = 3;
        with (obj_writer)
            instance_destroy();
    }
    if (global.turntimer < 250 && init == 4)
    {
        init = 5;
        with (obj_writer)
            instance_destroy();
    }
    if (global.turntimer < 100 && init == 6)
    {
        init = 7;
        with (obj_writer)
            instance_destroy();
    }
}
if (type == 131)
{
    if (!made)
    {
        var bouncybullet = instance_create(obj_growtangle.x + 20, cameray() + 40, obj_elnina_bouncingbullet);
        scr_bullet_inherit(bouncybullet);
        bouncybullet.difficulty = difficulty;
        bouncybullet.image_blend = c_yellow;
        if (difficulty == 0)
        {
            bouncybullet.difficulty = 2;
            bouncybullet.bounce_count = 20;
        }
        made = true;
        with (obj_elnina_umbrella)
            sprite_index = spr_ch3_elnina_umbrella;
    }
    if (global.turntimer < 2)
    {
        with (obj_afterimage_grow)
            instance_destroy();
    }
}
if (type == 135)
{
    if (!made)
    {
        if (i_ex(obj_heart) && i_ex(obj_growtangle))
        {
            var rainbullet = instance_create(obj_growtangle.x, obj_growtangle.y, obj_watercooler_bullet_rainball);
            scr_bullet_inherit(rainbullet);
            rainbullet.special = special;
            made = 1;
        }
    }
}
if (type >= 140 && type <= 143)
{
    if (!made)
    {
        if (type > 140)
            spell = type - 140;
        else
            spell = irandom(2);
        made = true;
        btimer = (5 + (35 * ratio) + (10 * (spell == 0 && ratio == 1.5))) - (24 * (spell == 0 && ratio == 2.3)) - (8 * sameattacker);
    }
    if (btimer > ((5 + (35 * ratio) + (10 * (spell == 0 && ratio == 1.5))) - (24 * (spell == 0 && ratio == 2.3))) && global.turntimer > 50)
    {
        btimer = 0;
        if (i_ex(creatorid))
        {
            var bookside = sign((sameattacker % 2) - 0.5) * sign((special % 2) - 0.5);
            var book = instance_create(obj_growtangle.x + ((170 + random(20)) * bookside), (obj_growtangle.y + 70) - (45 * sameattacker) - random(120 - (45 * sameattack)), obj_magic_book);
            scr_bullet_inherit(book);
            book.timer = 0 - floor(sameattacker * 7);
            book.ratio = ratio;
            book.open_side = bookside;
            book.sameattacker = sameattacker;
            book.sameattack = sameattack;
            book.ratio = ratio;
            book.vspeed = -4;
            book.hspeed = -5 * bookside;
            book.spell = spell;
            book.image_index = book.spell;
            var boost = 1;
            with (obj_dbulletcontroller)
            {
                if (id != other.id)
                {
                    if (type != 104 || spell != 2)
                        boost = 0;
                }
            }
            book.boost = boost;
            special++;
        }
    }
    if (global.turntimer > 10)
    {
        with (obj_bibliox_enemy)
        {
            if (image_alpha > 0)
                image_alpha -= 0.1;
        }
    }
}
if (type == 146)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_starter;
        obj_growtangle.spr_custom_box = 5418;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x - 112;
        obj_heart.y = obj_growtangle.y + 21;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        obj_heart.wspeed = global.sp / 2;
        with (instance_create_depth(obj_growtangle.x + 140, obj_growtangle.y + 26, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 3.2;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        for (var _linex = 0; _linex < 150; _linex += 36)
            instance_create(obj_heart.x + 40 + _linex, obj_heart.y + 3, obj_ghosthouse_dot);
        for (var _liney = 12; _liney <= 27; _liney += 24)
            instance_create(obj_growtangle.x, (obj_growtangle.y - 12) + _liney, obj_ghosthouse_dot);
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_starter_inner;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        instance_create_depth(obj_growtangle.x, obj_growtangle.y - 36, -10, obj_ghosthouse_key);
        with (instance_create(obj_ghosthouse_lock.x + 8, obj_ghosthouse_lock.y + 8, obj_ghosthouse_exit))
            image_yscale = 4;
    }
}
if (type == 147)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_3x2;
        obj_growtangle.spr_custom_box = 32;
        obj_growtangle.mask_index = -1;
        obj_growtangle.y += 40;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x + 92;
        obj_heart.y = obj_growtangle.y + 28;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        pumpkin_x = obj_growtangle.x + 120;
        pumpkin_y = obj_growtangle.y - 45;
        path = path_add();
        path_add_point(path, pumpkin_x, pumpkin_y, 210);
        path_add_point(path, pumpkin_x - 225, pumpkin_y, 170);
        path_add_point(path, pumpkin_x - 225, pumpkin_y + 80, 100);
        path_add_point(path, pumpkin_x + 600, pumpkin_y + 80, 100);
        obj_heart.wspeed = global.sp / 2;
        with (instance_create_depth(obj_growtangle.x + 148, obj_growtangle.y + 18, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 4.5;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x - 112, obj_growtangle.y + 4, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 3;
            image_yscale = 3;
            visible = false;
            active = false;
        }
        instance_create(obj_growtangle.x - 128, obj_growtangle.y, obj_ghosthouse_dot);
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_3x2_inner;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        for (var _linex = 0; _linex < 88; _linex += 21)
        {
            var _flip = !sign(_linex % 42);
            while (_flip >= -1)
            {
                if (_linex != 42)
                    instance_create((obj_growtangle.x - 42) + _linex, obj_growtangle.y + 32 + (_flip * 20), obj_ghosthouse_dot);
                _flip -= 2;
            }
        }
        with (scr_fire_bullet(obj_growtangle.x - 80, obj_growtangle.y - 32, obj_gh_fireball_bouncy, 45, 1))
        {
            hspeed = 1;
            vspeed = 1;
        }
        with (scr_fire_bullet(obj_growtangle.x, obj_growtangle.y - 32, obj_gh_fireball_bouncy, 45, 1))
        {
            hspeed = -1.5;
            vspeed = 0.5;
        }
        with (instance_create(obj_growtangle.x - 64, obj_growtangle.y, obj_gh_bouncebarrier))
        {
            image_yscale = 50;
            image_angle = 90;
            image_xscale = 2;
        }
        with (instance_create(obj_growtangle.x - 60, obj_growtangle.y, obj_gh_bouncebarrier))
        {
            image_yscale = 24;
            image_xscale = 2;
        }
        with (instance_create(obj_growtangle.x + 60, obj_growtangle.y, obj_gh_bouncebarrier))
        {
            image_yscale = 24;
            image_xscale = 2;
        }
        for (var _flip = 1; _flip >= -1; _flip -= 2)
        {
            for (var _linex = 0; _linex < 60; _linex += 24)
                instance_create((obj_growtangle.x - 128) + _linex, obj_growtangle.y + (_flip * 32), obj_ghosthouse_dot);
            if (_flip == 1)
            {
                for (var _flip3 = 1; _flip3 >= -1; _flip3 -= 1)
                {
                    with (instance_create_depth(obj_growtangle.x, obj_growtangle.y + (34 * _flip) + (20 * _flip3), 1, obj_gh_fireball_linear))
                    {
                        width = 45 * (1 - (2 * (_flip3 == 0)));
                        cycle_length = 60;
                    }
                }
            }
        }
        instance_create_depth(obj_heart.x + 8, obj_growtangle.y - 37, -10, obj_ghosthouse_key);
        with (instance_create(obj_ghosthouse_lock.x + 8, obj_ghosthouse_lock.y + 8, obj_ghosthouse_exit))
            image_yscale = 10;
    }
}
if (type == 148)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_jackendummy);
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_toolong;
        obj_growtangle.spr_custom_box = 2172;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x - 5;
        obj_heart.y = obj_growtangle.y + 90;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        obj_heart.wspeed = global.sp / 2;
        pumpkin_x = obj_growtangle.x;
        pumpkin_y = obj_growtangle.y - 120;
        path = path_add();
        path_add_point(path, pumpkin_x, pumpkin_y, 22 + (13 * (room == room_bullettest || (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))));
        path_add_point(path, pumpkin_x, pumpkin_y + 500, 22 + (13 * (room == room_bullettest || (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))));
        with (instance_create_depth(obj_growtangle.x - 100, obj_growtangle.y - 60, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 30;
            image_yscale = 30;
            visible = false;
            active = false;
        }
        with (instance_create_depth(obj_growtangle.x - 16, obj_growtangle.y - 2, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 3.75;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 32, obj_growtangle.y - 2, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 3.75;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x - 80, obj_growtangle.y - 2, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 4.75;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 68, obj_growtangle.y - 2, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 2;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x - 76, obj_growtangle.y + 38, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 7;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y + 38, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 7;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 72, obj_growtangle.y + 38, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 5;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 128, obj_growtangle.y + 38, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 2;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x - 128, obj_growtangle.y + 78, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 2.5;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x - 64, obj_growtangle.y + 78, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 8;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 16, obj_growtangle.y + 78, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 5;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 74, obj_growtangle.y + 78, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 6;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 124, obj_growtangle.y + 78, 10, obj_battlesolid))
        {
            image_xscale = 2;
            image_yscale = 3;
            image_angle = 90;
            sprite_index = spr_solid_bar;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        for (var _liney = 8; _liney <= 60; _liney += 40)
        {
            for (var _linex = -10; _linex <= 100; _linex += 25)
                instance_create((obj_growtangle.x - 80) + (_linex * 2), obj_growtangle.y + 10 + _liney, obj_ghosthouse_dot);
            with (instance_create(obj_growtangle.x, obj_growtangle.y + 10 + _liney, obj_gh_fireball_linear))
            {
                width = 130 * (1 - (2 * (_liney == 8)));
                cycle_length = 120;
            }
            with (instance_create(obj_growtangle.x, obj_growtangle.y + 10 + _liney, obj_gh_fireball_square))
            {
                sprite_index = spr_ghost_house_bullet_small;
                width = 130 * (-1 + (2 * (_liney == 8)));
                hflip = sign(_liney - 20);
                vflip = 0.09;
                cycle_length = 150;
            }
        }
        with (instance_create_depth(obj_growtangle.x + 140, obj_growtangle.y + 80, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 3.75;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y - 32, -10, obj_ghosthouse_key))
        {
            long = true;
            image_xscale = 3;
            image_yscale = 0.75;
        }
        with (instance_create(obj_ghosthouse_lock.x + 8, obj_ghosthouse_lock.y + 16, obj_ghosthouse_exit))
            image_yscale = 4;
    }
}
if (type == 149)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            with (instance_create(x, y, obj_jackendummy))
                scaredycat = false;
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_twopumpkins;
        obj_growtangle.spr_custom_box = 1867;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x + 70;
        obj_heart.y = obj_growtangle.y + 61;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        pumpkin_x = obj_growtangle.x + 152;
        pumpkin_y = obj_growtangle.y - 75;
        path = path_add();
        path_add_point(path, pumpkin_x, pumpkin_y, 100);
        path_add_point(path, pumpkin_x - 225, pumpkin_y, 100);
        path_add_point(path, pumpkin_x - 225, pumpkin_y + 41, 100);
        path_add_point(path, pumpkin_x - 75, pumpkin_y + 41, 100);
        path_add_point(path, pumpkin_x - 75, pumpkin_y + 78, 88);
        path_add_point(path, pumpkin_x - 225, pumpkin_y + 78, 75);
        path_add_point(path, pumpkin_x - 225, pumpkin_y + 123, 60);
        path_add_point(path, pumpkin_x + 240, pumpkin_y + 123, 40);
        obj_heart.wspeed = global.sp / 2;
        with (instance_create_depth(obj_growtangle.x - 120, obj_growtangle.y - 88, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 3;
            image_yscale = 3;
            visible = false;
            active = false;
            alternate = true;
        }
        with (instance_create_depth(obj_growtangle.x - 112, obj_growtangle.y, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 3;
            image_yscale = 3;
            visible = false;
            active = false;
        }
        for (var _flip = -1; _flip <= 1; _flip += 2)
        {
            with (instance_create(obj_growtangle.x, obj_growtangle.y + 22, obj_gh_fireball_mobius))
            {
                timer = pi * (_flip == 1);
                timer2 = (pi * (_flip == 1)) / 2;
            }
            for (var _linex = -38; _linex <= 50; _linex += 20)
            {
                with (instance_create(obj_growtangle.x + (_linex * 1.3), obj_growtangle.y + 22 + (58 * _flip), obj_gh_fireball_hop))
                {
                    cycle_length = 60;
                    width = 32 * _flip;
                    if (((_linex + 38) % 40) == 0)
                    {
                        instance_create(x, y, obj_ghosthouse_dot);
                        timer += 1.5707963267948966;
                    }
                }
            }
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_twopumpkins_inner;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        instance_create_depth(obj_heart.x + 2, obj_growtangle.y - 66, -10, obj_ghosthouse_key);
        with (instance_create_depth(obj_growtangle.x + 100, obj_growtangle.y + 46, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 4.75;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create(obj_ghosthouse_lock.x + 6, obj_ghosthouse_lock.y + 12, obj_ghosthouse_exit))
            image_yscale = 9;
    }
}
if (type == 150)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_chimney;
        obj_growtangle.spr_custom_box = 3174;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x + 92;
        obj_heart.y = obj_growtangle.y + 64;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        pumpkin_x = obj_growtangle.x + 240;
        pumpkin_y = obj_growtangle.y + 64;
        path = path_add();
        with (instance_create_depth(pumpkin_x, pumpkin_y - 40, -9, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_tree;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        obj_heart.wspeed = global.sp / 2;
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y + 70, -10, obj_gh_fireball_square))
        {
            width = 15;
            hflip = -1;
            cycle_length = 40;
            instance_create_depth(x, y, -10, obj_ghosthouse_dot);
        }
        for (var _flip = -1; _flip <= 1; _flip += 2)
        {
            for (var _range = 0; _range <= 30; _range += 15)
            {
                with (instance_create_depth(obj_growtangle.x + (55 * _flip), obj_growtangle.y - 21, -10, obj_gh_fireball_square))
                {
                    vflip = -_flip * (1 - (2 * (_range == 15)));
                    width = _range;
                    cycle_length = 40 + (_range / 2);
                }
            }
            for (var _rot = 135; _rot < 270; _rot += 90)
                instance_create_depth(obj_growtangle.x + (55 * _flip) + lengthdir_x(-40 * _flip, _rot), (obj_growtangle.y - 21) + lengthdir_y(40, _rot), -10, obj_ghosthouse_dot);
            with (instance_create_depth(obj_growtangle.x - (120 * _flip), obj_growtangle.y - 22, -10, obj_gh_fireball_mobius))
            {
                timer = 1.5707963267948966;
                width = 18 * _flip;
                height = 40 * _flip;
                cycle_length = 32;
                cycle_length2 = 180;
                trail_length = 0;
                x = round(basex + (sin(timer) * width));
                y = round(basey + (cos(timer2) * height));
                with (orb[0])
                    instance_destroy();
                with (orb[1])
                    instance_destroy();
                with (orb[2])
                    instance_destroy();
            }
        }
        with (instance_create_depth(obj_growtangle.x + 56, obj_growtangle.y + 48, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 3;
            image_yscale = 3;
            visible = false;
            active = false;
            chimney = true;
        }
        with (instance_create_depth(obj_growtangle.x - 72, obj_growtangle.y + 46, 12, obj_gh_bouncebarrier))
        {
            image_yscale = 12;
            image_angle = 90;
            image_xscale = 2;
            visible = true;
            image_blend = merge_color(merge_color(c_green, c_lime, 0.5), c_black, 0.6);
        }
        with (instance_create_depth(obj_growtangle.x - 24, obj_growtangle.y + 68, 12, obj_gh_bouncebarrier))
        {
            image_yscale = 6;
            image_xscale = 2;
            visible = true;
            image_blend = merge_color(merge_color(c_green, c_lime, 0.5), c_black, 0.6);
        }
        with (scr_fire_bullet(obj_growtangle.x - 44, obj_growtangle.y + 70, obj_gh_fireball_bouncy, 135, 1, spr_ghost_house_pumpkin_spin, false, false, -11))
        {
            for (var _x = 0; _x <= 60; _x += 30)
                instance_create_depth(x - _x, y, -10, obj_ghosthouse_dot);
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y + 32, -11, obj_gh_fireball_linear))
        {
            width = 91;
            cycle_length = 101;
            for (var _x = -60; _x <= 60; _x += 30)
                instance_create_depth(x - (_x * 1.2), y, -10, obj_ghosthouse_dot);
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_chimney_inner;
            image_speed = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        instance_create_depth(obj_growtangle.x, obj_growtangle.y - 4, -10, obj_ghosthouse_key);
        with (instance_create_depth(obj_growtangle.x + 124, obj_growtangle.y + 48, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 5.5;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create(obj_growtangle.x - 100, obj_growtangle.y - 144, obj_ghosthouse_exit))
            image_xscale = 20;
    }
}
if (type == 151)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
            global.drawdimmerlight = true;
            with (obj_growtangle)
                depth = 0;
        }
        obj_growtangle.sprite_index = spr_ghost_house_normal;
        obj_growtangle.spr_custom_box = 2333;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x - 5;
        obj_heart.y = obj_growtangle.y - 5;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        pumpkin_x = obj_growtangle.x - 164;
        pumpkin_y = obj_growtangle.y - 90;
        path = path_add();
        path_add_point(path, pumpkin_x, pumpkin_y, 200);
        path_add_point(path, pumpkin_x + 200, pumpkin_y, 500);
        path_add_point(path, pumpkin_x + 260, pumpkin_y, 80);
        path_add_point(path, pumpkin_x + 260, pumpkin_y, 60);
        path_add_point(path, pumpkin_x + 260, pumpkin_y + 192, 40);
        path_add_point(path, pumpkin_x + 300, pumpkin_y + 192, 100);
        path_add_point(path, pumpkin_x + 700, pumpkin_y + 192, 100);
        obj_heart.wspeed = global.sp / 2;
        for (var _flip = 1; _flip >= -1; _flip -= 2)
        {
            instance_create(obj_growtangle.x + (39 * _flip), obj_growtangle.y, obj_ghosthouse_dot);
            instance_create(obj_growtangle.x + (19 * _flip), obj_growtangle.y - 90, obj_ghosthouse_dot);
            instance_create(obj_growtangle.x + (36 * _flip), obj_growtangle.y - 82, obj_ghosthouse_dot);
            for (var _layer = 0; _layer <= 1; _layer++)
            {
                with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, -10, obj_gh_fireball_square))
                {
                    sprite_index = spr_ghost_house_bullet;
                    width = (39 + (22 * _layer)) * _flip;
                    cycle_length = (84 + (20 * _layer)) * _flip;
                }
            }
        }
        with (instance_create_depth(obj_growtangle.x + 86, obj_growtangle.y - 73, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 1;
            image_yscale = 3;
            visible = false;
            active = false;
        }
        for (var _y = -32; _y <= 32; _y += 32)
        {
            with (instance_create_depth(obj_growtangle.x - 100, obj_growtangle.y + _y, -11, obj_gh_fireball_linear))
            {
                width = 20 * (1 - (2 * (_y == 0)));
                cycle_length = 40;
                instance_create_depth(x, y, -10, obj_ghosthouse_dot);
            }
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_normal_inner;
            image_speed = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        instance_create_depth(obj_growtangle.x - 100.5, obj_growtangle.y - 98, obj_growtangle.depth - 1, obj_lightsource_lamp);
        instance_create_depth(obj_growtangle.x - 100, obj_growtangle.y + 80, -10, obj_ghosthouse_key);
        with (instance_create_depth(obj_growtangle.x + 130, obj_growtangle.y + 76, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 4;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create(obj_ghosthouse_lock.x + 8, obj_ghosthouse_lock.y - 4, obj_ghosthouse_exit))
        {
            sprite_index = spr_solid_bar_end;
            image_yscale = 6;
        }
    }
}
if (type == 152)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            with (instance_create(x, y, obj_jackendummy))
                scaredycat = true;
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_yourtutu;
        obj_growtangle.spr_custom_box = 1400;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = (obj_growtangle.x - 5) + 112;
        obj_heart.y = (obj_growtangle.y - 5) + 60;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        pumpkin_x = obj_growtangle.x - 200;
        pumpkin_y = obj_growtangle.y - 40;
        path = path_add();
        path_add_point(path, pumpkin_x, pumpkin_y, 120);
        path_add_point(path, obj_growtangle.x + 200, pumpkin_y, 200);
        path_add_point(path, obj_growtangle.x + 200, pumpkin_y + 84, 150);
        path_add_point(path, obj_growtangle.x - 200, pumpkin_y + 84, 250);
        path_add_point(path, obj_growtangle.x - 200, pumpkin_y + 124, 350);
        path_add_point(path, obj_growtangle.x + 200, pumpkin_y + 124, 1500);
        obj_heart.wspeed = global.sp / 2;
        with (instance_create_depth(obj_growtangle.x + 110, obj_growtangle.y + 30, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 2;
            image_yscale = 2;
            image_angle = 45;
            visible = false;
            active = false;
        }
        with (instance_create_depth(obj_growtangle.x + 80, obj_growtangle.y + 40, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 2;
            image_yscale = 2;
            visible = false;
            active = false;
            tutu = 1;
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_yourtutu_inner;
            image_speed = 0;
            image_xscale = 2;
            image_yscale = 2;
            mask_index = spr_no_mask;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_yourtutu_inner_hitbox;
            image_speed = 0;
            image_blend = merge_color(c_green, c_lime, 0.5);
            visible = false;
        }
        with (instance_create(obj_growtangle.x + 69, obj_growtangle.y - 54, obj_gh_fireball_square))
        {
            init = true;
            mask_index = -1;
            path_set_closed(path, false);
            path_add_point(path, x, y, 100);
            path_add_point(path, x + 34, y - 34, 80);
            path_add_point(path, x + 61, y - 7, 80);
            path_add_point(path, x + 26, y + 28, 100);
            instance_create_depth(x + 34, y - 33, 1, obj_ghosthouse_dot);
            instance_create_depth(x + 33, y + 22, 1, obj_ghosthouse_dot);
            path_start(path, 1.75, path_action_reverse, true);
        }
        with (instance_create(obj_growtangle.x + 76, obj_growtangle.y + 36, obj_gh_fireball_square))
        {
            init = true;
            mask_index = -1;
            path_set_closed(path, false);
            path_add_point(path, x, y, 100);
            path_add_point(path, x + 29, y - 29, 75);
            path_add_point(path, x + 62, y - 62, 100);
            instance_create_depth(x, y - 1, 1, obj_ghosthouse_dot);
            instance_create_depth(x + 60, y - 59, 1, obj_ghosthouse_dot);
            path_start(path, 1.75, path_action_reverse, true);
        }
        with (instance_create(obj_growtangle.x - 28, obj_growtangle.y - 20, obj_gh_fireball_square))
        {
            init = true;
            mask_index = -1;
            path_set_closed(path, false);
            path_add_point(path, x, y, 100);
            path_add_point(path, x + 30, y + 30, 100);
            path_start(path, 1.25, path_action_reverse, true);
        }
        for (var _angle = 0; _angle < 360; _angle += 90)
        {
            with (instance_create(obj_growtangle.x - 81, obj_growtangle.y + 5, obj_gh_fireball_square))
            {
                init = true;
                mask_index = -1;
                path_set_closed(path, true);
                var __angle = 180 * (_angle >= 180);
                for (var _angle2 = 0; _angle2 > -360; _angle2 -= 90)
                {
                    path_add_point(path, x + lengthdir_x(29, __angle + _angle2), y + lengthdir_y(29, __angle + _angle2), 100);
                    if (_angle == 0)
                        instance_create_depth(x + lengthdir_x(29, __angle + _angle2), y + lengthdir_y(29, __angle + _angle2), 1, obj_ghosthouse_dot);
                }
                path_start(path, 1.5, path_action_restart, true);
                scr_lerpvar("path_speed", sign(_angle % 180) * 1.5, 1.5, 20);
            }
        }
        with (instance_create(obj_growtangle.x + 54, obj_growtangle.y + 15, obj_gh_fireball_square))
        {
            init = true;
            mask_index = -1;
            path_add_point(path, x, y, 100);
            path_add_point(path, x + 32, y - 32, 100);
            path_add_point(path, x - 26, y - 90, 100);
            path_add_point(path, x - 58, y - 58, 100);
            instance_create_depth(x - 26, y - 89, 1, obj_ghosthouse_dot);
            instance_create_depth(x - 20, y + 20, 1, obj_ghosthouse_dot);
            instance_create_depth(x - 80, y - 79, 1, obj_ghosthouse_dot);
            instance_create_depth(x - 96, y - 95, 1, obj_ghosthouse_dot);
            path_start(path, 1.2, path_action_restart, true);
            instance_create_depth(x, y, 1, obj_ghosthouse_dot);
        }
        with (instance_create(obj_growtangle.x + 54, obj_growtangle.y + 15, obj_gh_fireball_square))
        {
            init = true;
            mask_index = -1;
            path_add_point(path, x - 26, y - 90, 100);
            path_add_point(path, x - 58, y - 58, 100);
            path_add_point(path, x, y, 100);
            path_add_point(path, x + 32, y - 32, 100);
            path_start(path, 1.25, path_action_restart, true);
        }
        with (instance_create_depth(obj_growtangle.x - 104, obj_growtangle.y - 80, -10, obj_ghosthouse_key))
        {
            sprite_index = spr_tutu;
            tutu = true;
            if (room == room_bullettest)
            {
                x = obj_heart.x;
                y = obj_heart.y - 40;
            }
        }
        with (instance_create_depth(obj_growtangle.x + 150, obj_growtangle.y + 76, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 4;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x + 88, obj_growtangle.y + 44, 10, obj_battlesolid))
        {
            image_xscale = -2;
            image_yscale = 4;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create(obj_ghosthouse_lock.x + 8, obj_ghosthouse_lock.y - 4, obj_ghosthouse_exit))
        {
            sprite_index = spr_solid_bar_end;
            image_yscale = 6;
        }
    }
}
if (type == 153)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_nopumpkin;
        obj_growtangle.spr_custom_box = 5798;
        obj_growtangle.x += 26;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x - 5 - 104;
        obj_heart.y = (obj_growtangle.y - 5) + 78;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        obj_heart.wspeed = global.sp / 2;
        for (var _xx = 1; _xx >= -2; _xx -= 1)
        {
            for (var _yy = -3; _yy <= 3; _yy += 2)
            {
                if ((_xx != 0 || _yy != -3) && (_xx != -2 || _yy != 3))
                    instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy), obj_ghosthouse_dot);
                if (_yy == 3 && _xx == -1)
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy), obj_gh_fireball_linear))
                    {
                        type = 1;
                        width = 18;
                        cycle_length = 27;
                    }
                }
                if (_yy == -1 && _xx == -2)
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy), obj_gh_fireball_square))
                    {
                        sprite_index = spr_ghost_house_bullet;
                        width = -15;
                        hflip = -1;
                        cycle_length = 27;
                    }
                }
                if (_yy == -1 && (_xx == 0 || _xx == 1))
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy), obj_gh_fireball_square))
                    {
                        sprite_index = spr_ghost_house_bullet;
                        width = -15;
                        cycle_length = 27;
                    }
                }
                if (_yy == 1 && _xx == -2)
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy), obj_gh_fireball_square))
                    {
                        sprite_index = spr_ghost_house_bullet;
                        width = 15;
                        cycle_length = 27;
                    }
                }
                if (_yy == 1 && (_xx == -1 || _xx == 1))
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy), obj_gh_fireball_bouncy))
                    {
                        sprite_index = spr_ghost_house_bullet_small;
                        iris = true;
                        speed = 1.75;
                        direction = (30 * irandom(12)) + 15;
                    }
                }
                if (_yy == 3 && _xx == 1)
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy) + 13, obj_gh_fireball_linear))
                    {
                        width = 18;
                        cycle_length = 27;
                    }
                }
                if (_yy == -3 && _xx == -2)
                {
                    with (instance_create(obj_growtangle.x + (_xx * 52) + 15, obj_growtangle.y + (26 * _yy), obj_gh_fireball_linear))
                    {
                        type = 1;
                        width = -18;
                        cycle_length = 27;
                    }
                }
                if (_yy == -3 && _xx == 1)
                {
                    for (var _flip = 1; _flip >= -1; _flip -= 2)
                    {
                        with (instance_create(obj_growtangle.x + (_xx * 52), obj_growtangle.y + (26 * _yy) + (15 * _flip), obj_gh_fireball_linear))
                        {
                            width = -15 * _flip;
                            cycle_length = 27;
                            for (var __flip = 1; __flip >= -1; __flip -= 2)
                                instance_create(x + (__flip * 15), y, obj_ghosthouse_dot);
                        }
                    }
                }
            }
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_nopumpkin_inner;
            image_speed = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 12, obj_gh_bouncebarrier))
        {
            sprite_index = spr_ghost_house_nopumpkin_inner;
            image_speed = 0;
            image_index = 1;
            visible = true;
            image_yscale = 2;
            image_xscale = 2;
            image_blend = merge_color(merge_color(c_green, c_lime, 0.5), c_black, 0.6);
        }
        instance_create_depth(obj_growtangle.x, obj_growtangle.y - 80, -10, obj_ghosthouse_key);
        with (instance_create_depth(obj_growtangle.x + 80, obj_growtangle.y + 54, 10, obj_ghosthouse_lock))
        {
            image_xscale = 2;
            image_yscale = 6;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create(obj_ghosthouse_lock.x + 8, obj_ghosthouse_lock.y - 4, obj_ghosthouse_exit))
        {
            sprite_index = spr_solid_bar_end;
            image_yscale = 7;
        }
    }
}
if (type == 154)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
            instance_create(x, y, obj_darkness_overlay_bullettest);
        obj_growtangle.sprite_index = spr_ghost_house_final;
        obj_growtangle.spr_custom_box = 5173;
        obj_growtangle.mask_index = -1;
        obj_growtangle.y -= 24;
        obj_growtangle.x += 24;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x - 5 - 156;
        obj_heart.y = (obj_growtangle.y - 5) + 106;
        global.turntimer = 999999;
        instance_create(x, y, obj_ghosthouse_cleaner);
        pumpkin_x = obj_growtangle.x + 200;
        pumpkin_y = obj_growtangle.y - 44;
        ticker = 0;
        path = path_add();
        path_set_closed(path, false);
        path_add_point(path, pumpkin_x, pumpkin_y, 150);
        path_add_point(path, pumpkin_x - 128, pumpkin_y, 150);
        path_add_point(path, pumpkin_x - 128, pumpkin_y + 52, 150);
        path_add_point(path, pumpkin_x - 182, pumpkin_y + 52, 150);
        path_add_point(path, pumpkin_x - 182, pumpkin_y + 24, 150);
        path_add_point(path, pumpkin_x - 156, pumpkin_y + 24, 150);
        path_add_point(path, pumpkin_x - 156, pumpkin_y, 150);
        path_add_point(path, pumpkin_x - 210, pumpkin_y, 150);
        path_add_point(path, pumpkin_x - 210, pumpkin_y + 52, 150);
        path_add_point(path, pumpkin_x - 234, pumpkin_y + 52, 150);
        path_add_point(path, pumpkin_x - 234, pumpkin_y - 28, 150);
        path_add_point(path, pumpkin_x - 210, pumpkin_y - 28, 150);
        path_add_point(path, pumpkin_x - 210, pumpkin_y - 48, 150);
        path_add_point(path, pumpkin_x - 265, pumpkin_y - 48, 150);
        path_add_point(path, pumpkin_x - 265, pumpkin_y + 112, 150);
        var __x = pumpkin_x - 262;
        var __y = pumpkin_y + 96;
        var _flip = 1;
        for (_xx = 1; _xx < 10; _xx += 1)
        {
            path_add_point(path, __x + (18 * _xx), __y + (16 * _flip), 100);
            _flip *= -1;
            if (_xx < 9)
                path_add_point(path, __x + (18 * _xx), __y + (16 * _flip), 100);
        }
        path_add_point(path, pumpkin_x - 100, pumpkin_y + 32, 100);
        path_add_point(path, pumpkin_x - 20, pumpkin_y + 32, 100);
        __x = pumpkin_x - 45;
        __y = pumpkin_y + 32;
        _flip = 1;
        for (_yy = 1; _yy < 5; _yy += 1)
        {
            path_add_point(path, __x + (25 * _flip), __y + (19 * _yy), 100);
            _flip *= -1;
            path_add_point(path, __x + (25 * _flip), __y + (19 * _yy), 100);
        }
        path_add_point(path, pumpkin_x - 20, pumpkin_y + 140, 100);
        path_add_point(path, pumpkin_x - 60, pumpkin_y + 140, 100);
        path_add_point(path, pumpkin_x - 60, pumpkin_y + 158, 100);
        path_add_point(path, pumpkin_x - 20, pumpkin_y + 158, 100);
        path_add_point(path, pumpkin_x - 20, pumpkin_y + 172, 100);
        path_add_point(path, pumpkin_x - 132, pumpkin_y + 172, 100);
        path_add_point(path, pumpkin_x - 132, pumpkin_y + 156, 100);
        path_add_point(path, pumpkin_x - 92, pumpkin_y + 156, 100);
        path_add_point(path, pumpkin_x - 92, pumpkin_y + 140, 100);
        path_add_point(path, pumpkin_x - 160, pumpkin_y + 140, 100);
        __x = pumpkin_x - 160;
        __y = pumpkin_y + 158;
        _flip = -1;
        for (_xx = 0; _xx < 7; _xx += 1)
        {
            path_add_point(path, __x - (17 * _xx), __y + (18 * _flip), 100);
            _flip *= -1;
            path_add_point(path, __x - (17 * _xx), __y + (18 * _flip), 100);
        }
        path_add_point(path, pumpkin_x - 296, pumpkin_y + 176, 100);
        path_add_point(path, pumpkin_x - 296, pumpkin_y + 72, 100);
        path_add_point(path, pumpkin_x - 380, pumpkin_y + 72, 100);
        path_add_point(path, pumpkin_x - 380, pumpkin_y + 100, 100);
        path_add_point(path, pumpkin_x - 320, pumpkin_y + 100, 100);
        path_add_point(path, pumpkin_x - 320, pumpkin_y + 86, 100);
        path_add_point(path, pumpkin_x - 355, pumpkin_y + 86, 100);
        path_add_point(path, pumpkin_x - 355, pumpkin_y + 136, 100);
        path_add_point(path, pumpkin_x - 320, pumpkin_y + 136, 100);
        path_add_point(path, pumpkin_x - 380, pumpkin_y + 136, 100);
        path_add_point(path, pumpkin_x - 380, pumpkin_y + 155, 100);
        path_add_point(path, pumpkin_x - 320, pumpkin_y + 155, 100);
        path_add_point(path, pumpkin_x - 320, pumpkin_y + 174, 100);
        path_add_point(path, pumpkin_x - 1000, pumpkin_y + 174, 100);
        with (obj_heart)
        {
            instance_create(x + 4, y - 58, obj_ghosthouse_dot);
            instance_create(x + 34, y - 58, obj_ghosthouse_dot);
            instance_create(x + 64, y - 58, obj_ghosthouse_dot);
            instance_create(x + 64, y - 30, obj_ghosthouse_dot);
            instance_create(x + 64, y - 2, obj_ghosthouse_dot);
            instance_create(x + 64, y + 26, obj_ghosthouse_dot);
            instance_create(x + 252, y + 9, obj_ghosthouse_dot);
            instance_create(x + 287, y + 27, obj_ghosthouse_dot);
            instance_create(x + 322, y + 9, obj_ghosthouse_dot);
        }
        for (_xx = -3; _xx < 3; _xx += 1)
        {
            _flip *= -1;
            var _y = obj_growtangle.y + 112;
            with (instance_create((obj_growtangle.x - 3) + (20 * _xx), _y + (24 * _flip), obj_gh_fireball_hop))
            {
                width = 45 * _flip;
                timer += (pi * (_flip > 0));
                doomed = _flip;
                cycle_length = 65;
                instance_create(x, y, obj_ghosthouse_dot);
            }
        }
        var _xx = -3;
        while (_xx <= 3)
        {
            _flip *= -1;
            var _y = obj_growtangle.y + 49;
            with (instance_create(obj_growtangle.x + 16 + (22 * _xx), _y + (21 * _flip), obj_gh_fireball_hop))
            {
                timer = 1.5707963267948966;
                width = 42 * _flip;
                timer += (pi * (_flip > 0));
                cycle_length = 81;
                doomed = true;
                if ((_xx % 1) != 0)
                {
                    instance_create(x, y - ((4 * width) / 5), obj_ghosthouse_dot);
                    instance_create(x, y - (width / 5), obj_ghosthouse_dot);
                }
                else
                {
                    instance_create(x, _y, obj_ghosthouse_dot);
                }
            }
            _xx += 1.5;
        }
        var _yy = 1;
        while (_yy <= 5)
        {
            _flip *= -1;
            var _y = obj_growtangle.y + 20;
            with (instance_create(obj_growtangle.x + 124, round(_y + 60 + (11 * _yy)), obj_gh_fireball_linear))
            {
                timer = 1.5707963267948966 * _flip;
                width = 60;
                cycle_length = 77;
                deform = false;
                draw_iris = true;
                sprite_index = spr_ghost_house_bullet_small;
            }
            _yy += 1.25;
        }
        for (_yy = 1; _yy <= 5; _yy += 2)
        {
            _flip *= -1;
            var _y = obj_growtangle.y + 20;
            with (instance_create(obj_growtangle.x + 18, (_y - 3) + (11 * _yy), obj_gh_fireball_linear))
            {
                timer = 1.5707963267948966 * _flip;
                width = 90;
                cycle_length = 145;
                deform = false;
                draw_iris = true;
                sprite_index = spr_ghost_house_bullet_small;
            }
        }
        obj_heart.wspeed = global.sp / 2;
        with (instance_create_depth(obj_growtangle.x - 90, obj_growtangle.y + 2, -10, obj_ghosthouse_trigger))
        {
            image_xscale = 2;
            image_yscale = 1;
            visible = false;
            active = false;
            alternate = 2;
            _yy = 0.4;
            while (_yy < 3)
            {
                instance_create(x + (sprite_width / 2) + 6, y - (sprite_height / 4) - (_yy * 24), obj_ghosthouse_dot);
                _yy += 1;
            }
        }
        with (instance_create_depth(obj_growtangle.x - 46, obj_growtangle.y - 80, 11, obj_battlesolid))
        {
            sprite_index = spr_solid_bar_end;
            image_yscale = -3;
            image_blend = merge_color(c_green, c_lime, 0.5);
            image_xscale = 2;
        }
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_final_inner;
            image_speed = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (scr_fire_bullet((obj_growtangle.x - 156) + irandom(8), (obj_growtangle.y + 54) - irandom(8), obj_gh_fireball_bouncy, 45, 1))
        {
            _flip = choose(-1, 1);
            var __flip = choose(-1, -1);
            hspeed = 1 * _flip;
            vspeed = 1 * __flip;
            sprite_index = spr_ghost_house_bullet_small;
            iris = true;
            doomed = false;
        }
        with (scr_fire_bullet((obj_growtangle.x - 98) + irandom(8), (obj_growtangle.y + 54) - irandom(8), obj_gh_fireball_bouncy, 45, 1))
        {
            _flip = choose(-1, 1);
            var __flip = choose(-1, -1);
            hspeed = 1 * _flip;
            vspeed = 1 * __flip;
            doomed = false;
            iris = true;
            sprite_index = spr_ghost_house_bullet_small;
        }
        with (scr_fire_bullet((obj_growtangle.x - 98) + irandom(8), (obj_growtangle.y + 114) - irandom(8), obj_gh_fireball_bouncy, 45, 1))
        {
            _flip = choose(-1, 1);
            var __flip = choose(-1, -1);
            hspeed = 1 * _flip;
            vspeed = 1 * __flip;
            doomed = true;
            iris = true;
            sprite_index = spr_ghost_house_bullet_small;
        }
        with (instance_create_depth(obj_heart.x + 5, obj_heart.y - 29, 12, obj_gh_bouncebarrier))
        {
            visible = true;
            image_angle = 90;
            image_yscale = 3;
            image_xscale = 2;
            image_blend = merge_color(merge_color(c_green, c_lime, 0.5), c_black, 0.6);
        }
        with (instance_create_depth(obj_heart.x + 81, obj_heart.y + 27, 12, obj_gh_bouncebarrier))
        {
            visible = true;
            image_yscale = 3.5;
            image_xscale = 2;
            image_blend = merge_color(merge_color(c_green, c_lime, 0.5), c_black, 0.6);
        }
        for (var _range = 0; _range <= 30; _range += 10)
        {
            with (instance_create_depth(obj_growtangle.x + 155, obj_growtangle.y + 26, -10, obj_gh_fireball_square))
            {
                _flip *= -1;
                vflip = -_flip * (1 - (2 * (_range == 15))) * 1.5;
                width = _range;
                cycle_length = 24 + _range;
            }
        }
        instance_create_depth(obj_growtangle.x - 64, obj_growtangle.y - 90, -10, obj_ghosthouse_key);
        with (instance_create_depth(obj_growtangle.x - 196, obj_growtangle.y + 98, 10, obj_ghosthouse_lock))
        {
            image_xscale = -2;
            image_yscale = 5.5;
            sprite_index = spr_solid_bar_end;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        with (instance_create(obj_ghosthouse_lock.x - 4, obj_ghosthouse_lock.y - 4, obj_ghosthouse_exit))
        {
            sprite_index = spr_solid_bar_end;
            image_yscale = 7;
        }
        show_debug_message(instance_number(obj_ghosthouse_dot));
        if (room == room_bullettest)
        {
            obj_heart.x = obj_ghosthouse_key.x;
            obj_heart.y = obj_ghosthouse_key.y + 30;
        }
    }
}
if (type == 155)
{
    if (!made)
    {
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
        }
        obj_growtangle.sprite_index = spr_ghost_house_lightup;
        obj_growtangle.spr_custom_box = 4707;
        obj_growtangle.mask_index = -1;
        obj_heart.sprite_index = spr_dodgeheart_small;
        obj_heart.mask_index = spr_dodgeheart_small_mask;
        obj_grazebox.sprite_index = spr_grazeappear_small;
        obj_grazebox.mask_index = spr_grazemask_small;
        obj_heart.x = obj_growtangle.x;
        obj_heart.y = obj_growtangle.y + 90;
        global.turntimer = 900;
        with (obj_lightsource_heartlight)
        {
            radius = 60;
            biggerrad = 15;
            supercharged = true;
            with (obj_jackenstein_enemy)
            {
                if (ract)
                    other.radius += 5;
            }
        }
        instance_create(x, y, obj_ghosthouse_cleaner);
        with (instance_create_depth(obj_growtangle.x, obj_growtangle.y, 11, obj_battlesolid))
        {
            sprite_index = spr_ghost_house_lightup_inner;
            image_speed = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_blend = merge_color(c_green, c_lime, 0.5);
        }
        obj_heart.wspeed = global.sp;
        pumpkin_x = obj_growtangle.x;
        pumpkin_y = obj_growtangle.y - 160;
        instance_create_depth(pumpkin_x, pumpkin_y, 8, obj_ghosthouse_jackolantern_merciful);
    }
}
if (type == 156)
{
    if (!made)
    {
        global.turntimer = 420;
        made = true;
        if (room == room_bullettest)
        {
            instance_create(x, y, obj_darkness_overlay_bullettest);
            var mus = mus_play(snd_init("pumpkin_boss.ogg"));
            instance_create_depth(0, 0, -10, obj_ghosthouse_fadein);
        }
        obj_lightsource_heartlight.radius = 52;
        obj_lightsource_heartlight.biggerrad = 16;
        instance_create(obj_growtangle.x, obj_growtangle.y - 110, obj_lightsource_firebar);
        obj_growtangle.image_yscale = 1;
        obj_growtangle.y += 24;
        timer1 = -15;
        timer2 = -15;
        timer3 = 60;
    }
    timer1++;
    timer2++;
    timer3--;
    if (i_ex(obj_jackenstein_enemy))
    {
        if (obj_jackenstein_enemy.sact)
            timer2 += 0.25;
    }
    instance_create(x, y, obj_ghosthouse_cleaner);
    if (timer1 > (8 + irandom(7)))
    {
        timer1 = 0;
        var bulletx = (obj_growtangle.x + random(125)) - 62.5;
        if (irandom(2) == 0)
            bulletx = obj_heart.x + 10;
        scr_fire_bullet((obj_growtangle.x + (irandom(22) * 6)) - 66, (obj_growtangle.y - 180) + random(10), obj_regularbullet, 270, 5, spr_ghost_house_bullet_big, false, true, 10);
    }
    if (timer2 > (5 + irandom(6)))
    {
        timer2 -= 10;
        if ((!irandom(10) && timer3 <= 0) || timer3 < -90)
        {
            timer2 += (60 + irandom(20));
            timer3 = 60;
        }
        var bulletx = (obj_growtangle.x + random(125)) - 62.5;
        repeat (1 + !irandom(3))
            scr_fire_bullet((obj_growtangle.x + (irandom(22) * 6)) - 66, (obj_growtangle.y - 180) + random(10), obj_ghosthouse_dot, 270, 4 + random(5), spr_ghost_house_dot, false, true, 10);
    }
}
if (type == 250)
{
    var starttime = 20;
    var resettime = 20;
    if (!made)
    {
        if (!i_ex(obj_hammer_of_justice_enemy))
        {
            obj_growtangle.x = (camerax() + 320) - 80;
            obj_heart.x = (camerax() + 320) - 80;
        }
        btimer = starttime - 1;
        special = 0;
        made = 1;
    }
    if (btimer == (starttime - 1))
    {
        _yloc = cameray() + 180 + random_range(-60, 60);
        _xloc = ((camerax() + 640) - 160) + random_range(0, 60);
        _hsp = random_range(-11, -13);
        _basev = random(3);
        if (i_ex(obj_growtangle))
        {
            if (_yloc >= obj_growtangle.y)
                _basev *= -1;
        }
    }
    if (btimer >= starttime && (btimer % 1) == 0)
    {
        for (var i = 0; i < 2; i++)
        {
            sinbul[i] = instance_create(_xloc, _yloc, obj_bullet_sin);
            with (sinbul[i])
            {
                var sizefactor = other.special / 10;
                _afterimages = true;
                updateangle = false;
                image_xscale = 2 - sizefactor;
                image_yscale = image_xscale;
                if (sizefactor >= 1.6)
                    active = 0;
                timefactory = 0.7;
                hspeed = other._hsp;
                amplitudex = 0;
                amplitudey = 25;
                if (i == 1)
                    amplitudey *= -1;
                image_angle = 180;
                basevspeed = other._basev;
                if (other.special == 0)
                {
                    sprite_index = spr_spadebullet;
                    updateangle = true;
                    image_xscale = 1;
                    image_yscale = 1;
                }
            }
            scr_bullet_inherit(sinbul[i]);
        }
        special++;
    }
    if (btimer >= (starttime + resettime))
    {
        btimer = 0;
        special = 0;
    }
}
if (type == 300)
{
    if (btimer >= 105)
    {
        if (i_ex(creatorid))
        {
            btimer = 0;
            var _side = choose(-1, 1);
            var _vmirror = 1;
            var _xx;
            switch (_side)
            {
                case 1:
                    _xx = scr_get_box(0);
                    break;
                case -1:
                    _xx = scr_get_box(2);
                    break;
            }
            var _selfoverlap = 0;
            with (obj_cornerpendulumbullet)
            {
                if (sign(x - scr_get_box(4)) == -_side)
                    _selfoverlap++;
            }
            if (_selfoverlap > 0)
                _vmirror = choose(1, -1, -1);
            else if (scr_monsterpop() <= 1)
                _vmirror = choose(1, -1);
            var _yy, _tilt;
            switch (_vmirror)
            {
                case 1:
                    _yy = (scr_get_box(3) - 16) + (_selfoverlap * 16);
                    _tilt = 80 + (_selfoverlap * 30);
                    break;
                case -1:
                    if (scr_monsterpop() <= 1)
                    {
                        _yy = (scr_get_box(1) + 16) - (_selfoverlap * 16);
                        _tilt = 80 + (_selfoverlap * 30);
                    }
                    else
                    {
                        _yy = (scr_get_box(1) + 16) - ((_selfoverlap - 1) * 16);
                        _tilt = 80 + ((_selfoverlap - 1) * 30);
                    }
                    break;
            }
            var _bat = scr_fire_bullet(_xx, _yy, obj_cornerpendulumbullet, 0, 0, spr_pendulum_ball);
            switch (_vmirror)
            {
                case 1:
                    with (_bat)
                    {
                        var _shaftdist = point_distance(x, y, swingpoint_x, swingpoint_y);
                        x = swingpoint_x + lengthdir_x(_shaftdist, 270 - (_tilt * _side));
                        y = swingpoint_y + lengthdir_y(_shaftdist, 270 - (_tilt * _side));
                        vspeed = -3;
                    }
                    break;
                case -1:
                    with (_bat)
                    {
                        vertical_mirroring = -1;
                        swingpoint_y = scr_get_box(3) + 16;
                        swingdistance = point_distance(x, y, swingpoint_x, swingpoint_y);
                        var _shaftdist = point_distance(x, y, swingpoint_x, swingpoint_y);
                        x = swingpoint_x + lengthdir_x(_shaftdist, 90 + (_tilt * _side));
                        y = swingpoint_y + lengthdir_y(_shaftdist, 90 + (_tilt * _side));
                        vspeed = 3;
                    }
                    break;
            }
        }
    }
}
if (type == 450)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 451)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_centipede;
        scr_turntimer(420);
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 452)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_bigshots;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
        instance_create(obj_growtangle.x + 260, obj_growtangle.y, obj_darkshape_blast_tester);
    }
}
if (type == 453)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_desperation_shots;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
        instance_create(obj_growtangle.x + 260, obj_growtangle.y + 0, obj_darkshape_blast_tester);
    }
}
if (type == 454)
{
    if (!made && i_ex(obj_growtangle))
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_bigshots_aimed;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
        instance_create(obj_growtangle.x + 260, obj_growtangle.y + 0, obj_darkshape_blast_tester);
    }
}
if (type == 455)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_centipede_hard;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_turntimer(420);
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 456)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_default_intro;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 457)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_centipede_intro;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_turntimer(420);
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 458)
{
    if (!made && obj_)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_mines;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 459)
{
    if (!made)
    {
        var _titanhandsmanager = instance_create(camerax(), cameray(), obj_titan_battle_hands_manager);
        scr_bullet_inherit(_titanhandsmanager);
        made = true;
    }
}
if (type == 460)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_default_speedup;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 461)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_default_speedup_red;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 462)
{
    if (!made)
    {
        var _titanhandsmanager = instance_create(camerax(), cameray(), obj_titan_battle_hands_manager);
        scr_bullet_inherit(_titanhandsmanager);
        made = true;
        _titanhandsmanager.difficulty = 1;
        with (obj_titan_battle_finger)
            wibbly_cooldown = 11;
    }
}
if (type == 463)
{
    if (!made)
    {
        var _titanhandsmanager = instance_create(camerax(), cameray(), obj_titan_battle_hands_manager);
        scr_bullet_inherit(_titanhandsmanager);
        made = true;
        _titanhandsmanager.difficulty = 2;
        with (obj_titan_battle_finger)
            wibbly_cooldown = 12;
    }
}
if (type == 464)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_centipede_noshapes;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_turntimer(420);
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 465)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_desperation_shots_short;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
        instance_create(obj_growtangle.x + 260, obj_growtangle.y, obj_darkshape_blast_tester);
    }
}
if (type == 466)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_mineguys;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
        instance_create(obj_growtangle.x + 260, obj_growtangle.y, obj_darkshape_blast_tester);
    }
}
if (type == 467)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_darkshape_walls;
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 468)
{
    if (!made)
    {
        with (obj_growtangle)
        {
            maxxscale = 2.125;
            maxyscale = 2.125;
        }
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_default_speedup_red2;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 469)
{
    if (!made)
    {
        with (obj_growtangle)
        {
            maxxscale = 2.25;
            maxyscale = 2.25;
        }
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_default_speedup_red3;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 470)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_centipede_hard;
        if (!creatorid.first_barrage)
        {
            _darkshapemanager.barrage_interval = 3;
            _darkshapemanager.barrage_offset = 5;
            _darkshapemanager.barrage_end = 48;
        }
        scr_turntimer(420);
        scr_bullet_inherit(_darkshapemanager);
        made = true;
    }
}
if (type == 471)
{
    if (sameattacker)
        exit;
    if (!made)
    {
        made = true;
        btimer = 0;
        side = 1;
        offset = 0;
        coat_pop = 2;
        if (scr_monsterpop() > 1)
            coat_pop = 1;
        instance_create(0, 0, obj_coathanger_renderer);
    }
    if ((btimer % 19) == 0)
    {
        offset = irandom_range(-60, 60);
        var circ = 13;
        var turnside = choose(-90, 90);
        for (a = 0; a < circ; a++)
        {
            var cside = 90 + (90 * side);
            spiral = instance_create(obj_growtangle.x + lengthdir_x(128, (cside - 5) + (10 * a) + offset), obj_growtangle.y + lengthdir_y(128, (cside - 5) + (10 * a) + offset), obj_holywater_spiral);
            scr_bullet_inherit(spiral);
            spiral.turnvar = turnside;
            spiral.angled = true;
            spiral = instance_create(obj_growtangle.x + lengthdir_x(128, ((cside + 5) - (10 * a)) + offset), obj_growtangle.y + lengthdir_y(128, ((cside + 5) - (10 * a)) + offset), obj_holywater_spiral);
            scr_bullet_inherit(spiral);
            spiral.turnvar = turnside;
            spiral.angled = true;
        }
        side *= -1;
    }
}
if (type == 472)
{
    if (!made)
    {
        var _darkshapemanager = instance_create(0, 0, obj_darkshape_manager);
        _darkshapemanager.creatorid = creatorid;
        _darkshapemanager.pattern_to_use = _darkshapemanager.pattern_darkshape_final;
        scr_bullet_inherit(_darkshapemanager);
        made = true;
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

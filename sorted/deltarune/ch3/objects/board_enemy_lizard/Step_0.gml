updatetimer++;
if (updatetimer == 2)
{
    updatetimer = 0;
    exit;
}
if (jumpedrecentlytimer > 0)
    jumpedrecentlytimer--;
scr_board_enemy_step_init();
if (dontmove == true && state == "move")
    state = "init";
if (!aggressive)
    dontmove = true;
if (state == "move")
{
    if (movecon == 0 && hurttimer == 0)
    {
        var rand;
        if (lastattack == 4)
            rand = 1;
        else if (type == 2)
            rand = choose(1, 3);
        else if (lastattack == 1)
            rand = choose(1, 2, 3);
        else if (lastattack == 2)
            rand = choose(1, 3);
        else if (lastattack == 3)
            rand = choose(1, 2);
        if (jumpedrecentlytimer > 0)
            rand = choose(1, 2);
        if (obj_board_controller.kris_object.leftdoorway == false && rand == 3)
            rand = 2;
        if (rand == 3)
        {
            for (var i = 0; i < instance_number(obj_board_enemy_lizard); i++)
            {
                enemy[i] = instance_find(obj_board_enemy_lizard, i);
                if (enemy[i].movecon == 3)
                    rand = 1;
            }
        }
        if (rand == 1)
        {
            movedir = choose(0, 1, 2, 3);
            repeat (4)
            {
                if (movedir == 0 && place_meeting(x + 32, y, obj_board_solid))
                    movedir = 1;
                if (movedir == 1 && place_meeting(x, y - 32, obj_board_solid))
                    movedir = 2;
                if (movedir == 2 && place_meeting(x - 32, y, obj_board_solid))
                    movedir = 3;
                if (movedir == 3 && place_meeting(x, y + 32, obj_board_solid))
                    movedir = 0;
            }
            image_speed = 0.1;
        }
        if (rand == 2)
            image_speed = 0.1;
        if (rand == 3)
        {
            with (obj_spawn_pos)
                instance_destroy();
            startx = x;
            starty = y;
            movetimer = 0;
            with (obj_board_enemy_lizard)
                jumpedrecentlytimer = 50;
            image_speed = 0;
            image_index = 1;
        }
        movecon = rand;
        lastattack = rand;
    }
    if (movecon == 1 && hurttimer == 0)
    {
        movetimer++;
        var stop = 0;
        repeat (spd)
        {
            if (stop == 0)
            {
                if (movedir == 0)
                {
                    x += 1;
                    sprite_index = spr_board_lizard_r;
                    if (type == 1)
                        sprite_index = spr_board_lizard_r_alt;
                    if (type == 2)
                        sprite_index = spr_board_lizard_r_jumpy;
                }
                if (movedir == 1)
                    y -= 1;
                if (movedir == 2)
                {
                    x -= 1;
                    sprite_index = spr_board_lizard_l;
                    if (type == 1)
                        sprite_index = spr_board_lizard_l_alt;
                    if (type == 2)
                        sprite_index = spr_board_lizard_l_jumpy;
                }
                if (movedir == 3)
                    y += 1;
                if (place_meeting(x, y, obj_board_solid) || x < 160 || x > 448 || y < 96 || y > 256)
                {
                    if (movedir == 0)
                    {
                        x -= 1;
                        movedir = 2;
                    }
                    else if (movedir == 1)
                    {
                        y += 1;
                        movedir = 3;
                    }
                    else if (movedir == 2)
                    {
                        x += 1;
                        movedir = 0;
                    }
                    else if (movedir == 3)
                    {
                        y -= 1;
                        movedir = 1;
                    }
                }
                if (movedir == 0 || movedir == 2)
                {
                    if ((x % 32) == 0)
                    {
                        movecon = 0;
                        movetimer = 0;
                        stop = 1;
                    }
                }
                if (movedir == 1 || movedir == 3)
                {
                    if ((y % 32) == 0)
                    {
                        movecon = 0;
                        movetimer = 0;
                        stop = 1;
                    }
                }
            }
        }
    }
    if (movecon == 2 && hurttimer == 0)
    {
        movetimer++;
        if ((movetimer % 6) == 0)
        {
            sprite_index = choose(spr_board_lizard_r, spr_board_lizard_l);
            if (type == 1)
                sprite_index = choose(spr_board_lizard_r_alt, spr_board_lizard_l_alt);
            if (type == 2)
                sprite_index = choose(spr_board_lizard_r_jumpy, spr_board_lizard_l_jumpy);
        }
        if (movetimer == 15)
        {
            movecon = 0;
            movetimer = 0;
        }
    }
    if (movecon == 3)
    {
        if (delay <= 1)
            movetimer += 2;
        else
            delay--;
        dontmoveduringhurt = true;
        if (movetimer == 2)
        {
            depth = 100002;
            snd_stop(snd_board_throw);
            snd_play_x(snd_board_throw, 0.7, 0.8);
            var _x = 128;
            var _y = 128;
            for (var i = 0; i < 11; i++)
            {
                for (var ii = 0; ii < 3; ii++)
                {
                    if (!instance_position(_x, _y, obj_board_solid) && !instance_position(_x, _y, obj_spawn_pos))
                        instance_create(_x, _y, obj_spawn_pos);
                    _y += 32;
                }
                _x += 32;
                _y = 128;
            }
            if (type == 2)
            {
                with (obj_spawn_pos)
                {
                    if (distance_to_object(obj_board_controller.kris_object) > 30)
                        instance_destroy();
                }
            }
            for (var i = 0; i < instance_number(obj_spawn_pos); i++)
                pos[i] = instance_find(obj_spawn_pos, i);
            if (i_ex(obj_spawn_pos))
            {
                var b = irandom(instance_number(obj_spawn_pos) - 1);
                with (pos[b])
                    image_blend = c_red;
                targetx = pos[b].x;
                targety = pos[b].y;
                startx = x;
                starty = y;
                if (type == 2)
                {
                    if (startx < targetx)
                        sprite_index = spr_board_lizard_r_jumpy;
                    if (startx > targetx)
                        sprite_index = spr_board_lizard_l_jumpy;
                }
                else if (type == 1)
                {
                    if (startx < targetx)
                        sprite_index = spr_board_lizard_r_alt;
                    if (startx > targetx)
                        sprite_index = spr_board_lizard_l_alt;
                }
                else
                {
                    if (startx < targetx)
                        sprite_index = spr_board_lizard_r;
                    if (startx > targetx)
                        sprite_index = spr_board_lizard_l;
                }
            }
        }
        if (type == 1 && movetimer == 30 && delay <= 0)
            delay = 16;
        if ((type == 1 && delay == 6) || (type == 1 && delay == 12))
        {
            var x_offset = 8;
            if (sprite_index == spr_board_lizard_r_alt)
                x_offset = 24;
            var angle_offset = 0;
            if (delay == 6)
                angle_offset = 30;
            var _spd = 4;
            var _acc = 4;
            if (sprite_index == spr_board_lizard_l_alt || sprite_index == spr_board_lizard_r_alt)
            {
                snd_stop(snd_board_mantle_unknown_b);
                snd_play(snd_board_mantle_unknown_b);
                for (var i = 0; i < 8; i++)
                {
                    var myangle = 45 * i;
                    var bullet = instance_create(x + x_offset + lengthdir_x(8, myangle), y + 7 + lengthdir_y(8, myangle), obj_board_enemy_spear);
                    bullet.direction = myangle + angle_offset;
                    bullet.spd = _spd;
                    bullet.acc = _acc;
                    if ((myangle % 90) == 0)
                    {
                        bullet.image_angle = round(i / 2) * 90;
                        bullet.sprite_index = spr_board_lightningbullet_straight;
                    }
                    else
                    {
                        bullet.sprite_index = spr_board_lightningbullet_diag;
                        bullet.image_angle = round((i - 1) / 2) * 90;
                    }
                }
            }
        }
        if (type > 0 && delay == 0)
            movetimer += 2;
        if (movetimer <= 60)
        {
            fakey = -15 + (sin(movetimer / 19) * 50 * -1);
            x = lerp(startx, targetx, movetimer / 64);
            y = lerp(starty, targety, movetimer / 64);
            y += fakey;
        }
        if (movetimer >= 62)
        {
            with (obj_board_enemy_lizard)
                jumpedrecentlytimer = 50;
            snd_stop(snd_bump);
            snd_play(snd_bump);
            dontmoveduringhurt = false;
            image_index = 0;
            image_speed = 0.1;
            x = targetx;
            y = targety;
            movecon = 0;
            movetimer = 0;
            delay = 0;
        }
    }
}
else
{
    scr_depth_board();
}
scr_board_enemy_sword_collision();
if (state == "die")
{
    image_index = 1;
    dietimer++;
    drop_candy = false;
    if ((dietimer % 2) == 0)
    {
        if (sprite_index == spr_board_lizard_l)
            sprite_index = spr_board_lizard_r;
        else
            sprite_index = spr_board_lizard_l;
    }
    if (dietimer == 28)
    {
        hurttimer = 10;
        hp = 0;
    }
}
scr_board_enemy_hurt_state();
if (hurttimer > 0 && movecon != 0 && movecon != 3)
{
    movetimer = 0;
    movecon = 0;
    dontmoveduringhurt = false;
    image_index = 0;
    image_speed = 0.1;
    targetx = x;
    targety = y;
    delay = 0;
    if (bulletimer > 10)
        bubbletimer = 10;
}
if (hurttimer == 0 && movecon != 3 && type == 0 && state != "die" && obj_board_controller.kris_object.leftdoorway == true)
{
    bulletimer++;
    if ((bulletimer >= 28 && dontmove == 0) || (bulletimer >= 50 && dontmove == 1))
    {
        if (x < obj_board_controller.kris_object.x)
            sprite_index = spr_board_lizard_r;
        if (x > obj_board_controller.kris_object.x)
            sprite_index = spr_board_lizard_l;
        if (sprite_index == spr_board_lizard_l)
            var bullet = instance_create(x + 8, y + 7, obj_board_enemy_pellet);
        if (sprite_index == spr_board_lizard_r)
            var bullet = instance_create(x + 24, y + 7, obj_board_enemy_pellet);
        bulletimer = choose(-50, -25, 0);
    }
}
else
{
    bulletimer = 0;
}
if (sprite_index == spr_board_lizard_r || sprite_index == spr_board_lizard_r_alt || sprite_index == spr_board_lizard_r_jumpy)
    hurt_sprite = spr_board_lizard_r_hurt;
if (sprite_index == spr_board_lizard_l || sprite_index == spr_board_lizard_l_alt || sprite_index == spr_board_lizard_l_jumpy)
    hurt_sprite = spr_board_lizard_l_hurt;
if (movecon != 3)
    scr_depth_board();

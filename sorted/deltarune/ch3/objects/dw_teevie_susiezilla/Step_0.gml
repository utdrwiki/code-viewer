depth = 5000;
var cx = camerax();
var cy = cameray();
if (init == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            other.susie = id;
            other.init = 1;
        }
    }
}
if (sukcon == 0)
{
    if (global.interact == 0)
    {
        var _target = -4;
        with (obj_mainchara)
        {
            var xloc = x + 18;
            var yloc = y + 60;
            var radius = 120;
            _target = collision_rectangle(xloc - radius, yloc - (radius / 2), xloc + radius, yloc + (radius / 2), obj_susiezilla_house_single, 0, 0);
        }
        if (instance_exists(_target))
        {
            if (_target.myhealth > 0)
                sukcon = 1;
        }
        else if (susie.follow == false)
        {
            sukcon = 4;
        }
    }
}
if (sukcon == 1)
{
    susie.follow = false;
    susie.fun = 1;
    targ = instance_nearest(susie.x, susie.y, obj_susiezilla_house_single);
    var side = choose(0, 1);
    var targx = targ.x - 36 - 18;
    var targy = targ.y - 62;
    if (side == 1)
        targx = (targ.x + 36) - 8;
    suwalktarg.x = targx;
    suwalktarg.y = targy;
    sustart.x = susie.x;
    sustart.y = susie.y;
    walktime = scr_returnwait(susie.x, susie.y, suwalktarg.x, suwalktarg.y, 8);
    sukcon = 1.5;
    timer2 = 0;
    suktimer = 0;
}
if (sukcon == 1.5)
{
    if (global.interact == 0)
    {
        timer2++;
        susie.x = lerp(sustart.x, suwalktarg.x, timer2 / walktime);
        susie.y = lerp(sustart.y, suwalktarg.y, timer2 / walktime);
        var facing = point_direction(susie.x, susie.y, suwalktarg.x, suwalktarg.y);
        with (susie)
        {
            facing += 90;
            if (facing > 360)
                facing -= 360;
            facing = round(facing / 90);
            if (facing == 4)
                facing = 0;
            switch (facing)
            {
                case 0:
                    sprite_index = spr_susie_walk_down_dw;
                    break;
                case 1:
                    sprite_index = spr_susie_walk_right_dw;
                    break;
                case 2:
                    sprite_index = spr_susie_walk_up_dw;
                    break;
                case 3:
                    sprite_index = spr_susie_walk_left_dw;
                    break;
            }
            image_index += 0.25;
        }
        if (timer2 >= walktime)
        {
            setxy(suwalktarg.x, suwalktarg.y, susie);
            timer2 = 0;
            sukcon = 2;
            suktimer = 0;
        }
    }
}
if (sukcon == 2)
{
    suktimer++;
    if (suktimer == 1)
    {
        dokick = false;
        susie.fun = 1;
        susie.image_speed = 0;
        susie.image_index = 0;
        if (i_ex(targ))
        {
            if (targ.myhealth > 0)
            {
                if (susie.x < targ.x)
                    susie.sprite_index = spr_susie_right_diagonal_kick_dw;
                else
                    susie.sprite_index = spr_susie_left_diagonal_kick_dw;
                dokick = true;
            }
        }
    }
    if (i_ex(targ))
    {
        if (targ.myhealth > 0 && dokick == true)
        {
            if (suktimer == 5)
                susie.image_index = 1;
            if (suktimer == 10)
                susie.image_index = 2;
            if (suktimer == 11)
            {
                snd_play(snd_wing);
                susie.image_index = 3;
                with (targ)
                {
                    myhealth = 0;
                    scr_shakeobj();
                }
            }
        }
    }
    if (dokick)
    {
        if (suktimer == 12)
            susie.image_index = 4;
    }
    if (suktimer == 18)
    {
        with (targ)
        {
            scr_marker_ext(x, y, sprite_index, 2, 2, 0, image_index, image_blend, depth);
            instance_destroy();
        }
        sukcon = 3;
        suktimer = 0;
    }
}
if (sukcon == 3)
{
    targ = -4;
    targ = instance_nearest(susie.x, susie.y, obj_susiezilla_house_single);
    if (instance_exists(targ))
    {
        var targx = targ.x - 36 - 18;
        var targy = targ.y - 62;
        if (susie.x > targ.x)
            targx = (targ.x + 36) - 8;
        suwalktarg.x = targx;
        suwalktarg.y = targy;
        sustart.x = susie.x;
        sustart.y = susie.y;
        walktime = scr_returnwait(susie.x, susie.y, suwalktarg.x, suwalktarg.y, 8);
    }
    if (!instance_exists(targ))
        walktime = 99;
    else if (targ.x < cx || targ.x > (cx + 640))
        walktime = 99;
    timer2 = 0;
    suktimer = 0;
    if (walktime > 20)
        sukcon = 4;
    else
        sukcon = 1.5;
}
if (sukcon == 4)
{
    if (global.interact == 0)
    {
        with (susie)
        {
            var _s = 
            {
                x: x + 18,
                y: y + 82
            };
            var _k = 
            {
                x: obj_mainchara.x + 18,
                y: obj_mainchara.y + 70
            };
            fun = true;
            if (point_distance(_s.x, _s.y, _k.x, _k.y) > 64)
            {
                var _x = x;
                var _y = y;
                var dir = point_direction(_s.x, _s.y, _k.x, _k.y);
                x += lengthdir_x(8, dir);
                y += lengthdir_y(8, dir);
                var facing = dir;
                facing += 90;
                if (facing > 360)
                    facing -= 360;
                facing = round(facing / 90);
                if (facing == 4)
                    facing = 0;
                switch (facing)
                {
                    case 0:
                        sprite_index = spr_susie_walk_down_dw;
                        break;
                    case 1:
                        sprite_index = spr_susie_walk_right_dw;
                        break;
                    case 2:
                        sprite_index = spr_susie_walk_up_dw;
                        break;
                    case 3:
                        sprite_index = spr_susie_walk_left_dw;
                        break;
                }
                image_index += 0.25;
            }
            else
            {
                follow = true;
                fun = false;
                scr_caterpillar_interpolate();
                other.sukcon = 0;
            }
        }
    }
}
if (nohouses == 0)
{
    if (!i_ex(obj_susiezilla_house_single))
    {
        snd_play(snd_won);
        scr_confetti_ext(cx - 10, cy + 300, 15, 40, 20, 192, 356, 2);
        scr_confetti_ext(cx + 640 + 10, cy + 300, 165, 40, 20, 192, 356, 2);
        nohouses = 1;
        signx = cx + 320;
        with (scr_lerpvar("signy", -400, 60, 40, -3, "out"))
            respectglobalinteract = true;
        timer = 0;
    }
}

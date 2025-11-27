if (con == 0)
{
    timer++;
    if (strongerheal)
    {
        if (timer == 1)
        {
            x = camerax() + 500;
            y = cameray() + 210;
            with (obj_writer)
                instance_destroy();
            snd_play(snd_titan_absorb);
            with (obj_titan_enemy)
                darktimer = 1;
        }
        if (timer > 0 && timer < 90)
        {
            var dir = random(360);
            var dist = 140 + irandom(90);
            var _depth = obj_titan_enemy.depth - (irandom(4) * 6) - 3;
            ball = instance_create_depth(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), _depth, obj_titan_heal_orb);
            ball.strongerheal = true;
            ball = instance_create_depth(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), _depth, obj_titan_heal_orb);
        }
        if (timer == 130)
        {
            snd_play(snd_titan_cure);
            timer = 0;
            con = 1;
        }
    }
    else
    {
        if (timer == 1)
        {
            x = camerax() + 500;
            y = cameray() + 210;
            with (obj_writer)
                instance_destroy();
            snd_loop(snd_titan_absorb);
            with (obj_titan_enemy)
                darktimer = 1;
        }
        if (timer > 0 && timer < 60)
        {
            var dir = random(360);
            var dist = 140 + irandom(50);
            var _depth = obj_titan_enemy.depth - (irandom(4) * 6) - 3;
            ball = instance_create_depth(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), _depth, obj_titan_heal_orb);
        }
        if (timer == 85)
        {
            snd_stop(snd_titan_absorb);
            snd_play_pitch(snd_titan_cure, 0.8);
            timer = 0;
            con = 1;
        }
    }
}
if (con == 1)
{
    timer += 1;
    if (timer == 1)
    {
        with (obj_titan_enemy)
        {
            greenflashtimer = 9;
            global.monsterhp[myself] += other.healamt;
            if (global.monsterhp[myself] > global.monstermaxhp[myself])
                global.monsterhp[myself] = global.monstermaxhp[myself];
            healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
            with (healamt)
            {
                delay = 8;
                type = 3;
            }
            if (i_ex(healamt))
            {
                healamt.damage = other.healamt;
                healamt.depth -= 20;
            }
            var _index = 0;
            repeat (40)
            {
                star = instance_create(camerax() + 400 + random(200), cameray() + 40 + random(300), obj_marker);
                with (star)
                {
                    image_angle = random(360);
                    depth = -10;
                    image_xscale = 2;
                    image_yscale = 2;
                    image_alpha = 2;
                    image_speed = 0.25;
                    hspeed = 2 - random(2);
                    vspeed = -3 - random(2);
                    friction = 0.2;
                    if ((_index % 4) == 3)
                    {
                        sprite_index = spr_darkshape_transform;
                        image_blend = c_black;
                        friction = 0.4;
                    }
                    else
                    {
                        sprite_index = spr_sparestar_anim;
                        image_blend = c_lime;
                    }
                }
                _index++;
            }
        }
    }
    if (timer >= 15)
    {
        con = 2;
        timer = 0;
    }
}
if (con == 2)
{
    with (obj_marker)
    {
        if (sprite_index == spr_sparestar_anim || sprite_index == spr_darkshape_transform)
        {
            image_angle -= 10;
            image_alpha -= 0.1;
            if (image_alpha <= 0)
                instance_destroy();
        }
    }
}
if (con == 2)
{
    with (obj_titan_fg_draw)
    {
        if (alpha2 > 0)
            alpha2 -= 0.1;
        if (alpha2 < 0)
            alpha2 = 0;
    }
    timer += 1;
    if (timer >= 30)
    {
        with (obj_writer)
            instance_destroy();
        con = 3;
        if (notext == false)
        {
        }
    }
}
if (con == 3)
{
    global.turntimer = 999;
    if (!instance_exists(obj_writer))
    {
        global.fc = 0;
        con = 0;
        timer = 0;
        global.turntimer = 2;
        instance_destroy();
        with (obj_darkener)
            darken = 0;
    }
}

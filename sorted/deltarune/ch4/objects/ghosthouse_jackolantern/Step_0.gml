timer++;
var jp = variable_global_exists("lang") && global.lang == "ja";
with (linked_block)
{
    x = other.x;
    y = other.y;
}
if (timer == -20 && squish != 1)
    scr_lerpvar("squish", 0, 1, 15, -1, "out");
if (timer == 1)
{
    if (obj_heart.sprite_index != spr_dodgeheart_long)
    {
        if (obj_growtangle.sprite_index == spr_ghost_house_yourtutu)
        {
            if (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)
            {
                with (instance_create(camerax() + 160, cameray() + 15, obj_takingtoolong_short))
                    tutu = 1;
                if (jp)
                    snd_play_volume(snd_tutu_fast_jp, 0.8);
                else
                    snd_play_volume(snd_tutu_fast, 0.8);
                timer = 60;
            }
            else
            {
                with (instance_create(camerax() + 160 + (4 * jp), cameray() + 15, obj_takingtoolong))
                    tutu = 1;
                if (jp)
                    snd_play_volume(snd_taking_tutu_jp, 0.8);
                else
                    snd_play_volume(snd_taking_tutu, 0.8);
            }
        }
        else if (polite != 0)
        {
            if (abs(polite > 1) && (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))
            {
                if (jp)
                    snd_play_volume(snd_taking_too_long_fast_jp, 0.8);
                else
                    snd_play_volume(snd_taking_too_long_fast, 0.8);
                with (instance_create(camerax() + 160, cameray() + 24, obj_takingtoolong))
                    text_speed = 2.5;
                timer = 65 - (10 * polite);
            }
            else
            {
                if (polite == 1)
                {
                    if (jp)
                        mysnd = snd_play_volume(snd_alt_takingtoolong_jp, 0.8);
                    else
                        mysnd = snd_play_volume(snd_alt_takingtoolong, 0.8);
                }
                else if (jp)
                {
                    snd_play_volume(snd_takingtoolongtoolong_jp, 0.8);
                }
                else
                {
                    snd_play_volume(snd_takingtoolongtoolong, 0.8);
                }
                with (instance_create(camerax() + 160 + (18 * jp), cameray() + 24, obj_takingtoolong))
                {
                    polite = other.polite;
                    if (other.polite < 0)
                        polite = 2;
                }
            }
        }
        else if (small)
        {
            with (instance_create_depth(camerax() + 460, cameray() + 50, -1000, obj_takingtoolong))
            {
                small = true;
                snd_play(snd_small_jackolantern_appear);
            }
        }
        else if (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)
        {
            if (jp)
                snd_play_volume(snd_taking_too_long_fast_jp, 0.8);
            else
                snd_play_volume(snd_taking_too_long_fast, 0.8);
            with (instance_create(camerax() + 160, cameray() + 24, obj_takingtoolong))
                text_speed = 2.5;
            timer = 60;
        }
        else
        {
            if (jp)
                snd_play_volume(snd_taking_too_long_jp, 0.8);
            else
                snd_play_volume(snd_taking_too_long, 0.8);
            instance_create(camerax() + 160 + (18 * jp), cameray() + 24, obj_takingtoolong);
        }
    }
    else if (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)
    {
        with (instance_create(x - 145, y + 80, obj_yourlong))
            alt = true;
        if (jp)
            snd_play(snd_long_only_jp);
        else
            snd_play(snd_long_only);
        scr_lerpvar("image_xscale", 1, 3, 10, -2, "out");
        timer = 60;
    }
    else
    {
        instance_create(x - 145, y + 80, obj_yourlong);
        if (jp)
            snd_play(snd_your_long_jp);
        else
            snd_play(snd_your_long);
    }
}
if (timer == 10 && polite == 1 && (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))
{
    sound_stop(mysnd);
    with (obj_takingtoolong)
        instance_destroy();
    with (instance_create_depth(obj_dbulletcontroller.pumpkin_x, obj_dbulletcontroller.pumpkin_y, depth, obj_ghosthouse_jackolantern))
        politer = true;
    with (obj_ghosthouse_trigger)
        instance_destroy();
    explosion = instance_create(x, y, obj_animation);
    explosion.image_xscale = 2;
    explosion.image_yscale = 2;
    snd_play(snd_badexplosion);
    explosion.sprite_index = spr_realisticexplosion;
    instance_destroy();
}
if (timer > 70)
{
    with (obj_battlesolid)
    {
        if (sprite_index == spr_ghost_house_the_chimney)
            image_angle += 1;
    }
}
if (timer == 30)
{
    if (obj_heart.sprite_index == spr_dodgeheart_long)
        scr_lerpvar("image_xscale", 1, 3, 10, -2, "out");
}
if (small && timer == 45 && (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))
    timer = 175;
if (small && timer == 130)
{
    if (jp)
        snd_play_volume(snd_taking_too_long_small_jp, 0.8);
    else
        snd_play_volume(snd_taking_too_long_small, 0.8);
}
if (small && timer == 18 && (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat))
{
    if (jp)
        snd_play(snd_taking_too_long_small_fast_jp);
    else
        snd_play(snd_taking_too_long_small_fast);
}
if (timer == ((75 + (115 * small) + (30 * (abs(polite) > 1 && !politer))) - (10 * (polite == 1))) && tutu < 2)
{
    if (small)
        snd_play(snd_jackolantern_laugh_small);
    else if (polite != 1)
        snd_play(snd_jackolantern_laugh);
    image_speed = 0.5;
    alarm[0] = 70;
    if (obj_growtangle.sprite_index == spr_ghost_house_yourtutu || small)
        obj_heart.wspeed = global.sp * (2/3);
    else
        obj_heart.wspeed = global.sp / (1 + (2 * other.polite));
    if (!instance_exists(obj_jackenstein_enemy) || !obj_jackenstein_enemy.scaredycat)
    {
        with (obj_gh_fireball_bouncy)
        {
            hspeed = store_hspd * (1 + (0.5 * !(other.polite || other.small)));
            vspeed = store_vspd * (1 + (0.5 * !(other.polite || other.small)));
            image_speed = store_image * (1 + (0.5 * !(other.polite || other.small)));
            active = true;
        }
        with (obj_gh_fireball_linear)
        {
            rate = base_rate * (1 + (0.5 * !(other.polite || other.small)));
            active = true;
        }
        with (obj_gh_fireball_mobius)
        {
            rate = base_rate * (1 + (0.5 * !(other.polite || other.small)));
            active = true;
        }
        with (obj_gh_fireball_hop)
        {
            rate = base_rate * (1 + (0.5 * !(other.polite || other.small)));
            active = true;
        }
        with (obj_gh_fireball_square)
        {
            path_speed = 1 + (0.25 * !(other.polite || other.small));
            active = true;
        }
    }
    with (obj_ghosthouse_jackolantern)
    {
        if (id != other.id)
        {
            path_speed = store_speed;
            pause = false;
            other.polite = -3.75;
        }
    }
    if (polite < 0)
        obj_heart.wspeed = global.sp * 1.25;
    if (politer)
        polite = -2.8;
    if (polite)
    {
        with (obj_battlesolid)
        {
            if (mask_index == spr_no_mask)
                image_blend = merge_color(merge_color(c_green, c_lime, 0.5), c_black, 0.6);
            else
                image_blend = merge_color(c_green, c_lime, 0.5);
        }
    }
    else
    {
        with (obj_battlesolid)
        {
            if (mask_index == spr_no_mask && sprite_index != spr_ghost_house_yourtutu_inner)
                image_blend = merge_color(c_red, c_black, 0.6);
            else
                image_blend = c_red;
        }
        with (obj_gh_bouncebarrier)
            image_blend = merge_color(c_red, c_black, 0.6);
    }
    if (obj_growtangle.sprite_index == spr_ghost_house_chimney)
    {
        with (obj_lightsource_battle)
        {
            scr_lerpvar("x", x, obj_growtangle.x - 110, 30, -1, "out");
            scr_lerpvar("y", y, obj_growtangle.y - 108, 42, -1, "out");
            scr_lerpvar("radius", radius, radius + 16, 24, 3, "out");
            scr_lerpvar("radius_2", radius_2, radius_2 + 8, 24, 3, "out");
        }
        with (instance_create_depth(obj_growtangle.x - 108, obj_growtangle.y - 90, obj_darkness_overlay.depth - 1, obj_gh_exitsign))
        {
            image_angle = 90;
            visible = true;
            image_xscale = 2;
            image_yscale = 2;
        }
    }
    with (obj_battlesolid)
    {
        if (sprite_index == spr_ghost_house_the_chimney)
        {
            scr_doom(id, 75);
            gravity = 0.1;
            mask_index = spr_no_mask;
        }
    }
    if (small)
        instance_create(x, y, obj_gh_pumpkinspawner);
    else if (!move_directly)
        path_start(path, 1 + (0.2 * (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)), path_action_stop, true);
}
if (timer > (75 + (110 * small)) && tutu < 2 && !fully_aggro && polite != 2)
{
    if (move_directly)
    {
        x += lengthdir_x(direct_spd, direct_dir);
        y += lengthdir_y(direct_spd, direct_dir);
        direct_spd = scr_approach_curve(direct_spd, 3, 52 + adjust_delay);
        if (abs(angle_difference(direct_dir, scr_at_player(x, y))) > 60 || direct_adjust)
        {
            if (direct_adjust > 0)
            {
                direct_adjust--;
            }
            else
            {
                direct_adjust = ceil(adjust_delay);
                adjust_delay *= 0.9;
            }
            direct_spd = 0.99;
            if (direct_adjust > 0)
                direct_dir += (angle_difference(scr_at_player(x, y), direct_dir) / direct_adjust);
        }
    }
    else
    {
        if (!pause && !(polite && place_meeting(x, y, obj_heart)))
            path_speed = scr_approach_curve(path_speed, 3.5 - (2 * polite), 30 + (40 * power(path_speed, 0.8)) + (10 * polite));
        if (point_distance(x, y, path_get_point_x(path, point_reached), path_get_point_y(path, point_reached)) < path_speed && polite >= 0 && obj_growtangle.sprite_index != spr_ghost_house_yourtutu)
        {
            point_reached++;
            path_speed = sqrt(path_speed);
        }
    }
    if (tutu != 1 && obj_growtangle.sprite_index == spr_ghost_house_yourtutu && x > (obj_heart.x - 24) && obj_heart.y < (obj_growtangle.y + 40))
        event_user(0);
}
if (fully_aggro)
{
    friction = 0.65 + (0.25 * hits);
    if (point_distance(x, y, obj_heart.x + 5, obj_heart.y + 5) > 30 || speed < 5)
    {
        direction = (scr_at_player(x, y) - 15) + random(30);
        speed = 13 + (4 * hits);
        if (speed_scale && hits == 0 && point_distance(x, y, obj_heart.x + 5, obj_heart.y + 5) < 240)
            speed -= logn(3, 240 - point_distance(x, y, obj_heart.x + 5, obj_heart.y + 5));
    }
}
if (tutu == 2)
{
    if (timer == 180)
    {
        depth = obj_heart.depth - 2;
        image_index = 1;
        draw_hand = 1;
        with (obj_your_tutu)
        {
            x = other.x + 6;
            y = other.y + 10;
            visible = true;
            depth = obj_heart.depth - 1;
            scr_lerpvar("x", x, obj_heart.x + 1, 30, 1, "out");
            scr_lerpvar("y", y, obj_heart.y - 10, 30, 1, "out");
        }
    }
    if (timer == 211)
    {
        with (obj_your_tutu)
            scr_lerpvar("y", y, obj_heart.y + 5, 25, 1, "out");
    }
    if (timer == 240)
    {
        with (instance_create(camerax() + 160, cameray() + 12, obj_takingtoolong))
            tutu = 2;
        if (jp)
            sound_play(snd_your_tutu_jp);
        else
            sound_play(snd_your_tutu);
        with (obj_your_tutu)
            attached = true;
        draw_hand = 2;
        image_index = 2;
        with (obj_battlesolid)
            image_blend = merge_color(c_green, c_lime, 0.5);
        scr_lerpvar("hand_x", hand_x, x, 15, 1, "out");
        scr_lerpvar("hand_y", hand_y, y + 20, 15, 1, "out");
    }
    if (timer == 335)
    {
        depth = obj_heart.depth + 1;
        hspeed = 3.75 * sign(x - obj_heart.x);
        draw_hand = false;
        image_xscale = -1;
        var _flip = sign(y - (obj_growtangle.y + 80));
        with (instance_create(obj_heart.x - (32 * _flip), obj_growtangle.y + 76 + (20 * _flip), obj_ghosthouse_trigger))
        {
            sprite_index = spr_solid_bar;
            tutu = 3;
            image_xscale = -3 * _flip;
            image_yscale = 5;
            visible = false;
        }
        with (instance_create(clamp(obj_heart.x + 150, obj_ghosthouse_lock.x - 65, obj_ghosthouse_lock.x + 15), obj_ghosthouse_lock.y, obj_ghosthouse_trigger))
        {
            tutu = 3;
            image_xscale = 4;
            image_yscale = 4;
            sprite_index = spr_solid_bar_end;
            visible = false;
            scr_lerpvar("x", x, obj_ghosthouse_lock.x - 65, 150);
        }
    }
    if (timer == 350)
    {
        obj_heart.wspeed = global.sp / 2;
        if (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)
            obj_jackenstein_enemy.scaredycat = scaredy;
    }
}

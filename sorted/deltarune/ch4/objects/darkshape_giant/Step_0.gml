if (!i_ex(obj_darkshape_manager))
    exit;
if (fast_timer)
{
    timer += fastval;
    fast_timer--;
}
else
{
    timer++;
}
true_timer++;
if (!irandom(20))
    fast_timer = 10 + irandom(6);
if (image_alpha != 1)
{
    image_alpha = scr_approach(image_alpha, 1, 0.05);
    if (image_alpha == 1)
        direction = scr_at_player(x, y);
}
if (image_alpha == 1)
{
    xscale = image_alpha;
    yscale = image_alpha;
}
else
{
    xscale = image_alpha + ((timer % 2) * 0.1);
    yscale = image_alpha + ((timer % 2) * 0.1);
}
if (light < 1)
{
    x_goal = scr_get_box(4) + lengthdir_x(box_distance, box_angle);
    y_goal = scr_get_box(5) + lengthdir_y(box_distance, box_angle);
    x = x_goal;
    y = y_goal;
    x = x_goal + (sin(true_timer * 0.1) * 4);
    y = y_goal + (cos(true_timer * 0.065) * 4);
    chase_heart();
}
if (phase == "sudden reposition")
{
    phase_timer++;
    if (phase_timer == 15)
        scr_lerpvar("box_distance", 220, 180, 10, 2, "in");
    if (phase_timer == 25)
    {
        with (scr_lerpvar("box_distance", 180, 100, 32, 2, "out"))
            movevar = true;
        with (scr_lerpvar("box_angle", box_angle, box_angle + choose(240, -240), 32, 2, "out"))
            movevar = true;
    }
    if (phase_timer > 25 && phase_timer < 47)
    {
        scr_shakescreen(4, 4);
        scr_afterimagefast();
    }
    if (((phase_timer - 25) % 4) == 0 && (phase_timer - 25) > 4 && (phase_timer - 25) < 28)
    {
        snd_play(snd_knight_jump_quick, 1, 0.5);
        with (scr_fire_bullet(x, y, obj_darkshape_spawnbullet, point_direction(x, y, xprevious, yprevious), 4))
        {
            depth = other.depth - 1;
            scr_lerpvar("speed", 4, 2, 12);
            image_xscale = 2;
            image_yscale = 2;
            scr_lerpvar("image_xscale", 2, 1.25, 12);
            scr_lerpvar("image_yscale", 2, 1.25, 12);
        }
    }
    if ((phase_timer - 25) == 32)
    {
        image_s = 0.25;
        image_d = 0;
        image_max = 4;
        image_min = 2;
        phase_timer = 0;
        phase = "stalk";
    }
}
if (phase == "stalk")
{
    phase_timer++;
    if (phase_timer == -15)
    {
        image_s = 0.25;
        image_d = 0;
        image_max = 4;
        image_min = 2;
        phase_timer = 15;
    }
    if (phase_timer == 15)
        shakeme = true;
    if (phase_timer == 40 || phase_timer == 60 || phase_timer == 80)
    {
        shakeme = false;
        snd_play(snd_knight_jump_quick, 1, 0.5);
        image_min = 0;
        image_max = 4;
        image_d = 2.99;
        image_s = -0.5;
        var times = 3;
        if (phase_timer == 60)
            times = 5;
        for (var a = 0; a < times; a++)
        {
            with (scr_fire_bullet(x, y, obj_darkshape_spawnbullet, (scr_at_player(x, y) - (15 * (times - 1))) + (30 * a), 8))
            {
                target = 4;
                damage = 90;
                if ((a % 2) != 0)
                    blank = true;
                var speed_mod = abs(a - (times * 0.5)) * 1.5;
                depth = other.depth - 1;
                scr_lerpvar("speed", 8 - speed_mod, 5 - (speed_mod * 0.65), 12);
                image_xscale = 2;
                image_yscale = 2;
                scr_lerpvar("image_xscale", 2, 1.25, 12);
                scr_lerpvar("image_yscale", 2, 1.25, 12);
            }
        }
    }
    if (phase_timer == 50 || phase_timer == 70 || phase_timer == 90)
    {
        image_d = 2;
        image_s = 0.25;
        image_max = 4;
        image_min = 2;
    }
    if (phase_timer == 120)
    {
        phase_timer = 0;
        phase = "encircle";
    }
}
if (phase == "encircle")
{
    phase_timer++;
    if (phase_timer == 1)
    {
        light_treshold *= 0.5;
        with (scr_lerpvar("box_angle", box_angle, box_angle + choose(-120, 120), 24, 1, "out"))
            movevar = true;
    }
    if (phase_timer == 40)
    {
        phase_timer = 0;
        phase = "stalk";
    }
}
if (phase == "death")
{
    phase_timer++;
    audio_sound_pitch(deathrattle, audio_sound_get_pitch(deathrattle) - 0.02);
    big_shrink = scr_approach(big_shrink, 0, 0.020833333333333332);
    var randir = irandom(360);
    with (instance_create_depth(x + lengthdir_x(32, randir), y + lengthdir_y(32, randir), depth + 2, obj_particle_generic))
    {
        image_xscale *= 2;
        image_yscale *= 2;
        sprite_index = spr_ring_particle1;
        image_blend = c_white;
        direction = point_direction(other.x, other.y, x, y);
        speed = 2 + random(6);
        shrink_rate = 0.15 + random(0.1);
    }
    if (phase_timer == 16 || phase_timer == 32)
    {
        scr_lerpvar("x", x, x + lengthdir_x(50, death_dir), 12, 1, "out");
        scr_lerpvar("y", y, y + lengthdir_y(50, death_dir), 12, 1, "out");
        death_dir += choose(-100, 100);
        with (instance_create_depth(x, y, depth, obj_bulletparent))
        {
            image_xscale = 0.25;
            image_yscale = 0.25;
            sprite_index = spr_finisher_explosion;
            image_index = 2;
            image_speed = 0.5;
            image_blend = c_gray;
            scr_lerpvar("image_xscale", 0.25, 1.25, 8);
            scr_lerpvar("image_yscale", 0.25, 1.25, 8);
            scr_script_delayed(instance_destroy, 8);
        }
    }
    if (phase_timer == 48)
    {
        snd_play(snd_explosion);
        scr_shakescreen();
        repeat (16)
        {
            randir = irandom(360);
            with (instance_create_depth(x + lengthdir_x(32, randir), y + lengthdir_y(32, randir), depth + 2, obj_particle_generic))
            {
                image_xscale *= (2 + random(1));
                image_yscale *= (1 - random(0.25));
                sprite_index = spr_ring_particle1;
                image_blend = c_white;
                direction = point_direction(other.x, other.y, x, y);
                image_angle = direction;
                speed = 8 + random(6);
                shrink_rate = 0.075 + random(0.05);
            }
        }
        with (instance_create_depth(x, y, depth, obj_battle_marker))
        {
            var bb = irandom(4);
            destroyoncomplete = true;
            sprite_index = spr_titan_shockwave_bullet_explosion;
            image_index = 0;
            image_speed = 1;
            image_alpha = 1;
            image_angle = irandom(360);
            image_xscale = 1;
            image_yscale = 0.5;
        }
        with (instance_create_depth(x, y, depth, obj_battle_marker))
        {
            var bb = irandom(4);
            destroyoncomplete = true;
            sprite_index = spr_titan_shockwave_bullet_explosion;
            image_index = 0;
            image_speed = 0.75;
            image_alpha = 1;
            image_angle = irandom(360);
            image_xscale = 1.5;
            image_yscale = 0.75;
        }
        with (instance_create_depth(x, y, depth, obj_battle_marker))
        {
            var bb = irandom(4);
            destroyoncomplete = true;
            sprite_index = spr_titan_shockwave_bullet_explosion;
            image_index = 0;
            image_speed = 0.5;
            image_alpha = 1;
            image_angle = irandom(360);
            image_xscale = 2;
            image_yscale = 1;
        }
        instance_destroy();
        global.turntimer = 30;
    }
}
image_d = clamp(image_d, image_min, image_max);
image_d += image_s;
if (image_d >= image_max)
    image_d -= (image_max - image_min);
if (image_d < 0)
{
    image_d = 0;
    image_s = 0;
}
image_index = image_d;
light_damage = scr_approach(light_damage, 0, 0.04);

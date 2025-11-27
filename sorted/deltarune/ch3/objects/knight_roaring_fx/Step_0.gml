gigatimer++;
if (shudder)
    shudder--;
var px = x + (sprite_width * 0.42);
var py = y + (sprite_height * 0.5);
if (whiteout)
{
    whiteout_counter = scr_approach(whiteout_counter, 1, 0.020833333333333332);
    if (state != "roaring")
    {
        repeat (2 + irandom(2))
        {
            var randdir = irandom(360);
            var dist = 40 + irandom(240);
            var randsize = 0.25 + random(0.75);
            with (instance_create(px + lengthdir_x(dist, randdir), py + lengthdir_y(dist, randdir), obj_particle_generic))
            {
                image_xscale = randsize;
                image_yscale = randsize;
                direction = point_direction(x, y, px, py);
                image_angle = direction;
                scr_lerpvar("speed", 4, 16 + irandom(8), 32, 1, "in");
                scr_lerpvar("image_xscale", image_xscale, image_xscale * 16, 32, 1, "in");
                scr_lerpvar("image_yscale", image_yscale, image_xscale * 0.5, 32, 1, "in");
            }
        }
    }
    with (obj_particle_generic)
    {
        if (point_distance(x, y, px, py) <= 32)
            instance_destroy();
    }
}
if (state == "intro")
{
    timer++;
    if (timer == 16)
        instance_create(px, py, obj_knight_crush);
    if (timer == 24)
    {
        whiteout = true;
        var stretch = snd_play(snd_knight_stretch);
        audio_sound_pitch(stretch, 0.75);
    }
    if (timer == 8)
        shudder = 999;
    if (timer == 32)
        shudder = 999;
    if (timer == 64)
    {
        state = "roaring";
        timer = -20;
    }
}
if (state == "roaring")
{
    timer++;
    if (timer == 16 && !attack_speed)
        bar = 24;
    if ((timer % 3) == 0 && attack_speed)
    {
        scr_afterimage_grow();
        with (instance_create(px + irandom_range(-30, 30), py + irandom_range(-30, 30), obj_afterimage_screen))
        {
            faderate = 0.05;
            draw_end = true;
        }
        if (i_ex(obj_growtangle) && !irandom(4))
        {
            with (instance_create_depth(scr_get_box(2), scr_get_box(1) + irandom(scr_get_box(5)), 0, obj_particle_generic))
            {
                direction = 180;
                speed = 8 + random(4);
                alarm[0] = 32;
                shrink_rate = 0.01 + random(0.02);
                image_blend = c_green;
                var _rand = 1 + random(1);
                image_xscale = _rand;
                image_yscale = _rand;
            }
        }
    }
    if (timer == (24 - attack_speed))
    {
        if (attack_speed == 0)
        {
            sprite_index = spr_roaringknight_pose_ol;
            image_index = 0;
            image_speed = 0.5;
            snd_play(snd_knight_roar);
            whiteout = false;
            with (obj_particle_generic)
                instance_destroy();
            with (obj_growtangle)
            {
                scr_lerpvar("x", x, x - 60, 32, 1, "out");
                scr_script_delayed(scr_lerpvar, 32, "x", x - 60, x - 100, 240);
            }
            scr_script_repeat(instance_create, 8, 2, px, py, 46);
            with (instance_create_depth(px, py, depth, obj_knight_circle))
            {
                r = 255;
                g = 255;
                b = 255;
                draw_in_box = false;
            }
        }
        else
        {
            var raar = snd_play(snd_knight_puff);
            audio_sound_pitch(raar, 0.15);
        }
        if (createbullets == true)
        {
            random_aim = irandom(360);
            for (a = 0; a < density; a++)
            {
                var speedmod = 0.85 + abs(sin(degtorad((((360 / density) * a) + (random_aim * 7) + (180 / density)) - (5 * spin))) * 0.15);
                with (scr_fire_bullet(px, py, obj_regularbullet, (((360 / density) * a) + (random_aim * 7) + (180 / density)) - (5 * spin), 18 * speedmod, spr_roaring_fire2))
                {
                    scr_lerpvar("speed", 18 * speedmod, 8, 20, 1, "out");
                    image_xscale = 0;
                    image_yscale = 3;
                    scr_lerpvar("image_xscale", 0, 1, 8, 1, "out");
                    scr_lerpvar("image_yscale", 3, 1, 8, 1, "out");
                    anglechange = 6 * other.spin;
                    scr_lerpvar("anglechange", 6 * other.spin, 0, 40, 1, "out");
                }
            }
        }
    }
    if (timer == (28 - attack_speed))
    {
        if (createbullets == true)
        {
            for (a = 0; a < density; a++)
            {
                var speedmod = 0.85 + abs(sin(degtorad(((360 / density) * a) + (random_aim * 7))) * 0.15);
                with (scr_fire_bullet(px, py, obj_regularbullet, ((360 / density) * a) + (random_aim * 7), 18 * speedmod, spr_roaring_fire2))
                {
                    scr_lerpvar("speed", 18 * speedmod, 8, 28, 1, "out");
                    image_xscale = 0;
                    image_yscale = 2;
                    scr_lerpvar("image_xscale", 0, 0.5, 8, 1, "out");
                    scr_lerpvar("image_yscale", 2, 0.5, 8, 1, "out");
                    anglechange = 6 * other.spin;
                    scr_lerpvar("anglechange", 6 * other.spin, 0, 40, 1, "out");
                }
                speedmod = 0.85 + abs(sin(degtorad(((360 / density) * a) + (random_aim * 7) + 10)) * 0.15);
                with (scr_fire_bullet(px, py, obj_regularbullet, ((360 / density) * a) + (random_aim * 7) + 10, 16 * speedmod, spr_roaring_fire2))
                {
                    scr_lerpvar("speed", 16 * speedmod, 6, 28, 1, "out");
                    image_xscale = 0;
                    image_yscale = 2;
                    scr_lerpvar("image_xscale", 0, 0.5, 8, 1, "out");
                    scr_lerpvar("image_yscale", 2, 0.5, 8, 1, "out");
                    anglechange = 6 * other.spin;
                    scr_lerpvar("anglechange", 6 * other.spin, 0, 40, 1, "out");
                }
                speedmod = 0.85 + abs(sin(degtorad((((360 / density) * a) + (random_aim * 7)) - 10)) * 0.15);
                with (scr_fire_bullet(px, py, obj_regularbullet, (((360 / density) * a) + (random_aim * 7)) - 10, 16 * speedmod, spr_roaring_fire2))
                {
                    scr_lerpvar("speed", 16 * speedmod, 6, 28, 1, "out");
                    image_xscale = 0;
                    image_yscale = 2;
                    scr_lerpvar("image_xscale", 0, 0.5, 8, 1, "out");
                    scr_lerpvar("image_yscale", 2, 0.5, 8, 1, "out");
                    anglechange = 6 * other.spin;
                    scr_lerpvar("anglechange", 6 * other.spin, 0, 40, 1, "out");
                }
            }
        }
        spin *= -1;
        counter++;
        attack_speed = scr_approach(attack_speed, 14, 1);
        if ((counter % 3) == 0)
            density = scr_approach(density, 6, 1);
        if (counter < 30)
            timer = 0;
    }
    roarendtimer++;
    if (roarendtimer >= roarendtimermax)
        instance_destroy();
}

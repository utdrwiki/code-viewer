with (obj_heart)
{
    if (x < camerax())
        x = camerax();
    if (x > ((camerax() + camerawidth()) - 20))
        x = (camerax() + camerawidth()) - 20;
    if (y < cameray())
        y = cameray();
    if (y > (cameray() + cameraheight()))
        y = (cameray() + cameraheight()) - 20;
}
if (jumpimages)
    scr_afterimagefast();
timer++;
if (line_timer > -1)
    line_timer++;
bobble_count += bobble_freq;
if (timer == 30)
{
    with (obj_growtangle)
    {
        scr_lerpvar("image_xscale", image_xscale, 2560 / sprite_width, 160, 1, "out");
        scr_lerpvar("image_yscale", image_yscale, 1920 / sprite_height, 160, 1, "out");
    }
}
if (timer == 80)
{
    scr_lerpvar("fake_alpha", 0, 1, 48, 1, "out");
    scr_lerpvar("fake_y", 24, 88, 48, 2, "out");
}
if (timer >= 120 && intensity < 3.75 && (timer % 3) == 0)
{
    with (scr_afterimage_grow())
    {
        sprite_index = spr_roaringknight_front_filled;
        image_alpha = 0.01;
        image_xscale = 2.2 + (min(other.timer - 116, 18) * 0.15);
        image_yscale = 2.2 + (min(other.timer - 116, 18) * 0.15);
        visible = false;
        xrate = 0;
        yrate = 0;
        fade = 0;
        scr_lerpvar("image_xscale", image_xscale, image_xscale * 1.2, 2, 1, "out");
        scr_lerpvar("image_yscale", image_yscale, image_yscale * 1.2, 2, 1, "out");
        scr_script_delayed(scr_lerpvar, 2, "image_xscale", image_xscale * 1.2, 2, 14, 1, "out");
        scr_script_delayed(scr_lerpvar, 2, "image_yscale", image_yscale * 1.2, 2, 14, 1, "out");
        scr_lerpvar("image_alpha", 0.01, 0.35, 16, 1, "in");
        destroytime = 24;
    }
}
with (obj_afterimage_grow)
{
    x = camerax() + other.fake_x;
    y = ((cameray() + other.fake_y + (sin(other.bobble_count * 0.1) * other.bobble_amp)) - 10) + 55;
}
if (timer == 118)
    scr_script_delayed(scr_lerpvar, 16, "ball_darkness", 0, 1, 32, 1, "out");
if (timer == 132)
    sound = snd_play_pitch(snd_knight_stretch, 0.1);
if (timer > 132 && sound != -4)
    audio_sound_pitch(sound, audio_sound_get_pitch(sound) + 0.000535);
var star_angle1 = 0;
var star_angle2 = 0;
var star_angle3 = 0;
if (timer > 128)
{
    intensity = scr_approach(intensity, 4, 0.008);
    if (roaring_timer < 1)
    {
        if (intensity < 4)
        {
            ball_speed = intensity * 3;
            if (intensity < 3.75)
                player_suck = scr_approach(player_suck, 1, 0.1625);
        }
    }
    player_suck = scr_approach(player_suck, 0, 0.15);
    if (i_ex(obj_heart))
    {
        var tempdir = point_direction(obj_heart.x + 10, obj_heart.y + 10, camerax() + fake_x, cameray() + fake_y + 55);
        obj_heart.x += lengthdir_x(player_suck, tempdir);
        obj_heart.y += lengthdir_y(player_suck, tempdir);
    }
    attack_timer++;
    if ((timer % 3) == 0 && intensity < 3.9)
    {
        with (instance_create(camerax() + fake_x + irandom_range(-30, 30), cameray() + fake_y + 55 + irandom_range(-30, 30), obj_afterimage_screen))
        {
            faderate = 0.1 / other.intensity;
            draw_end = true;
            xrate = -0.01;
            yrate = -0.01;
        }
    }
    if (intensity == 3.66)
    {
        scr_script_delayed(scr_lerpvar, 16, "ball_darkness", 1, 0, 32, 1, "out");
        with (instance_create_depth(camerax() + fake_x, cameray() + fake_y + 55, depth, obj_knight_circle))
        {
            r = 0;
            g = 0;
            b = 0;
            r_goal = 255;
            g_goal = 255;
            b_goal = 255;
            fade_time = 48;
            circle_size = 480;
            size_goal = 0;
            growth = 10;
            scr_lerpvar(r_goal, 0, 255, 48, 0, "out");
            scr_lerpvar(g_goal, 0, 255, 48);
            scr_lerpvar(b_goal, 0, 255, 48, 1, "out");
            scr_script_delayed(instance_destroy, 48);
            draw_in_box = false;
            visible = false;
        }
    }
    if (intensity == 3.74 && knight_sprite == 664)
    {
        knight_sprite = 4961;
        knight_sprite_image = 0;
        knight_sprite_speed = 0;
        scr_script_delayed(scr_lerpvar, 8, "knight_sprite_image", 0, 4, 16);
        scr_script_delayed(scr_lerpvar, 8, "fake_alpha", 1, 0, 32);
    }
    if (timer >= 136 && intensity < 3.75)
    {
        if ((timer % 1) == 0)
        {
            var randangle = irandom(360);
            var randdistance = 480 + irandom(80);
            with (instance_create(camerax() + fake_x + lengthdir_x(randdistance, randangle), cameray() + fake_y + 55 + lengthdir_y(randdistance, randangle), obj_particle_generic))
            {
                not_outbound = false;
                sprite_index = spr_pixel_white_front;
                direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                image_angle = direction;
                image_xscale = 16;
                image_yscale = 0.5;
                scr_lerpvar("image_xscale", 320, 2, 16);
                scr_lerpvar("image_yscale", 2, 0.1, 16);
                scr_lerpvar("image_alpha", 1, 0.5, 16);
                scr_lerpvar("x", x, camerax() + other.fake_x, 8, 1, "out");
                scr_lerpvar("y", y, cameray() + other.fake_y + 55, 8, 1, "out");
                timer = 18;
            }
        }
    }
    if (attack_timer == 4)
    {
        rand_dist = 600;
        starcount_p1++;
        var _spinspeed = choose(-1, 1);
        if (starcount_p1 == 1 && intensity < 3.7)
        {
            if (intensity >= 2.7)
            {
                rand_angle += 9;
                star_angle1 = rand_angle;
                var _o = 0;
                repeat (2)
                {
                    with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, star_angle1 + _o), cameray() + fake_y + lengthdir_y(rand_dist, star_angle1 + _o), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
                    {
                        wall_destroy = false;
                        destroyonhit = false;
                        bottomfade = false;
                        spinspeed = 1;
                        visible = false;
                        image_index = 0;
                        image_speed = 0;
                        image_xscale = 2;
                        image_yscale = 2;
                        direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                        speed = 16;
                        friction = -0.1;
                    }
                    _o += 180;
                }
            }
            else
            {
                rand_angle += 32;
                repeat (6)
                {
                    rand_angle += 60;
                    with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, rand_angle), cameray() + fake_y + lengthdir_y(rand_dist, rand_angle), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
                    {
                        wall_destroy = false;
                        destroyonhit = false;
                        bottomfade = false;
                        spinspeed = 1;
                        visible = false;
                        image_index = 0;
                        image_speed = 0;
                        image_xscale = 2;
                        image_yscale = 2;
                        direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                        speed = 8 + other.intensity;
                        friction = -0.1;
                    }
                }
            }
        }
        if (starcount_p1 == 3 || intensity >= 2.7)
            starcount_p1 = 0;
        star_angle1 = -1;
        star_angle2 = -1;
        star_angle3 = -1;
        if (star_angle1 != -1)
        {
            with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, star_angle1), cameray() + fake_y + lengthdir_y(rand_dist, star_angle1), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
            {
                wall_destroy = false;
                destroyonhit = false;
                bottomfade = false;
                spinspeed = 1;
                visible = false;
                image_index = 0;
                image_speed = 0;
                image_xscale = 2;
                image_yscale = 2;
                direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                speed = 8;
                if (other.intensity >= 2.7)
                    speed = 15;
                friction = -0.1;
            }
        }
        if (star_angle2 != -1 && intensity < 2.7)
        {
            with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, star_angle2), cameray() + fake_y + lengthdir_y(rand_dist, star_angle2), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
            {
                wall_destroy = false;
                destroyonhit = false;
                bottomfade = false;
                spinspeed = _spinspeed;
                visible = false;
                image_index = 0;
                image_speed = 0;
                image_xscale = 2;
                image_yscale = 2;
                direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                speed = 8;
                if (other.intensity >= 2.7)
                    speed = 15;
                friction = -0.1;
            }
        }
        if (star_angle3 != -1 && intensity < 2.7)
        {
            with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, star_angle3), cameray() + fake_y + lengthdir_y(rand_dist, star_angle3), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
            {
                wall_destroy = false;
                destroyonhit = false;
                bottomfade = false;
                spinspeed = _spinspeed;
                visible = false;
                image_index = 0;
                image_speed = 0;
                image_xscale = 2;
                image_yscale = 2;
                direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                speed = 8;
                if (other.intensity >= 2.7)
                    speed = 15;
                friction = -0.1;
            }
        }
        if (intensity < 2.7 && star_angle1 != -1)
        {
            var _rand = random(120);
            with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, star_angle1 + 45 + _rand), cameray() + fake_y + lengthdir_y(rand_dist, star_angle1 + 45 + _rand), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
            {
                wall_destroy = false;
                destroyonhit = false;
                bottomfade = false;
                spinspeed = 1;
                visible = false;
                image_index = 0;
                image_speed = 0;
                image_xscale = 2;
                image_yscale = 2;
                direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                speed = 9;
                friction = -0.1;
            }
            with (scr_fire_bullet(camerax() + fake_x + lengthdir_x(rand_dist, star_angle1 - 45 - _rand), cameray() + fake_y + lengthdir_y(rand_dist, star_angle1 - 45 - _rand), obj_knight_roaring_star, 0, 0, spr_knight_bullet_star))
            {
                wall_destroy = false;
                destroyonhit = false;
                bottomfade = false;
                spinspeed = 1;
                visible = false;
                image_index = 0;
                image_speed = 0;
                image_xscale = 2;
                image_yscale = 2;
                direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
                speed = 9;
                friction = -0.1;
            }
        }
        if (intensity >= 3 && intensity < 4)
        {
            with (obj_knight_roaring_star)
            {
                if (x < (camerax() - 60))
                    x = camerax() - 60;
                if (x > (camerax() + camerawidth() + 60))
                    x = camerax() + camerawidth() + 60;
                if (y < (cameray() - 60))
                    y = cameray() - 60;
                if (y > (cameray() + cameraheight() + 60))
                    y = cameray() + cameraheight() + 60;
            }
        }
        attack_timer = floor(-1 + intensity);
    }
}
if (intensity == 4)
{
    roaring_timer++;
    if (roaring_timer < 169)
    {
        if (roaring_timer == 9)
        {
            scr_lerpvar("knight_sprite_image", 4, 6, 4);
            fake_alpha = 1;
            player_suck = min(player_suck, -6);
            ball_speed = -32;
            ball_darkness = 1;
            scr_lerpvar("bobble_freq", 1, 3, 8);
            snd_play(snd_knight_roar);
            scr_script_repeat(instance_create, 8, 2, camerax() + fake_x, cameray() + fake_y + 55, 46);
            with (instance_create_depth(camerax() + fake_x, cameray() + fake_y + 55, depth, obj_knight_circle))
            {
                r = 255;
                g = 255;
                b = 255;
                draw_in_box = false;
                visible = false;
            }
            for (a = 0; a < 8; a++)
            {
                with (scr_fire_bullet(camerax() + fake_x, cameray() + fake_y + 55, obj_knight_roaring_star, a * 45, 8.5 + random(2), spr_knight_bullet_star))
                {
                    visible = false;
                    wall_destroy = false;
                    bottomfade = false;
                    destroyonhit = false;
                    image_xscale = 0.1;
                    image_yscale = 0.1;
                    scr_lerpvar("image_xscale", 0.1, 1.2, 32);
                    scr_lerpvar("image_yscale", 0.1, 1.2, 32);
                }
            }
        }
        if (roaring_timer == 15)
        {
            sprite_index = spr_roaringknight_front_roar;
            image_speed = 0.5;
            knight_sprite = 219;
            knight_sprite_image = 0;
            knight_sprite_speed = 0.5;
        }
        if (roaring_timer >= 9)
            player_suck = min(player_suck, -3);
        if ((roaring_timer % 3) == 0)
        {
            with (instance_create(camerax() + fake_x + irandom_range(-30, 30), cameray() + fake_y + 55 + irandom_range(-30, 30), obj_afterimage_screen))
            {
                xrate = 0.015;
                yrate = 0.015;
                faderate = 0.025;
                draw_end = true;
            }
        }
        if (roaring_timer > 15 && (roaring_timer % 5) == 0)
        {
            var starsound = snd_play_pitch(snd_stardrop, 0.5);
            snd_volume(starsound, 0.5, 0);
            rand_angle += (60 + irandom(10));
            starcount_p2++;
            star_angle1 = point_direction(camerax() + fake_x, cameray() + fake_y + 55, obj_heart.x, obj_heart.y);
            star_angle1 = rand_angle;
            star_angle2 = rand_angle + 20;
            star_angle3 = rand_angle - 20;
            if (star_angle1 != -1)
            {
                with (scr_fire_bullet(camerax() + fake_x, cameray() + fake_y + 55, obj_knight_roaring_star, star_angle1, 6.5 + random(2), spr_knight_bullet_star))
                {
                    visible = false;
                    wall_destroy = false;
                    bottomfade = false;
                    destroyonhit = false;
                    image_xscale = 0.1;
                    image_yscale = 0.1;
                    scr_lerpvar("image_xscale", 0.1, 1.6, 32);
                    scr_lerpvar("image_yscale", 0.1, 1.6, 32);
                }
            }
            if (star_angle2 != -1)
            {
                with (scr_fire_bullet(camerax() + fake_x, cameray() + fake_y + 55, obj_knight_roaring_star, star_angle2, 8.5 + random(2), spr_knight_bullet_star))
                {
                    visible = false;
                    wall_destroy = false;
                    bottomfade = false;
                    destroyonhit = false;
                    image_xscale = 0.1;
                    image_yscale = 0.1;
                    scr_lerpvar("image_xscale", 0.1, 1.6, 32);
                    scr_lerpvar("image_yscale", 0.1, 1.6, 32);
                }
            }
            if (star_angle3 != -1)
            {
                with (scr_fire_bullet(camerax() + fake_x, cameray() + fake_y + 55, obj_knight_roaring_star, star_angle3, 8.5 + random(2), spr_knight_bullet_star))
                {
                    visible = false;
                    wall_destroy = false;
                    bottomfade = false;
                    destroyonhit = false;
                    image_xscale = 0.1;
                    image_yscale = 0.1;
                    scr_lerpvar("image_xscale", 0.1, 1.6, 32);
                    scr_lerpvar("image_yscale", 0.1, 1.6, 32);
                }
            }
        }
    }
    if (roaring_timer == 181)
    {
        colorize = 6;
        scr_lerpvar("player_suck", player_suck, 0, 24);
        scr_lerpvar("ball_speed", ball_speed, 1, 24);
        scr_lerpvar("bobble_freq", 3, 1, 16);
        sprite_index = spr_roaringknight_front_flourish;
        image_index = 0;
        image_speed = 0;
        knight_sprite = 4961;
        knight_sprite_speed = 0;
        scr_lerpvar("knight_sprite_image", 5.99, 0, 12);
        with (obj_knight_roaring_star)
        {
            friction = 0.5;
            ds_list_add(other.bullet_list, id);
        }
    }
    if (roaring_timer >= 182 && ds_list_size(bullet_list))
    {
        var bul = ds_list_find_value(bullet_list, 0);
        if (i_ex(bul))
        {
            with (bul)
                con = 1;
        }
        ds_list_delete(bullet_list, 0);
    }
    if (roaring_timer == 275)
    {
        sprite_index = spr_roaringknight_front_slash;
        knight_sprite = 4319;
        scr_lerpvar("knight_sprite_image", 0, 2, 8);
        scr_lerpvar("image_index", 0, 2, 8);
        scr_lerpvar("bobble_amp", 4, 0, 24);
        line_timer = 0;
        scr_lerpvar("r", 128, 255, 16);
        scr_lerpvar("g", 128, 0, 16);
        scr_lerpvar("b", 128, 0, 16);
    }
    if (roaring_timer == 299)
    {
        x = camerax() + fake_x;
        y = cameray() + fake_y + 20;
        with (obj_growtangle)
        {
            image_xscale = 0;
            image_yscale = 0;
        }
        scr_lerpvar("knight_sprite_image", 2, 5, 6);
        scr_lerpvar("image_index", 2, 5, 6);
        do_fake_screen = true;
        snd_play(snd_knight_cut);
        var slashid;
        with (instance_create((camerax() + (camerawidth() * 0.5)) - lengthdir_x(-160, 117), (cameray() + (cameraheight() * 0.5)) - lengthdir_y(-160, 117), obj_roaringknight_slash))
        {
            direction = 117;
            image_xscale = 4;
            image_angle = direction;
            width *= 4;
            slashid = id;
            slashdir = -1;
        }
        scr_bullet_inherit(slashid);
        with (slashid)
            event_user(0);
        jumpimages = true;
        scr_lerpvar("y", y, y + 40, 16, 1, "out");
        scr_script_delayed(scr_lerpvar, 16, "y", y + 40, y - 320, 24, 1, "in");
    }
    if (roaring_timer == 363)
    {
        jumpimages = false;
        x = creatorid.x;
        obj_knight_enemy.siner2 = 0;
        obj_knight_enemy.y = obj_knight_enemy.ystart + (cos(obj_knight_enemy.siner2 / 8) * 8);
        y = obj_knight_enemy.y;
        sprite_index = spr_knight_warp;
        image_index = 5;
        image_speed = 0;
        scr_lerpvar("image_index", 5, 8, 8);
    }
    if (roaring_timer == 375)
    {
        with (obj_knight_enemy)
            image_alpha = 1;
        with (obj_growtangle)
        {
            growcon = 3;
            timer = 0;
        }
        global.turntimer = -1;
    }
}
if (roaring_timer < 1)
{
    with (obj_knight_roaring_star)
    {
        if (other.roaring_timer < 180)
        {
            image_xscale = 0.0058823529411764705 * point_distance(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
            image_yscale = 0.0058823529411764705 * point_distance(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
            if (image_xscale < 0.2)
                image_xscale = 0.2;
            if (image_yscale < 0.2)
                image_yscale = 0.2;
            direction = point_direction(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55);
            x += lengthdir_x(speed * 0.625 * (1 / other.intensity), direction + (90 * spinspeed));
            y += lengthdir_y(speed * 0.625 * (1 / other.intensity), direction + (90 * spinspeed));
        }
        if (point_distance(x, y, camerax() + other.fake_x, cameray() + other.fake_y + 55) < 12)
            instance_destroy();
    }
}

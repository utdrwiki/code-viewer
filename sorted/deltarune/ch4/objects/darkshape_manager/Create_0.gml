instance_create(0, 0, obj_darkshape_light_aura);
aim_var = 0;
creatorid = -4;
dark_count = 0;
basic_shapes = true;
only_centipedes = true;
noise_played = false;
ominous_loop = snd_loop(snd_organ_enemy_loop_temp);
audio_sound_gain(ominous_loop, 0, 0);
audio_sound_pitch(ominous_loop, 0.25);
ominous_volume = 0;
ominous_decline = true;
angery = true;
timer = 17;
timer_alt = 35;
timer_alt_goal = 36;
speedup_timer = 0;
random_offset = irandom(360);
spawn_counter = 0;
if (i_ex(obj_heart))
    depth = obj_heart.depth + 1;
its_time = false;
star_list = ds_list_create();
barrage_offset = 40;
barrage_interval = 40;
barrage_end = 64;
phase_difficulty = 1;
havecreatedcentipedes = false;

pattern_default = function()
{
    if (!noise_played)
    {
        snd_loop(snd_spawn_attack);
        noise_played = true;
    }
    if ((timer % 12) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        if ((spawn_counter % 5) == 4)
        {
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_redshape);
            newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_heart.x + 10, obj_heart.y + 10);
            newbullet.image_angle = newbullet.direction;
        }
        else
        {
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        }
        spawn_counter++;
    }
};

pattern_default_speedup_red = function()
{
    if (!noise_played)
    {
        snd_loop(snd_spawn_attack);
        noise_played = true;
    }
    if ((timer % 12) == 2)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        spawn_counter++;
        if ((spawn_counter % 8) != 4)
        {
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        }
        else
        {
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_redshape);
            newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_heart.x + 10, obj_heart.y + 10);
            newbullet.image_angle = newbullet.direction;
        }
    }
};

pattern_default_speedup_red2 = function()
{
    phase_difficulty = 2;
    if (!noise_played)
    {
        snd_loop(snd_spawn_attack);
        noise_played = true;
    }
    if ((timer % 12) == 2)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        spawn_counter++;
        var newbullet;
        if ((spawn_counter % 3) != 2)
        {
            newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
            if ((spawn_counter % 5) == 0)
            {
                newbullet.sprite_index = spr_darkshape_evolving_animated;
                newbullet.shrink_sprite = spr_darkshape_evolving;
                newbullet.light_rate *= 0.65;
                newbullet.speed_max *= 0.65;
            }
        }
        else
        {
            newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_redshape);
            newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_heart.x + 10, obj_heart.y + 10);
            newbullet.image_angle = newbullet.direction;
        }
        newbullet.pushback_radius = 54;
    }
};

pattern_default_speedup_red3 = function()
{
    phase_difficulty = 3;
    if (!noise_played)
    {
        snd_loop(snd_spawn_attack);
        noise_played = true;
    }
    if ((timer % 8) == 2 && instance_number(obj_darkshape) < 20)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        spawn_counter++;
        var newbullet;
        if ((spawn_counter % 2) == 0)
        {
            newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        }
        else
        {
            newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
            if (irandom(1))
            {
                newbullet.sprite_index = spr_darkshape_evolving_animated;
                newbullet.shrink_sprite = spr_darkshape_evolving;
                newbullet.light_rate *= 0.65;
                newbullet.speed_max *= 0.65;
            }
            else
            {
                newbullet.sprite_index = spr_darkshape_desperate_animated;
                newbullet.shrink_sprite = spr_darkshape_desperate;
                newbullet.fastval = 3;
                newbullet.light_rate *= 0.7;
            }
        }
        newbullet.speed_max *= 1.1;
        newbullet.pushback_radius = 58;
    }
};

pattern_default_speedup = function()
{
    if (!noise_played)
    {
        snd_loop(snd_spawn_attack);
        noise_played = true;
    }
    timer_alt++;
    speedup_timer++;
    if ((timer % 16) == 0)
    {
        timer_alt -= floor((timer_alt_goal * 0.5) + random(timer_alt_goal));
        timer_alt_goal = scr_approach(timer_alt_goal, 20, 4);
        var tempdir = random_offset + radtodeg(tan(speedup_timer * 0.0375));
        if (!irandom(8))
            tempdir += 180;
        var tempdist = 120 + irandom(50);
        if ((spawn_counter % 5) == 4)
        {
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_redshape);
            newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_heart.x + 10, obj_heart.y + 10);
            newbullet.image_angle = newbullet.direction;
        }
        else
        {
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        }
        spawn_counter++;
    }
};

pattern_centipede = function()
{
    phase_difficulty = 2;
    if (timer == 20 || timer == 62)
    {
        var tempdir = irandom(360);
        var tempdist = 120 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape_centipede_head);
        newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_growtangle.x, obj_growtangle.y) + choose(-80, 80);
        newbullet.image_angle = newbullet.direction;
        newbullet.segment_max = 5;
        newbullet.segment_length = 80;
        with (newbullet)
            event_user(0);
        havecreatedcentipedes = true;
    }
    if ((timer % 20) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        with (newbullet)
        {
            sprite_index = spr_darkshape_directed_small_animated;
            shrink_sprite = spr_darkshape_directed_small;
            light_rate *= 2.5;
            speed_max *= 1.25;
            updateimageangle = true;
        }
    }
};

pattern_centipede_noshapes = function()
{
    if (timer == 20 || timer == 62)
    {
        var tempdir = irandom(360);
        var tempdist = 120 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape_centipede_head);
        newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_growtangle.x, obj_growtangle.y) + choose(-80, 80);
        newbullet.image_angle = newbullet.direction;
        newbullet.segment_length = 50;
        with (newbullet)
            event_user(0);
        havecreatedcentipedes = true;
    }
    if ((timer % 28) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        with (newbullet)
        {
            sprite_index = spr_darkshape_directed_small_animated;
            shrink_sprite = spr_darkshape_directed_small;
            light_rate *= 2.5;
            speed_max *= 1.25;
            updateimageangle = true;
        }
    }
};

pattern_centipede_hard = function()
{
    if (timer == 20 || timer == 62)
    {
        var tempdir = irandom(360);
        var tempdist = 120 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape_centipede_head);
        newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_growtangle.x, obj_growtangle.y) + choose(-80, 80);
        newbullet.image_angle = newbullet.direction;
        newbullet.segment_length = 60;
        newbullet.segment_max = 4;
        with (newbullet)
            event_user(0);
        havecreatedcentipedes = true;
    }
    if ((timer % 12) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        with (newbullet)
        {
            sprite_index = spr_darkshape_directed_small_animated;
            shrink_sprite = spr_darkshape_directed_small;
            light_rate *= 2.5;
            speed_max *= 1.25;
            updateimageangle = true;
        }
    }
};

pattern_bigshots = function()
{
    if ((timer % 10) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        spawn_counter++;
        newbullet.image_xscale = 0.85;
        newbullet.image_yscale = 0.85;
        newbullet.scalefactor = 0.85;
        if (timer > 125)
            timer -= 96;
    }
    if (timer == 48)
        snd_play(snd_sneo_overpower, 1, 0.35);
    if (timer < 80 && timer > 48)
    {
        var cone_angle = 180 + irandom_range(-60, 60);
        var cone_distance = 60 + irandom(240);
        var cone_speed = 8 + irandom(8);
        with (obj_darkshape_blast_tester)
        {
            with (instance_create(x + 40 + lengthdir_x(cone_distance, cone_angle), y + lengthdir_y(cone_distance, cone_angle), obj_bulletparent))
            {
                image_speed = cone_speed / 5;
                image_angle = point_direction(x, y, other.x, other.y);
                sprite_index = spr_chargeup_particle;
                image_xscale = 2;
                image_yscale = 0.25;
                image_blend = c_gray;
                scr_lerpvar("image_xscale", image_xscale, 0, cone_speed);
                scr_lerpvar("image_yscale", 0.25, 0.125, cone_speed);
                scr_lerpvar("x", x, other.x, cone_speed, 1, "in");
                scr_lerpvar("y", y, other.y, cone_speed, 1, "in");
                scr_script_delayed(instance_destroy, cone_speed - 1);
            }
        }
    }
    if (timer == 66 || timer == 96)
    {
        with (obj_titan_enemy)
        {
            chargecon = 1;
            chargetimer = 0;
            chargetimermax = 30;
            chargeshakex = 0;
        }
    }
    if (timer == 96 || timer == 126)
    {
        snd_play_pitch(snd_explosion_mmx3, 0.65);
        scr_shakescreen();
        with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, 180, 13))
        {
            scr_script_delayed(scr_sonic_boom, 1, 0);
            scr_script_delayed(scr_sonic_boom, 5, 0);
            scr_script_delayed(scr_sonic_boom, 9, 0);
        }
    }
};

pattern_bigshots_aimed = function()
{
    var phaser = 0;
    with (obj_titan_enemy)
    {
        if (phase >= 4)
            phaser = 1;
        if (phase >= 6)
            phaser = 2;
    }
    if ((timer % 10) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        spawn_counter++;
        newbullet.image_xscale = 0.85;
        newbullet.image_yscale = 0.85;
        newbullet.scalefactor = 0.85;
    }
    if (timer > (126 + (phaser * 8)))
        timer -= 96;
    if (timer == 48)
    {
        snd_play(snd_sneo_overpower, 1, 0.35);
        with (obj_titan_enemy)
        {
            chargecon = 1;
            chargetimer = 0;
            chargetimermax = 48;
            chargeshakex = 0;
        }
    }
    if (timer < 80 && timer > 48)
    {
        var cone_angle = 180 + irandom_range(-60, 60);
        var cone_distance = 60 + irandom(240);
        var cone_speed = 8 + irandom(8);
        with (obj_darkshape_blast_tester)
        {
            with (instance_create(x + lengthdir_x(cone_distance, cone_angle), y + lengthdir_y(cone_distance, cone_angle), obj_bulletparent))
            {
                image_speed = cone_speed / 5;
                image_angle = point_direction(x, y, other.x, other.y);
                sprite_index = spr_chargeup_particle;
                image_xscale = 2;
                image_yscale = 0.25;
                image_blend = c_gray;
                scr_lerpvar("image_xscale", image_xscale, 0, cone_speed);
                scr_lerpvar("image_yscale", 0.25, 0.125, cone_speed);
                scr_lerpvar("x", x, other.x, cone_speed, 1, "in");
                scr_lerpvar("y", y, other.y, cone_speed, 1, "in");
                scr_script_delayed(instance_destroy, cone_speed - 1);
            }
        }
    }
    if (timer == 112)
    {
        with (obj_titan_enemy)
        {
            chargecon = 1;
            chargetimer = 0;
            chargetimermax = 14;
            chargeshakex = 0;
        }
    }
    if (timer == 96 || (timer == 104 && phaser) || (timer == 112 && phaser > 1) || timer == 126 || (timer == 134 && phaser) || (timer == 142 && phaser > 1))
    {
        if (timer == 96 || timer == 126)
            aim_var = scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y);
        snd_play_pitch(snd_explosion_mmx3, 0.65);
        scr_shakescreen();
        with (obj_titan_enemy)
            chargecon = 2;
        with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, aim_var, 13))
        {
            scr_script_delayed(scr_sonic_boom, 1, direction);
            scr_script_delayed(scr_sonic_boom, 5, direction);
            scr_script_delayed(scr_sonic_boom, 9, direction);
            image_angle = direction;
            xmod = 1.25;
            ymod *= 0.75;
            if (global.tempflag[96] > 3)
                scr_lerpvar("speed", 18, 10.5, 6);
            else
                scr_lerpvar("speed", 18, 12, 6);
            scr_lerpvar("xmod", xmod, 1, 6);
            scr_lerpvar("ymod", ymod, 1, 6);
            if (other.timer != 96 && other.timer != 126)
                leavetrails = false;
        }
    }
};

pattern_bigshots_easy = function()
{
    if ((timer % 15) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        spawn_counter++;
        newbullet.image_xscale = 0.85;
        newbullet.image_yscale = 0.85;
        newbullet.scalefactor = 0.85;
        if (timer > 125)
            timer -= 96;
    }
    if (timer == 48)
        snd_play(snd_sneo_overpower, 1, 0.35);
    if (timer < 80 && timer > 48)
    {
        var cone_angle = 180 + irandom_range(-60, 60);
        var cone_distance = 60 + irandom(240);
        var cone_speed = 8 + irandom(8);
        with (obj_darkshape_blast_tester)
        {
            with (instance_create(x + 40 + lengthdir_x(cone_distance, cone_angle), y + lengthdir_y(cone_distance, cone_angle), obj_bulletparent))
            {
                image_speed = cone_speed / 5;
                image_angle = point_direction(x, y, other.x, other.y);
                sprite_index = spr_chargeup_particle;
                image_xscale = 2;
                image_yscale = 0.25;
                image_blend = c_gray;
                scr_lerpvar("image_xscale", image_xscale, 0, cone_speed);
                scr_lerpvar("image_yscale", 0.25, 0.125, cone_speed);
                scr_lerpvar("x", x, other.x, cone_speed, 1, "in");
                scr_lerpvar("y", y, other.y, cone_speed, 1, "in");
                scr_script_delayed(instance_destroy, cone_speed - 1);
            }
        }
    }
    if (timer == 66)
    {
        with (obj_titan_enemy)
        {
            chargecon = 1;
            chargetimer = 0;
            chargetimermax = 30;
            chargeshakex = 0;
        }
    }
    if (timer == 96)
    {
        snd_play_pitch(snd_explosion_mmx3, 0.65);
        scr_shakescreen();
        with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, 180, 13))
        {
            scr_script_delayed(scr_sonic_boom, 1, direction);
            scr_script_delayed(scr_sonic_boom, 5, direction);
            scr_script_delayed(scr_sonic_boom, 9, direction);
        }
    }
};

pattern_default_intro = function()
{
    if (!noise_played)
    {
        snd_loop(snd_spawn_attack);
        noise_played = true;
    }
    if ((timer % 24) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        spawn_counter++;
        newbullet.image_xscale = 0.85;
        newbullet.image_yscale = 0.85;
        newbullet.scalefactor = 0.85;
    }
};

pattern_centipede_intro = function()
{
    if (timer == 20 || timer == 62)
    {
        var tempdir = irandom(360);
        var tempdist = 120 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape_centipede_head);
        newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_growtangle.x, obj_growtangle.y) + choose(-80, 80);
        newbullet.image_angle = newbullet.direction;
        with (newbullet)
            event_user(0);
        havecreatedcentipedes = true;
    }
};

pattern_desperation_shots = function()
{
    if ((timer % 10) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
    }
    if (timer == 48)
    {
        snd_play(snd_sneo_overpower, 1, 0.35);
        var extra_spicy = snd_play(snd_pullback, 1, 0.15);
        sound_pitch_time(extra_spicy, 1, 300);
        with (obj_titan_enemy)
        {
            chargecon = 1;
            chargetimer = 0;
            chargetimermax = 32;
        }
        scr_shakescreen();
        with (obj_darkshape_blast_tester)
        {
            for (var a = 0; a < 24; a++)
            {
                with (instance_create_depth(x, y, depth, obj_bulletparent))
                {
                    var deth = 32 + a;
                    image_xscale = 0.5 + choose(0.5, 0, 1);
                    image_yscale = image_xscale;
                    sprite_index = spr_ring_particle1;
                    image_blend = c_white;
                    direction = irandom(360);
                    image_angle = direction;
                    speed = 12 + random(a * 0.25);
                    gravity = 0.5;
                    gravity_direction = direction + 180;
                    scr_lerpvar("image_xscale", image_xscale, 0, deth);
                    scr_lerpvar("image_yscale", image_yscale, 0, deth, 2, "out");
                    scr_script_delayed(instance_destroy, deth);
                }
            }
            with (instance_create_depth(x + 6, y, depth, obj_bulletparent))
            {
                image_xscale = 0.25;
                image_yscale = 0.25;
                sprite_index = spr_finisher_explosion;
                image_index = 2;
                image_speed = 0.5;
                image_blend = c_gray;
                scr_lerpvar("image_xscale", 0.25, 1.5, 8);
                scr_lerpvar("image_yscale", 0.25, 1.5, 8);
                scr_script_delayed(instance_destroy, 8);
            }
            with (instance_create_depth(x + 6, y, depth, obj_bulletparent))
            {
                image_xscale = 0.25;
                image_yscale = 0.25;
                sprite_index = spr_finisher_explosion;
                image_index = 2;
                image_speed = 1;
                image_blend = c_gray;
                scr_lerpvar("image_xscale", 0.25, 2, 4);
                scr_lerpvar("image_yscale", 0.25, 2, 4);
                scr_script_delayed(instance_destroy, 4);
            }
        }
    }
    if (timer < 80 && timer > 48)
    {
        repeat (2)
        {
            var cone_angle = 180 + irandom_range(-120, 120);
            var cone_distance = 120 + irandom(240);
            var cone_speed = 8 + irandom(8);
            with (obj_darkshape_blast_tester)
            {
                with (instance_create(x + 40 + lengthdir_x(cone_distance, cone_angle), y + lengthdir_y(cone_distance, cone_angle), obj_bulletparent))
                {
                    image_speed = cone_speed / 5;
                    image_angle = point_direction(x, y, other.x, other.y);
                    sprite_index = spr_chargeup_particle;
                    image_xscale = 5;
                    image_yscale = 0.25;
                    image_blend = c_gray;
                    scr_lerpvar("image_xscale", image_xscale, 0, cone_speed);
                    scr_lerpvar("image_yscale", 0.25, 0.125, cone_speed);
                    scr_lerpvar("x", x, other.x, cone_speed, 1, "in");
                    scr_lerpvar("y", y, other.y, cone_speed, 1, "in");
                    scr_script_delayed(instance_destroy, cone_speed - 1);
                }
            }
        }
        if (timer <= 90 && (timer % 2) == 0)
        {
            with (obj_darkshape_blast_tester)
            {
                var ray = instance_create(x + 6, y, obj_titan_big_ray);
                ray.start(min(96 - other.timer, 36));
            }
        }
    }
    if (timer >= 96 && (timer % 10) == 0 && timer > 2400)
    {
        snd_play_pitch(snd_explosion_mmx3, 0.65);
        with (obj_titan_enemy)
            chargecon = 2;
        with (obj_titan_enemy)
        {
            scr_script_delayed(scr_var, 2, "chargecon", 1);
            scr_script_delayed(scr_var, 2, "chargetimer", 0);
            scr_script_delayed(scr_var, 2, "chargetimermax", 6);
        }
        with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, 160 + timer_alt, 18))
        {
            scr_script_delayed(scr_sonic_boom, 1, direction);
            scr_script_delayed(scr_sonic_boom, 5, direction);
            scr_script_delayed(scr_sonic_boom, 9, direction);
            xmod = 1.25;
            ymod *= 0.75;
            scr_lerpvar("speed", 18, 8, 6);
            scr_lerpvar("xmod", xmod, 1, 6);
            scr_lerpvar("ymod", ymod, 1, 6);
            image_angle = direction;
            if (other.timer != 96)
                leavetrails = false;
        }
        timer_alt += irandom_range(10, 40);
        if (timer_alt >= 40)
            timer_alt -= 40;
    }
    if (timer == 96)
        timer_alt = 0;
    if (timer >= 96 && (timer % 10) == 0 && timer < 220)
    {
        snd_play_pitch(snd_explosion_mmx3, 0.65);
        scr_shakescreen(2, 2);
        timer_alt = 1 - timer_alt;
        with (obj_titan_enemy)
            chargecon = 2;
        with (obj_titan_enemy)
        {
            scr_script_delayed(scr_var, 10, "chargecon", 1);
            scr_script_delayed(scr_var, 10, "chargetimer", 0);
            scr_script_delayed(scr_var, 10, "chargetimermax", 10);
        }
        if (timer_alt == 1)
        {
            with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y), 8))
            {
                scr_script_delayed(scr_sonic_boom, 1, direction);
                scr_script_delayed(scr_sonic_boom, 5, direction);
                scr_script_delayed(scr_sonic_boom, 9, direction);
                xmod = 1.25;
                ymod *= 0.75;
                scr_lerpvar("speed", 18, 8, 6);
                scr_lerpvar("xmod", xmod, 1, 6);
                scr_lerpvar("ymod", ymod, 1, 6);
                image_angle = direction;
                if (other.timer != 96)
                    leavetrails = false;
            }
            for (var aa = 1; aa < 2; aa++)
            {
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) + (35 * aa) + irandom_range(-5, 5), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    xmod = 1.25;
                    ymod *= 0.75;
                    scr_lerpvar("speed", 18, 8, 6);
                    scr_lerpvar("xmod", xmod, 1, 6);
                    scr_lerpvar("ymod", ymod, 1, 6);
                    image_angle = direction;
                    if (other.timer != 96)
                        leavetrails = false;
                }
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, (scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) - (35 * aa)) + irandom_range(-5, 5), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    xmod = 1.25;
                    ymod *= 0.75;
                    scr_lerpvar("speed", 18, 8, 6);
                    scr_lerpvar("xmod", xmod, 1, 6);
                    scr_lerpvar("ymod", ymod, 1, 6);
                    image_angle = direction;
                    if (other.timer != 96)
                        leavetrails = false;
                }
            }
        }
        else
        {
            for (var aa = 1; aa < 2; aa++)
            {
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) + (18 * aa) + irandom_range(-2, 2), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    xmod = 1.25;
                    ymod *= 0.75;
                    scr_lerpvar("speed", 18, 8, 6);
                    scr_lerpvar("xmod", xmod, 1, 6);
                    scr_lerpvar("ymod", ymod, 1, 6);
                    image_angle = direction;
                    if (other.timer != 96)
                        leavetrails = false;
                }
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, (scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) - (18 * aa)) + irandom_range(-2, 2), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    xmod = 1.25;
                    ymod *= 0.75;
                    scr_lerpvar("speed", 18, 8, 6);
                    scr_lerpvar("xmod", xmod, 1, 6);
                    scr_lerpvar("ymod", ymod, 1, 6);
                    image_angle = direction;
                    if (other.timer != 96)
                        leavetrails = false;
                }
            }
        }
    }
    if (timer == 220)
    {
        with (scr_fire_bullet(obj_growtangle.x + 276, obj_darkshape_blast_tester.y, obj_titan_biglaser, 0, 0))
            depth = obj_growtangle.depth - 2;
    }
};

pattern_desperation_shots_short = function()
{
    if ((timer % 10) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
    }
    if (timer == 48)
        snd_play(snd_sneo_overpower, 1, 0.35);
    if (timer == 48)
    {
        with (obj_titan_enemy)
        {
            chargecon = 1;
            chargetimer = 0;
            chargetimermax = 32;
        }
    }
    if (timer < 80 && timer > 48)
    {
        var cone_angle = 180 + irandom_range(-60, 60);
        var cone_distance = 60 + irandom(240);
        var cone_speed = 8 + irandom(8);
        with (obj_darkshape_blast_tester)
        {
            with (instance_create(x + 40 + lengthdir_x(cone_distance, cone_angle), y + lengthdir_y(cone_distance, cone_angle), obj_bulletparent))
            {
                image_speed = cone_speed / 5;
                image_angle = point_direction(x, y, other.x, other.y);
                sprite_index = spr_chargeup_particle;
                image_xscale = 2;
                image_yscale = 0.25;
                image_blend = c_gray;
                scr_lerpvar("image_xscale", image_xscale, 0, cone_speed);
                scr_lerpvar("image_yscale", 0.25, 0.125, cone_speed);
                scr_lerpvar("x", x, other.x, cone_speed, 1, "in");
                scr_lerpvar("y", y, other.y, cone_speed, 1, "in");
                scr_script_delayed(instance_destroy, cone_speed - 1);
            }
        }
    }
    if (timer == 96)
        timer_alt = 0;
    if (timer >= 96 && (timer % 20) == 0)
    {
        snd_play_pitch(snd_explosion_mmx3, 0.65);
        scr_shakescreen();
        with (obj_titan_enemy)
            chargecon = 2;
        with (obj_titan_enemy)
        {
            scr_script_delayed(scr_var, 10, "chargecon", 1);
            scr_script_delayed(scr_var, 10, "chargetimer", 0);
            scr_script_delayed(scr_var, 10, "chargetimermax", 10);
        }
        timer_alt = 1 - timer_alt;
        if (timer_alt == 1)
        {
            with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y), 8))
            {
                scr_script_delayed(scr_sonic_boom, 1, direction);
                scr_script_delayed(scr_sonic_boom, 5, direction);
                scr_script_delayed(scr_sonic_boom, 9, direction);
                if (other.timer != 96)
                    leavetrails = false;
            }
            for (var aa = 1; aa < 2; aa++)
            {
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) + (25 * aa) + irandom_range(-5, 5), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    if (other.timer != 96)
                        leavetrails = false;
                }
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, (scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) - (25 * aa)) + irandom_range(-5, 5), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    if (other.timer != 96)
                        leavetrails = false;
                }
            }
        }
        else
        {
            for (var aa = 1; aa < 2; aa++)
            {
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) + (12 * aa) + irandom_range(-2, 2), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    if (other.timer != 96)
                        leavetrails = false;
                }
                with (scr_fire_bullet(obj_growtangle.x + 240, obj_darkshape_blast_tester.y, obj_darkshape_bigblast, (scr_at_player(obj_growtangle.x + 250, obj_darkshape_blast_tester.y) - (12 * aa)) + irandom_range(-2, 2), 8 + irandom_range(-3, 3)))
                {
                    scr_script_delayed(scr_sonic_boom, 1, direction);
                    scr_script_delayed(scr_sonic_boom, 5, direction);
                    scr_script_delayed(scr_sonic_boom, 9, direction);
                    if (other.timer != 96)
                        leavetrails = false;
                }
            }
        }
    }
};

pattern_centipede_hard = function()
{
    phase_difficulty = 3;
    if (timer == 20)
    {
        var tempd = irandom(360);
        for (var a = 0; a < 3; a++)
        {
            var tempdir = tempd + (120 * a);
            var tempdist = 120 + irandom(50);
            var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape_centipede_head);
            newbullet.direction = point_direction(newbullet.x, newbullet.y, obj_growtangle.x, obj_growtangle.y) + choose(-80, 80);
            newbullet.image_angle = newbullet.direction;
            newbullet.segment_max = 2;
            newbullet.segment_length = 30;
            with (newbullet)
                event_user(0);
            havecreatedcentipedes = true;
        }
    }
    if ((timer % 12) == 0)
    {
        var tempdir = irandom(360);
        var tempdist = 150 + irandom(50);
        var newbullet = scr_bullet_create(obj_growtangle.x + lengthdir_x(tempdist, tempdir), obj_growtangle.y + lengthdir_y(tempdist, tempdir), obj_darkshape);
        with (newbullet)
        {
            sprite_index = spr_darkshape_directed_small_animated;
            shrink_sprite = spr_darkshape_directed_small;
            light_rate *= 2.5;
            speed_max *= 1.25;
            updateimageangle = true;
        }
    }
};

pattern_darkshape_final = function()
{
    phase_difficulty = 2;
    if (timer == 24)
    {
        snd_play(snd_tspawn, 1, 0.75);
        var newbullet = scr_bullet_create(obj_growtangle.x + 150, obj_growtangle.y, obj_darkshape_giant);
    }
};

pattern_to_use = pattern_default;

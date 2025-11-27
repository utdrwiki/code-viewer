event_inherited();
timer++;
if (timer >= 0 && timer < 70 && !active)
{
    if (reverse == 12)
    {
        snd_play(snd_motor_upper_2, 1, 0.25);
        rising_sound = snd_play(snd_howl, 1, 0.01);
        sound_pitch_time(rising_sound, 1.5, 70);
        alarm[0] = reverse;
        reverse = scr_approach(reverse, 4, 2);
        with (instance_create_depth(x - 140, y, depth - 1, obj_bulletparent))
        {
            _modifier = 2;
            image_xscale = 1 * _modifier;
            image_yscale = 2 * _modifier;
            sprite_index = spr_finisher_explosion;
            image_index = 6;
            image_speed = -0.5;
            image_blend = c_white;
            speed = 2;
            direction = 0;
            gravity = 2;
            gravity_direction = 0;
            scr_lerpvar("image_xscale", 1 * _modifier, 0, 10);
            scr_lerpvar("image_yscale", 2 * _modifier, 0, 10);
            scr_script_delayed(instance_destroy, 10);
        }
    }
    with (obj_darkshape_bigblast)
    {
        var dist = point_distance(x, y, xstart, ystart);
        gravity_direction = point_direction(x, y, xstart, ystart);
        gravity += (10 / max(dist, 1));
        xmod *= (1 - (1 / max(dist * 0.25, 1)));
        ymod *= (1 - (1 / max(dist * 0.125, 1)));
    }
}
if (global.turntimer <= 30 && active)
{
    for (var a = 0; a < 30; a++)
    {
        with (scr_fire_bullet((x - (a * 20)) + irandom_range(-12, 12), y + irandom_range(-12, 12), obj_darkshape_bigblast, 0, 0))
        {
            active = false;
            xmod = choose(0.25, 0.5, 1);
            ymod = xmod;
            var deth = 8 + irandom(22);
            direction = irandom(360);
            speed = -1 - irandom(2);
            vspeed *= 0.75;
            scr_lerpvar("xmod", xmod, 0, deth);
            scr_lerpvar("ymod", ymod, 0, deth);
            leavetrails = false;
        }
        with (instance_create_depth((x - (a * 16)) + irandom_range(-12, 12), y + irandom_range(-6, 6), depth + 1, obj_bulletparent))
        {
            image_xscale = choose(2.5, 5);
            image_yscale = image_xscale;
            sprite_index = spr_ring_particle1;
            image_blend = c_white;
            hspeed = -2 - irandom(4);
            vspeed = 0;
            var deth = 8 + irandom(12);
            scr_lerpvar("image_xscale", image_xscale, 0, deth, 2, "out");
            scr_lerpvar("image_yscale", image_yscale, 0, deth, 2, "out");
            scr_script_delayed(instance_destroy, deth);
        }
    }
    audio_sound_gain(quake_sound, 0, 500);
    active = false;
    timer = -9999;
    scr_lerpvar("image_yscale", image_yscale, 0.0125, 4);
    sprite_index = spr_titan_biglaser_temp;
    image_speed = 0;
    image_index = 2;
    scr_script_delayed(instance_destroy, 5);
}
if (timer == 64 && !active)
    alarm[0] = -1;
if (timer == 70 && !active)
{
    sound_stop(rising_sound);
    quake_sound = snd_loop(snd_quake_nes);
    audio_sound_pitch(quake_sound, 0.66);
    snd_volume(quake_sound, 1, 0);
    active = true;
    alarm[0] = -1;
    with (obj_darkshape_bigblast)
        instance_destroy();
    sprite_index = spr_titan_biglaser_thin;
    image_index = 0;
    image_speed = 1;
    image_yscale = 0.8;
    image_blend = c_white;
    snd_play(snd_chargeshot_fire, 1, 0.75);
    snd_play(snd_scytheburst, 1, 0.25);
    snd_play(snd_bomb, 1, 0.25);
    fount = snd_play(snd_fountain_make, 1, 0.25);
    snd_pitch_time(fount, 0.125, global.turntimer - 30);
    scr_script_delayed(audio_sound_gain, floor((global.turntimer - 30) * 0.75), fount, 0, floor((global.turntimer - 30) * 33.3 * 0.25));
}
if (active)
{
    scr_shakescreen();
    if (irandom(1))
    {
        with (instance_create_depth(x, y, depth - 1, obj_bulletparent))
        {
            image_xscale = choose(2.5, 5);
            image_yscale = image_xscale;
            sprite_index = spr_ring_particle1;
            image_blend = c_white;
            if (irandom(4))
                vspeed = (8 + random(8)) * choose(-1, 1);
            else
                vspeed = random(16) * choose(-1, 1);
            hspeed = -abs(24);
            gravity = abs(vspeed / 16);
            if (vspeed)
                gravity_direction = 90;
            else
                gravity_direction = 270;
            scr_lerpvar("image_xscale", image_xscale, 0, 24, 2, "out");
            scr_lerpvar("image_yscale", image_yscale, 0, 24, 2, "out");
            scr_script_delayed(instance_destroy, 24);
        }
    }
}

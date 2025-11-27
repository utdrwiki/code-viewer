if (hurtCon == 0)
{
    if (shootcon == 0)
    {
        if (x < camerax())
        {
            hspeed = 6;
            image_index = 1;
        }
        else
        {
            hspeed = -6;
        }
        shootcon = 1;
    }
    if (shootcon == 1)
    {
        shoottimer++;
        if (shoottimer == 20)
            hspeed = 0;
        if (shoottimer == 100)
        {
            shoottimer = 0;
            shootcon = 2;
            redflashtimer = 11;
        }
    }
    if (shootcon == 2)
    {
        shoottimer++;
        if (shoottimer == 20)
        {
            if (image_index == 0)
                instance_create(x - 15, y - 19, obj_zombiebullet);
            else
                instance_create(x + 15, y - 19, obj_zombiebullet);
        }
        if (shoottimer == 23)
        {
            if (image_index == 0)
                instance_create(x - 15, y - 19, obj_zombiebullet);
            else
                instance_create(x + 15, y - 19, obj_zombiebullet);
        }
        if (shoottimer == 26)
        {
            if (image_index == 0)
                instance_create(x - 15, y - 19, obj_zombiebullet);
            else
                instance_create(x + 15, y - 19, obj_zombiebullet);
            shootimer = 0;
            shootcon = 1;
        }
    }
}
if (hurtCon == 1)
{
    recoil += (recoilSpeed * recoilDir);
    recoilSpeed -= 1;
    if (sign(recoil) != recoilDir)
    {
        recoil = 0;
        hurtCon = 0;
        recoilSpeed = 0;
        image_index = 0;
    }
}
if (fall_speed != 0 || height > 0)
{
    height -= fall_speed;
    fall_speed += 1;
    if (height <= 0)
    {
        height = 0;
        if (bounce_count < 1)
            fall_speed *= -0.5;
        else
            fall_speed = 0;
        bounce_count++;
        snd_stop(snd_bump);
        snd_play(snd_bump);
        vspeed = 0;
    }
}
if (hurtCon == 2)
{
    if (fall_speed > 0)
    {
        image_index = 5 + reverse_image;
        hurtCon = 3;
        shadow.image_xscale *= 1;
    }
}
if (hurtCon == 3 && height == 0 && fall_speed == 0)
{
    alarm[0] = 10;
    hurtCon = 4;
    hspeed = 0;
}
if (hurtCon == 5)
{
    fader++;
    if ((fader % 2) == 1)
        visible = false;
    else
        visible = true;
    if (fader == 15)
    {
        var fx = instance_create(x - 24, y - 50, obj_animation);
        fx.sprite_index = spr_explosion_round;
        fx.image_speed = 0.5;
        fx.depth = obj_susiezilla.depth - 20;
        audio_stop_sound(snd_explosion_firework);
        snd_play_pitch(snd_explosion_firework, 1.1 + random(0.4));
    }
    if (fader >= 20)
        instance_destroy();
}

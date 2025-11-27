with (obj_dmgwriter)
    depth = -99999999999;
if (i_ex(obj_growtangle))
{
    timer++;
    if (timer < 14)
        x = lerp(x, scr_get_box(0) + 122, 0.16);
    if (timer == 14)
    {
        sprite_index = spr_shadowman_idle_b;
        image_speed = 1;
    }
}
if (global.turntimer < 13)
{
    if (global.turntimer < 1)
    {
        instance_destroy();
        exit;
    }
    x = lerp(x, creatorid.x, (12 - global.turntimer) / 12);
    y = lerp(y, creatorid.y, (12 - global.turntimer) / 12);
}
if (paused || timer < 14 || (global.turntimer < 29 && bullet_counter == 0))
    exit;
if (bullet_timer > 0)
{
    bullet_timer--;
}
else
{
    snd_stop(snd_gunshot_b);
    snd = audio_play_sound(snd_gunshot_b, 0, 0);
    snd_pitch(snd_gunshot_b, 0.95 + (random(10) / 100));
    snd_volume(snd_gunshot_b, 0.7, 0);
    sprite_index = spr_shadowman_firing;
    shootsfx = 6;
    firefx = 2;
    gunshake = 6;
    var rep = 1;
    if (type == 1)
        rep = 5;
    var bullet_speed = 5.5 + random(2);
    if (type == 1)
        bullet_speed = 4 + random(2);
    if (instance_number(obj_dbulletcontroller) == 1)
        bullet_speed = 4 + random(2);
    if (instance_number(obj_dbulletcontroller) == 2)
        bullet_speed = 4 + random(1);
    if (instance_number(obj_dbulletcontroller) == 3)
        bullet_speed = 4 + random(1);
    if (i_ex(obj_volumeup))
        bullet_speed = 3 + random(1);
    repeat (rep)
    {
        var ang = (point_direction(x + 6 + lengthdir_x(gunshake, gun_angle), y + 63 + lengthdir_y(gunshake, gun_angle), obj_growtangle.x, obj_growtangle.y) - 30) + irandom(60);
        if (type == 1)
            ang = 120 + irandom(90);
        count++;
        if (count == 5 && instance_number(obj_dbulletcontroller) != 3)
        {
            count = -10;
            ang = (point_direction(x + 6 + lengthdir_x(gunshake, gun_angle), y + 63 + lengthdir_y(gunshake, gun_angle), obj_heart.x + 10, obj_heart.y + 10) + 6) - irandom(12);
        }
        if (type == 0)
            gun_angle = ang;
        var tommybullet = scr_fire_bullet(x + 6 + lengthdir_x(60, gun_angle), y + 64 + lengthdir_y(60, gun_angle), obj_regularbullet, 180, bullet_speed, spr_tommygun_bullet);
        tommybullet.direction = ang;
        tommybullet.damage = 55;
        tommybullet.grazepoints = 9;
        tommybullet.target = target;
        tommybullet.image_angle = tommybullet.direction;
        depth = -9999;
        tommybullet.depth = depth + 1;
        with (tommybullet)
            scr_script_delayed(scr_lerpvar_instance, abs(x - scr_get_box(2)) / abs(hspeed), id, "image_alpha", 1, 0, 10);
        if (i_ex(obj_rouxls_ch3_enemy) && y < obj_rouxls_ch3_enemy.y)
            depth = obj_rouxls_ch3_enemy.depth + 1;
        if (i_ex(obj_volumeup))
        {
            tommybullet.image_xscale = 1.3;
            tommybullet.image_yscale = 1.3;
            tommybullet.grazepoints += 6;
            tommybullet.x += 30;
        }
    }
    if (type == 0)
    {
        bullet_timer = 3;
        bullet_counter++;
        if (instance_number(obj_dbulletcontroller) == 1)
            bullet_timer = 2;
        if (instance_number(obj_dbulletcontroller) == 2)
            bullet_timer = 4;
        if (instance_number(obj_dbulletcontroller) == 3)
            bullet_timer = 8;
        if (bullet_counter == 12 || (bullet_counter == 6 && instance_number(obj_dbulletcontroller) == 2) || (bullet_counter == 4 && instance_number(obj_dbulletcontroller) == 3))
        {
            sprite_index = spr_shadowman_reload;
            image_speed = 0.13333333333333333;
            bullet_counter = 0;
            bullet_timer += (10 + (irandom(1) * 5) + (4 * sameattack));
            gun_angle = 180;
        }
    }
    if (type == 1)
    {
        bullet_timer = 24;
        bullet_counter++;
        if (bullet_counter == 3)
        {
            sprite_index = spr_shadowman_reload;
            image_speed = 0.13333333333333333;
            bullet_counter = 0;
            bullet_timer += (10 + (irandom(1) * 5) + (4 * sameattack));
            gun_angle = 180;
        }
    }
}

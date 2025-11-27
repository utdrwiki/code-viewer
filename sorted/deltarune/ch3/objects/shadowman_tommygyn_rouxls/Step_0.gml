timer++;
if (timer < 14 && i_ex(obj_growtangle))
    x = lerp(x, scr_get_box(0) + 122, 0.16);
if (timer == 14)
{
    sprite_index = spr_shadowman_idle_bunny;
    image_speed = 1;
}
if (global.turntimer < 13)
{
    x = lerp(x, creatorid.x, (12 - global.turntimer) / 12);
    y = lerp(y, creatorid.y, (12 - global.turntimer) / 12);
    if (global.turntimer < 1)
        instance_destroy();
    exit;
}
if (timer < 14 || (global.turntimer < 29 && bullet_counter == 0))
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
    sprite_index = spr_shadowman_firing_bunny;
    shootsfx = 6;
    firefx = 2;
    gunshake = 6;
    var ang;
    if (type == 1 || !i_ex(obj_heart))
    {
        ang = 180;
    }
    else
    {
        ang = (point_direction(x + 6 + lengthdir_x(gunshake, gun_angle), y + 63 + lengthdir_y(gunshake, gun_angle), obj_heart.x + 10, obj_heart.y + 10) + 12) - irandom(24);
        if (y < obj_rouxls_ch3_enemy.y)
        {
            if (ang < 181)
                ang = 181;
            if (ang > 235)
                ang = 235;
        }
        else
        {
            if (ang < 130)
                ang = 130;
            if (ang > 170)
                ang = 170;
        }
        scr_debug_print(string(ang));
    }
    gun_angle = ang;
    if (type == 0)
    {
        bullet_timer = 37;
        if (slower == true)
            bullet_timer = 37;
        var _bullet = instance_create(x + 6 + lengthdir_x(60, gun_angle), y + 64 + lengthdir_y(60, gun_angle), obj_rouxls_biplane);
        _bullet.direction = ang;
        _bullet.image_angle = _bullet.direction;
        _bullet.depth = depth + 1;
        _bullet.target = target;
        _bullet.damage = 50;
        _bullet.grazepoints = 3;
    }
    if (type == 1)
    {
        bullet_timer = 56;
        var _bullet = instance_create(x + 6 + lengthdir_x(60, gun_angle), y + 64 + lengthdir_y(60, gun_angle), obj_rouxls_helicopter);
        _bullet.direction = ang;
        _bullet.image_angle = _bullet.direction + 180;
        _bullet.depth = depth + 1;
        _bullet.target = target;
        _bullet.damage = 50;
        _bullet.grazepoints = 3;
    }
    depth = -9999999999;
    if (i_ex(obj_rouxls_ch3_enemy) && y < obj_rouxls_ch3_enemy.y)
        depth = obj_rouxls_ch3_enemy.depth + 1;
}

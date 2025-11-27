if (!init)
{
    init = true;
    depth = obj_heart.depth + 1;
    path_set_kind(mypath, 1);
    path_set_precision(mypath, 4);
    path_set_closed(mypath, 0);
    var relativeY = 0;
    path_add_point(mypath, x, y, 100);
    path_add_point(mypath, x - 30, y - 20, 100);
    var boxy = obj_growtangle.y;
    for (i = 1; i < 5; i++)
    {
        var xpoint = (-150 * i) + x;
        if (aim_at_player && relativeY == 0 && (xpoint - (obj_heart.x + 10)) <= 150)
        {
            relativeY = random_range(-80 * i, 80 * i) + boxy;
            path_add_point(mypath, xpoint, relativeY, 100);
            relativeY = ((obj_heart.y + 10) - relativeY) / abs((obj_heart.x + 10) - xpoint);
        }
        else if (aim_at_player && relativeY != 0)
        {
            relativeY = obj_heart.y + 10 + (relativeY * abs((obj_heart.x + 10) - xpoint));
            path_add_point(mypath, xpoint, clamp(relativeY, (-80 * i) + boxy, (80 * i) + boxy), 100);
            relativeY = 0;
        }
        else
        {
            path_add_point(mypath, xpoint, random_range(-100 * i, 100 * i) + boxy, 100);
        }
    }
}
if (!freeze && instance_exists(obj_shutta_rotation_attack) && obj_shutta_rotation_attack.freeze)
    freeze = true;
if (freeze)
    exit;
if ((animchange == (1 & progressLoop)) > (attackWaitTime + 1))
{
    if (instance_exists(sax_animation))
        sax_animation.image_speed = 0.16666666666666666;
    animchange = 0;
}
if (firedShots >= bulletCount)
{
    timer++;
    if (timer >= destroytime)
        instance_destroy();
    exit;
}
if (progressLoop > attackWaitTime || draw_style == 0)
{
    if (timer >= shootSpeed)
    {
        if (animchange == 0)
        {
            if (instance_exists(sax_animation))
                sax_animation.image_speed = 1/3;
            animchange = 1;
            snd_stop(shadowman_sax_long_1);
            snd_stop(shadowman_sax_long_2);
            snd_stop(shadowman_sax_long_3);
            snd_stop(shadowman_sax_long_4);
            snd_stop(shadowman_sax_long_solo_note);
            var rand = choose(0, 1, 2, 3, 4);
            if (rand == 0)
                snd_play_x(shadowman_sax_long_1, 1, 1);
            if (rand == 1)
                snd_play_x(shadowman_sax_long_2, 1, 1);
            if (rand == 2)
                snd_play_x(shadowman_sax_long_3, 1, 1);
            if (rand == 3)
                snd_play_x(shadowman_sax_long_4, 1, 1);
            if (rand == 4)
                snd_play_x(shadowman_sax_long_solo_note, 1, 1);
        }
        d = scr_bullet_create(x, y, obj_shadowman_sax_bullet);
        d.grazepoints = grazepoints;
        d.childgraze = childgraze;
        d.direction = point_direction(x, y, path_get_x(mypath, 0.02), path_get_y(mypath, 0.02));
        timer = 0;
        d.bulletPath = mypath;
        if (special >= 1 && firedShots == 1)
            d.spawnchild = special;
        firedShots++;
    }
    else
    {
        timer++;
    }
    exit;
}

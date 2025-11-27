image_blend = make_color_rgb(255 * r, 255 * g, 255 * b);
image_index %= 6;
speed *= 0.85;
if (active)
{
    var accel = acc / point_distance(x, y, obj_heart.x + 10, obj_heart.y + 10);
    direction = scr_at_player(x, y);
    speed = scr_approach(speed, max_speed, accel);
}
if (point_distance(x, y, obj_heart.x + 10, obj_heart.y + 10) <= 20 && active)
{
    snd_stop(snd_swallow);
    snd_stop(snd_eye_telegraph);
    snd_play(snd_swallow, size * 0.2);
    snd_play(snd_eye_telegraph, size * 0.2, 2);
    var tensionscale = 1;
    var tensionscale_perloss = 1;
    with (obj_titan_enemy)
        tensionscale = tensionscaling;
    if (i_ex(obj_titan_spawn_enemy) && obj_titan_spawn_enemy.turns >= 4)
        tensionscale = 2;
    if (i_ex(obj_titan_enemy) && global.flag[1640] >= 8)
    {
        if (global.flag[1640] == 8)
            tensionscale_perloss = 1.2;
        if (global.flag[1640] == 9)
            tensionscale_perloss = 1.3;
        if (global.flag[1640] == 10)
            tensionscale_perloss = 1.4;
        if (global.flag[1640] == 11)
            tensionscale_perloss = 1.5;
        if (global.flag[1640] == 12)
            tensionscale_perloss = 1.6;
        if (global.flag[1640] == 13)
            tensionscale_perloss = 1.7;
        if (global.flag[1640] == 14)
            tensionscale_perloss = 1.8;
        if (global.flag[1640] == 15)
            tensionscale_perloss = 1.9;
        if (global.flag[1640] >= 16)
            tensionscale_perloss = 2;
    }
    scr_tensionheal(size * 2 * tensionscale * tensionscale_perloss);
    with (instance_create_depth(x, y, depth + 1, obj_bulletparent))
    {
        image_angle = 0;
        image_xscale = 0.0625;
        image_yscale = 0.0625;
        scr_lerpvar("image_xscale", image_xscale, image_xscale * 3, 4);
        scr_lerpvar("image_yscale", image_yscale, image_yscale * 3, 4);
        sprite_index = spr_finisher_explosion;
        image_index = 2;
        image_speed = 1;
        image_blend = c_yellow;
        scr_script_delayed(instance_destroy, 5);
    }
    if (instance_exists(obj_darkshape_tension_glow))
    {
        with (obj_darkshape_tension_glow)
            alphamod = 1;
    }
    else
    {
        instance_create_depth(0, 0, 0, obj_darkshape_tension_glow);
    }
    repeat (3 + irandom(2))
    {
        with (obj_tensionbar)
        {
            with (instance_create(x + irandom(25), y + 40 + irandom(160), obj_marker))
            {
                var _dur = 10 + irandom(5);
                sprite_index = spr_sparestar_anim;
                image_speed = 5 / _dur;
                speed = 3 + random(3);
                direction = 90;
                scr_lerpvar("speed", speed, 0, _dur);
                scr_lerpvar("image_alpha", 1, 0.25, _dur);
                scr_script_delayed(instance_destroy, _dur);
            }
        }
    }
    instance_destroy();
}

var scale = 0.8 + (sin(siner / 4) * 0.2);
if (con == 0)
{
    timer++;
    if (timer < 15 && darken_alpha < 0.35)
        darken_alpha += 0.05;
    if (timer > 15)
        darken_alpha -= 0.1;
    if (timer == 9)
        snd_play_x(snd_knight_stretch, 0.6, 1.5);
    if ((timer % 3) == 0)
        scr_shakescreen();
    if ((timer % 1) == 0)
        instance_create((x - 30) + random(60), (y - 30) + random(60), obj_knight_spark);
    if (timer < 40)
    {
        var aa = 0.25 - (timer / 100);
        if (aa < 0)
            aa = 0;
        draw_sprite_ext(spr_zapper_tvturnoff1, 0, x, y, 40, aa, 0, c_white, 1);
    }
    if (timer < 18)
    {
        d = instance_create(x, y, obj_rouxls_power_up_orb);
        d.direction = irandom(360);
        d.lifetime = 12;
        d.depth = depth + 1;
        d.image_blend = image_blend;
    }
    scale = lerp(scale * 0.001, scale, timer / 40);
    if (timer == 40)
    {
        con = 1;
        timer = 0;
        snd_stop(snd_knight_stretch);
        if (type == 1)
        {
            instance_create(x - splitx, y, obj_knight_bullethell2);
            instance_create(x + splitx, y, obj_knight_bullethell2);
        }
    }
    if (type == 1 && splitx < 60 && timer >= 30)
        splitx += 6;
}
if (con == 1)
{
    timer++;
    var _x = 0;
    if (type == 1)
        _x = splitx;
    var _rep = 1;
    if (type == 1)
        _rep = 2;
    repeat (_rep)
    {
        tri = instance_create(x + _x, y, obj_knight_triangle);
        tri.image_yscale = 1 + random(0.5);
        tri.image_xscale = 1 + random(0.7);
        if ((timer % 30) == 0 || timer == 1)
            instance_create(x + _x, y, obj_knight_ring);
        if ((timer % 1) == 0)
            instance_create((x - 30) + random(60) + _x, (y - 30) + random(60), obj_knight_spark);
        if ((timer % 10) == 0)
        {
            var basedir = ((point_direction(x + _x, y, obj_heart.x + 10, obj_heart.y + 10) + 36) - 5) + irandom(10);
            count++;
            var n = 0;
            if (obj_roaringknight_quickslash_attack.local_turntimer < -60 || obj_knight_enemy.difficulty == 0)
            {
                basedir = ((point_direction(x + _x, y, obj_heart.x + 10, obj_heart.y + 10) + 36) - 30) + irandom(60);
                if ((count % 2) == 0)
                    basedir = point_direction(x + _x, y, obj_heart.x + 10, obj_heart.y + 10);
                repeat (5)
                {
                    with (scr_fire_bullet(x + _x, y, obj_knight_bullethell_bullet2, basedir + (72 * n), 5 + random(2), spr_sunbolt))
                    {
                        updateimageangle = 1;
                        image_angle = direction;
                        gravity_direction = direction + 180;
                        gravity = speed / 90;
                        mask_index = spr_sunbolt;
                        depth -= 100;
                        scr_lerpvar("gravity", gravity, 0, 30);
                    }
                    n++;
                }
            }
            else
            {
                if ((count % 3) == 0 && _x > 0)
                    basedir = point_direction(x + _x, y, obj_heart.x + 10, obj_heart.y + 10);
                if ((count % 5) == 0 && _x < 0)
                    basedir = point_direction(x + _x, y, obj_heart.x + 10, obj_heart.y + 10);
                repeat (3)
                {
                    with (scr_fire_bullet(x + _x, y, obj_knight_bullethell_bullet2, basedir + (120 * n), 4.5, spr_sunbolt))
                    {
                        updateimageangle = 1;
                        image_angle = direction;
                        gravity_direction = direction + 180;
                        gravity = speed / 90;
                        mask_index = spr_sunbolt;
                        depth -= 100;
                        scr_lerpvar("gravity", gravity, 0, 30);
                    }
                    n++;
                }
            }
            snd_play_x(snd_stardrop, 0.8, 1);
        }
        _x = splitx * -1;
    }
}
siner++;
if ((siner % 2) == 0)
    image_blend = col;
else
    image_blend = c_white;
if ((type == 1 && con == 0 && timer > 29) || (type == 1 && con == 1))
{
    draw_sprite_ext(sprite_index, image_index, x + splitx, y, scale, scale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x - splitx, y, scale, scale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, image_angle, image_blend, image_alpha);
}
if (global.turntimer < 1)
{
    instance_destroy();
    with (obj_knight_bullethell2)
        instance_destroy();
}
if (con == 0)
{
    if (radius > 0)
        radius -= 4;
    if (circle_alpha < 0.4)
        circle_alpha += 0.1;
    draw_set_alpha(circle_alpha);
    draw_circle_color(x, y, radius, c_blue, c_blue, false);
    draw_set_alpha(1);
}

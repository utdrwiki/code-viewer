if (!surface_exists(hands_surface))
    hands_surface = surface_create(640, 480);
surface_set_target(hands_surface);
draw_clear_alpha(c_white, 0);
with (hand_1)
{
    if (fingers_broken == 4)
    {
        x += choose(-1, 0, 1);
        y += choose(-1, 0, 1);
        if (irandom(1))
        {
            with (instance_create_depth(x + irandom_range(-80, 80), y + irandom_range(-60, 60), choose(depth + 1, depth - 1), obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_finisher_explosion;
                image_index = 0;
                image_speed = 0;
                image_alpha = 0;
                image_angle = irandom(360);
                image_xscale = 0.5;
                image_yscale = 0.5;
                direction = 90;
                speed = 8;
                scr_lerpvar("speed", 8, 1, 8);
                scr_lerpvar("image_xscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                scr_lerpvar("image_yscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                scr_var("image_speed", (0.075 * bb) + 0.4);
                scr_var("image_alpha", 1);
            }
        }
        if (other.hand_1_overload == 1)
        {
            snd_play(snd_explosion);
            scr_shakescreen();
            for (var bb = 0; bb < 8; bb++)
            {
                with (instance_create_depth(x + irandom_range(-40, 40), y + irandom_range(-30, 30), choose(depth + 1, depth - 1), obj_battle_marker))
                {
                    destroyoncomplete = true;
                    sprite_index = spr_finisher_explosion;
                    image_index = 0;
                    image_speed = 0;
                    image_alpha = 0;
                    image_angle = irandom(360);
                    image_xscale = 0.5;
                    image_yscale = 0.5;
                    direction = irandom(360);
                    speed = 8;
                    scr_lerpvar("speed", 16, 1, 16);
                    scr_lerpvar("image_xscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                    scr_lerpvar("image_yscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                    scr_var("image_speed", (0.075 * bb) + 0.4);
                    scr_var("image_alpha", 1);
                }
            }
            with (instance_create_depth(x, y, depth, obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_titan_shockwave_bullet_explosion;
                image_index = 0;
                image_speed = 1;
                image_alpha = 1;
                image_angle = irandom(360);
                image_xscale = 1;
                image_yscale = 0.5;
            }
            with (instance_create_depth(x, y, depth, obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_titan_shockwave_bullet_explosion;
                image_index = 0;
                image_speed = 0.75;
                image_alpha = 1;
                image_angle = irandom(360);
                image_xscale = 1.5;
                image_yscale = 0.75;
            }
            with (instance_create_depth(x, y, depth, obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_titan_shockwave_bullet_explosion;
                image_index = 0;
                image_speed = 0.5;
                image_alpha = 1;
                image_angle = irandom(360);
                image_xscale = 2;
                image_yscale = 1;
            }
            instance_destroy();
        }
    }
    draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, other.hand_1_overload);
    d3d_set_fog(false, c_white, 0, 0);
    with (finger_1)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    with (finger_2)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    with (finger_3)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    with (finger_4)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
}
with (hand_2)
{
    if (fingers_broken == 4)
    {
        x += choose(-1, 0, 1);
        y += choose(-1, 0, 1);
        if (irandom(1))
        {
            with (instance_create_depth(x + irandom_range(-80, 80), y + irandom_range(-60, 60), choose(depth + 1, depth - 1), obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_finisher_explosion;
                image_index = 0;
                image_speed = 0;
                image_alpha = 0;
                image_angle = irandom(360);
                image_xscale = 0.5;
                image_yscale = 0.5;
                direction = 90;
                speed = 8;
                scr_lerpvar("speed", 8, 1, 8);
                scr_lerpvar("image_xscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                scr_lerpvar("image_yscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                scr_var("image_speed", (0.075 * bb) + 0.4);
                scr_var("image_alpha", 1);
            }
        }
        if (other.hand_2_overload == 1)
        {
            if (global.turntimer > 5)
                global.turntimer += 30;
            snd_play(snd_explosion);
            scr_shakescreen();
            for (var bb = 0; bb < 8; bb++)
            {
                with (instance_create_depth(x + irandom_range(-40, 40), y + irandom_range(-30, 30), choose(depth + 1, depth - 1), obj_battle_marker))
                {
                    destroyoncomplete = true;
                    sprite_index = spr_finisher_explosion;
                    image_index = 0;
                    image_speed = 0;
                    image_alpha = 0;
                    image_angle = irandom(360);
                    image_xscale = 0.5;
                    image_yscale = 0.5;
                    direction = irandom(360);
                    speed = 16;
                    scr_lerpvar("speed", 16, 1, 16);
                    scr_lerpvar("image_xscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                    scr_lerpvar("image_yscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                    scr_var("image_speed", (0.075 * bb) + 0.4);
                    scr_var("image_alpha", 1);
                }
            }
            with (instance_create_depth(x, y, depth, obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_titan_shockwave_bullet_explosion;
                image_index = 0;
                image_speed = 1;
                image_alpha = 1;
                image_angle = irandom(360);
                image_xscale = 1;
                image_yscale = 0.5;
            }
            with (instance_create_depth(x, y, depth, obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_titan_shockwave_bullet_explosion;
                image_index = 0;
                image_speed = 0.75;
                image_alpha = 1;
                image_angle = irandom(360);
                image_xscale = 1.5;
                image_yscale = 0.75;
            }
            with (instance_create_depth(x, y, depth, obj_battle_marker))
            {
                var bb = irandom(4);
                destroyoncomplete = true;
                sprite_index = spr_titan_shockwave_bullet_explosion;
                image_index = 0;
                image_speed = 0.5;
                image_alpha = 1;
                image_angle = irandom(360);
                image_xscale = 2;
                image_yscale = 1;
            }
            instance_destroy();
        }
    }
    draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, other.hand_2_overload);
    d3d_set_fog(false, c_white, 0, 0);
    with (finger_1)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    with (finger_2)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    with (finger_3)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    with (finger_4)
        draw_sprite_ext(sprite_index, image_index, x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
}
with (hand_1)
{
    with (finger_1)
        darkdraw();
    with (finger_2)
        darkdraw();
    with (finger_3)
        darkdraw();
    with (finger_4)
        darkdraw();
}
with (hand_2)
{
    with (finger_1)
        darkdraw();
    with (finger_2)
        darkdraw();
    with (finger_3)
        darkdraw();
    with (finger_4)
        darkdraw();
}
surface_reset_target();
draw_set_alpha(image_alpha);
for (a = 0; a < 60; a++)
{
    var side = 1;
    draw_surface_part(hands_surface, 0, a * 15, 640, 15, x + (sin(a + timer) * (3 - (image_alpha * 3)) * side), y + (a * 15));
}
draw_set_alpha(1);

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}

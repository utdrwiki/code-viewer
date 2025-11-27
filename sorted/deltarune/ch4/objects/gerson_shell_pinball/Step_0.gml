if (im_done)
    exit;
grazetimer++;
if (grazetimer > 7)
{
    grazetimer = 0;
    grazed = 0;
}
timer++;
image_speed = scr_approach(image_speed, 0.5, 0.4);
if ((timer % 4) == 0 && !top_timer)
{
    with (scr_fire_bullet(x, y, obj_regularbullet, 0, 0, spr_thrash_star))
    {
        scr_darksize();
        image_xscale = 1.5;
        image_yscale = 1.5;
        scr_script_delayed(scr_lerpvar, 22, "image_xscale", image_xscale, 0, 4);
        scr_script_delayed(scr_lerpvar, 22, "image_yscale", image_yscale, 0, 4);
        scr_script_delayed(instance_destroy, 26);
        grazepoints = 2;
        spinspeed = 15;
        spin = 1;
        var aa = (global.hp[2] - 30) / 250;
        if (aa < 0)
            aa = 0;
        damage = lerp(12, 90, aa);
        if (global.chararmor1[2] == 23 || global.chararmor2[2] == 23)
            damage = round(damage * 0.15);
    }
}
if (x > (obj_growtangle.x - 72) && x < (obj_growtangle.x + 72))
{
    if (y > (scr_get_box(3) - 16) && counter < 7 && vspeed > 0)
    {
        y = scr_get_box(3) - 16;
        scr_lerpvar("image_xscale", image_xscale, image_xscale * 1.5, 3, 2, "out");
        scr_script_delayed(scr_lerpvar, 3, "image_xscale", image_xscale * 1.5, image_xscale, 3, 2, "in");
        scr_lerpvar("image_yscale", image_yscale, image_yscale * 0.5, 3, 2, "out");
        scr_script_delayed(scr_lerpvar, 3, "image_yscale", image_yscale * 0.5, image_yscale, 3, 2, "in");
        scr_script_delayed(scr_var, 6, "vspeed", -vspeed);
        scr_script_delayed(scr_var, 6, "hspeed", hspeed);
        vspeed = 0;
        hspeed = 0;
        snd_play(snd_parry_fast_nodelay);
        with (obj_growtangle)
        {
            if (y < 250)
                scr_lerpvar("y", y, y + 10, 6, 2, "out");
        }
    }
    if (y < (scr_get_box(1) + 16) && counter < 7 && vspeed < 0)
    {
        y = scr_get_box(1) + 16;
        scr_lerpvar("image_xscale", image_xscale, image_xscale * 1.5, 3, 2, "out");
        scr_script_delayed(scr_lerpvar, 3, "image_xscale", image_xscale * 1.5, image_xscale, 3, 2, "in");
        scr_lerpvar("image_yscale", image_yscale, image_yscale * 0.5, 3, 2, "out");
        scr_script_delayed(scr_lerpvar, 3, "image_yscale", image_yscale * 0.5, image_yscale, 3, 2, "in");
        scr_script_delayed(scr_var, 6, "vspeed", -vspeed);
        scr_script_delayed(scr_var, 6, "hspeed", hspeed);
        vspeed = 0;
        hspeed = 0;
        snd_play(snd_parry_fast_nodelay);
        with (obj_growtangle)
        {
            if (y > 220)
                scr_lerpvar("y", y, y - 10, 6, 2, "out");
        }
    }
    if (y > (scr_get_box(3) - 16) && top_timer >= 20)
    {
        y = scr_get_box(3) - 16;
        snd_play(snd_explosion_firework);
        snd_play(snd_stardrop, 0.5, 0.75);
        scr_shakescreen();
        with (obj_gerson_shell_kick_controller)
            full_timer = 80;
        with (instance_create(x, y, obj_battle_marker))
        {
            shell_controlled = true;
            destroyoncomplete = true;
            sprite_index = spr_finisher_explosion;
            image_speed = 0;
            scr_lerpvar("image_index", image_index, 6, 6);
            scr_script_delayed(instance_destroy, 6);
        }
        for (var a = -6; a < 6; a++)
        {
            if (a != 0)
            {
                with (instance_create(x, y + 8, obj_battle_marker))
                {
                    shell_controlled = true;
                    destroyoncomplete = false;
                    kill = false;
                    sprite_index = spr_launchsmoke;
                    image_angle = irandom(360);
                    image_xscale = 1 + (abs(a) * 0.5);
                    image_yscale = 1 + (abs(a) * 0.5);
                    gravity_direction = 90;
                    gravity = (abs(a) * 0.05) + random(0.1);
                    hspeed = a * 3;
                    scr_lerpvar("hspeed", hspeed, hspeed * 0.25, 2 + (abs(a) * 6));
                    scr_lerpvar("image_xscale", image_xscale, image_xscale * 0.75, 2 + (abs(a) * 6));
                    scr_lerpvar("image_yscale", image_yscale, image_xscale * 0.75, 2 + (abs(a) * 6));
                    scr_lerpvar("image_alpha", 1, 0, 2 + (abs(a) * 6));
                    scr_lerpvar("image_angle", image_angle, image_angle + (180 * sign(a)), 2 + (abs(a) * 6));
                    scr_script_delayed(instance_destroy, 2 + (abs(a) * 6));
                }
            }
        }
        for (var a = -2; a < 2; a++)
        {
            with (scr_fire_bullet(x, y, obj_regularbullet, 0, 0, spr_gerson_star7))
            {
                active = false;
                image_blend = c_gray;
                spinspeed = 15;
                spin = 1;
                grazepoints = 2;
                var aa = (global.hp[2] - 30) / 250;
                if (aa < 0)
                    aa = 0;
                damage = lerp(12, 90, aa);
                if (global.chararmor1[2] == 23 || global.chararmor2[2] == 23)
                    damage = round(damage * 0.15);
                scr_script_delayed(scr_var, 8, "image_blend", 10855845);
                scr_script_delayed(scr_var, 9, "image_blend", 13421772);
                scr_script_delayed(scr_var, 10, "image_blend", 15921906);
                scr_script_delayed(scr_var, 11, "image_blend", 16777215);
                scr_script_delayed(scr_var, 11, "active", true);
                scr_darksize();
                image_xscale = 1.5;
                image_yscale = 1.5;
                if (irandom(1))
                {
                    image_xscale -= 0.5;
                    image_yscale -= 0.5;
                }
                direction = 90 + (4 * a);
                speed = 12;
                direction += random_range(-1, 1);
                speed += random_range(-1, 1);
                hspeed *= 0.5;
                gravity_direction = 270;
                gravity = 0.535;
            }
        }
        for (var a = -5; a < 5; a++)
        {
            with (scr_fire_bullet(x + 24, y, obj_regularbullet, 0, 0, spr_gerson_star7))
            {
                active = false;
                image_blend = c_gray;
                spinspeed = 15;
                spin = 1;
                grazepoints = 2;
                var aa = (global.hp[2] - 30) / 250;
                if (aa < 0)
                    aa = 0;
                damage = lerp(12, 90, aa);
                if (global.chararmor1[2] == 23 || global.chararmor2[2] == 23)
                    damage = round(damage * 0.15);
                scr_script_delayed(scr_var, 8, "image_blend", 10855845);
                scr_script_delayed(scr_var, 9, "image_blend", 13421772);
                scr_script_delayed(scr_var, 10, "image_blend", 15921906);
                scr_script_delayed(scr_var, 11, "image_blend", 16777215);
                scr_script_delayed(scr_var, 11, "active", true);
                scr_darksize();
                image_xscale = 1.5;
                image_yscale = 1.5;
                if (irandom(1))
                {
                    image_xscale -= 0.5;
                    image_yscale -= 0.5;
                }
                direction = 90 + (7 * a);
                speed = 13.25;
                direction += random_range(-1, 1);
                speed += random_range(-1, 1);
                hspeed *= 0.5;
                gravity_direction = 270;
                gravity = 0.5;
            }
        }
        for (var a = -4; a < 4; a++)
        {
            with (scr_fire_bullet(x, y, obj_regularbullet, 0, 0, spr_gerson_star7))
            {
                active = false;
                image_blend = c_gray;
                spinspeed = 15;
                spin = 1;
                grazepoints = 2;
                var aa = (global.hp[2] - 30) / 250;
                if (aa < 0)
                    aa = 0;
                damage = lerp(12, 90, aa);
                if (global.chararmor1[2] == 23 || global.chararmor2[2] == 23)
                    damage = round(damage * 0.15);
                scr_script_delayed(scr_var, 8, "image_blend", 10855845);
                scr_script_delayed(scr_var, 9, "image_blend", 13421772);
                scr_script_delayed(scr_var, 10, "image_blend", 15921906);
                scr_script_delayed(scr_var, 11, "image_blend", 16777215);
                scr_script_delayed(scr_var, 11, "active", true);
                scr_darksize();
                image_xscale = 1.5;
                image_yscale = 1.5;
                if (irandom(1))
                {
                    image_xscale -= 0.5;
                    image_yscale -= 0.5;
                }
                direction = 90 + (6 * a);
                speed = 14.5;
                direction += random_range(-1, 1);
                speed += random_range(-1, 1);
                hspeed *= 0.5;
                gravity_direction = 270;
                gravity = 0.465;
            }
        }
        for (var a = -3; a < 3; a++)
        {
            with (scr_fire_bullet(x - 24, y, obj_regularbullet, 0, 0, spr_gerson_star7))
            {
                active = false;
                image_blend = c_gray;
                spinspeed = 15;
                spin = 1;
                grazepoints = 2;
                var aa = (global.hp[2] - 30) / 250;
                if (aa < 0)
                    aa = 0;
                damage = lerp(12, 90, aa);
                if (global.chararmor1[2] == 23 || global.chararmor2[2] == 23)
                    damage = round(damage * 0.15);
                scr_script_delayed(scr_var, 8, "image_blend", 10855845);
                scr_script_delayed(scr_var, 9, "image_blend", 13421772);
                scr_script_delayed(scr_var, 10, "image_blend", 15921906);
                scr_script_delayed(scr_var, 11, "image_blend", 16777215);
                scr_script_delayed(scr_var, 11, "active", true);
                scr_darksize();
                image_xscale = 1.5;
                image_yscale = 1.5;
                if (irandom(1))
                {
                    image_xscale -= 0.5;
                    image_yscale -= 0.5;
                }
                direction = 90 + (5 * a);
                speed = 15.75;
                direction += random_range(-1, 1);
                speed += random_range(-1, 1);
                hspeed *= 0.5;
                gravity_direction = 270;
                gravity = 0.43;
            }
        }
        im_done = true;
    }
}
if (x < (obj_growtangle.x - 73) && hspeed < 0 && left_timer == -1)
    left_timer = 0;
if (x > (obj_growtangle.x + 92) && hspeed > 0 && right_timer == -1)
    right_timer = 0;
if (left_timer > -1)
    left_timer++;
if (right_timer > -1)
    right_timer++;
if (top_timer > -1)
    top_timer++;
switch (left_timer)
{
    case 1:
        gerson_x = x + (hspeed * 6);
        gerson_y = y + (vspeed * 6);
        with (instance_create(gerson_x - 108, gerson_y + 24, obj_gerson_teleport_generic))
            scr_script_delayed(instance_destroy, 4);
        break;
    case 5:
        with (instance_create(gerson_x - 40, gerson_y, obj_battle_marker))
        {
            shell_controlled = true;
            destroyoncomplete = true;
            sprite_index = spr_gerson_swing;
            image_index = 3;
            scr_darksize();
            image_xscale *= -1;
            scr_lerpvar("image_index", 3, 6, 6);
            scr_script_delayed(instance_destroy, 10);
        }
        break;
    case 7:
        snd_play(snd_queen_punched_lower);
        counter++;
        if (counter < 7)
        {
            var dir = scr_at_player(x, y);
            if (irandom(1))
            {
                if (check_bounds(point_direction(x, y, obj_heart.x + 10, (scr_get_box(3) - (obj_heart.y + 10)) + scr_get_box(3))))
                    dir = point_direction(x, y, obj_heart.x + 10, (scr_get_box(3) - (obj_heart.y + 10)) + scr_get_box(3));
                if (check_bounds(point_direction(x, y, obj_heart.x + 10, scr_get_box(1) - ((obj_heart.y + 10) - scr_get_box(1)))))
                    dir = point_direction(x, y, obj_heart.x + 10, scr_get_box(1) - ((obj_heart.y + 10) - scr_get_box(1)));
            }
            direction = dir;
            speed = scr_approach(speed, 15, 1.5);
        }
        else
        {
            direction = point_direction(x, y, scr_get_box(4), scr_get_box(1) - 80);
            speed = abs(point_distance(scr_get_box(4), scr_get_box(1) - 80, x, y)) / 30;
            top_timer = 0;
        }
        image_speed = 8;
        break;
    case 15:
        with (instance_create(gerson_x - 108, gerson_y + 24, obj_gerson_teleport_generic))
            scr_script_delayed(instance_destroy, 4);
        left_timer = -1;
        break;
}
switch (right_timer)
{
    case 1:
        gerson_x = x + (hspeed * 6);
        gerson_y = y + (vspeed * 6);
        with (instance_create(gerson_x + 40, gerson_y + 16, obj_gerson_teleport_generic))
            scr_script_delayed(instance_destroy, 4);
        break;
    case 5:
        with (instance_create(gerson_x - 8, gerson_y, obj_battle_marker))
        {
            shell_controlled = true;
            destroyoncomplete = true;
            sprite_index = spr_gerson_swing;
            image_index = 3;
            scr_darksize();
            scr_lerpvar("image_index", 3, 6, 6);
            scr_script_delayed(instance_destroy, 10);
        }
        break;
    case 7:
        snd_play(snd_queen_punched_lower);
        counter++;
        if (counter < 7)
        {
            var dir = scr_at_player(x, y);
            if (irandom(1))
            {
                if (check_bounds(point_direction(x, y, obj_heart.x + 10, (scr_get_box(3) - (obj_heart.y + 10)) + scr_get_box(3))))
                    dir = point_direction(x, y, obj_heart.x + 10, (scr_get_box(3) - (obj_heart.y + 10)) + scr_get_box(3));
                if (check_bounds(point_direction(x, y, obj_heart.x + 10, scr_get_box(1) - ((obj_heart.y + 10) - scr_get_box(1)))))
                    dir = point_direction(x, y, obj_heart.x + 10, scr_get_box(1) - ((obj_heart.y + 10) - scr_get_box(1)));
            }
            direction = dir;
            speed = scr_approach(speed, 15, 1.5);
        }
        else
        {
            direction = point_direction(x, y, scr_get_box(4), scr_get_box(1) - 80);
            speed = abs(point_distance(scr_get_box(4), scr_get_box(1) - 80, x, y)) / 30;
            top_timer = 0;
        }
        image_speed = 8;
        break;
    case 15:
        with (instance_create(gerson_x + 40, gerson_y + 16, obj_gerson_teleport_generic))
            scr_script_delayed(instance_destroy, 4);
        right_timer = -1;
        break;
}
switch (top_timer)
{
    case 0:
        scr_lerpvar("image_angle", image_angle, image_angle + 270, 30, 2, "out");
        with (instance_create(scr_get_box(4), scr_get_box(1) + 80, obj_battle_marker))
        {
            shell_controlled = true;
            destroyoncomplete = true;
            sprite_index = spr_gerson_swing_down_new;
            depth = obj_growtangle.depth + 1;
            image_index = 0;
            image_speed = 0;
            image_alpha = 0;
            scr_darksize();
            scr_lerpvar("image_alpha", 0, 1, 4);
            scr_lerpvar("image_index", 0, 1, 6);
            scr_lerpvar("y", y, y - 240, 29, 2, "out");
            snd_play(snd_jump);
        }
        break;
    case 29:
        with (obj_battle_marker)
        {
            if (sprite_index == spr_gerson_swing_down_new)
            {
                depth = obj_growtangle.depth - 1;
                scr_lerpvar("image_index", 2, 4, 2);
                scr_lerpvar("y", y, y + 80, 8, 2, "out");
            }
        }
        break;
    case 30:
        scr_shakescreen();
        snd_play(snd_queen_punched_lower_heavy);
        snd_play(snd_rudebuster_swing);
        with (scr_sonic_boom(270, 2))
            y += 20;
        with (scr_sonic_boom(270, 3))
            y += 40;
        direction = 270;
        image_angle = 90;
        speed = 30;
        image_speed = 8;
        break;
    case 36:
        with (obj_battle_marker)
        {
            if (sprite_index == spr_gerson_swing_down_new)
                scr_script_delayed(instance_destroy, 4);
        }
        break;
}

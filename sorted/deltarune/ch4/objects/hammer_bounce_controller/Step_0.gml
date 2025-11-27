timer++;
full_timer++;
switch (timer)
{
    case 15:
        visible = false;
        instance_create(x + 64, y + 36, obj_gerson_teleport_generic);
        x = obj_growtangle.x + 80;
        y = obj_growtangle.y - 20;
        anchor_x = x;
        anchor_y = y;
        break;
    case 19:
        with (obj_gerson_teleport_generic)
            instance_destroy();
        sprite_index = spr_gerson_swing;
        instance_create(x + 58, y + 36, obj_gerson_teleport_generic);
        break;
    case 23:
        with (obj_gerson_teleport_generic)
            instance_destroy();
        visible = true;
        image_index = 0;
        image_speed = 0;
        scr_lerpvar("image_index", 0, 6, 12);
        snd_play(motor_upper_quick_mid);
        break;
    case 31:
        snd_play(snd_queen_punched_lower);
        scr_shakeobj();
        with (obj_growtangle)
        {
            scr_lerpvar("x", x, x - 80, 10, 2, "out");
            scr_lerpvar("image_angle", image_angle, image_angle + 180, 12, 2, "out");
        }
        break;
    case 42:
        hammer_phase = 0;
        scr_script_delayed(scr_lerpvar, 4, "x", x, anchor_x + 60, 8, 2, "out");
        scr_script_delayed(scr_lerpvar, 4, "y", y, anchor_y, 8, 2, "out");
        sprite_index = spr_gerson_hammer_throw;
        image_index = 0;
        break;
}
if (timer > 30 && timer < 41)
{
    with (obj_growtangle)
    {
        with (scr_afterimagefast())
            fadeSpeed *= 3;
    }
}
if (hammer_phase == 0)
{
    hammer_timer++;
    if (hammer_timer == hammer_timer_goal)
    {
        hammer_timer = 0;
        hammer_timer_goal = scr_approach(hammer_timer_goal, 14, 3);
        snd_stop(snd_smallswing);
        snd_play_pitch(snd_smallswing, 1 + random(0.3));
        with (instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bounce_left))
        {
            scr_bullet_init();
            scr_darksize();
            image_xscale += 0.5;
            image_yscale += 0.5;
            hspeed = -15;
            depth -= 1;
            active = 1;
            target = 3;
            damage = 1;
            grazed = 0;
            grazepoints = 2.5;
        }
        var new_x = 0;
        if (x < anchor_x)
            new_x = 30 + irandom(30);
        else if (x > anchor_x)
            new_x = -30 - irandom(30);
        else
            new_x = choose(-60, 60);
        var ypos = clamp(obj_heart.y + 10 + irandom_range(-20, 20), scr_get_box(1) + 10, scr_get_box(3) - 20);
        scr_script_delayed(scr_jump_arc, 4, id, x, y, anchor_x + new_x, ypos, 40, 8);
        sprite_index = spr_gerson_hammer_throw;
        image_index = 0.1;
        if (hammer_timer_goal == 14)
            hammer_counter++;
        if (hammer_counter == 5)
        {
            hammer_counter = 0;
            hammer_timer = -8;
            hammer_phase = 1;
        }
    }
}
if (hammer_phase == 1)
{
    hammer_timer++;
    if (hammer_timer == 1)
    {
        snd_play_pitch(snd_jump, 2);
        scr_jump_arc(id, x, y, anchor_x, anchor_y, y - (__view_get(e__VW.YView, 0) + 60), 32);
        image_index = 0;
    }
    if (hammer_timer == 21)
    {
        with (obj_jump_arc)
            instance_destroy();
        y -= z;
        z = 0;
        snd_play(snd_boost);
        with (scr_custom_afterimage_ext(obj_oflash, sprite_index, image_index, x, y - z, image_xscale, image_yscale))
        {
            target = other.id;
            image_index = other.image_index;
            image_speed = 0;
            depth = other.depth - 1;
        }
        hammer_timer = 15;
        hammer_phase = 2;
        hammer_timer_goal = 25;
    }
}
if (hammer_phase == 2)
{
    hammer_timer++;
    if (hammer_timer == hammer_timer_goal)
    {
        var xoff = clamp(obj_heart.x + 10 + irandom_range(-15, 15), obj_growtangle.x - 60, obj_growtangle.x + 60);
        snd_stop(snd_smallswing);
        snd_play_pitch(snd_smallswing, 1 + random(0.3));
        sprite_index = spr_gerson_hammer_throw;
        image_index = 0.1;
        with (instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bounce_down))
        {
            scr_bullet_init();
            scr_darksize();
            image_xscale += 2;
            image_yscale += 2;
            direction = point_direction(x, y, obj_heart.x, obj_heart.y);
            speed = 14;
            depth -= 1;
            active = 1;
            target = 3;
            damage = 1;
            grazed = 0;
            grazepoints = 2.5;
            destroyonhit = false;
        }
        hammer_timer = 0;
    }
}
if ((403 - full_timer) < 8 && ending_counter == 0)
{
    ending_counter = 1;
    visible = false;
    instance_create(x, y - 40, obj_gerson_teleport_generic);
}
if ((403 - full_timer) < 4 && ending_counter == 1)
{
    ending_counter = 2;
    with (obj_gerson_teleport_generic)
        instance_destroy();
    instance_create(obj_hammer_of_justice_enemy.x + 68, obj_hammer_of_justice_enemy.y + 36, obj_gerson_teleport_generic);
}
if ((403 - full_timer) < 2 && ending_counter == 2)
{
    ending_counter = 3;
    global.turntimer = 1;
}
if (global.turntimer < 1)
{
    with (obj_gerson_teleport_generic)
        instance_destroy();
    with (obj_hammer_of_justice_enemy)
        visible = true;
    instance_destroy();
}
if (sprite_index == spr_gerson_hammer_throw && image_index > 0)
{
    image_index = scr_approach(image_index, 3, 0.5);
    if (image_index == 3)
        image_index = 0;
}
with (obj_heart)
{
    if (place_meeting(x, y, obj_battlesolid))
    {
        x += lengthdir_x(1, point_direction(x + 10, y + 10, obj_growtangle.x, obj_growtangle.y));
        y += lengthdir_y(1, point_direction(x + 10, y + 10, obj_growtangle.x, obj_growtangle.y));
    }
}

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

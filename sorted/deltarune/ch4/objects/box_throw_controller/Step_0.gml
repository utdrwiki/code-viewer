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
            scr_lerpvar("image_angle", image_angle, image_angle + 135, 12, 2, "out");
        }
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
    if (timer > 84)
    {
        timer -= (30 + irandom(12));
        snd_play_pitch(snd_jump, 2);
        var new_x = 0;
        if (x < anchor_x)
            new_x = 30 + irandom(30);
        else if (x > anchor_x)
            new_x = -30 - irandom(30);
        else
            new_x = choose(-60, 60);
        scr_jump_arc(id, x, y, anchor_x + new_x, anchor_y + irandom_range(-20, 20), 70 + irandom(30), 24);
    }
}
if (timer > 36)
    hammer_timer++;
if (hammer_phase == 0)
{
    if (hammer_timer == hammer_timer_goal)
    {
        snd_stop(snd_smallswing);
        snd_play_pitch(snd_smallswing, 1 + random(0.3));
        var hammer_amount = 3 + irandom(1);
        if (!irandom(3))
            hammer_cmount = 2;
        var hammer_type = 1;
        var small_offset = irandom_range(-30, 30);
        for (var a = 0; a < hammer_amount; a++)
        {
            with (instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bro_hammer))
            {
                scr_bullet_init();
                active = 1;
                scr_darksize();
                if (hammer_type)
                    fakehspeed = (-abs(x - (obj_growtangle.x + small_offset)) / 45) + (-2 + ((4 / (hammer_amount - 1)) * a)) + random_range(-0.5, 0.5);
                else
                    fakehspeed = -abs(x - (obj_growtangle.x + small_offset)) / 45;
                if (hammer_type)
                    fakevspeed = -14 + (-1 + ((2 / (hammer_amount - 1)) * a)) + random_range(-1, 1);
                else
                    fakevspeed = -14;
                gravity_direction = 270;
                fakegravity = 0.6;
                depth -= 1;
                target = 3;
                damage = 1;
                grazed = 0;
                grazepoints = 2.5;
            }
        }
        sprite_index = spr_gerson_hammer_throw;
        image_index = 0.1;
        hammer_timer = 0;
        hammer_counter++;
        if (hammer_counter == 16)
        {
            hammer_counter = 0;
            hammer_phase = 1;
            hammer_timer = -12;
            hammer_timer_goal = 3;
        }
    }
}
if (hammer_phase == 1)
{
    if (hammer_timer == hammer_timer_goal)
    {
        snd_stop(snd_smallswing);
        snd_play_pitch(snd_smallswing, 0.75 + random(0.3));
        var hammer_amount = 1;
        for (var a = 0; a < hammer_amount; a++)
        {
            with (instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bro_hammer))
            {
                scr_bullet_init();
                active = 1;
                scr_darksize();
                image_xscale++;
                image_yscale++;
                if (hammer_amount == 1)
                {
                    fakehspeed = -abs((x - (obj_growtangle.x + (sin(other.full_timer * 0.325) * 80))) / 45) + random_range(-0.25, 0.25);
                    fakevspeed = -14 + random_range(-0.5, 0.5);
                }
                else
                {
                    fakehspeed = (-abs(x - (obj_growtangle.x + (sin(other.full_timer * 0.325) * 80))) / 45) + ((-hammer_amount * 0.75) + (((hammer_amount * 2 * 0.75) / (hammer_amount - 1)) * a)) + random_range(-0.25, 0.25);
                    fakevspeed = -14 + (-1 + ((2 / (hammer_amount - 1)) * a)) + random_range(-0.5, 0.5);
                }
                gravity_direction = 270;
                fakegravity = 0.6;
                depth -= 1;
                target = 3;
                damage = 1;
                grazed = 0;
                grazepoints = 2.5;
            }
        }
        sprite_index = spr_gerson_hammer_throw;
        image_index = 0.1;
        hammer_timer = 0;
        hammer_counter++;
        if ((hammer_counter % 5) == 0)
            hammer_timer = -4;
        if (hammer_counter == 25)
        {
            hammer_counter = 0;
            hammer_phase = 2;
            hammer_timer = 0;
        }
    }
}
if (hammer_phase == 2)
{
    if (hammer_timer == 1)
    {
        snd_play_pitch(snd_jump, 2);
        scr_jump_arc(id, x, y, xstart - 30, ystart, 80, 32);
        image_index = 0;
        snd_play(snd_boost);
        my_flash = scr_custom_afterimage_ext(obj_oflash, sprite_index, image_index, x, y - z, image_xscale, image_yscale);
        with (my_flash)
        {
            target = other.id;
            image_index = other.image_index;
            image_speed = 0;
            depth = other.depth - 1;
        }
    }
    if (hammer_timer >= 2 && hammer_timer < 24 && (hammer_timer % 3) == 0)
    {
        with (scr_oflash())
        {
            depth += 1;
            y -= other.z;
            flashcolor = c_lime;
        }
    }
    if (hammer_timer == 9)
    {
        snd_stop(snd_smallswing);
        snd_play_pitch(snd_smallswing, 0.5);
        with (instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_hammer_bro_hammer))
        {
            scr_bullet_init();
            scr_darksize();
            image_xscale += 6;
            image_yscale += 6;
            mask_index = spr_gerson_gigahammer_mask;
            fakehspeed = -abs((x - obj_growtangle.x) / 25.5);
            fakevspeed = -16;
            destroyonhit = false;
            gigahammer = true;
            gravity_direction = 270;
            fakegravity = 0.6;
            depth = other.depth + 1;
            target = 3;
            damage = 1;
            grazed = 0;
            grazepoints = 2.5;
        }
        sprite_index = spr_gerson_hammer_throw;
        image_index = 0.1;
    }
    if (hammer_timer == 36)
    {
        sprite_index = spr_gerson_spin;
        image_speed = 0.125;
        x += 60;
        y += 60;
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
if (sprite_index == spr_gerson_spin)
    image_index %= 4;
if (sprite_index == spr_gerson_hammer_throw && image_index > 0)
{
    image_index = scr_approach(image_index, 3, 0.5);
    if (image_index == 3)
    {
        if (hammer_phase == 2)
            image_index = 2;
        else
            image_index = 0;
    }
}
with (obj_heart)
{
    if (place_meeting(x, y, obj_battlesolid))
    {
        x += lengthdir_x(1, point_direction(x + 10, y + 10, obj_growtangle.x, obj_growtangle.y));
        y += lengthdir_y(1, point_direction(x + 10, y + 10, obj_growtangle.x, obj_growtangle.y));
    }
}

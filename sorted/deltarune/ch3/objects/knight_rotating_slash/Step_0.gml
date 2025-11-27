obj_knight_enemy.siner2 = 0;
anchor_x = obj_knight_enemy.x;
anchor_y = obj_knight_enemy.y;
local_turntimer--;
if (local_turntimer < 240 && next_up == 1)
{
    var knight_stream = instance_create(obj_knight_enemy.x, obj_knight_enemy.y, obj_roaringknight_quickslash_attack);
    scr_bullet_inherit(knight_stream);
    knight_stream.creatorid = creatorid;
    knight_stream.creator = creator;
    with (knight_stream)
    {
        with (instance_create_depth(x, y, depth, obj_knight_warp))
        {
            other.x += 50;
            other.y -= 44;
            master = other.id;
            event_user(0);
        }
        turn_type = "end";
        if (other.turn_segment == 0)
        {
            turn_type = "short mid";
            turn_segment = 1;
            next_up = other.next_next_up;
        }
        if (other.turn_segment == 1)
        {
            turn_type = "short end";
            turn_segment = 2;
        }
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
        timer = spawn_speed;
    }
    next_up = -999;
}
if (local_turntimer < 220 && next_up == 3)
{
    var knight_stream = instance_create(obj_knight_enemy.x, obj_knight_enemy.y, obj_knight_tunnel_slasher_2_revised);
    scr_bullet_inherit(knight_stream);
    knight_stream.creatorid = creatorid;
    knight_stream.creator = creator;
    with (knight_stream)
    {
        with (instance_create_depth(x, y, depth, obj_knight_warp))
        {
            other.x += 25;
            other.y -= 44;
            master = other.id;
            event_user(0);
        }
        turn_type = "end";
        if (other.turn_segment == 0)
        {
            turn_type = "short mid";
            turn_segment = 1;
            next_up = other.next_next_up;
            timer = -8;
        }
        if (other.turn_segment == 1)
        {
            turn_type = "short mid";
            turn_segment = 2;
        }
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
        if (turn_type == "short mid" || turn_type == "short end")
        {
            timer = -12;
            local_turntimer += 12;
        }
    }
    next_up = -999;
}
if (local_turntimer < turn_limit_4 && next_up == 4)
{
    var knight_stream = instance_create(obj_knight_enemy.x, obj_knight_enemy.y, obj_knight_swordfall);
    scr_bullet_inherit(knight_stream);
    knight_stream.creatorid = creatorid;
    knight_stream.creator = creator;
    with (knight_stream)
    {
        with (instance_create_depth(x, y, depth, obj_knight_warp))
        {
            other.x -= 60;
            other.y -= 44;
            master = other.id;
            event_user(0);
        }
        turn_type = "end";
        if (other.turn_segment == 0)
        {
            turn_type = "short mid";
            turn_segment = 1;
            next_up = other.next_next_up;
        }
        if (other.turn_segment == 1)
        {
            turn_type = "short end";
            turn_segment = 2;
        }
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
    }
    next_up = -999;
}
if (local_turntimer < turn_limit_4 && next_up == 5)
{
    var knight_stream = instance_create(obj_knight_enemy.x, obj_knight_enemy.y, obj_knight_weird_bottom_manager);
    scr_bullet_inherit(knight_stream);
    knight_stream.creatorid = creatorid;
    knight_stream.creator = creator;
    with (knight_stream)
    {
        turn_type = "end";
        if (other.turn_segment == 0)
        {
            turn_type = "short mid";
            turn_segment = 1;
            next_up = other.next_next_up;
        }
        if (other.turn_segment == 1)
        {
            turn_type = "short end";
            turn_segment = 2;
        }
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
        init_start = 4;
        init = 8;
    }
    next_up = -999;
}
if ((global.time % 4) == 0 && image_alpha != 0)
{
    fade = scr_afterimage();
    fade.depth = creatorid.depth + 1;
    fade.depth = obj_knight_enemy.depth + 1;
    fade.image_alpha = 0.6;
    fade.fadeSpeed = 0.04;
    fade.hspeed = 4;
}
if (line2 > -1)
{
    line2++;
    line2 %= 8;
}
if (line3 > -1)
{
    line3++;
    line3 %= 8;
}
if (image_index >= 5 && aim_type != 2)
{
    image_index = 5;
    image_speed = 0;
}
if (state == "intro")
{
    timer++;
    if (timer > 16)
    {
        state = "aim";
        timer = 0;
    }
}
if (state == "aim")
{
    timer++;
    if (timer == 1)
    {
        snd_stop(snd_knight_rotatingslash_line);
        snd_loop(snd_knight_rotatingslash_line);
        rotation = rotation_base;
        spin = choose(-1, 1);
        circle_size = 0;
        r = 128;
        g = 128;
        b = 128;
        movebox_x += (20 + irandom(40));
        movebox_y += (30 + irandom(60));
        if (movebox_x > 80)
            movebox_x -= 80;
        if (movebox_y > 120)
            movebox_y -= 120;
        if (aim_type != 2)
        {
            image_index = 1;
        }
        else
        {
            sprite_index = spr_roaringknight_flurry_prepare;
            image_index = 0;
        }
        scr_lerpvar("x", x, (scr_get_box(0) - 20) + movebox_x, (slash_base + slash_offset) - 8, 1, "out");
        scr_lerpvar("y", y, (scr_get_box(1) - 20) + movebox_y, (slash_base + slash_offset) - 8, 1, "out");
    }
    aim_direction += (rotation * spin);
    rotation = scr_approach(rotation, rotation_goal, rotation_change);
    if (timer == 1)
    {
        if (aim_type == 0)
        {
            aim_x = obj_heart.x + 10;
            aim_y = obj_heart.y + 10;
        }
        instance_create(aim_x, aim_y, obj_knight_circle);
    }
    else
    {
        r = scr_approach(r, 255, 9.142857142857142);
        g = scr_approach(g, 0, 9.142857142857142);
        b = scr_approach(b, 0, 9.142857142857142);
    }
    if (timer == floor((slash_base + slash_offset) * 0.5) && aim_type != 2)
        image_index++;
    if (timer == (slash_base + slash_offset))
    {
        if (aim_type != 2)
        {
            image_speed = 0.5;
        }
        else
        {
            scr_var_delayed("sprite_index", 3329, 4);
            scr_var_delayed("image_speed", 1, 4);
        }
    }
    if (timer == (slash_base + 6 + slash_offset))
    {
        state = "slash";
        timer = 0;
    }
}
if (state == "slash")
{
    timer++;
    if (timer == 1)
    {
        snd_stop(snd_knight_rotatingslash_line);
        ds_list_clear(slash_list);
        for (a = 0; a < slash_number; a++)
            ds_list_add(slash_list, ((360 / (other.slash_number * 2)) * other.a) + other.random_offset + other.aim_direction);
        ds_list_shuffle(slash_list);
        snd_play(snd_knight_cut);
        snd_play(snd_explosion_firework);
    }
    if ((timer - 1) < ds_list_size(slash_list))
    {
        var slashid;
        with (instance_create(aim_x, aim_y, obj_roaringknight_slash))
        {
            direction = ds_list_find_value(other.slash_list, other.timer - 1);
            image_xscale = 2;
            image_angle = direction;
            visible = false;
            width *= 2;
            aoe = true;
            slashid = id;
            var markscalex = 5 + random(3);
            var markscaley = 2 + random(1);
            with (instance_create(x, y, obj_particle_generic))
            {
                depth += 100;
                sprite_index = spr_knight_slash_mark;
                image_blend = c_red;
                image_angle = other.image_angle;
                image_xscale = markscalex;
                image_yscale = markscaley;
                scr_lerpvar("image_xscale", image_xscale, 0, 4);
                scr_lerpvar("image_yscale", image_yscale, 0, 4);
                scr_script_delayed(instance_destroy, 4);
            }
            with (instance_create(x, y, obj_particle_generic))
            {
                depth += 99;
                sprite_index = spr_knight_slash_mark;
                image_blend = c_black;
                image_angle = other.image_angle;
                image_xscale = markscaley * 0.85;
                image_yscale = markscaley * 0.85;
                scr_lerpvar("image_xscale", image_xscale, 0, 4);
                scr_lerpvar("image_yscale", image_yscale, 0, 4);
                scr_script_delayed(instance_destroy, 4);
            }
            repeat (4 + irandom(3))
            {
                var faade = 12 + irandom(8);
                var diist = -20 + random(60);
                with (instance_create(x, y, obj_particle_generic))
                {
                    speed = 6 + random(4);
                    image_angle = other.image_angle + random_range(-10, 10);
                    direction = image_angle;
                    repeat (50)
                    {
                        x += lengthdir_x(5, direction);
                        y += lengthdir_y(5, direction);
                        if (x < scr_get_box(2) || x > scr_get_box(0) || y < scr_get_box(1) || y > scr_get_box(3))
                            break;
                    }
                    x += lengthdir_x(diist, direction);
                    y += lengthdir_y(diist, direction);
                    depth += 101;
                    sprite_index = spr_knight_slash_mark;
                    image_blend = c_red;
                    image_xscale = 0.3;
                    image_yscale = 0.15;
                    scr_lerpvar("image_xscale", image_xscale, 0, faade);
                    scr_lerpvar("image_yscale", image_yscale, 0, faade);
                    scr_script_delayed(instance_destroy, faade);
                }
            }
            repeat (4 + irandom(3))
            {
                var faade = 12 + irandom(8);
                var diist = -20 + random(60);
                with (instance_create(x, y, obj_particle_generic))
                {
                    speed = 6 + random(4);
                    image_angle = other.image_angle + 180 + random_range(-10, 10);
                    direction = image_angle;
                    repeat (50)
                    {
                        x += lengthdir_x(5, direction);
                        y += lengthdir_y(5, direction);
                        if (x < scr_get_box(2) || x > scr_get_box(0) || y < scr_get_box(1) || y > scr_get_box(3))
                            break;
                    }
                    x += lengthdir_x(diist, direction);
                    y += lengthdir_y(diist, direction);
                    image_blend = c_red;
                    depth += 101;
                    sprite_index = spr_knight_slash_mark;
                    image_xscale = 0.3;
                    image_yscale = 0.15;
                    scr_lerpvar("image_xscale", image_xscale, 0, faade);
                    scr_lerpvar("image_yscale", image_yscale, 0, faade);
                    scr_script_delayed(instance_destroy, faade);
                }
            }
        }
        scr_bullet_inherit(slashid);
        with (slashid)
            event_user(0);
    }
    if (timer == slash_timer)
    {
        state = "cooldown";
        timer = 0;
    }
}
if (state == "cooldown")
{
    timer++;
    if (timer == cooldown_time || local_turntimer < 200)
    {
        slash_counter++;
        if (slash_counter < array_length(slash_array))
        {
            slash_number = slash_array[slash_counter];
            slash_offset = scr_approach(slash_offset, 0, 6);
            slash_base = scr_approach(slash_base, 15, 1);
        }
        if (local_turntimer < 200 && !slashes_done)
        {
            slashes_done = true;
            local_turntimer = 99999;
        }
        if (slashes_done)
        {
            if (difficulty == 2 && turn_type == "full")
            {
                if (do_final)
                {
                    snd_play(snd_knight_puff);
                    snd_play_x(snd_knight_teleport, 1, 0.5);
                    rotation_base = 18;
                    rotation_change = 0.5;
                    line_width = 4;
                    with (instance_create(mean(scr_get_box(2), scr_get_box(0)), mean(scr_get_box(1), scr_get_box(3)), obj_afterimage_screen))
                    {
                        faderate = 0.05;
                        draw_end = true;
                    }
                    slash_number = 1;
                    slash_base = 24;
                    cooldown_time = 2;
                    slash_timer = 2;
                    aim_type = scr_approach(aim_type, 2, 1);
                    do_final = false;
                    aim_x = mean(scr_get_box(2), scr_get_box(0));
                    aim_y = mean(scr_get_box(1), scr_get_box(3));
                }
            }
            else
            {
                if (turn_type == "start" || turn_type == "short start" || turn_type == "short mid")
                {
                    with (instance_create_depth(x, y, depth, obj_knight_warp))
                    {
                        master = other.id;
                        event_user(1);
                    }
                    scr_script_delayed(scr_var, 2, "image_index", 4);
                    scr_script_delayed(scr_var, 4, "image_index", 0);
                    alarm[2] = 4;
                    exit;
                }
                debug = true;
                state = "return";
                timer = 0;
                scr_script_delayed(scr_var, 8, "image_index", 0);
                scr_script_delayed(scr_lerpvar, 8, "x", x, anchor_x, 12, 1, "out");
                scr_script_delayed(scr_lerpvar, 8, "y", y, anchor_y, 12, 1, "out");
                alarm[3] = 22;
                exit;
            }
        }
        if (aim_type < 2)
        {
            state = "aim";
            timer = 0;
            if (aim_type == 1)
            {
                line2 = 0;
                alarm[1] = 4;
                aim_type = scr_approach(aim_type, 2, 1);
                exit;
            }
        }
        if (aim_type == 2)
        {
            state = "slash";
            timer = 0;
            aim_direction += (speed_gain * spin);
            speed_gain = scr_approach(speed_gain, 24, 1);
            final_counter++;
            if (final_counter == 28)
            {
                state = "return";
                scr_var("sprite_index", 2128);
                scr_var("image_index", 0);
                scr_var("image_speed", 0);
                with (obj_lerpvar)
                {
                    if (target == other.id)
                        instance_destroy();
                }
                scr_lerpvar("x", x, anchor_x, 12, 1, "out");
                scr_lerpvar("y", y, anchor_y, 12, 1, "out");
                alarm[3] = 22;
                timer = 0;
            }
            else
            {
                movebox_x += (20 + irandom(40));
                movebox_y += (30 + irandom(60));
                sprite_index = spr_roaringknight_flurry;
                image_speed = 1;
                if (movebox_x > 80)
                    movebox_x -= 80;
                if (movebox_y > 120)
                    movebox_y -= 120;
                scr_lerpvar("x", x, (scr_get_box(0) - 20) + movebox_x, (slash_base + slash_offset) - 8, 1, "out");
                scr_lerpvar("y", y, (scr_get_box(1) - 20) + movebox_y, (slash_base + slash_offset) - 8, 1, "out");
            }
        }
    }
}

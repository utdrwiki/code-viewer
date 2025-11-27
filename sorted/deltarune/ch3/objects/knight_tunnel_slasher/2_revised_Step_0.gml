obj_knight_enemy.siner2 = 0;
anchor_x = obj_knight_enemy.x;
anchor_y = obj_knight_enemy.y;
local_turntimer--;
if (local_turntimer < turntimer_limit && next_up == 4)
{
    var knight_stream = instance_create(obj_knight_enemy.x - 100, obj_knight_enemy.y - 88, obj_knight_swordfall);
    scr_bullet_inherit(knight_stream);
    knight_stream.creatorid = creatorid;
    knight_stream.creator = creator;
    with (knight_stream)
    {
        x -= 20;
        y -= 66;
        with (instance_create_depth(x, y, depth, obj_knight_warp))
        {
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
if (local_turntimer < turntimer_limit && next_up == 5)
{
    var knight_stream = instance_create(obj_knight_enemy.x - 100, obj_knight_enemy.y - 88, obj_knight_weird_bottom_manager);
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
        init_start = 3;
        init = 6;
    }
    next_up = -999;
}
if (local_turntimer < 60 && (turn_type == "full" || next_up == -1))
{
    timer = 0;
    fake_timer = -99999;
    local_turntimer = 99999;
    state = "final";
    exit;
}
if (state == "final")
{
    timer++;
    if (timer == 1)
    {
        sprite_index = spr_roaringknight_noarm;
        scr_lerpvar("armpoint", 0, -75, 12, 2, "out");
        with (obj_knight_diamondswordbullet_ext)
        {
            if (x < scr_get_box(2))
                active = false;
        }
        with (obj_knight_diamondswordbullet_ext)
        {
            if (!active)
            {
                scr_lerpvar("image_alpha", image_alpha, 0, 8);
                scr_script_delayed(instance_destroy, 8);
            }
            else
            {
                shakeme = true;
            }
        }
    }
    if (timer == 12)
    {
        if (i_ex(obj_knight_diamondswordbullet_ext))
            snd_play(snd_jump);
        snd_stop(snd_shinka_ambience);
        with (obj_knight_diamondswordbullet_ext)
        {
            with (obj_knight_diamondswordbullet_ext)
                event_user(0);
        }
    }
    if (timer == 33)
    {
        if (i_ex(obj_knight_diamondswordbullet_ext))
            snd_play(snd_knight_cut);
        armpoint_index = 1;
    }
    if (timer < 12)
    {
        with (obj_knight_diamondswordbullet_ext)
        {
            if (!active)
                continue;
            gravity = 0;
            hspeed *= 0.9;
            vspeed *= 0.9;
        }
    }
    if (timer == 52)
    {
        scr_lerpvar("image_index", image_index, 0, 8);
        scr_script_delayed(scr_lerpvar, 16, "x", x, anchor_x, 24, 2, "out");
        scr_script_delayed(scr_lerpvar, 16, "y", y, anchor_y, 24, 2, "out");
    }
    if (timer == 92)
    {
        instance_destroy();
        with (obj_knight_enemy)
            image_alpha = 1;
        global.turntimer = -1;
    }
    exit;
}
if (local_turntimer < 40)
{
    timer = -99999;
    fake_timer = -99999;
    local_turntimer = 99999;
    if (turn_type == "end" || turn_type == "short end")
    {
        scr_lerpvar("image_index", image_index, 0, 8);
        scr_script_delayed(scr_lerpvar, 16, "x", x, anchor_x, 24, 2, "out");
        scr_script_delayed(scr_lerpvar, 16, "y", y, anchor_y, 24, 2, "out");
        scr_script_delayed(instance_destroy, 40);
    }
    else
    {
        alarm[2] = 1;
    }
    exit;
}
if (con == 0)
{
    con = -1;
    con = 0.1;
}
if (con == 0.1 || con == 0.2)
{
    introtimer++;
    if (introtimer == 5)
    {
        con = 0.2;
        sprite_index = spr_roaringknight_point_ol;
        image_index = 0;
        image_speed = 0;
        scr_lerpvar("image_index", 0, 4, 15, 2, "out");
        scr_lerpvar("x", x, x + 40, 15, 2, "out");
        scr_lerpvar("y", y, scr_get_box(5) - 100, 15, 2, "out");
        if (obj_knight_enemy.myattackchoice == 3)
            snd_loop(snd_shinka_ambience);
    }
    if (introtimer == 20)
        scr_lerpvar("knightafterimagerange", knightafterimagerange, 4, 30);
    if (introtimer == 25)
    {
        con = 1;
        introtimer = 0;
    }
}
if ((con >= 0.2 && (turn_type == "full" || turn_type == "start" || turn_type == "short start")) || con)
{
    timer++;
    fake_timer++;
    if (timer >= 8)
    {
        var newpos = old_pos + 15 + irandom(90);
        if (newpos > 60)
            newpos -= 120;
        old_pos = vertical_pos;
        vertical_pos = newpos;
        vertical_pos = clamp(vertical_pos, old_pos - 50, old_pos + 50);
        var hole_diff = abs(old_pos - vertical_pos);
        if (hole_diff < 20)
            hole_size = 36;
        else if (hole_diff < 30)
            hole_size = 44;
        else if (hole_diff < 40)
            hole_size = 52;
        else
            hole_size = 60;
        if (first_strike > 0)
        {
            vertical_pos = irandom_range(-15, 15);
            old_pos = vertical_pos;
            hole_size = 100;
            if (first_strike == 0.75)
                hole_size = 90;
            if (first_strike == 0.5)
                hole_size = 75;
            if (first_strike == 0.25)
                hole_size = 60;
            first_strike = scr_approach(first_strike, 0, 0.25);
        }
        var mbox = mean(scr_get_box(1), scr_get_box(3));
        var dorifto = 0.15 + (random(0.6) * choose(1, -1));
        if (vertical_pos > -20)
        {
            var y1 = (mbox + vertical_pos) - (hole_size * 0.5);
            var y2 = scr_get_box(1) - 40;
            var y3 = max((y1 - y2) * (0.5 + random(0.5)), 50);
            var y4 = y1 - y3;
            with (scr_fire_bullet(scr_get_box(0) + 40, mean(y1, y4), obj_knight_diamondswordbullet_ext, 180, 0.5))
            {
                damage = 206;
                grazepoints = 4;
                element = 5;
                image_angle = 270;
                image_yscale = 1;
                image_alpha = 0;
                image_index = 1;
                if (y3 > 48)
                    sprite_index = spr_knight_diamondbullet_m;
                if (y3 > 80)
                    sprite_index = spr_knight_diamondbullet_l;
                var endscale = y3 / sprite_width;
                image_xscale = 15;
                scr_lerpvar("image_xscale", 0, endscale, 14, -1, "out");
                scr_lerpvar("image_alpha", 0, 1, 10, 2, "out");
                if (other.first_strike >= 0.75 && (other.turn_type == "end" || other.turn_type == "mid" || other.turn_type == "short end"))
                {
                    active = false;
                    fake = true;
                    r = 34;
                    g = 34;
                    b = 34;
                }
                gravity_direction = 180;
                gravity = 0.4;
                vspeed = dorifto;
            }
        }
        if (vertical_pos < 20)
        {
            var y1 = mbox + vertical_pos + (hole_size * 0.5);
            var y2 = scr_get_box(3) + 40;
            var y3 = max((y2 - y1) * (0.5 + random(0.5)), 60);
            var y4 = y1 + y3;
            with (scr_fire_bullet(scr_get_box(0) + 40, mean(y1, y4), obj_knight_diamondswordbullet_ext, 180, 0.5))
            {
                damage = 206;
                grazepoints = 4;
                element = 5;
                image_angle = 90;
                image_yscale = 1;
                image_alpha = 0;
                image_index = 1;
                if (y3 > 48)
                    sprite_index = spr_knight_diamondbullet_m;
                if (y3 > 80)
                    sprite_index = spr_knight_diamondbullet_l;
                var endscale = y3 / sprite_width;
                image_xscale = 15;
                scr_lerpvar("image_xscale", 0, endscale, 14, -1, "out");
                scr_lerpvar("image_alpha", 0, 1, 10, 2, "out");
                if (other.first_strike >= 0.75 && (other.turn_type == "end" || other.turn_type == "mid" || other.turn_type == "short end"))
                {
                    active = false;
                    fake = true;
                    r = 34;
                    g = 34;
                    b = 34;
                }
                gravity_direction = 180;
                gravity = 0.4;
                vspeed = dorifto;
            }
        }
        timer = 0;
    }
}
if (fake_timer > 8 && ((fake_timer + 8) % 4) == 0)
{
    var vertical_pos2 = irandom_range(-70, 70);
    var mbox = mean(scr_get_box(1), scr_get_box(3));
    var dorifto = 0.25 + (random(0.6) * choose(1, -1));
    var y1 = (mbox + vertical_pos2) - (hole_size * 0.5);
    var y2 = choose(scr_get_box(1) - 40, scr_get_box(3) + 40);
    var y3 = max((y1 - y2) * (0.5 + random(0.5)), 50);
    var y4 = y1 - y3;
    with (scr_fire_bullet(scr_get_box(0) + 40, obj_growtangle.y + (random_range(20, 70) * choose(-1, 1)), obj_knight_diamondswordbullet_ext, 180, 0.35))
    {
        active = false;
        fake = true;
        damage = 206;
        grazepoints = 4;
        element = 5;
        image_angle = 90;
        image_yscale = 1;
        image_alpha = 0;
        image_index = 1;
        if ((y3 * 0.75) > 48)
            sprite_index = spr_knight_diamondbullet_m;
        if ((y3 * 0.75) > 80)
            sprite_index = spr_knight_diamondbullet_l;
        var endscale = (y3 / sprite_width) * 0.75;
        image_xscale = 0;
        scr_lerpvar("image_xscale", 0, endscale, 14, -1, "out");
        scr_lerpvar("image_alpha", 0, 1, 10, 2, "out");
        r = 34;
        g = 34;
        b = 34;
        depth = obj_growtangle.depth - 1;
        gravity_direction = 180;
        gravity = 0.4;
        vspeed = dorifto * 2;
    }
}

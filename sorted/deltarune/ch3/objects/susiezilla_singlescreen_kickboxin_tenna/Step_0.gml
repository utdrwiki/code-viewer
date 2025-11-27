falltimer++;
if (falltimer > 150 && hp < 3 && i_ex(obj_tenna_zoom) && obj_tenna_zoom.con < 2 && createspotlights == true)
{
    falltimer = 0;
    if (fallcon == 0)
    {
        controller = instance_create(x, y, obj_spotlightlaser_controller);
        controller.side = "above";
        fallcon = 1;
    }
    else
    {
        controller = instance_create(x, y, obj_spotlightlaser_controller);
        controller.side = "below";
        fallcon = 0;
    }
}
if (i_ex(obj_tenna_enemy) && tennainit == false)
{
    visible = true;
    tennainit = true;
}
depth = 10000 - y;
if (i_ex(obj_tenna_enemy))
    depth = 1000 - y;
flash = scr_approach(flash, 0, 1);
if (afterimages && (global.time % 2) == 0)
{
    with (instance_create(x, y, obj_afterimage_glow))
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index;
        image_blend = other.image_blend;
        image_speed = 0;
        depth = other.depth;
        image_xscale = other.xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
        fadeSpeed = 0.08;
        solidcolor = 7020069;
    }
}
polarity *= -1;
xoff *= 0.8;
if (xoff < 0.5)
    xoff = 0;
if (z < 0 && (z + zspeed) >= 0)
{
    bounciness = 0.25;
    xscale = -2 * side;
    yscale = 1;
}
z += zspeed;
zspeed += zgrav;
if (z >= 0)
{
    z = 0;
    zspeed = 0;
}
if (z < 0 || state == states.dead)
    friction = 0;
else
    friction = fric;
xscale = scr_approach(xscale, -2 * side, bounciness);
yscale = scr_approach(yscale, 2, bounciness);
if (idle_loop)
{
    if (sprite_index == spr_tenna_kick)
    {
        if (image_index >= 3.75)
            idle_dir = -0.25;
        if (image_index <= 0)
            idle_dir = 0.25;
        image_index += idle_dir;
    }
    else
    {
        idle_loop = false;
    }
}
if (kick_loop)
{
    if (image_index >= 17 || sprite_index != spr_tenna_kick)
        kick_loop = false;
    else
        image_index = scr_approach(image_index, 17, 1);
}
if (state == states.breakout)
{
    state_timer++;
    if (state_timer > 0 && state_timer < 25)
        xoff += 1;
    if (state_timer == 25)
    {
        doshadow = true;
        xoff = 0;
        bounciness = 0.25;
        xscale = -3 * side;
        yscale = 1;
        do_shadow = true;
        sprite_index = spr_tenna_kick;
        image_index = 14;
        speed = 7;
        zspeed = -14;
        snd_play(snd_jump);
    }
    if (state_timer > 25 && z == 0)
    {
        state_timer = -999;
        image_index = 0;
        idle_loop = true;
        anchor_x = mid + 180;
        snd_play(snd_screenshake);
        with (obj_susiezilla_gamecontroller)
            shake = 8;
        scr_var_delay("state", states.idle, 15);
        scr_var_delay("state_timer", 0, 15);
    }
}
if (state == states.idle)
{
    state_timer++;
    if (state_timer == 8)
    {
        xscale = -2.25 * side;
        yscale = 1.75;
        juke_offset = clamp(juke_offset, -40, 60);
        if (abs(y - (obj_susiezilla_player.y + 84)) < 30)
            juke_counter += 999;
        if (irandom(3))
        {
            juke_offset = clamp((obj_susiezilla_player.y + 84) - y, -40, 60);
        }
        else
        {
            repeat (5)
            {
                for (a = 0; a < 10; a++)
                {
                    var juke_backup = juke_offset;
                    juke_offset += (juke_direction * (3 + irandom(9)));
                    if (juke_offset > 60 || juke_offset < -40)
                    {
                        juke_offset = juke_backup;
                        juke_direction *= -1;
                    }
                }
                if (abs(y - (anchor_y + juke_offset)) > 40)
                    break;
            }
        }
        dest_x = anchor_x + irandom_range(-12, 12);
        dest_y = anchor_y + juke_offset;
    }
    if (state_timer >= 8)
    {
        move_towards_point(dest_x, dest_y, max(point_distance(x, y, dest_x, dest_y) * 0.2, 6));
        if (point_distance(x, y, dest_x, dest_y) <= 8)
        {
            juke_counter++;
            if ((juke_counter > 0 && irandom(1) && (!alarm[1] && !alarm[0])) || juke_counter > 1)
            {
                if (!idle_loop)
                    image_index = 0;
                idle_loop = true;
                kick_loop = false;
                juke_counter = 0;
                state = states.kick;
                state_timer = 0;
            }
            else
            {
                image_index = 0;
                idle_loop = true;
                kick_loop = false;
                state = states.idle;
                state_timer = 3 + (turbo * 3);
            }
        }
    }
}
if (state == states.kick)
{
    state_timer++;
    if (state_timer == -100)
    {
        fric = 0.85;
        image_index = 0;
        idle_loop = true;
        kick_loop = false;
        state = states.idle;
        state_timer = 7;
        side *= -1;
        xscale *= -1;
        anchor_x = mid - (180 * side);
    }
    if (state_timer == 8)
    {
        bounciness = 0.25;
        xscale = -2.5 * side;
        yscale = 1.5;
        direction = 90 + (side * 90);
        speed = 8;
        fric = 0.35;
        snd_play(snd_heartshot_dr_b);
        image_index = 34;
        idle_loop = false;
    }
    if (state_timer == (20 + (turbo * 4)))
    {
        image_index = 13;
        kick_loop = true;
        idle_loop = false;
        direction = 90 - (side * 90);
        speed = 50;
        fric = 3;
        if (i_ex(obj_susiezilla_singlescreen_shadowguy_red))
        {
            speed = 40;
            fric = 2;
        }
        snd_play(snd_chargeshot_fire);
        afterimages = true;
    }
    if (state_timer > (20 + (turbo * 4)) && speed < 1)
    {
        afterimages = false;
        ds_list_clear(hit_list);
        state_timer = -110 + (5 * turbo);
    }
}
if (state == states.zip)
{
    state_timer++;
    if (state_timer == -100)
    {
        fric = 0.85;
        image_index = 0;
        idle_loop = true;
        kick_loop = false;
        state = states.idle;
        state_timer = 7;
    }
    if (state_timer == 8)
    {
        direction = 0;
        speed = 10;
    }
    if (state_timer == 24)
    {
        afterimages = true;
        image_index = 13;
        kick_loop = true;
        zip_dir = choose(-1, 1);
    }
    if (state_timer >= 24 && state_timer < 96)
    {
        direction = 180;
        speed = 7;
        y = scr_approach(y, anchor_y + (sin((state_timer - 24) * 0.15) * 64 * zip_dir), abs(y - (anchor_y + (sin((state_timer - 24) * 0.15) * 64 * zip_dir))) * 0.15);
    }
    if (state_timer == 96)
    {
        afterimages = false;
        ds_list_clear(hit_list);
        state_timer = -110;
    }
}
if (state == states.pain)
{
}
if (state == states.dead)
{
    with (obj_susiezilla_gamecontroller)
        shake = max(shake, 5);
    if ((state_timer % 3) == 0)
    {
        with (scr_dark_marker(x + random_range(-58, 58), y - irandom(120), spr_realisticexplosion))
        {
            image_speed = 1;
            scr_doom(id, 16);
            scr_scale(2, id);
            depth = other.depth - 1000;
            if (i_ex(obj_tenna_zoom))
                depth = obj_tenna_zoom.depth + 100;
        }
    }
    state_timer++;
}
if (afterimages)
{
    if (abs(speed) > 8 && (global.time % 2) == 0)
    {
        with (scr_afterimage_grow())
        {
            sprite_index = spr_ground_shockwave;
            image_xscale = other.side * 2;
            image_yscale = 3;
            fade = 0.025;
            xrate = 0;
            yrate = 0;
            y += 20;
            x += (100 * other.side);
            visible = false;
        }
    }
    var tempmask = obj_susiezilla_player.mask_index;
    obj_susiezilla_player.mask_index = spr_susiezilla_susie_hit_mask;
    var _hit = ds_list_create();
    collision_rectangle_list(x - 84, y + 29, x + 84, y - 16, obj_susiezilla_player, false, true, _hit, false);
    obj_susiezilla_player.mask_index = tempmask;
    for (a = 0; a < ds_list_size(_hit); a++)
    {
        if (ds_list_find_index(hit_list, ds_list_find_value(_hit, a).id) != -1)
            continue;
        ds_list_add(hit_list, ds_list_find_value(_hit, a).id);
        if (speed < 32 && ds_list_find_value(_hit, a).dashcon == 2)
            continue;
        ds_list_find_value(_hit, a).take_hit_unblockable(facing, damage, knockback);
    }
    ds_list_destroy(_hit);
}
var susiehit = -4;
susiehit = collision_rectangle(x - 84, y + 29, x + 84, y - 16, obj_susiezilla_player, false, false);
var canhitsusie = true;
if (afterimages && state == states.kick && speed > 32)
    canhitsusie = false;
if (!alarm[0] && !alarm[1] && canhitsusie == true && state != states.breakout && state != states.dead)
{
    if (susiehit != -4)
    {
        if (state != states.dead && state != states.given_up)
        {
            if (susiehit.hitactive)
            {
                hp = scr_approach(hp, 0, 1);
                with (obj_susiezilla_gamecontroller)
                    shake = 8;
                afterimages = false;
                scr_tenna_add_score(8);
                if (hp)
                {
                    flash = 10;
                    snd_stop(snd_screenshake);
                    snd_stop(snd_metal_hit_reverb);
                    snd_play(snd_screenshake);
                    snd_play_x(snd_metal_hit_reverb, 1, 0.9);
                    with (susiehit)
                        event_user(0);
                    if (side == -1)
                        susiehit.memhspeed = -12;
                    else
                        susiehit.memhspeed = 12;
                    sprite_index = spr_tenna_hurt;
                    image_index = 0;
                    image_speed = 0;
                    state = states.pain;
                    state_timer = 0;
                    speed = 22;
                    if (side == -1)
                        direction = irandom(30);
                    else
                        direction = 180 - irandom(30);
                    fric = 0.75;
                    alarm[0] = 12;
                }
                else
                {
                    snd_stop(snd_screenshake);
                    snd_stop(snd_metal_hit_reverb);
                    snd_play(snd_screenshake);
                    snd_play_x(snd_metal_hit_reverb, 1, 0.9);
                    snd_play_pitch(snd_explosion, 0.5);
                    with (susiehit)
                        event_user(0);
                    if (side == -1)
                        susiehit.memhspeed = -12;
                    else
                        susiehit.memhspeed = 12;
                    sprite_index = spr_tenna_hurt;
                    image_index = 0;
                    image_speed = 0;
                    state = states.dead;
                    state_timer = 0;
                    doshadow = false;
                    speed = 24;
                    gravity = 1;
                    gravity_direction = 270;
                    if (side == -1)
                        direction = 55;
                    else
                        direction = 125;
                    fric = 0;
                    with (obj_susiezilla_gamecontroller)
                    {
                        if (time_timer && i_ex(obj_tenna_zoom) && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
                        {
                            finished = true;
                            with (obj_tenna_zoom)
                            {
                                con = 2;
                                timer = -30;
                            }
                        }
                    }
                }
                with (scr_dark_marker(mean(x, susiehit.x + 32), mean(y, susiehit.y + 40), spr_dogcar_hit))
                {
                    scr_doom(id, 4);
                    scr_scale(4, id);
                    scr_lerpvar_instance(id, "image_xscale", 4, 1, 4);
                    scr_lerpvar_instance(id, "image_yscale", 4, 1, 4);
                    depth = other.depth - 100;
                }
            }
        }
    }
}
var lx = 0;
var rx = 1280;
var ly = 0;
with (obj_susiezilla_gamecontroller)
{
    lx = xorig;
    rx = xorig + width;
    ly = yorig;
}
if (x <= (lx + 5) && hspeed < 0)
{
    x = lx + 5;
    hspeed = abs(hspeed / 2);
}
if (x >= (rx - 5) && hspeed > 0)
{
    x = rx - 5;
    hspeed = -abs(hspeed / 2);
}
if (state != states.dead)
{
    if (y <= (ly + 200) && vspeed < 0)
    {
        y = ly + 200;
        vspeed = abs(vspeed / 2);
    }
}

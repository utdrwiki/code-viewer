depth = 10000 - y;
if (i_ex(obj_tenna_enemy))
    depth = 1000 - y;
with (obj_susiezilla_gamecontroller)
{
    var sourcedude = other.id;
    if (gameover)
    {
        other.speed = 0;
        other.image_speed = 0;
        with (obj_script_delayed)
        {
            if (target == sourcedude)
                instance_destroy();
        }
        with (obj_lerpvar)
        {
            if (target == sourcedude)
                instance_destroy();
        }
        other.gameover = true;
        exit;
    }
}
bobble++;
if (canhit == true && !i_ex(myhitbox))
{
    myhitbox = instance_create(x, y, obj_susiezilla_activehitbox);
    myhitbox.sprite_index = spr_whitepx;
    myhitbox_xoffset = -24;
    myhitbox_yoffset = -64;
    myhitbox.image_yscale = 48;
    myhitbox.image_xscale = 40;
    myhitbox.depth = depth - 20;
    myhitbox.image_blend = c_yellow;
    myhitbox.daddy = id;
    myhitbox.visible = false;
}
if (i_ex(myhitbox))
{
    if (!canhit || ropeheight != 0)
        safe_delete(myhitbox);
}
if (hitstop <= 0)
{
    fakevspeed += fakegravity;
    fakeheight += fakevspeed;
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity)
        fakeheight = maxheight;
    if (fakeheight >= maxheight)
    {
        fakevspeed = 0;
        fakeheight = maxheight;
        if (abs(hspeed) < 6)
            canhit = 0;
    }
    if (fakeheight < maxheight || state == states.dead)
        friction = 0;
    else
        friction = fric_var;
    if (state == states.advance)
    {
        state_timer++;
        if (state_timer == 1)
        {
            if (desy > (obj_susiezilla_statue.y + 35))
                desy = obj_susiezilla_statue.y + 35;
            if (facing == 1)
                desx = (obj_susiezilla_statue.x - 100) + irandom_range(-24, 24);
            else
                desx = obj_susiezilla_statue.x + 100 + irandom_range(-24, 24);
        }
        if (state_timer > 1)
        {
            var flyspeed = 0.125;
            with (obj_susiezilla_gamecontroller)
            {
                if (rush_modifier != -1)
                    flyspeed += rush_modifier;
            }
            if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity)
            {
                flyspeed = 0.3;
                scr_obj_movetowards_point(desx, desy, clamp(point_distance(x, y, desx, desy) * flyspeed, 0, 40));
            }
            else
            {
                scr_obj_movetowards_point(desx, desy, clamp(point_distance(x, y, desx, desy) * flyspeed, 0, 5));
            }
            if (point_distance(x, y, desx, desy) <= 1)
            {
                remfacing = facing;
                speed = 0;
                fakevspeed = 0;
                state = states.attack;
                state_timer = -4;
                with (obj_susiezilla_gamecontroller)
                {
                    if (rush_modifier >= 0)
                    {
                        other.state_timer = -12;
                        if (rush_modifier > 0.2)
                            other.state_timer = -10;
                        if (rush_modifier > 0.4)
                            other.state_timer = -8;
                        if (rush_modifier > 0.6)
                            other.state_timer = -6;
                        if (rush_modifier > 0.8)
                            other.state_timer = -4;
                    }
                }
                if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity)
                {
                    flash = 10;
                    snd_stop(snd_swing);
                    snd_play_pitch(snd_swing, 1.6);
                    state_timer = 6;
                }
            }
        }
    }
    if (state == states.attack)
    {
        facing = remfacing;
        flash--;
        state_timer++;
        var attackdelay = 10;
        if (state_timer == 1)
        {
            flash = 10;
            snd_stop(snd_swing);
            snd_play_pitch(snd_swing, 1.6);
        }
        if (state_timer == 11)
        {
            if (facing == 1)
                hspeed = -12;
            else
                hspeed = 12;
            fric_var = 1.55;
        }
        if (state_timer == 20)
        {
            flash = 0;
            kickactive = true;
            ds_list_clear(hit_list);
            sprite_index = s_spin;
            image_speed = 0.5;
            if (facing == 1)
                hspeed = 20;
            else
                hspeed = -20;
            fric_var = 0.35;
        }
        if (abs(x - obj_susiezilla_statue.x) <= 20 && kickactive)
        {
            kickactive = false;
            fric_var = 0.25;
            hspeed *= (-0.85 + random(0.2));
            vspeed = irandom_range(-2, 2);
            state = states.away;
            state_timer = 0;
        }
    }
    if (state == states.away)
    {
        state_timer++;
        if (state_timer > 0)
        {
            if (speed < 1)
            {
                fric_var = 0.85;
                desx = x;
                sprite_index = s_idle;
                image_speed = 0.25;
                state = states.advance;
                temp_counter = false;
                state_timer = irandom_range(-50, -20);
            }
        }
    }
    if (state == states.dead && state_timer == 0)
    {
        state_timer++;
        scr_tenna_add_score(3);
        if (abs(hspeed) > 8)
        {
            snd_stop(snd_punchmed);
            snd_play_pitch(snd_punchmed, 0.65);
            for (var i = 0; i < 4; i++)
            {
                dust = scr_dark_marker((x - 20) + (i * 10), y, spr_dust1);
                dust.depth = depth - 10;
                dust.vspeed = -4 - irandom(2) - (abs(hspeed) / 4);
                dust.gravity = 0.5;
                dust.image_speed = 0.5;
                dust.image_xscale = 2 + random_range(-0.2, 0);
                dust.image_xscale = dust.image_yscale;
                scr_doom(dust, 10);
                dust.hspeed = -4 + (i * 2) + (hspeed / 8);
                dust.friction = 0.85;
            }
        }
        else
        {
            snd_stop(snd_punchmed);
            snd_play_pitch(snd_punchmed, 0.8);
        }
    }
    if (kickactive)
    {
        var tempmask = obj_susiezilla_player.mask_index;
        obj_susiezilla_player.mask_index = spr_susiezilla_susie_hit_mask;
        var _hit = ds_list_create();
        collision_rectangle_list(x - 32, y + 14, x + 32, y - 22, obj_susiezilla_singlescreen_hittable, false, true, _hit, false);
        obj_susiezilla_player.mask_index = tempmask;
        for (a = 0; a < ds_list_size(_hit); a++)
        {
            if (ds_list_find_index(hit_list, ds_list_find_value(_hit, a).id) != -1)
                continue;
            ds_list_add(hit_list, ds_list_find_value(_hit, a).id);
            ds_list_find_value(_hit, a).take_hit(facing, damage, knockback);
            snd_stop(snd_punchmed);
            snd_play_pitch(snd_punchmed, 0.75);
        }
        ds_list_destroy(_hit);
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
    if (x <= (lx + 10))
    {
        x = lx + 10;
        hspeed = -hspeed / 2;
    }
    if (x >= (rx - 10))
    {
        x = rx - 10;
        hspeed = -hspeed / 2;
    }
    if (y <= (ly + 200))
    {
        y = ly + 200;
        vspeed = -vspeed / 2;
    }
    hitdir = direction;
    hitspeed = speed;
}
hitstop--;
if (hitstop == 0)
{
    canhit = 1;
    speed = memspeed;
    direction = memdir;
    fakegravity = 1;
    hitstop = -1;
}
if (hitstop > 0)
{
    kickactive = false;
    flash = 0;
}
if (abs(hspeed) > fastestspeed)
    fastestspeed = abs(hspeed);
myxcenter = x - 6;
myycenter = (y - 34) + fakeheight;

depth = 10000 - y;
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
if (canhit && !i_ex(myhitbox))
{
    myhitbox = instance_create(x, y, obj_susiezilla_activehitbox);
    myhitbox.sprite_index = spr_whitepx;
    myhitbox_xoffset = 80;
    myhitbox_yoffset = 0;
    myhitbox.image_yscale = 30;
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
    if (fakeheight < maxheight || state == states.dead)
        friction = 0;
    else
        friction = fric_var;
    fakevspeed += fakegravity;
    fakeheight += fakevspeed;
    if (fakeheight >= maxheight)
    {
        fakeheight = maxheight;
        fakevspeed = 0;
        if (abs(hspeed) < 6)
            canhit = 0;
    }
    if (i_ex(obj_susiezilla_statue) && state != states.dead)
    {
        if (obj_susiezilla_statue.x < x)
            facing = -1;
        else
            facing = 1;
    }
    if (state == states.rope)
    {
        state_timer++;
        if (state_timer == 32)
        {
            state_timer = 0;
            state = states.intro;
        }
    }
    if (state == states.intro)
    {
        scr_obj_movetowards_point(desx, desy, clamp(point_distance(x, y, desx, desy) * 0.125, 0, 6));
        if (point_distance(x, y, desx, desy) < 2)
        {
            speed = 0;
            direction = 0;
            remfacing = facing;
            state_timer = 0;
            state = states.gun;
        }
    }
    if (state == states.reposition)
    {
        state_timer++;
        scr_obj_movetowards_point(desx, desy, clamp(point_distance(x, y, desx, desy) * 0.125, 0, 6));
        if (point_distance(x, y, desx, desy) < 2)
        {
            speed = 0;
            direction = 0;
            remfacing = facing;
            state_timer = 0;
            state = states.gun;
            if (i_ex(obj_susiezilla_player))
            {
                if (abs(x - obj_susiezilla_player.x) > 320)
                    state_timer = -20;
            }
        }
    }
    if (state == states.gun)
    {
        state_timer++;
        facing = remfacing;
        if (state_timer == 4)
        {
            flash = 10;
            sprite_index = s_fire;
            image_index = 0;
            image_speed = 0;
        }
        if (state_timer == 18)
        {
            image_speed = 0.25;
            shoot_angle = point_direction(x + (36 * facing), y - 64, obj_susiezilla_statue.x, obj_susiezilla_statue.y - 80);
        }
        if (state_timer == 18)
        {
            snd_stop(snd_gunshot_b);
            snd_play_pitch(snd_gunshot_b, 0.75);
            var tempx = x + (36 * facing);
            var tempy = y - 64;
            with (instance_create_depth(tempx, tempy, depth - 1, obj_susiezilla_singlescreen_hazard))
            {
                direction = other.shoot_angle;
                image_xscale = 2.5;
                image_yscale = 2.5;
                facing = other.facing;
                speed = 3;
                sprite_index = spr_tennis_ball_bullet;
                image_angle = 0;
                scr_lerpvar("draw_angle", 0, 4320, 480);
            }
        }
        if (state_timer == 24)
            image_speed = 0;
        if (state_timer == 40)
        {
            sprite_index = s_idle;
            image_index = 0;
            image_speed = 0.25;
            state = states.idle;
            state_timer = 0;
        }
    }
    if (state == states.idle)
    {
        state_timer++;
        facing = remfacing;
        if (state_timer == 32)
        {
            desx = xanchor + irandom_range(-48, 48);
            desy = clamp(yanchor + irandom_range(-48, 48), 200, 384);
            state = states.reposition;
            state_timer = 0;
        }
    }
    if (state == states.dead && state_timer == 0)
    {
        state_timer++;
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
            fakevspeed = -abs(hspeed / 8);
        }
        else
        {
            snd_stop(snd_punchmed);
            snd_play_pitch(snd_punchmed, 0.8);
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
    flash = 0;
if (abs(hspeed) > fastestspeed)
    fastestspeed = abs(hspeed);
myxcenter = x - 6;
myycenter = (y - 34) + fakeheight;

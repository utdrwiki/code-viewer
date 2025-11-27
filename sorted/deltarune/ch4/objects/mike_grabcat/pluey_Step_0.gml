event_inherited();
if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 80))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}
else if (!scr_outside_camera(32) && action == 4)
{
    wall_destroy = 1;
}
depth = obj_mike_hand.depth + 1;
image_blend = c_aqua;
image_speed = abs(speed) * 0.33;
if (action == 0)
{
    if (israin)
    {
        sprite_index = spr_mike_cat_hold_outline;
        gravity = 0.2;
        vspeed = min(vspeed, max_vspeed);
        if (y >= 310)
        {
            with (scr_marker(x, y, spr_mike_raindrop_land))
            {
                image_xscale = 2;
                image_yscale = 2;
                image_speed = 0.25;
                image_blend = c_aqua;
                scr_doom(self, 7);
            }
            if (i_ex(obj_mike_minigame_controller))
                snd_play(snd_plueyraincat);
            instance_destroy();
        }
        hspeed = 0;
        exit;
    }
    if (idle_timer < 120)
        sprite_index = spr_mike_cat_walk_outline;
    if (walks)
    {
        if (side == 1 && x > (camerax() + camerawidth()))
        {
            side = -1;
            hspeed = side * irandom_range(2, 5);
        }
        if (side == -1 && x < camerax())
        {
            side = 1;
            hspeed = side * irandom_range(2, 5);
        }
        if (hspeed == 0)
            hspeed = side * irandom_range(2, 5);
        xscale = scr_approach(xscale, sign(hspeed), 0.2);
    }
    else if (y < (cameray() + 310))
    {
        vspeed += 0.25;
    }
    else
    {
        hspeed = 0;
        vspeed = 0;
        if (x < anchorx)
            x = scr_approach(x, anchorx, 3);
        else
            x = scr_approach(x, anchorx, 8);
        if (x == anchorx)
        {
            image_speed = 0;
            image_xscale = 1;
            idle_timer++;
            if (idle_timer >= 120)
            {
                sprite_index = spr_mike_cat_dance_outline;
                image_speed = 1;
            }
        }
        else
        {
            sprite_index = spr_mike_cat_walk_outline;
            idle_timer = 0;
            image_speed = 2;
            xscale = -1 * sign(x - anchorx);
        }
    }
    if (instance_number(obj_mike_catbasket) == 0)
        action = 4;
}
if (action == 1)
{
    xscale = 1;
    sprite_index = spr_mike_cat_hold_outline_smallhitbox;
    x = obj_mike_controller.mx;
    y = obj_mike_controller.my + 24;
}
if (action == 2)
{
    if (speed == 0)
    {
        action = 3;
        wait = 100;
        xx = x;
        yy = y;
        image_index = 0;
    }
}
if (action == 3)
{
    image_blend = merge_colour(c_red, image_blend, wait / 100);
    x = xx + choose(-2, 2);
    y = yy + choose(-2, 2);
    if (wait == 0)
    {
        action = 4;
        wait = 15;
        speed = 5;
        sprite_index = spr_mike_cat_attack_outline;
        direction = point_direction(x, y, obj_mike_controller.x, obj_mike_controller.y) - 180;
        instance_create_depth(x, y, depth - 1, obj_mike_hairball);
        snd_stop(snd_meow_quick);
        snd_play(snd_meow_quick);
    }
}
if (action == 4)
{
    wait -= 1;
    if (wait < 0 && speed == 0)
    {
        sprite_index = spr_mike_cat_walk_outline;
        image_speed = 2;
        friction = -0.25;
        xscale = -xscale;
        motion_set(direction, 0.25);
    }
}
if (action == 5)
{
    if (lastaction != 5)
    {
        sprite_index = spr_mike_cat_hold_outline;
        if ((abs(hspeed) + abs(vspeed)) > 22)
        {
            snd_play(snd_criticalswing);
            is_launched = true;
        }
        else
        {
            snd_play(snd_wing);
            is_launched = false;
        }
    }
    if (is_launched)
    {
        with (scr_afterimage())
            image_alpha = 0.3;
    }
    if (y >= (cameray() + 310))
    {
        vspeed = 0;
        y = cameray() + 310;
        gravity = 0;
        friction = 0;
        side = choose(1, -1);
        xscale = side;
        hspeed = side * irandom_range(3, 5);
        sprite_index = spr_mike_cat_walk_outline;
        action = 0;
    }
    else
    {
        if (y < 0)
        {
            y = 0;
            vspeed = -vspeed;
        }
        gravity = 1;
    }
    if (x > (camerax() + camerawidth()))
        hspeed = -hspeed;
    if (x < camerax())
        hspeed = -hspeed;
}
lastaction = action;

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

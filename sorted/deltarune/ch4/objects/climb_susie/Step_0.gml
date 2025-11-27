if (init == 0)
    init = 1;
event_inherited();
depth = 31000;
if (con == 0)
{
    sprite_index = spr_susie_climb;
    image_index = climbindex;
    if (reachcon >= 10)
    {
        con = 4;
        exit;
    }
    if (reachcon > 0)
    {
        con = 3;
        exit;
    }
    if (waiteventid > 0)
        exit;
    remx = x;
    remy = y;
    if (forcejump)
    {
        con = 2;
        forcejump = 0;
        exit;
    }
    if (dir >= 0)
    {
        con = 1;
        climbcon = 0;
    }
}
if (con == 1)
{
    if (climbcon == 0)
    {
        yclimb = 0;
        xclimb = 0;
        if (dir == 2)
            yclimb = -40;
        else if (dir == 3)
            xclimb = -40;
        else if (dir == 1)
            xclimb = 40;
        else
            yclimb = 40;
        sprite_index = spr_susie_climb;
        if (climbindex == 0)
            climbindex = 2;
        else
            climbindex = 0;
        climbcon = 1;
    }
    if (climbcon == 1)
    {
        var draw_dust = !onrotatingtower || tile_vis == 1;
        if (timer == 0 && draw_dust)
        {
            var dust_amount = 1;
            if (jumping)
                dust_amount = 5;
            for (var i = 0; i < dust_amount; i++)
            {
                var dust = instance_create(x + 20, y + 80, obj_animation);
                dust.sprite_index = spr_climb_dust_small;
                dust.depth = depth + 10;
                if (jumping)
                {
                    dust.x = dust.x + random_range(-10, 10);
                    dust.y = dust.y + random_range(-10, 10);
                }
                else if (yclimb < 0)
                {
                    dust.x = (dust.x - 10) + (10 * climbindex);
                }
                else if (yclimb > 0)
                {
                    dust.x = (dust.x - 15) + (15 * climbindex);
                }
                else
                {
                    dust.y = dust.y + 10;
                }
                if (i_ex(obj_rotating_tower_controller_new) && i_ex(obj_climb_kris))
                {
                    dust.x = tower_x;
                    dust.depth = obj_rotating_tower_controller_new.depth - 4;
                }
                dust.image_xscale = 2;
                dust.image_yscale = 2;
                dust.image_speed = 0.5;
                dust.vspeed += -1;
            }
        }
        drawoffsety = 0;
        var newx, newy, climbrate;
        if (jumping == 0)
        {
            if (climbspeed < climbspeedmultiplier)
                climbspeed = climbspeedmultiplier;
            timer += (climbspeed + climbmomentum);
            climbrate = 10;
            if (timer >= climbrate)
                timer = climbrate;
            newx = lerp_ease_inout(remx, remx + xclimb, timer / climbrate, 2);
            newy = lerp_ease_inout(remy, remy + yclimb, timer / climbrate, 2);
            image_index = climbindex;
            if (abs(newx - remx) > 3 || abs(newy - remy) > 3)
                image_index = 1 + climbindex;
        }
        else
        {
            timer += 1;
            climbrate = 6 + (jumpchargeamount * 2);
            var clipamount = 4;
            if (jumpchargeamount >= 2)
                clipamount = 2;
            if (timer >= climbrate)
                timer = climbrate;
            if (timer >= (climbrate - clipamount))
                timer = climbrate;
            newx = lerp_ease_out(remx, remx + xclimb, timer / climbrate, 1);
            newy = lerp_ease_out(remy, remy + yclimb, timer / climbrate, 1);
            drawoffsety = -sin((timer / climbrate) * pi) * (2 * (jumpchargeamount - 1));
            if (dir == 2 || dir == 0)
            {
                image_index = timer / 2;
                sprite_index = spr_kris_climb_new_jump_up;
            }
            else if (dir == 1)
            {
                if ((timer / climbrate) > 0.5)
                {
                    sprite_index = spr_kris_climb_new_land_right;
                }
                else
                {
                    sprite_index = spr_kris_climb_new_slip_right;
                    image_index = 0;
                }
            }
            else if ((timer / climbrate) > 0.5)
            {
                sprite_index = spr_kris_climb_new_land_left;
            }
            else
            {
                sprite_index = spr_kris_climb_new_slip_left;
                image_index = 0;
            }
            var afterimage = scr_afterimage();
            afterimage.y = afterimage.y + drawoffsety;
            afterimage.image_alpha = 0.2;
            if (i_ex(obj_rotating_tower_controller_new) && i_ex(obj_climb_kris))
            {
                afterimage.x = obj_rotating_tower_controller_new.tower_x;
                afterimage.hspeed = -xclimb * 0.1;
                afterimage.depth = obj_rotating_tower_controller_new.depth - 4;
            }
        }
        x = newx;
        y = newy;
        if (timer >= climbrate)
        {
            if (jumping == 1)
                climbmomentum = jumpchargeamount / 2;
            jumping = 0;
            climbcon = 0;
            jumpchargeamount = 0;
            x = remx + xclimb;
            y = remy + yclimb;
            if (onrotatingtower && x > obj_rotating_tower_controller_new.tower_circumference)
                x -= obj_rotating_tower_controller_new.tower_circumference;
            if (onrotatingtower && x < 0)
                x += obj_rotating_tower_controller_new.tower_circumference;
            con = 0;
            timer = 0;
        }
    }
}
if (con == 3 || con == 4)
{
    sprite_index = spr_susie_climb_throw_catch;
    if (con == 3)
        sprite_index = spr_susie_climb_throw;
    image_speed = 0;
    if (timer == 0)
    {
        image_index = 1;
        if (instance_place(x + 35, y, obj_climb_kris) && (obj_climb_kris.climbcon == 2 || obj_climb_kris.neutralcon == 1 || obj_climb_kris.fallingcon > 0))
        {
            snd_play(snd_noise);
            with (obj_climb_kris)
            {
                image_alpha = 0;
                fallingcon = 0;
                jumping = 0;
                climbcon = 0;
                neutralcon = 1;
                if (other.onrotatingtower)
                {
                    visible = 0;
                    climb_finished = true;
                }
            }
            if (onrotatingtower)
                con = 5;
            global.interact = 1;
            timer++;
            if (con == 4)
                x -= 6;
        }
    }
    if (timer > 0)
    {
        timer++;
        var delay = (con * 10) - 10;
        if (timer < delay)
        {
            image_index = 2 + min(4, floor(timer / 4));
        }
        else
        {
            image_index = 6 + min(3, floor((timer - delay) / 4));
            if (timer == (delay + 8))
            {
                var targetx = 0;
                var targety = 0;
                with (obj_genmarker)
                {
                    if (extflag == string(other.reachcon))
                    {
                        targetx = x;
                        targety = y;
                        break;
                    }
                }
                with (obj_climb_kris)
                {
                    scr_lerpvar("x", x, targetx, 25);
                    scr_lerpvar("y", y, targety - 20, 25);
                }
                with (instance_create(obj_climb_kris.x, obj_climb_kris.y - 20, obj_marker))
                {
                    scr_jump_to_point(targetx, targety - 20, 10, 25);
                    depth = obj_climb_kris.depth;
                    sprite_index = spr_kris_jump_ball;
                    image_xscale = 2;
                    image_yscale = 2;
                    scr_doom(self, 25);
                }
                snd_play(snd_jump);
            }
            if (timer == (delay + 34))
            {
                var targetx = 0;
                var targety = 0;
                with (obj_genmarker)
                {
                    if (extflag == string(other.reachcon))
                    {
                        targetx = x;
                        targety = y;
                        break;
                    }
                }
                snd_play(snd_noise);
                obj_climb_kris.x = targetx + 20;
                obj_climb_kris.y = targety + 20;
                obj_climb_kris.image_alpha = 1;
                global.interact = 0;
                sprite_index = spr_susie_climb;
                con = 0;
                reachcon = 0;
            }
        }
    }
}
if (con == 5)
{
    if (timer == 0)
    {
        sprite_index = spr_susie_climb_throw_alt;
        image_index = 0;
    }
    else
    {
        sprite_index = spr_susie_climb_throw;
    }
    if (timer > 0)
    {
        timer++;
        var delay = 20;
        if (timer < delay)
        {
            image_index = 2 + min(4, floor(timer / 4));
        }
        else
        {
            image_index = 6 + min(3, floor((timer - delay) / 4));
            var jumptime = 100;
            if (timer == (delay + 8))
            {
                with (instance_create(camerax() + (0.5 * camerawidth()), obj_climb_kris.y - 20, obj_marker))
                {
                    scr_jump_to_point((camerax() - 19) + (0.5 * camerawidth()), ((cameray() - 42) + (0.5 * cameraheight())) - 416, 25, jumptime);
                    sprite_index = spr_kris_jump_ball;
                    image_xscale = 2;
                    image_yscale = 2;
                    depth = 100;
                }
                snd_play(snd_jump);
            }
            if (timer > (delay + 8) && timer <= (delay + 60))
                obj_climb_kris.y -= 8;
            if (timer == (delay + 30))
            {
                whiteout = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_white, 101);
                with (whiteout)
                {
                    image_alpha = 0;
                    scr_lerpvar("image_alpha", 0, 1, 30);
                }
            }
            if (timer == (delay + 8 + jumptime))
            {
                snd_play(snd_noise);
                with (obj_marker)
                {
                    if (depth == 100)
                    {
                        y -= 6;
                        newmarker = instance_create(x, y, obj_marker_screen);
                        newmarker.sprite_index = spr_kris_dw_landed;
                        newmarker.image_speed = 0;
                        newmarker.depth = 10;
                        with (newmarker)
                            scr_darksize();
                        newmarker.persistent = true;
                        scr_doom(newmarker, 100);
                        scr_shakeobj();
                        instance_destroy();
                    }
                }
                blackout = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, 102);
            }
            if (timer == (delay + 8 + jumptime + 10))
            {
                with (whiteout)
                {
                    scr_lerpvar("image_alpha", 1, 0, 30);
                    scr_doom(self, 30);
                }
            }
            if (timer == (delay + 8 + jumptime + 55))
                room_goto(room_dw_churchc_titanclimb2_post);
        }
    }
}
var overlapping_trigger = instance_place(x, y, obj_climb_destructableclimbarea);
if (overlapping_trigger != -4)
{
    with (overlapping_trigger)
    {
        if (con == 0)
            con = 1;
    }
}

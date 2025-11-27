if (startofroom == 1)
{
    var roomw = room_width;
    var roomh = room_height;
    var vieww = view_wport[0];
    var viewh = view_hport[0];
    var _cameralerpspeed = 0.16;
    var xnudge = 0;
    var ynudge = 0;
    var nudger = instance_place(x, y, obj_camera_nudger);
    with (nudger)
    {
        xnudge = xamt;
        ynudge = yamt;
        if (lerpstrength != -4)
            _cameralerpspeed = lerpstrength;
    }
    var camx = clamp((x - floor(vieww / 2)) + xnudge, 0, roomw - vieww);
    var camy = clamp((y - floor(viewh / 2)) + ynudge + naturalybias, 0, roomh - viewh);
    var clamper = instance_place(x, y, obj_camera_clamper);
    if (i_ex(clamper))
    {
        var lclamp = 0;
        var rclamp = roomw - vieww;
        var uclamp = 0;
        var dclamp = roomh - viewh;
        if (clamper.xmin != -4)
            lclamp = clamper.xmin;
        if (clamper.xmax != -4)
            rclamp = clamper.xmax;
        if (clamper.ymin != -4)
            uclamp = clamper.ymin;
        if (clamper.ymax != -4)
            dclamp = clamper.ymax;
        if (clamper.lerpstrength != -4)
            _cameralerpspeed = clamper.lerpstrength;
        camx = clamp(camx, lclamp, rclamp);
        camy = clamp(camy, uclamp, dclamp);
        camerax_set(camx);
        cameray_set(camy);
    }
    with (obj_caterpillarchara)
        image_alpha = 0;
    startofroom = 0;
}
var overlapping_trigger = instance_place(x, y, obj_climb_destructableareatrigger);
if (overlapping_trigger != -4)
{
    with (overlapping_trigger)
        event_user(2);
}
var this_frame_directions = [];
var buffer_length = ceil(5 - (climbmomentum * 2));
if (buffer_length >= 5)
    buffer_length = 4;
if ((up_h() || upbuffer > 0) || forceclimb)
{
    if (up_h() && dir != 2)
    {
        upbuffer = buffer_length;
        leftbuffer = 0;
        rightbuffer = 0;
        downbuffer = 0;
    }
    array_push(this_frame_directions, 2);
}
if ((down_h() || downbuffer > 0) && !forceclimb)
{
    if (down_h() && dir != 0)
    {
        upbuffer = 0;
        leftbuffer = 0;
        rightbuffer = 0;
        downbuffer = buffer_length;
    }
    array_push(this_frame_directions, 0);
}
if ((right_h() || rightbuffer > 0) && !forceclimb)
{
    if (right_h() && dir != 1)
    {
        upbuffer = 0;
        leftbuffer = 0;
        rightbuffer = buffer_length;
        downbuffer = 0;
    }
    array_push(this_frame_directions, 1);
}
if ((left_h() || leftbuffer > 0) && !forceclimb)
{
    if (left_h() && dir != 3)
    {
        upbuffer = 0;
        leftbuffer = buffer_length;
        rightbuffer = 0;
        downbuffer = 0;
    }
    array_push(this_frame_directions, 3);
}
var num_inputs = array_length(this_frame_directions);
var used_input = -1;
var cancelled_slip = false;
if (num_inputs == 0)
{
    currentdir = -1;
}
else if (num_inputs == 1 || currentdir == -1)
{
    currentdir = this_frame_directions[0];
    used_input = currentdir;
}
else
{
    for (var i = 0; i < array_length(this_frame_directions); i++)
    {
        if (this_frame_directions[i] == currentdir || this_frame_directions[i] == recently_bumped)
        {
            cancelled_slip = cancelled_slip || this_frame_directions[i] == recently_bumped;
            array_delete(this_frame_directions, i, 1);
            i--;
        }
    }
    if (array_length(this_frame_directions) > 0)
    {
        used_input = this_frame_directions[0];
        cancelled_slip = used_input == previous_bump;
    }
    else if (currentdir != previous_bump && currentdir != recently_bumped)
    {
        used_input = currentdir;
        cancelled_slip = false;
    }
    else
    {
        used_input = currentdir;
        cancelled_slip = true;
    }
}
var lastdir = dir;
if (jumping == 0)
{
    if (used_input >= 0 && (jumping > 0 || neutralcon == 1 || graboncon > 0 || slipcon == 2 || jumpchargecon > 0))
        dir = used_input;
}
if (canjump)
{
    if (button1_h() && !forceclimb && !forcereleasejump)
    {
        if (button1buffer < 2)
            button1buffer = 2;
    }
    if (button1_p() && !forceclimb)
    {
        if (button1buffer < 3)
        {
            button1buffer = 3;
            button2buffer = 0;
        }
    }
    if (!button1_h())
        forcereleasejump = false;
}
else
{
    button1buffer = 0;
    button2buffer = 0;
}
if ((slipcon == 2 && sliptimer > 2 && !cancelled_slip) && neutralcon != 1 && ((used_input >= 0 && lastdir != used_input) || (button1buffer > 0 && button2buffer == 0)))
{
    sliptimer = min(sliptimer, 2);
    climbmomentum = 0;
    climbspeed = 1;
}
if (global.inv <= 0 && global.interact == 0)
{
    var bulletcheck = collision_rectangle(bbox_left + 14, bbox_top + 14, bbox_right - 14, bbox_bottom - 14, obj_climb_bullet, true, true);
    if (invincible)
        bulletcheck = -4;
    if (jumping == 0)
    {
        if (bulletcheck == -4)
        {
            var reposition = x;
            if (onrotatingtower && x >= (obj_rotating_tower_controller_new.tower_circumference - 20))
                x -= obj_rotating_tower_controller_new.tower_circumference;
            bulletcheck = collision_rectangle(bbox_left + 14, bbox_top + 14, bbox_right - 14, bbox_bottom - 14, obj_climb_enemy, true, true);
            x = reposition;
            if (bulletcheck != -4)
            {
                if (bulletcheck.active == 0)
                    bulletcheck = -4;
            }
        }
    }
    if (bulletcheck != -4)
    {
        damage = bulletcheck.damage;
        if (variable_instance_exists(bulletcheck, "target"))
            target = bulletcheck.target;
        damagecon = 1;
    }
}
var cancelcon = 0;
if (global.interact == 0)
{
    var _list = ds_list_create();
    var _num = instance_place_list(x, y, 538, _list, false);
    if (ds_list_size(_list) > 0)
    {
        for (var i = 0; i < ds_list_size(_list); i++)
        {
            var obstacle = ds_list_find_value(_list, i);
            if (obstacle.object_index == obj_climb_door)
            {
                with (obstacle)
                    event_user(9);
            }
            if (obstacle.object_index == obj_climb_orb)
            {
                if (obstacle.con == 0)
                    obstacle.con = 1;
            }
            if (obstacle.object_index == obj_climb_destructableclimbarea)
            {
                if (obstacle.con == 0)
                    obstacle.con = 1;
            }
            var isInteract = false;
            if (obstacle.object_index == obj_climb_interact)
                isInteract = true;
            with (obstacle)
            {
                if (object_get_parent(obj_climb_interact))
                    isInteract = true;
            }
            if (isInteract == true)
            {
                if (variable_instance_exists(obstacle, "myinteract"))
                {
                    if (obstacle.myinteract == 0)
                        obstacle.myinteract = 3;
                }
            }
            var _enemy = false;
            with (obstacle)
            {
                if (object_get_parent(obj_climb_enemy))
                    _enemy = true;
            }
            if (obstacle.object_index == obj_climb_enemy)
                _enemy = true;
            if (_enemy)
            {
                if (jumping == 1 && climbcon == 2)
                {
                    if (variable_instance_exists(obstacle, "damagecon"))
                    {
                        if (obstacle.damagecon == 0)
                        {
                            snd_play(snd_noise);
                            climbcon = 10;
                            cuttimer = 0;
                            obstacle.damagecon = 1;
                        }
                    }
                }
            }
        }
    }
    ds_list_destroy(_list);
}
if (cancelcon)
{
    jumpchargeamount = 0;
    jumpchargetimer = 0;
    snd_stop(snd_chargeshot_charge);
    jumping = 0;
    climbcon = 0;
    neutralcon = 0;
    slipcon = 0;
    image_blend = c_white;
}
if (fallingcon > 0)
{
    if (fallingcon == 1)
    {
        sprite_index = spr_kris_climb_new_slip_fall;
        image_index = 0;
        fallingspeed = 0;
        fallingcon = 2;
        neutralcon = 0;
        snd_stop(snd_chargeshot_charge);
        image_blend = c_white;
        jumping = 0;
        jumpchargecon = 0;
        climbcon = 0;
        climbmomentum = 0;
    }
    if (fallingcon == 2)
    {
        var landing = instance_place(x, y, obj_climb_landingstrip);
        if (i_ex(landing))
        {
            landingstrip = landing;
            neutralcon = -1;
            climbcon = -1;
            jumpchargecon = -1;
            fallingcon = -1;
            graboncon = -1;
            damagecon = -1;
            camera = 0;
            timer = 0;
            exitcon = 1;
        }
        fallingspeed += 0.5;
        if (fallingspeed >= fall_speed_cap)
            fallingspeed = fall_speed_cap;
        if (fallingspeed >= 20)
            naturalybias = min(naturalybias + 2, 80);
        if (falldir == 0)
            y += ceil(fallingspeed);
        if (falldir == 1)
            x += ceil(fallingspeed);
        if (falldir == 2)
            y -= ceil(fallingspeed);
        if (falldir == 3)
            x -= ceil(fallingspeed);
        fallingtimer--;
        if (fallingtimer <= 0)
        {
            if (grabon)
            {
                grabx = remx + (round((x - remx) / 40) * 40);
                graby = remy + (round((y - remy) / 40) * 40);
                if (onrotatingtower && grabx > obj_rotating_tower_controller_new.tower_circumference)
                    grabx -= obj_rotating_tower_controller_new.tower_circumference;
                if (onrotatingtower && grabx < 0)
                    grabx += obj_rotating_tower_controller_new.tower_circumference;
                if (place_meeting(grabx, graby, obj_climb_climbable))
                {
                    grabontimer = 15;
                    graboncon = 1;
                    dir = -1;
                    fallingcon = 0;
                }
            }
            var howlongfall = 660;
            if (instance_exists(obj_dw_churchc_prophecies))
                howlongfall = 9999999;
            if (restorefromfalling)
            {
                if (graboncon == 0)
                {
                    if (y >= (cameray() + howlongfall))
                    {
                        fallingcon = 0;
                        restorefromfallingcon = 1;
                    }
                }
            }
        }
    }
}
if (graboncon > 0)
{
    if (graboncon == 1)
    {
        sprite_index = spr_kris_climb_new_charge;
        image_index = 2;
        graboncon = 2;
    }
    if (graboncon == 2)
    {
        snd_stop(snd_wing);
        snd_play_x(snd_wing, 0.7, 0.6 + random(0.3));
        if ((siner % 2) == 0)
        {
            var dust = instance_create(x, y, obj_animation);
            dust.sprite_index = spr_slidedust;
            dust.image_xscale = 2;
            dust.image_yscale = 2;
            dust.image_speed = 0.5;
            dust.vspeed = -3;
            dust.hspeed = random_range(-1, 1);
            dust.depth = depth + 10;
            if (i_ex(obj_rotating_tower_controller_new) && i_ex(obj_climb_kris))
            {
                dust.x = obj_rotating_tower_controller_new.tower_x;
                dust.depth = obj_rotating_tower_controller_new.depth - 4;
            }
        }
        if (fallingspeed > 7)
            fallingspeed = 7;
        fallingspeed--;
        if (falldir == 0)
            y += fallingspeed;
        if (falldir == 1)
            x += fallingspeed;
        if (falldir == 2)
            y -= fallingspeed;
        if (falldir == 3)
            x -= fallingspeed;
        if (fallingspeed <= 0)
        {
            grabonclimbtimer = 0;
            graboncon = 3;
            remfalleny = y;
            remfallenx = x;
            if ((remfallenx - grabx) > 180)
                remfallenx -= obj_rotating_tower_controller_new.tower_circumference;
            if ((remfallenx - grabx) < -180)
                remfallenx += obj_rotating_tower_controller_new.tower_circumference;
        }
    }
    if (graboncon == 3)
    {
        grabonclimbtimer++;
        var initwait = 7;
        var waittime = 8;
        if (grabonclimbtimer >= initwait)
        {
            y = lerp_ease_inout(remfalleny, graby, (grabonclimbtimer / waittime) - (initwait / waittime), 2);
            x = lerp_ease_inout(remfallenx, grabx, (grabonclimbtimer / waittime) - (initwait / waittime), 2);
        }
        if (grabonclimbtimer >= (waittime + initwait))
        {
            if (onrotatingtower)
            {
                x = (floor(x / 40) * 40) + 20;
                y = (floor(y / 40) * 40) + 20;
            }
            else
            {
                x = round(x / 10) * 10;
                y = round(y / 10) * 10;
            }
            graboncon = 0;
            neutralcon = 1;
            checkdamagefloor = 1;
            with (obj_rotating_tower_controller_new)
                checkdamagefloor = 1;
        }
    }
}
if (restorefromfallingcon > 0)
{
    if (restorefromfallingcon == 1)
    {
        damage = 30;
        damagecon = 1;
    }
    else if (restorefromfallingcon == 20)
    {
        x = safex;
        y = safey;
        neutralcon = 1;
    }
    restorefromfallingcon++;
}
if (neutralcon == 1)
{
    sprite_index = spr_kris_climb_new;
    image_index = climbindex;
    remx = x;
    remy = y;
    if (!place_meeting(x, y, obj_climb_notsafe))
    {
        safex = x;
        safey = y;
    }
    if (global.interact == 0)
    {
        if (button1buffer > 0 && button2buffer <= 0)
        {
            climbmomentum = 0;
            button1buffer = 4;
            neutralcon = 0;
            jumpchargecon = 1;
            dir = 0;
            if (xclimb > 0)
                dir = 1;
            if (xclimb < 0)
                dir = 3;
            if (yclimb < 0)
                dir = 2;
        }
        else if (currentdir >= 0)
        {
            climbcon = 1;
            neutralcon = 0;
        }
        else
        {
            climbmomentum *= 0.5;
        }
        var climb_ender = instance_place(x, y, obj_climbstarter);
        if (!i_ex(climb_ender) && i_ex(obj_rotating_tower_controller_new))
        {
            var xx = obj_rotating_tower_controller_new.tower_x - 20;
            var yy = obj_rotating_tower_controller_new.krisy - 20;
            climb_ender = instance_place(xx, yy, obj_climbstarter);
        }
        if (i_ex(climb_ender))
        {
            if (used_input == 0 && climb_ender.e_down)
                myexit = climb_ender;
            if (used_input == 3 && climb_ender.e_left)
                myexit = climb_ender;
            if (used_input == 2 && climb_ender.e_up)
                myexit = climb_ender;
            if (used_input == 1 && climb_ender.e_right)
                myexit = climb_ender;
        }
        if (i_ex(myexit))
        {
            global.facing = dir;
            with (obj_climbloc)
            {
                if (exitmarkerflag == other.myexit.exitmarkerflag)
                    other.myexitloc = id;
            }
            with (obj_krmarker)
            {
                if (extflag == other.myexit.exitmarkerflag)
                {
                    global.facing = image_index;
                    other.myexitloc = id;
                }
            }
            neutralcon = -1;
            climbcon = -1;
            jumpchargecon = -1;
            fallingcon = -1;
            graboncon = -1;
            damagecon = -1;
            camera = 0;
            timer = 0;
            exitcon = 1;
        }
    }
}
if (exitcon == 1)
{
    var landing = false;
    if (landingstrip != -1)
    {
        myexitloc = landingstrip;
        landing = true;
    }
    if (i_ex(myexitloc))
    {
        var endingx = myexitloc.x;
        var endingy = myexitloc.y;
        if (myexitloc == landingstrip)
        {
            endingx = x - 20;
            endingy = myexitloc.y - 60;
        }
        timer++;
        if (timer == 1)
        {
            endtime = 16;
            if (!landing)
            {
                snd_play(snd_wing);
            }
            else
            {
                snd_play(snd_noise);
                visible = false;
                with (scr_marker_ext(x - 30, y - 54, spr_kris_dw_landed, 2, 2, 0, undefined, undefined, depth, undefined, endtime, 1))
                    scr_shakeobj();
                global.facing = 0;
                with (obj_caterpillarchara)
                {
                    if (name == "susie")
                        setxy((other.x - 80) + 4, other.y - 20 - 42);
                    if (name == "ralsei")
                        setxy((other.x + 80) - 44, other.y - 20 - 44);
                    scr_caterpillar_interpolate_old();
                }
            }
            _camerax = camerax();
            _cameray = cameray();
            var endcamx = endingx - floor((__view_get(e__VW.WView, 0) / 2) - 18);
            var endcamy = endingy - floor((__view_get(e__VW.HView, 0) / 2) - 38);
            endcamx = clamp(endcamx, 0, room_width - 640);
            endcamy = clamp(endcamy, 0, room_height - 480);
            var clamper = -4;
            with (myexitloc)
                clamper = instance_place(x, y, obj_camera_clamper);
            if (i_ex(clamper))
            {
                var roomw = room_width;
                var roomh = room_height;
                var vieww = view_wport[0];
                var viewh = view_hport[0];
                var lclamp = 0;
                var rclamp = roomw - vieww;
                var uclamp = 0;
                var dclamp = roomh - viewh;
                if (clamper.xmin != -4)
                    lclamp = clamper.xmin;
                if (clamper.xmax != -4)
                    rclamp = clamper.xmax;
                if (clamper.ymin != -4)
                    uclamp = clamper.ymin;
                if (clamper.ymax != -4)
                    dclamp = clamper.ymax;
                endcamx = clamp(endcamx, lclamp, rclamp);
                endcamy = clamp(endcamy, uclamp, dclamp);
            }
            scr_lerpvar("_camerax", _camerax, endcamx, endtime - 1);
            scr_lerpvar("_cameray", _cameray, endcamy, endtime - 1);
            if (!landing)
            {
                sprite_index = spr_kris_jump_ball;
                image_speed = 0.25;
                x -= 20;
                y -= 20;
                if (onrotatingtower)
                {
                    x = obj_rotating_tower_controller_new.tower_x - 20;
                    onrotatingtower = false;
                }
                with (obj_caterpillarchara)
                {
                    var xoff = 0;
                    var yoff = 0;
                    if (name == "ralsei")
                    {
                        switch (global.facing)
                        {
                            case 0:
                                xoff = -20;
                                yoff = -28;
                                break;
                            case 1:
                                xoff = -40;
                                yoff = -12;
                                break;
                            case 2:
                                xoff = 18;
                                yoff = 8;
                                break;
                            case 3:
                                xoff = 40;
                                yoff = -12;
                                break;
                        }
                    }
                    if (name == "susie")
                    {
                        switch (global.facing)
                        {
                            case 0:
                                xoff = 12;
                                yoff = -32;
                                break;
                            case 1:
                                xoff = -20;
                                yoff = -16;
                                break;
                            case 2:
                                xoff = -26;
                                yoff = 4;
                                break;
                            case 3:
                                xoff = 8;
                                yoff = -16;
                                break;
                        }
                    }
                    setxy(endingx + xoff, endingy + yoff);
                    var targetexit = other.myexitloc;
                    var checkflag = "";
                    if (targetexit.object_index == obj_krmarker)
                        checkflag = targetexit.extflag;
                    else if (targetexit.object_index == obj_climb_landingstrip)
                        checkflag = "";
                    else
                        checkflag = targetexit.exitmarkerflag;
                    if (name == "susie")
                    {
                        with (obj_sumarker)
                        {
                            if (extflag == checkflag)
                                setxy(x, y, other);
                        }
                    }
                    if (name == "ralsei")
                    {
                        with (obj_ramarker)
                        {
                            if (extflag == checkflag)
                                setxy(x, y, other);
                        }
                    }
                }
            }
            var landingtype = 0;
            if (myexitloc == landingstrip)
                landingtype = 1;
            if (landingtype == 0)
            {
                var jumpstrength = 8;
                if (global.facing == 2)
                    jumpstrength = 12;
                scr_jump_to_point(endingx, endingy, jumpstrength, endtime);
                visible = 0;
            }
            if (landingtype == 1)
            {
            }
        }
        camerax_set(_camerax);
        cameray_set(_cameray);
        if (timer >= (1 + endtime))
        {
            if (!landing)
                snd_play(snd_noise);
            with (obj_mainchara)
            {
                setxy(endingx, endingy);
                visible = true;
                cutscene = false;
                global.interact = 0;
                freeze = false;
            }
            with (obj_caterpillarchara)
            {
                visible = 1;
                image_alpha = 0;
                var blendtime = 8;
                if (landing)
                    blendtime = 12;
                scr_lerp_imageblend(id, c_gray, c_white, blendtime);
                scr_lerpvar("image_alpha", 0, 1, blendtime);
                scr_var_delay("shadow_force_off", false, blendtime);
                scr_caterpillar_interpolate();
                var newfacing = global.facing;
                if (name == "ralsei")
                {
                    with (obj_ramarker)
                    {
                        if (scr_checklocation(other.id, x, y, 4))
                            newfacing = image_index;
                    }
                }
                if (name == "susie")
                {
                    with (obj_sumarker)
                    {
                        if (scr_checklocation(other.id, x, y, 4))
                            newfacing = image_index;
                    }
                }
                scr_caterpillar_facing(newfacing, name);
            }
            instance_destroy();
        }
    }
    else
    {
        neutralcon = 0;
    }
}
if (jumpchargecon > 0)
{
    if (jumpchargecon == 1)
    {
        climbmomentum = 0;
        x = remx;
        y = remy;
        jumpchargesfx = snd_loop(snd_chargeshot_charge);
        snd_pitch(jumpchargesfx, 0.4);
        snd_volume(jumpchargesfx, 0.3, 0);
        jumpchargetimer = 0;
        jumpchargeamount = 1;
        jumpchargecon = 2;
        sprite_index = spr_kris_climb_new_charge;
        image_index = 0;
    }
    if (jumpchargecon == 2)
    {
        var docharge = 0;
        if (button1buffer >= 2 || jumpchargetimer < 3)
            docharge = 1;
        if (button2_p())
            docharge = 2;
        if (docharge == 1)
        {
            if (dir == 2 || dir == 0)
                sprite_index = spr_kris_climb_new_charge;
            else if (dir == 1)
                sprite_index = spr_kris_climb_new_charge_right;
            else
                sprite_index = spr_kris_climb_new_charge_left;
            jumpchargetimer++;
            if (jumpchargetimer >= chargetime1)
            {
                image_index = 1;
                snd_pitch(jumpchargesfx, 0.5);
                jumpchargeamount = 2;
                image_blend = merge_color(c_white, c_teal, 0.2 + (floor(sin(jumpchargetimer / 2)) * 0.2));
            }
            if (jumpchargetimer >= chargetime2)
            {
                image_index = 2;
                jumpchargeamount = 3;
                snd_pitch(jumpchargesfx, 0.7);
                image_blend = merge_color(c_white, c_teal, 0.4 + (floor(sin(jumpchargetimer)) * 0.4));
                if ((jumpchargetimer % 8) == 0)
                {
                    var afterimage = scr_afterimage_grow();
                    afterimage.image_alpha = 0.3;
                    if (i_ex(obj_rotating_tower_controller_new) && i_ex(obj_climb_kris))
                    {
                        afterimage.x = obj_rotating_tower_controller_new.tower_x;
                        afterimage.depth = obj_rotating_tower_controller_new.depth - 4;
                    }
                }
            }
        }
        if (docharge == 0)
        {
            jumpchargecon = 0;
            jumping = 1;
            climbcon = 1;
            image_blend = c_white;
            snd_stop(jumpchargesfx);
        }
        if (docharge == 2)
        {
            snd_play(snd_txttor, 0.7, 0.4);
            snd_play(snd_txtal, 0.7, 0.4);
            snd_play(snd_dtrans_heavypassing, 0.2, 1.8);
            button2buffer = 10;
            jumpchargecon = 0;
            jumpchargetimer = 0;
            neutralcon = 1;
            image_blend = c_white;
            snd_stop(jumpchargesfx);
        }
    }
}
if (slipcon > 0)
{
    if (slipcon == 1)
    {
        if (recently_bumped != dir)
        {
            previous_bump = recently_bumped;
            recently_bumped = dir;
        }
        snd_play(snd_bump);
        if (xclimb > 0)
            slipsprite = 5168;
        else if (xclimb < 0)
            slipsprite = 3591;
        sprite_index = slipsprite;
        image_index = 1;
        slipcon = 2;
    }
    if (slipcon == 2)
    {
        sliptimer--;
        if (sliptimer >= 3)
            image_index = 1;
        else
            image_index = 0;
        if (sliptimer <= 0)
        {
            slipbuffer = 30;
            slipcon = 0;
            if (fallingcon <= 0)
                neutralcon = 1;
        }
    }
}
if (climbcon > 0)
{
    if (climbcon == 1)
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
        var checkamount = 1;
        if (jumping == 1 && jumpchargeamount > 1)
            checkamount = jumpchargeamount;
        for (var i = checkamount; i >= 1; i--)
        {
            var testxclimb = xclimb * i;
            var testyclimb = yclimb * i;
            var finalclimbx = x + testxclimb;
            var finalclimbx2 = (x + testxclimb) - xclimb;
            var falseloopused = 0;
            if (falseloop)
            {
                if (finalclimbx > falseloopx[1])
                {
                    finalclimbx = (finalclimbx - falseloopx[1]) + falseloopx[0];
                    falseloopused = 1;
                }
                if (finalclimbx < falseloopx[0])
                {
                    finalclimbx = (finalclimbx - falseloopx[0]) + falseloopx[1];
                    falseloopused = 1;
                }
                if (finalclimbx2 > falseloopx[1])
                {
                    finalclimbx2 = (finalclimbx2 - falseloopx[1]) + falseloopx[0];
                    falseloopused = 1;
                }
                if (finalclimbx2 < falseloopx[0])
                {
                    finalclimbx2 = (finalclimbx2 - falseloopx[0]) + falseloopx[1];
                    falseloopused = 1;
                }
            }
            var tilesolidcollision = false;
            if (i_ex(obj_rotating_tower_controller_new))
            {
                if (finalclimbx < 0)
                    finalclimbx += obj_rotating_tower_controller_new.tower_circumference;
                var tilex = (finalclimbx / obj_rotating_tower_controller_new.tile_width) + 1;
                var tiley = (y + testyclimb) / obj_rotating_tower_controller_new.tile_height;
                if (obj_rotating_tower_controller_new.verticaltilecount > tiley && tiley >= 0)
                {
                    if (obj_rotating_tower_controller_new.tile_sprite[obj_rotating_tower_controller_new.xy(tilex, tiley)][0] == spr_church_climb_tile1)
                        tilesolidcollision = true;
                }
            }
            with (instance_place(finalclimbx2, (y + testyclimb) - yclimb, obj_climbstarter))
            {
                if (tilesolidcollision == false && ((other.dir == 2 && e_up) || (other.dir == 0 && e_down) || (other.dir == 3 && e_left) || (other.dir == 1 && e_right)))
                {
                    if (falseloopused)
                        other.remx = finalclimbx - testxclimb;
                    other.xclimb = testxclimb;
                    other.yclimb = testyclimb;
                    snd_play_x(snd_wing, 0.6, 1.1 + random(0.1));
                    sprite_index = spr_kris_climb_new;
                    if (other.climbindex == 0)
                        other.climbindex = 2;
                    else
                        other.climbindex = 0;
                    other.climbcon = 2;
                    other.climbtimer = 0;
                    break;
                }
            }
            if (climbcon == 2)
                break;
            if (place_meeting(finalclimbx, y + testyclimb, obj_climb_climbable) && tilesolidcollision == false)
            {
                if (falseloopused)
                    remx = finalclimbx - testxclimb;
                xclimb = testxclimb;
                yclimb = testyclimb;
                snd_play_x(snd_wing, 0.6, 1.1 + random(0.1));
                sprite_index = spr_kris_climb_new;
                if (climbindex == 0)
                    climbindex = 2;
                else
                    climbindex = 0;
                climbcon = 2;
                climbtimer = 0;
                break;
            }
        }
        if (climbcon != 2)
        {
            sliptimer = 8 + (climbmomentum * 4);
            if (jumping == 1)
                sliptimer = 8 + (jumpchargeamount * 3);
            climbcon = 0;
            slipcon = 1;
            jumping = 0;
        }
    }
    if (climbcon == 2)
    {
        if (xclimb > 0)
            slipsprite = 5168;
        else if (xclimb < 0)
            slipsprite = 3591;
        recently_bumped = -1;
        previous_bump = -1;
        if (climbtimer == 0)
        {
            var dust_amount = 1;
            if (jumping)
                dust_amount = 5;
            for (var i = 0; i < dust_amount; i++)
            {
                var dust = instance_create(x, y, obj_animation);
                dust.sprite_index = spr_climb_dust_small;
                dust.depth = depth + 10;
                if (i_ex(obj_rotating_tower_controller_new) && i_ex(obj_climb_kris))
                {
                    dust.x = obj_rotating_tower_controller_new.tower_x;
                    dust.hspeed = -xclimb * 0.1;
                    dust.depth = obj_rotating_tower_controller_new.depth - 4;
                }
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
            if (climbspeed < 1)
                climbspeed = 1;
            climbtimer += (climbspeed + climbmomentum);
            climbrate = 10;
            if (climbtimer >= climbrate)
                climbtimer = climbrate;
            newx = lerp_ease_inout(remx, remx + xclimb, climbtimer / climbrate, 2);
            newy = lerp_ease_inout(remy, remy + yclimb, climbtimer / climbrate, 2);
            image_index = climbindex;
            if (abs(newx - remx) > 3 || abs(newy - remy) > 3)
                image_index = 1 + climbindex;
        }
        else
        {
            climbtimer += 1;
            climbrate = 6 + (jumpchargeamount * 2);
            var clipamount = 4;
            if (jumpchargeamount >= 2)
                clipamount = 2;
            if (climbtimer >= climbrate)
                climbtimer = climbrate;
            if (climbtimer >= (climbrate - clipamount))
                climbtimer = climbrate;
            newx = lerp_ease_out(remx, remx + xclimb, climbtimer / climbrate, 1);
            newy = lerp_ease_out(remy, remy + yclimb, climbtimer / climbrate, 1);
            drawoffsety = -sin((climbtimer / climbrate) * pi) * (2 * (jumpchargeamount - 1));
            if (dir == 2 || dir == 0)
            {
                image_index = climbtimer / 2;
                sprite_index = spr_kris_climb_new_jump_up;
            }
            else if (dir == 1)
            {
                if ((climbtimer / climbrate) > 0.5)
                {
                    sprite_index = spr_kris_climb_new_land_right;
                }
                else
                {
                    sprite_index = spr_kris_climb_new_slip_right;
                    image_index = 0;
                }
            }
            else if ((climbtimer / climbrate) > 0.5)
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
            var climb_ender = instance_place(x - clamp(xclimb, -40, 40), y - clamp(yclimb, -40, 40), obj_climbstarter);
            if (!i_ex(climb_ender) && i_ex(obj_rotating_tower_controller_new))
            {
                var xx = obj_rotating_tower_controller_new.tower_x - 20;
                var yy = obj_rotating_tower_controller_new.krisy - 20;
                climb_ender = instance_place(xx, yy, obj_climbstarter);
            }
            if (i_ex(climb_ender))
            {
                if (yclimb > 0 && climb_ender.e_down)
                    myexit = climb_ender;
                if (xclimb < 0 && climb_ender.e_left)
                    myexit = climb_ender;
                if (yclimb < 0 && climb_ender.e_up)
                    myexit = climb_ender;
                if (xclimb > 0 && climb_ender.e_right)
                    myexit = climb_ender;
            }
            if (i_ex(myexit))
            {
                global.facing = dir;
                with (obj_climbloc)
                {
                    if (exitmarkerflag == other.myexit.exitmarkerflag)
                        other.myexitloc = id;
                }
                with (obj_krmarker)
                {
                    if (extflag == other.myexit.exitmarkerflag)
                    {
                        global.facing = image_index;
                        other.myexitloc = id;
                    }
                }
                neutralcon = -1;
                climbcon = -1;
                jumpchargecon = -1;
                fallingcon = -1;
                graboncon = -1;
                damagecon = -1;
                camera = 0;
                timer = 0;
                exitcon = 1;
                exit;
            }
        }
        x = newx;
        y = newy;
        if (climbtimer >= climbrate)
        {
            if (jumping == 1)
                climbmomentum = jumpchargeamount / 2;
            jumping = 0;
            climbcon = 0;
            jumpchargeamount = 0;
            x = remx + xclimb;
            y = remy + yclimb;
            neutralcon = 1;
            checkdamagefloor = 1;
            with (obj_rotating_tower_controller_new)
                checkdamagefloor = 1;
        }
    }
    if (climbcon == 10)
    {
        sprite_index = spr_kris_climb_new_charge;
        image_index = 2;
        cuttimer++;
        if (cuttimer == 1)
            flashcon = 1;
        if (cuttimer >= 5)
            climbcon = 2;
    }
}
if (checkdamagefloor)
{
    var hazardtile = instance_place(x, y, obj_climb_hazardtile);
    if (i_ex(hazardtile))
    {
        damagecon = 1;
        damage = hazardtile.damage;
        if (variable_instance_exists(hazardtile, "target"))
            target = hazardtile.target;
    }
    checkdamagefloor = 0;
}
if (damagecon == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all_overworld();
    with (obj_darkcontroller)
        charcon = 1;
    hitcount++;
    damagecon = 0;
    if (onrotatingtower)
    {
        with (obj_rotating_tower_controller_new)
        {
            var px = other.x;
            var py = other.y - 20;
            var _tilex = px / tile_width_fine;
            if (_tilex > horizontaltilecount)
                _tilex -= horizontaltilecount;
            if (_tilex < 0)
                _tilex += horizontaltilecount;
            global.heartx = (tower_x + tile_x[_tilex] + 10) - camerax();
            global.hearty = py - cameray();
        }
    }
    else
    {
        global.heartx = x - 6 - camerax();
        global.hearty = y - 6 - cameray();
    }
}
siner++;
upbuffer--;
leftbuffer--;
downbuffer--;
rightbuffer--;
button1buffer--;
slipbuffer--;
climbmomentum -= 0.03;
if (climbmomentum <= 0)
    climbmomentum = 0;
global.inv--;
if (camera == 1)
{
    with (obj_mainchara)
        cutscene = 1;
    var roomw = room_width;
    var roomh = room_height;
    var vieww = view_wport[0];
    var viewh = view_hport[0];
    var _cameralerpspeed = 0.16;
    var xnudge = 0;
    var ynudge = 0;
    var nudger = instance_place(x, y, obj_camera_nudger);
    with (nudger)
    {
        xnudge = xamt;
        ynudge = yamt;
        if (lerpstrength != -4)
            _cameralerpspeed = lerpstrength;
    }
    var camx = clamp((x - floor(vieww / 2)) + xnudge, 0, roomw - vieww);
    var camy = clamp((y - floor(viewh / 2)) + ynudge + naturalybias, 0, roomh - viewh);
    var clamper = instance_place(x, y, obj_camera_clamper);
    if (i_ex(clamper))
    {
        var lclamp = 0;
        var rclamp = roomw - vieww;
        var uclamp = 0;
        var dclamp = roomh - viewh;
        if (clamper.xmin != -4)
            lclamp = clamper.xmin;
        if (clamper.xmax != -4)
            rclamp = clamper.xmax;
        if (clamper.ymin != -4)
            uclamp = clamper.ymin;
        if (clamper.ymax != -4)
            dclamp = clamper.ymax;
        if (clamper.lerpstrength != -4)
            _cameralerpspeed = clamper.lerpstrength;
        camx = clamp(camx, lclamp, rclamp);
        camy = clamp(camy, uclamp, dclamp);
    }
    var idealcamx = scr_even(lerp(camerax(), camx, _cameralerpspeed));
    var idealcamy = scr_even(lerp(cameray(), camy, _cameralerpspeed));
    if (!onrotatingtower)
        camerax_set(idealcamx);
    cameray_set(idealcamy);
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

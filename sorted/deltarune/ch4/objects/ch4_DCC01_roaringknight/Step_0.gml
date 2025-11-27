if (state == 0)
{
    siner2++;
    y = ystart + (cos(siner2 / 8) * 8);
    aetimer++;
    if ((aetimer % move_speed) == 0 && image_alpha != 0)
    {
        if (state == 0)
        {
            var afterimage = instance_create_depth(x, y, depth + 1, obj_afterimage);
            afterimage.sprite_index = sprite_index;
            afterimage.image_alpha = 0.6;
            afterimage.fadeSpeed = 0.02;
            afterimage.hspeed = after_image_rate * after_image_dir;
            afterimage.image_index = image_index;
            afterimage.image_speed = 0;
            afterimage.image_xscale = image_xscale;
            afterimage.image_yscale = image_yscale;
        }
    }
}
if (state == 1)
{
    timer++;
    if (done == 0)
    {
    }
    if (done == 1)
    {
        makespear = 0;
        state = 0;
        done = 0;
    }
    if (spear_dodge == 1)
    {
        var gox = xstart + (choose(40, 50, 60, 70) * choose(rem1));
        var goy = ystart + (choose(20, 30, 40) * choose(-1, 1));
        if (done)
            gox = xstart;
        if (done)
            goy = ystart;
        con = 2;
        var offset = 6;
        scr_lerpvar("x", x, gox, 12 - offset, 2, "out");
        scr_lerpvar("y", y, goy, 12 - offset, 2, "out");
        rem1 *= -1;
        spear_dodge = 0;
        sprite_index = spr_roaringknight_ball_transition_reverse;
        image_speed = 0;
        image_index = 0;
        scr_lerpvar("image_index", 4, 0, 12 - offset);
        scr_delay_var("sprite_index", 2221, 12 - offset);
        scr_script_delayed(scr_lerpvar, 12 - offset, "image_index", 0, 4, 12 - offset);
        snd_play(snd_knight_teleport);
    }
    if ((timer % 2) == 0)
    {
        var afterimage = scr_afterimage();
        afterimage.image_alpha = 0.8;
        afterimage.direction = random(360);
        afterimage.speed = 2;
    }
}
if (state == 2)
{
    timer++;
    if (timer == 1)
    {
        sprite_index = spr_roaringknight_looking;
        image_index = 0;
    }
    if (timer == 5)
        image_index = 1;
    if (timer == 47)
        image_index = 2;
    if (timer == 53)
        image_index = 3;
    if (timer == 93)
        timer = 0;
    siner2++;
    y = ystart + (cos(siner2 / 8) * 8);
    aetimer++;
    if ((aetimer % move_speed) == 0 && image_alpha != 0)
    {
        var afterimage = instance_create_depth(x, y, depth + 1, obj_afterimage);
        afterimage.sprite_index = sprite_index;
        afterimage.image_alpha = 0.6;
        afterimage.fadeSpeed = 0.02;
        afterimage.hspeed = after_image_rate * after_image_dir;
        afterimage.image_index = image_index;
        afterimage.image_speed = 0;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
    }
}
if (state == 3)
{
    if (con == 0)
    {
        con = -1;
        sprite_index = spr_roaringknight_throw_sword;
        image_index = 0;
        image_speed = 0;
        scr_lerp_var_instance(id, "image_index", 0, 4, 30);
    }
    if (con == 1)
    {
        con = -1;
        sprite_index = spr_roaringknight_throw_sword;
        image_index = 4;
        scr_lerp_var_instance(id, "image_index", 4, 11, 30);
        scr_delay_var("state", -1, 40);
    }
}
if (state == 4)
{
    if (con == 0)
    {
        con = 1;
        timer = 0;
        sprite_index = spr_roaringknight_throw_sword;
        image_index = 13;
        var yoffset = -400;
        scr_lerp_var_instance(id, "y", y, (y - 320) + yoffset, 45, 1, "out");
        sword_marker = scr_dark_marker(x + 120, y + 10, spr_roaringknight_sword_throw);
        image_angle = 20;
        sword_marker.swordid = 0;
        var snd = snd_play(snd_knight_jump, 0, 0.4);
        snd_volume(snd, 1, 8);
        sword_marker.depth = depth - 10;
        sword_marker.init = 1;
        with (sword_marker)
        {
            scr_lerpvar("image_angle", image_angle, 720, 50, 1, "out");
            image_xscale = 2;
            image_yscale = 2;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 25)
        {
            for (var i = -2; i <= 2; i++)
            {
                if (i != 0)
                {
                    with (scr_dark_marker(x + 120, y + 10, spr_roaringknight_sword_throw))
                    {
                        depth = other.depth - 12;
                        swordid = i;
                        image_xscale = 2;
                        image_yscale = 2;
                        scr_lerpvar("image_angle", image_angle, 360 - (2 * i), 25, 1, "out");
                        init = 0;
                    }
                }
            }
        }
        with (obj_marker)
        {
            if (sprite_index == spr_roaringknight_sword_throw)
            {
                x = other.x + 120 + (swordid * 40 * (max(other.timer - 25, 0) / 25)) + lengthdir_x(80, 90 + (180 * (other.timer / 50)));
                y = (other.y - 20) + (abs(swordid) * 10 * (max(other.timer - 25, 0) / 25)) + lengthdir_y(140, -90 + (180 * (other.timer / 50)));
            }
        }
        scr_delay_var("sword_flash_active", true, 5);
        if (timer >= 50)
        {
            con = -1;
            timer = 0;
            scr_delay_var("con", 3, 25);
        }
    }
    if (sword_flash_active)
    {
        with (obj_marker)
        {
            if (sprite_index == spr_roaringknight_sword_throw)
            {
                if (init == 0)
                {
                    init = 1;
                }
                else
                {
                    with (scr_afterimage())
                    {
                        image_alpha = 0.5;
                        vspeed = other.vspeed;
                    }
                }
            }
        }
    }
    if (con == 3)
    {
        con = 4;
        sword_flash_active = false;
        with (sword_marker)
            image_alpha = 1;
        target_flash_active = true;
        scr_delay_var("target_flash_active", false, 20);
        scr_delay_var("con", 5, 5);
        scr_delay_var("timer", 0, 5);
    }
    if (target_flash_active)
    {
        snd_play(snd_fountain_target);
        blazetimer++;
        anim = instance_create((x - 100) + (blazetimer * 6 * 4), y + 10 + random(20), obj_animation);
        anim.sprite_index = spr_kris_make_fountain_flash;
        anim.image_xscale = 2;
        anim.image_yscale = 2;
        anim.image_speed = 0.5;
        anim.depth = depth + 10;
    }
    if (con == 5)
    {
        timer++;
        if (timer == 1)
            image_index = 14;
        if ((timer % 2) == 1)
        {
            with (obj_marker)
            {
                if (sprite_index == spr_roaringknight_sword_throw && (5 + (2 * swordid)) == other.timer)
                {
                    var xspd = lengthdir_x(1, image_angle - 90);
                    var yspd = lengthdir_y(1, image_angle - 90);
                    scr_lerpvar("hspeed", -14 * xspd, 0, 12, 1, "out");
                    scr_lerpvar("vspeed", -14 * yspd, 0, 12, 1, "out");
                    scr_delay_var("hspeed", 80 * xspd, 18);
                    scr_delay_var("vspeed", 80 * yspd, 18);
                }
            }
        }
        if (timer >= 19 && timer <= 27 && (timer % 2) == 1)
        {
            snd_stop(snd_chargeshot_fire);
            snd_play(snd_chargeshot_fire, 1, 1.4);
        }
        var advanceframe = [];
        advanceframe[5] = true;
        var delay = 16;
        advanceframe[2 + delay] = true;
        advanceframe[4 + delay] = true;
        advanceframe[6 + delay] = true;
        advanceframe[8 + delay] = true;
        if (array_length(advanceframe) > timer && advanceframe[timer])
            image_index++;
        if (timer >= (delay + 2) && timer <= (delay + 10) && (timer % 2) == 0)
        {
            var scale = 4;
            var idx = -(timer - delay - 6) / 2;
            with (instance_create((camerax() + (0.5 * camerawidth())) - (10 * scale), y - 400, obj_marker))
            {
                sprite_index = spr_pxwhite;
                image_xscale = 20 * scale;
                image_angle = idx * 3;
                x -= (60 * idx);
                scr_lerpvar("image_xscale", 20 * scale, 0, 4);
                scr_lerpvar("x", x, x + (10 * scale), 4);
                scr_lerpvar("image_alpha", 1, 0, 8);
                image_yscale = 1000;
                scr_doom(self, 8);
            }
        }
        if (timer == (delay + 11))
        {
            con = 7;
            timer = 0;
        }
    }
    if (con == 7 || con == 8)
    {
        if (con == 7)
        {
            with (obj_marker)
            {
                if (sprite_index == spr_roaringknight_sword_throw)
                {
                    scr_lerp_var_instance(id, "image_xscale", image_xscale, 1, 10);
                    scr_lerp_var_instance(id, "image_yscale", image_yscale, 4, 10);
                    scr_doom(id, 10);
                    scr_afterimage().image_alpha = 0.4;
                }
            }
            con = 8;
            scr_delay_var("con", 9, 18);
            scr_delay_var("con", 10, 40);
        }
        else
        {
            timer++;
            with (obj_marker)
            {
                if (sprite_index == spr_roaringknight_sword_throw)
                    scr_afterimage().image_alpha = 0.3 + ((0.4 * other.timer) / 10);
            }
        }
    }
    if (con == 9)
    {
        with (scr_dark_marker(0, 13, spr_titan_fountain_loop_base_white))
        {
            depth = other.depth;
            image_alpha = 1;
            scr_lerpvar("image_alpha", 1, 0, 30);
            scr_doom(self, 30);
        }
        thundersound = snd_play(snd_thunder_boom_2, 1, 0.5);
        snd_volume(thundersound, 0, 90);
        snd_stop_delay(thundersound, 90);
        con = 9.5;
    }
}

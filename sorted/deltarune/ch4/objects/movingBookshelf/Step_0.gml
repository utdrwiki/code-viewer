if (init == 0)
{
    i_ex(obj_mainchara);
    if (obj_mainchara.x > x)
        x = rightx;
    alarm[2] = 1;
    init = 1;
}
if (init == 2)
{
    scr_depth();
    if (ralsei == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "ralsei")
                other.ralsei = id;
        }
    }
    if (susie == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                other.susie = id;
        }
    }
    if (krl == 0)
    {
        with (obj_bookshelfLanding)
        {
            if (image_index == 0 && myride == other.myride && x < other.x)
                other.krl = id;
        }
    }
    if (krr == 0)
    {
        with (obj_bookshelfLanding)
        {
            if (image_index == 0 && myride == other.myride && x > other.x)
                other.krr = id;
        }
    }
    if (susl == 0)
    {
        with (obj_bookshelfLanding)
        {
            if (image_index == 1 && myride == other.myride && x < other.x)
                other.susl = id;
        }
    }
    if (susr == 0)
    {
        with (obj_bookshelfLanding)
        {
            if (image_index == 1 && myride == other.myride && x > other.x)
                other.susr = id;
        }
    }
    if (rall == 0)
    {
        with (obj_bookshelfLanding)
        {
            if (image_index == 2 && myride == other.myride && x < other.x)
                other.rall = id;
        }
    }
    if (ralr == 0)
    {
        with (obj_bookshelfLanding)
        {
            if (image_index == 2 && myride == other.myride && x > other.x)
                other.ralr = id;
        }
    }
    if (engaged == 1)
    {
        depth = 800000;
        if (con == 0)
        {
            global.flag[7] = 1;
            global.interact = 1;
            depth += 10000;
            timer++;
            if (timer == 1)
            {
                snd_play(snd_jump);
                obj_mainchara.fun = 1;
                obj_mainchara.image_speed = 0.25;
                obj_mainchara.sprite_index = krisball;
                with (obj_mainchara)
                    scr_jump_to_point((other.x + (other.sprite_width / 2)) - 20, (other.y + (other.sprite_height / 2)) - 26, 8, 15);
                if (susie != 0)
                {
                    with (susie)
                        scr_jump_to_point(other.x + (other.sprite_width / 2) + 18, (other.y + (other.sprite_height / 2)) - 38, 8, 15);
                    susie.fun = 1;
                    susie.sprite_index = susieball;
                    susie.image_speed = 0.25;
                }
                if (ralsei != 0)
                {
                    with (ralsei)
                        scr_jump_to_point((other.x + (other.sprite_width / 2)) - 62, (other.y + (other.sprite_height / 2)) - 36, 8, 15);
                    ralsei.fun = 1;
                    ralsei.sprite_index = ralseiball;
                    ralsei.image_speed = 0.25;
                }
            }
            if (timer == 16)
            {
                timer = 0;
                con = 1;
                global.interact = 0;
            }
        }
        if (con == 1)
        {
            with (obj_mainchara)
            {
                battlemode = 1;
                battlealpha = 0;
            }
            riding = true;
            maxspeed = 18;
            if (going == "left" && abs(hspeed) < maxspeed)
                hspeed--;
            if (going == "right" && abs(hspeed) < maxspeed)
                hspeed++;
            hspeed = clamp(hspeed, -maxspeed, maxspeed);
            if (up_h() && !down_h())
                vspeed--;
            if (down_h() && !up_h())
                vspeed++;
            if ((!up_h() && !down_h()) || (up_h() && down_h()))
            {
                if (vspeed > 0)
                    vspeed--;
                if (vspeed < 0)
                    vspeed++;
            }
            maxvspeed = 8;
            vspeed = clamp(vspeed, -maxvspeed, maxvspeed);
            y = clamp(y, topY, botY);
            if (x >= rightx && going == "right")
            {
                x = rightx;
                with (obj_mainchara)
                    scr_jump_to_point(other.krr.x, other.krr.y, 8, 15);
                if (susie != 0)
                {
                    with (susie)
                        scr_jump_to_point(other.susr.x, other.susr.y, 8, 15);
                }
                if (ralsei != 0)
                {
                    with (ralsei)
                        scr_jump_to_point(other.ralr.x, other.ralr.y, 8, 15);
                }
                con = 1.5;
            }
            if (x <= leftx && going == "left")
            {
                x = leftx;
                with (obj_mainchara)
                    scr_jump_to_point(other.krl.x, other.krl.y, 8, 15);
                if (susie != 0)
                {
                    with (susie)
                        scr_jump_to_point(other.susl.x, other.susl.y, 8, 15);
                }
                if (ralsei != 0)
                {
                    with (ralsei)
                        scr_jump_to_point(other.rall.x, other.rall.y, 8, 15);
                }
                con = 1.5;
            }
            if (place_meeting(x, y, obj_overworldbulletparent))
            {
                var perp = instance_place(x, y, obj_overworldbulletparent);
                if (perp.active == 1)
                {
                    vspeed = 0;
                    hspeed *= 0.2;
                    with (perp)
                    {
                        if (global.inv < 0)
                            event_user(5);
                        active = 2;
                    }
                }
            }
        }
        if (con == 1.5)
        {
            snd_play(snd_jump);
            global.interact = 1;
            hspeed = 0;
            vspeed = 0;
            snd_play(snd_locker);
            con = 2;
            timer = 0;
            riding = false;
            with (obj_darkcontroller)
                charcon = 0;
            obj_mainchara.fun = 1;
            obj_mainchara.image_speed = 0.25;
            obj_mainchara.sprite_index = krisball;
            if (susie != 0)
            {
                susie.sprite_index = susieball;
                susie.image_speed = 0.25;
                susie.ignoredepth = 0;
            }
            if (ralsei != 0)
            {
                susie.image_speed = 0.25;
                ralsei.sprite_index = ralseiball;
                ralsei.ignoredepth = 0;
            }
        }
        if (con == 2)
        {
            depth += 10000;
            timer++;
            if (timer == 12)
                panactive = 0;
            if (timer == 17)
            {
                obj_mainchara.fun = 0;
                with (obj_mainchara)
                    battlemode = 0;
                with (obj_caterpillarchara)
                {
                    fun = 0;
                    follow = 1;
                    scr_caterpillar_interpolate();
                }
                vspeed = 0;
                scr_move_to_point_over_time(x, ystart, 15);
                engaged = 0;
                global.facing = 0;
                global.interact = 0;
                global.flag[7] = 0;
                timer = 0;
                con = 0;
            }
        }
    }
    if (panactive == 1)
    {
        pan = lerp(pan, pantarg, 0.1);
        if (going == "right")
            pantarg = 200;
        if (going == "left")
            pantarg = -200;
        mycam.targetXRelative[0] = pan;
    }
    else
    {
        pantarg = 0;
        pan = lerp(pan, pantarg, 0.25);
        mycam.targetXRelative[0] = pan;
    }
}

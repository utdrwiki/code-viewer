if ((con == 0 || con == 10) && global.interact == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == other.extflag)
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        con++;
        timer = 0;
    }
}
if (con == 1)
{
    if (global.interact == 0)
    {
        timer++;
        if (timer == 1)
        {
            if (!mute)
                snd_play(snd_wing);
            scr_lerpvar_respect("image_index", 0, 2, 4);
            scr_lerpvar_respect("auraalpha", 0, 1, 6, 2, "out");
            scr_lerpvar_respect("y", y, y - 40, 6, -1, "out");
        }
        if (timer > 6)
            y += (sin(timer / 4) * 4);
        if (timer > 9)
            image_index += (0.75 - (0.5 * ((timer - 12) / 12)));
        if (timer >= 24)
        {
            if (!mute)
                snd_play(snd_board_mantle_dash_fast, 0.6);
            con = 2;
            timer = 0;
        }
    }
}
if (con == 2)
{
    timer++;
    if (global.interact == 0)
    {
        if (timer == 1)
            direction = point_direction(x, y, (obj_mainchara.x + 20) - myxoff, (obj_mainchara.y + 40) - myyoff);
        spd = lerp(spd, 25, 1 / (15 + (40 * easy)));
        speed = spd;
        image_index += 0.5;
        var wid = 40;
        var hei = 50;
        var heioff = 12;
        var inst = collision_rectangle((x + myxoff) - (wid / 2), ((y + myyoff) - (hei / 2)) + heioff, x + myxoff + (wid / 2), y + myyoff + (hei / 2) + heioff, obj_mainchara, false, 0);
        if (i_ex(inst) && global.interact == 0)
        {
            with (obj_mainchara)
                other.krismarker = scr_marker_ext(x, y, sprite_index, 2, 2, 0, image_index, undefined, undefined, undefined, undefined, 0);
            with (krismarker)
            {
                depth = other.depth + 1;
                scr_lerpvar("image_alpha", 0, 1, 8);
            }
            con = 3;
            with (obj_dw_bluebook_straight)
            {
                if (con > 0 && con < 3)
                {
                    scr_doom(self, 30);
                    scr_lerpvar("image_alpha", 1, 0, 30);
                }
                else if (con == 0)
                {
                    con = 10;
                }
            }
            timer = 0;
            scr_lerpvar("auraalpha", 1, 0, 4, 2, "in");
            global.interact = 1;
            speed = 0;
            spd = 0;
        }
    }
    else
    {
        speed = 0;
    }
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        var xtarg = (obj_mainchara.x + 120) - myxoff;
        var ytarg = (obj_mainchara.y + 38) - myyoff;
        scr_lerpvar("x", x, xtarg, 16, 2, "out");
        scr_lerpvar("y", y, ytarg, 16, 2, "out");
        scr_lerpvar("image_index", image_index, 0, 3);
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (timer == 4)
    {
        sprite_index = spr_bibliox_intro;
        image_index = 0;
        scr_lerpvar("image_index", 0, 5, 10);
    }
    if (timer == 24)
    {
        visible = false;
        var marker = scr_marker_ext(x, y, sprite_index, 2, 2, undefined, image_index, image_blend, 500);
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, marker);
        safe_delete(krismarker);
        instance_destroy();
    }
}
if (con == 11)
{
    if (global.interact == 0)
    {
        timer++;
        if (timer == 1)
        {
            if (!mute)
                snd_play(snd_wing);
        }
        if (timer > 6)
        {
            y += (sin(timer / 4) * 4);
            y -= 2;
        }
        if (timer > 9)
            image_index += (0.75 - (0.5 * ((timer - 12) / 12)));
        if (timer >= 24)
        {
            con = 12;
            timer = 0;
        }
    }
}
if (con == 12)
{
    sprite_index = spr_bibliox_openbook;
    if (bakeme)
        sprite_index = spr_bibliox_openbook_bake;
    image_index = min(1, floor(timer / 4));
    var last_timer = timer;
    if (global.interact == 0 && !(button3_p() && obj_mainchara.threebuffer < 0 && global.flag[7] == 0 && obj_mainchara.battlemode == 0 && obj_mainchara.swordmode == 0))
        timer++;
    if (timer == 1 && timer > last_timer)
    {
        image_xscale = 2;
        y = starty - 18;
        if (obj_mainchara.x > x)
        {
            image_xscale = -2;
            x += 100;
        }
    }
    if (timer == 12)
        snd_play(snd_board_torch);
    if (timer > 8 && (timer % 4) == 0)
    {
        var bullet = instance_create(x + (20 * image_xscale), y + 60, obj_overworld_lanternflame);
        bullet.depth = depth - 5;
        bullet.image_speed = 0.25;
        var xx = (obj_mainchara.x + random_range(-60, 60)) - x;
        var yy = (obj_mainchara.y + random_range(-60, 60)) - y;
        bullet.direction = point_direction(0, 0, xx, yy);
        bullet.speed = random_range(5, 6);
    }
    if (timer == 24)
    {
        con = 13;
        timer = 0;
        y -= 30;
        sprite_index = spr_bibliox_flyingbook;
        if (bakeme)
            sprite_index = spr_bibliox_flyingbook_baked;
        if (image_xscale == -2)
            x -= 100;
        image_xscale = 2;
        image_yscale = 2;
    }
}
if (con == 13)
{
    if (global.interact == 0)
    {
        timer++;
        if (timer > 6)
            y += (sin(timer / 4) * 4);
        if (timer > 9)
            image_index += 0.5;
        if (timer == 80)
        {
            var trig = 0;
            with (obj_trigger)
            {
                if (extflag == other.extflag)
                {
                    if (place_meeting(x, y, obj_mainchara))
                        trig = 1;
                }
            }
            if (trig)
            {
                con = 12;
                timer = 0;
            }
        }
        else if (timer > 80)
        {
            sprite_index = spr_bibliox_plantbook;
            if (bakeme)
                sprite_index = spr_bibliox_plantbook_bake;
            image_index = 3 - clamp((y - starty) / 40, 0, 3);
            y = (y + timer) - 80;
            if (y >= starty)
            {
                y = starty;
                con = 10;
                timer = 0;
                sprite_index = spr_bibliox_flyingbook;
                if (bakeme)
                    sprite_index = spr_bibliox_flyingbook_baked;
                image_index = 0;
            }
        }
    }
}

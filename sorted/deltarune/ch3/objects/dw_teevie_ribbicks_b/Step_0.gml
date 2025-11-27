if (con == 0)
{
    var trig = false;
    if (global.interact == 0)
    {
        with (obj_triggervolume)
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = true;
        }
    }
    if (trig == true)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    var falltime = 6;
    if (timer == 1)
    {
        trash.sprite_index = spr_dw_ch3_b3bs_trashcan_fall;
        with (trash)
            scr_lerpvar("image_index", 0, 4, falltime);
    }
    if (timer == (1 + falltime))
    {
        snd_play(snd_impact);
        ribbick = scr_dark_marker((trash.x + 80) - 20, trash.y, spr_ribbick_Idle);
        with (ribbick)
        {
            scr_depth();
            depth = other.trash.depth - 1;
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 4, 2, "out");
            scr_animate(2, 0, 0.125);
            hspeed = 6;
            friction = 0.5;
        }
    }
    if (timer == (1 + falltime + 10))
    {
        with (ribbick)
        {
            other.ribbick = instance_create(x, y, obj_chaseenemy);
            other.ribbick.sprite_index = sprite_index;
            other.ribbick.touchsprite = spr_ribbick_hurt2;
            other.ribbick.myencounter = 126;
            other.ribbick.encounterflag = other.encounterflag;
            other.ribbick.alerted = 1;
            other.ribbick.ct0minspeed = 4;
            other.ribbick.ct0topspeed = 8;
            other.ribbick.ct0acc = 1;
            if (global.flag[other.encounterflag] != 0)
            {
                other.ribbick.ct0minspeed = 2;
                other.ribbick.ct0topspeed = 6;
                other.ribbick.ct0acc = 0.5;
            }
            else
            {
                other.ribbick.alertskip = 1;
            }
            instance_destroy();
        }
        with (trash)
        {
            depth += 100;
            scr_lerpvar("image_alpha", 2, 0, 30, 2, "out");
            scr_doom(id, 60);
        }
    }
}

var targ = 1049;
if (con == 0)
{
    timer++;
    var droptime = 50;
    if (global.flag[encounterflag] != 0)
        droptime = 30;
    if (timer == 1)
    {
        var targy = targ.y + 20;
        if (instance_exists(obj_dw_churchc_angelprophecy_encounter))
            targy += 10;
        scr_lerpvar_respect("y", y, targy, droptime, -1, "out");
        var hspmax = 16;
        if (global.flag[encounterflag] != 0)
            hspmax = 8;
        var targspd = hspmax;
        if (dir == 0)
            targspd = -hspmax;
        scr_lerpvar_respect("hsp", 0, targspd, 60, 2, "in");
    }
    if (timer > 1)
    {
        var targdepth = obj_mainchara.depth;
        with (obj_caterpillarchara)
        {
            if (depth > targdepth)
                targdepth = depth;
        }
        depth = targdepth + 5;
        hspeed = hsp;
        if (global.interact != 0)
            hspeed = 0;
    }
    if (timer >= (1 + droptime + 60))
    {
        if (global.interact == 0)
        {
            if (global.flag[encounterflag] != 0)
            {
                vsp = lerp(vsp, 16, 0.1);
                y -= vsp;
            }
        }
    }
    var xx = x - 32;
    var yy = y;
    if (global.interact == 0)
    {
        if (i_ex(collision_rectangle(xx, yy, xx + 68, yy + 36, obj_mainchara, 0, true)))
        {
            timer = 0;
            global.interact = 1;
            hspeed = 0;
            with (obj_lerpvar)
            {
                if (target == other.id)
                    instance_destroy();
            }
            con = 1;
            timer = 0;
            marker = scr_marker_ext(x - 66, y - 50, spr_incense_turtle_body, 2, 2, undefined, undefined, c_black, 500);
            with (marker)
            {
                scr_lerp_imageblend(id, c_black, c_white, 24, 2, "out");
                if (instance_exists(obj_dw_churchc_angelprophecy_encounter))
                {
                    image_alpha = 0;
                    scr_lerpvar("image_alpha", 0, 1, 12);
                }
            }
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
        scr_lerpvar("image_alpha", 1, 0, 10);
    }
    if (timer == 24)
    {
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, marker);
        instance_destroy();
    }
}
if (x > (room_width + 134) || x < -134)
{
    debug_print("I'm gone");
    instance_destroy();
}

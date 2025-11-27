if (init == 0)
{
    myspeed = 16;
    maxlength = round(160 / myspeed);
    con = 0;
    speed = myspeed;
    image_angle = direction + 90;
    init = 1;
}
if (con == 0)
{
    timer++;
    var resethook = false;
    if (timer >= maxlength)
        resethook = true;
    for (var i = 0; i < array_length(hookablelist); i++)
    {
        if (!i_ex(hookedobj))
            hookedobj = instance_place(x + hspeed, y + vspeed, hookablelist[i]);
    }
    if (i_ex(hookedobj))
    {
        resethook = false;
        debug_message("hookedobj=" + string(hookedobj));
        var hstep = 0;
        for (var i = 0; i < abs(round(hspeed)); i++)
        {
            if (place_meeting(x + (i * sign(hspeed)), y, hookedobj))
            {
                hstep = i;
                break;
            }
        }
        x += ((hstep - 1) * sign(hspeed));
        var vstep = 0;
        for (var i = 0; i < abs(round(vspeed)); i++)
        {
            if (place_meeting(x, y + (i * sign(vspeed)), hookedobj))
            {
                vstep = i;
                break;
            }
        }
        y += ((vstep - 1) * sign(vspeed));
        snd_play_pitch(snd_bluh, 2);
        speed = 0;
        con = 10;
        if (hookdaddy.name == "susie" && global.flag[1020] == 1)
        {
            var tograbobj = hookedobj;
            with (hookdaddy)
            {
                for (var i = 0; i < array_length(grabbablelist); i++)
                {
                    if (tograbobj.object_index == grabbablelist[i])
                        other.con = 20;
                }
            }
        }
    }
    if (place_meeting(x + hspeed, y + vspeed, obj_board_solid))
    {
        var hstep = 0;
        for (var i = 0; i < abs(round(hspeed)); i++)
        {
            if (place_meeting(x + (i * sign(hspeed)), y, obj_board_solid))
            {
                hstep = i;
                break;
            }
        }
        x += ((hstep - 1) * sign(hspeed));
        var vstep = 0;
        for (var i = 0; i < abs(round(vspeed)); i++)
        {
            if (place_meeting(x, y + (i * sign(vspeed)), obj_board_solid))
            {
                vstep = i;
                break;
            }
        }
        y += ((vstep - 1) * sign(vspeed));
        snd_play(snd_bluh);
        resethook = true;
    }
    if (x >= 492)
        resethook = true;
    if (x <= 140)
        resethook = true;
    if (y >= 308)
        resethook = true;
    if (y <= 76)
        resethook = true;
    if (resethook == true)
    {
        speed = 0;
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 4)
    {
        timer = 0;
        con = 2;
        var resettime = round(point_distance(x, y, xstart, ystart) / myspeed);
        scr_lerpvar("x", x, xstart, resettime);
        scr_lerpvar("y", y, ystart, resettime);
    }
}
if (con == 2)
{
    if (abs(x - xstart) <= 8 && abs(y - ystart) <= 8)
        instance_destroy();
}
if (con == 10)
{
    var lerptime = round(point_distance(x, y, xstart, ystart) / myspeed);
    scr_lerpvar("xstart", xstart, x, lerptime);
    scr_lerpvar("ystart", ystart, y, lerptime);
    con = 11;
}
if (con == 11)
{
    var xadj = 0;
    var yadj = 0;
    if (hookdaddy.facing == 0)
    {
        xadj = -16;
        yadj = -22;
    }
    if (hookdaddy.facing == 1)
    {
        xadj = -22;
        yadj = -24;
    }
    if (hookdaddy.facing == 2)
    {
        xadj = -16;
        yadj = -10;
    }
    if (hookdaddy.facing == 3)
    {
        xadj = -10;
        yadj = -24;
    }
    hookdaddy.x = xstart + xadj;
    hookdaddy.y = ystart + yadj;
    if (x == xstart && y == ystart)
    {
        con = 12;
        scr_doom(id, 2);
    }
}
if (con == 20)
{
    var lerptime = round(point_distance(x, y, xstart, ystart) / myspeed);
    scr_lerpvar("x", x, xstart, lerptime);
    scr_lerpvar("y", y, ystart, lerptime);
    xoffset = hookedobj.x - x;
    yoffset = hookedobj.y - y;
    con = 21;
}
if (con == 21)
{
    hookedobj.x = x + xoffset;
    hookedobj.y = y + yoffset;
    if (x == xstart && y == ystart)
    {
        var grabbedobject = hookedobj;
        with (hookdaddy)
        {
            grabbed = grabbedobject;
            grab = 1;
            grabmarker = instance_create(x, y, obj_board_grabobject);
            with (grabmarker)
            {
                snd_play(snd_board_lift);
                grabdaddy = other.id;
                grabbedid = other.grabbed;
                sprite_index = grabbedid.sprite_index;
                image_xscale = grabbedid.image_xscale;
                image_yscale = grabbedid.image_yscale;
                image_speed = grabbedid.image_speed;
                sourcex = grabbedid.x;
                sourcey = grabbedid.y;
            }
            with (grabbed)
            {
                visible = false;
                frozen = true;
                setxy(board_tilex(-1), board_tiley(-1));
                if (object_index == obj_mainchara_board)
                    canfreemove = 0;
            }
        }
        instance_destroy();
    }
}

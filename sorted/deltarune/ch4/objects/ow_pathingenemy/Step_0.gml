scr_depth();
if (init == 0)
{
    if (r_movetype != -1)
        movetype = r_movetype;
    if (r_dir != -1)
        dir = r_dir;
    if (r_waittime != -1)
        waittime = r_waittime;
    if (r_waittimer != -1)
        waittimer = r_waittimer;
    if (r_movetime != -1)
        movetime = r_movetime;
    if (r_movetimer != -1)
        movetimer = r_movetimer;
    if (r_influenceable != -1)
        influenceable = r_influenceable;
    if (r_homedistance != -1)
        homedistance = r_homedistance;
    if (r_movevistype != -1)
        movevistype = r_movevistype;
    if (r_prefdir != "none")
        prefdir = r_prefdir;
    init = 1;
}
event_inherited();
var _blocked = 0;
if (global.interact != 0)
    _blocked = 1;
if (!_blocked)
{
    if (neutralcon == 0)
    {
        waittimer++;
        if (waittimer >= waittime)
        {
            waittimer = 0;
            movetimer = 0;
            if (updmove != -1)
            {
                movetime = updmove;
                updmove = -1;
            }
            if (updwait != -1)
            {
                waittime = updwait;
                updwait = -1;
            }
            var domove = false;
            var normalpath = false;
            var seek = false;
            var kris = instance_find(obj_mainchara, 0);
            if (movetype == 0)
                normalpath = true;
            if (movetype == 1)
            {
                if (i_ex(kris))
                {
                    if (distance_to_point(kris.x, kris.y) <= homedistance)
                        seek = true;
                }
                if (seek == false)
                    normalpath = true;
            }
            if (movetype == 2)
            {
                seek = true;
                if (!i_ex(kris))
                    seek = false;
            }
            if (movetype == 3)
            {
                domove = true;
                if (place_meeting(x, y, obj_solidenemy_2))
                    doom = true;
            }
            if (influenceable)
            {
                var turn = instance_place(x, y, obj_climb_pathturner);
                if (i_ex(turn) && random_range(0, 1) <= turn.chance)
                {
                    with (turn)
                    {
                        visible = true;
                        scr_delay_var("visible", false, 5);
                    }
                    seek = false;
                    normalpath = false;
                    dir = turn.image_index;
                    domove = true;
                }
            }
            if (seek)
            {
                normalpath = false;
                var krisdir = point_direction(x + 20, y + 20, kris.x, kris.y);
                var card = round(krisdir / 90) + 1;
                if (card > 3)
                    card = 0;
                good[0] = true;
                good[1] = true;
                good[2] = true;
                good[3] = true;
                if (failmovecount < failmovethresh)
                {
                    if (lastdir == 0)
                        good[2] = false;
                    if (lastdir == 2)
                        good[0] = false;
                    if (lastdir == 1)
                        good[3] = false;
                    if (lastdir == 3)
                        good[1] = false;
                }
                for (i = 0; i < 4; i++)
                {
                    var px = 0;
                    var py = 0;
                    var potcard = card + i;
                    if (potcard > 3)
                        potcard = 0;
                    if (potcard == 0)
                        py = 40;
                    if (potcard == 1)
                        px = 40;
                    if (potcard == 2)
                        py = -40;
                    if (potcard == 3)
                        px = -40;
                    if (good[potcard])
                    {
                        if (place_meeting(x + px, y + py, obj_solidblock))
                            good[potcard] = false;
                        if (place_meeting(x + px, y + py, obj_solidenemy))
                            good[potcard] = false;
                    }
                }
                var i = 0;
                while (i < 4)
                    i++;
                if (good[card])
                {
                    dir = card;
                    domove = true;
                }
                if (!domove)
                {
                    var turnleft = scr_wrap(card - 1, 0, 3);
                    var turnright = scr_wrap(card + 1, 0, 3);
                    switch (card)
                    {
                        case 0:
                            turnleft = 3;
                            turnright = 1;
                            break;
                        case 1:
                            turnleft = 2;
                            turnright = 0;
                            break;
                        case 2:
                            turnleft = 3;
                            turnright = 1;
                            break;
                        case 3:
                            turnleft = 0;
                            turnright = 2;
                            break;
                    }
                    var px = 0;
                    var py = 0;
                    if (good[turnleft] && !good[turnright])
                    {
                        dir = turnleft;
                        domove = true;
                    }
                    if (good[turnright] && !good[turnleft])
                    {
                        dir = turnright;
                        domove = true;
                    }
                    if (good[turnleft] && good[turnright])
                    {
                        var leftdist = 0;
                        var rightdist = 0;
                        var potcard = turnleft;
                        if (potcard == 0)
                            py = 40;
                        if (potcard == 1)
                            px = 40;
                        if (potcard == 2)
                            py = -40;
                        if (potcard == 3)
                            px = -40;
                        leftdist = point_distance(x + 20 + px, y + 20 + py, kris.x, kris.y);
                        potcard = turnright;
                        if (potcard == 0)
                            py = 40;
                        if (potcard == 1)
                            px = 40;
                        if (potcard == 2)
                            py = -40;
                        if (potcard == 3)
                            px = -40;
                        rightdist = point_distance(x + 20 + px, y + 20 + py, kris.x, kris.y);
                        if (leftdist > rightdist)
                        {
                            dir = turnright;
                            domove = true;
                        }
                        else
                        {
                            dir = turnleft;
                            domove = true;
                        }
                    }
                }
                if (!domove)
                    failmovecount++;
            }
            if (normalpath)
            {
                for (var i = 0; i < 4; i++)
                {
                    if (domove)
                        continue;
                    var px = 0;
                    var py = 0;
                    if (dir == 0)
                        py = 40;
                    if (dir == 1)
                        px = 40;
                    if (dir == 2)
                        py = -40;
                    if (dir == 3)
                        px = -40;
                    if (!place_meeting(x + px, y + py, obj_solidblock) && !place_meeting(x + px, y + py, obj_solidenemy))
                        domove = true;
                    if (!domove)
                    {
                        if (prefdir == "left")
                            dir++;
                        if (prefdir == "right")
                            dir--;
                        if (dir > 3)
                            dir = 0;
                        if (dir < 0)
                            dir = 3;
                    }
                }
            }
            if (domove)
            {
                neutralcon = 1;
                safex = x;
                safey = y;
            }
        }
    }
    if (neutralcon == 1)
    {
        var px = 0;
        var py = 0;
        if (dir == 0)
            py = 40;
        if (dir == 1)
            px = 40;
        if (dir == 2)
            py = -40;
        if (dir == 3)
            px = -40;
        movetimer++;
        var prog = clamp(movetimer, 0, movetime) / movetime;
        var pointAx = safex;
        var pointBx = safex + px;
        var pointAy = safey;
        var pointBy = safey + py;
        if (movevistype == 0)
        {
            x = lerp(pointAx, pointBx, prog);
            y = lerp(pointAy, pointBy, prog);
        }
        if (movevistype == 1)
        {
            x = lerp_ease_inout(pointAx, pointBx, prog, 2);
            y = lerp_ease_inout(pointAy, pointBy, prog, 2);
        }
        var amblocked = false;
        if (place_meeting(pointBx, pointBy, obj_solidblock) || place_meeting(pointBx, pointBy, obj_solidenemy))
            amblocked = true;
        if (movetype == 3)
            amblocked = false;
        if (amblocked)
        {
            x = safex;
            y = safey;
            waittimer = 0;
            movetimer = 0;
            neutralcon = 0;
            lastdir = dir;
            failmovecount++;
        }
        if (movetimer >= movetime)
        {
            failmovecount = 0;
            lastdir = dir;
            x = safex + px;
            y = safey + py;
            waittimer = 0;
            movetimer = 0;
            neutralcon = 0;
            if (updmove != -1)
            {
                movetime = updmove;
                updmove = -1;
            }
            if (updwait != -1)
            {
                waittime = updwait;
                updwait = -1;
            }
        }
    }
}
if (x > xprevious)
    idir = 1;
if (x < xprevious)
    idir = 3;
if (y > yprevious)
    idir = 0;
if (y < yprevious)
    idir = 2;
if (doom == true)
{
    image_alpha = lerp(image_alpha, -0.1, 0.16666666666666666);
    if (image_alpha <= 0)
        instance_destroy();
}
else
{
    image_alpha = lerp(image_alpha, 1, 0.16666666666666666);
}

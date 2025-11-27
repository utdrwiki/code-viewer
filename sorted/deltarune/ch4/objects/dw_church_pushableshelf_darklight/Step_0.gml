beginx = x;
beginy = y;
if (init == 0)
{
    upstairs[0] = instance_create(x + 0, y + 0, obj_solid_temp);
    upstairs[1] = instance_create(x + 40, y + 0, obj_solid_temp);
    upstairs[2] = instance_create(x + 80, y + 0, obj_solid_temp);
    upstairs[3] = instance_create(x + 0, y + 40, obj_solid_temp);
    upstairs[4] = instance_create(x + 40, y + 40, obj_solid_temp);
    upstairs[5] = instance_create(x + 80, y + 40, obj_solid_temp);
    upstairs[6] = instance_create(x + 0, y + 80, obj_solid_temp);
    upstairs[7] = instance_create(x + 40, y + 80, obj_solid_temp);
    upstairs[8] = instance_create(x + 80, y + 80, obj_solid_temp);
    for (var i = 0; i < array_length(upstairs); i++)
    {
        upstairs[i].extflag = "FLOOR2";
        upstairs[i].active = false;
    }
    if (config == 0)
    {
        upstairs[8].extflag = "inactive";
        upstairs[0].extflag = "inactive";
        upstairs[3].extflag = "inactive";
        upstairs[6].extflag = "inactive";
    }
    if (config == 1)
    {
        upstairs[0].extflag = "inactive";
        upstairs[3].extflag = "inactive";
        upstairs[1].extflag = "inactive";
        upstairs[4].extflag = "inactive";
        upstairs[7].extflag = "inactive";
    }
    if (config == 2)
    {
        upstairs[2].extflag = "inactive";
        upstairs[5].extflag = "inactive";
        upstairs[4].extflag = "inactive";
        upstairs[3].extflag = "inactive";
    }
    if (image_index == 0)
    {
    }
    if (image_index == 1)
    {
        ladder = instance_create(x + 40, (y + 120) - 4, obj_climbingarea);
        ladder.image_xscale = 1;
        ladder.image_yscale = 2;
        climbpoint = instance_create(x + 40, y + 120 + 2, obj_heightfloor_changer);
        myblock[0].image_xscale = 1;
        myblock[1] = instance_create(x + 80, y + 80, obj_solidblockDark);
        myblock[1].image_yscale = 3;
        myblock[2] = instance_create(x + 40, y + 80, obj_solidblockDark);
    }
    init = 1;
}
if (con == 1)
{
    if (mydir == 3)
    {
        for (var j = 1; j < maxDistance; j++)
        {
            for (var i = 0; i < array_length(myblock); i++)
            {
                myblock[i].x -= 40 * j;
                with (myblock[i])
                {
                    if (place_meeting(x, y, obj_solidblock) || place_meeting(x, y, obj_solidenemy))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
                        if (foundblock == -4)
                            foundblock = instance_place(x, y, obj_solidenemy);
                        for (var b = 0; b < array_length(other.myblock); b++)
                        {
                            if (foundblock == other.myblock[b])
                                ignoreblock = 1;
                        }
                        if (ignoreblock == 0)
                        {
                            if (other.moveamount == 0 || j < other.moveamount)
                                other.moveamount = j;
                        }
                    }
                }
                myblock[i].x += 40 * j;
            }
        }
    }
    if (mydir == 1)
    {
        for (var j = 1; j < maxDistance; j++)
        {
            for (var i = 0; i < array_length(myblock); i++)
            {
                myblock[i].x += 40 * j;
                with (myblock[i])
                {
                    if (place_meeting(x, y, obj_solidblock) || place_meeting(x, y, obj_solidenemy))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
                        if (foundblock == -4)
                            foundblock = instance_place(x, y, obj_solidenemy);
                        for (var b = 0; b < array_length(other.myblock); b++)
                        {
                            if (foundblock == other.myblock[b])
                                ignoreblock = 1;
                        }
                        if (ignoreblock == 0)
                        {
                            if (other.moveamount == 0 || j < other.moveamount)
                                other.moveamount = j;
                        }
                    }
                }
                myblock[i].x -= 40 * j;
            }
        }
    }
    if (mydir == 0)
    {
        for (var j = 1; j < maxDistance; j++)
        {
            for (var i = 0; i < array_length(myblock); i++)
            {
                myblock[i].y += 40 * j;
                with (myblock[i])
                {
                    if (place_meeting(x, y, obj_solidblock) || place_meeting(x, y, obj_solidenemy))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
                        if (foundblock == -4)
                            foundblock = instance_place(x, y, obj_solidenemy);
                        for (var b = 0; b < array_length(other.myblock); b++)
                        {
                            if (foundblock == other.myblock[b])
                                ignoreblock = 1;
                        }
                        if (ignoreblock == 0)
                        {
                            if (other.moveamount == 0 || j < other.moveamount)
                                other.moveamount = j;
                        }
                    }
                }
                myblock[i].y -= 40 * j;
            }
        }
    }
    if (mydir == 2)
    {
        for (var j = 1; j < maxDistance; j++)
        {
            for (var i = 0; i < array_length(myblock); i++)
            {
                myblock[i].y -= 40 * j;
                with (myblock[i])
                {
                    if (place_meeting(x, y, obj_solidblock) || place_meeting(x, y, obj_solidenemy))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
                        if (foundblock == -4)
                            foundblock = instance_place(x, y, obj_solidenemy);
                        for (var b = 0; b < array_length(other.myblock); b++)
                        {
                            if (foundblock == other.myblock[b])
                                ignoreblock = 1;
                        }
                        if (ignoreblock == 0)
                        {
                            if (other.moveamount == 0 || j < other.moveamount)
                                other.moveamount = j;
                        }
                    }
                }
                myblock[i].y += 40 * j;
            }
        }
    }
    con = 2;
}
if (con == 2)
{
    debug_message(moveamount);
    if (moveamount == 0)
    {
    }
    else
    {
        if (movetype == 1 && moveamount > 2)
            moveamount = 2;
        snd_play(snd_wing);
        timeend = moveamount * 3;
        if (mydir == 3)
            scr_lerpvar("x", x, x - (40 * (moveamount - 1)), timeend, 3, "in");
        if (mydir == 1)
            scr_lerpvar("x", x, x + (40 * (moveamount - 1)), timeend, 3, "in");
        if (mydir == 0)
            scr_lerpvar("y", y, y + (40 * (moveamount - 1)), timeend, 3, "in");
        if (mydir == 2)
            scr_lerpvar("y", y, y - (40 * (moveamount - 1)), timeend, 3, "in");
    }
    con = 3;
}
if (con == 3)
{
    timer++;
    if ((timer % 3) == 0 && timer < timeend)
        snd_play_pitch(snd_wing, 0.2 + ((timer / timeend) * 0.8));
    if (timer == timeend || moveamount == 0)
    {
        snd_play(snd_impact);
        global.interact = 0;
        timeend = 30;
        moveamount = 0;
        con = 0;
    }
}
var updatedepth = true;
if (i_ex(obj_dw_church_bookshelfpuzzle))
{
    if (obj_dw_church_bookshelfpuzzle.flooractive == 2)
    {
        updatedepth = false;
        scr_depth();
        depth += 10000;
    }
}
if (updatedepth)
    scr_depth();

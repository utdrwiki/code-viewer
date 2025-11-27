beginx = x;
beginy = y;
if (init == 0)
{
    if (image_index == 0)
    {
        myblock[0] = instance_create(x, y + 160, obj_solidblockDark);
        myblock[1] = instance_create(x, y + 120, obj_solidblockDark);
        myblock[1].image_xscale = 3;
        myblock[2] = instance_create(x + 80, y + 80, obj_solidblockDark);
        marker[0] = scr_marker(x, y + 40, spr_dw_church_pushableshelf_nshelf_pt1);
        marker[1] = scr_marker(x + 40, y, spr_dw_church_pushableshelf_nshelf_pt2);
        scr_darksize(marker[0]);
        scr_darksize(marker[1]);
        upstairs[0] = instance_create(x + 80, y + 0, obj_heightfloor);
        upstairs[1] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[1].image_xscale = 3;
        upstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
    }
    if (image_index == 1)
    {
        myblock[0] = instance_create(x, y + 80, obj_solidblockDark);
        myblock[0].image_xscale = 3;
        myblock[0].image_yscale = 3;
        upstairs[0] = instance_create(x, y, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[1] = instance_create(x + 80, y + 40, obj_heightfloor);
        upstairs[2] = instance_create(x, y + 80, obj_heightfloor);
        upstairs[2].image_xscale = 3;
    }
    if (image_index == 2)
    {
        marker[0] = scr_marker(x, y, spr_dw_church_pushableshelf_tshelf_pt1);
        marker[1] = scr_marker(x + 40, y + 40, spr_dw_church_pushableshelf_tshelf_pt2);
        scr_darksize(marker[0]);
        scr_darksize(marker[1]);
        myblock[0] = instance_create(x, y + 80, obj_solidblockDark);
        myblock[0].image_yscale = 3;
        myblock[1] = instance_create(x + 40, y + 120, obj_solidblockDark);
        myblock[1].image_yscale = 1;
        upstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        upstairs[0].image_yscale = 3;
        upstairs[1] = instance_create(x + 40, y + 40, obj_heightfloor);
    }
    if (image_index == 3)
    {
        myblock[0] = instance_create(x, y + 80, obj_solidblockDark);
        myblock[0].image_xscale = 3;
        myblock[0].image_yscale = 1;
        sprite_index = spr_movingBookshelf;
        image_index = 0;
        upstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        upstairs[0].image_xscale = 3;
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
                    if (place_meeting(x, y, obj_solidblock))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
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
                    if (place_meeting(x, y, obj_solidblock))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
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
                    if (place_meeting(x, y, obj_solidblock))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
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
                    if (place_meeting(x, y, obj_solidblock))
                    {
                        var ignoreblock = 0;
                        var foundblock = instance_place(x, y, obj_solidblock);
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
scr_depth();

beginx = x;
beginy = y;
if (init == 0)
{
    if (room == room_overworld_darkmaku_blocks)
        movetype = 0;
    if (image_index == 0)
    {
        upstairs[0] = instance_create(x + 40, y + 0, obj_heightfloor);
        upstairs[1] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[1].image_xscale = 3;
        upstairs[2] = instance_create(x + 40, y + 80, obj_heightfloor);
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[1] = instance_create(x + 80, y + 0, obj_heightfloor);
        altupstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
        altupstairs[3] = instance_create(x + 80, y + 80, obj_heightfloor);
    }
    if (image_index == 1)
    {
        upstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[1] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
        upstairs[2].image_xscale = 3;
        altupstairs[0] = instance_create(x + 40, y + 40, obj_heightfloor);
        altupstairs[0].image_xscale = 2;
    }
    if (image_index == 2)
    {
        upstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[1] = instance_create(x + 80, y + 40, obj_heightfloor);
        upstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
        upstairs[2].image_xscale = 3;
        altupstairs[0] = instance_create(x + 0, y + 40, obj_heightfloor);
        altupstairs[0].image_xscale = 2;
    }
    if (image_index == 3)
    {
        upstairs[0] = instance_create(x + 80, y + 0, obj_heightfloor);
        upstairs[1] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[1].image_xscale = 3;
        upstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[0].image_xscale = 2;
        altupstairs[1] = instance_create(x + 40, y + 80, obj_heightfloor);
        altupstairs[1].image_xscale = 2;
    }
    if (image_index == 4)
    {
        upstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        upstairs[1] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[1].image_xscale = 3;
        upstairs[2] = instance_create(x + 80, y + 80, obj_heightfloor);
        altupstairs[0] = instance_create(x + 40, y + 0, obj_heightfloor);
        altupstairs[0].image_xscale = 2;
        altupstairs[1] = instance_create(x + 0, y + 80, obj_heightfloor);
        altupstairs[1].image_xscale = 2;
    }
    if (image_index == 5)
    {
        upstairs[0] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[0].image_xscale = 3;
        altupstairs[1] = instance_create(x + 0, y + 80, obj_heightfloor);
        altupstairs[1].image_xscale = 3;
    }
    if (image_index == 6)
    {
        upstairs[0] = instance_create(x + 40, y + 0, obj_heightfloor);
        upstairs[0].image_yscale = 3;
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[0].image_yscale = 3;
        altupstairs[1] = instance_create(x + 80, y + 0, obj_heightfloor);
        altupstairs[1].image_yscale = 3;
    }
    if (image_index == 7)
    {
        upstairs[0] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[1] = instance_create(x + 40, y + 80, obj_heightfloor);
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[0].image_xscale = 3;
        altupstairs[1] = instance_create(x + 80, y + 80, obj_heightfloor);
        altupstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
    }
    if (image_index == 8)
    {
        upstairs[0] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[1] = instance_create(x + 40, y + 80, obj_heightfloor);
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[0].image_xscale = 3;
        altupstairs[1] = instance_create(x + 80, y + 80, obj_heightfloor);
        altupstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
        ladder = instance_create(x + 40, (y + 120) - 4, obj_climbingarea);
        ladder.image_xscale = 1;
        ladder.image_yscale = 2;
        climbpoint = instance_create(x + 40, y + 120 + 2, obj_heightfloor_changer);
        myblock[0].image_xscale = 1;
        myblock[1] = instance_create(x + 80, y + 80, obj_solidblockDark);
        myblock[1].image_yscale = 3;
        myblock[2] = instance_create(x + 40, y + 80, obj_solidblockDark);
    }
    if (image_index == 9)
    {
        upstairs[0] = instance_create(x + 0, y + 40, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[1] = instance_create(x + 40, y + 80, obj_heightfloor);
        upstairs[2] = instance_create(x + 40, y + 0, obj_heightfloor);
        altupstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        altupstairs[1] = instance_create(x + 80, y + 80, obj_heightfloor);
        altupstairs[2] = instance_create(x + 0, y + 80, obj_heightfloor);
        altupstairs[3] = instance_create(x + 80, y + 0, obj_heightfloor);
        ladder = instance_create(x + 40, (y + 120) - 4, obj_climbingarea);
        ladder.image_xscale = 1;
        ladder.image_yscale = 2;
        climbpoint = instance_create(x + 40, y + 120 + 2, obj_heightfloor_changer);
        myblock[0].image_xscale = 1;
        myblock[1] = instance_create(x + 80, y + 80, obj_solidblockDark);
        myblock[1].image_yscale = 3;
        myblock[2] = instance_create(x + 40, y + 80, obj_solidblockDark);
    }
    if (image_index == 10)
    {
        upstairs[0] = instance_create(x + 0, y + 0, obj_heightfloor);
        upstairs[0].image_xscale = 3;
        upstairs[0].image_yscale = 2;
        upstairs[1] = instance_create(x + 40, y + 80, obj_heightfloor);
        altupstairs[0] = instance_create(x + 80, y + 80, obj_heightfloor);
        altupstairs[1] = instance_create(x + 0, y + 80, obj_heightfloor);
        ladder = instance_create(x + 40, (y + 120) - 4, obj_climbingarea);
        ladder.image_xscale = 1;
        ladder.image_yscale = 2;
        climbpoint = instance_create(x + 40, y + 120 + 2, obj_heightfloor_changer);
        myblock[0].image_xscale = 1;
        myblock[1] = instance_create(x + 80, y + 80, obj_solidblockDark);
        myblock[1].image_yscale = 3;
        myblock[2] = instance_create(x + 40, y + 80, obj_solidblockDark);
    }
    for (var i = 0; i < array_length(altupstairs); i++)
    {
        altupstairs[i].floorheight = 2;
        altupstairs[i].image_blend = c_orange;
    }
    init = 1;
}
if (con == 1)
{
    moveamount = 0;
    var _sx = 0;
    var _sy = 0;
    if (mydir == 3)
        _sx = -40;
    else if (mydir == 1)
        _sx = 40;
    else if (mydir == 2)
        _sy = -40;
    else
        _sy = 40;
    for (var j = 1; j < maxDistance; j++)
    {
        for (var i = 0; i < array_length(myblock); i++)
        {
            myblock[i].x += _sx * j;
            myblock[i].y += _sy * j;
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
            myblock[i].x -= _sx * j;
            myblock[i].y -= _sy * j;
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
scr_depth();

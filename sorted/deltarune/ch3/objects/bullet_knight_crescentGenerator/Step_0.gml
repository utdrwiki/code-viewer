if (init == 0)
{
    if (type == 0)
    {
        movementmode = 0;
        shootrate = 30;
        moverate = shootrate - 5;
        posrange = 2;
        yposcount = 6;
        neverstaystill = 1;
        myspeed = -1;
        myfrict = -0.5;
    }
    if (type == 1)
    {
        movementmode = 1;
        shootrate = 20;
        moverate = shootrate - 5;
        posrange = 2;
        yposcount = 6;
        myspeed = -1;
        myfrict = -0.5;
    }
    if (type == 2)
    {
        movementmode = 1;
        shootrate = 15;
        moverate = shootrate - 5;
        posrange = 2;
        yposcount = 6;
        neverstaystill = 1;
        myspeed = -1;
        myfrict = -0.35;
        if (obj_knight_enemy.damagereduction == 0.04)
        {
            shootrate = 20;
            myfrict = -0.3;
        }
    }
    if (type == 3)
    {
        diagattack = true;
        diagattackrate = 150;
        movementmode = 1;
        shootrate = 15;
        moverate = shootrate - 5;
        posrange = 2;
        yposcount = 6;
        neverstaystill = 1;
        myspeed = -1;
        myfrict = -0.35;
    }
    if (type == 4)
    {
        movementmode = 1;
        shootrate = 20;
        moverate = shootrate - 5;
        posrange = 1;
        yposcount = 6;
        myspeed = -1;
        myfrict = -0.5;
        neverstaystill = true;
        slowdelaycount = 0;
    }
    if (box == -1)
    {
        with (obj_growtangle)
            other.box = id;
    }
    else
    {
        with (box)
        {
        }
        init = 1;
    }
}
if (init)
{
    if (con == 0)
    {
        timer++;
        if (timer >= 1)
        {
            boxheight = box.sprite_height;
            con = 1;
            timer = 0;
            for (var i = 0; i < yposcount; i++)
                ypos[i] = (box.y - (boxheight / 2)) + ((boxheight / (yposcount + 1)) * (i + 1));
            curpos = round(yposcount / 2) - 1;
        }
    }
    if (con == 1)
    {
        if (global.turntimer > 50)
        {
            shoottimer++;
            timer++;
        }
        else if (global.turntimer < 20)
        {
            instance_destroy();
        }
        if (diagattack == true)
        {
            diagtimer++;
            if (diagtimer == diagattackrate)
            {
                diagtimer = 0;
                con = 10;
                subcon = 0;
                shoottimer = 0;
                movetimer = 0;
                movecon = 0;
            }
        }
        if (shoottimer == (shootrate - 4))
            createslash = 1;
        if (shoottimer >= shootrate)
        {
            bulcount++;
            var bul = instance_create(x, y + 5, obj_bullet_knightcrescent);
            var bul2 = instance_create(x, y - 5, obj_bullet_knightcrescent);
            scr_darksize(bul);
            scr_darksize(bul2);
            bul2.image_yscale = -2;
            if (movementmode == 0)
            {
                var timetosplit = 25;
                with (bul)
                    scr_lerpvar("y", y, y - 14, timetosplit);
                with (bul2)
                    scr_lerpvar("y", y, y + 14, timetosplit);
                bul.hspeed = myspeed;
                bul.friction = myfrict;
                bul2.hspeed = myspeed;
                bul2.friction = myfrict;
                movecon = 1;
            }
            if (movementmode == 1)
            {
                with (bul)
                    scr_lerpvar("y", y, other.ypos[other.curpos] - 12, 30);
                with (bul2)
                    scr_lerpvar("y", y, other.ypos[other.curpos] + 12, 30);
                bul.hspeed = myspeed;
                bul.friction = myfrict;
                bul2.hspeed = myspeed;
                bul2.friction = myfrict;
                if (type == 4 && choose(0, 0, 1) == 1 && slowdelaycount <= 0)
                {
                    slowdelaycount = 2;
                    bul.friction *= 0.25;
                    bul2.friction *= 0.25;
                    bul.hspeed *= 0.5;
                    bul2.hspeed *= 0.5;
                    bul.image_yscale = 1;
                    bul2.image_yscale = -1;
                }
                movecon = 1;
            }
            if (!neverstaystill)
                curpos += irandom_range(-posrange, posrange);
            else
                curpos += (irandom_range(1, posrange) * choose(-1, 1));
            if (curpos >= yposcount)
                curpos -= 2;
            if (curpos < 0)
                curpos = -curpos;
            shoottimer = 0;
            if (slowdelaycount == 1)
            {
                shoottimer = -shootrate / 2;
                slowdelaycount = -1;
            }
            slowdelaycount--;
        }
        if (movecon == 1)
        {
            if (movementmode == 0)
            {
                scr_lerpvar("y", y, ypos[curpos], moverate, 2, "out");
                movecon = 0;
            }
            if (movementmode == 1)
            {
                scr_lerpvar("y", y, ypos[irandom(yposcount - 1)], moverate, 2, "out");
                movecon = 0;
            }
        }
    }
    if (con == 10)
    {
        if (subcon == 0)
        {
            if (yprevious == y)
            {
                diagtimer++;
                if (diagtimer == 3)
                    subcon = 1;
            }
        }
        if (subcon == 1)
        {
            var desy = irandom(yposcount - 2) + 1;
            scr_lerpvar("y", y, ypos[desy], 10, 2, "out");
            subcon = 2;
            diagtimer = 0;
        }
        if (subcon == 2)
        {
            diagtimer++;
            if (diagtimer >= 30)
            {
                subcon = 3;
                diagtimer = 0;
                movedown = -1;
                if (i_ex(box))
                {
                    if (y < box.y)
                        movedown = 1;
                }
                var heartmovespeed = obj_heart.wspeed;
                framecount = 15;
                scr_lerpvar("y", y, y + (framecount * movedown * heartmovespeed), framecount);
                subtimer = 0;
            }
        }
        if (subcon == 3)
        {
            if (diagtimer == 2)
                createslash = 1;
            if (diagtimer <= 0)
            {
                var bul = instance_create(x, y + 5, obj_bullet_knightcrescent);
                var bul2 = instance_create(x, y - 5, obj_bullet_knightcrescent);
                scr_darksize(bul);
                scr_darksize(bul2);
                bul2.image_yscale = -2;
                var timetosplit = 25;
                with (bul)
                    scr_lerpvar("y", y, y - 16, timetosplit);
                with (bul2)
                    scr_lerpvar("y", y, y + 16, timetosplit);
                bul.hspeed = myspeed;
                bul.friction = myfrict;
                bul2.hspeed = myspeed;
                bul2.friction = myfrict;
                diagtimer = 3;
            }
            diagtimer--;
            subtimer++;
            if (i_ex(box))
            {
                if ((movedown == 1 && y > ((box.y + (box.sprite_height / 2)) - 30)) || (movedown == -1 && y < ((box.y - (box.sprite_height / 2)) + 30)))
                    subtimer = framecount + 1;
            }
            if (subtimer >= framecount)
            {
                con = 1;
                diagtimer = 0;
                subcon = 0;
                timer = 0;
                subtimer = 0;
                shoottimer = -10;
                movetimer = 0;
            }
        }
    }
}
if (createslash)
{
    var _slash = instance_create(x + 12, y + 18, obj_knight_crescentslash_slashinganimation);
    _slash.depth = depth - 20 - _slash.y;
    createslash = 0;
}

if (!reqactive)
    active = true;
siner++;
var destroy = false;
if (init == 0)
    init = 1;
if (active)
{
    if (room == room_dw_puzzlecloset_1)
    {
        if (i_ex(obj_board_swordhitbox))
        {
            if (place_meeting(x, y, obj_board_swordhitbox))
            {
                if (type == "marker")
                    dirt = scr_board_marker(x, y, spr_board_holemarker, 0, 999999, 2);
                instance_create(x + 16, y + 16, obj_board_enemydefeatsplash);
                instance_destroy();
            }
        }
    }
    if (con == 1)
    {
        con = -1;
        if (type != "marker")
            snd_play_delay(snd_board_lift, 10);
        scr_delay_var("con", 2, 10);
        if (!infinite)
            visible = false;
        var _su = 0;
        with (obj_mainchara_board)
        {
            if (name == "susie")
                _su = id;
        }
    }
    if (con == 2.1)
    {
        con = 99999;
        if (type == "coin")
        {
            var movetime = 4;
            var waittime = 6;
            coin = instance_create(x, y, obj_board_marker);
            with (coin)
            {
                scr_darksize();
                sprite_index = spr_board_pointsGet;
                scr_lerpvar("y", y, (y - 32) + 4, movetime, 2, "out");
            }
            scr_delay_var("con", 10, movetime + waittime);
            scr_doom(coin, movetime + waittime + 5);
        }
        if (type == "marker")
        {
            var movetime = 4;
            var waittime = 6;
            snd_play(snd_board_splash);
            with (instance_create(x, y, obj_board_smokepuff))
                image_blend = #FFECBD;
            dirt = scr_board_marker(x, y, spr_board_holemarker, 0, 999999, 2);
            scr_delay_var("con", 10, movetime + waittime);
        }
    }
    if (con == 2 && obj_board_camera.con == 0 && obj_board_camera.shift == "none")
    {
        con = -1;
        with (grabdaddy)
            image_index = 1;
        if (!infinite)
            image_alpha = 0;
        if (type == "coin")
        {
            var movetime = 4;
            var waittime = 6;
            var targx = x;
            var targy = y;
            with (grabdaddy)
            {
                targx = x;
                targy = y;
            }
            coin = instance_create(targx, targy, obj_board_marker);
            with (coin)
            {
                scr_darksize();
                sprite_index = spr_board_pointsGet;
                scr_lerpvar("y", y, (y - 32) + 4, movetime, 2, "out");
            }
            trig = movetime + waittime + 4;
            trigtime = 0;
            dofun = 0;
            dograb = 0;
            docanfreemove = 1;
            resetcon = 1;
            scr_delay_var("con", 10, movetime + waittime);
            scr_doom(coin, movetime + waittime + 5);
        }
        if (type == "marker")
        {
            var movetime = 4;
            var waittime = 6;
            snd_play(snd_board_splash);
            with (instance_create(x, y, obj_board_smokepuff))
                image_blend = #FFECBD;
            dirt = scr_board_marker(x, y, spr_board_holemarker, 0, 999999, 2);
            trig = movetime + waittime + 4;
            trigtime = 0;
            dofun = 0;
            dograb = 0;
            docanfreemove = 1;
            resetcon = 1;
            scr_delay_var("con", 10, movetime + waittime);
        }
        if (type == "pot")
        {
            grabdaddy.grabmarker = instance_create(x, y, obj_board_grabobject);
            sprite_index = potsprite;
            with (grabdaddy.grabmarker)
            {
                snd_play(snd_board_lift);
                grabdaddy = other.grabdaddy;
                grabbedid = other.id;
                image_xscale = 2;
                image_yscale = 2;
                image_speed = 0;
                sourcex = other.x;
                sourcey = other.y;
            }
            var postpickupwait = 4;
            with (grabdaddy)
                scr_delay_var("canfreemove", true, postpickupwait);
            with (grabdaddy)
                scr_delay_var("fun", false, postpickupwait);
            con = 20;
        }
        if (type == "bomb" || type == "puzzlebomb")
        {
            grabdaddy.grabmarker = instance_create(x, y, obj_board_grabobject);
            var puzzle = false;
            bomb = instance_create(x, y, obj_board_bomb);
            if (type == "puzzlebomb")
            {
                puzzle = true;
                bomb.throwdist = 1;
                bomb.fatal = false;
                bomb.ignoreplayer = true;
            }
            bomb.visible = false;
            sprite_index = potsprite;
            with (grabdaddy.grabmarker)
            {
                snd_play(snd_board_lift);
                grabdaddy = other.grabdaddy;
                grabbedid = other.bomb;
                if (puzzle == true)
                {
                    type = 2;
                    throwdist = 1;
                    ignoreplayer = 1;
                }
                image_xscale = 2;
                image_yscale = 2;
                image_speed = 0;
                sourcex = other.x;
                sourcey = other.y;
            }
            var postpickupwait = 4;
            with (grabdaddy)
                scr_delay_var("canfreemove", true, postpickupwait);
            with (grabdaddy)
                scr_delay_var("fun", false, postpickupwait);
            con = 30;
        }
    }
    if (con == 10)
    {
        if (i_ex(coin))
        {
            var puff = instance_create(coin.x, coin.y, obj_board_smokepuff);
            puff.depth = coin.depth + 1;
            var pointsDisplay = instance_create(coin.x + 16, coin.y + 16, obj_board_pointsGetDisplay);
            pointsDisplay.amount = value;
            pointsDisplay.depth = coin.depth - 1;
            safe_delete(coin);
            destroy = true;
        }
        else
        {
            destroy = true;
        }
    }
    if (con == 20 && !i_ex(obj_board_grabobject))
    {
        instance_create(x, y, obj_board_breakpoof);
        destroy = true;
    }
    if (con == 30)
    {
        if (obj_board_camera.con != 0)
        {
            safe_delete(bomb);
            destroy = true;
        }
        if (!i_ex(obj_board_grabobject))
            destroy = true;
    }
    if (destroy == true)
    {
        if (infinite)
        {
            var newGrass = instance_create(x, y, object_index);
            newGrass.type = type;
            newGrass.value = value;
            newGrass.potsprite = potsprite;
            newGrass.puzzleid = puzzleid;
            newGrass.infinite = infinite;
        }
        else
        {
            x = room_width * 2;
            con = 31;
        }
    }
}
else if (room != room_dw_puzzlecloset_1)
{
    instance_destroy();
}
if (resetcon == 1)
{
    if (obj_board_camera.con != 0 || obj_board_camera.shift != "none" || !instance_exists(grabdaddy))
    {
        resetcon = -1;
        exit;
    }
    if (global.interact == 0 && !d_ex() && !bw_ex())
        trigtime++;
    if (trigtime >= trig)
    {
        if (dofun != -1)
            grabdaddy.fun = dofun;
        if (dograb != -1)
            grabdaddy.grab = dograb;
        if (docanfreemove != -1)
            grabdaddy.canfreemove = docanfreemove;
        dofun = -1;
        dograb = -1;
        docanfreemove = -1;
        resetcon = 0;
    }
}

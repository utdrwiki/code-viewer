siner++;
if (init == 0)
{
    init = 1;
    block[0] = instance_create(x + 0, y + 0, obj_solid_temp_edge);
    block[1] = instance_create(x + 40, y + 0, obj_solid_temp_edge);
    block[2] = instance_create(x + 0, y + 40, obj_solid_temp_edge);
    block[3] = instance_create(x + 40, y + 40, obj_solid_temp_edge);
    for (var i = 0; i < array_length(block); i++)
    {
        block[i].extflag = "FLOOR2";
        block[i].negasoliddisable = true;
    }
    edge[0] = instance_create(x - 40, y + 0, obj_solid_temp_edge);
    array_push(edge, instance_create(x - 40, y + 40, obj_solid_temp_edge));
    array_push(edge, instance_create(x + 0, y + 80, obj_solid_temp_edge));
    array_push(edge, instance_create(x + 40, y + 80, obj_solid_temp_edge));
    array_push(edge, instance_create(x + 0, y - 40, obj_solid_temp_edge));
    array_push(edge, instance_create(x + 40, y - 40, obj_solid_temp_edge));
    array_push(edge, instance_create(x + 80, y + 0, obj_solid_temp_edge));
    array_push(edge, instance_create(x + 80, y + 40, obj_solid_temp_edge));
    for (var i = 0; i < array_length(edge); i++)
    {
        edge[i].extflag = "FLOOR2";
        edge[i].edge = true;
    }
    if (xflag != -4)
    {
        if (global.flag[xflag] == 0)
            global.flag[xflag] = x;
        else
            x = global.flag[xflag];
        if (global.flag[yflag] == 0)
            global.flag[yflag] = y;
        else
            y = global.flag[yflag];
    }
}
if (con == 0)
{
    var move = false;
    if (scr_debug())
    {
    }
    if (move)
    {
        debug_print("move");
        con = 1;
        timer = 0;
    }
    if (resetpos)
    {
        resetpos = 0;
        var doreset = true;
        if (x == xstart && y == ystart)
            doreset = false;
        if (place_meeting(xstart, ystart, object_index))
            doreset = false;
        if (doreset)
        {
            con = 40;
            snd_play(snd_bell, 0.5);
            var movespd = 16;
            var dist = round(point_distance(x, y, xstart, ystart) / movespd) + 1;
            if (x != xstart)
                scr_lerpvar("x", x, xstart, dist, -1, "out");
            if (y != ystart)
                scr_lerpvar("y", y, ystart, dist, -1, "out");
            scr_delay_var("con", 0, dist + 1);
            scr_delay_var("flagupdate", 1, dist + 1);
        }
        else
        {
            con = 0;
        }
    }
}
if (con == 1)
{
    var checkdir = dir;
    with (base)
    {
        var px = 0;
        var py = 0;
        switch (checkdir)
        {
            case 0:
                py = 1;
                break;
            case 1:
                px = 1;
                break;
            case 2:
                py = -1;
                break;
            case 3:
                px = -1;
                break;
        }
        var met = -4;
        for (var i = 0; i < 8000; i++)
        {
            if (met == -4)
            {
                var solidenemyspot = instance_place(x + (px * i), y + (py * i), obj_solidenemy);
                if (i_ex(solidenemyspot))
                {
                    with (solidenemyspot)
                        scr_afterimage();
                    met = i - 1;
                }
            }
            if (met == -4)
            {
                var _list = ds_list_create();
                var _num = instance_place_list(x + (px * i), y + (py * i), 1031, _list, false);
                if (_num > 0)
                {
                    for (var j = 0; j < _num; j++)
                    {
                        if (ds_list_find_value(_list, j) != mysolid)
                            met = i - 1;
                    }
                }
                ds_list_destroy(_list);
            }
        }
        if (met > 0)
        {
            var movetime = round(met / 16) + 1;
            if (checkdir == 1 || checkdir == 3)
            {
                with (other)
                    scr_lerpvar("x", x, x + (px * met), movetime);
            }
            if (checkdir == 0 || checkdir == 2)
            {
                with (other)
                    scr_lerpvar("y", y, y + (py * met), movetime);
            }
            other.con = -1;
            snd_play_delay(snd_wing, movetime, 0.7, 0.8);
            with (other)
                scr_delay_var("con", 0, movetime + 1);
            with (other)
                scr_delay_var("flagupdate", 1, movetime + 1);
        }
        else
        {
            other.con = 0;
        }
    }
}
if (flagupdate)
{
    flagupdate = 0;
    if (xflag != -4)
    {
        global.flag[xflag] = x;
        global.flag[yflag] = y;
    }
}

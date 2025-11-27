if (init == 0)
{
    init = 1;
    if (config == 0)
    {
        block[0] = instance_create(x + 0, y + 0, obj_solid_temp);
        block[1] = instance_create(x + 40, y + 0, obj_negasolid);
        block[2] = instance_create(x + 80, y + 0, obj_solid_temp);
        block[3] = instance_create(x + 0, y + 40, obj_negasolid);
        block[4] = instance_create(x + 40, y + 40, obj_negasolid);
        block[5] = instance_create(x + 80, y + 40, obj_negasolid);
        block[6] = instance_create(x + 0, y + 80, obj_solid_temp);
        block[7] = instance_create(x + 40, y + 80, obj_negasolid);
        block[8] = instance_create(x + 80, y + 80, obj_solid_temp);
    }
    if (config == 1)
    {
        block[0] = instance_create(x + 0, y + 0, obj_solid_temp);
        block[1] = instance_create(x + 40, y + 0, obj_negasolid);
        block[2] = instance_create(x + 80, y + 0, obj_solid_temp);
        block[3] = instance_create(x + 0, y + 40, obj_solid_temp);
        block[4] = instance_create(x + 40, y + 40, obj_negasolid);
        block[5] = instance_create(x + 80, y + 40, obj_solid_temp);
        block[6] = instance_create(x + 0, y + 80, obj_negasolid);
        block[7] = instance_create(x + 40, y + 80, obj_negasolid);
        block[8] = instance_create(x + 80, y + 80, obj_solid_temp);
    }
    for (var i = 0; i < array_length(block); i++)
    {
        block[i].extflag = "FLOOR2";
        block[i].negasoliddisable = true;
    }
    edge[0] = instance_create(x - 40, y + 0, obj_solid_temp);
    edge[1] = instance_create(x - 40, y + 40, obj_solid_temp);
    edge[2] = instance_create(x - 40, y + 80, obj_solid_temp);
    edge[3] = instance_create(x + 120, y + 0, obj_solid_temp);
    edge[4] = instance_create(x + 120, y + 40, obj_solid_temp);
    edge[5] = instance_create(x + 120, y + 80, obj_solid_temp);
    edge[6] = instance_create(x + 0, y - 40, obj_solid_temp);
    edge[7] = instance_create(x + 40, y - 40, obj_solid_temp);
    edge[8] = instance_create(x + 80, y - 40, obj_solid_temp);
    edge[9] = instance_create(x + 0, y + 120, obj_solid_temp);
    edge[10] = instance_create(x + 40, y + 120, obj_solid_temp);
    edge[11] = instance_create(x + 80, y + 120, obj_solid_temp);
    for (var i = 0; i < array_length(edge); i++)
        edge[i].extflag = "FLOOR2";
}
scr_depth();
if (block[0].active)
    depth += 10000;
if (con == 0)
{
    var move = false;
    if (keyboard_check(vk_numpad4))
    {
        dir = 3;
        move = true;
    }
    if (keyboard_check(vk_numpad5))
    {
        dir = 0;
        move = true;
    }
    if (keyboard_check(vk_numpad6))
    {
        dir = 1;
        move = true;
    }
    if (keyboard_check(vk_numpad8))
    {
        dir = 2;
        move = true;
    }
    if (move)
    {
        con = 1;
        timer = 0;
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
                if (i_ex(instance_place(x + (px * i), y + (py * i), obj_solidenemy)))
                    met = i - 1;
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
            snd_play(snd_noise);
            snd_play_delay(snd_impact, movetime);
            with (other)
                scr_delay_var("con", 0, movetime + 1);
        }
        else
        {
            snd_play(snd_error, undefined, 1.8);
            other.con = 0;
        }
    }
}

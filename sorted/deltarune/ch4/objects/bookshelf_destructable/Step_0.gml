if (!init)
{
    var flagset;
    if (flagno != -1)
    {
        flagset = global.flag[flagno] == 1;
        if (flagbit > 0)
            flagset = global.flag[flagno] & (1 << (flagbit - 1));
        debug_print(string(flagset));
        if (extflag == "treasure" && flagset)
        {
            var pos = scr_heromarker(undefined, "treasureloc");
            with (instance_create(pos[0], pos[1], obj_treasure_room))
            {
                itemtype = "item";
                itemidchest = 2;
                itemflag = 1540;
            }
        }
    }
    if (flagno != -1 && flagset)
    {
        var thisID = floor((x / 80) + (y / 80));
        with (instance_create(x, y + 80, obj_marker))
        {
            sprite_index = spr_bookshelf_debris;
            image_index = thisID % 5;
            image_speed = 0;
            depth = 999999;
        }
        if (special == 2)
        {
            with (obj_floorTrigger)
                instance_destroy();
            with (obj_solid_temp)
            {
                if (extflag == "FLOOR1TEMP")
                    active = 1;
                else
                    active = 0;
            }
            with (obj_bookshelf_destructable)
            {
                if (special == 1)
                {
                    special = 0;
                    with (mysolid)
                        instance_destroy();
                    mysolid = instance_create(x, y + 80, obj_solidblocksized);
                    mysolid.extflag = "breakable";
                    scr_size(2, 2, mysolid);
                }
            }
            with (obj_dw_churchb_library)
            {
                flooractive = 3;
                npc2.y = npc2.y + 1000;
            }
        }
        with (mysolid)
            instance_destroy();
        instance_destroy();
        exit;
    }
    init = 1;
}
if (con == 0)
{
    var tx = x + 20;
    var ty = y + 80 + 20;
    var wid = 40;
    var hei = 40;
    if (i_ex(collision_rectangle(tx, ty, tx + wid, ty + hei, obj_dw_church_remotepianomove, 0, 0)))
    {
        if (obj_dw_church_remotepianomove.con != 4)
        {
            snd_play(snd_impact);
            with (obj_dw_church_remotepianomove)
            {
                myhspeed *= 0.7;
                myvspeed *= 0.7;
            }
            con = 1;
        }
    }
}
if (con == 1)
{
    with (scr_marker_ext(x - 10, y + 40, spr_explosion_round, 2, 2, 0, undefined, undefined, depth))
    {
        image_speed = 0.6;
        depth = 49600;
        scr_doom(id, 15);
    }
    if (special == 3)
    {
        var debris_x = [-6, -3, 4, 11, 20, 43, 31, 42, 48, 58, 69];
        var debris_y = [52, 40, 34, 36, 8, 25, 71, 48, 59, 60, 36];
        var debris_hspeeds = [-2, -1.5, -1.2, -1.1, -0.5, 1.2, 0.2, 0.6, 1.35, 1.45, 2];
        var debris_vspeeds = [-2, -2.5, -2.8, -2.9, -3.5, -2.7, -1.5, -2.2, -2, -1.9, -2.1];
        for (var i = 0; i < 11; i++)
        {
            with (instance_create(x + 20 + (debris_x[i] * 0.5), y + (debris_y[i] * 2), obj_marker))
            {
                sprite_index = spr_musicgate_debris;
                image_index = i;
                image_speed = 0;
                image_xscale = 2;
                image_yscale = 2;
                depth = 100;
                hspeed = debris_hspeeds[i] * 3;
                vspeed = debris_vspeeds[i] * 3;
                gravity = 1;
                scr_lerpvar("image_alpha", 1, 0, 60, 1, "out");
                scr_doom(id, 60);
            }
        }
    }
    else
    {
        var thisID = floor((x / 80) + (y / 80));
        var scatter = 791;
        if ((thisID % 2) == 1)
            scatter = 4201;
        with (scr_marker_ext(x, y + 80, scatter))
        {
            image_speed = 0.3;
            depth = 49600;
            scr_doom(id, 20);
        }
        with (instance_create(x, y + 80, obj_marker))
        {
            sprite_index = spr_bookshelf_debris;
            image_index = thisID % 5;
            image_speed = 0;
            depth = 999999;
        }
        if (extflag == "treasure")
        {
            with (instance_create(x + 20, y + 60, obj_treasure_room))
            {
                var pos = scr_heromarker(undefined, "treasureloc");
                var jumptime = 20;
                scr_jump_to_point(pos[0], pos[1], 24, jumptime);
                snd_play(snd_won);
                snd_play_delay(snd_noise, jumptime, 1, 1);
            }
        }
        if (special == 2)
        {
            with (obj_floorTrigger)
                instance_destroy();
            with (obj_solid_temp)
            {
                if (extflag == "FLOOR1TEMP")
                    active = 1;
                else
                    active = 0;
            }
            with (obj_bookshelf_destructable)
            {
                if (special == 1)
                {
                    special = 0;
                    with (mysolid)
                        instance_destroy();
                    mysolid = instance_create(x, y + 80, obj_solidblocksized);
                    mysolid.extflag = "breakable";
                    scr_size(2, 2, mysolid);
                }
            }
            with (obj_dw_churchb_library)
            {
                flooractive = 3;
                npc2.y = npc2.y + 1000;
            }
        }
        x += 20;
        y += 20;
        scr_afterimage_cut();
    }
    if (flagno != -1)
    {
        if (flagbit > 0)
            global.flag[flagno] = global.flag[flagno] | (1 << (flagbit - 1));
        else
            global.flag[flagno] = 1;
    }
    with (mysolid)
        instance_destroy();
    instance_destroy();
}

originX = layer_get_x(tileLayer);
originY = layer_get_y(tileLayer);
var kris = -1;
with (obj_mainchara_board)
{
    if (controlled)
        kris = id;
}
if (init == false)
{
    with (obj_board_parent)
        event_user(11);
    init = true;
}
if (con == 0)
    active = false;
else
    active = true;
if (con == 0)
{
    activecheck = 0;
    if (shift != "none")
    {
        con = 1;
        moving = 0;
        with (obj_board_boulder)
            instance_destroy();
        with (obj_pushableblock_board)
        {
            if (sprite_index == spr_board_pushableblock_ice)
                instance_destroy();
        }
        with (obj_mainchara_board)
        {
            sleepy = false;
            sleepytimer = 0;
            fun = 0;
            image_speed = 0;
            if (name == "susie")
            {
                graballpots = false;
                path_end();
                path_target_x = -1;
                path_target_y = -1;
                is_moving_timer = 0;
                is_moving = false;
                graballpots_con = 0;
                graballpots_timer = 0;
                if (i_ex(obj_board_grabobject))
                {
                    with (grabmarker)
                    {
                        with (grabbedid)
                        {
                            var findsusie = 0;
                            if (object_index == obj_mainchara_board)
                            {
                                with (obj_mainchara_board)
                                {
                                    if (name == "susie")
                                        findsusie = id;
                                }
                                sourcex = x;
                                sourcey = y;
                            }
                            setxy(other.sourcex, other.sourcey);
                            if (i_ex(findsusie))
                                setxy(findsusie.x, findsusie.y);
                            visible = true;
                            frozen = false;
                        }
                        grabdaddy.grabbed = 0;
                        grabdaddy.grab = 0;
                        grabdaddy.canfreemove = 1;
                        instance_destroy();
                    }
                }
                grab = 0;
                with (obj_board_grabobject)
                {
                    if (!i_ex(grabbedid))
                    {
                        grabdaddy.grabbed = 0;
                        grabdaddy.grab = 0;
                        instance_destroy();
                    }
                }
            }
            runawayfromsusie = false;
            runawayfromsusiecon = 0;
        }
        scr_pathfind_end("kris");
        scr_pathfind_end("susie");
        scr_pathfind_end("ralsei");
        with (obj_board_enemy_parent)
        {
            if (object_index != obj_board_enemy_deer)
            {
                instance_destroy();
            }
            else
            {
                if (ominoussound == 0)
                {
                    ominoussound = 1;
                    snd_stop(snd_board_ominous);
                    snd_play(snd_board_ominous);
                }
                visible = false;
                follow = true;
                x = obj_mainchara_board.x;
                y = obj_mainchara_board.y;
            }
        }
        with (obj_fire_bar_base)
            instance_destroy();
        with (obj_fire_bar_piece)
            instance_destroy();
        with (obj_board_enemy_spear)
            instance_destroy();
        with (obj_board_enemy_fire)
            instance_destroy();
        with (obj_board_enemy_bubble)
            instance_destroy();
        with (obj_board_enemy_note)
            instance_destroy();
        with (obj_board_enemy_pellet)
            instance_destroy();
        with (obj_board_enemy_note)
            instance_destroy();
        with (obj_board_icepuzzle_wall)
            instance_destroy();
        with (obj_board_icepuzzle_controller1)
            instance_destroy();
        with (obj_board_icepuzzle_controller2)
            instance_destroy();
        with (obj_board_icepuzzle_controller3)
            instance_destroy();
        with (obj_board_chase_event)
            instance_destroy();
        with (obj_board_enemy_deer_ice_spell)
            instance_destroy();
        if (room == room_board_1 || room == room_dw_puzzlecloset_3)
        {
            with (obj_board_controller)
            {
                if (i_ex(kris_object))
                    kris_object.leftdoorway = false;
            }
        }
        else
        {
            obj_board_controller.kris_object.leftdoorway = false;
        }
        var specialmove = 0;
        var specialcase = -4;
        var px = 0;
        var py = 0;
        if (!i_ex(kris))
        {
            with (obj_mainchara_board)
            {
                if (name == "kris")
                    kris = id;
            }
        }
        if (kris.facing == 0)
            py = 16;
        if (kris.facing == 2)
            py = -16;
        if (kris.facing == 1)
            px = 16;
        if (kris.facing == 3)
            px = -16;
        with (kris)
            specialcase = instance_place(x + px, y + py, obj_board_specialwarp);
        var _sy;
        if (specialcase != -4)
        {
            var _sx = 0;
            _sy = 0;
            if (specialcase.extflag == "loop_exit")
            {
                with (obj_board_swordroute_loop_counter)
                {
                    if (con == 0)
                    {
                        specialmove = 1;
                        _sy = -256;
                    }
                }
            }
        }
        if (specialmove == 1)
        {
            layer_y(tileLayer, layer_get_y(tileLayer) + _sy);
            if (layer_exists(assetLayer))
                layer_y(assetLayer, layer_get_y(assetLayer) + _sy);
            if (layer_exists(tileLayer2))
                layer_y(tileLayer2, layer_get_y(tileLayer2) + _sy);
            originY = layer_get_y(tileLayer);
            with (obj_board_parent)
            {
                if (object_index != obj_mainchara_board)
                    y += _sy;
            }
            specialmove = 0;
        }
        with (obj_board_swordroute_treeteleportroom)
            event_user(7);
    }
}
if (con == 1)
{
    if (activecheck == 0)
    {
        activecheck = 1;
        var _xx = 0;
        var _yy = 0;
        switch (shift)
        {
            case "right":
                _xx += 384;
                break;
            case "left":
                _xx -= 384;
                break;
            case "up":
                _yy -= 256;
                break;
            case "down":
                _yy += 256;
                break;
            case "warp":
                _xx += ((warpx + originX) - 128);
                _yy += ((warpy + originY) - 64);
                break;
        }
        var dslist = ds_list_create();
        var x1 = 128 + _xx;
        var x2 = 512 + _xx;
        var y1 = 64 + _yy;
        var y2 = 320 + _yy;
        var _num = collision_rectangle_list(x1, y1, x2, y2, obj_board_parent, false, true, dslist, 0);
        if (_num > 0)
        {
            for (var i = 0; i < _num; i++)
            {
                with (ds_list_find_value(dslist, i))
                    active = true;
            }
        }
        ds_list_destroy(dslist);
    }
    if (shift == "right")
    {
        movespeed = 24;
        if (moving != gamescreenWidth)
        {
            with (obj_board_parent)
                x -= other.movespeed;
            with (kris)
                x += 2;
            var raft = 0;
            with (obj_board_boat)
            {
                if (engaged)
                    raft = id;
            }
            if (i_ex(raft))
                raft.x += 2;
            layer_x(tileLayer, layer_get_x(tileLayer) - movespeed);
            if (layer_exists(assetLayer))
                layer_x(assetLayer, layer_get_x(assetLayer) - movespeed);
            if (layer_exists(tileLayer2))
                layer_x(tileLayer2, layer_get_x(tileLayer2) - movespeed);
            moving += movespeed;
        }
        else
        {
            con = 98;
        }
    }
    if (shift == "left")
    {
        movespeed = 24;
        if (moving != gamescreenWidth)
        {
            moving += movespeed;
            with (obj_board_parent)
                x += other.movespeed;
            with (kris)
                x -= 2;
            var raft = 0;
            with (obj_board_boat)
            {
                if (engaged)
                    raft = id;
            }
            if (i_ex(raft))
                raft.x -= 2;
            layer_x(tileLayer, layer_get_x(tileLayer) + movespeed);
            if (layer_exists(assetLayer))
                layer_x(assetLayer, layer_get_x(assetLayer) + movespeed);
            if (layer_exists(tileLayer2))
                layer_x(tileLayer2, layer_get_x(tileLayer2) + movespeed);
        }
        else
        {
            con = 98;
        }
    }
    if (shift == "up")
    {
        movespeed = 16;
        if (moving != gamescreenHeight)
        {
            moving += movespeed;
            with (obj_board_parent)
                y += other.movespeed;
            with (kris)
                y -= 2;
            var raft = 0;
            with (obj_board_boat)
            {
                if (engaged)
                    raft = id;
            }
            if (i_ex(raft))
                raft.y -= 2;
            layer_y(tileLayer, layer_get_y(tileLayer) + movespeed);
            if (layer_exists(assetLayer))
                layer_y(assetLayer, layer_get_y(assetLayer) + movespeed);
            if (layer_exists(tileLayer2))
                layer_y(tileLayer2, layer_get_y(tileLayer2) + movespeed);
        }
        else
        {
            con = 98;
        }
    }
    if (shift == "down")
    {
        movespeed = 16;
        if (moving != gamescreenHeight)
        {
            moving += movespeed;
            with (obj_board_parent)
                y -= other.movespeed;
            with (kris)
                y += 2;
            var raft = 0;
            with (obj_board_boat)
            {
                if (engaged)
                    raft = id;
            }
            if (i_ex(raft))
                raft.y += 2;
            layer_y(tileLayer, layer_get_y(tileLayer) - movespeed);
            if (layer_exists(assetLayer))
                layer_y(assetLayer, layer_get_y(assetLayer) - movespeed);
            if (layer_exists(tileLayer2))
                layer_y(tileLayer2, layer_get_y(tileLayer2) - movespeed);
        }
        else
        {
            con = 98;
        }
    }
    if (shift == "warp")
    {
        con = 10;
        timer = 0;
    }
}
if (con == 10)
{
    if (timer == 0 && instawarp == false)
    {
        transition = instance_create(x, y, obj_board_transition);
        transition.transitionspeed = 1;
        transition.pausetime = 2;
        transition.tilescovered = -1;
        transition.type = 0;
    }
    timer++;
    if (timer == 10 || instawarp == true)
    {
        timer = 0;
        con = 11;
    }
}
if (con == 11)
{
    if (timer == 0)
    {
        var roomstartx = 128;
        var roomstarty = 64;
        if (room == room_dw_puzzlecloset_3)
        {
            roomstartx = 2688;
            roomstarty = 608;
        }
        var moveX = roomstartx - warpx - originX;
        var moveY = roomstarty - warpy - originY;
        with (obj_mainchara_board)
            setxy(other.playerX + other.originX, other.playerY + other.originY);
        with (obj_board_parent)
            setxy(x + moveX, y + moveY);
        layer_x(tileLayer, layer_get_x(tileLayer) + moveX);
        layer_y(tileLayer, layer_get_y(tileLayer) + moveY);
        if (layer_exists(assetLayer))
        {
            layer_x(assetLayer, layer_get_x(assetLayer) + moveX);
            layer_y(assetLayer, layer_get_y(assetLayer) + moveY);
        }
        if (layer_exists(tileLayer2))
        {
            layer_x(tileLayer2, layer_get_x(tileLayer2) + moveX);
            layer_y(tileLayer2, layer_get_y(tileLayer2) + moveY);
        }
    }
    timer++;
    if (timer == 15 || instawarp == true)
        con = 98;
}
var specialwarp;
if (con == 98)
{
    with (obj_gameshow_swordroute)
        event_user(1);
    instawarp = false;
    scr_board_gridreset();
    with (obj_board_enemy_spawner)
    {
        if (x >= 128 && x <= 480 && y >= 64 && y <= 288)
            event_user(0);
    }
    with (obj_board_enemy_deer)
    {
        visible = true;
        if (follow == true)
        {
            x = obj_mainchara_board.x;
            y = obj_mainchara_board.y;
            follow = true;
            for (var i = 0; i < 75; i += 1)
            {
                remx[i] = obj_mainchara_board.x;
                remy[i] = obj_mainchara_board.y;
            }
        }
    }
    with (obj_mainchara_board)
    {
        var specialmove = 0;
        if (place_meeting(x, y, obj_board_specialwarp))
        {
            specialwarp = instance_place(x, y, obj_board_specialwarp);
            if (specialwarp.extflag == "loop")
                obj_board_swordroute_loop_counter.value = specialwarp.shift;
            if (specialwarp.extflag == "loop_exit")
            {
                obj_board_swordroute_loop_counter.value = specialwarp.shift;
                if (obj_board_swordroute_loop_counter.con == 0)
                    specialmove = 1;
            }
            other.con = 120;
        }
        else
        {
            other.con = 99;
        }
    }
}
if (con == 99)
{
    if (global.flag[1024] == 0)
    {
        scr_resetgameshowcharacter("kris");
        scr_resetgameshowcharacter("susie");
        scr_resetgameshowcharacter("ralsei");
        scr_resetgameshowcharacter("tenna");
    }
    global.flag[1016] = 0;
    global.interact = 0;
    shift = "none";
    movetype = 0;
    con = 0;
    with (obj_mainchara_board)
    {
        canfreemove = true;
        x = round(x);
        y = round(y);
        if (myhealth <= 0)
        {
            myhealth = 1;
            image_alpha = 1;
        }
    }
    with (obj_board_boat)
    {
        if (engaged)
            canfreemove = true;
    }
    var boss = 0;
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            boss = id;
    }
    with (obj_mainchara_board)
    {
        if (i_ex(boss))
        {
            if (controlled == 0)
                setxy(boss.x, boss.y);
        }
        if (name == "susie" || name == "ralsei")
        {
            for (var i = 0; i < 75; i += 1)
            {
                remx[i] = x;
                remy[i] = y;
                facingdir[i] = 0;
                input[i] = 0;
            }
        }
    }
    with (obj_board_caterpillarchara)
    {
        x = obj_mainchara_board.x;
        y = obj_mainchara_board.y;
        scr_board_b3s_interpolatecaterpillarchara();
    }
    with (obj_board_parent)
        event_user(11);
    if (instawarproomgoto != -4)
    {
        helper = instance_create(x, y, obj_board_instawarp_helper);
        helper.camx = camsavex;
        helper.camy = camsavey;
        helper.krissavex = obj_board_controller.kris_object.x;
        helper.krissavey = obj_board_controller.kris_object.y;
        if (obj_board_controller.susie_object != -1)
        {
            helper.sussavex = obj_board_controller.susie_object.x;
            helper.sussavey = obj_board_controller.susie_object.y;
        }
        if (obj_board_controller.ralsei_object != -1)
        {
            helper.ralsavex = obj_board_controller.ralsei_object.y;
            helper.ralsavey = obj_board_controller.ralsei_object.y;
        }
        room_goto(instawarproomgoto);
        instawarproomgoto = -4;
    }
}
if (con == 120)
{
    shift = specialwarp.shift;
    var _sx = 0;
    var _sy = 0;
    if (shift == "up")
        _sy = 256;
    if (shift == "down")
        _sy = -256;
    if (shift == "left")
        _sx = 384;
    if (shift == "right")
        _sx = -384;
    layer_x(tileLayer, layer_get_x(tileLayer) + _sx);
    layer_y(tileLayer, layer_get_y(tileLayer) + _sy);
    if (layer_exists(assetLayer))
    {
        layer_x(assetLayer, layer_get_x(assetLayer) + _sx);
        layer_y(assetLayer, layer_get_y(assetLayer) + _sy);
    }
    if (layer_exists(tileLayer2))
    {
        layer_x(tileLayer2, layer_get_x(tileLayer2) + _sx);
        layer_y(tileLayer2, layer_get_y(tileLayer2) + _sy);
    }
    with (obj_board_parent)
    {
        if (object_index != obj_mainchara_board)
        {
            x += _sx;
            y += _sy;
        }
    }
    con = 99;
}

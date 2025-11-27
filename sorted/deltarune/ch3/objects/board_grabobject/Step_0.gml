if (init == 0)
{
    susie = 0;
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
    if (i_ex(grabbedid))
    {
        if (grabbedid.object_index == obj_board_bridge)
        {
            type = 1;
            xoff = grabbedid.xoff;
        }
        if (grabbedid.object_index == obj_board_grabblenpc)
        {
            type = 10;
            if (variable_instance_exists(grabbedid, "grabindex"))
                grabbedid.sprite_index = grabbedid.grabindex;
            with (grabbedid)
                safe_delete(mysolid);
        }
        if (grabbedid.object_index == obj_b3bs_chasekey)
        {
            grabbedid.sprite_index = spr_b3bs_chasekey_grabbed;
            grabbedid.grabbed = true;
            throwbuff = 10;
        }
        if ((grabbedid.object_index == obj_pushableblock_board && room != room_dw_b3bs_mysterypuzzle) || grabbedid.object_index == obj_dw_puzzlecloset_1_bush || grabbedid.object_index == obj_b3bs_chasekey)
            throwdist = 1;
    }
    if (grabbedid.object_index == obj_mainchara_board)
    {
        global.flag[1257]++;
        scr_pathfind_end(grabbedid.name);
    }
    if (grabbedid.object_index == obj_board_bridge)
    {
        if (sprite_index == spr_board_ralsei_surfboard)
        {
            global.flag[1257]++;
            debug_print("ralsei lift: " + string(global.flag[1257]));
        }
    }
    blockerlist[0] = 0;
    for (var i = 0; i < array_length(susie.blockerlist); i++)
    {
        blockerlist[i] = susie.blockerlist[i];
        if (ignoreplayer == 1)
        {
            if (blockerlist[i] == 544)
                blockerlist[i] = 322;
        }
    }
    if (instance_exists(grabbedid))
    {
        marker = scr_marker(x, y, grabbedid.sprite_index);
        marker.image_xscale = grabbedid.image_xscale;
        marker.image_yscale = grabbedid.image_yscale;
        marker.image_speed = grabbedid.image_speed;
        marker.image_index = grabbedid.image_index;
        marker.visible = false;
        if (variable_instance_exists(grabbedid, "throwdist"))
            throwdist = grabbedid.throwdist;
        if (variable_instance_exists(grabbedid, "snap"))
            snap = grabbedid.snap;
    }
    image_alpha = 0;
    sprite_index = spr_whitepx_10;
    image_xscale = 3.2;
    image_yscale = 3.2;
    if (room == room_dw_puzzlecloset_1 || room == room_dw_puzzlecloset_2)
    {
    }
    init = 1;
}
lifetimer++;
if (throwbuff > 0)
    throwbuff--;
if (con == 0 && instance_exists(grabdaddy))
{
    if (type == 0)
    {
        _xx = 0;
        _yy = 0;
        switch (grabdaddy.facing)
        {
            case 0:
                _yy = 32;
                break;
            case 1:
                _xx = 32;
                break;
            case 2:
                _yy = -32;
                break;
            case 3:
                _xx = -32;
                break;
        }
        blocked = 0;
        tx = round(grabdaddy.x / 32) * 32;
        ty = round(grabdaddy.bbox_top / 32) * 32;
        if (ty > grabdaddy.bbox_bottom)
            ty -= 32;
        if (throwdist == 1)
        {
            switch (grabdaddy.facing)
            {
                case 0:
                    if (ty < grabdaddy.y)
                        ty += 32;
                    break;
                case 1:
                    if (tx < grabdaddy.x)
                        tx += 32;
                    break;
                case 2:
                    if (ty > grabdaddy.y)
                        ty -= 32;
                    break;
                case 3:
                    if (tx > grabdaddy.x)
                        tx -= 32;
                    break;
            }
        }
        var spaceFree = 1;
        if (snap)
        {
            for (var i = 1; i < (throwdist + 1); i++)
            {
                for (var j = 0; j < array_length(blockerlist); j++)
                {
                    var blok = instance_place(tx + (_xx * i), ty + (_yy * i), blockerlist[j]);
                    if (blok != -4 && blok.object_index != obj_mainchara_board)
                    {
                        if (blok != grabdaddy)
                            spaceFree = 0;
                    }
                }
                if (spaceFree != 0)
                    blocked = i;
            }
            aimx = tx + (_xx * blocked);
            aimy = ty + (_yy * blocked);
            aimoverwrite = false;
            if (room == room_dw_b3bs_mysterypuzzle)
            {
                if (aimx == 384)
                    aimx -= 32;
            }
            if (room == room_dw_b3bs_extrapuzzle)
            {
                if (aimx == 256)
                    aimx += 32;
            }
            if (room == room_dw_b3bs_extrapuzzle)
            {
                if (aimx == 192)
                    aimx += 32;
            }
            if (room == room_board_3b)
            {
                if (obj_b3bfinale.active == true)
                {
                    var inst = instance_place(aimx, aimy, obj_board_aimoverwrite);
                    if (i_ex(inst))
                    {
                        aimx = inst.aimx;
                        aimy = inst.aimy;
                        aimoverwrite = true;
                    }
                }
            }
            if (room == room_dw_puzzlecloset_2)
            {
                if (grabbedid.object_index == obj_b3bs_chasekey)
                {
                    var inst = instance_place(aimx, aimy, obj_board_aimoverwrite);
                    if (i_ex(inst))
                    {
                        aimx = inst.aimx;
                        aimy = inst.aimy;
                        aimoverwrite = true;
                    }
                }
            }
        }
        var inbounds = true;
        if (room == room_dw_b3bs_cheaterpippins || room == room_dw_puzzlecloset_1 || room == room_dw_puzzlecloset_2 || room == room_dw_b3bs_rouxls_lanina)
            inbounds = false;
        if (inbounds)
        {
            var lclamp = 160;
            var rclamp = 448;
            var uclamp = 96;
            var dclamp = 256;
            if (room == room_dw_puzzlecloset_3)
            {
                lclamp = 2688;
                rclamp = lclamp + 384;
                uclamp = 608;
                dclamp = uclamp + 224;
            }
            aimx = clamp(aimx, lclamp, rclamp);
            aimy = clamp(aimy, uclamp, dclamp);
        }
        if (throwdist > 1 && instance_exists(grabdaddy))
        {
            if (grabdaddy.x < (aimx + 32) && grabdaddy.facing == 3)
                blocked = 0;
            if ((grabdaddy.x + 32) > aimx && grabdaddy.facing == 1)
                blocked = 0;
            if (grabdaddy.y < (aimy + 32) && grabdaddy.facing == 2)
                blocked = 0;
            if ((grabdaddy.y + 32) > aimy && grabdaddy.facing == 0)
                blocked = 0;
        }
    }
    if (type == 1 && instance_exists(grabdaddy))
    {
        tx = (round(grabdaddy.x / 32) * 32) - xoff;
        ty = round(grabdaddy.bbox_top / 32) * 32;
        if (ty > grabdaddy.bbox_bottom)
            ty -= 32;
        _xx = 0;
        _yy = 0;
        switch (grabdaddy.facing)
        {
            case 0:
                _yy = 32;
                break;
            case 1:
                _xx = 32;
                break;
            case 2:
                _yy = -32;
                break;
            case 3:
                _xx = -32;
                break;
        }
        checkx = round((tx + _xx) / 32) * 32;
        checky = round((ty + _yy) / 32) * 32;
        if (room != room_dw_b3bs_rouxls_lanina && room != room_dw_puzzlecloset_3)
            checky = clamp(checky, board_tiley(1), board_tiley(6));
        blocked = 0;
        bridgereticle1 = false;
        bridgereticle2 = false;
        var _water = instance_place(checkx, checky, obj_board_watertile);
        if (instance_exists(_water))
        {
            if (_water.occupied == false)
            {
                blocked = 1;
                bridgereticle1 = true;
                aimx = checkx;
                aimy = checky;
            }
        }
        if (instance_exists(grabbedid))
        {
            if (blocked == 1)
            {
                if (grabbedid.size > 1)
                {
                    blocked = 0;
                    _water = instance_place(checkx + 32, checky, obj_board_watertile);
                    if (instance_exists(_water))
                    {
                        if (_water.occupied == false)
                        {
                            blocked = 1;
                            bridgereticle2 = true;
                            aimx = checkx;
                            aimy = checky;
                        }
                    }
                }
            }
        }
    }
    if (type == 2 && instance_exists(grabdaddy))
    {
        tx = round(grabdaddy.x / 32) * 32;
        ty = round(grabdaddy.bbox_top / 32) * 32;
        if (ty > grabdaddy.bbox_bottom)
            ty -= 32;
        _xx = 0;
        _yy = 0;
        switch (grabdaddy.facing)
        {
            case 0:
                _yy = 32;
                break;
            case 1:
                _xx = 32;
                break;
            case 2:
                _yy = -32;
                break;
            case 3:
                _xx = -32;
                break;
        }
        checkx = round((tx + _xx) / 32) * 32;
        checky = round((ty + _yy) / 32) * 32;
        checky = clamp(checky, board_tiley(1), board_tiley(6));
        blocked = 0;
        if (!instance_place(checkx, checky, obj_board_solid))
        {
            blocked = 1;
            aimx = checkx;
            aimy = checky;
        }
    }
    if (type == 3 && instance_exists(grabdaddy))
    {
        tx = round(grabdaddy.x / 32) * 32;
        ty = round(grabdaddy.bbox_top / 32) * 32;
        if (ty > grabdaddy.bbox_bottom)
            ty -= 32;
        _xx = 0;
        _yy = 0;
        switch (grabdaddy.facing)
        {
            case 0:
                _yy = 64;
                break;
            case 1:
                _xx = 64;
                break;
            case 2:
                _yy = -64;
                break;
            case 3:
                _xx = -64;
                break;
        }
        checkx = round((tx + _xx) / 32) * 32;
        checky = round((ty + _yy) / 32) * 32;
        blocked = 0;
        if (!instance_place(checkx, checky, obj_board_solid))
        {
            blocked = 1;
            aimx = checkx;
            aimy = checky;
        }
    }
    if (type == 10)
    {
        blocked = 1;
        aimx = checkx;
        aimy = checky;
    }
}
if (con == 1)
{
    if (type == 10)
    {
        var tossdir = 0;
        with (grabdaddy)
        {
            grabbed = 0;
            grab = 0;
            canfreemove = 1;
            if (facing == 2)
                facing = 0;
            tossdir = facing;
        }
        with (grabbedid)
        {
            dir = tossdir;
            setxy(other.x, other.y - 32);
            visible = true;
            con = 1;
        }
        instance_destroy();
    }
    if (aimoverwrite == true)
    {
        if (room == room_board_3b)
        {
            if (obj_b3bfinale.active)
            {
                global.interact = 1;
                obj_b3bfinale.clamper = false;
            }
        }
    }
    if (!instathrow && instance_exists(grabdaddy))
    {
        timer = 0;
        if (grabdaddy.graballpots_con == 3)
        {
            scr_lerpvar_instance(marker, "x", x, grabdaddy.xx, throwtime);
            scr_lerpvar_instance(marker, "y", marker.y, grabdaddy.yy, throwtime);
        }
        else
        {
            scr_lerpvar_instance(marker, "x", marker.x, aimx, throwtime);
            scr_lerpvar_instance(marker, "y", marker.y, aimy, throwtime);
        }
        scr_lerpvar("fakey", 0, -32, round(throwtime / 2), 2, "out");
        setxy(grabdaddy.x + (_xx / 4), grabdaddy.y + (_yy / 4));
        if (grabdaddy.graballpots_con == 3)
        {
            scr_lerpvar("x", x, grabdaddy.xx, throwtime);
            scr_lerpvar("y", y, grabdaddy.yy, throwtime);
        }
        else
        {
            scr_lerpvar("x", x, aimx, throwtime);
            scr_lerpvar("y", y, aimy, throwtime);
        }
        if (room == room_board_3b)
        {
            if (aimoverwrite)
                createshadow = false;
        }
        if (createshadow)
        {
            shadowmarker = instance_create(x, y, obj_board_marker);
            shadowmarker.sprite_index = spr_board_shadow;
            shadowmarker.image_index = 1;
            shadowmarker.image_speed = 0;
            scr_darksize(shadowmarker);
            shadowmarker.depth = 999990;
        }
        con = 2;
    }
    else
    {
        x = aimx;
        y = aimy;
        con = 5;
    }
}
if (con == 2)
{
    timer++;
    if (timer == round(throwtime / 2))
        scr_lerpvar("fakey", -32, 0, round(throwtime / 2), 2, "in");
    if ((marker.x == aimx && marker.y == aimy && grabdaddy.graballpots_con != 3) || (marker.x == grabdaddy.xx && marker.y == grabdaddy.yy && grabdaddy.graballpots_con == 3))
    {
        with (shadowmarker)
            instance_destroy();
        if (room == room_board_3b)
        {
            if (aimoverwrite)
                playsound = false;
        }
        if (playsound)
            snd_play(snd_impact_bc);
        with (grabbedid)
        {
            if (instance_exists(other.grabdaddy))
            {
                if (other.grabdaddy.graballpots_con != 3)
                {
                    setxy(other.aimx, other.aimy);
                }
                else
                {
                    with (obj_board_controller.ralsei_object)
                    {
                        follow = true;
                        facing = 0;
                        sprite_index = dsprite;
                    }
                    setxy(other.grabdaddy.xx, other.grabdaddy.yy);
                }
            }
            visible = true;
            frozen = false;
            if ((object_index == obj_board_grabbleObject || object_index == obj_board_grabbablegrass || object_index == obj_board_grabbablebomb) && other.type != 3)
            {
                grabcount++;
                if (variable_instance_exists(id, "extflag") && is_string(extflag) && extflag == "shell")
                {
                    with (instance_create(x, y, obj_board_breakpoof))
                    {
                        depth = other.depth;
                        image_blend = #9296FF;
                    }
                    x = room_width * 4;
                }
            }
            if (object_index == obj_shadow_mantle_bomb || object_index == obj_board_bomb)
                con = 2;
            if (object_index == obj_mainchara_board)
            {
                canfreemove = 1;
                sleepytimer = 0;
            }
            if (room == room_dw_puzzlecloset_1)
            {
                if (object_index == obj_pushableblock_board)
                {
                    var grass = instance_place(x, y, obj_board_grabbablegrass);
                    if (instance_exists(grass))
                    {
                        with (grass)
                        {
                            if (con < 2.1)
                                con = 2.1;
                        }
                    }
                }
            }
        }
        with (marker)
            instance_destroy();
        with (grabdaddy)
        {
            grabbed = 0;
            grab = 0;
            canfreemove = 1;
        }
        instance_destroy();
    }
}
if (con == 5)
{
    snd_play(snd_impact_bc);
    with (grabbedid)
    {
        if (instance_exists(other.grabdaddy))
        {
            if (other.grabdaddy.graballpots_con != 3)
            {
                setxy(other.aimx, other.aimy);
            }
            else
            {
                with (obj_board_controller.ralsei_object)
                {
                    follow = true;
                    facing = 0;
                    sprite_index = dsprite;
                }
                setxy(other.grabdaddy.xx, other.grabdaddy.yy);
            }
        }
        visible = true;
        frozen = false;
    }
    with (marker)
        instance_destroy();
    with (obj_mainchara_board)
    {
        grabbed = 0;
        grab = 0;
        canfreemove = 1;
    }
    con = 6;
    instance_destroy();
}
if (con == 0)
    depth = grabdaddy.depth - 100;
else
    scr_depth_board();
if (obj_board_camera.con != 0)
{
    if (instance_exists(grabbedid))
    {
        if (grabbedid.object_index != obj_mainchara_board)
        {
            safe_delete(grabbedid);
            safe_delete(shadowmarker);
            if (instance_exists(grabdaddy))
            {
                grabdaddy.grabbed = 0;
                grabdaddy.grab = 0;
            }
            instance_destroy();
        }
    }
}
if (instance_exists(shadowmarker))
{
    if (fakey > -10)
        shadowmarker.visible = false;
    else
        shadowmarker.visible = true;
}

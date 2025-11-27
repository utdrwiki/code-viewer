if (init == 0)
{
    if (type == "key")
        sprite_index = spr_board_key;
    if (type == "deodorant")
    {
        sprite_index = spr_board_deodorant;
        image_alpha = 1;
        con = 2;
    }
    if (type == "ribbon")
    {
        sprite_index = spr_board_bow_full;
        image_alpha = 1;
        con = 2;
    }
    if (type == "lancer")
    {
        sprite_index = spr_board_lancer_spin;
        image_speed = 0;
        image_index = 0;
        image_alpha = 1;
        con = 2;
    }
    if (type == "q")
    {
        glow = true;
        sprite_index = spr_board_inventory_q;
        if (room == room_board_2)
            sprite_index = spr_board_b2tennaglasses;
        if (room == room_board_3)
            sprite_index = spr_board_inventory_q;
        image_index = 0;
        image_speed = 0;
        image_alpha = 1;
        con = 2;
    }
    if (type == "rouxlsblock")
    {
        sprite_index = spr_board_rouxlsblock;
        image_alpha = 1;
        con = 3;
    }
    if (type == "camera")
    {
        if (room == room_dw_puzzlecloset_3)
        {
            if (global.flag[1150] >= 4)
            {
                global.flag[1244] = 1;
                with (obj_b3bs_console)
                    nocamera = false;
                instance_destroy();
            }
        }
        sprite_index = spr_board_playercamera_pickup;
        image_index = 0;
        image_speed = 0;
        image_alpha = 0;
        con = 2;
    }
    if (type == "sunmoonstone")
    {
        sprite_index = spr_board_sunmoonstone;
        image_alpha = 1;
        con = 2;
    }
    if (type == "power")
    {
        sprite_index = spr_board_powerpickup;
        image_alpha = 1;
        con = 2;
    }
    if (type == "sword")
    {
        sprite_index = spr_board_sword;
        image_alpha = 1;
        playerspin = false;
        con = 2;
    }
    if (type == "voucher")
    {
        sprite_index = spr_board_voucher;
        image_alpha = 1;
        con = 2;
    }
    if (type == "bonus")
    {
        sprite_index = spr_board_b2bonus;
        image_alpha = 1;
        con = 2;
    }
    if (type == "idcard")
    {
        sprite_index = spr_board_keycard;
        image_alpha = 1;
        xoff = 8;
        yoff = 14;
        con = 2;
    }
    if (override != -1)
        con = override;
    init = 1;
}
if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (susie == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (player == 0)
{
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            other.player = id;
    }
}
if (con == 0)
{
    scr_depth_board();
    image_alpha = 0;
    timer++;
    if (timer >= 4)
    {
        image_alpha = 1;
        con = 1;
    }
}
if (con == 1)
{
    scr_depth_board();
    image_speed = 0.5;
    if (image_index == (sprite_get_number(sprite_index) - 1))
    {
        con = 2;
        image_speed = 0;
    }
}
if (con >= 2)
    image_speed = 0;
if (con == 2 && obj_board_camera.shift == "none")
{
    image_alpha = 1;
    scr_depth_board();
    if (type != "q")
        image_index = sprite_get_number(sprite_index) - 1;
    if (type == "lancer")
        image_index = 0;
    if (type == "q")
    {
        if (obj_board_inventory.qcount == 1)
            image_index = 1;
    }
    var checkpos = true;
    player = 0;
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            other.player = id;
    }
    var _kris = 0;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            _kris = id;
    }
    var _susie = 0;
    with (obj_mainchara_board)
    {
        if (name == "susie")
            _susie = id;
    }
    var _ralsei = 0;
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            _ralsei = id;
    }
    var _elnina = 0;
    with (obj_mainchara_board)
    {
        if (name == "elnina")
            _elnina = id;
    }
    var _lancer = 0;
    with (obj_mainchara_board)
    {
        if (name == "lancer")
            _lancer = id;
    }
    if (checkpos)
    {
        if (type == "power")
        {
            if (place_meeting(x, y, other.susie))
                con = 30;
            if (place_meeting(x, y, player))
                con = 20;
        }
        else
        {
            if (i_ex(_kris))
            {
                if (_kris.myhealth > 0)
                {
                    if (place_meeting(x, y, _kris))
                    {
                        player = _kris;
                        con = 3;
                    }
                }
            }
            if (room != room_board_1)
            {
                if (i_ex(_ralsei))
                {
                    if (place_meeting(x, y, _ralsei))
                    {
                        if (type != "ribbon")
                        {
                            player = _ralsei;
                            con = 3;
                        }
                    }
                }
                if (i_ex(_susie))
                {
                    if (place_meeting(x, y, _susie))
                    {
                        player = _susie;
                        con = 3;
                    }
                }
                if (i_ex(_lancer))
                {
                    if (place_meeting(x, y, _lancer))
                    {
                        if (_lancer.controlled == 1)
                        {
                            player = _lancer;
                            con = 3;
                        }
                    }
                }
                if (i_ex(_elnina))
                {
                    if (place_meeting(x, y, _elnina))
                    {
                        if (_elnina.controlled == 1)
                        {
                            player = _elnina;
                            con = 3;
                        }
                    }
                }
            }
        }
    }
    if (dodeodorant)
    {
        dodeodorant = false;
        player = _ralsei;
        con = 3;
    }
}
var transitiontime = 12;
var spintime = 1;
var spindelay = 3;
if (con == 3)
{
    if (i_ex(player))
    {
        with (player)
        {
            if (variable_instance_exists(id, "name"))
                other.pickupname = name;
        }
        glow = false;
    }
    scr_depth_board();
    global.interact = 1;
    if (i_ex(player))
    {
        if (type == "lancer")
            image_speed = 0.25;
        if (player.name == "elnina")
            playerspin = false;
        with (player)
        {
            fun = 1;
            sprite_index = dsprite;
            if (other.playerspin)
            {
                scr_delay_var("sprite_index", lsprite, spintime * 3);
                scr_delay_var("facing", 3, spintime * 3);
                scr_delay_var("sprite_index", usprite, spintime * 4);
                scr_delay_var("facing", 2, spintime * 4);
                scr_delay_var("sprite_index", rsprite, spintime * 5);
                scr_delay_var("facing", 1, spintime * 5);
                scr_delay_var("sprite_index", dsprite, spintime * 6);
                scr_delay_var("facing", 0, spintime * 6);
                scr_delay_var("sprite_index", lsprite, spintime * 7);
                scr_delay_var("facing", 3, spintime * 7);
                scr_delay_var("sprite_index", usprite, spintime * 8);
                scr_delay_var("facing", 2, spintime * 8);
                scr_delay_var("sprite_index", rsprite, spintime * 9);
                scr_delay_var("facing", 1, spintime * 9);
            }
            scr_delay_var("sprite_index", dsprite_item, spintime * 10);
            scr_delay_var("facing", 0, spintime * 10);
        }
        var yoff2 = 0;
        if (player.name == "elnina")
            yoff2 = -16;
        scr_lerpvar("x", x, player.x + xoff, transitiontime, 2, "in");
        scr_lerpvar("y", y, (player.y - 32 - 8) + yoff + yoff2, transitiontime, 2, "out");
    }
    timer = 0;
    con = 4;
}
if (con == 4)
{
    scr_depth_board();
    timer++;
    if (timer == transitiontime)
    {
        if (type == "lancer")
        {
            image_speed = 0;
            image_index = 0;
        }
        if (type == "sword")
        {
            timer = 0;
            con = 72;
        }
        else
        {
            var skip = false;
            snd_play(snd_link_sfx_itemget);
            var substring = stringsetloc("\\cYKEY\\cW x1", "obj_board_pickup_slash_Step_0_gml_270_0");
            if (type == "sunmoonstone")
                substring = stringsetloc("THE \\cYMOONCLOUD STONE\\cW!", "obj_board_pickup_slash_Step_0_gml_271_0");
            if (type == "rouxlsblock")
                substring = stringsetloc("THE \\cYROUXLS BLOCK\\cW!", "obj_board_pickup_slash_Step_0_gml_272_0");
            if (type == "q")
                substring = stringsetloc("\\cYQ\\cW x1", "obj_board_pickup_slash_Step_0_gml_273_0");
            if (type == "camera")
                skip = true;
            if (type == "lancer")
            {
                substring = stringsetloc("\\cYLANCER\\cW!", "obj_board_pickup_slash_Step_0_gml_277_0");
                if (obj_board_inventory.lancer > 0)
                    substring = stringsetloc("ANOTHER \\cYLANCER\\cW!", "obj_board_pickup_slash_Step_0_gml_278_0");
            }
            if (type == "voucher")
                substring = stringsetloc("A \\cYVOUCHER\\cW FOR \\cY1000 POINTS\\cW!", "obj_board_pickup_slash_Step_0_gml_280_0");
            if (type == "bonus")
                substring = stringsetloc("A \\cYBUCKET OF POINTS\\cW!", "obj_board_pickup_slash_Step_0_gml_281_0");
            if (type == "idcard")
                substring = stringsetloc("THE \\cYMOONCLOUD KEY CARD\\cW!", "obj_board_pickup_slash_Step_0_gml_290_0");
            if (type == "deodorant" || type == "ribbon")
                skip = true;
            var yougot = stringsetsubloc("YOU GOT ~1/%", substring, "obj_board_pickup_slash_Step_0_gml_285_0");
            msgset(0, yougot);
            if (!skip)
            {
                safe_delete(obj_board_grayregion);
                var b = bw_make();
                if (type == "idcard")
                {
                    b.xoff = 16;
                    b.side = 0;
                    b.boxleft = 16;
                    b.boxright = 18;
                }
                con = 4.5;
            }
            else
            {
                timer = 0;
                con = 4.6;
                if (type == "camera")
                {
                    if (room != room_dw_puzzlecloset_3)
                    {
                        makestars = true;
                        depth = player.depth - 1;
                        timer = 0;
                        con = 13;
                    }
                    else
                    {
                        global.flag[1244] = 1;
                    }
                }
            }
            if (type == "camera" || type == "voucher" || type == "bonus" || type == "idcard")
            {
                depth = player.depth - 1;
                if (type != "camera")
                    con = 19;
                timer = 0;
                if (room == room_dw_puzzlecloset_3)
                {
                    con = -99;
                    scr_delay_var("con", 19, 30);
                }
            }
            makestars = true;
        }
    }
}
if (con == 4.6)
{
    timer++;
    if (timer == 30)
        con = 4.5;
}
if (con == 4.5 && !bw_ex())
{
    timer = 0;
    makestars = false;
    depth = 5000;
    var slot = 0;
    if (type == "key" && room == room_board_2)
        slot = 5.25;
    if (type == "q")
    {
        slot = 1;
        if (room == room_board_3)
            slot = 0;
    }
    if (type == "sunmoonstone")
        slot = 3;
    if (type == "rouxlsblock")
    {
        global.flag[1237] = 1;
        slot = 4;
    }
    if (type == "lancer")
    {
        slot = 3;
        if (room == room_board_3)
            slot = 1;
        image_speed = 0.5;
        if (room == room_board_2)
            slot = 2;
    }
    if (type == "deodorant" || type == "ribbon")
        slot = -1;
    if (slot != -1)
    {
        desigx = 0;
        desigy = 0;
        if (i_ex(obj_board_inventory))
        {
            desigx = obj_board_inventory.x + 8;
            desigy = obj_board_inventory.y + 10 + (48 * slot);
        }
        scr_lerpvar("x", x, desigx, 20, 2, "in");
        scr_lerpvar("y", y, desigy, 20, 2, "out");
        con = 5;
    }
    else
    {
        con = 6;
    }
}
if (con == 5)
{
    if (x == desigx && y == desigy)
    {
        if (type == "key")
        {
            obj_board_inventory.keycount++;
            global.flag[1025]++;
            global.flag[1122]++;
        }
        if (type == "sunmoonstone")
            obj_board_inventory.sunmoonstone = 1;
        if (type == "rouxlsblock")
            obj_board_inventory.rouxlsblock = 1;
        if (type == "q")
            obj_board_inventory.qcount++;
        if (type == "lancer")
            obj_board_inventory.lancer++;
        if (i_ex(player))
            player.fun = 0;
        snd_play(snd_item);
        global.interact = 0;
        timer = 0;
        con = 6;
    }
}
if (con == 6)
{
    timer++;
    if (timer == 3)
    {
        var destroy = true;
        if (i_ex(player))
            player.fun = 0;
        if (type == "deodorant")
            player.stink = true;
        if (type == "ribbon")
            player.ribbon++;
        if (type == "deodorant" || type == "ribbon")
            snd_play(snd_item);
        global.interact = 0;
        if (type == "key" && room == room_board_2)
        {
            obj_b2westshop.keycon = 1;
            destroy = false;
            con = 100;
        }
        timer = 0;
        if (destroy)
            instance_destroy();
    }
}
if (con == 13)
{
    scr_speaker("no_name");
    msgsetloc(0, "YOU GOT THE \\cYCAMERA\\cW!/", "obj_board_pickup_slash_Step_0_gml_517_0");
    msgnextsubloc("PRESS \\cY~1\\cW TO TAKE A PICTURE!/%", scr_get_input_name(4), "obj_board_pickup_slash_Step_0_gml_518_0");
    bw_make();
    con = 14;
}
if (con == 14 && !bw_ex())
    con = 19;
if (con == 20)
{
    scr_pathfind_end("susie");
    scr_pathfind_end("ralsei");
    ralsei.follow = 0;
    depth = kris.depth - 10;
    global.interact = 1;
    if (i_ex(player))
    {
        with (player)
        {
            fun = 1;
            sprite_index = dsprite;
            scr_delay_var("sprite_index", lsprite, spintime * 3);
            scr_delay_var("sprite_index", usprite, spintime * 4);
            scr_delay_var("sprite_index", rsprite, spintime * 5);
            scr_delay_var("sprite_index", dsprite, spintime * 6);
            scr_delay_var("sprite_index", lsprite, spintime * 7);
            scr_delay_var("sprite_index", usprite, spintime * 8);
            scr_delay_var("sprite_index", rsprite, spintime * 9);
            scr_delay_var("sprite_index", dsprite_item, spintime * 10);
        }
        scr_lerpvar("x", x, player.x, transitiontime, 2, "in");
        scr_lerpvar("y", y, player.y - 32 - 8, transitiontime, 2, "out");
    }
    timer = 0;
    con = 21;
}
if (con == 21)
{
    depth = kris.depth - 10;
    timer++;
    if (timer == transitiontime)
    {
        makestars = true;
        snd_play(snd_link_sfx_itemget);
        con = 22;
    }
}
if (con == 30 && obj_board_camera.con == 0)
{
    with (susie)
        path_end();
    with (ralsei)
    {
        follow = 0;
        path_end();
    }
    player = susie;
    with (player)
    {
        fun = 1;
        sprite_index = dsprite;
        scr_delay_var("sprite_index", lsprite, spintime * 3);
        scr_delay_var("sprite_index", usprite, spintime * 4);
        scr_delay_var("sprite_index", rsprite, spintime * 5);
        scr_delay_var("sprite_index", dsprite, spintime * 6);
        scr_delay_var("sprite_index", lsprite, spintime * 7);
        scr_delay_var("sprite_index", usprite, spintime * 8);
        scr_delay_var("sprite_index", rsprite, spintime * 9);
        scr_delay_var("sprite_index", dsprite_item, spintime * 10);
    }
    scr_lerpvar("x", x, player.x, transitiontime, 2, "in");
    scr_lerpvar("y", y, player.y - 32 - 8, transitiontime, 2, "out");
    scr_delay_var("makestars", true, transitiontime);
    snd_play_delay(snd_link_sfx_itemget, transitiontime);
    depth = susie.depth - 10;
    global.interact = 1;
    timer = 0;
    con++;
    with (obj_b1power)
        skipredo = true;
}
if (con == 31 && obj_board_camera.con == 0)
{
    timer++;
    if (timer == transitiontime)
    {
        player = susie;
        con++;
    }
}
if (con == 72)
{
    var holdDelay = 60;
    timer++;
    if (timer == 1)
    {
        snd_free_all();
        safe_delete(obj_board_b1swordentrance);
        player.facing = 0;
        snd_play(snd_link_secret_bad);
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_26);
    }
    if (timer == (1 + holdDelay))
    {
        transition = instance_create(x, y, obj_board_transition);
        with (transition)
            transitionspeed = 5;
    }
    if (i_ex(transition))
    {
        if (transition.con == 3)
        {
            with (obj_board_camera)
            {
                if (con == 0)
                {
                    global.interact = 1;
                    shift = "warp";
                    warpx = 896;
                    warpy = 1344;
                    playerX = 1072;
                    playerY = 1456;
                    if (room == room_board_2_sword)
                    {
                        warpx = 1664;
                        warpy = 3136;
                        playerX = 1744;
                        playerY = 3216;
                    }
                    if (room == room_board_3_sword)
                    {
                        warpx = 1664;
                        warpy = 576;
                        playerX = 1856;
                        playerY = 704;
                    }
                    instawarp = true;
                }
            }
        }
    }
    global.interact = 1;
    if (timer > (1 + holdDelay + 10) && !i_ex(obj_board_transition))
    {
        if (room == room_board_1_sword || room == room_board_2_sword)
        {
            var pitch = 1;
            if (room == room_board_2_sword)
                pitch = 0.9;
            mus_play_ext("board_sword_music.ogg", 1, 1, pitch);
        }
        if (room == room_board_3_sword)
        {
            global.currentsong[0] = snd_init("board_ocean.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        }
        player.canfreemove = true;
        player.fun = false;
        player.sword = true;
        instance_destroy();
        global.interact = 0;
    }
}
if (con == 19 && !bw_ex())
{
    timer++;
    var camtime = 8;
    if (timer == 1)
    {
        depth = player.depth + 1;
        scr_lerpvar("y", y, y + 32, camtime, 2, "in");
    }
    if (timer == (1 + camtime))
    {
        if (type == "camera")
        {
            player.camera = true;
            if (room == room_dw_puzzlecloset_3)
            {
                if (global.flag[1150] < 4)
                    global.flag[1150] = 4;
                with (obj_b3bs_console)
                    nocamera = false;
            }
        }
        if (type == "idcard")
            global.flag[1097] = 2;
        if (type == "voucher")
            scr_board_score(1000);
        if (type == "bonus")
            scr_board_score(500);
        player.canfreemove = true;
        player.fun = 0;
        player.facing = 0;
        global.interact = 0;
        snd_play(snd_item);
        instance_destroy();
    }
}
if (con == 100)
{
    timer++;
    if (timer == 30)
    {
        snd_play(snd_fall);
        gravity = 0.75;
    }
    if (timer > 45)
    {
        image_alpha *= 0.9;
        if (y > 480)
            instance_destroy();
    }
}
if (con > 2 && con < 5)
    depth = player.depth;
if (makestars == true)
{
    var stardepth = player.depth + 1;
    makestarstimer++;
    if ((makestarstimer % 2) == 0)
    {
        var star = scr_board_marker(x - xoff, y - yoff, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = other.makestarstimer * 20;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
        star = scr_board_marker(x - xoff, y - yoff, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = (other.makestarstimer * 20) + 180;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
    }
    if (makestarstimer >= 16)
        makestars = false;
}
if (scr_debug())
{
    if (type == "sword")
    {
        if (keyboard_check_pressed(ord("I")))
            setxy(obj_mainchara_board.x, obj_mainchara_board.y);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_26 = 26
}

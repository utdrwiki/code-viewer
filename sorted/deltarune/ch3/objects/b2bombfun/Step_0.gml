scr_board_populatevars();
scr_gameshow_populatevars();
if (init == 0)
{
    nonoblock = instance_create(3360, 1340, obj_board_solid);
    with (nonoblock)
    {
        image_xscale = 2;
        setxy_board();
    }
    breaktrig = instance_create(3200, 1216, obj_board_event_push1_blocktrigger);
    with (breaktrig)
    {
        scr_darksize();
        setxy_board();
    }
    init = 1;
}
if (active == 1)
{
    if (breaksafe == 0 && init && obj_board_camera.con == 0)
    {
        if (i_ex(breaktrig))
        {
            with (breaktrig)
            {
                if (place_meeting(x, y, obj_board_puzzlebombbullet))
                {
                    safe_delete(other.nonoblock);
                    other.breaksafe = 1;
                }
            }
        }
    }
    if (obj_board_camera.con == 0 && suwalk == 0)
    {
        if (global.flag[1190] == 1)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 16)
            {
                susie.sleepy = true;
                scr_pathfind_to_point("susie", 6, 6, 0);
            }
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visit == 0)
        {
            visited = 1;
            if (global.flag[1190] == 0)
            {
            }
            obj_b2bombfun2.bombfun1visited = 1;
            visit = 1;
        }
        if (global.flag[1190] == 0)
        {
            tempblock = instance_create_board(1, 3, obj_board_solid);
            with (obj_mainchara_board)
                controlled = false;
            susie.controlled = true;
            ralsei.follow = false;
            kris.camera = true;
            con = 1;
            timer = 0;
        }
        else
        {
            con = 1;
            timer = 11;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 5)
            scr_pathfind_to_point("ralsei", 1, 6, 1);
        if (timer == 10)
            scr_pathfind_to_point("kris", 10, 6, 2);
        if (timer > 10)
        {
            if (obj_b2bombfunswitch.pressed == true)
            {
                con = 2;
                timer = 0;
            }
        }
    }
    if (con == 2)
    {
        checkleave = 1;
        block = instance_create_board(1, 4, obj_board_breakableblock);
        with (block)
        {
            puzzleid = 301;
            made = false;
            active = true;
            scr_depth_board();
            scr_darksize();
            setxy_board(3232, 1216);
            if (place_meeting(x, y, obj_mainchara_board))
            {
                with (instance_place(x, y, obj_mainchara_board))
                    y = other.y + 16;
            }
            puff = instance_create(x, y, obj_board_smokepuff);
        }
        if (global.flag[1190] == 0)
        {
            with (obj_mainchara_board)
                controlled = 0;
        }
        con = 3;
    }
    if (con == 3)
    {
        timer++;
        if (timer == 1)
        {
            with (obj_b2enemysquabble)
                makePathBlockers = 1;
            instance_create_board(3, 2, obj_board_grabbablebomb);
            instance_create_board(3, 4, obj_board_grabbablebomb);
            instance_create_board(5, 2, obj_board_grabbablebomb);
            instance_create_board(5, 4, obj_board_grabbablebomb);
            instance_create_board(6, 2, obj_board_grabbablebomb);
            instance_create_board(6, 4, obj_board_grabbablebomb);
            instance_create_board(8, 2, obj_board_grabbablebomb);
            instance_create_board(8, 4, obj_board_grabbablebomb);
            with (obj_board_grabbablebomb)
            {
                with (instance_create(x, y, obj_board_smokepuff))
                    depth = other.depth - 1;
            }
            with (obj_board_breakableblockspawner)
            {
                if (puzzleid == 301)
                    instance_destroy();
            }
            if (global.flag[1190] == 1)
            {
                var sutalk = stringsetloc("DIBS.", "obj_b2bombfun_slash_Step_0_gml_130_0");
                scr_couchtalk(sutalk, "susie", 2, 60);
                scr_shakeobj(su_real);
                scr_pathfind_to_point("susie", 10, 3, 2);
                susie.sleepy = false;
                con = 5;
                timer = 0;
            }
        }
        if (timer == 15)
        {
            var ratalk = stringsetloc("Oh, bombs! I bet we could...", "obj_b2bombfun_slash_Step_0_gml_93_0");
            scr_couchtalk(ratalk, "ralsei", 2, 45);
            timer = -10;
            con++;
        }
    }
    if (con == 4)
    {
        su_real.depth = kr_real.depth + 1;
        timer++;
        if (timer == 5)
        {
            var sustring = "...";
            scr_couchtalk(sustring, "susie", 2, 40);
        }
        if (timer == 55)
        {
            su_real.fun = 1;
            su_real.sprite_index = spr_susie_walk_up_dw;
            kr_real.sprite_index = kr_real.usprite;
            ra_real.sprite_index = ra_real.usprite;
            with (obj_couchwriter)
                instance_destroy();
            with (su_real)
            {
                image_speed = 0.25;
                scr_move_to_point_over_time(294, 288, 18);
            }
        }
        if (timer == 73)
            su_real.sprite_index = spr_susieu_dark_benddown;
        if (timer == 75)
        {
            scr_shakeobj(su_real, 6);
            snd_play_x(snd_grab, 0.6, 1.2);
            snd_play_x(snd_noise, 0.6, 1.2);
            if (i_ex(obj_board_grabobject))
                scr_board_forcethrow();
            safe_delete(tempblock);
        }
        if (timer == 81)
        {
            obj_ch3_gameshow.wires.sprite_index = spr_controllerwires_ksr_tangle;
            scr_shakeobj(su_real, 4);
            snd_play_x(snd_equip, 0.6, 1.2);
            snd_play_x(snd_wing, 0.6, 1.4);
            kris.controlled = 1;
            kris.cantleave = false;
            kris.facing = 0;
        }
        if (timer == 87)
        {
            su_real.sprite_index = su_real.usprite;
            su_real.image_speed = 0;
        }
        if (timer == 90)
        {
            with (su_real)
            {
                image_speed = 0.25;
                sprite_index = dsprite;
                scr_move_to_point_over_time(146, 384, 16);
            }
        }
        if (timer == 106)
        {
            with (su_real)
            {
                scr_jump_to_point(140, 392, 20, 8);
                sprite_index = usprite;
                snd_play(snd_wing);
                image_speed = 0;
            }
        }
        if (timer == 114)
            snd_play(snd_noise);
        if (timer == 115)
            scr_shakeobj(su_real, 4);
        if (timer == 120)
        {
            con++;
            timer = 0;
            scr_pathfind_to_point("susie", 10, 3, 2);
            var sutalk = stringsetloc("Alright turn's over.", "obj_b2bombfun_slash_Step_0_gml_186_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
    }
    if (con == 5)
    {
        if (scr_board_checklocation("susie", 10, 3, 4))
        {
            with (susie)
                setxy(board_tilex(10), board_tiley(3));
            scr_play_recording("susie", "U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0W000W0W0W0R0R0R0R0R0R0R0D0D0D0D0LD0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W");
            con = 6;
            timer = 0;
        }
    }
    if (con == 6 && !bombgrab)
    {
        if (scr_board_checklocation("susie", 412, 128, 8))
        {
            bombgrab = 1;
            debug_print("now");
            var mybomb = -4;
            with (obj_board_grabbablebomb)
            {
                if (scr_checklocation(id, 384, 128, 2))
                    mybomb = id;
            }
            with (obj_mainchara_board)
            {
                if (name == "susie")
                {
                    grabbed = mybomb;
                    if (grabbed != -4)
                    {
                        if (grabbed.object_index != obj_mainchara_board)
                            mp_grid_clear_cell(global.grid, floor(grabbed.x / 32), floor(grabbed.y / 32));
                        grab = 1;
                        grabmarker = instance_create(x, y, obj_board_grabobject);
                        with (grabmarker)
                        {
                            snd_play(snd_board_lift);
                            grabdaddy = other.id;
                            grabbedid = other.grabbed;
                            sprite_index = grabbedid.sprite_index;
                            image_xscale = grabbedid.image_xscale;
                            image_yscale = grabbedid.image_yscale;
                            image_speed = grabbedid.image_speed;
                            sourcex = grabbedid.x;
                            sourcey = grabbedid.y;
                        }
                        with (grabbed)
                        {
                            visible = false;
                            frozen = true;
                            setxy(board_tilex(-1), board_tiley(-1));
                            if (object_index == obj_mainchara_board)
                                canfreemove = 0;
                        }
                    }
                }
            }
        }
    }
    if (bombgrab == 1)
    {
        if (scr_board_checklocation("susie", 424, 144, 2))
        {
            bombgrab = 2;
            scr_delay_var("bombgrab", 3, 12);
        }
    }
    if (bombgrab == 3)
    {
        scr_play_recording("susie", "01010101010101010101");
        bombgrab = 4;
    }
    if (con < 99 && con > 4)
    {
        if (global.flag[1190] == 0)
        {
            if (obj_board_camera.con != 0)
                con = 99;
        }
    }
    if (con == 6)
    {
        with (obj_mainchara_board)
        {
            if (iframes > 0)
                other.con = 7;
        }
    }
    if (con == 7)
    {
        var iframecount = 0;
        with (obj_mainchara_board)
        {
            if (iframes > 0)
                iframecount++;
        }
        if (iframecount == 0)
        {
            var sutalk = stringsetloc("Heh, worth it.", "obj_b2bombfun_slash_Step_0_gml_219_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
            timer = 0;
            con = 8;
        }
    }
    if (con == 8)
    {
        timer++;
        if (timer == 15)
            scr_pathfind_to_point("susie", 3, 3, 0);
        if (timer == 60)
        {
            var ratalk = stringsetloc("...", "obj_b2bombfun_slash_Step_0_gml_234_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 100)
        {
            susie.sleepy = true;
            var sutalk = stringsetloc("What?", "obj_b2bombfun_slash_Step_0_gml_239_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
        if (timer == 160)
        {
            var ratalk = stringsetloc("Um, nothing...", "obj_b2bombfun_slash_Step_0_gml_244_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
            con = 99;
        }
    }
    if (con == 99)
    {
        if (suwalk == 0 && obj_board_camera.con == 0 && obj_board_camera.shift == "none")
        {
            suwalktimer++;
            if (suwalktimer == 8)
            {
                susie.sleepy = true;
                scr_pathfind_to_point("susie", irandom_range(2, 9), 4, 0);
            }
        }
    }
}
else
{
    if (checkleave == 1)
    {
        checkleave = 2;
        timer = 99999;
        con = 99;
    }
    if (con == 99)
    {
        suwalktimer = 0;
        suwalk = 0;
    }
}
if (active)
{
    with (obj_mainchara_board)
    {
        if (myhealth < 1)
            myhealth = 1;
    }
}

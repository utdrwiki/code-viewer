scr_populatechars();
var shelfx = 0;
var shelfy = 0;
if (i_ex(myshelf[mpos]))
{
    shelfx = (myshelf[mpos].x + 40) - 320;
    shelfy = (myshelf[mpos].y + 80) - 240;
    var inst = -4;
    with (myshelf[mpos])
        inst = instance_place(x, y, obj_camera_clamper);
    var _xmin = 0;
    var _xmax = room_width - 640;
    var _ymin = 0;
    var _ymax = room_height - 480;
    with (inst)
    {
        if (xmin != -4)
            _xmin = xmin;
        if (ymin != -4)
            _ymin = ymin;
        if (xmax != -4)
            _xmax = xmax;
        if (ymax != -4)
            _ymax = ymax;
    }
    shelfx = clamp(shelfx, _xmin, _xmax);
    shelfy = clamp(shelfy, _ymin, _ymax);
}
buffer--;
if (engaged)
{
    ubuff--;
    rbuff--;
    lbuff--;
    dbuff--;
    xbuff--;
    zbuff--;
    if (up_h())
        ubuff = 3;
    if (down_h())
        dbuff = 3;
    if (left_h())
        lbuff = 3;
    if (right_h())
        rbuff = 3;
    if (button2_h())
        xbuff = 3;
    if (button1_p())
        zbuff = 8;
    if (con == 0.1)
    {
        con = 99;
        global.interact = 1;
        kris.cutscene = true;
        if (audio_is_playing(global.currentsong[1]))
        {
            memvolume = audio_sound_get_gain(global.currentsong[1]);
            debug_message(memvolume);
            snd_volume(global.currentsong[1], memvolume * 0.125, 15);
        }
        else
        {
            memvolume = -1;
        }
        cutscene_master = scr_cutscene_make();
        var makecaterpillaractors = false;
        if (makecaterpillaractors)
        {
            scr_maincharacters_actors();
        }
        else
        {
            actor_count = 0;
            kr = 0;
            kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
            scr_actor_setup(kr, kr_actor, "kris");
            kr_actor.sprite_index = obj_mainchara.sprite_index;
            kr_actor.depth = obj_mainchara.depth;
            with (obj_mainchara)
                visible = 0;
        }
        if (makecaterpillaractors)
        {
            var realsusie = -4;
            var realralsei = -4;
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                    realsusie = id;
            }
            with (obj_caterpillarchara)
            {
                if (name == "ralsei")
                    realralsei = id;
            }
            if (i_ex(realsusie))
            {
                with (obj_light_following)
                {
                    if (target == realsusie)
                        target = other.su_actor;
                }
            }
            if (i_ex(realralsei))
            {
                with (obj_light_following)
                {
                    if (target == realralsei)
                        target = other.ra_actor;
                }
            }
        }
        var krx = x + 12;
        var kry = y + 4;
        with (obj_krmarker)
        {
            if (extflag == other.extflag)
            {
                krx = x;
                kry = y;
            }
        }
        if (array_length(myshelf) > 1)
        {
            if (mpos == 0)
            {
                var pos = scr_heromarker("kris", extflag + "a");
                krx = pos[0];
                kry = pos[1];
            }
            if (mpos == 1)
            {
                var pos = scr_heromarker("kris", extflag + "b");
                krx = pos[0];
                kry = pos[1];
            }
        }
        c_sel(kr);
        var dist = max(round(point_distance(obj_mainchara.x, obj_mainchara.y, krx, kry) / 4), 1);
        c_walkdirect(krx, kry, dist);
        if (makecaterpillaractors)
        {
            if (i_ex(ralsei))
            {
                c_sel(ra);
                var rax = kr_x - 27 - 8;
                var ray = kr_y + 30 + 2 + 1;
                with (obj_ramarker)
                {
                    if (extflag == other.extflag)
                    {
                        rax = x;
                        ray = y;
                    }
                }
                c_walkdirect(rax, ray, dist);
            }
            if (i_ex(susie))
            {
                c_sel(su);
                var sux = kr_x + 30;
                var suy = kr_y + 30;
                with (obj_sumarker)
                {
                    if (extflag == other.extflag)
                    {
                        sux = x;
                        suy = y;
                    }
                }
                c_walkdirect(sux, suy, dist);
            }
        }
        c_wait(dist);
        c_var_instance(id, "resetlight", 1);
        c_wait(1);
        c_var_instance(id, "con", 0.2);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 0.2 && !i_ex(cutscene_master))
    {
        con = 1;
        timer = 0;
    }
    if (con == 1)
    {
        with (obj_dw_church_bookshelfpuzzle)
            flooractive = 1;
        with (obj_dw_church_pianopiece_right)
            flooractive = 1;
        timer++;
        if (timer == 1)
        {
            showtut = true;
            global.interact = 1;
            camcont = true;
            obj_mainchara.cutscene = 1;
            global.facing = 2;
            obj_mainchara.ignoredepth = true;
            desiredx = camerax();
            desiredy = cameray();
            if (!followshelf)
            {
                scr_lerpvar("desiredx", camerax(), clamp(camx, 0, room_width - 640), 15, 2, "out");
                scr_lerpvar("desiredy", cameray(), clamp(camy, 0, room_height - 480), 15, 2, "out");
            }
            else
            {
                scr_lerpvar("desiredx", camerax(), clamp(shelfx, 0, room_width - 640), 15, 2, "out");
                scr_lerpvar("desiredy", cameray(), clamp(shelfy, 0, room_height - 480), 15, 2, "out");
            }
        }
        if (timer == 15)
        {
            con = 2;
            timer = 0;
        }
    }
    if (con == 2)
    {
        if (xbuff)
        {
            dbuff = 0;
            rbuff = 0;
            ubuff = 0;
            lbuff = 0;
            zbuff = 0;
        }
        if (button2_h() && myshelf[mpos].con == 0)
            endtimer++;
        else
            endtimer = 0;
        if (endtimer >= endtime)
        {
            timer = 0;
            con = 98;
        }
        if (buffer <= 0 && myshelf[mpos].con == 0)
        {
            var move = 0;
            if (array_length(myshelf) > 1)
            {
                if (button3_p())
                {
                    move = -1;
                    mpos++;
                    if (mpos > (array_length(myshelf) - 1))
                        mpos = 0;
                    var krx = kris.x;
                    krx = kris.y;
                    var kry;
                    if (mpos == 0)
                    {
                        var pos = scr_heromarker("kris", extflag + "a");
                        krx = pos[0];
                        kry = pos[1];
                    }
                    if (mpos == 1)
                    {
                        var pos = scr_heromarker("kris", extflag + "b");
                        krx = pos[0];
                        kry = pos[1];
                    }
                    var dist = max(1, round(point_distance(krx, kry, kris.x, kris.y) / 8));
                    with (kris)
                        scr_lerpvar("x", x, krx, dist, 2, "out");
                    con = -999;
                    var movetime = dist;
                    scr_delay_var("con", 2, movetime + 1);
                    ubuff = 0;
                    dbuff = 0;
                    rbuff = 0;
                    lbuff = 0;
                    cbuff = 0;
                    buffer = 1;
                }
            }
            else if (button3_h())
            {
                var doreset = true;
                with (myshelf[mpos])
                {
                    if (x == xstart && y == ystart)
                        doreset = false;
                    if (place_meeting(xstart, ystart, object_index))
                        doreset = false;
                }
                if (doreset)
                {
                    shelfresettimer++;
                    ubuff = 0;
                    dbuff = 0;
                    rbuff = 0;
                    lbuff = 0;
                    cbuff = 0;
                    buffer = 1;
                }
                if (shelfresettimer >= shelfresettime)
                {
                    move = -1;
                    with (myshelf[mpos])
                        resetpos = 1;
                    shelfresettimer = 0;
                }
            }
            else
            {
                shelfresettimer = 0;
            }
            var dodir = -1;
            if (dbuff > 0 && dbuff > ubuff && dbuff > rbuff && dbuff > lbuff)
                dodir = 0;
            if (rbuff > 0 && rbuff > ubuff && rbuff > dbuff && rbuff > lbuff)
                dodir = 1;
            if (ubuff > 0 && ubuff > dbuff && ubuff > rbuff && ubuff > lbuff)
                dodir = 2;
            if (lbuff > 0 && lbuff > dbuff && lbuff > rbuff && lbuff > ubuff)
                dodir = 3;
            var sndtoplay = -1;
            var pitcher = 0;
            var mysnd = 524;
            switch (sprite_index)
            {
                case spr_dw_church_remotepiano_blue:
                    mysnd = 587;
                    break;
                case spr_dw_church_remotepiano_red:
                    mysnd = 338;
                    break;
                case spr_dw_church_remotepiano_green:
                    mysnd = 52;
                    break;
                case spr_dw_church_remotepiano_pink:
                    mysnd = 60;
                    break;
                case spr_dw_church_remotepiano_twotone:
                    if (mpos == 0)
                        mysnd = 524;
                    else
                        mysnd = 586;
                    break;
            }
            if (dodir > -1 && zbuff > 0)
            {
                if (dodir > -1)
                {
                    with (myshelf[mpos])
                    {
                        dir = dodir;
                        move = 1;
                    }
                    switch (dodir)
                    {
                        case 0:
                            pitcher = 1;
                            break;
                        case 1:
                            pitcher = 1.12;
                            break;
                        case 2:
                            pitcher = 1.19;
                            break;
                        case 3:
                            pitcher = 0.8928571428571428;
                            break;
                    }
                }
            }
            if (pitcher != 0)
                snd_play(mysnd, 0.7, pitcher);
            ubuff = 0;
            rbuff = 0;
            lbuff = 0;
            dbuff = 0;
            xbuff = 0;
            zbuff = 0;
            if (move == 1)
            {
                with (myshelf[mpos])
                {
                    con = 1;
                    timer = 0;
                }
                buffer = 6;
            }
        }
        with (obj_bookshelf_moveable2x2)
            active = false;
        with (myshelf[mpos])
            active = true;
        if (followshelf)
        {
            desiredx = lerp(desiredx, shelfx, 0.25);
            desiredy = lerp(desiredy, shelfy, 0.25);
        }
    }
    if (con == 98)
    {
        timer++;
        if (timer == 1)
        {
            with (obj_bookshelf_moveable2x2)
                active = false;
            showtut = false;
            var plx = (obj_mainchara.x - 320) + 19;
            var ply = (obj_mainchara.y - 240) + 38;
            var inst = -4;
            with (obj_mainchara)
                inst = instance_place(x, y, obj_camera_clamper);
            var _xmin = 0;
            var _xmax = room_width - 640;
            var _ymin = 0;
            var _ymax = room_height - 480;
            with (inst)
            {
                if (xmin != -4)
                    _xmin = xmin;
                if (ymin != -4)
                    _ymin = ymin;
                if (xmax != -4)
                    _xmax = xmax;
                if (ymax != -4)
                    _ymax = ymax;
            }
            plx = clamp(plx, _xmin, _xmax);
            ply = clamp(ply, _ymin, _ymax);
            scr_lerpvar("desiredx", desiredx, clamp(plx, 0, room_width - 640), 15, 2, "out");
            scr_lerpvar("desiredy", desiredy, clamp(ply, 0, room_height - 480), 15, 2, "out");
            if (memvolume != -1)
                snd_volume(global.currentsong[1], memvolume, 15);
            if (room == room_dw_church_bookshelfpuzzle1)
            {
                global.flag[863] = myshelf[0].x;
                global.flag[864] = myshelf[0].y;
                global.flag[865] = myshelf[1].x;
                global.flag[866] = myshelf[1].y;
            }
        }
        if (timer == 16)
        {
            with (obj_dw_church_bookshelfpuzzle)
                flooractive = 2;
            with (obj_dw_church_pianopiece_right)
                flooractive = 2;
            obj_mainchara.cutscene = 0;
            global.facing = 0;
            obj_mainchara.ignoredepth = false;
            camcont = false;
            con = 0;
            engaged = false;
            buffer = 6;
            global.facing = 0;
            global.interact = 0;
            endtimer = 0;
        }
    }
}

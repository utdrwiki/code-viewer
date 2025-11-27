scr_populatechars();
if (!init)
{
    if (i_ex(obj_dw_church_bellhall_bookroom))
    {
        minstack = -6;
        stack = 12;
        maxstack = 16;
        extended = true;
        stacksize = maxstack;
    }
    if (i_ex(obj_dw_church_mizzleencounter))
    {
        minstack = 0;
        stack = 8;
        maxstack = 20;
        extended = false;
        stacksize = stack;
    }
    if (i_ex(obj_dw_church_organpuzzle))
    {
        minstack = -3.5;
        maxstack = 14;
        stack = 14;
        count = 21;
        extended = true;
        stacksize = maxstack;
        dofade = true;
        var pos = scr_heromarker(undefined, "cuptrig");
        if (i_ex(pos[2]))
        {
            setxy(pos[0], pos[1], mytrig);
            scr_sizeexact(pos[2].sprite_width, pos[2].sprite_height, mytrig);
        }
    }
    if (i_ex(obj_dw_church_rightconnect))
    {
        minstack = 0;
        stack = 17;
        maxstack = 12;
        count = 22;
        extended = false;
        dofade = true;
        stacksize = stack;
    }
    with (obj_markerAny)
    {
        if (image_index == 14)
            other.cupmarker = id;
    }
    var findmark = scr_heromarker("susie", "cup");
    sumarker = findmark[2];
    findmark = scr_heromarker("ralsei", "cup");
    ramarker = findmark[2];
    init = 1;
}
var height = scr_even((y - (stacksize * count)) + 8 + 8);
if (con == 0)
{
    with (mytrig)
    {
        if (myinteract == 3)
        {
            global.flag[1599] = 1;
            global.interact = 1;
            global.msc = -99;
            global.choice = -1;
            global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_church_cupstack_slash_Step_0_gml_84_0");
            global.choicemsg[1] = stringsetloc("#No", "obj_dw_church_cupstack_slash_Step_0_gml_85_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            scr_speaker("no_name");
            msgsetloc(0, "* Need a lift?/", "obj_dw_church_cupstack_slash_Step_0_gml_89_0");
            msgnext("\\C2 ");
            d_make();
            myinteract = 4;
        }
        if (myinteract == 4 && global.choice != -1)
        {
            if (global.choice == 0)
            {
                k_d(2);
                scr_speaker("no_name");
                msgsetloc(0, "* All board!/%", "obj_dw_church_cupstack_slash_Step_0_gml_100_0");
                d_make();
                myinteract = 5;
            }
            if (global.choice == 1)
            {
                k_d();
                myinteract = 0;
                global.interact = 0;
            }
        }
        if (myinteract == 5 && !d_ex())
            other.con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        with (obj_mainchara)
            cutscene = true;
        global.interact = 1;
        var targheight = stack;
        if (!extended)
            targheight = minstack;
        scr_lerpvar("stacksize", stacksize, targheight, 6, 2, "out");
    }
    var jumptime = 8;
    var jumpheight = 16;
    var starttime = 10;
    if (timer == 1)
    {
        with (obj_darkness_overlay)
            scr_lerpvar("highlightalpha", highlightalpha, 0, 6);
    }
    if (timer == starttime)
    {
        with (obj_caterpillarchara)
            follow = false;
        with (susie)
        {
            fun = 1;
            scr_jump_to_point(other.x - 10, height - 84, jumpheight, jumptime, true);
            scr_delay_var("sprite_index", 431, jumptime);
            ignoredepth = true;
            scr_delay_var("depth", other.depth - 3, jumptime);
        }
    }
    if (timer == (starttime + (jumptime * 1)))
    {
        with (kris)
        {
            fun = 1;
            scr_jump_to_point((other.x - 10) + 6, height - 142, jumpheight * 2, jumptime, true);
            scr_delay_var("sprite_index", 254, jumptime);
            ignoredepth = true;
            scr_delay_var("depth", other.depth - 2, jumptime);
        }
    }
    if (timer == (starttime + (jumptime * 2)))
    {
        with (ralsei)
        {
            fun = 1;
            scr_jump_to_point((other.x - 10) + 4, height - 214, jumpheight * 3, jumptime, true);
            scr_delay_var("sprite_index", 361, jumptime);
            scr_delay_var("depth", other.depth - 1, jumptime);
            ignoredepth = true;
        }
    }
    if (timer == (7 + (jumptime * 3) + 4))
    {
        kris.visible = false;
        with (obj_caterpillarchara)
            visible = false;
        onboard = true;
    }
    if (timer == (7 + (jumptime * 3) + 1 + 15))
    {
        var targheight = maxstack;
        if (extended)
            targheight = minstack;
        var style = -2;
        if (extended)
            style = -1;
        var inout = "out";
        if (extended)
            inout = "in";
        scr_lerpvar("stacksize", stacksize, targheight, 40, style, inout);
        if (dofade)
            mus_fade(global.currentsong[1], 30);
    }
    var earlyfade = 32;
    if (extended)
        earlyfade = 0;
    if (timer == ((7 + (jumptime * 3) + 1 + 15 + 40) - 10 - earlyfade))
        instance_create_depth(0, 0, 0, obj_fadeout);
    if (timer == ((7 + (jumptime * 3) + 1 + 15 + 40 + 10) - round(earlyfade / 2)))
    {
        if (dofade)
            snd_free_all();
        global.entrance = 14;
        global.interact = 3;
        instance_create(0, 0, obj_persistentfadein);
        global.interact = 7;
        global.tempflag[93] = 1;
        room_goto(roomtarg);
    }
}
if (con == 10)
{
    var jumptime = 8;
    var jumpheight = 16;
    var starttime = 26;
    timer++;
    if (timer == 1)
    {
        global.tempflag[93] = 0;
        with (obj_darkness_overlay)
        {
            other.remalpha = highlightalpha;
            highlightalpha = 0;
        }
        global.facing = 0;
        with (obj_mainchara)
        {
            visible = false;
            freeze = true;
            cutscene = true;
            sprite_index = spr_krisd_dark;
        }
        with (obj_caterpillarchara)
        {
            follow = false;
            visible = false;
        }
        with (cupmarker)
        {
            var roomw = room_width;
            var roomh = room_height;
            var vieww = view_wport[0];
            var viewh = view_hport[0];
            var camx = clamp(x - floor((vieww / 2) - (sprite_width / 2)), 0, roomw - vieww);
            var camy = clamp(y - floor((viewh / 2) - (sprite_height / 2)), 0, roomh - viewh);
            var clamper = instance_place(x, y, obj_camera_clamper);
            if (i_ex(clamper))
            {
                var lclamp = 0;
                var rclamp = roomw - vieww;
                var uclamp = 0;
                var dclamp = roomh - viewh;
                if (clamper.xmin != -4)
                    lclamp = clamper.xmin;
                if (clamper.xmax != -4)
                    rclamp = clamper.xmax;
                if (clamper.ymin != -4)
                    uclamp = clamper.ymin;
                if (clamper.ymax != -4)
                    dclamp = clamper.ymax;
                camx = clamp(camx, lclamp, rclamp);
                camy = clamp(camy, uclamp, dclamp);
            }
            camerax_set(camx);
            cameray_set(camy);
        }
        var targheight = maxstack;
        if (extended)
        {
            stacksize = minstack;
        }
        else
        {
            stacksize = maxstack;
            targheight = minstack;
        }
        onboard = true;
        var inout = "in";
        if (extended)
            inout = "out";
        var style = -2;
        if (extended)
            style = -1;
        scr_lerpvar("stacksize", stacksize, targheight, 20, style, inout);
    }
    if (timer == (starttime + (jumptime * 0)))
    {
        with (obj_darkness_overlay)
            scr_lerpvar("highlightalpha", highlightalpha, other.remalpha, 30);
        debug_print("arrived!");
        with (obj_caterpillarchara)
        {
            follow = false;
            fun = true;
            visible = true;
        }
        with (obj_mainchara)
            visible = true;
        setxy((x - 10) + 6, height - 142, kris);
        setxy((x - 10) + 4, height - 214, ralsei);
        setxy(x - 10, height - 84, susie);
        onboard = false;
        with (ralsei)
        {
            var targ = other.ramarker;
            onboard = false;
            scr_jump_to_point(targ.x, targ.y, jumpheight, jumptime, true);
            snd_play_delay(snd_noise, jumptime, 0.7, 1.1);
        }
    }
    if (timer == (starttime + (jumptime * 1)))
    {
        with (kris)
        {
            var targ = other.cupmarker;
            onboard = false;
            scr_jump_to_point(targ.x, targ.y, jumpheight * 2, jumptime, true);
            snd_play_delay(snd_noise, jumptime, 0.7, 1.05);
        }
    }
    if (timer == (starttime + (jumptime * 2)))
    {
        with (susie)
        {
            var targ = other.sumarker;
            onboard = false;
            scr_jump_to_point(targ.x, targ.y, jumpheight * 3, jumptime, true);
            snd_play_delay(snd_noise, jumptime, 0.7, 1);
        }
    }
    if (timer == (starttime + (jumptime * 3)))
    {
        scr_lerpvar("stacksize", stacksize, stack, 8, -1, "out");
        with (kris)
        {
            freeze = false;
            cutscene = false;
            fun = false;
            ignoredepth = false;
        }
    }
    if (timer == (starttime + (jumptime * 3) + 4))
    {
        scr_caterpillar_interpolate("all");
        with (obj_caterpillarchara)
        {
            follow = true;
            fun = false;
            ignoredepth = false;
        }
        timer = 0;
        con = 0;
        global.interact = 0;
    }
}

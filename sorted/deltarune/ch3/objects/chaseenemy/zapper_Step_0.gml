if (con == 0)
{
    if (froze == 0)
    {
        animindex += 0.25;
        facing = walkcycle;
        if (animindex >= 2 && animindex <= 6)
        {
            if (walkcycle == 0)
                hspeed = lerp(hspeed, -4, 0.25);
            if (walkcycle == 1)
                hspeed = lerp(hspeed, 4, 0.25);
        }
        else
        {
            hspeed = lerp(hspeed, 0, 0.5);
        }
        if (animindex < 1)
        {
            if (x < leftrange)
                walkcycle = 1;
            if (x > rightrange)
                walkcycle = 0;
        }
        var radius = 120;
        if (global.plot <= 128)
            radius = 240;
        var detectmod = 60;
        if (facing == 0)
            detectmod = -detectmod;
        var inst = collision_rectangle((x - radius) + detectmod, y - (radius * 0.5), x + radius + detectmod, y + (radius * 0.5), obj_mainchara, 0, 0);
        if (!i_ex(inst))
            inst = collision_rectangle((x - radius) + detectmod, y - (radius * 0.5), x + radius + detectmod, y + (radius * 0.5), obj_caterpillarchara, 0, 0);
        if (i_ex(inst))
        {
            snd_play(snd_b);
            excl = instance_create((x - 40) + (facing * 80), y - 160, obj_excblcon);
            con = -1;
            var pausetime = 5;
            scr_lerpvar("hspeed", hspeed, 0, pausetime);
            scr_delay_var("con", 1, pausetime);
        }
        if (global.interact != 0 && con == 0)
        {
            froze = true;
            memspeed = speed;
            memhspeed = hspeed;
            memvspeed = vspeed;
            memimage_speed = image_speed;
            speed = 0;
            hspeed = 0;
            vspeed = 0;
            image_speed = 0;
        }
    }
    if (froze == true)
    {
        if (global.interact == 0)
        {
            froze = false;
            speed = memspeed;
            hspeed = memhspeed;
            vspeed = memvspeed;
            image_speed = memimage_speed;
        }
    }
}
if (con == -1)
{
    if (!froze)
    {
        if (animindex > 1)
            animindex += 0.25;
    }
}
if (con == 1)
{
    if (froze == 0)
    {
        animindex += 0.25;
        targx = x;
        targy = y;
        if (i_ex(obj_mainchara))
        {
            targx = obj_mainchara.x + 19;
            targy = obj_mainchara.y + 70;
        }
        if (speed < 8)
            speed = lerp(speed, 8, 0.25);
        move_towards_point(targx, targy, speed);
        if (global.interact != 0)
        {
            froze = 1;
            memspeed = speed;
            speed = 0;
        }
        var inst = collision_rectangle(x - 50, y - 14, x + 50, y + 14, obj_mainchara, 0, 0);
        if (!i_ex(inst))
            inst = collision_rectangle(x - 50, y - 14, x + 50, y + 14, obj_caterpillarchara, 0, 0);
        if (i_ex(inst))
        {
            global.interact = 1;
            debug_print("gotcha");
            speed = 0;
            con = 2;
        }
        if (targx < x)
            facing = 0;
        else
            facing = 1;
    }
    else if (global.interact == 0)
    {
        froze = 0;
        speed = memspeed;
    }
}
if (con == 2)
{
    var cont = 0;
    if (animindex > 2)
        animindex += 0.25;
    else
        cont = 1;
    if (cont == 1)
    {
        if (facing == 0)
            global.facing = 1;
        else
            global.facing = 3;
        con = 3;
    }
}
if (con == 3)
{
    var normal = true;
    if (room == room_dw_b3bs_zapper_a && global.plot <= 128)
    {
        normal = false;
        scr_speaker("Zapper");
        if (global.flag[1051] == 0)
            msgsetloc(0, "* What the -- you's ain't allowed in here!/%", "obj_chaseenemy_zapper_slash_Step_0_gml_171_0");
        else
            msgsetloc(0, "* Ooo what the!/%", "obj_chaseenemy_zapper_slash_Step_0_gml_175_0");
        d_make();
        con = 41;
    }
    if (room == room_dw_b3bs_zapper_c)
    {
        normal = false;
        global.msc = 1312;
        scr_text(global.msc);
        d_make();
        con = 50;
    }
    if (normal)
    {
        global.msc = 1280;
        scr_text(global.msc);
        d_make();
        con = 4;
    }
}
if (con == 20)
{
    scr_speaker("Zapper");
    msgsetloc(0, "* What the -- security!/%", "obj_chaseenemy_zapper_slash_Step_0_gml_205_0");
    con++;
    if (room == room_dw_b3bs_zapper_c)
    {
        msgsetloc(0, "* What!? WHAT DID YOU SAY!?/", "obj_chaseenemy_zapper_slash_Step_0_gml_210_0");
        msgnextloc("* In that case^1, you should be with the other cheaters!/%", "obj_chaseenemy_zapper_slash_Step_0_gml_211_0");
        con = 41;
    }
    global.flag[1051]++;
    d_make();
}
if (con == 21 && !d_ex())
{
    var batmarker = scr_dark_marker(round(x - 62), round(y - 130), mysprite);
    batmarker.image_index = animindex;
    batmarker.image_speed = 0;
    global.flag[54] = encounterflag;
    scr_battle(112, 0, batmarker, 0, 0);
    con = 22;
    instance_destroy();
}
if (con == 40)
{
    con++;
    scr_speaker("Zapper");
    msgsetloc(0, "* Ah^1, alright. Then let me help you out./%", "obj_chaseenemy_zapper_slash_Step_0_gml_236_0");
    if (room == room_dw_b3bs_zapper_a)
        msgsetloc(0, "* Send 'em to the cage!/%", "obj_chaseenemy_zapper_slash_Step_0_gml_240_0");
    if (room == room_dw_b3bs_zapper_c)
    {
        msgsetloc(0, "* Kris..^1. we of all things know when you're telling a lie!/%", "obj_chaseenemy_zapper_slash_Step_0_gml_245_0");
        con = 21;
    }
    d_make();
}
if (con == 41 && !d_ex())
{
    con++;
    if (roomtarg == 156)
    {
        if (room == room_dw_b3bs_zapper_a)
            roomtarg = 177;
        if (room == room_dw_b3bs_zapper_b)
            roomtarg = 181;
    }
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = roomtarg;
}
if (con == 50)
{
}
if (con == 51 && !d_ex())
{
    x = xstart;
    y = ystart;
    con = 0;
    global.interact = 0;
}
scr_depth();

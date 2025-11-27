scr_populatechars();
if (!init)
{
    if (makecage)
    {
        var pos = findspriteinfo(spr_dw_church_steelstaff);
        blackoverlay = instance_create(pos.x, pos.y, obj_dw_church_steelstaff);
    }
    if (global.flag[891] == 1)
    {
        with (instance_create(200, 120, obj_church_piano_hint))
        {
            hint = "1315";
            hintno = 0;
            hintslots = 1;
            range = 1;
            createlight = false;
            alpha = 1;
            active = 1;
            depth = 49999;
        }
    }
    if (global.flag[886] == 1)
    {
        with (instance_create(440, 120, obj_church_piano_hint))
        {
            hint = "3355";
            hintno = 1;
            hintslots = 1;
            range = 1;
            createlight = false;
            alpha = 1;
            active = 1;
            depth = 49999;
        }
    }
    init = 1;
}
if (con == 0)
{
    var trig = 0;
    with (obj_church_piano_playable)
    {
        if (solved)
            trig = 1;
    }
    if (trig == 1)
    {
        global.flag[892] = 1;
        timer = 0;
        snd_play(snd_sparkle_gem);
        var doomtime = 30;
        var style = 2;
        var kind = "out";
        with (obj_church_piano_playable)
            forceend = 1;
        with (blackoverlay)
            instance_destroy();
        with (obj_church_piano_hint)
        {
            scr_lerpvar("alpha", 1, 0, doomtime, style, kind);
            scr_doom(id, doomtime);
        }
        with (obj_church_piano_playable)
        {
            dontresetproperly = true;
            dontdrawmenu = true;
        }
        con = 1;
    }
}
if (con == 1)
{
    global.interact = 1;
    timer++;
    if (timer == 15)
    {
        with (obj_ch4_DCA08B)
            con = 0;
        con = 2;
        timer = 0;
    }
}
if (rhint == 0)
{
    if (obj_church_piano_playable.con > 0)
        rhint = 1;
}
if (rhint == 1)
{
    if (obj_church_piano_playable.con == 0 && obj_church_piano_playable.solved == 0 && global.interact == 0)
    {
        if (obj_church_piano_playable.notesplayed == true)
        {
            global.interact = 1;
            rhinttimer = 0;
            rhint = 2;
            global.facing = 3;
            ralsei.fun = true;
            ralsei.sprite_index = spr_ralsei_right;
            susie.fun = true;
            susie.sprite_index = spr_susie_left_dw;
        }
        else
        {
            rhint = 0;
        }
    }
}
if (rhint == 2)
{
    rhinttimer++;
    if (rhinttimer == 10)
    {
        rhint = 3;
        if (hinttoget == 0)
        {
            if (global.flag[893] == 0)
            {
                scr_speaker("ralsei");
                msgsetloc(0, "\\EQ* Hmm..^1. I wonder if we need to play something specific?/", "obj_dw_church_pianopuzzle_slash_Step_0_gml_143_0");
                msgnextloc("\\EQ* Perhaps there's a hint somewhere.../", "obj_dw_church_pianopuzzle_slash_Step_0_gml_144_0");
                scr_anyface_next("susie", "K");
                msgnextloc("\\EK* ..^1. wait^1, it's a puzzle? Thought Kris was just jamming./%", "obj_dw_church_pianopuzzle_slash_Step_0_gml_146_0");
                global.flag[893] = 1;
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E7* Dude^1, what if you just smashed all the keys?/", "obj_dw_church_pianopuzzle_slash_Step_0_gml_152_0");
                msgnextloc("\\EA* That'll probably work^1, right?/%", "obj_dw_church_pianopuzzle_slash_Step_0_gml_153_0");
                global.flag[893] = 1.1;
            }
        }
        if (hinttoget == 1)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\E6* ..^1. Looks like the music is incomplete./", "obj_dw_church_pianopuzzle_slash_Step_0_gml_160_0");
            msgnextloc("\\E2* Maybe we need another hint...?/", "obj_dw_church_pianopuzzle_slash_Step_0_gml_161_0");
            scr_anyface_next("susie", "2");
            msgnextloc("\\E2* Or^1, maybe you just gotta play something cooler./%", "obj_dw_church_pianopuzzle_slash_Step_0_gml_163_0");
        }
        d_make();
    }
}
if (rhint == 3 && !d_ex())
{
    rhint = 999;
    if (global.flag[893] == 1)
        rhint = 0;
    global.facing = 0;
    global.interact = 0;
    ralsei.fun = false;
    susie.fun = false;
}

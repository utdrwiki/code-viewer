if (scr_debug())
{
    if (loccheck)
    {
        loccheck = false;
        var pos = scr_heromarker("kris", "loopend");
        if (obj_mainchara.x < pos[0])
        {
            setxy(pos[0], pos[1], 1049);
            setxy(pos[0], pos[1], 1235);
            scr_caterpillar_interpolate("all");
        }
    }
}
if (!init)
{
    with (obj_markerAny)
    {
        if (image_index == 1)
        {
            if (distance_to_object(obj_mainchara) < 4)
                obj_mainchara.nudgey = -20;
        }
    }
    prophecy[0] = instance_create(720, 1540, obj_dw_church_prophecy);
    var gen = scr_genmarker("prop1");
    setxy(gen.x + 150, gen.y + 90, prophecy[0]);
    prophecy[1] = instance_create(3220, 780, obj_dw_church_prophecy);
    gen = scr_genmarker("prop2");
    setxy(gen.x + 150, gen.y + 90, prophecy[1]);
    prophecy[0].extflag = "main1";
    prophecy[1].extflag = "main2";
    with (obj_dw_church_prophecy)
    {
        depth = 699990;
        fade_edges = true;
    }
    if (makesolid)
    {
        var pos = scr_heromarker(undefined, "nogo");
        with (instance_create(pos[0], pos[1], obj_solidblock))
            scr_sizeexact(pos[2].sprite_width, pos[2].sprite_height);
    }
    scr_populatechars();
    init = 1;
}
var prophecyactive = scr_trigcheck("propactive");
roomglow.active = prophecyactive;
with (obj_dw_church_prophecy)
    active = prophecyactive;
if (cutscene == 0)
{
    if (scr_trigcheck("line1"))
    {
        global.plot = 126;
        scr_speaker("susie");
        msgsetloc(0, "\\E0* Hey^1, what're these..^1. word things we keep seeing?/", "obj_dw_church_intro_guei_slash_Step_0_gml_102_0");
        scr_anyface_next("ralsei", "0");
        msgnextloc("\\E0* That's.../", "obj_dw_church_intro_guei_slash_Step_0_gml_104_0");
        msgnextloc("\\E5* ..^1. the prophecy^1, Susie./%", "obj_dw_church_intro_guei_slash_Step_0_gml_105_0");
        cutscene = 1;
        scr_walkntalk_start(1);
    }
}
if (cutscene == 1 && !d_ex())
{
    scr_walkntalk_stop();
    cutscene = 2;
}
if (cutscene == 2)
{
    if (scr_trigcheck("line2"))
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E6* Isn't this..^1. kinda different from the prophecy you told us?/", "obj_dw_church_intro_guei_slash_Step_0_gml_122_0");
        scr_anyface_next("ralsei", "Q");
        msgnextloc("\\EQ* ..^1. Yes^1, I.../", "obj_dw_church_intro_guei_slash_Step_0_gml_124_0");
        msgnextloc("\\E5* ..^1. My version was..^1. more of..^1. a summary./%", "obj_dw_church_intro_guei_slash_Step_0_gml_125_0");
        if (scr_flag_get(203) == 1)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Damn^1, looks kinda cool. Too bad I skipped hearing it./", "obj_dw_church_intro_guei_slash_Step_0_gml_130_0");
            msgnextloc("\\E2* I mighta actually liked it./", "obj_dw_church_intro_guei_slash_Step_0_gml_131_0");
            scr_anyface_next("ralsei", "Q");
            msgnextloc("\\EQ* ..^1. Yeah.../%", "obj_dw_church_intro_guei_slash_Step_0_gml_133_0");
        }
        scr_walkntalk_start(1);
        global.plot = 127;
        cutscene = 3;
    }
}
if (cutscene == 3 && !d_ex())
{
    scr_walkntalk_stop();
    cutscene++;
}
scr_walkntalk_action();
if (npccon == 0)
{
    with (bibliox)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("bibliox");
            msgsetloc(0, "* ..^1. mumble^1, mumble.../", "obj_dw_church_intro_guei_slash_Step_0_gml_161_0");
            msgnextloc("* ..^1. o^1, m'cup^1, m'lad..^1. Listen..^1. to my long tale.../", "obj_dw_church_intro_guei_slash_Step_0_gml_162_0");
            msgnextloc("* A is for Apple..^1. B..^1. is for Bee..^1. C..^1. is for.../%", "obj_dw_church_intro_guei_slash_Step_0_gml_163_0");
            if (talked)
            {
                other.ncon = 1;
                scr_speaker("bibliox");
                msgsetloc(0, "* ...N is for  Nu..^1. mumble^1, mumble.../%", "obj_dw_church_intro_guei_slash_Step_0_gml_169_0");
            }
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract > 3 && d_ex())
        {
            var trig = 0;
            if (!i_ex(obj_writer))
                trig = 1;
            with (obj_writer)
            {
                if (halt)
                    trig = 1;
            }
            if (!trig)
                marker.image_index += 0.125;
        }
        if (myinteract == 999 && !d_ex())
        {
            other.ncon = 0;
            myinteract = 0;
            marker.image_index = 0;
            global.interact = 0;
        }
    }
    with (cup)
    {
        marker.image_index += 0.25;
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("cup");
            msgsetloc(0, "* I came here to seek the sage's advice on my journey./", "obj_dw_church_intro_guei_slash_Step_0_gml_202_0");
            msgnextloc("* Surely this legend shall make me a righteous hero./%", "obj_dw_church_intro_guei_slash_Step_0_gml_203_0");
            if (talked)
            {
                scr_speaker("cup");
                msgsetloc(0, "* If it doesn't make me a righteous hero^1, then it really sucks./%", "obj_dw_church_intro_guei_slash_Step_0_gml_208_0");
            }
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            marker.image_index = 0;
            global.interact = 0;
        }
    }
}
if (actreminder == 0)
{
    if (global.flag[1639] != 0)
    {
        actreminder = 99;
    }
    else if (scr_trigcheck("actReminder"))
    {
        global.flag[1639] = 1;
        global.interact = 1;
        actreminder = 1;
        scr_speaker("ralsei");
        msgsetloc(0, "\\E2* (By the way Kris^1, a reminder that we can ACT independently too!)/", "obj_dw_church_intro_guei_slash_Step_0_gml_238_0");
        msgnextloc("\\EJ* (Just choose S-Action or R-Action from our MAGIC Menu in battle!)/%", "obj_dw_church_intro_guei_slash_Step_0_gml_239_0");
        d_make(undefined, undefined, undefined, 1);
    }
}
if (actreminder == 1 && !d_ex())
{
    global.interact = 0;
    actreminder = 99;
}

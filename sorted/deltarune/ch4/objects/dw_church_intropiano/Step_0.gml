scr_populatechars();
if (init == 0)
{
    if (global.plot < 110)
    {
        with (obj_doorAny)
        {
            if (doorEntrance == 5)
                doorFadeMusic = true;
        }
        scr_musicer("darkchurch_intro.ogg");
    }
    init = 1;
}
if (makedark)
{
    makedark = 0;
    instance_create(x, y, obj_darkness_overlay);
    if (i_ex(susie))
    {
        slight = instance_create(susie.x, susie.y, obj_light_following);
        slight.target = susie;
        slight.xoff = 26;
        slight.yoff = 46;
    }
    if (i_ex(ralsei))
    {
        rlight = instance_create(ralsei.x, ralsei.y, obj_light_following);
        rlight.target = ralsei;
        rlight.xoff = 18;
        rlight.yoff = 40;
    }
    if (i_ex(kris))
    {
        klight = instance_create(kris.x, kris.y, obj_light_following);
        klight.target = kris;
        klight.xoff = 18;
        klight.yoff = 38;
    }
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
        global.flag[869] = 1;
        snd_play(snd_sparkle_gem);
        var doomtime = 30;
        var style = 2;
        var kind = "out";
        with (obj_church_piano_playable)
            forceend = 1;
        with (obj_tutorial_text)
            instance_destroy();
        with (obj_darkness_overlay)
            scr_lerpvar("image_alpha", 1, 0, round(doomtime * 1.5), style, kind);
        with (steelcage)
            instance_destroy();
        with (obj_floorswitch)
        {
            scr_lerpvar("image_alpha", 1, 0, doomtime, style, kind);
            scr_doom(undefined, doomtime);
        }
        with (obj_church_piano_hint)
        {
            scr_lerpvar("alpha", 1, 0, doomtime, style, kind);
            scr_doom(undefined, doomtime);
        }
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
}

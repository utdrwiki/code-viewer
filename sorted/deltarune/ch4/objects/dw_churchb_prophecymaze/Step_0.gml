if (folcon == 0)
{
    var trig = 0;
    for (var i = 0; i < array_length(followertrig); i++)
    {
        if (followertrig[i].myinteract)
            trig = 1;
    }
    if (trig)
    {
        scr_speaker("no_name");
        msgset(0, "* Talked 1x/%");
        if (talked)
        {
            scr_speaker("no_name");
            msgset(0, "* Talked 2x+/%");
        }
        talked++;
        global.interact = 1;
        d_make();
        folcon = 1;
    }
}
if (folcon == 1 && !d_ex())
{
    for (var i = 0; i < array_length(followertrig); i++)
        followertrig[i].myinteract = 0;
    folcon = 0;
    global.interact = 0;
}
with (obj_dw_church_prophecy)
    active = 1;
roomglow.active = 1;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("B")))
    {
        show = !show;
        for (var i = 0; i < array_length(followers); i++)
        {
            with (followers[i])
                visible = !other.show;
            with (followertrig[i])
                visible = other.show;
        }
    }
}
if (racon == 0)
{
    if (scr_trigcheck("ralmove1"))
    {
        sucon = 1;
        racon = 1;
        with (ra1)
        {
            sprite_index = spr_ralsei_walk_left_sad_subtle;
            var pos = scr_heromarker("ralsei", "pos2");
            var dist = max(round(point_distance(x, y, pos[0], pos[1]) / 6), 1);
            scr_lerpvar("x", x, pos[0], dist);
            scr_lerpvar("y", y, pos[1], dist);
            image_speed = 0.125;
            scr_doom(id, dist);
            scr_lerpvar("image_alpha", 5, 0, dist, 2, "out");
        }
    }
}
if (racon == 1)
{
    if (scr_trigcheck("ralmove2"))
    {
        sucon = 5;
        racon = 2;
        with (ra2)
        {
            sprite_index = spr_ralsei_walk_left_sad_subtle;
            var pos = scr_heromarker("ralsei", "pos4");
            var dist = max(round(point_distance(x, y, pos[0], pos[1]) / 6), 1);
            scr_lerpvar("x", x, pos[0], dist);
            scr_lerpvar("y", y, pos[1], dist);
            image_speed = 0.125;
        }
    }
}
if (i_ex(ra1))
{
    if (racon == 1)
        scr_depth(ra1);
}
if (sucon == 1)
{
    scr_speaker("susie");
    msgset(0, "* Ralsei!/%");
    scr_walkntalk_start();
    sucon = 2;
}
if (sucon == 2 && !d_ex())
{
    scr_walkntalk_stop();
    sucon++;
}
if (sucon == 5)
{
    scr_speaker("susie");
    msgset(0, "* Hey^1, Ralsei^1! HEY!/%");
    scr_walkntalk_start();
    sucon = 6;
}
if (sucon == 6 && !d_ex())
{
    scr_walkntalk_stop();
    sucon++;
}
scr_walkntalk_action();

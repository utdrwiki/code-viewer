mycolor = hexcolor(#200000);
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (active && con == 0)
{
    with (obj_mainchara_board)
    {
        canfreemove = false;
        cantleave = true;
        facing = 2;
    }
}
if (active == 1 && obj_board_camera.con == 0)
{
    if (con == 0)
    {
        snd_pause(global.currentsong[1]);
        con = 1;
        musfadein = 1;
    }
    if (con == 1)
    {
        var timespace = 150;
        timer++;
        var dofade = 0;
        var count = 0;
        checkskip(10 + (timespace * count), 10 + (timespace * (count + 1)));
        count++;
        if (timer == (10 + (timespace * 0)))
        {
            reflate = 1;
            deflate = 1;
            var tetalk = stringsetloc("Ah.", "obj_b1mailroom_slash_Step_0_gml_33_0");
            scr_couchtalk(tetalk, "tenna", 2, timespace);
        }
        checkskip(10 + (timespace * count), 10 + (timespace * (count + 1)));
        count++;
        if (timer == (10 + (timespace * 1)))
        {
            deflate = 1;
            var tetalk = stringsetloc("There is no mail.", "obj_b1mailroom_slash_Step_0_gml_39_0");
            scr_couchtalk(tetalk, "tenna", 2, timespace);
        }
        checkskip(10 + (timespace * count), 10 + (timespace * (count + 1)));
        count++;
        if (timer == (10 + (timespace * 2)))
        {
            deflate = 1;
            dofade = 1;
            var tetalk = stringsetloc("Mike... Get rid of that room. We don't need it.", "obj_b1mailroom_slash_Step_0_gml_45_0");
            scr_couchtalk(tetalk, "tenna", 2, timespace);
        }
        checkskip(10 + (timespace * count), 10 + (timespace * (count + 1)));
        count++;
        if (timer == (10 + (timespace * 3)))
        {
            deflate = 1;
            var tetalk = stringsetloc("We haven't gotten any mail. It's fine.", "obj_b1mailroom_slash_Step_0_gml_51_0");
            scr_couchtalk(tetalk, "tenna", 2, timespace);
        }
        checkskip(10 + (timespace * count), 10 + (timespace * (count + 1)));
        count++;
        if (timer == (10 + (timespace * 4)))
        {
            deflate = 1;
            var tetalk = stringsetloc("It's all fine, we don't need a mail guy.", "obj_b1mailroom_slash_Step_0_gml_57_0");
            scr_couchtalk(tetalk, "tenna", 2, timespace);
        }
        checkskip(10 + (timespace * count), 10 + (timespace * (count + 1)));
        count++;
        if (timer == (10 + (timespace * 5)))
        {
            if (button3_h())
                safe_delete(obj_couchwriter);
            with (obj_mainchara_board)
            {
                facing = 0;
                canfreemove = true;
                cantleave = false;
            }
        }
        if (dofade)
        {
            scr_delay_var("fadealpha", 0.2, 10);
            scr_delay_var("fadealpha", 0.4, 20);
            scr_delay_var("fadealpha", 0.6000000000000001, 30);
            scr_delay_var("fadealpha", 0.8, 40);
            scr_delay_var("fadealpha", 1, 50);
        }
    }
    if (deflate == 1)
    {
        deflate = 0;
        with (tenna)
            scr_lerpvar("image_yscale", image_yscale, image_yscale * 0.95, 30, 2, "out");
        with (tenna)
            scr_lerpvar("image_xscale", image_xscale, image_xscale * 1.05, 30, 2, "out");
    }
}
if (musfadein == 1 && obj_board_camera.shift != "none")
{
    musfadein = 2;
    snd_resume(global.currentsong[1]);
    reflate = 1;
}
if (reflate == 1)
{
    with (obj_lerpvar)
    {
        if (target == other.tenna)
            instance_destroy();
    }
    reflate = 0;
    with (tenna)
        scr_lerpvar("image_yscale", image_yscale, 2, 30, -2, "out");
    with (tenna)
        scr_lerpvar("image_xscale", image_xscale, 2, 15);
}

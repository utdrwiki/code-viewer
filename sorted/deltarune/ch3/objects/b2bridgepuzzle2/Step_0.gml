scr_board_populatevars();
scr_gameshow_populatevars();
if (puz == 0)
{
    with (obj_board_event_bridgepuzzle)
    {
        if (puzzleid == 1)
            other.puz = id;
    }
}
solved = puz.solved;
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        with (obj_mainchara_board)
            controlled = false;
        susie.controlled = true;
        ralsei.follow = false;
        kris.camera = true;
        con = 1;
        timer = 0;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
            scr_pathfind_to_point("kris", 9, 4, 2);
        if (timer == 10)
        {
            var ratalk = stringsetloc("Oh! Look, grey blocks!", "obj_b2bridgepuzzle2_slash_Step_0_gml_31_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (timer == 90)
        {
            var ratalk = stringsetloc("Kris, let's solve this puzzle together!", "obj_b2bridgepuzzle2_slash_Step_0_gml_36_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (timer == 140)
        {
            with (kris)
            {
                takephoto = false;
                canfreemove = false;
                var playxround = round(x / 32) * 32;
                var playyround = round(y / 32) * 32;
                playxround -= ((camwidth / 2) * 32);
                playyround -= ((camheight / 2) * 32);
                playxround = round(playxround / 32) * 32;
                playyround = round(playyround / 32) * 32;
                mycam = instance_create(playxround, playyround, obj_board_playercamera);
                mycam.camwidth = camwidth;
                mycam.camheight = camheight;
                mycam.controllable = false;
            }
        }
        if (timer == 165)
        {
            with (obj_board_playercamera)
                remoter = true;
        }
        if (timer == 175)
        {
            with (obj_board_playercamera)
                remoter = true;
        }
        if (timer == 185)
        {
            with (obj_board_playercamera)
                remoteu = true;
        }
        if (timer == 195)
        {
            with (obj_board_playercamera)
                remoteu = true;
        }
        if (timer == 205)
        {
            with (obj_board_playercamera)
                remoteu = true;
        }
        if (timer == 215)
        {
            with (obj_board_playercamera)
                remoteu = true;
        }
        if (timer == 245)
        {
            with (obj_board_playercamera)
                event_user(1);
        }
        if (timer == 170)
        {
            var sutalk = stringsetloc("Cool, I get to do nothing.", "obj_b2bridgepuzzle2_slash_Step_0_gml_69_0");
            scr_couchtalk(sutalk, "susie", 60);
        }
        if (timer == 190)
            scr_pathfind_to_point("ralsei", 10, 3, 0);
        if (timer == 230)
            stooleup = true;
        if (solved == 1)
        {
            scr_board_gridreset();
            con = 2;
            timer = 0;
        }
    }
    if (con == 99 && obj_board_camera.con == 0)
    {
        con = 100;
        timer = 0;
    }
}
else
{
}
if (con == 2)
{
    timer++;
    if (timer == 10)
    {
        var ratalk = stringsetloc("Hahaha! We did it...!", "obj_b2bridgepuzzle2_slash_Step_0_gml_110_0");
        scr_couchtalk(ratalk, "ralsei", 2, 70);
        kris.facing = 3;
    }
    if (timer == 80)
    {
        var sutalk = stringsetloc("Heh, finally having fun?", "obj_b2bridgepuzzle2_slash_Step_0_gml_116_0");
        scr_couchtalk(sutalk, "susie", 60);
    }
    if (timer == 140)
    {
        var ratalk = stringsetloc("H-huh? Well, um...", "obj_b2bridgepuzzle2_slash_Step_0_gml_121_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
    }
    if (timer == 150)
        scr_pathfind_to_point("kris", 1, 6, 0);
    if (timer == 200)
    {
        var sutalk = stringsetloc("How 'bout we stay as these characters...", "obj_b2bridgepuzzle2_slash_Step_0_gml_130_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
    }
    if (timer == 260)
    {
        var sutalk = stringsetloc("Until there's something cool to throw?", "obj_b2bridgepuzzle2_slash_Step_0_gml_135_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
    }
    if (timer == 320)
    {
        var ratalk = stringsetloc("... okay!", "obj_b2bridgepuzzle2_slash_Step_0_gml_140_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
    }
    if (timer == 380)
        con++;
}
if (stooleup == true)
{
    var free = true;
    with (ralsei)
    {
        if (i_ex(collision_rectangle(board_tilex(10), board_tiley(3), board_tilex(10) + 16, board_tiley(3) + 16, obj_mainchara_board, 0, true)))
            free = false;
    }
    if (ralsei.canfreemove == false)
        free = false;
    if (free)
    {
        ralsei.goStoole = true;
        stooleup = false;
    }
}
if (!active && clearbridges == false)
{
    clearbridges = true;
    with (obj_board_bridge)
    {
        if (puzzleid == 1)
            instance_destroy();
    }
}

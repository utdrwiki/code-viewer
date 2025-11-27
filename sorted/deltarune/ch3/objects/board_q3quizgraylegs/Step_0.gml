scr_board_populatevars();
if (triga == 0)
{
    with (obj_board_trigger)
    {
        if (extflag == "b3quiza_up")
            other.triga = id;
    }
}
if (trigb == 0)
{
    with (obj_board_trigger)
    {
        if (extflag == "b3quiza_right")
            other.trigb = id;
    }
}
if (run == 0)
{
    runtimer++;
    if (runtimer == 90)
        run = 1;
    with (triga)
    {
        if (instance_place(x, y, obj_mainchara_board))
            other.run = 1;
    }
    with (trigb)
    {
        if (instance_place(x, y, obj_mainchara_board))
            other.run = 1;
    }
    if (run == 1)
    {
        snd_play(snd_defeatrun);
        debug_print("oh no~!");
    }
}
if (run == 1)
{
    if (kris.x > 330)
        vspeed = -2;
    else
        hspeed = 2;
    friction = -0.35;
    run = 2;
}
if (run == 2)
{
    image_speed = abs(speed * 0.08);
    if (x > board_tilex(14) || y < board_tiley(-1))
    {
        debug_print("bye bye");
        instance_destroy();
    }
}
if (i_ex(obj_board_grayregion) && con == 0)
{
    var sx1 = legregion.bbox_left;
    var sx2 = legregion.bbox_right;
    var sy1 = legregion.bbox_top;
    var sy2 = legregion.bbox_bottom;
    var dx1 = obj_board_grayregion.bbox_left;
    var dx2 = obj_board_grayregion.bbox_right;
    var dy1 = obj_board_grayregion.bbox_top;
    var dy2 = obj_board_grayregion.bbox_bottom;
    if (rectangle_in_rectangle(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy2) == 1)
    {
        sprite_index = spr_board_quizchaser_legless;
        con = 1;
        timer = 0;
        snd_stop(snd_defeatrun);
        hspeed = 0;
        vspeed = 0;
        friction = 0;
        run = 999;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 16)
        scr_lerpvar("fakey", 0, 16, 5, 1, "in");
    if (timer == 21)
        snd_play_x(snd_impact_bc, 0.7, 0.8);
    fakey = clamp(fakey, 0, 16);
}
var doquiz = 0;
if (con > 0)
{
    with (legregion)
    {
        if (place_meeting(x, y, obj_mainchara_board))
        {
            var _player = instance_place(x, y, obj_mainchara_board);
            if (_player.name == "kris")
                doquiz = 1;
        }
    }
}
if (doquiz == 1)
{
    quiz = instance_create(0, 0, obj_quizsequence);
    quiz.depth = 900000;
    quiz.extflag = "legless";
    scr_quizsetup(3, quizno);
    quiz.grandaddy = daddy;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            quizmode = true;
    }
    with (obj_board_parent)
        active = false;
    global.interact = 1;
    var afterimage = scr_board_marker(x, y, sprite_index, 0, depth, image_xscale);
    scr_doom(afterimage, 15);
    instance_destroy();
}
scr_depth_board();

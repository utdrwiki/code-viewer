scr_depth_board();
if (y != 224)
{
    y = lerp(y, 224, 0.25);
    y = scr_even(y);
}
if (x >= 480)
{
    x = 480;
    stuck = true;
}
if (x <= 128)
{
    x = 128;
    stuck = true;
}
if (stuck == false)
{
    var kris = -4;
    var susie = -4;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            kris = id;
        if (name == "susie")
            susie = id;
    }
    if (place_meeting(x, y, kris) || place_meeting(x, y, susie))
    {
        if (splatside == 1)
            x += 4;
        else
            x -= 4;
    }
}
if (obj_board_camera.con != 0 || instance_exists(obj_gameover_minigame))
{
    scr_play_recording("ralsei", "0W");
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
        {
            x = other.x;
            y = other.y;
            visible = true;
        }
    }
    instance_destroy();
}

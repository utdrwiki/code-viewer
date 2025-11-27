if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (kr_real == 0)
{
    with (obj_mainchara)
        other.kr_real = id;
}
var trigUp = 0;
var trigDown = 0;
var trigRight = 0;
var trigLeft = 0;
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (cleanup == 0)
        {
            with (kris)
            {
                if (place_meeting(x, y, obj_b2d_centertrigger))
                    other.cleanup = 1;
            }
        }
        if (obj_board_camera.board_2_maze_state == 0)
        {
            if (cleanup == 1)
            {
                trigDown = 1;
                trigLeft = 1;
                trigRight = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 1)
        {
            if (cleanup == 1)
            {
                trigDown = 1;
                trigLeft = 1;
                trigRight = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 2)
        {
            if (cleanup == 1)
            {
                trigUp = 1;
                trigDown = 1;
                trigRight = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 3)
        {
            if (cleanup == 1)
            {
                trigUp = 1;
                trigDown = 1;
                trigLeft = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 4)
        {
            if (cleanup == 1)
            {
                trigUp = 1;
                trigDown = 1;
                trigLeft = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 5)
        {
            if (cleanup == 1)
            {
                trigUp = 1;
                trigLeft = 1;
                trigRight = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 6)
        {
            if (cleanup == 1)
            {
                trigUp = 1;
                trigDown = 1;
                trigLeft = 1;
                cleanup = 2;
            }
        }
        if (obj_board_camera.board_2_maze_state == 7)
        {
            cleanup = 0;
            with (obj_board_trigger)
            {
                if (extflag == "dontfollow")
                    instance_destroy();
            }
            instance_destroy();
        }
    }
}
else
{
}
if (obj_board_camera.con != 0)
{
    if (cleanup)
    {
        cleanup = 0;
        with (obj_board_trigger)
        {
            if (extflag == "dontfollow")
                instance_destroy();
        }
    }
}
if (trigUp)
{
    with (instance_create(x, y, obj_board_trigger))
    {
        extflag = "dontfollow";
        setxy_board(3744, 1344);
        image_xscale = 4;
        image_yscale = 4;
    }
}
if (trigDown)
{
    with (instance_create(x, y, obj_board_trigger))
    {
        extflag = "dontfollow";
        setxy_board(3744, 1536);
        image_xscale = 4;
        image_yscale = 4;
    }
}
if (trigLeft)
{
    with (instance_create(x, y, obj_board_trigger))
    {
        extflag = "dontfollow";
        setxy_board(3584, 1440);
        image_xscale = 8;
        image_yscale = 4;
    }
}
if (trigRight)
{
    with (instance_create(x, y, obj_board_trigger))
    {
        extflag = "dontfollow";
        setxy_board(3840, 1440);
        image_xscale = 8;
        image_yscale = 4;
    }
}
if (scr_debug())
{
    if (active)
    {
        with (obj_board_trigger)
        {
        }
    }
}

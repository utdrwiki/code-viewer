if (tilecon == 0)
{
    if (moving == 1)
    {
        if (dir == 0)
        {
            y += 2;
            if (y >= (obj_board_anchor.y + 32))
                dir = 1;
        }
        else
        {
            y -= 2;
            if (y <= (obj_board_anchor.y - 32))
                dir = 0;
        }
    }
}
if (tilecon == 1)
{
    remmoving = obj_mainchara_board.movingnow;
    obj_mainchara_board.movingnow = 0;
    if (i_ex(obj_board_controller))
    {
        remphase = obj_board_controller.phase;
        obj_board_controller.phase = 2;
    }
    tilecon = 1.5;
}
if (tilecon == 1.5)
{
    wheel = instance_create(0, 0, obj_board_quizwheel);
    wheel.maxslices = 4;
    wheel.slicetext[0] = "ENEMY1";
    wheel.slicetext[1] = "ENEMY2";
    wheel.slicetext[2] = "ENEMY3";
    wheel.slicetext[3] = "ENEMY4";
    wheel.daddy = id;
    tilecon = -1;
}
if (tilecon == 2)
{
    marker = scr_dark_marker(x, y, sprite_index);
    image_alpha = 0;
    scr_battle(50, 0, marker, 0, 0);
    tilecon = 98;
}
if (tilecon == 98 && !i_ex(obj_battleback))
    tilecon = 99;
if (tilecon == 99)
{
    tilecon = 0;
    tiledone = 1;
    obj_board_controller.phase = 0;
    instance_destroy();
}

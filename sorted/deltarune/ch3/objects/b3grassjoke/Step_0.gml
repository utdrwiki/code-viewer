scr_board_populatevars();
scr_gameshow_populatevars();
_active = false;
if (obj_b3dock1.active || obj_b3dock2.active)
    _active = true;
if (grassjoke == 0 && _active)
{
    if (grasspullcount >= 4)
    {
        global.flag[1052] = 1;
        grassjoke = 1;
        debug_print("enough grass");
    }
}
if (grassjoke == 1)
{
    timer++;
    if (timer == 15)
    {
        global.flag[1024] = 1;
        su_real.sprite_index = su_real.rsprite;
    }
    if (timer == 95)
        tenna.bounce = 1;
    if (timer == 115)
    {
        scr_resetgameshowcharacter("susie");
        global.flag[1024] = 0;
    }
    if (timer == 155)
        tenna.bounce = 1;
    if (timer == 255)
    {
        with (obj_couchwriter)
            instance_destroy();
    }
    if (timer == 285)
        tenna.bounce = 1;
    if (timer == 300)
    {
        snd_play(snd_board_splash);
        with (obj_board_grabbablegrass)
        {
            with (instance_create(x, y, obj_board_smokepuff))
                image_blend = #CBC83D;
            instance_destroy();
        }
        with (obj_board_grabbablegrassspawner)
            instance_destroy();
        grassjoke = 2;
    }
}

scr_board_populatevars();
scr_gameshow_populatevars();
if (desertboy == 0)
{
    with (obj_board_npc)
    {
        if (extflag == "b3desert2")
            other.desertboy = id;
    }
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
        con = 1;
    if (con == 1)
    {
        timer++;
        if (timer == 1)
            tenna.bounce = 1;
        if (timer == 61)
        {
            con = 2;
            timer = 0;
        }
    }
    if (con == 50)
    {
        if (i_ex(obj_writer))
        {
            if (obj_writer.reachedend == true)
            {
                con = 51;
                timer = 0;
            }
        }
    }
    if (con == 51)
    {
        timer++;
        if (timer == 15)
        {
            tenna.bounce = 1;
            scr_shakeobj_ext(tenna, 4, 10);
        }
        if (timer == 75)
            tenna.bounce = 1;
        if (timer == 115)
        {
            with (desertboy)
            {
                instance_create(x, y, obj_board_smokepuff);
                snd_play(snd_board_splash);
                instance_destroy();
            }
            desertboy = -1;
            with (obj_board_writer)
                instance_destroy();
            with (obj_writer)
                instance_destroy();
            con = 72;
            global.interact = 0;
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = false;
        if (suwalktimer == 10)
        {
            if (susie.x < 250)
                scr_pathfind_to_point("susie", choose(5, 6), 1, 0);
            else
                scr_pathfind_to_point("susie", 1, choose(3, 4), 0);
        }
        if (suwalktimer == 25)
        {
            var rand = irandom(3);
            var targx = 1;
            var targy = 1;
            switch (rand)
            {
                case 0:
                    targx = 2;
                    targy = 4;
                    break;
                case 1:
                    targx = 5;
                    targy = choose(2, 3);
                    break;
                case 2:
                    targx = 10;
                    targy = 6;
                    break;
                case 3:
                    targx = 6;
                    targy = choose(4, 5);
                    break;
            }
            scr_pathfind_to_point("ralsei", targx, targy, 0);
            suwalk = 1;
        }
    }
}
else
{
    if (con == 72)
    {
        desertboy = instance_create(room_width, room_height, obj_board_npc);
        desertboy.extflag = "b3goodboy";
        with (desertboy)
            setxy_board(1696, 1280);
    }
    if (con > 0)
        con = 999;
    suwalktimer = 0;
    suwalk = 0;
}

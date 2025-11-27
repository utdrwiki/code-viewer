scr_board_populatevars();
scr_gameshow_populatevars();
if (mytrig == 0)
{
    with (obj_board_trigger)
    {
        if (extflag == "b3danger2")
            other.mytrig = id;
    }
}
if (active == 1)
{
    var triggered = 0;
    with (mytrig)
    {
        if (place_meeting(x, y, obj_mainchara_board))
            triggered = 1;
    }
    var reset = false;
    if (obj_board_camera.con == 0 && triggered)
    {
        var rate = 10;
        guntimer++;
        switch (guntimer)
        {
            case 10:
                mygunner1 = instance_create_board(1, 1, obj_board_shadowgunner);
                break;
            case 20:
                mygunner2 = instance_create_board(8, 1, obj_board_shadowgunner);
                break;
            case 30:
                safe_delete(mygunner1);
                break;
            case 40:
                safe_delete(mygunner2);
                break;
            case 50:
                mygunner1 = instance_create_board(3, 1, obj_board_shadowgunner);
                break;
            case 60:
                mygunner2 = instance_create_board(10, 1, obj_board_shadowgunner);
                break;
            case 70:
                safe_delete(mygunner1);
                break;
            case 80:
                safe_delete(mygunner2);
                guntimer = -1;
                break;
        }
    }
    else
    {
        reset = true;
    }
    if (i_ex(obj_board_deathevent))
        reset = true;
    if (reset)
    {
        guntimer = 0;
        safe_delete(mygunner1);
        safe_delete(mygunner2);
    }
    with (obj_board_shadowgunner)
        type = 2;
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (kris.boat == false)
        {
            with (obj_board_grabobject)
                sourcey = susie.y;
        }
        if (suwalk == 0)
        {
            ralsei.follow = 0;
            if (i_ex(mygunner1))
            {
                if (mygunner1.timer == (mygunner1.startWait + 1))
                {
                    with (susie)
                    {
                        grabbed = other.ralsei;
                        grab = 1;
                        grabmarker = instance_create(x, y, obj_board_grabobject);
                        with (grabmarker)
                        {
                            drawreticle = false;
                            snd_play(snd_board_lift);
                            grabdaddy = other.id;
                            grabbedid = other.grabbed;
                            sprite_index = grabbedid.sprite_index;
                            image_xscale = grabbedid.image_xscale;
                            image_yscale = grabbedid.image_yscale;
                            image_speed = grabbedid.image_speed;
                            sourcex = grabbedid.x;
                            sourcey = grabbedid.y;
                        }
                        with (grabbed)
                        {
                            visible = false;
                            frozen = true;
                            setxy(board_tilex(-1), board_tiley(-1));
                            if (object_index == obj_mainchara_board)
                                canfreemove = 0;
                        }
                        if (x == 480)
                            scr_pathfind_to_point("susie", board_tilex(0), y);
                        if (x == 128)
                            scr_pathfind_to_point("susie", board_tilex(11), y);
                        if (y == 288)
                            scr_pathfind_to_point("susie", choose(0, 10), 5);
                    }
                    suwalk = 1;
                }
            }
        }
    }
}
else
{
    guntimer = 0;
    made = false;
}
if (active && obj_board_camera.con != 0)
{
    susie.iframes = 0;
    guntimer = 0;
    safe_delete(mygunner1);
    safe_delete(mygunner2);
}

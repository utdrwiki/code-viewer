scr_board_populatevars();
scr_gameshow_populatevars();
if (mytrig == 0)
{
    with (obj_board_trigger)
    {
        if (extflag == "b3danger1")
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
    if (i_ex(obj_board_deathevent))
        triggered = 0;
    var reset = false;
    if (obj_board_camera.con == 0 && triggered)
    {
        var rate = 30;
        guntimer++;
        if (guntimer == (rate * 1))
        {
            safe_delete(mygunner2);
            mygunner1 = instance_create_board(1, 1, obj_board_shadowgunner);
        }
        if (guntimer == (rate * 2))
        {
            safe_delete(mygunner1);
            mygunner2 = instance_create_board(10, 6, obj_board_shadowgunner);
        }
        if (guntimer == (rate * 3))
        {
            safe_delete(mygunner2);
            mygunner1 = instance_create_board(3, 1, obj_board_shadowgunner);
        }
        if (guntimer == (rate * 4))
        {
            safe_delete(mygunner1);
            mygunner2 = instance_create_board(8, 6, obj_board_shadowgunner);
        }
        if (guntimer == ((rate * 5) - 1))
            guntimer = 0;
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
                    }
                    suwalk = 1;
                    var walkstring = "";
                    for (var i = 0; i < irandom(14); i++)
                        walkstring += "0W";
                    if (susie.y < 180)
                    {
                        for (var i = 0; i < 64; i++)
                            walkstring += "0D";
                    }
                    else
                    {
                        for (var i = 0; i < 64; i++)
                            walkstring += "0U";
                    }
                    scr_play_recording("susie", walkstring);
                }
            }
        }
    }
}
else
{
    suwalk = 0;
    guntimer = 0;
    made = false;
}
if (active && obj_board_camera.con != 0)
{
    guntimer = 0;
    safe_delete(mygunner1);
    safe_delete(mygunner2);
}

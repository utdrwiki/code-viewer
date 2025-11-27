if (init == 0)
{
    init = 1;
    if (extflag == "sitter")
    {
        sprite_index = spr_board_quizsitter;
        pacetype = 3;
        facing = 1;
    }
}
if (active == true)
{
    var boardtarget = -4;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            boardtarget = id;
    }
    if (boardtarget == -4)
        freeze = 1;
    scr_depth_board();
    if (freeze == 0)
    {
        if (hspeed > 0)
            facing = 1;
        if (hspeed < 0)
            facing = 0;
        if (triggered == false)
        {
            if (pacetype == 1)
            {
                image_speed = 0.13333333333333333;
                pacetimer++;
                if (pacetimer == 8 || pacetimer == 24 || pacetimer == 44 || pacetimer == 60)
                    direction = 180;
                if (pacetimer == 16 || pacetimer == 32 || pacetimer == 52 || pacetimer == 80)
                    direction = 0;
                if (pacetimer == 80)
                {
                    pacetimer = -8;
                    if (triggeredonstart)
                    {
                        triggered = true;
                        speed = 1;
                    }
                }
                if (pacetimer == 16)
                    speed = 2;
                if (pacetimer == 24)
                    speed = 0;
                if (pacetimer == 44)
                    speed = 2;
                if (pacetimer == 52)
                    speed = 0;
            }
            if (pacetype == 2)
            {
                pacetimer++;
                if (pacetimer == 30)
                    hspeed = 2;
                if (pacetimer == 62)
                    hspeed = 0;
                if (pacetimer == 92)
                    hspeed = -2;
                if (pacetimer == 124)
                {
                    hspeed = 0;
                    pacetimer = 0;
                }
            }
        }
        if (chasetype == 0)
        {
            if (i_ex(boardtarget))
            {
                if (triggered == false)
                {
                    if (distance_to_object(boardtarget) < alertradius)
                        triggered = true;
                }
                if (triggered && pacetype != 3)
                {
                    myspeed = lerp(myspeed, 8, 0.125);
                    move_towards_point(boardtarget.x + 16, (boardtarget.y + 32) - 8, myspeed);
                }
            }
        }
        if (chasetype == 1)
        {
            var trig = false;
            with (obj_board_trigger)
            {
                if (extflag == other.extflag)
                {
                    if (place_meeting(x, y, obj_mainchara_board))
                    {
                        var inst = instance_place(x, y, obj_mainchara_board);
                        if (inst.name == "kris")
                            trig = true;
                    }
                }
            }
            if (trig && pacetype != 3)
                triggered = true;
            if (triggered)
            {
                myspeed = lerp(myspeed, 8, 0.125);
                move_towards_point(boardtarget.x + 16, boardtarget.y + 32, myspeed);
            }
        }
        if (place_meeting(x, y, boardtarget) && global.interact == 0)
        {
            if (boardtarget.myhealth <= 0 || instance_exists(obj_gameover_minigame) || instance_exists(obj_board_deathevent))
                exit;
            quiz = instance_create(0, 0, obj_quizsequence);
            quiz.depth = 900000;
            quiz.extflag = extflag;
            if (room == room_board_1)
            {
                with (obj_tennatalkbubble)
                    instance_destroy();
                with (obj_couchwriter)
                    instance_destroy();
            }
            scr_quizsetup(3, quizno);
            quiz.grandaddy = daddy;
            boardtarget.quizmode = true;
            with (obj_board_parent)
                active = false;
            global.interact = 1;
            var afterimage = scr_board_marker(x, y, sprite_index, 0, depth, image_xscale);
            scr_doom(afterimage, 15);
            instance_destroy();
        }
        if (boardtarget.canfreemove == false || global.interact != 0)
        {
            freeze = 1;
            speed = 0;
            remspeed = myspeed;
        }
    }
    else if (boardtarget.canfreemove == true && global.interact == 0)
    {
        freeze = 0;
        myspeed = remspeed;
    }
    if (speed == 0)
        image_index = 0;
    else if (triggered)
        image_speed = speed / 16;
    else
        image_speed = speed / 8;
}
if (scr_debug() && keyboard_check_pressed(vk_f5))
    instance_destroy();

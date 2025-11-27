updatetimer++;
if (updatetimer == 2)
{
    updatetimer = 0;
    exit;
}
scr_board_enemy_step_init();
if (state == "move" && hurttimer == 0)
{
    if (movecon == 0)
    {
        movedir = choose(0, 1, 2, 3);
        repeat (4)
        {
            if (movedir == 0 && place_meeting(x + 32, y, obj_board_solid))
                movedir = 1;
            if (movedir == 1 && place_meeting(x, y - 32, obj_board_solid))
                movedir = 2;
            if (movedir == 2 && place_meeting(x - 32, y, obj_board_solid))
                movedir = 3;
            if (movedir == 3 && place_meeting(x, y + 32, obj_board_solid))
                movedir = 0;
        }
        image_speed = 0.1;
        movecon = 1;
    }
    if (movecon == 1)
    {
        movetimer++;
        var stop = 0;
        repeat (spd)
        {
            if (stop == 0)
            {
                if (movedir == 0)
                    x += 1;
                if (movedir == 1)
                    y -= 1;
                if (movedir == 2)
                    x -= 1;
                if (movedir == 3)
                    y += 1;
                if (place_meeting(x, y, obj_board_solid) || x < 128 || x > 480 || y < 64 || y > 288)
                {
                    if (movedir == 0)
                    {
                        x -= 1;
                        movedir = 2;
                    }
                    else if (movedir == 1)
                    {
                        y += 1;
                        movedir = 3;
                    }
                    else if (movedir == 2)
                    {
                        x += 1;
                        movedir = 0;
                    }
                    else if (movedir == 3)
                    {
                        y -= 1;
                        movedir = 1;
                    }
                }
                if (movedir == 0 || movedir == 2)
                {
                    if ((x % 32) == 0)
                    {
                        movecon = 0;
                        movetimer = 0;
                        stop = 1;
                    }
                }
                if (movedir == 1 || movedir == 3)
                {
                    if ((y % 32) == 0)
                    {
                        movecon = 0;
                        movetimer = 0;
                        stop = 1;
                    }
                }
            }
        }
    }
}
scr_board_enemy_sword_collision();
if (hp < 1)
{
    if (obj_board_controller.killedacatbefore == 1)
        snd_play(snd_link_secret_bad);
    obj_board_controller.killedacatbefore++;
    if (i_ex(obj_board_enemy_silentcat))
    {
        enemy = instance_find(obj_board_enemy_silentcat, 0);
        with (enemy)
        {
            wake = true;
            if (onebyone == true)
            {
                with (obj_board_enemy_silentcat)
                {
                    onebyone_timer = 22;
                    justgo = true;
                }
            }
        }
    }
}
scr_board_enemy_hurt_state();
if (hurttimer > 0)
{
    movetimer = 0;
    movecon = 0;
}
bubbletimer++;
if (bubbletimer == 1)
    image_index = 1;
if (aggressive == true && bubbletimer >= 5 && obj_board_controller.kris_object.leftdoorway == true)
{
    image_index = 0;
    bubbletimer = 0;
    bullet = instance_create_depth(x + 16, y + 20, depth - 1, obj_board_enemy_note);
    bullet.place = direction;
    bullet.rotator_target = id;
    direction += 30;
    if (type == 1)
    {
        direction += 20;
        bullet.len_speed = 7;
        bullet.type = 1;
    }
}

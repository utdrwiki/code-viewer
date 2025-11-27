scr_depth_board();
if (init == 0)
{
    if (sprite_index != spr_ralsei_board_stoolforme)
        sprite_index = custom_sprite;
    if (sprite_index == spr_ralsei_board_stoolforme)
    {
        pushsound = 131;
        stopsnd = 131;
    }
    if (extflag == "rockSecretBlockTrig")
        sprite_index = spr_board_rocksecret_moveableRock;
    if (extflag == "b2enrichmentenclosure")
        pushonce = true;
    init = 1;
    if (place_meeting(x, y, obj_board_controller.kris_object))
        jello = true;
    if (sprite_index != spr_ralsei_board_stoolforme)
        mp_grid_add_cell(global.grid, x / 32, y / 32);
}
if (jello == true)
{
    if (!place_meeting(x, y, obj_board_controller.kris_object))
        jello = false;
}
if (active == 1)
{
    var _xx, _yy;
    if (con == 1)
    {
        _xx = 0;
        _yy = 0;
        if (dir == "right")
            _xx = 32;
        if (dir == "left")
            _xx = -32;
        if (dir == "down")
            _yy = 32;
        if (dir == "up")
            _yy = -32;
        x += _xx;
        y += _yy;
        var checker = instance_place(x, y, obj_board_solid);
        if (blocked == true)
            checker = 99;
        if (checker == -4)
            checker = instance_place(x, y, obj_board_solidenemy);
        if (blockedbyplayer && checker == -4)
            checker = instance_place(x, y, obj_mainchara_board);
        if (i_ex(checker))
        {
            if ((checker.image_alpha == 0 || checker.visible == false) && checker.object_index == obj_mainchara_board)
                checker = -4;
        }
        if (!freeroam)
        {
            if (checker == -4)
                checker = collision_rectangle(132, 68, 508, 92, object_index, true, false);
            if (checker == -4)
                checker = collision_rectangle(132, 292, 508, 316, object_index, true, false);
            if (checker == -4)
                checker = collision_rectangle(132, 68, 156, 316, object_index, true, false);
            if (checker == -4)
                checker = collision_rectangle(484, 68, 508, 316, object_index, true, false);
        }
        if (checker != -4)
        {
            snd_play_pitch(stopsnd, 1.2);
            con = 99;
        }
        else
        {
            con = 2;
            for (var i = 0; i < 3; i++)
                snd_play_delay(pushsound, 1 + (2 * i), 1, 1.5 + (i / 20));
        }
        x -= _xx;
        y -= _yy;
    }
    if (con == 2)
    {
        scr_lerpvar("x", x, x + _xx, pushspeed);
        scr_lerpvar("y", y, y + _yy, pushspeed);
        pushcount++;
        timer = 0;
        con = 3;
    }
    if (con == 3)
    {
        timer++;
        if (place_meeting(x, y, obj_board_event_push1_blocktrigger) || place_meeting(x, y, obj_board_event_push2_blocktrigger))
        {
            if (pushonce == 0)
            {
                pushcount = 1;
                pushonce = 1;
            }
        }
        if (timer >= pushspeed)
        {
            waspushed++;
            con = 99;
        }
    }
    if (con == 99)
    {
        if (pushonce == 0)
            con = 0;
        if (pushonce == 1 && pushcount != 0)
            con = 199;
        else
            con = 0;
        if (sprite_index != spr_ralsei_board_stoolforme)
            mp_grid_add_cell(global.grid, x / 32, y / 32);
        global.interact = 0;
        with (obj_dw_b3bs_mysterypuzzle)
            update = true;
        with (obj_dw_b3bs_extrapuzzle)
            update = true;
        with (obj_board_enemy_deer)
            blockinteract = 0;
    }
}
else if (daddy != 0 && abandonmentissues)
{
    if (!(x >= 128 && x <= 512 && y >= 64 && y <= 320))
        instance_destroy();
}
if (ralseipush == true)
{
    ralseipush = false;
    var pusher = -4;
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            pusher = id;
    }
    if (con == 0)
    {
        x = floor(x / 32) * 32;
        y = floor(y / 32) * 32;
        switch (pusher.facing)
        {
            case 0:
                dir = "down";
                break;
            case 1:
                dir = "right";
                break;
            case 2:
                dir = "up";
                break;
            case 3:
                dir = "left";
                break;
        }
        global.interact = 1;
        con = 1;
        mp_grid_clear_cell(global.grid, x / 32, y / 32);
    }
}

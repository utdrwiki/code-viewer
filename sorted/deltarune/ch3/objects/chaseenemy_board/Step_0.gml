if (active == true)
{
    if (init == 0)
    {
        init = 1;
        if (chaseflag == "default")
        {
            usprite = spr_board_enemy_shadowman_up;
            dsprite = spr_board_enemy_shadowman_down;
            lsprite = spr_board_enemy_shadowman_left;
            rsprite = spr_board_enemy_shadowman_right;
            touchsprite = spr_board_enemy_shadowman_hit;
            sprite_index = dsprite;
            specialtouch = 1;
            chasetype = 0;
            pacetype = 1;
            neverstop = 1;
            nobaloon = 1;
        }
    }
    if (usprite != -1)
    {
        if ((direction >= 0 && direction <= 45) || (direction >= 270 && direction <= 360))
            sprite_index = rsprite;
        if (direction > 45 && direction < 135)
            sprite_index = usprite;
        if (direction > 135 && direction < 225)
            sprite_index = lsprite;
        if (direction > 225 && direction < 315)
            sprite_index = dsprite;
    }
    var boardtarget = -4;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            boardtarget = id;
    }
    if (boardtarget == -4)
        freeze = 1;
    if (i_ex(boardtarget))
    {
        if (boardtarget.boat == true)
            freeze = 1;
    }
    scr_depth_board();
    if (freeze == 0)
    {
        if (triggered == false)
        {
            if (pacetype == 0)
            {
                image_speed = speed / 4;
                if (pacecon == 0)
                {
                    pacetimer++;
                    if (pacetimer < 30)
                    {
                        if ((pacetimer % 8) == 0)
                        {
                            if (direction == 0)
                                direction = 180;
                            else
                                direction = 0;
                        }
                    }
                    if (pacetimer == 30)
                    {
                        direction = irandom(3) * 90;
                        speed = 4;
                        pacepivottime = choose(4, 8, 16);
                    }
                    if (speed != 0)
                    {
                        if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_board_hazard) || place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_board_solid))
                            direction -= 180;
                        if ((y + vspeed) >= 256)
                            direction = 90;
                        if ((y + vspeed) <= 80)
                            direction = 270;
                        if ((x + hspeed) >= 448)
                            direction = 180;
                        if ((x + hspeed) <= 160)
                            direction = 0;
                    }
                    if (pacetimer > (30 + pacepivottime))
                    {
                        speed = 0;
                        pacetimer = 0 + irandom_range(-15, 15);
                    }
                }
            }
            if (pacetype == 1)
            {
                image_speed = 0.13333333333333333;
                pacetimer++;
                if (pacetimer == 4 || pacetimer == 12 || pacetimer == 22 || pacetimer == 30)
                    direction = 180;
                if (pacetimer == 8 || pacetimer == 16 || pacetimer == 26 || pacetimer == 40)
                    direction = 0;
                if (pacetimer == 40)
                {
                    triggered = true;
                    speed = 1;
                }
                if (pacetimer == 8)
                    speed = 2;
                if (pacetimer == 12)
                    speed = 0;
                if (pacetimer == 22)
                    speed = 2;
                if (pacetimer == 26)
                    speed = 0;
            }
        }
        if (i_ex(boardtarget))
        {
            if (distance_to_object(boardtarget) < spotradius && triggered == false)
            {
                triggered = true;
                myspeed = abs(speed);
                if (nobaloon == 0)
                {
                    var blcon = instance_create(x, y - 32, obj_board_marker);
                    blcon.sprite_index = spr_board_excl;
                    scr_lerp_var_instance(blcon, "y", blcon.y, blcon.y - 8, 10, 2, "in");
                    scr_darksize(blcon);
                    scr_doom(blcon, 10);
                    snd_play(snd_b);
                }
            }
            if (triggered == true)
            {
                if (distance_to_object(boardtarget) < spotradius || neverstop == 1)
                {
                    myspeed = lerp(myspeed, maxspeed, 0.125);
                    move_towards_point(boardtarget.x, boardtarget.y, myspeed);
                }
                else if (myspeed > 0)
                {
                    myspeed = lerp(myspeed, -0.25, 0.25);
                    speed = myspeed;
                }
                else
                {
                    triggered = false;
                    pacecon = 0;
                    myspeed = 0;
                    speed = 0;
                }
            }
            var dofreeze = false;
            if (boardtarget.canfreemove == false)
            {
                dofreeze = true;
                if (i_ex(obj_board_playercamera))
                    dofreeze = false;
            }
            if (global.interact != 0)
                dofreeze = true;
            if (dofreeze)
            {
                freeze = 1;
                speed = 0;
                remspeed = myspeed;
            }
        }
    }
    if (freeze > 0)
    {
        if (boardtarget.canfreemove == true && global.interact == 0)
        {
            freeze--;
            if (freeze == 10)
                scr_shakeobj(id, 5, 1);
            if (freeze <= 0)
                myspeed = remspeed;
        }
    }
    if (place_meeting(x, y, obj_mainchara_board))
    {
        var inst = instance_place(x, y, obj_mainchara_board);
        var proceed = false;
        if (inst.name == "kris")
            proceed = true;
        if (proceed)
        {
            global.flag[9] = 1;
            global.interact = 1;
            boardtarget.battlemode = true;
            with (obj_board_parent)
                active = false;
            battler = instance_create(x, y, obj_gameshow_battlemanager);
            battler.encounterno = encounterno;
            battler.encounterflag = encounterflag;
            safe_delete(obj_board_playercamera);
            if (specialtouch == 1)
            {
                hat = instance_create(x, y, obj_board_marker);
                hat.sprite_index = spr_board_enemy_shadowman_hit_hat;
                hat.vspeed = -8;
                hat.gravity = 1;
                hat.depth = depth;
                scr_darksize(hat);
                scr_doom(hat, 15);
            }
            fader = instance_create(x, y, obj_board_marker);
            fader.sprite_index = sprite_index;
            fader.depth = depth;
            scr_darksize(fader);
            if (touchsprite != -1)
                fader.sprite_index = touchsprite;
            scr_doom(fader, 30);
            with (daddy)
                instance_destroy();
            instance_destroy();
        }
    }
}
if (active == false)
    instance_destroy();
if (scr_debug())
{
    if (keyboard_check_pressed(vk_f5))
        instance_destroy();
}

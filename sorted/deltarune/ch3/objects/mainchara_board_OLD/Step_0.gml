if (i_ex(obj_board_controller) && movetype == "board")
{
    if (keyboard_check_pressed(ord("1")))
        movesleft = 1;
    if (keyboard_check_pressed(ord("2")))
        movesleft = 2;
    if (keyboard_check_pressed(ord("3")))
        movesleft = 3;
    if (keyboard_check_pressed(ord("4")))
        movesleft = 4;
    if (keyboard_check_pressed(ord("5")))
        movesleft = 5;
    if (keyboard_check_pressed(ord("6")))
        movesleft = 6;
    if (keyboard_check_pressed(ord("0")))
        movesleft = 0;
    facing = 0;
    sprite_index = spr_board_kris_walk_down;
    image_speed = 0.25;
    if (obj_board_controller.phase == 0 && movebuffer <= 0)
    {
        if (movesleft > 0)
        {
            if (movingnow == 0)
            {
                canmove = false;
                if (i_ex(obj_board_camera))
                {
                    if (obj_board_camera.con == 0)
                        canmove = true;
                }
                if (i_ex(obj_growtangle))
                    canmove = false;
                if (movesleft > 0 && canmove)
                {
                    var destination = 0;
                    var i;
                    if (right_p())
                    {
                        i = 1;
                        do
                        {
                            if (place_meeting(x + (i * 32), y, obj_boardtile))
                                destination = 1;
                            if (place_meeting(x + (i * 32), y, obj_board_solid))
                                destination = 2;
                            dir = "right";
                            i++;
                            if (i > 32)
                                destination = 3;
                        }
                        until (destination != 0);
                    }
                    else if (left_p())
                    {
                        i = 1;
                        do
                        {
                            if (place_meeting(x - (i * 32), y, obj_boardtile))
                                destination = 1;
                            if (place_meeting(x - (i * 32), y, obj_board_solid))
                                destination = 2;
                            dir = "left";
                            i++;
                            if (i > 32)
                                destination = 3;
                        }
                        until (destination != 0);
                    }
                    else if (down_p())
                    {
                        i = 1;
                        do
                        {
                            if (place_meeting(x, y + (i * 32), obj_boardtile))
                                destination = 1;
                            if (place_meeting(x, y + (i * 32), obj_board_solid))
                                destination = 2;
                            dir = "down";
                            i++;
                            if (i > 32)
                                destination = 3;
                        }
                        until (destination != 0);
                    }
                    else if (up_p())
                    {
                        i = 1;
                        do
                        {
                            if (place_meeting(x, y - (i * 32), obj_boardtile))
                                destination = 1;
                            if (place_meeting(x, y - (i * 32), obj_board_solid))
                                destination = 2;
                            dir = "up";
                            i++;
                            if (i > 32)
                                destination = 3;
                        }
                        until (destination != 0);
                    }
                    if (destination == 2)
                    {
                        movingnow = 0;
                        debug_message("Solid Block Found, can't go that way. Requested direction=" + dir);
                        dir = "null";
                    }
                    if (destination == 1)
                    {
                        movingnow = (i - 1) * 2;
                        movesleft--;
                    }
                }
            }
        }
        if (movingnow != 0)
        {
            if (dir == "left")
                x -= 16;
            else if (dir == "right")
                x += 16;
            else if (dir == "up")
                y -= 16;
            else if (dir == "down")
                y += 16;
            movingnow--;
            movebuffer = 2;
        }
        if (movesleft > 0 && movingnow == 0 && movebuffer <= 0)
        {
            if (place_meeting(x, y, obj_board_readable))
            {
                var currentTile = instance_place(x, y, obj_board_readable);
                with (currentTile)
                    event_user(15);
            }
        }
        if (movesleft == 0 && movingnow == 0 && movebuffer <= 0 && canmove == true)
            obj_board_controller.phase = 1;
    }
    if (movebuffer > -10)
        movebuffer--;
    if (place_meeting(x, y, obj_board_freeroam_trigger))
        movetype = "free";
}
else if (movetype == "free")
{
    if (i_ex(obj_board_controller))
        obj_board_controller.phase = 3;
    wallcheck = 0;
    nowx = x;
    nowy = y;
    if (press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0)
        nopress = 1;
    press_l = 0;
    press_r = 0;
    press_d = 0;
    press_u = 0;
    bkx = 0;
    bky = 0;
    bkxy = 0;
    if (global.interact == 0 && canfreemove == 1)
    {
        if (left_h())
            press_l = 1;
        if (right_h())
            press_r = 1;
        if (up_h())
            press_u = 1;
        if (down_h())
            press_d = 1;
        px = 0;
        py = 0;
        pressdir = -1;
        if (press_r == 1)
        {
            px = wspeed;
            pressdir = 1;
        }
        if (press_l == 1)
        {
            px = -wspeed;
            pressdir = 3;
        }
        if (press_d == 1)
        {
            py = wspeed;
            pressdir = 0;
        }
        if (press_u == 1)
        {
            py = -wspeed;
            pressdir = 2;
        }
        if (nopress == 1 && pressdir != -1)
            facing = pressdir;
        if (facing == 2)
        {
            if (press_d == 1)
                facing = 0;
            if (press_u == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 0)
        {
            if (press_u == 1)
                facing = 2;
            if (press_d == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 3)
        {
            if (press_r == 1)
                facing = 1;
            if (press_l == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 1)
        {
            if (press_l == 1)
                facing = 3;
            if (press_r == 0 && pressdir != -1)
                facing = pressdir;
        }
        nopress = 0;
        xmeet = 0;
        ymeet = 0;
        xymeet = 0;
        if (place_meeting(x + px, y + py, obj_board_solid))
            xymeet = 1;
        if (place_meeting(x + px, y, obj_board_solid))
        {
            if (place_meeting(x + px, y, obj_board_solid))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_d == 0 && !place_meeting(x + px, y - g, obj_board_solid))
                    {
                        y -= g;
                        py = 0;
                        break;
                        mvd = 1;
                    }
                    if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, obj_board_solid))
                    {
                        y += g;
                        py = 0;
                        break;
                    }
                }
            }
            xmeet = 1;
            bkx = 0;
            if (px > 0)
            {
                for (var i = px; i >= 0; i -= 1)
                {
                    if (!place_meeting(x + i, y, obj_board_solid))
                    {
                        px = i;
                        bkx = 1;
                        break;
                    }
                }
            }
            if (px < 0)
            {
                for (var i = px; i <= 0; i += 1)
                {
                    if (!place_meeting(x + i, y, obj_board_solid))
                    {
                        px = i;
                        bkx = 1;
                        break;
                    }
                }
            }
            if (bkx == 0)
                px = 0;
        }
        if (place_meeting(x, y + py, obj_board_solid))
        {
            ymeet = 1;
            bky = 0;
            if (place_meeting(x, y + py, obj_board_solid))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_r == 0 && !place_meeting(x - g, y + py, obj_board_solid))
                    {
                        x -= g;
                        px = 0;
                        break;
                        mvd = 1;
                    }
                    if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, obj_board_solid))
                    {
                        x += g;
                        px = 0;
                        break;
                    }
                }
            }
            if (py > 0)
            {
                for (var i = py; i >= 0; i -= 1)
                {
                    if (!place_meeting(x, y + i, obj_board_solid))
                    {
                        py = i;
                        bky = 1;
                        break;
                    }
                }
            }
            if (py < 0)
            {
                for (var i = py; i <= 0; i += 1)
                {
                    if (!place_meeting(x, y + i, obj_board_solid))
                    {
                        py = i;
                        bky = 1;
                        break;
                    }
                }
            }
            if (bky == 0)
                py = 0;
        }
        if (place_meeting(x + px, y + py, obj_board_solid))
        {
            xymeet = 1;
            bkxy = 0;
            var i = px;
            j = py;
            while (j != 0 || i != 0)
            {
                if (!place_meeting(x + i, y + j, obj_board_solid))
                {
                    px = i;
                    py = j;
                    bkxy = 1;
                    break;
                }
                if (abs(j) >= 1)
                {
                    if (j > 0)
                        j -= 1;
                    if (j < 0)
                        j += 1;
                }
                else
                {
                    j = 0;
                }
                if (abs(i) >= 1)
                {
                    if (i > 0)
                        i -= 1;
                    if (i < 0)
                        i += 1;
                }
                else
                {
                    i = 0;
                }
            }
            if (bkxy == 0)
            {
                px = 0;
                py = 0;
            }
        }
        x += px;
        y += py;
    }
    if (fun == 0)
    {
        walk = 0;
        if (x != nowx && nopress == 0)
            walk = 1;
        if (y != nowy && nopress == 0)
            walk = 1;
        if (walk == 1)
            walkbuffer = 6;
        if (walkbuffer > 3)
        {
            walktimer += 1.5;
            if (walktimer >= 40)
                walktimer -= 40;
            if (walktimer < 10)
                image_index = 0;
            if (walktimer >= 10)
                image_index = 1;
            if (walktimer >= 20)
                image_index = 2;
            if (walktimer >= 30)
                image_index = 3;
        }
        if (walkbuffer <= 0 && fun == 0)
        {
            if (walktimer < 10)
                walktimer = 9.5;
            if (walktimer >= 10 && walktimer < 20)
                walktimer = 19.5;
            if (walktimer >= 20 && walktimer < 30)
                walktimer = 29.5;
            if (walktimer >= 30)
                walktimer = 39.5;
            image_index = 0;
        }
        walkbuffer -= 0.75;
        if (facing == 0)
            sprite_index = spr_board_kris_walk_down;
        if (facing == 1)
            sprite_index = spr_board_kris_walk_right;
        if (facing == 2)
            sprite_index = spr_board_kris_walk_up;
        if (facing == 3)
            sprite_index = spr_board_kris_walk_left;
    }
    if (onebuffer <= 0 && swordbuffer <= 0 && global.interact == 0 && button1_p())
    {
        onebuffer = 6;
        thisinteract = 0;
        if (facing == 1)
        {
            if (collision_rectangle(x + 16, y + 16 + 2, x + 16 + 32, (y + 32) - 2, obj_board_interactable, false, true))
                thisinteract = 1;
            if (collision_rectangle(x + 16, y + 16 + 2, x + 16 + 32, (y + 32) - 2, obj_board_interactable_solid, false, true))
                thisinteract = 2;
        }
        if (thisinteract > 0)
        {
            if (thisinteract == 1)
                interactedobject = collision_rectangle(x + 16, y + 16 + 2, x + 16 + 32, (y + 32) - 2, obj_board_interactable, false, true);
            if (thisinteract == 2)
                interactedobject = collision_rectangle(x + 16, y + 16 + 2, x + 16 + 32, (y + 32) - 2, obj_board_interactable_solid, false, true);
            if (interactedobject != -4)
            {
                with (interactedobject)
                    facing = 3;
                with (interactedobject)
                    scr_interact();
            }
        }
        thisinteract = 0;
        if (facing == 3)
        {
            if (collision_rectangle(x + 16, y + 16 + 2, (x + 16) - 32, (y + 32) - 2, obj_board_interactable, false, true))
                thisinteract = 1;
            if (collision_rectangle(x + 16, y + 16 + 2, (x + 16) - 32, (y + 32) - 2, obj_board_interactable_solid, false, true))
                thisinteract = 2;
        }
        if (thisinteract > 0)
        {
            if (thisinteract == 1)
                interactedobject = collision_rectangle(x + 16, y + 16 + 2, (x + 16) - 32, (y + 32) - 2, obj_board_interactable, false, true);
            if (thisinteract == 2)
                interactedobject = collision_rectangle(x + 16, y + 16 + 2, (x + 16) - 32, (y + 32) - 2, obj_board_interactable_solid, false, true);
            if (interactedobject != -4)
            {
                with (interactedobject)
                    facing = 1;
                with (interactedobject)
                    scr_interact();
            }
        }
        thisinteract = 0;
        if (facing == 0)
        {
            if (collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, y + 16 + 28, obj_board_interactable, false, true))
                thisinteract = 1;
            if (collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, y + 16 + 28, obj_board_interactable_solid, false, true))
                thisinteract = 2;
        }
        if (thisinteract > 0)
        {
            if (thisinteract == 1)
                interactedobject = collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, y + 16 + 28, obj_board_interactable, false, true);
            if (thisinteract == 2)
                interactedobject = collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, y + 16 + 28, obj_board_interactable_solid, false, true);
            if (interactedobject != -4)
            {
                with (interactedobject)
                    facing = 2;
                with (interactedobject)
                    scr_interact();
            }
        }
        thisinteract = 0;
        if (global.facing == 2)
        {
            if (collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, (y + 16) - 28, obj_board_interactable, false, true))
                thisinteract = 1;
            if (collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, (y + 16) - 28, obj_board_interactable_solid, false, true))
                thisinteract = 2;
        }
        if (thisinteract > 0)
        {
            if (thisinteract == 1)
                interactedobject = collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, (y + 16) - 28, obj_board_interactable, false, true);
            if (thisinteract == 2)
                interactedobject = collision_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, (y + 16) - 28, obj_board_interactable_solid, false, true);
            if (interactedobject != -4)
            {
                with (interactedobject)
                    facing = 0;
                with (interactedobject)
                    scr_interact();
            }
        }
    }
    onebuffer -= 1;
    if (button2_p() && swordbuffer <= 0 && onebuffer <= 0 && global.interact == 0)
    {
        swordbuffer = 8;
        swordfacing = facing;
        canfreemove = 0;
    }
    if (swordbuffer > 0)
    {
        swordbuffer--;
        facing = swordfacing;
        if (facing == 0)
            sprite_index = spr_board_kris_strike_down;
        if (facing == 1)
            sprite_index = spr_board_kris_strike_right;
        if (facing == 2)
            sprite_index = spr_board_kris_strike_up;
        if (facing == 3)
            sprite_index = spr_board_kris_strike_left;
        if (swordbuffer == 7)
            image_index = 0;
        if (swordbuffer == 6)
            image_index = 0;
        if (swordbuffer == 5)
            image_index = 1;
        if (swordbuffer == 4)
            image_index = 1;
        if (swordbuffer == 3)
            image_index = 1;
        if (swordbuffer == 2)
            image_index = 2;
        if (swordbuffer == 1)
            image_index = 0;
        if (swordbuffer == 0)
            canfreemove = 1;
        if (swordbuffer == 5)
        {
            var swordhitbox = instance_create(x, y, obj_board_swordhitbox);
            swordhitbox.facing = facing;
        }
    }
}
else
{
    movetype = "free";
}

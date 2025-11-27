if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (global.interact == 0)
{
    image_speed = speed / 4;
    if (con == 0)
    {
        targetspot = instance_find(obj_board_susiedig_groundspots, irandom(instance_number(obj_board_susiedig_groundspots) - 1));
        if (targetspot != -4)
        {
            tx = targetspot.x;
            ty = targetspot.y - 16;
            timer = 0;
            con = 1;
        }
        else
        {
            con = 99;
        }
    }
    if (con == 1)
    {
        if (x > tx)
        {
            x -= 4;
            facing = 3;
            image_speed = 0.25;
        }
        if (x < tx)
        {
            facing = 1;
            x += 4;
            image_speed = 0.25;
        }
        if (x == tx)
        {
            image_speed = 0;
            image_index = 0;
            timer++;
            if (timer >= 3)
            {
                timer = 0;
                con = 2;
            }
        }
    }
    if (con == 2)
    {
        if (y > ty)
        {
            facing = 2;
            image_speed = 0.25;
            y -= 4;
        }
        if (y < ty)
        {
            facing = 0;
            image_speed = 0.25;
            y += 4;
        }
        if (y == ty)
        {
            facing = 0;
            image_speed = 0;
            image_index = 0;
            timer++;
            if (timer >= 3)
            {
                timer = 0;
                con = 3;
            }
        }
    }
    if (con == 3)
    {
        var pickuptime = 3;
        var holdtime = 7;
        var waittime = 2;
        timer++;
        if (timer == 1)
        {
            facing = 99;
            sprite_index = spr_board_susie_dig;
            snd_play(snd_grab);
            image_index = 0;
        }
        if (timer == pickuptime)
        {
            image_index = 1;
            if (instance_number(obj_board_susiedig_groundspots) == 1)
            {
                dugup = instance_create(room_width, room_height, obj_board_pickup);
                with (dugup)
                {
                    snd_play(snd_item);
                    type = "key";
                    con = 2;
                    image_index = sprite_get_number(sprite_index) - 1;
                    image_alpha = 1;
                    image_speed = 0;
                    scr_depth_board();
                    with (obj_b1susiedig)
                        endsong = 1;
                }
            }
            else
            {
                dugup = instance_create(room_width, room_height, obj_board_bomb);
            }
            dugup.visible = 0;
            bombcount++;
            throwobject = instance_create(x, y, obj_board_grabobject);
            throwobject.ignoreplayer = 1;
            throwobject.grabdaddy = id;
            throwobject.grabbedid = dugup;
            safe_delete(targetspot);
        }
        if (timer == (pickuptime + 1))
        {
            holding = 1;
            var ydif = y - kris.y;
            var xdif = x - kris.x;
            if (abs(ydif) > abs(xdif))
            {
                if (ydif < 0)
                    facing = 0;
                else
                    facing = 2;
            }
            else if (xdif < 0)
            {
                facing = 1;
            }
            else
            {
                facing = 3;
            }
        }
        if (timer == (pickuptime + 1 + holdtime))
        {
            holding = 0;
            snd_play(snd_board_throw);
            throwobject.con = 1;
        }
        if (timer == (pickuptime + 1 + holdtime + waittime))
            con = 0;
    }
    scr_depth_board();
    if (facing == 0)
        sprite_index = spr_board_susie_walk_down;
    if (facing == 3)
        sprite_index = spr_board_susie_walk_left;
    if (facing == 1)
        sprite_index = spr_board_susie_walk_right;
    if (facing == 2)
        sprite_index = spr_board_susie_walk_up;
    if (holding == 1)
    {
        if (facing == 0)
            sprite_index = spr_board_susie_walk_down_armsup;
        if (facing == 3)
            sprite_index = spr_board_susie_walk_left_armsup;
        if (facing == 1)
            sprite_index = spr_board_susie_walk_right_armsup;
        if (facing == 2)
            sprite_index = spr_board_susie_walk_up_armsup;
    }
    if (manageralsei == false)
    {
        if (ralsei.iframes > 0)
        {
            manageralsei = true;
            ralsei.follow = false;
            ralsei.canfreemove = true;
            raltimer = 15;
        }
    }
    if (manageralsei)
    {
        raltimer++;
        if ((raltimer % 15) == 0)
        {
            scr_pathfind_end("ralsei");
            var _targx = irandom_range(1, 9);
            var _targy = irandom_range(1, 6);
            if (abs(_targx - ralsei.x) < 32)
                _targx += (32 * choose(-1, 1));
            if (abs(_targy - ralsei.y) < 32)
                _targy += (32 * choose(-1, 1));
            with (obj_board_bomb)
            {
                if (abs(x - _targx) < 32)
                {
                    _targx += (32 * choose(-1, 1));
                    debug_message("x=bombx");
                }
                if (abs(y - _targy) < 32)
                {
                    _targy += (32 * choose(-1, 1));
                    debug_message("y=bomby");
                }
            }
            scr_pathfind_to_point("ralsei", _targx, _targy);
        }
    }
}
else
{
    image_speed = 0;
}

var _upbound = 64;
var _downbound = 288;
var _leftbound = 128;
var _rightbound = 480;
var debugpathmessage = 0;
if (room == room_dw_puzzlecloset_3)
{
    _leftbound = 2688;
    _upbound = 608;
    _rightbound = (_leftbound + 384) - 32;
    _downbound = (_upbound + 256) - 32;
}
if (init == 0)
{
    init = 1;
    if (name == "kris")
    {
        kris = id;
        sleepsprite = 4293;
        sprite_index = spr_board_kris_walk_down;
        if (i_ex(obj_board_controller))
            obj_board_controller.kris_object = id;
        if (i_ex(obj_board_instawarp_helper))
        {
            x = obj_board_instawarp_helper.krissavex;
            y = obj_board_instawarp_helper.krissavey;
        }
        if (!scr_swordroom() && dontteam == false)
        {
            susie = instance_create(x + 32, y, obj_mainchara_board);
            susie.name = "susie";
            susie.sprite_index = spr_board_susie_walk_down;
            if (i_ex(obj_board_instawarp_helper) && obj_board_instawarp_helper.sussavex != 0 && obj_board_instawarp_helper.sussavey != 0)
            {
                susie.x = obj_board_instawarp_helper.sussavex;
                susie.y = obj_board_instawarp_helper.sussavey;
            }
            if (i_ex(obj_board_controller))
                obj_board_controller.susie_object = susie;
            ralsei = instance_create(x - 32, y, obj_mainchara_board);
            ralsei.name = "ralsei";
            ralsei.sprite_index = spr_board_ralsei_walk_down;
            ralsei.follow = true;
            ralsei.allow_diagonals = false;
            if (i_ex(obj_board_instawarp_helper) && obj_board_instawarp_helper.ralsavex != 0 && obj_board_instawarp_helper.ralsavey != 0)
            {
                ralsei.x = obj_board_instawarp_helper.ralsavex;
                ralsei.y = obj_board_instawarp_helper.ralsavey;
            }
            if (i_ex(obj_board_controller))
                obj_board_controller.ralsei_object = ralsei;
            for (var i = 0; i < 75; i += 1)
            {
                susie.remx[i] = x;
                susie.remy[i] = y;
                susie.facing[i] = 0;
            }
            for (var i = 0; i < 75; i += 1)
            {
                ralsei.remx[i] = x;
                ralsei.remy[i] = y;
                ralsei.facing[i] = 0;
            }
        }
        if (room == room_board_preshadowmantle || room == room_shadowmantle)
            facing = 2;
        with (obj_board_instawarp_helper)
            instance_destroy();
        controlled = 1;
    }
    if (name == "susie")
    {
        dsprite = spr_board_susie_walk_down;
        rsprite = spr_board_susie_walk_right;
        usprite = spr_board_susie_walk_up;
        lsprite = spr_board_susie_walk_left;
        hurtsprite = spr_board_susie_hurt;
        dsprite_carry = 1300;
        rsprite_carry = 4305;
        lsprite_carry = 2383;
        usprite_carry = 3940;
        dsprite_item = 2407;
        sleepsprite = 4052;
    }
    if (name == "ralsei")
    {
        dsprite = spr_board_ralsei_walk_down;
        rsprite = spr_board_ralsei_walk_right;
        usprite = spr_board_ralsei_walk_up;
        lsprite = spr_board_ralsei_walk_left;
        hurtsprite = spr_board_ralsei_hurt;
        dsprite_carry = 4183;
        rsprite_carry = 4653;
        lsprite_carry = 4151;
        usprite_carry = 3832;
        dsprite_item = 3102;
        sleepsprite = 4433;
    }
    if (name == "lancer")
    {
        dsprite = spr_board_lancer_down;
        rsprite = spr_board_lancer_right;
        usprite = spr_board_lancer_up;
        lsprite = spr_board_lancer_left;
        hurtsprite = spr_board_lancer_down;
        dsprite_carry = 4555;
        rsprite_carry = 474;
        lsprite_carry = 2082;
        usprite_carry = 3188;
        dsprite_item = 4555;
        sleepsprite = 4555;
    }
    if (name == "elnina")
    {
        dsprite = spr_board_elnina_idle_right;
        rsprite = spr_board_elnina_idle_right;
        usprite = spr_board_elnina_idle_up;
        lsprite = spr_board_elnina_idle_left;
        hurtsprite = spr_board_elnina_idle_right;
        dsprite_carry = dsprite;
        rsprite_carry = rsprite;
        lsprite_carry = lsprite;
        usprite_carry = usprite;
        dsprite_item = dsprite;
        sleepsprite = dsprite;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")))
    {
        controlled = 0;
        if (name == "kris")
            controlled = 1;
    }
    if (keyboard_check_pressed(ord("2")))
    {
        controlled = 0;
        if (name == "susie")
            controlled = 1;
    }
    if (keyboard_check_pressed(ord("3")))
    {
        controlled = 0;
        if (name == "ralsei")
            controlled = 1;
        follow = 0;
    }
    if (keyboard_check_pressed(ord("4")))
        randmove = 1 - randmove;
    if (keyboard_check_pressed(ord("5")))
    {
        myhealth = 12;
        if (invincible == 0)
            invincible = 1;
        else
            invincible = 0;
    }
    if (invincible == 1)
        myhealth = 12;
}
if (ignoredepth == 0)
    scr_depth_board();
wallcheck = 0;
nowx = x;
nowy = y;
if (press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0)
    nopress = 1;
if (controlled == 1)
{
    press_l = 0;
    press_r = 0;
    press_d = 0;
    press_u = 0;
    press_1 = 0;
    press_2 = 0;
}
if (susierecordcon == 1 && global.interact == 0)
{
    susierecordstring += "0";
    var no_input = true;
    if (left_h())
    {
        susierecordstring += "L";
        no_input = false;
    }
    if (right_h())
    {
        susierecordstring += "R";
        no_input = false;
    }
    if (down_h())
    {
        susierecordstring += "D";
        no_input = false;
    }
    if (up_h())
    {
        susierecordstring += "U";
        no_input = false;
    }
    if (button1_p())
    {
        susierecordstring += "1";
        no_input = false;
    }
    if (button2_p())
    {
        susierecordstring += "2";
        no_input = false;
    }
    if (no_input == true)
        susierecordstring += "W";
    susierecordcount++;
}
if (susierecordcon == 2 && global.interact == 0)
{
    press_l = 0;
    press_r = 0;
    press_u = 0;
    press_d = 0;
    press_1 = 0;
    press_2 = 0;
    if (susierecordcount < string_length(susierecordstring))
    {
        var _end = 0;
        while (_end == 0)
        {
            var _input = string_char_at(susierecordstring, susierecordcount);
            susierecordcount++;
            if (_input == "L")
                press_l = 1;
            if (_input == "R")
                press_r = 1;
            if (_input == "U")
                press_u = 1;
            if (_input == "D")
                press_d = 1;
            if (_input == "1")
                press_1 = 1;
            if (_input == "2")
                press_2 = 1;
            if (_input == "0")
                _end = 1;
            if (susierecordcount >= string_length(susierecordstring))
                _end = 1;
        }
    }
    else
    {
        if (susierecordsave == true)
            _string_save = get_string("Here's the string:", susierecordstring);
        susierecordstring = "";
        susierecordcon = 0;
        susierecordcount = 0;
    }
}
if (obj_board_camera.con != 0)
{
    if (susierecordcon == 1)
    {
        if (susierecordsave == true && show_question("Do you want to save the Susie recording?"))
        {
            _string_save = get_string("Input string file name:", "default");
            ini_open("susieplayback.ini");
            ini_write_string("Susie Playback Info", _string_save, susierecordstring);
            ini_close();
        }
        else
        {
        }
        susierecordstring = "";
        susierecordcon = 0;
        susierecordcount = 0;
    }
    if (susierecordcon == 2)
    {
        susierecordstring = "";
        susierecordcon = 0;
        susierecordcount = 0;
    }
}
if (abouttoregaincontrol == true)
{
    if (!left_h() && !right_h() && !up_h() && !down_h() && swordbuffer <= 0)
    {
        abouttoregaincontrol = false;
        controlled = 1;
    }
}
if (susierecordcon == 2)
{
}
else if (controlled == 1)
{
    if (left_h())
        press_l = 1;
    if (right_h())
        press_r = 1;
    if (up_h())
        press_u = 1;
    if (down_h())
        press_d = 1;
    if (button1_p())
        press_1 = 1;
    if (button2_p())
        press_2 = 1;
    if (press_l && press_r)
    {
        press_l = 0;
        press_r = 0;
    }
    if (press_u && press_d)
    {
        press_u = 0;
        press_d = 0;
    }
}
else
{
    press_l = 0;
    press_r = 0;
    press_d = 0;
    press_u = 0;
    press_1 = 0;
    press_2 = 0;
}
bkx = 0;
bky = 0;
bkxy = 0;
if (((global.interact == 0 || interactoverride == true) && canfreemove == 1 && myhealth > 0) || runawayfromsusie == true)
{
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
    if (i_ex(obj_board_enemy_black_deer) && (px != 0 || py != 0) && name == "kris")
    {
        obj_board_enemy_black_deer.px = px * -1;
        obj_board_enemy_black_deer.py = py * -1;
        obj_board_enemy_black_deer.press_r = press_l;
        obj_board_enemy_black_deer.press_l = press_r;
        obj_board_enemy_black_deer.press_d = press_u;
        obj_board_enemy_black_deer.press_u = press_d;
    }
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
    var lenient_x = px;
    var lenient_y = py;
    var on_top_of_ice_block = false;
    var checkcol = true;
    if (scr_debug())
    {
        if (obj_mainchara.noclip)
            checkcol = false;
    }
    if (checkcol)
    {
        if (place_meeting(x + px, y + py, obj_board_solid))
            xymeet = 1;
        if (place_meeting(x + px, y, obj_board_solid))
        {
            var block = instance_place(x + px, y, obj_board_solid);
            if (block.object_index == obj_pushableblock_board && block.jello == true)
            {
            }
            else
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
        }
        if (place_meeting(x, y + py, obj_board_solid))
        {
            var block = instance_place(x, y + py, obj_board_solid);
            if (block.object_index == obj_pushableblock_board && block.jello == true)
            {
            }
            else
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
        }
        if (place_meeting(x + px, y + py, obj_board_solid))
        {
            var block = instance_place(x + px, y + py, obj_board_solid);
            if (block.object_index == obj_pushableblock_board && block.jello == true)
            {
            }
            else
            {
                xymeet = 1;
                bkxy = 0;
                var i = px;
                var j = py;
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
        }
        var lenient_amount = 8;
        if (px == 0 && lenient_y == 0 && lenient_x > 0)
        {
            var colllide_count = 0;
            for (var i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x + 32, (y + 32) - i, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y -= wspeed;
            colllide_count = 0;
            for (var i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x + 32, y + 16 + i, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y += wspeed;
        }
        if (px == 0 && lenient_y == 0 && lenient_x < 0)
        {
            var colllide_count = 0;
            for (var i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x - 1, (y + 32) - i, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y -= wspeed;
            colllide_count = 0;
            for (var i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x - 1, y + 16 + i, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y += wspeed;
        }
        if (py == 0 && lenient_x == 0 && lenient_y > 0)
        {
            lenient_amount = 12;
            var colllide_count = 0;
            for (var i = 0; i <= 32; i += 1)
            {
                if (position_meeting((x + 32) - i, y + 32, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x -= wspeed;
            colllide_count = 0;
            for (var i = 0; i <= 32; i += 1)
            {
                if (position_meeting(x + i, y + 32, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x += wspeed;
            lenient_amount = 8;
        }
        if (py == 0 && lenient_x == 0 && lenient_y < 0)
        {
            var colllide_count = 0;
            for (var i = 0; i <= 32; i += 1)
            {
                if (position_meeting((x + 32) - i, y, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x -= wspeed;
            colllide_count = 0;
            for (var i = 0; i <= 32; i += 1)
            {
                if (position_meeting(x + i, y, obj_board_solid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x += wspeed;
        }
    }
    x += px;
    y += py;
}
if (myhealth > maxhealth)
    myhealth = maxhealth;
if (iframes > -5)
    iframes--;
var caminvincible = false;
if (i_ex(mycam))
{
    if (mycam.picturetaken == true)
        caminvincible = true;
}
if (place_meeting(x, y, obj_board_hazard) && (canfreemove == 1 || (canfreemove == 0 && swordbuffer > 0) || (canfreemove == 0 && boat == true) || (canfreemove == 0 && i_ex(obj_board_playercamera) && caminvincible == false)) && iframes <= 0 && myhealth > 0 && global.interact == 0)
{
    var dodamage = true;
    var hazard = instance_place(x, y, obj_board_hazard);
    if (hazard.krisonly == true && name != "kris")
        dodamage = false;
    if (hazard.active_hitbox == true && dodamage == true)
    {
        iframes = 20;
        snd_play(snd_board_playerhurt);
        if (name == "kris")
        {
            if (sword == true)
            {
                with (obj_board_controller)
                {
                    crt_glitch = 6;
                    crt_glitchstrength = 10;
                }
            }
            if (room == room_shadowmantle)
            {
                var _fatal = 0;
                if ((myhealth - hazard.damage) <= 0)
                    _fatal = 1;
                if (!_fatal)
                {
                    with (obj_board_controller)
                    {
                        crt_glitch = 10;
                        crt_glitchstrength = 50;
                        scr_shakescreen();
                        var numberofhitskriscantake = 6;
                        var realhurt = round((hazard.damage / other.maxhealth) * global.maxhp[1]);
                        with (obj_mainchara)
                        {
                            scr_shakeobj();
                            snd_play(snd_hurt1);
                            dmg = instance_create(x, (y + 54) - 4, obj_dmgwriter);
                            with (dmg)
                            {
                                damage = realhurt;
                                type = 0;
                                lightb = 16777215;
                            }
                            dmg.depth = 0;
                            fun = 1;
                            sprite_index = spr_krisu_holdcontroller_hurt;
                            scr_delay_var("sprite_index", 4313, 5);
                            var __shock = scr_board_afterimage(0, 5, 3);
                            __shock.depth = obj_gameshow_swordroute.depth - 10;
                            __shock.sprite_index = spr_swordroute_shadowmantle_krishitflash;
                            __shock.image_alpha = 0.25;
                        }
                        with (obj_event_manager)
                            trigger_event(UnknownEnum.Value_1);
                    }
                }
            }
        }
        image_blend = c_red;
        myhealth -= hazard.damage;
        with (obj_board_healthbar)
        {
            if (target == other.id)
            {
                scr_shakeobj();
                scr_delay_var("mycolor", mycolor, 2);
                mycolor = c_red;
            }
        }
        var hazard_hitbox = hazard.object_index;
        if (hazard_hitbox == 1728)
            hazard_hitbox = hazard_hitbox.parentid;
        if (i_ex(hazard_hitbox))
        {
            if (hazard_hitbox.object_index == obj___ || hazard_hitbox.object_index == obj_board_enemy_parent)
            {
                path_end();
                is_moving = false;
                is_moving_timer = 0;
                speed = 0;
                move_type = 0;
                movecon = 0;
                movetimer = 0;
            }
            if (hazard_hitbox.object_index == obj_board_enemy_monster)
            {
                with (instance_nearest(x + 16, y + 16, obj_board_enemy_monster))
                {
                    path_end();
                    is_moving = false;
                    is_moving_timer = 0;
                    speed = 0;
                    move_type = 0;
                    movecon = 0;
                    movetimer = 0;
                    delay = 10;
                    if (type == 2)
                        delay = 30;
                }
            }
        }
        hurttimer = 5;
        canfreemove = 0;
        hitmove = 32;
        hitcon = 1;
        hitmovespeed = 16;
        _hitx = 0;
        _hity = 0;
        var dir;
        if (hazard.object_index == obj_shadow_mantle_fire || hazard.object_index == obj_shadow_mantle_cloud_bullet || hazard.object_index == obj_shadow_mantle_fire3)
            dir = point_direction(x, y, hazard.remx[4], hazard.remy[4]);
        else
            dir = point_direction(x, y, hazard.xprevious, hazard.yprevious);
        if (dir >= 135 && dir < 225)
        {
            if (!place_meeting(x + 16, y, obj_board_solid))
                _hitx += hitmovespeed;
            else if (hazard.y > y && !place_meeting(x, y - 16, obj_board_solid))
                _hity -= hitmovespeed;
            else if (!place_meeting(x, y + 16, obj_board_solid))
                _hity += hitmovespeed;
        }
        if (dir >= 315 || dir < 45)
        {
            if (!place_meeting(x - 16, y, obj_board_solid))
                _hitx -= hitmovespeed;
            else if (hazard.y > y && !place_meeting(x, y - 16, obj_board_solid))
                _hity -= hitmovespeed;
            else if (!place_meeting(x, y + 16, obj_board_solid))
                _hity += hitmovespeed;
        }
        if (dir >= 45 && dir < 135)
        {
            if (!place_meeting(x, y + 16, obj_board_solid))
                _hity += hitmovespeed;
            else if (hazard.x < x && !place_meeting(x - 16, y, obj_board_solid))
                _hitx -= hitmovespeed;
            else if (!place_meeting(x + 16, y, obj_board_solid))
                _hitx += hitmovespeed;
        }
        if (dir >= 225 && dir < 315)
        {
            if (!place_meeting(x, y - 16, obj_board_solid))
                _hity -= hitmovespeed;
            else if (hazard.x < x && !place_meeting(x - 16, y, obj_board_solid))
                _hitx -= hitmovespeed;
            else if (!place_meeting(x + 16, y, obj_board_solid))
                _hitx += hitmovespeed;
        }
    }
}
if (place_meeting(x, y, obj_board_hazard))
{
    var hazard = instance_place(x, y, obj_board_hazard);
    dodelete = true;
    if (hazard.krisonly == true && name != "kris")
        dodelete = false;
    if (hazard.destroyonhit == true && dodelete == true)
    {
        with (hazard)
            instance_destroy();
    }
}
if (hitcon == 1)
{
    if (hitmove > 0)
    {
        blocker = 0;
        hitmove -= hitmovespeed;
        var move = 1;
        if (place_meeting(x + _hitx, y + _hity, obj_board_solid))
            move = 0;
        if (move == 1)
        {
            x += _hitx;
            y += _hity;
        }
    }
    else
    {
        image_blend = c_white;
        if (myhealth <= 0)
        {
            myhealth = 0;
            hitcon = 99;
            if (i_ex(obj_shadow_mantle_enemy))
                global.shadow_mantle_losses++;
            if (controlled || scr_swordroom())
            {
                if (room == room_shadowmantle)
                {
                    global.screenshot = sprite_create_from_surface(application_surface, 0, 0, __view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0), 0, 0, 0, 0);
                    with (obj_mainchara)
                    {
                        global.heartx = (x + 12) - camerax();
                        global.hearty = (y + 40) - cameray();
                    }
                    gameover = instance_create_depth(global.heartx, global.hearty, -100, obj_gameover_heart_effect);
                    gameover.special = 1;
                    controlled = 0;
                    with (obj_shadow_mantle_bg)
                        instance_destroy();
                    with (obj_shadow_mantle_path)
                        instance_destroy();
                    with (obj_shadowmantle_crtcontroller)
                        instance_destroy();
                    with (obj_shadow_mantle_fire)
                        instance_destroy();
                    with (obj_shadow_mantle_fire_controller)
                        instance_destroy();
                    with (obj_shadow_mantle_bomb)
                        instance_destroy();
                    with (obj_shadow_mantle_cloud)
                        instance_destroy();
                    with (obj_shadow_mantle_cloud_bullet)
                        instance_destroy();
                    with (obj_shadow_mantle_dash_hitbox)
                        instance_destroy();
                    with (obj_shadow_mantle_groundfire)
                        instance_destroy();
                    with (obj_board_enemy_contact_hitbox)
                        instance_destroy();
                    with (obj___)
                        instance_destroy();
                    with (obj_shadow_mantle_transition_particle)
                        instance_destroy();
                    with (obj_shadow_mantle_fire3)
                        instance_destroy();
                    with (obj_shadow_mantle_bomb_spawn)
                        instance_destroy();
                    with (obj_shadow_mantle_enemy)
                        instance_destroy();
                    with (obj_shadow_mantle_enemy_outro)
                    {
                        instance_destroy();
                        global.interact = 0;
                    }
                    with (obj_event_manager)
                        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_13);
                }
                else if (scr_swordroom())
                {
                    global.flag[1007] = 1;
                    deathevent = instance_create(x, y, obj_board_death_event_sword);
                    global.interact = 1;
                }
                else
                {
                    deathevent = instance_create(x, y, obj_board_deathevent);
                    deathevent.name = name;
                    deathevent.target = id;
                    deathevent.depth = depth - 5000;
                    global.interact = 1;
                }
            }
            else
            {
                deathevent = instance_create(x, y, obj_board_caterpillardeath);
                deathevent.name = name;
                image_alpha = 0;
            }
        }
        else
        {
            hitcon = 0;
            if (name == "kris")
                scr_board_caterpillar_interpolate_ralsei();
            if (name == "ralsei")
                scr_board_caterpillar_interpolate();
        }
    }
}
if (hurttimer == 1)
    canfreemove = 1;
if (hurttimer > 0)
{
    hurttimer--;
    if (x < 128)
        x = 128;
    if (x > 480)
        x = 480;
    if (y < 64)
        y = 64;
    if (y > 288)
        y = 288;
}
if (hitcon == 99)
{
    fun = 1;
    if (myhealth > 0)
    {
        fun = 0;
        canfreemove = 1;
        hitcon = 0;
        with (obj_board_enemy_parent)
        {
            if (!i_ex(obj_shadow_mantle_enemy))
                instance_destroy();
        }
        with (obj_fire_bar_base)
            instance_destroy();
        with (obj_fire_bar_piece)
            instance_destroy();
        with (obj_board_enemy_spear)
            instance_destroy();
        with (obj_board_enemy_fire)
            instance_destroy();
        with (obj_board_enemy_bubble)
            instance_destroy();
        with (obj_board_enemy_note)
            instance_destroy();
        with (obj_board_enemy_pellet)
            instance_destroy();
        with (obj_shadow_mantle_fire)
            instance_destroy();
        with (obj_shadow_mantle_fire_controller)
            instance_destroy();
        with (obj_shadow_mantle_fire3)
            instance_destroy();
        with (obj_shadow_mantle_cloud_bullet)
            instance_destroy();
        with (obj_shadow_mantle_bomb)
            instance_destroy();
        with (obj_shadow_mantle_cloud)
            instance_destroy();
    }
}
if (fun == 0 && is_moving == false)
{
    walk = 0;
    if (x != nowx && nopress == 0)
        walk = 1;
    if (y != nowy && nopress == 0)
        walk = 1;
    if (walk == 1)
        walkbuffer = 6;
    var disable = 0;
    if ((name == "ralsei" || name == "susie") && controlled == 0)
        disable = 1;
    if (name == "susie" && susierecordcon == 2)
        disable = 0;
    if (name == "ralsei" && susierecordcon == 2)
        disable = 0;
    if (walkbuffer > 3 && disable == 0)
        image_index += 0.125;
    if (walkbuffer <= 0 && fun == 0 && disable == 0)
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
        sprite_index = dsprite;
    if (facing == 1)
        sprite_index = rsprite;
    if (facing == 2)
        sprite_index = usprite;
    if (facing == 3)
        sprite_index = lsprite;
    if (grab != 0)
    {
        if (facing == 0)
            sprite_index = dsprite_carry;
        if (facing == 1)
            sprite_index = rsprite_carry;
        if (facing == 2)
            sprite_index = usprite_carry;
        if (facing == 3)
            sprite_index = lsprite_carry;
    }
}
var interacted = 0;
if (onebuffer <= 0 && controlled == 1 && swordbuffer <= 0 && global.interact == 0 && !instance_exists(obj_board_playercamera) && press_1 == 1 && controlled == 1 && (name == "kris" || caninteract == true))
{
    onebuffer = 6;
    thisinteract = 0;
    if (facing == 1)
    {
        if (collision_rectangle(x + 16, y + 16 + 6, x + 16 + 32, (y + 32) - 2, obj_board_interactable, false, true))
            thisinteract = 1;
        if (collision_rectangle(x + 16, y + 16 + 6, x + 16 + 32, (y + 32) - 2, obj_board_interactable_solid, false, true))
            thisinteract = 2;
    }
    if (thisinteract > 0)
    {
        if (thisinteract == 1)
            interactedobject = collision_rectangle(x + 16, y + 16 + 6, x + 16 + 32, (y + 32) - 2, obj_board_interactable, false, true);
        if (thisinteract == 2)
            interactedobject = collision_rectangle(x + 16, y + 16 + 6, x + 16 + 32, (y + 32) - 2, obj_board_interactable_solid, false, true);
        if (interactedobject != -4)
        {
            with (interactedobject)
                facing = 3;
            with (interactedobject)
                scr_interact();
            interacted = 1;
            if (interactedobject.object_index == obj_board_heal_pickup && sword == true)
                interacted = 0;
        }
    }
    thisinteract = 0;
    if (facing == 3)
    {
        if (collision_rectangle(x + 16, y + 16 + 6, (x + 16) - 32, (y + 32) - 2, obj_board_interactable, false, true))
            thisinteract = 1;
        if (collision_rectangle(x + 16, y + 16 + 6, (x + 16) - 32, (y + 32) - 2, obj_board_interactable_solid, false, true))
            thisinteract = 2;
    }
    if (thisinteract > 0)
    {
        if (thisinteract == 1)
            interactedobject = collision_rectangle(x + 16, y + 16 + 6, (x + 16) - 32, (y + 32) - 2, obj_board_interactable, false, true);
        if (thisinteract == 2)
            interactedobject = collision_rectangle(x + 16, y + 16 + 6, (x + 16) - 32, (y + 32) - 2, obj_board_interactable_solid, false, true);
        if (interactedobject != -4)
        {
            with (interactedobject)
                facing = 1;
            with (interactedobject)
                scr_interact();
            interacted = 1;
            if (interactedobject.object_index == obj_board_heal_pickup && sword == true)
                interacted = 0;
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
            interacted = 1;
            if (interactedobject.object_index == obj_board_heal_pickup && sword == true)
                interacted = 0;
        }
    }
    thisinteract = 0;
    if (facing == 2)
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
            interacted = 1;
            if (interactedobject.object_index == obj_board_heal_pickup && sword == true)
                interacted = 0;
        }
    }
    if (room == room_board_2_sword)
    {
        if (interacted > 0)
        {
            if (i_ex(interactedobject))
            {
                if (interactedobject.object_index == obj_board_tree_grayscale)
                    interacted = 0;
            }
        }
    }
    if (i_ex(obj_board_boat))
    {
        var bpx = 0;
        var bpy = 0;
        if (facing == 0)
            bpy = 32;
        if (facing == 2)
            bpy = -32;
        if (facing == 1)
            bpx = 32;
        if (facing == 3)
            bpx = -32;
        if (place_meeting(x + bpx, y + bpy, obj_board_boat))
        {
            with (instance_place(x + bpx, y + bpy, obj_board_boat))
            {
                if (engaged == 0)
                {
                    interacted = true;
                    event_user(0);
                }
            }
        }
    }
}
onebuffer -= 1;
if (graballpots == true && global.flag[1020] && global.interact == 0 && canfreemove == true)
{
    susierecordcon = 0;
    susierecordcount = 0;
    if (graballpots_con == 0)
    {
        if (!i_ex(obj_board_grabbleObject))
        {
            graballpots = false;
            graballpots_con = 0;
            graballpots_timer = 0;
        }
        else
        {
            potarray[0] = -4;
            array_resize(potarray, 0);
            with (obj_board_grabbleObject)
            {
                if (x >= 128 && x <= 480 && y >= 64 && y <= 288 && cangrab == true)
                    array_push(other.potarray, id);
            }
            _pot = -1;
            var dist = 999999;
            for (var i = 0; i < array_length(potarray); i++)
            {
                if (i_ex(potarray[i]))
                {
                    var thisdist = distance_to_object(potarray[i]);
                    if (thisdist < dist)
                    {
                        dist = thisdist;
                        _pot = potarray[i];
                    }
                }
            }
            if (_pot == -1)
            {
                graballpots = false;
                graballpots_con = 0;
                graballpots_timer = 0;
            }
            else
            {
                scr_pathfind_to_closest_point_32x32("susie", _pot.x, _pot.y, -1, true);
                graballpots_con = 1;
            }
        }
    }
    if (graballpots_con == 1 && is_moving == false)
    {
        graballpots_timer++;
        if (graballpots_timer == 1)
        {
            press_1 = 1;
            facing = grab_dir;
        }
        if (graballpots_timer == 10)
        {
            graballpots_timer = 0;
            graballpots_con = 2;
        }
    }
    if (graballpots_con == 2)
    {
        graballpots_timer++;
        if (graballpots_timer == 1)
        {
            repeat (4)
            {
                var _xx = 0;
                var _yy = 0;
                switch (facing)
                {
                    case 0:
                        _yy = 32;
                        break;
                    case 1:
                        _xx = 32;
                        break;
                    case 2:
                        _yy = -32;
                        break;
                    case 3:
                        _xx = -32;
                        break;
                }
                var tx = round(x / 32) * 32;
                var ty = round(y / 32) * 32;
                var spaceFree = 1;
                for (var i = 1; i < 4; i++)
                {
                    for (var j = 0; j < array_length(blockerlist); j++)
                    {
                        var blok = instance_place(tx + (_xx * i), ty + (_yy * i), blockerlist[j]);
                        if (blok != -4)
                        {
                            if (blok != id && blok != 544)
                                spaceFree = 0;
                        }
                    }
                }
                if (spaceFree != 0)
                {
                    with (grabmarker)
                        info = 1;
                    facing++;
                    if (facing == 4)
                        facing = 0;
                    if (facing == 0)
                        sprite_index = spr_board_susie_walk_down;
                    if (facing == 1)
                        sprite_index = spr_board_susie_walk_right;
                    if (facing == 2)
                        sprite_index = spr_board_susie_walk_up;
                    if (facing == 3)
                        sprite_index = spr_board_susie_walk_left;
                }
            }
            if (x > 447)
            {
                facing = 3;
                sprite_index = spr_board_susie_walk_left;
            }
        }
        if (graballpots_timer == 3)
            press_1 = 1;
        if (graballpots_timer == firstpotwait)
        {
            graballpots_timer = 0;
            graballpots_con = 0;
            firstpotwait = 5;
        }
    }
    if (graballpots_con == 3)
    {
        graballpots_timer++;
        if (graballpots_timer == 1)
            press_1 = 1;
        if (graballpots_timer == 2)
        {
            xx = x;
            yy = y;
            var selfx = round(x / 32) * 32;
            var selfy = round(y / 32) * 32;
            done = false;
            if (sprite_index == spr_board_susie_walk_down)
                facing = 0;
            if (sprite_index == spr_board_susie_walk_right)
                facing = 1;
            if (sprite_index == spr_board_susie_walk_up)
                facing = 2;
            if (sprite_index == spr_board_susie_walk_left)
                facing = 3;
            repeat (4)
            {
                if (done == false)
                {
                    if (done == false)
                        facing++;
                    if (facing > 3)
                        facing = 0;
                    if (facing == 0)
                    {
                        coll = collision_rectangle(selfx, selfy + 64, selfx + 32, selfy + 32 + 96, obj_board_solid, false, true);
                        if (coll == -4)
                        {
                            xx = selfx;
                            yy = selfy + 64;
                            done = true;
                            facing = 0;
                            sprite_index = spr_board_susie_walk_down;
                        }
                    }
                    if (facing == 1)
                    {
                        coll = collision_rectangle(selfx + 64, selfy + 16, selfx + 96, selfy + 31, obj_board_solid, false, true);
                        if (coll == -4)
                        {
                            xx = selfx + 64;
                            yy = selfy;
                            done = true;
                            facing = 1;
                            sprite_index = spr_board_susie_walk_right;
                        }
                    }
                    if (facing == 2)
                    {
                        coll = collision_rectangle(selfx, selfy - 32, selfx + 32, selfy - 64, obj_board_solid, false, true);
                        if (coll == -4)
                        {
                            xx = selfx;
                            yy = selfy - 64;
                            done = true;
                            facing = 2;
                            sprite_index = spr_board_susie_walk_up;
                        }
                    }
                    if (facing == 3)
                    {
                        coll = collision_rectangle(selfx - 64, selfy + 16, selfx - 32, selfy + 31, obj_board_solid, false, true);
                        if (coll == -4)
                        {
                            xx = selfx - 64;
                            yy = selfy;
                            done = true;
                            facing = 3;
                            sprite_index = spr_board_susie_walk_left;
                        }
                    }
                }
            }
            if (xx < 128)
                xx = 128;
            if (xx > 480)
                xx = 480;
            if (yy < 64)
                yy = 64;
            if (yy > 288)
                yy = 288;
        }
        if (graballpots_timer == 25)
            press_1 = 1;
        if (graballpots_timer == 45)
        {
            graballpots_timer = 0;
            graballpots_con = 0;
            graballpots = false;
        }
    }
}
var override = false;
if (name == "susie" && doagrab)
{
    override = true;
    doagrab = false;
    press_1 = 1;
}
if (press_1 == 1 && name == "susie" && global.flag[1020] == 1 && (global.interact == 0 || override == true) && (canfreemove == true || override == true) && obj_board_camera.shift == "none")
{
    if (grab == 0)
    {
        var _dx = 0;
        var _dy = 0;
        var _dx2 = 0;
        var _dy2 = 0;
        grabbed = -4;
        if (facing == 1)
        {
            _dx = 16;
            _dx2 = 18;
            _dy2 = 16;
            _dy = -4;
        }
        if (facing == 3)
        {
            _dx = -48;
            _dx2 = 14;
            _dy2 = 16;
            _dy = -4;
        }
        if (facing == 0)
        {
            _dy = 16;
            _dy2 = 20;
            _dx = -8;
            _dx2 = 8;
        }
        if (facing == 2)
        {
            _dy = -20;
            _dy2 = -16;
            _dx = -8;
            _dx2 = 8;
        }
        if (obj_board_controller.pathfind_debug)
        {
            anim = instance_create(x + _dx2, y + _dy2, obj_marker);
            anim.sprite_index = spr_whitepixel;
            anim.image_xscale = 4;
            anim.image_yscale = 4;
            anim.image_blend = c_red;
            anim = instance_create(((x + 32) - 1) + _dx, ((y + 32) - 1) + _dy, obj_marker);
            anim.sprite_index = spr_whitepixel;
            anim.image_xscale = 4;
            anim.image_yscale = 4;
            anim.image_blend = c_red;
        }
        for (var i = 0; i < array_length(grabbablelist); i++)
        {
            if (grabbed == -4)
            {
                if (graballpots == true && graballpots_con != 3)
                {
                    grabbed = collision_rectangle(x + _dx2, y + _dy2, ((x + 32) - 1) + _dx, ((y + 32) - 1) + _dy, obj_board_grabbleObject, false, true);
                }
                else if (graballpots == true && graballpots_con == 3)
                {
                    grabbed = collision_rectangle(x - 999, y - 999, x + 999, y + 999, obj_board_controller.ralsei_object, false, true);
                }
                else
                {
                    grabbed = collision_rectangle(x + _dx2, y + _dy2, ((x + 32) - 1) + _dx, ((y + 32) - 1) + _dy, grabbablelist[i], false, true);
                    if (i_ex(grabbed))
                    {
                        if (!controlled || global.flag[1023] == 1)
                        {
                            if (grabbed.object_index == obj_mainchara_board)
                            {
                                if (controlled)
                                    scr_board_blcon(grabbed.x, grabbed.y - 24, 4290);
                                grabbed = -4;
                            }
                        }
                        if (i_ex(grabbed))
                        {
                            if (grabbed.object_index == obj_mainchara_board)
                            {
                                if (grabbed.name == "kris")
                                {
                                    if (controlled)
                                        scr_board_blcon(grabbed.x, grabbed.y - 24, 4290);
                                    grabbed = -4;
                                }
                            }
                        }
                    }
                    if (i_ex(grabbed))
                    {
                        if (grabbed.object_index == obj_pushableblock_board)
                        {
                            if (grabbed.sprite_index != spr_ralsei_board_stoolforme)
                            {
                            }
                        }
                    }
                }
            }
        }
        if (grabbed != -4)
        {
            if (grabbed.object_index != obj_mainchara_board)
                mp_grid_clear_cell(global.grid, floor(grabbed.x / 32), floor(grabbed.y / 32));
            grab = 1;
            grabmarker = instance_create(x, y, obj_board_grabobject);
            with (grabmarker)
            {
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
        if (grabbed == -4)
        {
            if (place_meeting(x, y, obj_board_grabbablegrass))
            {
                grabbed = instance_place(x, y, obj_board_grabbablegrass);
                grabbed.grabdaddy = id;
                grabbed.con = 1;
                grab = 1;
                fun = 1;
                canfreemove = 0;
                facing = 0;
                sprite_index = spr_board_susie_dig;
                image_speed = 0;
                image_index = 0;
                global.flag[1256]++;
                if (global.flag[1256] > 99)
                    global.flag[1256] = 99;
                if (room == room_board_3)
                    obj_b3grassjoke.grasspullcount++;
                if (room == room_dw_b3bs_rouxls_lanina)
                    global.flag[1108]++;
            }
        }
    }
    else if (i_ex(grabmarker))
    {
        if ((grabmarker.blocked != 0 || graballpots == true) && grabmarker.con == 0 && canfreemove == true && grabmarker.throwbuff <= 0)
        {
            canfreemove = 0;
            grabmarker.con = 1;
            snd_play(snd_board_throw);
        }
    }
}
if (scr_debug() && name == "kris")
{
    if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("V")))
    {
        camera = !camera;
        snd_play_pitch(snd_won, 0.8 + (camera / 4));
        scr_debug_print("CAMERA: " + string(camera));
    }
}
if (scr_debug())
{
    if (keyboard_check(ord("C")) && keyboard_check_pressed(ord("M")))
    {
        canfreemove = true;
        cantleave = false;
        if (controlled)
            debug_print("debug: Can now move and leave the room");
    }
}
camwidth = 4;
camheight = 3;
var canphoto = true;
var makesign = true;
if (i_ex(obj_board_camsolid))
{
    with (obj_mainchara_board)
    {
        if (controlled)
        {
            if (place_meeting(x, y, obj_board_camsolid))
                canphoto = false;
        }
    }
}
if (i_ex(obj_board_lawnmower))
{
    if (obj_board_lawnmower.active)
    {
        canphoto = false;
        makesign = false;
    }
}
if (camera == false)
{
    if (room == room_dw_puzzlecloset_3 && global.flag[1244] == 1)
        camera = true;
}
if (camera)
{
    if (!i_ex(obj_board_camera))
        cambuff = 0;
    else if (obj_board_camera.shift != "none")
        cambuff = 2;
    else if (cambuff > 0)
        cambuff--;
}
if (camera == true && name == "kris" && controlled == 1 && (canfreemove == true || (boat == true && !i_ex(obj_board_playercamera))) && global.interact == 0 && obj_board_camera.con == 0 && interacted == 0 && cambuff <= 0 && !instance_exists(obj_gameover_minigame))
{
    if (press_1 || takephoto == true)
    {
        takephoto = false;
        if (canphoto)
        {
            canfreemove = false;
            var playxround = round(x / 32) * 32;
            var playyround = round(y / 32) * 32;
            playxround -= ((camwidth / 2) * 32);
            playyround -= ((camheight / 2) * 32);
            playxround = round(playxround / 32) * 32;
            playyround = round(playyround / 32) * 32;
            mycam = instance_create(playxround, playyround, obj_board_playercamera);
            mycam.camwidth = camwidth;
            mycam.camheight = camheight;
        }
        else if (makesign)
        {
            with (obj_board_marker)
            {
                if (sprite_index == spr_board_nophoto)
                    instance_destroy();
            }
            var cantphoto = instance_create(x, y - 24, obj_board_marker);
            cantphoto.sprite_index = spr_board_nophoto;
            cantphoto.image_speed = 0.2;
            cantphoto.image_index = 1;
            cantphoto.vspeed = -2.8;
            cantphoto.gravity = 0.2;
            cantphoto.depth = depth - 1;
            if (cantphoto.y <= 64)
                cantphoto.y = 64;
            scr_darksize(cantphoto);
            scr_doom(cantphoto, 20);
            with (cantphoto)
                scr_delay_var("gravity", 0, 15);
            with (cantphoto)
                scr_delay_var("vspeed", 0, 15);
            snd_stop(snd_error);
            snd_play(snd_error);
        }
    }
}
if (press_1 == 1 && controlled == 1 && name == "kris" && sword == true && swordbuffer <= 0 && (global.interact == 0 || interactoverride == true) && (canfreemove == 1 || boat == true) && obj_board_camera.con == 0 && interacted == 0)
{
    swordbuffer = 8;
    swordfacing = facing;
    canfreemove = 0;
    snd_play(choose(snd_board_sword1, snd_board_sword2, snd_board_sword3));
}
if (swordbuffer > 0)
{
    swordbuffer--;
    if (swordbuffer == 7 || swordbuffer == 6 || swordbuffer == 5 || swordbuffer == 4 || swordbuffer == 0)
    {
        if (press_d == 1)
            swordfacing = 0;
        if (press_u == 1)
            swordfacing = 2;
        if (press_r == 1)
            swordfacing = 1;
        if (press_l == 1)
            swordfacing = 3;
        if (swordbuffer == 4)
        {
            swordhitbox.facing = swordfacing;
            swordhitbox.init = 0;
        }
    }
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
    if (swordbuffer == 6)
    {
        with (obj_board_swordhitbox)
            instance_destroy();
        swordhitbox = instance_create(x, y, obj_board_swordhitbox);
        swordhitbox.facing = facing;
        swordhitbox.swordlv = swordlv;
        swordhitbox.parentid = id;
    }
    if (i_ex(obj_board_enemy_deer) && obj_board_enemy_deer.follow == true && swordbuffer == 4)
    {
        obj_board_enemy_deer.flashtimer = 10;
        ice = instance_create(obj_board_enemy_deer.x + 16, obj_board_enemy_deer.y + 16, obj_board_enemy_deer_ice_spell);
        ice.speed = 12;
        ice.direction = -90 + (facing * 90);
        with (obj_board_enemy_deer)
        {
            for (var i = 75; i > 0; i -= 1)
                facingdir[i] = other.facing;
            switch (other.facing)
            {
                case 0:
                    sprite_index = spr_board_deer_downsprite;
                    break;
                case 1:
                    sprite_index = spr_board_deer_rightsprite;
                    break;
                case 2:
                    sprite_index = spr_board_deer_upsprite;
                    break;
                case 3:
                    sprite_index = spr_board_deer_leftsprite;
                    break;
            }
        }
    }
}
var stoolevolume = 0.6;
if (name == "ralsei")
{
    if (i_ex(stool) && global.flag[1015] == 0)
    {
        if (obj_board_camera.con != 0)
        {
            setxy(stool.x, stool.y);
            safe_delete(stool);
            stoolforme = 0;
            image_alpha = 1;
            var puff = instance_create(x, y, obj_board_smokepuff);
            puff.image_blend = #13D26F;
        }
    }
    var canstool = true;
    if (obj_board_camera.shift != "none")
        canstool = false;
    if (stoolbuff > 0)
        stoolbuff--;
    if ((controlled == 1 && global.interact == 0) || goStoole == 1)
    {
        if (stoolforme == 0 && stoolbuff <= 0 && (press_1 == 1 || goStoole == 1))
        {
            if (room == room_dw_puzzlecloset_3)
            {
                if (place_meeting(x, y, obj_board_nothrow))
                    canstool = false;
            }
            if (canstool)
            {
                goStoole = 0;
                stoolx = round(x / 32) * 32;
                stooly = round(y / 32) * 32;
                if (stooly < bbox_top)
                    stooly += 32;
                if (stooly > bbox_bottom)
                    stooly -= 32;
                x = stoolx;
                y = stooly;
                stool = instance_create(stoolx, stooly, obj_pushableblock_board);
                stool.sprite_index = spr_ralsei_board_stoolforme;
                var puff = instance_create(x, y, obj_board_smokepuff);
                puff.image_blend = #13D26F;
                snd_play_x(snd_board_ralsei_cube, stoolevolume, 1);
                canfreemove = 0;
                image_alpha = 0;
                stoolbuff = 3;
                stoolforme = 2;
            }
        }
    }
    if ((stoolforme == 2 && controlled == 1 && global.interact == 0 && (press_1 == 1 || press_2 == 1) && stoolbuff <= 0) || unstoole == 1)
    {
        unstoole = 0;
        if (i_ex(stool))
        {
            snd_play_x(snd_board_ralsei_cube, stoolevolume, 0.7);
            debug_message("unstooled");
            setxy(stool.x, stool.y);
            with (stool)
                instance_destroy();
            var puff = instance_create(x, y, obj_board_smokepuff);
            puff.image_blend = #13D26F;
            canfreemove = 1;
            stoolforme = 0;
            image_alpha = 1;
            scr_board_caterpillar_interpolate_ralsei();
            stoolbuff = 3;
        }
    }
}
if (switchchar == true)
    switchbuff--;
if (i_ex(obj_board_writer) || i_ex(obj_writer))
    switchbuff = 10;
if (switchbuff <= 0 && switchchar == true && controlled && global.interact == 0 && button3_p() && (canfreemove == true || name == "ralsei"))
{
    with (obj_mainchara_board)
        switchbuff = 2;
    if (controlled == true)
    {
        var nextname = "susie";
        switch (name)
        {
            case "kris":
                nextname = "susie";
                break;
            case "susie":
                nextname = "ralsei";
                break;
            case "ralsei":
                nextname = "kris";
                break;
        }
        debug_message(string(id) + ":" + nextname + "| controlled=" + string(controlled));
        var newcharfound = 0;
        with (obj_mainchara_board)
        {
            if (name == nextname)
                newcharfound = id;
        }
        if (i_ex(newcharfound))
        {
            controlled = 0;
            with (newcharfound)
            {
                controlled = 1;
                snd_play(snd_board_text_main);
                with (obj_board_marker)
                {
                    if (sprite_index == spr_board_controlledicon)
                        instance_destroy();
                }
                var controlmarker = instance_create(x, y - 24, obj_board_marker);
                if (name == "ralsei" && i_ex(stool))
                {
                    controlmarker.x = stool.x;
                    controlmarker.y = stool.y;
                }
                controlmarker.sprite_index = spr_board_controlledicon;
                controlmarker.vspeed = -2.8;
                controlmarker.gravity = 0.2;
                controlmarker.depth = depth - 1;
                if (controlmarker.y <= 64)
                    controlmarker.y = 64;
                scr_darksize(controlmarker);
                scr_doom(controlmarker, 15);
            }
        }
    }
}
hookshot = global.flag[1026];
if (hookshot == true)
    hookbuff--;
if ((hookshot == true && hookbuff <= 0 && button2_p() && canfreemove == true && controlled == 1 && grab == 0 && global.interact == 0 && name != "ralsei") || forcehook == true)
{
    forcehook = false;
    if (hookcon == 0)
    {
        hookbuff = 3;
        canfreemove = false;
        var hookx = x + 16;
        var hooky = y + 16;
        if (facing == 0)
        {
            hookx += 0;
            hooky += 16;
        }
        if (facing == 1)
        {
            hookx += 16;
            hooky += 8;
        }
        if (facing == 2)
        {
            hookx += 0;
            hooky -= 16;
        }
        if (facing == 3)
        {
            hookx -= 16;
            hooky += 8;
        }
        hook = instance_create(hookx, hooky, obj_board_hookshot);
        hook.hookdaddy = id;
        hook.direction = (facing * 90) - 90;
        hook.depth = 999990;
        hookcon = 1;
    }
}
if (hookcon == 1 && !i_ex(hook))
{
    hookcon = 0;
    canfreemove = true;
}
var _kris = 0;
with (obj_mainchara_board)
{
    if (name == "kris")
        _kris = id;
}
if (controlled == 1)
{
    if (battlemode == true)
    {
        canfreemove = 0;
        if (!i_ex(obj_gameshow_battlemanager))
        {
            battlemode = false;
            canfreemove = 1;
            with (obj_board_parent)
                event_user(11);
        }
    }
    if (quizmode == true)
    {
        canfreemove = 0;
        if (!i_ex(obj_quizsequence))
        {
            quizmode = false;
            canfreemove = 1;
            with (obj_board_parent)
                event_user(11);
        }
    }
    var susieholdingkris = 0;
    if (name == "susie")
    {
        if (i_ex(obj_board_grabobject) && i_ex(_kris))
        {
            if (obj_board_grabobject.grabbedid == _kris)
                susieholdingkris = true;
        }
    }
    if (name == "elnina")
    {
        if (button1_p() && global.interact == 0 && cry == 0)
        {
            canfreemove = false;
            fun = 1;
            crybuffer = 16;
            cry = 1;
        }
        if (cry == 1)
        {
            fun = 1;
            sprite_index = spr_board_elnina_cry;
            if ((crybuffer % 5) == 0 && crybuffer > 0)
            {
                if (button1_h() && !button1_p())
                    crybuffer += 5;
                snd_stop(snd_board_kill);
                snd_play_x(snd_board_kill, 0.8, 2.5);
                with (instance_create_depth(x + 22, y, depth - 1, obj_board_crytear))
                {
                    image_blend = #5ACEDE;
                    image_xscale = 4;
                    image_yscale = 4;
                    gravity = 0.4;
                    vspeed = -2;
                    hspeed = 2;
                    scr_doom(id, 16);
                }
                with (instance_create_depth(x + 4, y, depth - 1, obj_board_crytear))
                {
                    image_blend = #5ACEDE;
                    image_xscale = 4;
                    image_yscale = 4;
                    gravity = 0.4;
                    vspeed = -2;
                    hspeed = -2;
                    scr_doom(id, 16);
                }
            }
            crybuffer--;
            if (button1_p())
                crybuffer = 15;
            if (crybuffer <= 0 && !i_ex(obj_board_crytear))
            {
                fun = 0;
                cry = 0;
                canfreemove = true;
                facing = 0;
            }
            if (crybuffer > 0)
                image_index += 0.25;
        }
    }
    if (name == "lancer")
    {
        if (button1_p() && global.interact == 0 && digfreeze == false)
        {
            var x1 = x - 10;
            var x2 = x + 10;
            var y1 = y + 10;
            var y2 = y + 30;
            var digmark = collision_rectangle(x1, y1, x2, y2, obj_board_treasuremarker, 0, 1);
            if (i_ex(digmark))
            {
                snd_stop(snd_board_splash);
                snd_play_pitch(snd_board_splash, 1);
                var digx = digmark.x;
                var digy = digmark.y;
                digmark.digamt--;
                if (digmark.digamt <= 0)
                {
                    with (digmark)
                        event_user(2);
                }
                with (instance_create(digx, digy, obj_board_smokepuff))
                {
                    image_blend = #FFECBD;
                    image_speed = 1;
                    depth = other.depth + 1;
                }
            }
            digcon = 1;
            digtimer = 0;
            fun = 1;
            sprite_index = spr_board_lancer_dig;
            image_speed = 0;
            image_index = 0;
            canfreemove = false;
        }
        if (digcon == 1)
        {
            digtime++;
            if (digtime == 4)
                image_index = 1;
            if (digtime == 8)
            {
                fun = 0;
                if (digfreeze == false)
                    canfreemove = true;
                digtime = 0;
                digcon = 0;
                facing = 3;
            }
        }
    }
    var totaloverwrite = 0;
    if (room == room_dw_puzzlecloset_3)
        totaloverwrite = 1;
    if (canfreemove == 1 && controlled == 1 && boat == false && (name == "kris" || susieholdingkris == true || totaloverwrite) && !freeroam)
    {
        var __canscreentransition = true;
        if ((scr_debug() && susierecordcon != 0) || cantleave == true || nocamtransition == true)
            __canscreentransition = false;
        if (__canscreentransition == true)
        {
            if (x > _rightbound)
            {
                x = _rightbound;
                if (!place_meeting(x + 32, y, obj_board_solid))
                {
                    facing = 1;
                    canfreemove = 0;
                    with (obj_board_camera)
                        shift = "right";
                }
            }
            if (x < _leftbound)
            {
                x = _leftbound;
                if (!place_meeting(x - 32, y, obj_board_solid))
                {
                    facing = 3;
                    canfreemove = 0;
                    with (obj_board_camera)
                        shift = "left";
                }
            }
            if (y > _downbound)
            {
                y = _downbound;
                if (!place_meeting(x, y + 32, obj_board_solid))
                {
                    canfreemove = 0;
                    with (obj_board_camera)
                        shift = "down";
                }
            }
            if (y < _upbound)
            {
                y = _upbound;
                if (!place_meeting(x, y - 32, obj_board_solid))
                {
                    facing = 2;
                    canfreemove = 0;
                    with (obj_board_camera)
                        shift = "up";
                }
            }
            if (place_meeting(x, y, obj_board_warpentrance))
            {
                var warp = instance_place(x, y, obj_board_warpentrance);
                with (obj_board_camera)
                {
                    if (shift != "none")
                    {
                        warpx = warp.warpx;
                        warpy = warp.warpy;
                        playerX = warp.playerX;
                        playerY = warp.playerY;
                        shift = "warp";
                        if (warp.playStairsSound)
                            snd_play(snd_board_escaped);
                    }
                }
            }
        }
        if (cantleave == true)
        {
            x = clamp(x, _leftbound, _rightbound);
            y = clamp(y, _upbound, _downbound);
        }
    }
}
if (global.flag[1016] == 0 && obj_board_camera.con == 0 && !freeroam)
{
    x = clamp(x, _leftbound, _rightbound);
    y = clamp(y, _upbound, _downbound);
}
if (forget == true)
{
    forget = false;
    for (var i = 0; i < 75; i += 1)
    {
        remx[i] = x;
        remy[i] = y;
    }
}
if (obj_board_camera.active || !canfreemove || global.interact == 1 || runawayfromsusie == true)
{
    path_speed = 0;
}
else
{
    path_speed = 4;
    _kris = obj_board_controller.kris_object;
    if (is_moving == true)
    {
        if (path_position != 1)
            image_index += 0.125;
        is_moving_timer++;
        if (is_moving_timer == 1)
        {
            if (path_target_x == 1 || path_target_y != -1)
            {
                if (name == "susie")
                {
                    if (mp_grid_path(global.grid, path, x + 16, y + 16, path_target_x, path_target_y, allow_diagonals))
                    {
                        path_start(path, 4, path_action_stop, false);
                    }
                    else
                    {
                        debugpathmessage = 1;
                        is_moving = false;
                    }
                }
                if (name == "kris")
                {
                    if (mp_grid_path(global.grid, path, x + 16, y + 16, path_target_x, path_target_y, allow_diagonals))
                    {
                        path_start(path, 4, path_action_stop, false);
                    }
                    else
                    {
                        debugpathmessage = 1;
                        is_moving = false;
                    }
                }
                if (name == "ralsei")
                {
                    if (mp_grid_path(global.grid, path, x + 16, y + 16, path_target_x, path_target_y, allow_diagonals))
                    {
                        path_start(path, 4, path_action_stop, false);
                    }
                    else
                    {
                        debugpathmessage = 1;
                        is_moving = false;
                    }
                }
            }
            else
            {
                if (name == "susie")
                {
                    var x_cell = floor(_kris.x / global.cell_size);
                    var y_cell = floor((_kris.y + 18) / global.cell_size);
                    var position_x = (x_cell * global.cell_size) + (global.cell_size / 2);
                    var position_y = (y_cell * global.cell_size) + (global.cell_size / 2);
                    if (mp_grid_path(global.grid, path, x + 16, y + 16, position_x, position_y, allow_diagonals))
                        path_start(path, 4, path_action_stop, false);
                    else
                        show_debug_message("PATHFINDING ERROR 3: cannot path to target location");
                }
                if (name == "ralsei")
                {
                    var x_cell = floor(_kris.x / global.cell_size);
                    var y_cell = floor((_kris.y + 18) / global.cell_size);
                    var position_x = (x_cell * global.cell_size) + (global.cell_size / 2);
                    var position_y = (y_cell * global.cell_size) + (global.cell_size / 2);
                    if (mp_grid_path(global.grid, path, x + 16, y + 16, position_x, position_y, allow_diagonals))
                        path_start(path, 4, path_action_stop, false);
                    else
                        show_debug_message("PATHFINDING ERROR 4: cannot path to target location");
                }
            }
        }
        var diag = 0;
        if (direction == 45 || direction == 315 || direction == 135 || direction == 225)
            diag = 1;
        if (path_target_x == 1 || path_target_y != -1)
        {
        }
        else if ((is_moving_timer >= 9 && diag == 0) || (is_moving_timer >= 12 && diag == 1))
        {
            is_moving_timer = 0;
            path_end();
            speed = 0;
            if (distance_to_object(_kris) < 24 && graballpots == false && chaseralsei == false)
                is_moving = false;
        }
        if ((direction <= 47 && direction >= 0) || direction > 317)
        {
            sprite_index = rsprite;
            facing = 1;
        }
        if (direction > 47 && direction <= 137)
        {
            sprite_index = usprite;
            facing = 2;
        }
        if (direction > 137 && direction <= 227)
        {
            sprite_index = lsprite;
            facing = 3;
        }
        if (direction > 227 && direction <= 317)
        {
            sprite_index = dsprite;
            facing = 0;
        }
    }
    if (name == "ralsei" && follow)
    {
        if (_kris.hitcon != 1)
        {
            moved = 0;
            if (_kris.x != remx[0])
                moved = 1;
            if (_kris.y != remy[0])
                moved = 1;
            if (moved == 1)
            {
                for (var i = 75; i > 0; i -= 1)
                {
                    remx[i] = remx[i - 1];
                    remy[i] = remy[i - 1];
                    facingdir[i] = facingdir[i - 1];
                }
                remx[0] = _kris.x;
                remy[0] = _kris.y;
                facingdir[0] = _kris.facing;
                if (ralsei_target < 20)
                    ralsei_target++;
            }
            else if (ralsei_target > 10)
            {
                ralsei_target--;
            }
            x = remx[ralsei_target];
            y = remy[ralsei_target];
            facing = facingdir[ralsei_target];
        }
        for (var i = 10; i > 0; i -= 1)
        {
            ralx[i] = ralx[i - 1];
            raly[i] = raly[i - 1];
        }
        ralx[0] = x;
        raly[0] = y;
        if (ralx[0] != ralx[1] || raly[0] != raly[1])
            image_index += 0.125;
        else
            image_index = 0;
    }
}
if (name == "kris")
{
    if (xp >= xptolevel || (scr_debug() && sword && keyboard_check_pressed(ord("O"))))
    {
        xp = 0;
        swordlv++;
        snd_stop(snd_board_ominous);
        snd_play(snd_board_ominous);
        swordlv = clamp(swordlv, 1, 5);
        if (swordlv == 2)
            xptolevel = 24;
        if (swordlv == 3)
            xptolevel = 15;
        if (swordlv == 4)
            xptolevel = 14;
        if (swordlv == 5)
            xptolevel = 68;
        if (room == room_board_1)
        {
        }
        if (room == room_board_dungeon_2)
        {
            if (swordlv == 2)
                xptolevel = 4;
            if (swordlv == 3)
                xptolevel = 11;
        }
    }
}
if (i_ex(obj_board_camera) && obj_board_camera.con == 0)
{
    if (x < 129 || x > 479 || y < 65 || y > 287)
    {
        atdoorway = true;
    }
    else
    {
        leftdoorway = true;
        atdoorway = false;
    }
}
sleeping = false;
with (obj_mainchara_board)
{
    if (boat == true)
        other.sleepytimer = 0;
}
if (sleepy == true)
{
    if (!i_ex(obj_board_grabobject))
        sleepytimer++;
    if (speed != 0 || is_moving || press_l || press_r || press_u || press_d || press_1 || press_2 || global.interact != 0 || bw_ex() || d_ex() || i_ex(obj_quizsequence))
        sleepytimer = 0;
    if (sleepytimer > 300)
    {
        facing = 0;
        sleeping = true;
        sprite_index = sleepsprite;
        if ((sleepytimer % 30) == 0)
            image_index = !image_index;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("H")))
        myhealth = 1;
}
if (name == "ralsei")
    depth += 1;
if (is_moving == 0 && controlled == 0)
{
    x = round(x);
    y = round(y);
}
if (ribbon == true)
{
    if (abs(bowx - x) > 40)
    {
        bowx = x;
        bowy = y;
    }
}
if (stink)
{
    stinktimer++;
    if ((stinktimer % 5) == 0)
    {
        var _sx = x;
        var _sy = y;
        var _dp = depth - 1;
        if (name == "ralsei")
        {
            if (i_ex(stool))
            {
                _sx = stool.x;
                _sy = stool.y;
                _dp = stool.depth - 1;
            }
        }
        var stinky = scr_board_marker(_sx + 16 + irandom_range(-8, 8), _sy + 2, spr_pxwhite, 0, depth + 1, choose(2, 2, 2, 2, 2, 4));
        scr_doom(stinky, irandom(4) + 8);
        stinky.vspeed = -2;
        stinky.depth = _dp;
        stinky.image_blend = merge_color(#5EAC37, #30790B, random(1));
        stinky.friction = 0.2;
    }
}
if (room == room_dw_b3bs_lancerget)
    x = clamp(x, camerax(), (camerax() + 640) - 32);
if (scr_debug())
{
    if (debugpathmessage)
    {
        if (scr_debug())
        {
            debug_message("==========================");
            debug_message(name + ": PATHFINDING ERROR 1: cannot path to target location");
            debug_message(name + ": tile target:" + string((path_target_x - 128 - 16) / 32) + " | " + string((path_target_y - 64 - 16) / 32));
            debug_message(name + ": x/y  target:" + string(path_target_x) + " | " + string(path_target_y));
            show_debug_message("==========================");
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_13 = 13
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}

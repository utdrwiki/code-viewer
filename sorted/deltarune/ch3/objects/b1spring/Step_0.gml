if (init == 0)
    init = 1;
if (lmark == 0)
{
    with (obj_board_treasuremarker)
    {
        if (image_index == 0)
            other.lmark = id;
    }
}
if (i_ex(lmark))
    depth = lmark.depth - 1;
if (kr == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kr = id;
    }
}
if (su == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.su = id;
    }
}
if (ra == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ra = id;
    }
}
if (inventory == 0)
    inventory = 1730;
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susiereal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susiereal = id;
    }
}
if (ralseireal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralseireal = id;
    }
}
var mytrigger = "lancerdig";
if (active == 1 && obj_board_camera.con == 0)
{
    if (obj_board_inventory.lancer != 0)
        visit = 99;
    if (susiewalk == 0)
    {
        scr_pathfind_to_point("susie", 5, 3);
        susiewalk = -1;
        scr_script_delayed(scr_var, irandom(10) + 10, "susiewalk", 1);
    }
    if (susiewalk == 1)
    {
        if (su.is_moving == false)
        {
            sutimer++;
            if (sutimer >= sutimertarget)
            {
                var targx = 3;
                var targy = 2;
                var _rand = irandom(7);
                switch (_rand)
                {
                    case 0:
                        targx = 3;
                        targy = 2;
                        break;
                    case 1:
                        targx = 6;
                        targy = 2;
                        break;
                    case 2:
                        targx = 8;
                        targy = 1;
                        break;
                    case 3:
                        targx = 9;
                        targy = 3;
                        break;
                    case 4:
                        targx = 1;
                        targy = 4;
                        break;
                    case 5:
                        targx = 3;
                        targy = 6;
                        break;
                    case 6:
                        targx = 10;
                        targy = 5;
                        break;
                    case 7:
                        targx = 9;
                        targy = 6;
                        break;
                }
                if (su.x != board_tilex(targx) && su.y != board_tiley(targy))
                    scr_pathfind_to_point("susie", targx, targy, -1, 0);
                sutimertarget = 45 + irandom(90);
                sutimer = 0;
            }
        }
    }
    if (con == 0 && obj_board_camera.con == 0 && obj_board_inventory.lancer != 0)
    {
        var triggered = 0;
        with (kr)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                var inst = instance_place(x, y, obj_board_trigger);
                if (inst.extflag == mytrigger)
                    triggered = 1;
            }
        }
        if (triggered == 1)
        {
            inventory = 1730;
            lancer = instance_create(inventory.x + 8, inventory.y + 10 + 96, obj_board_marker);
            lancer.sprite_index = spr_board_lancer_down;
            lancer.depth = 5000;
            scr_darksize(lancer);
            inventory.lancer = 0;
            with (obj_board_trigger)
            {
                if (extflag == mytrigger)
                    instance_destroy();
            }
            global.interact = 1;
            snd_play(snd_item);
            con = -999;
            scr_script_delayed(scr_var, 6, "con", 1);
        }
    }
    if (con == 1)
    {
        snd_play(snd_jump);
        with (lancer)
            scr_jump_to_point_board(board_tilex(3), board_tiley(4), 12, 15);
        timer = 0;
        con = 2;
    }
    if (con == 2)
    {
        var startframe = 25;
        var spinspeed = 2;
        timer++;
        if (timer == 1)
        {
        }
        if (timer == 15)
        {
            with (lancer)
                scr_depth_board();
        }
        if (timer == (startframe + (spinspeed * 0)))
            lancer.sprite_index = spr_board_lancer_left;
        if (timer == (startframe + (spinspeed * 1)))
            lancer.sprite_index = spr_board_lancer_up;
        if (timer == (startframe + (spinspeed * 2)))
            lancer.sprite_index = spr_board_lancer_right;
        if (timer == (startframe + (spinspeed * 3)))
            lancer.sprite_index = spr_board_lancer_down;
        if (timer == (startframe + (spinspeed * 4)))
            lancer.sprite_index = spr_board_lancer_left;
        if (timer == (startframe + (spinspeed * 5)))
            lancer.sprite_index = spr_board_lancer_up;
        if (timer == (startframe + (spinspeed * 6)))
            lancer.sprite_index = spr_board_lancer_right;
        if (timer == (startframe + (spinspeed * 7)))
            lancer.sprite_index = spr_board_lancer_down;
        if (timer == (startframe + (spinspeed * 7) + 4))
        {
            scr_boardlancer_voice();
            scr_speaker("no_name");
            msgsetloc(0, "HO HO HO!^1! L MARKS THE SPOT!/", "obj_b1spring_slash_Step_0_gml_186_0");
            msgnextloc("I'LL DIG UP A TREASURE FOR YOU!/%", "obj_b1spring_slash_Step_0_gml_187_0");
            bw_make();
            con = 3;
            timer = 0;
        }
    }
    if (con == 3 && !bw_ex())
    {
        var digspeed = 21;
        var jumplength = round(digspeed * 0.75);
        if (timer == 0)
        {
            snd_pause(global.currentsong[1]);
            var lancersong = snd_init("board_lancer_dig.ogg");
            snd_play(lancersong);
            lancer.sprite_index = spr_board_lancer_dig;
            lancer.image_speed = 0.05;
            bouldercount = 0;
        }
        timer++;
        if (timer == (digspeed * (1 + bouldercount)) && bouldercount < 8)
        {
            boulder[bouldercount] = instance_create(lancer.x + 16, lancer.y + 16, obj_board_marker);
            boulder[bouldercount].sprite_index = spr_board_boulder;
            boulder[bouldercount].depth = lancer.depth - 10 - bouldercount;
            snd_play(snd_board_throw);
            scr_darksize(boulder[bouldercount]);
            var jumpamt = 10 + irandom(4);
            switch (bouldercount)
            {
                case 0:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(5) + 16, board_tiley(4) + 16, jumpamt, jumplength);
                    break;
                case 1:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(6) + 16, board_tiley(5) + 16, jumpamt, jumplength);
                    break;
                case 2:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(7) + 16, board_tiley(4) + 16, jumpamt, jumplength);
                    break;
                case 3:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(8) + 16, board_tiley(5) + 16, jumpamt, jumplength);
                    break;
                case 4:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(5) + 16, board_tiley(5) + 16, jumpamt, jumplength);
                    break;
                case 5:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(6) + 16, board_tiley(4) + 16, jumpamt, jumplength);
                    break;
                case 6:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(7) + 16, board_tiley(5) + 16, jumpamt, jumplength);
                    break;
                case 7:
                    with (boulder[bouldercount])
                        scr_jump_to_point_board(board_tilex(8) + 16, board_tiley(4) + 16, jumpamt, jumplength);
                    break;
            }
            if (bouldercount == 7)
            {
                with (obj_board_treasuremarker)
                {
                    if (image_index == 0)
                        instance_destroy();
                }
            }
            snd_play_delay(snd_board_splash, jumplength);
            bouldercount++;
        }
        if (timer == ((digspeed * 9) + jumplength))
        {
            obj_board_smallpond.wither = 1;
            obj_board_smallpond.lancered = 1;
        }
        if (timer == ((digspeed * 8) + jumplength + 5))
        {
            lancer.sprite_index = spr_board_lancer_down;
            key = instance_create(lancer.x, lancer.y + 32, obj_board_pickup);
            key.type = "key";
            key.con = 2;
            key.image_index = 6;
            key.image_speed = 0;
            key.depth = lancer.depth;
            with (key)
                scr_jump_to_point_board(board_tilex(6.5), board_tiley(4), 20, round(digspeed * 0.75) + 1);
            snd_play(snd_board_throw);
            snd_play_delay(snd_item, round(digspeed * 0.75) + 1);
        }
        if (timer == ((digspeed * 8) + jumplength))
        {
            obj_board_smallpond.wither = 1;
            obj_board_smallpond.lancered = 1;
            obj_board_oasis.wither = 2;
        }
        if (timer == ((digspeed * 8) + jumplength + 5))
        {
            with (obj_board_marker)
            {
                if (sprite_index == other.boulder[0].sprite_index)
                    depth = obj_board_smallpond.depth - 1;
            }
        }
        if (timer == 206)
        {
            with (obj_board_event_ninfight)
                plugged = 1;
            lancer.sprite_index = spr_board_lancer_down;
            with (key)
                scr_depth_board();
            scr_boardlancer_voice();
            msgsetloc(0, "HOW'S THAT!? A KEY FOR YOU!!/", "obj_b1spring_slash_Step_0_gml_292_0");
            msgnextloc("AS A BONUS^1, I BLOCKED THE WATER FROM FLOWING./", "obj_b1spring_slash_Step_0_gml_293_0");
            if (global.flag[1079] == 1)
            {
                msgsetloc(0, "LOOK^1! A KEY WAS SQUEEZED FROM THE FRAGRANT MUD./", "obj_b1spring_slash_Step_0_gml_297_0");
                msgnextloc("THE PIONEERS USED THIS TO MAKE KEY LIME PIE./", "obj_b1spring_slash_Step_0_gml_298_0");
            }
            msgnextloc("BYE NOW!/%", "obj_b1spring_slash_Step_0_gml_300_0");
            bw_make();
            LancerInTheGame = 1;
            con++;
        }
    }
    if (con == 4 && !bw_ex())
    {
        with (lancer)
            gravity = -0.5;
        snd_play(snd_slidewhistle);
        snd_volume(global.currentsong[1], 0, 0);
        snd_resume(global.currentsong[1]);
        snd_volume(global.currentsong[1], 1, 15);
        con = 5;
    }
    if (con == 5)
    {
        lancer.depth = 100000;
        if (lancer.y < 32)
        {
            safe_delete(lancer);
            global.interact = 0;
            with (key)
                scr_depth();
            con++;
        }
    }
}
else
{
    if (timer2 > 35)
        timer2 = 999;
    if (visit == 1)
        visit = 2;
    susiewalk = 0;
}
if (LancerInTheGame == 1)
{
    var trig = false;
    with (obj_b1enemy)
    {
        if (active)
            trig = true;
    }
    if (trig == true)
    {
        LancerInTheGame = 2;
        var sutalk = howislancerinthegame;
        scr_couchtalk(sutalk, "susie", 0, 120);
    }
}
if (LancerInTheGame == 2)
{
    if (global.interact == 0)
        LancerInTheGameTimer++;
    if (LancerInTheGameTimer >= 90)
    {
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = tennaexpl;
        scr_couchtalk(tetalk, "tenna", 0, 120);
        LancerInTheGameTimer = 0;
        LancerInTheGame = 3;
    }
}

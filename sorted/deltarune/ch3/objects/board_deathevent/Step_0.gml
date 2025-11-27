if (init == 0)
{
    scr_board_populatevars();
    scr_gameshow_populatevars();
    if (target == 0)
    {
        with (obj_mainchara_board)
        {
            if (controlled)
                other.target = id;
        }
    }
    if (name == "susie")
    {
        uspr = 4088;
        dspr = 486;
        lspr = 4651;
        rspr = 4699;
    }
    if (name == "ralsei")
    {
        uspr = 3913;
        dspr = 2318;
        lspr = 2864;
        rspr = 4162;
    }
    init = 1;
}
if (eventtype == 0)
{
    if (con == 0)
    {
        timer++;
        if (timer == 1)
        {
            target.iframes = 0;
            snd_play_pitch(snd_fall, 0.6);
            target.facing = 0;
        }
        var _spinspeed = 4;
        if (timer == (1 + (_spinspeed * 0)))
            target.sprite_index = target.dsprite_carry;
        if (timer == (1 + (_spinspeed * 1)))
            target.sprite_index = target.lsprite_carry;
        if (timer == (1 + (_spinspeed * 2)))
            target.sprite_index = target.usprite_carry;
        if (timer == (1 + (_spinspeed * 3)))
            target.sprite_index = target.rsprite_carry;
        if (timer == (1 + (_spinspeed * 4)))
            target.sprite_index = target.dsprite_carry;
        if (timer == (1 + (_spinspeed * 5)))
            target.sprite_index = target.lsprite_carry;
        if (timer == (1 + (_spinspeed * 6)))
            target.sprite_index = target.usprite_carry;
        if (timer == (1 + (_spinspeed * 7)))
            target.sprite_index = target.rsprite_carry;
        if (timer == (1 + (_spinspeed * 8)))
            target.sprite_index = target.dsprite_carry;
        if (timer == (1 + (_spinspeed * 9)))
            con = 0.5;
    }
    if (con == 0.5)
    {
        global.interact = 1;
        safe_delete(obj_couchwriter);
        safe_delete(obj_tennatalkbubble);
        tenna_1 = 157;
        remx = tenna_1.x;
        remy = tenna_1.y;
        remsprite = tenna_1.sprite_index;
        timer = 0;
        safe_delete(obj_board_boulder);
        safe_delete(obj_board_bomb);
        safe_delete(obj_shadow_mantle_cloud_bullet);
        con = -1;
        if (!i_ex(obj_gameover_minigame))
            instance_create(x, y, obj_gameover_minigame);
    }
    if (con == 9999)
    {
        with (obj_actor_tenna)
        {
            preset = 0;
            dropshadow = false;
            auto_depth = false;
            depth = 95180;
        }
        scr_resetgameshowcharacter("tenna");
        snd_volume(global.currentsong[1], 0, 0);
        snd_volume(global.currentsong[1], 1, 30);
        snd_resume(global.currentsong[1]);
        if (i_ex(target.checkpoint))
        {
            if (scr_board_onscreen(target.checkpoint))
            {
                var loc = 
                {
                    x: target.checkpoint.x,
                    y: target.checkpoint.y
                };
                with (obj_mainchara_board)
                    setxy(loc.x, loc.y);
            }
        }
        var liftedexception = false;
        with (obj_board_grabobject)
        {
            if (i_ex(grabbedid))
            {
                if (grabbedid.object_index == obj_mainchara_board)
                    liftedexception = true;
            }
        }
        with (obj_mainchara_board)
        {
            var dovis = function()
            {
                facing = 0;
                canfreemove = true;
                iframes = 30;
                image_alpha = 1;
            };
            
            myhealth = maxhealth;
            if (name == "ralsei")
            {
                if (follow)
                    scr_board_caterpillar_interpolate();
                if (!liftedexception)
                    dovis();
            }
            else if (name == "susie")
            {
                var dodovis = true;
                with (obj_b1susiedig)
                {
                    if (active)
                        dodovis = false;
                }
                if (dodovis)
                    dovis();
            }
            else
            {
                dovis();
            }
        }
        if (room == room_board_1)
        {
            if (instance_exists(obj_b1rocks1))
            {
                if (obj_b1rocks1.active)
                {
                    scr_play_recording("susie", "0W");
                    scr_play_recording("ralsei", "0W");
                }
            }
            if (i_ex(obj_b1enemy))
            {
                if (obj_b1enemy.active)
                {
                    scr_board_instawarp(896, 576, 896, 672);
                    with (obj_b1enemy)
                    {
                        var spawner = instance_create(x + 160, y + 96, obj_chaseenemy_board_spawner);
                        spawner.encounterno = 110;
                        spawner.encounterflag = 580;
                    }
                }
            }
            if (i_ex(obj_b1oasis))
            {
                if (obj_b1oasis.active)
                {
                    debug_print("we lost at the elnina/lanino battle");
                    scr_board_instawarp(896, 320, 1072, 320);
                    obj_board_event_ninfight.con = 0;
                    obj_board_event_ninfight.retry = 1;
                    with (obj_board_npc)
                    {
                        if (extflag == "elnina1")
                            sprite_index = spr_board_elnina_glasses_left;
                        if (extflag == "lanino1")
                            sprite_index = spr_board_lanino_glasses_right;
                    }
                }
            }
        }
        if (room == room_board_2)
        {
            if (i_ex(obj_b2danger1))
            {
                if (obj_b2danger1.active == true)
                {
                    with (obj_b2danger1)
                        resetevent = true;
                }
            }
            if (i_ex(obj_b2bossencounterroom))
            {
                if (obj_b2bossencounterroom.active == true)
                {
                    obj_b2bossencounterroom.retry = true;
                    obj_b2bossencounterroom.con = 0;
                    obj_b2bossencounterroom.rebuild = true;
                    scr_board_instawarp(896, 3392, 1024, 3552);
                }
            }
        }
        global.interact = 0;
        instance_destroy();
    }
}
if (eventtype == 6)
{
    timer++;
    if ((timer % 5) == 0)
        image_alpha -= 0.2;
    if (timer == 60)
        scr_board_instawarp(1440, 320, 1616, 398, "none", 117);
}

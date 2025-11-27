createphoto = false;
var photopoints = 10;
var _list = ds_list_create();
var _num = collision_rectangle_list(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, obj_board_photoparent, false, true, _list, false);
if (_num > 0)
{
    for (var i = 0; i < _num; i++)
    {
        with (ds_list_find_value(_list, i))
            event_user(3);
        photoarray[i] = ds_list_find_value(_list, i);
    }
}
ds_list_destroy(_list);
var _list2 = ds_list_create();
_num = collision_rectangle_list(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, obj_board_parent, false, true, _list, false);
if (_num > 0)
{
    for (var i = 0; i < _num; i++)
    {
        with (ds_list_find_value(_list2, i))
        {
            if (object_index == obj_mainchara_board)
            {
                var dontpose = false;
                var nosusiepose = true;
                if (name == "susie")
                {
                    if (i_ex(obj_board_grabobject))
                        dontpose = true;
                    with (obj_b2camera)
                    {
                        if (active)
                            nosusiepose = false;
                    }
                    with (obj_b2bossencounterroom)
                    {
                        if (active)
                            nosusiepose = false;
                    }
                }
                if (name != "kris" && !dontpose)
                {
                    var dopose = true;
                    if (name == "susie" && nosusiepose == true)
                        dopose = false;
                    if (dopose)
                    {
                        fun = 1;
                        facing = 0;
                        sprite_index = dsprite_item;
                    }
                }
                else if (i_ex(obj_b2camera))
                {
                    if (obj_b2camera.active == true && obj_b2camera.prebat == 0)
                    {
                        if (obj_b2camera.krisphoto == 0)
                            obj_b2camera.krisphoto = 1;
                    }
                }
            }
            if (object_index == obj_board_marker)
            {
                if (sprite_index == spr_board_rouxls)
                {
                    if (extflag == "photoless")
                    {
                        extflag = "photod";
                        var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
                        pointsDisplay.amount = -1;
                        if (global.flag[1044] == 0)
                            pointsDisplay.onlyvisual = true;
                    }
                }
            }
            if (object_index == obj_board_antlion)
            {
                if (con == 1)
                {
                    if (special)
                    {
                        with (object_index)
                            nospecialsanymore = true;
                        con = 99;
                        timer = 0;
                        other.createphoto = true;
                        other.flagtoset = 1227;
                        var memspeed = speed;
                        speed = 0;
                    }
                    else if (!photod)
                    {
                        var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
                        pointsDisplay.amount = photopoints;
                        photod = true;
                    }
                }
            }
            if (object_index == obj_chaseenemy_board)
            {
                var freezetime = 90;
                freeze = freezetime;
                speed = 0;
                remspeed = myspeed;
                scr_shakeobj(id, 20, 2);
            }
            if (object_index == obj_board_sadfriendo || object_index == obj_board_overlookfriendo)
            {
                var dopose = 45;
                if (!variable_instance_exists(id, "photod"))
                    photod = 0;
                if (photod == 0)
                {
                    var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
                    pointsDisplay.amount = photopoints;
                    photod = 1;
                }
            }
            if (object_index == obj_board_npc)
            {
                var memspeed = image_speed;
                image_speed = 0.125;
                sprite_index = pose;
                scr_delay_var("sprite_index", idle, 45);
                if (memspeed != 1.25)
                    scr_delay_var("image_speed", memspeed, 45);
                if (photod == 0 && (room == room_board_2 || room == room_board_3))
                {
                    var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
                    pointsDisplay.amount = photopoints;
                    photod = 1;
                }
            }
            if ((object_index == obj_board_pippins_grabbable || object_index == obj_b2pippinsislandnpc) && (room == room_board_2 || room == room_board_3))
            {
                pose = 45;
                if (!variable_instance_exists(id, "photod"))
                    photod = 0;
                if (photod == 0)
                {
                    var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
                    pointsDisplay.amount = photopoints;
                    photod = 1;
                }
            }
            if (object_index == obj_board_shadowgunner)
            {
                global.flag[1061]++;
                if (image_alpha == 1)
                    event_user(0);
            }
            if (object_index == obj_board_enemy_bullet)
            {
                var puff = instance_create(x - 8, y - 8, obj_board_smokepuff);
                puff.image_blend = image_blend;
                puff.depth = other.depth - 1;
                var pointsDisplay = instance_create(x + 16, y, obj_board_pointsGetDisplay);
                pointsDisplay.amount = 1;
                pointsDisplay.depth = depth - 1;
                instance_destroy();
            }
            if (object_index == obj_board_photoblock)
                alarm_set(0, 15);
            if (object_index == obj_board_b2tornflower)
            {
                if (photographed == false)
                {
                    photographed = true;
                    other.createphoto = true;
                    other.flagtoset = 1041;
                    alarm[0] = 10;
                }
            }
            if (object_index == obj_b2_photocactus)
            {
                if (photod == false)
                {
                    photod = true;
                    other.createphoto = true;
                    other.flagtoset = 1043;
                    alarm[0] = 10;
                }
            }
            if (object_index == obj_b2perfumespring_triggerarea)
            {
                if (photographed == false)
                {
                    photographed = true;
                    other.createphoto = true;
                    other.flagtoset = 1042;
                    alarm[0] = 10;
                }
            }
            if (object_index == obj_b2_greenxsolve)
            {
                if (photographed == false)
                {
                    photographed = true;
                    other.createphoto = true;
                    other.flagtoset = 1040;
                    alarm[0] = 10;
                }
            }
        }
    }
}
ds_list_destroy(_list2);
if (room == room_dw_b3bs_cheaterpippins)
{
    if (i_ex(obj_b3bs_cheaterpippins))
    {
        var gotpips = false;
        var gotdice = false;
        if (i_ex(collision_rectangle(x + 16, y + 16, (x + (camwidth * 32)) - 16, (y + (camheight * 32)) - 16, obj_b3bs_cheaterpippins.bpip1, false, true)))
            gotpips = true;
        if (i_ex(collision_rectangle(x + 16, y + 16, (x + (camwidth * 32)) - 16, (y + (camheight * 32)) - 16, obj_b3bs_cheaterpippins.dice, false, true)))
            gotdice = true;
        if (gotdice == false && gotpips == true)
        {
            with (obj_b3bs_cheaterpippins)
            {
                dcon = 20;
                dtimer = 0;
                with (obj_board_shopwriter)
                    texttimer = 0;
                pwriter1.shopstring = stringsetloc("ME ALONE?!#IT MEANS NOTHING!", "obj_board_playercamera_slash_Other_10_gml_182_0");
                debug_print("got pips but no dice");
            }
        }
        if (gotdice == true && gotpips == false)
        {
            with (obj_b3bs_cheaterpippins)
            {
                dcon = 20;
                dtimer = 0;
                with (obj_board_shopwriter)
                    texttimer = 0;
                pwriter1.shopstring = stringsetloc("A DIE ALONE?!#IT MEANS NOTHING!", "obj_board_playercamera_slash_Other_10_gml_195_0");
                debug_print("got dice but no pips");
            }
        }
        if (gotpips == true && gotdice == true)
        {
            with (obj_b3bs_cheaterpippins)
            {
                dcon = 40;
                dtimer = 0;
                with (obj_board_shopwriter)
                    visible = false;
                debug_print("got evidence");
            }
        }
    }
}
if (i_ex(obj_b2bossencounterroom))
{
    var doit = 0;
    if (obj_b2bossencounterroom.active && obj_b2bossencounterroom.con == 2)
    {
        if (i_ex(collision_rectangle(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, kris, false, true)) && i_ex(collision_rectangle(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, susie, false, true)) && i_ex(collision_rectangle(x + 4, y + 4, (x + (camwidth * 32)) - 4, (y + (camheight * 32)) - 4, ralsei, false, true)))
        {
            debug_print("got 'em all!");
            notalk = true;
            doit = 1;
        }
    }
    if (doit)
    {
        kris.facing = 0;
        obj_b2bossencounterroom.con = 3;
        alarm[0] = 10;
        flagtoset = 1040;
        createphoto = true;
    }
}
if (addgreenblocks == true)
{
    addgreenblocks = false;
    flagtoset = 1040;
    with (obj_board_b2greenblock)
        event_user(3);
    if (obj_b2greenx.usedralsei == true)
    {
        var ralblock = 0;
        with (obj_pushableblock_board)
        {
            if (sprite_index == spr_ralsei_board_stoolforme)
                ralblock = id;
        }
        if (i_ex(ralblock))
        {
            with (ralblock)
                scr_script_delayed(scr_board_photosparkle, 10);
        }
    }
}
if (flagtoset == 0)
{
    with (obj_board_grayregion)
        instance_destroy();
    gray = instance_create(x, y, obj_board_grayregion);
    gray.image_xscale = camwidth * 32;
    gray.image_yscale = camheight * 32;
}
with (obj_board_store_key)
{
    if (mytype == "lancer")
        buffer = 3;
}

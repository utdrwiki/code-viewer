if (init == 0)
{
    init = 1;
    if (extflag == "elnina1")
    {
        sprite_index = spr_board_elnina_glasses_left;
        pose = 4216;
        mask_index = spr_board_spritemask_32x32_lowerhalf;
    }
    if (extflag == "lanino1")
    {
        sprite_index = spr_board_lanino_glasses_right;
        pose = 3807;
        mask_index = spr_board_spritemask_32x32_lowerhalf;
    }
    if (extflag == "intro" || extflag == "b3tenna" || extflag == "b3shopping" || extflag == "b3bestcity" || extflag == "b3goodboy" || extflag == "b2intro" || extflag == "b3entertainment")
    {
        sprite_index = spr_board_npc_tenna;
        image_speed = 0.05;
        pose = 4355;
        mask_index = spr_board_spritemask_32x32_lowerhalf;
    }
    if (extflag == "b2bombfun2")
    {
        sprite_index = spr_board_mossblock;
        animate = false;
        image_index = 0;
        image_speed = 0;
        mask_index = sprite_index;
    }
    if (extflag == "bibliox")
    {
        sprite_index = spr_dw_ch3_board_npc_bibliox;
        image_speed = 0.05;
        read = global.flag[1141];
    }
    if (extflag == "cupboard")
        sprite_index = spr_board_cupboard;
    if (room == room_board_postshadowmantle)
        visible = false;
    if (sprite_index == spr_board_npc_pippins)
        pose = 3861;
    if (room == room_dw_b3bs_idcardpuzzle)
    {
        sprite_index = spr_board_watersign;
        animate = false;
    }
    idle = sprite_index;
    if (pose == -1)
        pose = idle;
}
if (active)
{
    if (updateDepth)
        scr_depth_board();
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
    buffer--;
    if (myinteract == 3 && !i_ex(obj_board_writer))
    {
        myinteract = 0;
        buffer = 3;
        global.interact = 0;
    }
    hitbuffer--;
    if (place_meeting(x, y, obj_board_swordhitbox) && hitbuffer <= 0 && room != room_board_postshadowmantle)
    {
        var sword = instance_place(x, y, obj_board_swordhitbox);
        if (sword.swordlv >= defense)
        {
            hitbuffer = 5;
            myhealth--;
            if (myhealth <= 0)
            {
                instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                instance_destroy();
            }
        }
    }
}
if (global.chapter == 3)
{
    if (room == room_board_2)
    {
        if (extflag == "b2photohint1")
        {
            if (global.flag[1041] == 1)
                instance_destroy();
        }
        if (extflag == "b2photohint2")
        {
            if (global.flag[1042] == 1)
                instance_destroy();
        }
        if (extflag == "b2photohint3")
        {
            if (global.flag[1043] == 1)
                instance_destroy();
        }
        if (extflag == "b2photohint4")
        {
            if (global.flag[1227] == 1)
                instance_destroy();
        }
    }
}

if (init == 0)
{
    init = 1;
    if (extflag == "elnina1")
        sprite_index = spr_board_elnina;
    if (extflag == "lanino1")
        sprite_index = spr_board_lanino;
    if (extflag == "intro")
    {
        sprite_index = spr_board_npc_tenna;
        image_speed = 0.05;
    }
    if (extflag == "1Q")
    {
    }
    if (room == room_board_postshadowmantle)
        visible = false;
}
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
if (active)
{
    buffer--;
    if (myinteract == 3 && !i_ex(obj_board_writer))
    {
        myinteract = 0;
        buffer = 3;
        global.interact = 0;
    }
    hitbuffer--;
    if (place_meeting(x, y, obj_board_swordhitbox) && hitbuffer <= 0)
    {
        var sword = instance_place(x, y, obj_board_swordhitbox);
        if (sword.swordlv >= defense)
        {
            hitbuffer = 5;
            myhealth--;
            if (myhealth <= 0)
            {
                instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                global.flag[1255]++;
                instance_destroy();
            }
        }
    }
}
if (global.chapter == 3)
{
    if (room == room_board_2)
    {
        if (extflag == "b2photohint2")
        {
            if (global.flag[1041] == 1)
                instance_destroy();
        }
        if (extflag == "b2photohint3")
        {
            if (global.flag[1042] == 1)
                instance_destroy();
        }
    }
}

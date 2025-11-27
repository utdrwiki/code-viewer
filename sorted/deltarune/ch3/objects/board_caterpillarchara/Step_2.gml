if (obj_board_camera.con == 0)
{
    if (!init)
    {
        target = 12;
        ignoredepth = 0;
        init = 1;
        if (name == "ralsei")
        {
            dsprite = spr_board_ralsei_walk_down;
            rsprite = spr_board_ralsei_walk_right;
            usprite = spr_board_ralsei_walk_up;
            lsprite = spr_board_ralsei_walk_left;
            target = 24;
        }
    }
    if (!ignoredepth)
    {
        scr_depth_board();
        depth += 5;
    }
    nowx = x;
    nowy = y;
    moved = 0;
    walk = 0;
    runmove = 0;
    slided = 0;
    if (obj_mainchara_board.x != remx[0])
        moved = 1;
    if (obj_mainchara_board.y != remy[0])
        moved = 1;
    if (sliding[target] == 1)
        moved = 1;
    if (moved == 1 && follow == 1)
    {
        for (i = 75; i > 0; i -= 1)
        {
            remx[i] = remx[i - 1];
            remy[i] = remy[i - 1];
            facing[i] = facing[i - 1];
            sliding[i] = sliding[i - 1];
        }
        remx[0] = obj_mainchara_board.x;
        remy[0] = obj_mainchara_board.y;
        facing[0] = obj_mainchara_board.facing;
        x = remx[target] - halign;
        y = remy[target] - valign;
        if (abs(remx[target + 1] - remx[target]) > 4)
            runmove = 1;
        if (abs(remy[target + 1] - remy[target]) > 4)
            runmove = 1;
        dir = facing[target];
    }
    if (x != nowx)
        walk = 1;
    if (y != nowy)
        walk = 1;
    if (walk == 1)
        walkbuffer = 6;
    if (walkbuffer > 3 && fun == 0)
    {
        walktimer += 1.5;
        if (runmove == 1)
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
    if (fun == 0)
    {
        if (facing[target] == 0)
            sprite_index = dsprite;
        if (facing[target] == 1)
            sprite_index = rsprite;
        if (facing[target] == 2)
            sprite_index = usprite;
        if (facing[target] == 3)
            sprite_index = lsprite;
    }
}
if (place_meeting(x, y, obj_board_swordhitbox))
{
    with (obj_b3s_swordmanager)
    {
        kpause = 1;
        ktimer = 0;
    }
    with (obj_mainchara_board)
    {
        swordlv++;
        snd_stop(snd_board_ominous);
        snd_play(snd_board_ominous);
    }
    instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
    global.flag[1255]++;
    instance_destroy();
}

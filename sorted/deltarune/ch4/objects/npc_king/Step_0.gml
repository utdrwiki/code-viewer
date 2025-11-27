if (myinteract == 3)
{
    if (i_ex(mydialoguer) == false)
    {
        global.interact = 0;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 5;
        with (obj_caterpillarchara)
            fun = 0;
    }
}
if (global.flag[20] == 0)
    sprite_index = spr_king_sulk;
if (global.flag[20] == 1)
    sprite_index = spr_king_sulk_left;
if (global.flag[20] == 2)
    sprite_index = spr_king_sulk_right;
if (global.flag[20] == 3)
{
    sprite_index = spr_king_sulk_drink;
    image_speed = 0.2;
}
if (global.flag[20] == 4)
{
    if (!shake_con)
    {
        shake_con = true;
        scr_shakeobj();
    }
    sprite_index = spr_npc_king_sulk_turn;
}
if (global.flag[20] == 5)
{
    if (!shake_con)
    {
        shake_con = true;
        scr_shakeobj();
    }
    sprite_index = spr_king_sulk_drink_left;
    image_speed = 0.2;
}
if (!d_ex() && global.flag[20] > 0)
{
    global.flag[20] = 0;
    shake_con = false;
}
if (global.flag[20] == 3)
{
    if (x < 1380)
    {
        if (hspeed < 3)
            hspeed = 3;
        hspeed += 1;
        if (y >= (ystart - 60))
            y -= 4;
    }
    else
    {
        hspeed = 0;
    }
}
else if (x > xstart)
{
    if (y <= ystart)
        y += 4;
    hspeed -= 1;
}
else
{
    hspeed = 0;
}

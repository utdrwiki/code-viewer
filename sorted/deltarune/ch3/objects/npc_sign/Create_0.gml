myinteract = 0;
mydialoguer = 0;
image_speed = 0;
setdepth = 1;
read = 0;
depthbonus = 0;
skip = 0;
extflag = 0;
doafter = 0;
docon = 0;
if (room == room_town_krisyard_dark)
    global.darkzone = 0;
if (global.darkzone == 1)
    scr_darksize(id);
if (room == room_flowershop_2f)
{
    sprite_index = spr_flowercontainer;
    num = 0;
    colortxt = "a golden";
    if (x > 170)
    {
        num = 1;
        colortxt = "a yellow";
        if (y > 110)
        {
            num = 5;
            colortxt = "an orange";
        }
        if (y > 130)
        {
            num = 6;
            colortxt = "a green";
        }
    }
    if (x < 140)
    {
        num = 2;
        colortxt = "a cyan";
        if (y > 110)
        {
            num = 3;
            colortxt = "a blue";
        }
        if (y > 130)
        {
            num = 4;
            colortxt = "a purple";
        }
    }
    image_index = num;
}
if (room == room_town_north)
{
    sprite_index = spr_npc_asgoretruck;
    setdepth = 0;
    depth = 100000;
}
if (room == room_beach)
    sprite_index = spr_npc_beachtable;
if (room == room_town_krisyard || room == room_town_krisyard_dark)
    sprite_index = spr_torcar_u;
if (room == room_lw_police)
{
    if (x > 180 && y > 50)
    {
        sprite_index = spr_npc_prisoner_dog_eye;
        depthcancel = 1;
    }
    if (x > 230)
    {
        sprite_index = spr_npc_prisoner_dog_lesser;
        depthcancel = 1;
    }
}
if (room == room_dw_b3bs_rabbick_a)
{
    image_alpha = 0;
    image_xscale = 4;
    image_yscale = 1.6;
}
if (setdepth == 1)
    scr_depth();
depth += depthbonus;

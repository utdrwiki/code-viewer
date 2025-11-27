image_xscale = 2;
image_yscale = 2;
image_speed = 0;
dsprite = spr_lancer_dt;
lsprite = spr_lancer_lt;
rsprite = spr_lancer_rt;
usprite = spr_lancer_ut;
spinsprite[0] = dsprite;
spinsprite[1] = lsprite;
spinsprite[2] = usprite;
spinsprite[3] = rsprite;
alarm[0] = 60;
movecon = 4;
con = 0;
minx = camerax() + 100;
maxx = camerax() + 400;
maxy = cameray() + 280;
y = maxy;
depth = -20;
sleeptimer = 0;
remmovecon = 0;
fake = false;
threshold = floor(random(60)) + 80;
if (global.chapter == 3 && global.fighting == 1)
{
    dsprite = spr_ch3_dw_shutta_lancer_dt_notongue;
    lsprite = spr_ch3_dw_shutta_lancer_lt_notongue;
    rsprite = spr_ch3_dw_shutta_lancer_rt_notongue;
    usprite = spr_lancer_ut;
    spinsprite[0] = dsprite;
    spinsprite[1] = lsprite;
    spinsprite[2] = usprite;
    spinsprite[3] = rsprite;
    sprite_index = dsprite;
    threshold = floor(random(60)) + 80;
    maxy = cameray() + 180;
    minx = camerax() + 140;
    maxx = camerax() + 360;
    alarm[0] = 30;
    if (i_ex(obj_shutta_photo_controller) && obj_shutta_photo_controller.fastphoto == true)
    {
        threshold = choose(0, 10 + irandom(36));
        movecon = choose(4, 4, 7);
        if (movecon == 7)
        {
            alarm[0] = 60;
            sleeptimer = 0;
            threshold = choose(90, 120);
        }
    }
}
rouxls = 0;
starwalker = 0;
if (global.chapter == 2)
{
    rouxls = 0;
    if (scr_keyitemcheck(9))
        rouxls = 1;
    starwalker = 0;
    if (scr_keyitemcheck(14))
        starwalker = 1;
    if (global.flag[915] >= 1.5 && scr_sideb_get_phase() >= 1)
        movecon = 10;
    if (scr_sideb_get_phase() >= 3)
        movecon = 11;
    if (global.plot >= 200)
        movecon = 4;
    if (movecon == 10)
    {
        alarm[0] = -10;
        sprite_index = spr_lancer_sleep;
        image_speed = 0.1;
        speed = 0;
        hspeed = 0;
        gravity = 0;
    }
    if (movecon == 11)
    {
        alarm[0] = -10;
        sprite_index = spr_cutscene_20_lancer_stone;
        image_speed = 0;
        speed = 0;
        hspeed = 0;
        gravity = 0;
    }
}
x = minx + 150;
y = maxy;
goodshot = false;
delaydeath = 0;
if (instance_number(obj_lancergotchi) > 1)
{
    movecon = choose(0, 1);
    alarm[0] = 30;
    hspeed = 0;
    speed = 0;
}

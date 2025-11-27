encounterflag = 586;
if (scr_debug())
{
    scr_setparty(1, 1, 0);
    instance_create(x, y, obj_musicer_teevie);
}
timer = 0;
con = 0;
zap1 = 0;
zap2 = 0;
zap1t = 0;
zap2t = 0;
maketrig = false;
trigd = 0;
firsthop = 0;
laughcon = 0;

function movejump(arg0, arg1, arg2 = 20)
{
    with (arg0)
    {
        image_index = 1;
        scr_delay_var("image_index", 2, 2);
        scr_delay_var("image_index", 3, 4);
        scr_delay_var("image_index", 4, 6);
        scr_delay_var("image_index", 5, 8);
        scr_delay_var("image_index", 6, arg2 - 8);
        scr_delay_var("image_index", 7, arg2 - 4);
        scr_delay_var("image_index", 8, arg2 - 2);
        if (arg1 == 0)
            scr_lerpvar_respect("y", y, y + 160, arg2, 2, "out");
        if (arg1 == 1)
            scr_lerpvar_respect("x", x, x + 200, arg2, 2, "out");
        if (arg1 == 2)
            scr_lerpvar_respect("y", y, y - 160, arg2, 2, "out");
        if (arg1 == 3)
            scr_lerpvar_respect("x", x, x - 200, arg2, 2, "out");
    }
}

cheer = 0;
cheervol = 0;
boo = 0;
boovol = 0;
cheer2 = 0;
cheer2vol = 0;
trcon = 0;
trtimer = 0;
tinycrowd = 0;
trcol = 0;
tralpha = 0;
trscale = 0;
treasure = instance_create(82, 898, obj_trigger_interact);
with (treasure)
{
    scr_darksize();
    sprite_index = spr_treasurebox;
    image_index = 0;
    image_speed = 0;
    visible = true;
    scr_depth();
}
treasuresolid = instance_create(80, 880, obj_solidblocksized);
scr_size(1, 2, treasuresolid);
if (global.flag[1004] == 1)
{
    trcon = 2;
    treasure.myinteract = 3;
    treasure.image_index = 1;
    image_blend = c_white;
    tralpha = 1;
    trscale = 1;
}
if (global.flag[1005] == 1)
    laughcon = 1;
init = 0;
didviolence = false;
if (scr_ch3_violencecheck() >= 5)
    didviolence = true;

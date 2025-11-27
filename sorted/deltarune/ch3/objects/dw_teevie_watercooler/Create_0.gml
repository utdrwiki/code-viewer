if (scr_debug())
    depth = -10;
timer = 0;
con = 0;
curtain = instance_create(236, 92, obj_trigger_interact);
curtain.sprite_index = spr_dw_changing_room_curtain_transparent;
curtain.visible = true;
scr_darksize(curtain);
scr_depth(curtain);
curcon = 0;
curtainrod = scr_marker_ext(240, 100, spr_pxwhite, 12, 4, undefined, undefined, #C0A395, 97440);
curtainblock = instance_create(240, 206, obj_solidblocksized);
with (curtainblock)
{
    image_xscale = 5;
    image_yscale = 0.5;
}
watercooler = instance_create(320, 248, obj_trigger_interact);
watercooler.sprite_index = spr_watercooler;
watercooler.visible = true;
watercooler.extflag = "watercooler";
scr_darksize(watercooler);
scr_depth(watercooler);
if (global.flag[1143] < 50)
{
    global.flag[1143]++;
    if (global.flag[1143] > 5)
        global.flag[1143] = 5;
    if (global.flag[1143] == 2)
        watercooler.y += 10;
    if (global.flag[1143] == 3)
        watercooler.y += 30;
    if (global.flag[1143] == 4)
        watercooler.y += 60;
    if (global.flag[1143] == 5)
    {
        watercooler.x = 254;
        watercooler.y = 346;
        scr_depth(watercooler);
        watercooler2 = instance_create(292, 316, obj_trigger_interact);
        watercooler2.sprite_index = spr_watercooler;
        watercooler2.visible = true;
        watercooler2.extflag = "watercooler";
        scr_darksize(watercooler2);
        scr_depth(watercooler2);
        watercooler2 = instance_create(348, 316, obj_trigger_interact);
        watercooler2.sprite_index = spr_watercooler;
        watercooler2.visible = true;
        watercooler2.extflag = "watercooler";
        scr_darksize(watercooler2);
        scr_depth(watercooler2);
        watercooler2 = instance_create(388, 346, obj_trigger_interact);
        watercooler2.sprite_index = spr_watercooler;
        watercooler2.visible = true;
        watercooler2.extflag = "watercooler";
        scr_darksize(watercooler2);
        scr_depth(watercooler2);
    }
}
des = 0;
watercon = 0;
watertimer = 0;
watertrig = 0;
fakespikes = instance_create(160, 236, obj_trigger_interact);
fakespikes.sprite_index = spr_dw_teevie_watercooler_fakespikes;
fakespikes.visible = true;
scr_darksize(fakespikes);
scr_depth(fakespikes);
spikecon = 0;
treasure = instance_create(80, 280, obj_trigger_interact);
treasure.sprite_index = spr_treasurebox;
treasure.visible = true;
treasure.issolid = true;
scr_darksize(treasure);
scr_depth(treasure);
trcon = 0;
trtimer = 0;
watermarker = 0;
close = false;
itemid = 5;
itemtype = "item";
cleanup = 0;
encounterflag = 592;
if (global.flag[1143] == 50)
{
    watercooler.x = 9999;
    treasure2 = instance_create(treasure.x, treasure.y, obj_trigger_interact);
    treasure2.sprite_index = spr_treasurebox;
    treasure2.visible = true;
    treasure2.issolid = true;
    scr_darksize(treasure2);
    scr_depth(treasure2);
    trcon2 = 0;
    trtimer2 = 0;
    watermarker = 0;
    treasure.x = -9999;
    watercon = 999;
    trcon = 3;
    if (global.flag[1145] == 2)
        treasure2.image_index = 1;
}

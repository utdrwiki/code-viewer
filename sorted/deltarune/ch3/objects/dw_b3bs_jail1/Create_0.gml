var xmod = 166;
var save = instance_create(142, 254, obj_savepoint);
freepippins = instance_create(54 + xmod, 184, obj_npc_room);
freepippins.extflag = "freepippins";
instance_create(88 + xmod, 272, obj_dw__backstagelight);
sam = instance_create(140 + xmod, 206, obj_npc_room);
sam.extflag = "sam";
samlong = scr_dark_marker(sam.x, sam.y - 56, spr_npc_gouldensamLong);
samlong.depth = 97200;
sam.depth = samlong.depth - 1;
shadowguy = instance_create(194 + xmod, 160, obj_npc_room);
shadowguy.extflag = "shadowguy";
jailpip = instance_create(300 + xmod, 180, obj_npc_room);
jailpip.extflag = "jailpippins";
zap = 0;
createzap = false;
if (createzap)
{
    zap = instance_create(130 + xmod, 264, obj_trigger_interact);
    with (zap)
    {
        strict = true;
        sprite_index = spr_npc_zapper_talk;
        scr_darksize();
        image_xscale = -2;
        visible = true;
        scr_depth();
    }
    with (instance_create(30 + xmod, 358, obj_solidblocksized))
    {
        image_xscale = 2.4;
        image_yscale = 2;
    }
}
var createstar = scr_flag_get(254);
if (createstar)
{
    var starx = 808;
    starwalker = instance_create(starx, 192, obj_npc_room);
    starwalker.extflag = "starwalker";
    with (instance_create(starx + 32, 258, obj_dw__backstagelight))
        lightpos = 150;
}
if (obj_mainchara.x == 570)
{
    with (obj_caterpillarchara)
    {
        global.facing = 0;
        if (name == "susie")
            x -= 40;
        if (name == "ralsei")
            x += 40;
        scr_caterpillar_interpolate();
    }
    with (obj_mainchara)
    {
        freeze = true;
        scr_delay_var("freeze", false, 8);
    }
}
with (scr_marker(190 + xmod, 170, spr_pxwhite))
{
    image_blend = c_black;
    image_xscale = 280;
    image_yscale = 100;
    image_alpha = 0.45;
    depth = 1000049;
}
block = instance_create(sam.x + 24, sam.y + 68, obj_solidblocksized);
with (block)
{
    image_yscale = 0.5;
    image_xscale = 8;
}
tail = instance_create(sam.x + 120 + 230, sam.y + 40, obj_trigger_interact);
with (tail)
{
    strict = true;
    scr_sizeexact(34, 44);
}

con = 0;
var xoff = 80;
sam = instance_create(((xoff + 80 + 60) - 60 - 20) + 80, 206, obj_npc_room);
sam.extflag = "SuilverSam";
sam.sprite_index = spr_npc_gouldensamFaceOnly;
samlong = scr_dark_marker(sam.x, sam.y - 56, spr_npc_gouldensamLong_silver);
samlong.depth = 97200;
sam.depth = samlong.depth - 1;
block = instance_create(sam.x + 24, sam.y + 68, obj_solidblocksized);
with (block)
{
    image_yscale = 0.5;
    image_xscale = 8;
}
with (scr_marker(sam.x + 50, 170, spr_pxwhite))
{
    image_blend = c_black;
    image_xscale = 280;
    image_yscale = 100;
    image_alpha = 0.45;
    depth = 1000049;
}
pip = instance_create(xoff + 132 + 80, 182, obj_npc_room);
pip.extflag = "Pippins";
pip.sprite_index = spr_npc_pippins;
with (pip)
    scr_depth();
zapper = instance_create(xoff + 506 + 80, 244, obj_npc_room);
zapper.extflag = "Zapper";
zapper.sprite_index = spr_npc_zapper;
with (zapper)
    scr_depth();
if (obj_mainchara.x == (346 + xoff))
{
    global.facing = 0;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            x -= 50;
        if (name == "ralsei")
            x += 50;
        scr_caterpillar_interpolate();
    }
}

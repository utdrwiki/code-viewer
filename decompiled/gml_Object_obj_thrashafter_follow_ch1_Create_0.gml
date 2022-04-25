con = 1
followcon = 1
followtimer = 0
followbuffer = 0
treecon = 0
speclaugh = 0
image_xscale = 2
image_yscale = 2
if (global.flag[229] >= 99)
{
    con = 999
    instance_destroy()
}
if (room == room_forest_afterthrash3_ch1)
{
    tree = scr_dark_marker_ch1(440, 72, spr_candytree_tall_ch1)
    if (global.flag[229] >= 6)
        tree.image_index = 1
    with (tree)
        depth = 400000
}
if (room == room_forest_castleview_ch1)
{
    bg = instance_create_ch1(180, 0, obj_backgrounder_sprite_ch1)
    with (bg)
    {
        sprite_index = spr_darkcastle_bg_ch1
        image_speed = 0.1
        ss = 0.5
        image_xscale = 2
        image_yscale = 2
    }
    with (obj_mainchara_ch1)
        bg = 1
}

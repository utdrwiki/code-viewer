tomake = 583;
if (room == room_board_1)
    tomake = 72;
if (init == 0)
{
    var treecount = 0;
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
        {
            var _t = instance_create(x + (i * 32), y + (j * 32), tomake);
            if (image_blend == #FDFDFD)
                _t.sprite_index = spr_board_tree_cold;
            treecount++;
        }
    }
    instance_destroy();
}

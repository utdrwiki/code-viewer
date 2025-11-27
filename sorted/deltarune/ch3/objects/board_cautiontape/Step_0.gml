if (inplace == 0)
{
    if (set == 0)
    {
        set = 1;
        setxy(room_width, room_height);
    }
}
if (inplace == 1)
{
    if (set == 0)
    {
        set = 1;
        var tileLayer = layer_get_id("BOARD_Tiles");
        var originX = layer_get_x(tileLayer);
        var originY = layer_get_y(tileLayer);
        setxy(xstart + originX, ystart + originY);
        for (var i = 0; i < (image_xscale / 2); i++)
            instance_create(x + (i * 32), y, obj_board_b2_watersign);
        instance_destroy();
    }
}
scr_depth_board();

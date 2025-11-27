if (activedraw)
{
    if ((timer % eraserate) == 0)
    {
        var drawindex = array_length(drawarray) + 1;
        drawarray[drawindex] = instance_create_depth(x + 6, y, boarddepth, obj_board_marker);
        scr_darksize(drawarray[drawindex]);
        drawarray[drawindex].sprite_index = spr_board_erasermarker;
        drawarray[drawindex].image_blend = mycolor;
    }
}

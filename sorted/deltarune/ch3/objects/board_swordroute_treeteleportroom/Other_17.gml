var playerCheck = 0;
if (place_meeting(x - 32, y, obj_mainchara_board))
    playerCheck = true;
if (place_meeting(x + 32, y, obj_mainchara_board))
    playerCheck = true;
if (place_meeting(x, y + 32, obj_mainchara_board))
    playerCheck = true;
if (place_meeting(x, y - 32, obj_mainchara_board))
    playerCheck = true;
if (playerCheck == true)
{
    for (var i = 0; i < 12; i++)
    {
        for (var ii = 0; ii < 8; ii++)
            var newtree = instance_create(x + (i * 32), y + (ii * 32), obj_board_tree);
    }
    with (obj_board_tree)
    {
        image_index = 0;
        dir = 0;
    }
    var px = 0;
    var py = 0;
    with (obj_board_camera)
    {
        if (shift == "left")
            px = -32;
        if (shift == "right")
            px = 32;
        if (shift == "down")
            py = 32;
        if (shift == "up")
            py = -32;
    }
    var safety = 4;
    with (obj_mainchara_board)
    {
        if (place_meeting(x + px, y + py, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting(x + px + safety, y + py + safety, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting(x + px + safety, (y + py) - safety, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting(x + px + safety, y + py, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting((x + px) - safety, y + py + safety, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting((x + px) - safety, (y + py) - safety, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting((x + px) - safety, y + py, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting(x + px, (y + py) - safety, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
        if (place_meeting(x + px, y + py + safety, obj_board_tree))
        {
            var thattree = instance_place(x + px, y + py, obj_board_tree);
            if (i_ex(thattree))
                safe_delete(thattree);
        }
    }
}

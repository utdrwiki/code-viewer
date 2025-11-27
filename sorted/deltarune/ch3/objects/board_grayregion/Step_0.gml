siner++;
if (i_ex(obj_board_camera))
{
    if (obj_board_camera.con != 0)
        instance_destroy();
}
if (i_ex(obj_quizsequence) || i_ex(obj_battleback))
    instance_destroy();
if (cameradeath == 0 && !i_ex(obj_board_playercamera))
    cameradeath = 1;
if (cameradeath == 1 && i_ex(obj_board_playercamera))
    instance_destroy();

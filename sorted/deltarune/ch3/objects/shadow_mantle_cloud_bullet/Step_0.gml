if (i_ex(obj_board_camera))
{
    if (obj_board_camera.con != 0)
        instance_destroy();
}
timer++;
if (timer == 30)
    instance_destroy();
scr_depth_board();
for (i = 5; i > 0; i -= 1)
{
    remx[i] = remx[i - 1];
    remy[i] = remy[i - 1];
}
remx[0] = x;
remy[0] = y;

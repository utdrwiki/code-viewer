roomglow = instance_create(x, y, obj_roomglow);
roomglow.active = true;
prophecy_camera = false;
prophecy_camera_x = camerax();
prophecy_camera_y = cameray();
prophecy_list[0][0] = "laststory";
prophecy_list[0][1] = [600, 850];
prophecy_list[1][0] = "end1";
prophecy_list[1][1] = [1720, 690];
prophecy_list[2][0] = "end2";
prophecy_list[2][1] = [2690, 490];
prophecy_list[3][0] = "savetheworlds";
prophecy_list[3][1] = [3400, 330];
prophecy_list[4][0] = "end5";
prophecy_list[4][1] = [5640, 320];
for (var i = 0; i < array_length(prophecy_list); i++)
{
    var flag = prophecy_list[i][0];
    var pos = prophecy_list[i][1];
    var prophecy = instance_create(pos[0], pos[1], obj_dw_church_prophecy);
    prophecy.extflag = flag;
    prophecy.active = true;
}
if (scr_debug())
{
    with (obj_border_controller)
        hide_border();
}

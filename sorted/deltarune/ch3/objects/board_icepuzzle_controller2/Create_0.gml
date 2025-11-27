createdwall = false;
var a = 0;
for (var i = 0; i < instance_number(obj_board_glacier_switch2); i++)
{
    button[i] = instance_find(obj_board_glacier_switch2, i);
    if (button[i].pressed == true)
        a++;
}
if (a == 4)
    instance_destroy();

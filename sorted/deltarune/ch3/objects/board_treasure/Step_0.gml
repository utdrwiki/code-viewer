buffer--;
if (myinteract == 1 && !i_ex(obj_board_writer))
{
    myinteract = 0;
    buffer = 3;
    global.interact = 0;
}
if (place_meeting(x, y, obj_board_swordhitbox))
{
    instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
    instance_destroy();
}
image_index = open;

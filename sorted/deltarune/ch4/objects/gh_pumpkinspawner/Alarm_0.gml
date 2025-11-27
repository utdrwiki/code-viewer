alarm[0] = 10 - (2 * (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat));
with (instance_create_depth(x, y, 1, obj_small_jackolantern))
{
    path_start(obj_dbulletcontroller.path, 6 + (2.5 * (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)), path_action_stop, true);
    scr_bullet_init();
    grazed = true;
    grazepoints = 0;
    damage = 15;
    target = 3;
    destroyonhit = false;
}

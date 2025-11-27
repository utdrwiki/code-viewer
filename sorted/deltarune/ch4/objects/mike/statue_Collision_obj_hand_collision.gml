if (act == 0 && !obj_mike_controller.battle_active)
{
    act = 1;
    timer = 0;
    with (other)
        instance_destroy();
}

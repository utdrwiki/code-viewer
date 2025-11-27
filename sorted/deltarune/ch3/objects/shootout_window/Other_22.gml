if (state == "closed")
{
    state = "opening";
    timer = 0;
    type = 1;
    if (obj_shootout_controller.shootout_type > 1)
        type = 2;
    idle_duration = 30;
    duration = 90;
}

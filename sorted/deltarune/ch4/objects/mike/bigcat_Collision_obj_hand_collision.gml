if (act == 3)
    act = 0;
if (meowsnd == 0)
    meowsnd = 1;
happiness = max(100, happiness);
if (act == 0)
{
    act = 1;
    if (meowsnd == 0)
        meowsnd = 1;
}
pet = pet_max;
with (other)
{
    scr_sparkle_colour(10, 65280);
    instance_destroy();
}

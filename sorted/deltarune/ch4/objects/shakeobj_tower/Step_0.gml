if (!instance_exists(target))
{
    instance_destroy();
    exit;
}
timer++;
if (timer == 1)
    target.shakex = -10;
if (timer == 2)
    target.shakex = 8;
if (timer == 3)
    target.shakex = -6;
if (timer == 4)
    target.shakex = 4;
if (timer == 5)
    target.shakex = -2;
if (timer == 6)
    target.shakex = 0;
if (timer == 7)
    instance_destroy();

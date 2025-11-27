timer++;
if (global.turntimer <= 0)
{
    its_time = true;
    instance_destroy();
}
if (!its_time)
    pattern_to_use();

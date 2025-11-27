timer++;
if (phase == 0)
{
    if (i_ex(my_flash) && (timer % 3) == 0)
    {
        with (scr_oflash())
        {
            depth = other.depth + 1;
            flashcolor = c_lime;
            target = -4;
        }
    }
    if (timer == 24)
    {
        phase = 1;
        timer = 30;
    }
}
if (phase == 1)
{
    if (timer == 32)
    {
        box_bonk(bonk_side, 40);
        bonk_side *= -1;
        timer = 0;
    }
}
if (global.turntimer < 1)
{
    with (obj_hammer_of_justice_enemy)
        visible = true;
    instance_destroy();
}

y = ystart + (sin(siner * 0.5) * 5);
firstframe++;
if (firstframe > 1)
{
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(0.16666666666666666);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;

encountermax = 999;
encountermin = 1;
global.darkzone = 1;
if (global.chapter == 0 || global.chapter == 2)
{
    encountermin = 50;
    encountermax = 999;
}
if (global.chapter == 3)
{
    encountermin = 110;
    encountermax = 999;
}
if (global.chapter == 4)
{
    encountermin = 150;
    encountermax = 999;
}
global.encounterno = clamp(global.encounterno, encountermin, encountermax);
if (instance_exists(obj_chaseenemy))
    obj_chaseenemy.radius = 2;
global.flag[34] = 0;
global.tempflag[100] = 0;

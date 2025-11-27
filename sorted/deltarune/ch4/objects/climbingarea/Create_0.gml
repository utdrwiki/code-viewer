canclimb = 0;
if (global.chapter >= 5 || global.flag[23] > 0)
    canclimb = 1;
if (canclimb == 0)
    scr_create_hitbox_solid();

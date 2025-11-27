timer = 0;
con = 0;
variant = 0;
firstsword = false;
multiswordmax = 0;
multiswordframes = 0;
multiswordcon = 0;
multiswordcount = 0;
setcount = 0;
for (i = 0; i < 50; i++)
    setdirection[i] = -1;
creatorid = -1;
creator = -1;
hell_surface = -4;
scr_bullet_init();
swordcount = 0;
for (i = 0; i < 8; i++)
    directionprev[i] = -1;
event_user(0);

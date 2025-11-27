formation = 0;
depth = 999999;
trigger = instance_create(1760, 320, obj_board_trigger);
pressed = 0;
pressinit = 1;
swordswitch = 0;
if (global.flag[1055])
    swordswitch = instance_create(1760, 320, obj_board_swordswitch);
neverpressed = 0;
nopresstimer = 0;
susieexistsed = 0;
everpressed = 0;

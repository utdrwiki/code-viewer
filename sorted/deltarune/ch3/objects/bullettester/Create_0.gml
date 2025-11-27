lastkey = 0;
spawntype = 1;
global.encounterno = 777;
scr_encountersetup(777);
global.interact = 1;
with (obj_mainchara)
    instance_destroy();
with (obj_darkcontroller)
    instance_destroy();
instance_create(0, 0, obj_battlecontroller);
global.myfight = 0;
global.mnfight = 0;
global.turntimer = 240;
timer = 0;
go = 0;
instance_create(camerax() + 320, cameray() + 170, obj_growtangle);
instance_create(obj_growtangle.x - 6, obj_growtangle.y - 8, obj_heart);
if (global.tempflag[26] == 1)
{
    global.monster[0] = global.tempflag[20];
    global.monster[1] = global.tempflag[21];
    global.monster[2] = global.tempflag[22];
    global.monsterinstance[0].spawntype = global.tempflag[23];
    global.monsterinstance[1].spawntype = global.tempflag[24];
    global.monsterinstance[2].spawntype = global.tempflag[25];
}
else
{
    global.monster[0] = 1;
    global.monster[1] = 0;
    global.monster[2] = 0;
    global.monsterinstance[0].spawntype = spawntype;
    global.monsterinstance[1].spawntype = spawntype;
    global.monsterinstance[2].spawntype = spawntype;
    global.tempflag[26] = 1;
}
enem1 = 0;
enem2 = 0;
enem3 = 0;
neverendingturn = 0;
drawdebug = true;

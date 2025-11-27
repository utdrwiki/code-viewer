chartotal = 0;
charpos[0] = -1;
charpos[1] = -1;
charpos[2] = -1;
charpos[3] = -1;
havechar[0] = 0;
havechar[1] = 0;
havechar[2] = 0;
havechar[3] = 0;
global.charinstance[0] = 12129292;
global.charinstance[1] = 12129292;
global.charinstance[2] = 12129292;
with (global.charinstance[0])
    myself = 0;
with (global.charinstance[1])
    myself = 1;
with (global.charinstance[2])
    myself = 2;
for (i = 0; i < 3; i += 1)
{
    if (global.char[i] != 0)
        chartotal += 1;
    if (global.char[i] == 1)
    {
        havechar[0] = 1;
        charpos[0] = i;
        global.charinstance[i] = instance_create(global.heromakex[i], global.heromakey[i], obj_herokris);
        global.charinstance[i].myself = i;
        global.charinstance[i].char = 1;
        global.charinstance[i].depth = 200 - (i * 20);
    }
    if (global.char[i] == 2)
    {
        havechar[1] = 1;
        charpos[1] = i;
        global.charinstance[i] = instance_create(global.heromakex[i], global.heromakey[i], obj_herosusie);
        global.charinstance[i].myself = i;
        global.charinstance[i].char = 2;
        global.charinstance[i].depth = 200 - (i * 20);
    }
    if (global.char[i] == 3)
    {
        havechar[2] = 1;
        charpos[2] = i;
        global.charinstance[i] = instance_create(global.heromakex[i], global.heromakey[i], obj_heroralsei);
        global.charinstance[i].myself = i;
        global.charinstance[i].char = 3;
        global.charinstance[i].depth = 200 - (i * 20);
    }
    if (global.char[i] == 4)
    {
        havechar[3] = 1;
        charpos[3] = i;
        global.charinstance[i] = instance_create(global.heromakex[i], global.heromakey[i], obj_heronoelle);
        global.charinstance[i].myself = i;
        global.charinstance[i].char = 4;
        global.charinstance[i].depth = 200 - (i * 20);
    }
}
x = obj_herokris.x + 32;
y = obj_herokris.y + 32;

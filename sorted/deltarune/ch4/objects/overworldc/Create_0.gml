buffer = 0;
saved = 0;
selnoise = 0;
movenoise = 0;
depth = 10;
threebuffer = 0;
hasitems = false;
if (global.chapter >= 2)
{
    if (scr_havechar("su"))
        global.cinstance[0] = instance_create(obj_mainchara.x - 3, obj_mainchara.y - 6, obj_caterpillarchara);
    if (scr_havechar(4))
    {
        global.cinstance[1] = instance_create(obj_mainchara.x - 6, obj_mainchara.y - 9, obj_caterpillarchara);
        global.cinstance[1].name = "noelle";
        global.cinstance[1].target = 24;
    }
}

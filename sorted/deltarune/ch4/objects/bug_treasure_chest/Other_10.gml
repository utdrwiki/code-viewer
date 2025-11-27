with (obj_darkcontroller)
    charcon = 0;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
if (image_index == 0)
{
    snd_play(snd_locker);
    for (var i = 0; i < 5; i++)
    {
        bug[i] = instance_create(x + 20, y + 20, obj_tinybug);
        bug[i].direction = random(180);
        bug[i].speed = random(2) + 4;
        bug[i].sprite_index = spr_tinybug;
        bug[i].depth = depth - 1;
    }
}
image_index = 1;
myinteract = 1;
global.interact = 0;

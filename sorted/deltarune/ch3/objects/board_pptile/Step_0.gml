if (init == 0)
{
    init = 1;
    for (var i = 0; i < 32; i++)
        slicetext[i] = "----";
    if (eventset == 0)
    {
        wheeloptions = 2;
        slicetext[0] = "PLEASURE";
        slicetext[1] = "PAIN";
    }
}
if (tilecon == 0)
    timer = 0;
if (tilecon == 1 && obj_mainchara_board.movingnow == 0)
{
    timer++;
    if (timer == 5)
        tilecon = 1.5;
}
if (tilecon == 1.5)
{
    wheel = instance_create(0, 0, obj_board_quizwheel);
    wheel.maxslices = wheeloptions;
    wheel.daddy = id;
    wheel.slicetype = 0;
    for (var i = 0; i < 32; i++)
        wheel.slicetext[i] = slicetext[i];
    tilecon = -1;
}
if (tilecon == 2)
{
    if (quizchoice == 0)
        snd_play(snd_hit);
    if (quizchoice == 1)
        snd_play(snd_revival);
    tilecon = 99;
}
if (tilecon == 99)
{
    tilecon = 0;
    tiledone = 1;
    obj_board_controller.phase = 0;
    instance_destroy();
}

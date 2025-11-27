if (array_length(global.currentsong) > 4)
{
    snd_free(global.currentsong[2]);
    snd_free(global.currentsong[4]);
    array_delete(global.currentsong, 2, 4);
}
else if (array_length(global.currentsong) > 2)
{
    snd_free(global.currentsong[2]);
    array_delete(global.currentsong, 2, 2);
}
global.flag[794] = 3;

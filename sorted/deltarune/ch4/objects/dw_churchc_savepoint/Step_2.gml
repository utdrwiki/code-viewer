var cy = cameray();
if (cy != 0)
{
    volume = scr_progress(cameray(), 236, 755, 0, maxvol);
    snd_volume(global.currentsong[1], volume, 0);
}

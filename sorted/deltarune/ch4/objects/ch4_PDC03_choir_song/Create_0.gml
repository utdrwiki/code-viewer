if (global.plot >= 280)
{
    instance_destroy();
    exit;
}
for (i = 0; i < 20; i += 1)
{
    prevalpha[i] = 0;
    prevwx[i] = -200;
    prevwy[i] = -200;
    prevstringmax[i] = 0;
    prevhspace[i] = 0;
    prevlinecount[i] = 0;
    prevvspace[i] = 0;
}
con = 0;
dhaver = 0;
v = 0;
vx = 0;
vy = 0;
myd = 23827382;
start_song = false;
song_started = false;
finish_song = false;
choir_song[0] = snd_init("church_hymn.ogg");

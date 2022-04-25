vol = 1
vol2 = 0
if (obj_mainchara_ch1.y >= 420)
{
    vol = (1 - ((obj_mainchara_ch1.y - 620) / 400))
    vol2 = (0 + ((obj_mainchara_ch1.y - 1100) / 300))
}
if (vol < 0)
    vol = 0
if (vol2 < 0)
    vol2 = 0
snd_volume_ch1(global.currentsong[1], vol, 0)
snd_volume_ch1(dk, vol2, 0)

with (obj_mainchara_ch1)
{
    if (global.specialbattle != 3)
        cutscene = false
    visible = true
}
with (obj_caterpillarchara_ch1)
    visible = true
if (global.specialbattle == 0 || global.specialbattle == 3)
{
    for (i = 0; i < (count + 1); i += 1)
    {
        with (c[i])
            instance_destroy()
    }
}
if (global.specialbattle == 0 || global.specialbattle == 2)
    global.interact = 0
if (global.flag[9] == 1)
{
    snd_free_ch1(global.batmusic[0])
    snd_volume_ch1(global.currentsong[1], 0, 0)
    snd_resume_ch1(global.currentsong[1])
    snd_volume_ch1(global.currentsong[1], 1, 20)
}
instance_destroy()

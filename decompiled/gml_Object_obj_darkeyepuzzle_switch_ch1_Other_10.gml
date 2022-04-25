done = 0
if (x < 600)
{
    with (obj_darkeyepuzzle_ch1)
    {
        if (eye[0] == 0)
            eye[0] = 1
        else
            eye[0] = 0
        if (eye[2] == 0)
            eye[2] = 1
        else
            eye[2] = 0
    }
    done = 1
}
if (x < 700 && done == 0)
{
    with (obj_darkeyepuzzle_ch1)
    {
        if (eye[0] == 0)
            eye[0] = 1
        else
            eye[0] = 0
        if (eye[1] == 0)
            eye[1] = 1
        else
            eye[1] = 0
    }
    done = 1
}
if (x < 800 && done == 0)
{
    with (obj_darkeyepuzzle_ch1)
    {
        if (eye[2] == 0)
            eye[2] = 1
        else
            eye[2] = 0
    }
    done = 1
}
snd_play_ch1(snd_noise_ch1)
with (obj_mainchara_ch1)
    onebuffer = 3

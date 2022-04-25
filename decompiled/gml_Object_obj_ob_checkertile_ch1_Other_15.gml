if (active == true && global.interact == 0)
{
    global.interact = 1
    snd_play_ch1(snd_boost_ch1)
    with (obj_ob_gen_ch1)
    {
        whitetimer = 0
        whitecon = 1
    }
}

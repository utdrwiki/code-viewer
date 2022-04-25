scr_textsound_ch1 = function() //gml_Script_scr_textsound_ch1
{
    playtextsound = true
    if (button2_h_ch1() == 1)
        playtextsound = false
    if (skippable == false)
        playtextsound = true
    if (playtextsound == true)
    {
        if (rate <= 2)
            getchar = string_char_at(mystring, pos)
        else
            getchar = string_char_at(mystring, (pos - 1))
        play = true
        playcheck = false
        if (getchar == "&")
        {
            if (rate < 3)
            {
                playcheck = true
                getchar = string_char_at(mystring, (pos + 1))
            }
            else
                play = false
        }
        if (getchar == " ")
            play = false
        if (getchar == "^")
            play = false
        if (getchar == "!")
            play = false
        if (getchar == ".")
            play = false
        if (getchar == "?")
            play = false
        if (getchar == ",")
            play = false
        if (getchar == ":")
            play = false
        if (getchar == "/")
            play = false
        if (getchar == "\\")
            play = false
        if (getchar == "|")
            play = false
        if (getchar == "*")
            play = false
        if (play == true)
        {
            snd_play_ch1(textsound)
            with (obj_face_parent_ch1)
                mouthmove = true
        }
    }
    return;
}


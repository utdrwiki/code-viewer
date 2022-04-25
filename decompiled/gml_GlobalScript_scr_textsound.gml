scr_textsound = function() //gml_Script_scr_textsound
{
    playtextsound = true
    if (button2_h() == 1)
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
        if (getchar == "&" || getchar == "\n")
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
            if (textsound == snd_txtq)
            {
                audio_stop_sound(snd_txtq_2)
                qv = snd_play(snd_txtq_2)
                qp = (0.9 + random(0.15))
                snd_pitch(qv, qp)
                sound_timer = 2
            }
            else if (textsound == snd_txtspam)
            {
                audio_stop_sound(snd_txtspam2)
                snd_play_x(snd_txtspam2, 0.8, 1.2)
                sound_timer = 2
            }
            else if (textsound == snd_txtsans)
            {
                audio_stop_sound(snd_txtsans)
                qv = snd_play(snd_txtsans)
                sound_timer = 2
            }
            else
                snd_play(textsound)
            with (obj_face_parent)
                mouthmove = true
            miniface_pos++
        }
    }
    return;
}


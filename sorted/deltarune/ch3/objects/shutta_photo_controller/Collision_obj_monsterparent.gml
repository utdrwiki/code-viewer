if (state == "capture")
{
    array_push(subjects, other.id);
    with (other)
    {
        scr_mercyadd(myself, 10);
        if (global.monsterstatus[myself] != 1)
            scr_monster_make_tired(myself);
    }
    endmessage = message_nicephoto;
}

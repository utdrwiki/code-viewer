if (mercy > 0)
{
    with (obj_lanino_rematch_enemy)
    {
        global.mercymod[myself] += other.mercy;
        if (global.mercymod[myself] > 99)
            global.mercymod[myself] = 100;
    }
    with (obj_elnina_rematch_enemy)
    {
        global.mercymod[myself] += other.mercy;
        if (global.mercymod[myself] > 99)
            global.mercymod[myself] = 100;
    }
}

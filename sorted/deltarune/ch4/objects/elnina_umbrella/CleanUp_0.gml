if (mercy > 0 && obj_elnina_lanino_rematch_controller.phase == 1)
{
    with (obj_lanino_rematch_enemy)
    {
        global.mercymod[myself] += ceil(other.mercy);
        if (global.mercymod[myself] > 99)
            global.mercymod[myself] = 99;
        global.mercymod[myself] = global.mercymod[myself];
    }
    with (obj_elnina_rematch_enemy)
    {
        global.mercymod[myself] += ceil(other.mercy);
        if (global.mercymod[myself] > 99)
            global.mercymod[myself] = 99;
        global.mercymod[myself] = global.mercymod[myself];
    }
}

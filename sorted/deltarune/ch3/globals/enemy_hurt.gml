function scr_enemy_hurt()
{
    hurttimer -= 1;
    if (hurttimer < 0)
    {
        state = 0;
    }
    else
    {
        if (global.monster[myself] == 0)
            scr_defeatrun();
        hurtshake += 1;
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            if (shakex < 0)
                shakex += 1;
            shakex = -shakex;
            hurtshake = 0;
        }
    }
}

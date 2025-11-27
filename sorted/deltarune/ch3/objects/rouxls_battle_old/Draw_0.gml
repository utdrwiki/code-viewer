if (global.chapter == 3 && i_ex(obj_rouxls_ch3_enemy) && spadebuttonenabled == true)
{
    spadebuttontimer++;
    if ((spadebuttontimer >= 7 && global.charturn == 0) || (spadebuttontimer >= 4 && global.charturn == 1) || (spadebuttontimer >= 2 && global.charturn == 2) || (spadebuttontimer >= 2 && obj_rouxls_ch3_enemy.phase == 3))
    {
        spadebuttoncount++;
        if (obj_rouxls_ch3_enemy.phase == 2)
        {
            heartbuttoncount++;
            rouxlsbuttoncount++;
        }
        spadebuttontimer = 0;
        snd_play_pitch(snd_menumove, 1.4);
    }
    if (spadebuttoncount > 5)
        spadebuttoncount = 1;
    if (heartbuttoncount > 5)
        heartbuttoncount = 1;
    if (rouxlsbuttoncount > 5)
        rouxlsbuttoncount = 1;
}

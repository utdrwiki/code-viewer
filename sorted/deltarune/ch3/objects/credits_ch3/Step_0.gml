if (scr_debug())
{
}
if (timer == 0)
{
    snd_free_all();
    song0 = snd_init("ch2_credits.ogg");
    song1 = mus_play(song0);
}
if (!paused)
    timer++;
if (timer == 100)
    credit_index++;
if (timer == 201)
    credit_index++;
if (timer == 302)
{
    creditalpha = 1;
    credit_index++;
}
if (timer == 403)
    credit_index++;
if (timer == 503)
{
    textalpha = 1;
    credit_index++;
}
if (timer == 604)
{
    creditalpha = 1;
    credit_index++;
}
if (timer == 705)
    credit_index++;
if (timer == 805)
{
    creditalpha = 1;
    credit_index++;
}
if (timer == 906)
    credit_index++;
if (timer == 1007)
    credit_index++;
if (timer == 1108)
    credit_index++;
if (timer == 1208)
    credit_index++;
if (timer == 1309)
    credit_index++;
if (timer == 1410)
    credit_index++;
if (timer == 1511)
    credit_index++;
if (timer == 1611)
{
    creditalpha = 0;
    textalpha -= 0.01;
    credit_index++;
}
if (timer > 1641 && timer < 1711)
{
    if (creditalpha != 1)
        creditalpha += 0.02;
}
if (timer >= 1801)
{
    creditalpha -= 0.05;
    if (creditalpha < -0.1)
        room_goto(room_chapter_continue);
}
if (timer > 1744 && timer < 1910)
    creditalpha += 0.02;
if (timer > 1910)
    creditalpha -= 0.02;

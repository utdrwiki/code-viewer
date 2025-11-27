if (scr_debug())
{
    if (minigameinsanity == 0)
    {
        minigameinsanity = 1;
        scr_debug_print("minigame insanity on");
    }
    else
    {
        minigameinsanity = 0;
        scr_debug_print("minigame insanity off");
    }
}

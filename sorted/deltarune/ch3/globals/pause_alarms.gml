function scr_pause_alarms()
{
    for (i = 0; i < 11; i++)
    {
        if (alarm[i] != -1 && alarm[i] != 0)
            alarm[i]++;
    }
}

snd_play(snd_bigcut);
if (difficulty == 0)
{
    scr_lerpvar("hand_distance", 400, 170, 20, 3, "out");
    alarm[3] = 40;
}
else if (difficulty == 1)
{
    scr_lerpvar("hand_distance", 400, 170, 20, 3, "out");
    alarm[3] = 30;
}
else if (difficulty == 2)
{
    scr_lerpvar("hand_distance", 400, 170, 15, 3, "out");
    alarm[3] = 20;
}

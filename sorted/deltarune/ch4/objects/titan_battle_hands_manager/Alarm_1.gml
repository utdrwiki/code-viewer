if (difficulty < 2)
{
    scr_lerpvar("hand_distance", 280, 400, 20, 3, "out");
    alarm[2] = 25;
}
else
{
    scr_lerpvar("hand_distance", 280, 400, 15, 3, "out");
    alarm[2] = 20;
}

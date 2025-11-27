snd_play(snd_ultraswing, 1, 0.75);
with (obj_titan_battle_finger)
    alarm[0] = 1;
if (difficulty < 2)
{
    scr_lerpvar("hand_distance", 170, 280, 40, 1, "out");
    alarm[4] = 20;
}
else
{
    scr_lerpvar("hand_distance", 170, 280, 30, 1, "out");
    alarm[4] = 20;
}

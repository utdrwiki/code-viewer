snd_play(snd_rudebuster_hit);
for (i = 0; i < 4; i += 1)
{
    burst[i] = scr_afterimage();
    burst[i].image_speed = 0.5;
    burst[i].x = cx;
    burst[i].y = cy;
    burst[i].image_angle = 45 + (i * 90);
    burst[i].direction = burst[i].image_angle;
    burst[i].speed = 25;
    burst[i].depth = depth - 10;
}
for (i = 4; i < 8; i += 1)
{
    burst[i] = scr_afterimage();
    burst[i].image_speed = 0.5;
    burst[i].x = cx;
    burst[i].y = cy;
    burst[i].image_angle = 45 + (i * 90);
    burst[i].direction = burst[i].image_angle;
    burst[i].speed = 25;
    burst[i].depth = depth - 10;
}

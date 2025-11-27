event_inherited();
timer++;
for (var i = 0; i < bullets; i++)
{
    with (bullet[i])
    {
        angle += other.turn;
        dist = scr_approach(dist, (15 + (10 * other.bullets)) * other.widthmod, (other.widthmod * 3) / sqrt(dist + 1));
        x = other.x + lengthdir_x(dist, angle);
        y = other.y + lengthdir_y(dist * 0.66, angle);
    }
}
if (timer == 10)
    direction = scr_at_player(x, y);
if (timer >= 10)
{
    speed = scr_approach(speed, speedtarg, speedtarg / 45);
    turn = scr_approach(turn, (7 * sign(turn)) / bullets, 0.1);
}

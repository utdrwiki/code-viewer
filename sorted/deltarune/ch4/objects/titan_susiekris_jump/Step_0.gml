repeat (updatespeed)
{
    x += hsp;
    y += vsp;
    vsp += grav;
}
timer++;
if (timer < 63)
    updatespeed = lerp(9, 1, timer / 63);
updatespeed = round(updatespeed);

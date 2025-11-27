if (!start)
    exit;
timer++;
if (timer == (round(transition_time / 2) + 1))
{
    if (transition_pause > 0)
    {
        transition_pause--;
        timer--;
    }
}
if (timer > 0 && timer <= transition_time)
    scr_quizwipe(timer / transition_time, 0, false);
if (!switch_room && timer >= (transition_time / 2))
{
    switch_room = true;
    persistent = true;
    room_goto(target_room);
}
if (timer >= transition_time)
{
    persistent = false;
    instance_destroy();
}

if (delay == false)
    timer++;
if (timer > 0 && timer <= transition_time)
    scr_quizwipe(timer / transition_time, 0, false);
if (delaytimer > 0 && timer >= (transition_time / 2))
{
    delay = true;
    delaytimer--;
    if (delaytimer == 0)
        delay = false;
}
if (timer >= transition_time)
    instance_destroy();

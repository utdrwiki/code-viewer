if (init == false)
{
    init = true
    animator.damage = damage
    animator.target = target
    animator.animSpeed = animSpeed
    animator.creator = creator
    if (!quizmode)
        animator.difficulty = difficulty
}
attacktimer += animSpeed
if (state == 0 && attacktimer >= 20)
{
    if (global.turntimer > 30)
    {
        state = 1
        animator.state = 1
    }
    else
        attacktimer = 19
}
if (state == 1 && attacktimer >= 35)
{
    state = 2
    animator.state = 2
    animator.zapping = 1
}
if (state == 2 && attacktimer > 55)
{
    animator.state = 3
    state = 3
}
if (attacktimer >= 65)
{
    state = 0
    attacktimer = 5
}

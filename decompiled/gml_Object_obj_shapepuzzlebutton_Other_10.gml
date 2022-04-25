if (!obj_shapepuzzle.goalHit)
{
    snd_play(snd_noise)
    global.interact = 1
    global.facing = 2
    active = true
    with (obj_shapepuzzle)
        inUse = 1
    with (myPiece)
        active = true
    mybuffer = 0
}

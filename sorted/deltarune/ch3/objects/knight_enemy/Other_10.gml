if (phase != 4)
{
    turn++;
    phaseturn++;
}
if (scr_debug() && overrideAttack > 0)
    phaseturn = overrideAttack;
if (phase == 1)
{
    if (phaseturn == 1)
    {
        myattackchoice = 1;
        difficulty = 0;
    }
    if (phaseturn == 2)
    {
        myattackchoice = 11;
        difficulty = 0;
    }
    if (phaseturn == 3)
    {
        myattackchoice = 2;
        difficulty = 0;
    }
    if (phaseturn == 4)
    {
        myattackchoice = 13;
        difficulty = 0;
    }
    if (phaseturn == 5)
    {
        myattackchoice = 5;
        difficulty = 0;
        phase = 2;
        phaseturn = 0;
    }
    if (phaseturn == 6)
    {
        myattackchoice = 12;
        difficulty = 0;
    }
    if (phaseturn == 7)
    {
        myattackchoice = 16;
        difficulty = 0;
    }
    if (phaseturn == 8)
    {
        myattackchoice = 17;
        difficulty = 0;
    }
    if (phaseturn == 9)
    {
        myattackchoice = 7;
        difficulty = 0;
    }
}
if (phase == 2)
{
    if (phaseturn == 1)
    {
        myattackchoice = 1;
        difficulty = 1;
    }
    if (phaseturn == 2)
    {
        myattackchoice = 2;
        difficulty = 1;
    }
    if (phaseturn == 3)
    {
        myattackchoice = 13;
        difficulty = 3;
    }
    if (phaseturn == 4)
    {
        myattackchoice = 15;
        difficulty = 0;
    }
    if (phaseturn == 5)
    {
        myattackchoice = 5;
        difficulty = 1;
        phase = 3;
        phaseturn = 0;
    }
}
if (phase == 3)
{
    if (phaseturn == 1)
    {
        myattackchoice = 1;
        difficulty = 2;
    }
    if (phaseturn == 2)
    {
        myattackchoice = 2;
        difficulty = 3;
    }
    if (phaseturn == 3)
    {
        myattackchoice = 14;
        difficulty = 0;
    }
    if (phaseturn == 4)
    {
        myattackchoice = 13;
        difficulty = 4;
    }
    if (phaseturn == 5)
    {
        myattackchoice = 5;
        difficulty = 2;
        rotatingslash3used = true;
        phaseturn = 0;
    }
}
if (phase == 4)
{
    phase4turn++;
    if (phase4turn == 1 && rotatingslash3used == true)
        phase4turn = 2;
    if (phase4turn == 1)
    {
        myattackchoice = 5;
        difficulty = 2;
    }
    if (phase4turn == 2)
    {
        myattackchoice = -1;
        difficulty = 1;
    }
    if (phase4turn == 3)
    {
        myattackchoice = 9;
        difficulty = 0;
        damagereduction = 0.4;
        haveusedroaring = true;
        phase = 3;
    }
}

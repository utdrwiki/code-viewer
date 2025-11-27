remmovecon = movecon;
movecon = choose(0, 1, 2, 4);
if (movecon == remmovecon)
    movecon = choose(0, 1, 2, 4);
con = 0;
if (sleeptimer >= 900)
    movecon = 10;
if (global.chapter == 3 && global.fighting == 1)
{
    movecon = choose(0, 1, 4, 4);
    if (sleeptimer >= threshold)
    {
        movecon = 7;
        sleeptimer = 0;
        threshold = choose(90, 120);
    }
}

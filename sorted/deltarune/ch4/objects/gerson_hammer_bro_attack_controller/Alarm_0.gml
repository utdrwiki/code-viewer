count = 0;
if (pattern == 0)
    pattern = choose(1, 2);
else if (pattern == 1)
    pattern = choose(0, 2);
else if (pattern == 2)
    pattern = choose(0, 1);
if (pattern == 1 || pattern == 2)
    forcepattern++;
else
    forcepattern = 0;
if (forcepattern == 3)
{
    forcepattern = 0;
    pattern = 0;
}
if (pattern > 0)
{
    timer = -20;
    throwsframes = 1;
    if (forcepattern > 1)
    {
        timer = (5 + irandom(5)) * -1;
        throwsframes = 1;
    }
}
else
{
    timer = 0;
    throwsframes = 6;
}

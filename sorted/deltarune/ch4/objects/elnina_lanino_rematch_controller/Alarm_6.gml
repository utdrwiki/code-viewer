if (balloonend == 1)
{
    talked = 1;
    talktimer = 0;
}
else
{
    talked = 0.6;
    talktimer = 0;
    if (global.mnfight == 2)
    {
        talked = 0;
        afterbulletcon = 0;
    }
}

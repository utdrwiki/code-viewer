myinteract = 0;
if (image_xscale < 2)
    image_xscale = 2;
if (image_yscale < 2)
    image_yscale = 2;
alarm[3] = 1;
siner = 0;
basic = 1;
disable = 0;
f = 2;
sold = 0;
black_override = 0;
stayVisible = 0;
skip = 0;
ignorealpha = 0;
if (disableflag > 0)
{
    if (global.flag[disableflag] == 1)
    {
        instance_destroy();
        exit;
    }
}
if (disableplot > 0)
{
    if (global.plot >= disableplot)
    {
        instance_destroy();
        exit;
    }
}

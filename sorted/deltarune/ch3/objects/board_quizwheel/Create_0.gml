timer = 0;
depth = 700000;
siner = 0;
pushsiner = 0;
rotationalspeed = 0;
rotationalfriction = 0.5;
init = 0;
slicetype = 0;
maxslices = 16;
for (i = 0; i < 16; i++)
{
    sliceicon[i] = 3301;
    slicetext[i] = "AFEHFSJDHS" + string(irandom(400));
    slicetextcolor[i] = choose(16777215, 65535, 4235519);
    slicebgcolor[i] = choose(16776960, 16711935, 65280);
    sliceweight[i] = 1;
}
slicesurf = -1;
spinready = 0;
meterfill = 0;
sliceflash = 0;

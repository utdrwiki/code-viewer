siner = 0;
pushsiner = 0;
rotationalspeed = 0;
rotationalfriction = 0.5;
init = 0;
slicetype = 1;
maxslices = 16;
for (i = 0; i < 16; i++)
{
    sliceicon[i] = 3301;
    slicetext[i] = "AFEHFSJDHS" + string(irandom(400));
    slicetextcolor[i] = choose(16777215, 65535, 4235519);
}

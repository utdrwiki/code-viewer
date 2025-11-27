timer++;
if ((timer % rate) == 0)
{
    xpos += inc;
    timer = 0;
}

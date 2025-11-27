for (var i = max_trail; i >= 1; i--)
{
    xx[i] = xx[i - 1];
    yy[i] = yy[i - 1];
}
xx[0] = x;
yy[0] = y;

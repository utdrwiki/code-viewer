var makeclimb = 0;
if (other.y < y)
{
    if (other.bbox_bottom >= (bbox_top + 30))
        makeclimb = 1;
}
else
{
    makeclimb = 1;
}
if (makeclimb)
{
    other.climbing = 1;
    other.climbingbuffer = 2;
}

if (heartwagon == 1)
{
    if (left_p() && heartx > -4)
        heartx -= 1;
    if (right_p() && heartx < 4)
        heartx += 1;
    if (down_p() && hearty < 4)
        hearty += 1;
    if (up_p() && hearty > -4)
        hearty -= 1;
}

if (cancelcon == 1)
{
    if (canceltimer == 0)
    {
        canceldist = point_distance(tvsign.x, tvsign.y, cancelled.x, cancelled.y);
        cancelang = point_direction(tvsign.x, tvsign.y, cancelled.x, cancelled.y);
        canceltimer = 5;
    }
    with (cancelled)
        scr_orbitaroundpoint_dx(other.tvsign.x, other.tvsign.y, other.canceldist, other.cancelang + other.tvsign.image_angle);
    cancelled.image_angle = tvsign.image_angle + 2;
    canceltimer--;
    if (canceltimer == 0)
        cancelcon = 0;
}

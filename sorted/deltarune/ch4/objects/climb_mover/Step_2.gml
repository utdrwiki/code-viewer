if (stick == true)
{
    with (obj_climb_kris)
    {
        if (onrotatingtower)
            setxy(other.xprediction + 20, other.yprediction + 20);
        else
            setxy(other.x + 20, other.y + 20);
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
}
with (myclimb)
    setxy(other.x, other.y);

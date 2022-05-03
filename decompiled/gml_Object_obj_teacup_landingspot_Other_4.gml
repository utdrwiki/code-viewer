if (teacupTarget == self)
    teacupTarget = 1091
with (teacupTarget)
{
    if (other.rideEnd == 1)
        endPos[other.partyMember] = [other.x, other.y]
    else
        startPos[other.partyMember] = [other.x, other.y]
}
instance_destroy()

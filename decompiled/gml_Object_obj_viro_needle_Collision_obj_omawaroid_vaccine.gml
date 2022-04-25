if active
{
    active = false
    spawnVirus = false
    image_speed = 1
    speed = 0
    if (other.topspeed == 0)
        other.topspeed = other.speed
    other.speed = 0
}

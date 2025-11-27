if (engaged)
{
    with (obj_mainchara_board)
    {
        sleepy = false;
        setxy(other.x, other.y);
        facing = other.facing;
        if (swordbuffer <= 0)
            image_index = 0;
        if (other.updateplayerdepth == true)
        {
            depth = other.depth - 1;
            if (controlled == 1)
                depth -= 2;
        }
    }
}

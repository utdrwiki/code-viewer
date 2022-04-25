if (con == 1 && other.con == 1 && active == true && other.active == true)
{
    if (locked == false)
    {
        speed = 0
        locked = true
        with (other)
        {
            speed = 0
            locked = true
        }
        repeat (16)
        {
            if (side == 0)
            {
                if (x >= (other.x - 28))
                    x -= 1
                if (x >= (other.x - 28))
                    other.x += 1
            }
            if (side == 3)
            {
                if (y >= (other.y - 28))
                    y -= 1
                if (y >= (other.y - 28))
                    other.y += 1
            }
            if (side == 2)
            {
                if (x <= (other.x + 28))
                    x += 1
                if (x <= (other.x + 28))
                    other.x -= 1
            }
            if (side == 1)
            {
                if (y <= (other.y + 28))
                    y += 1
                if (y <= (other.y + 28))
                    other.y -= 1
            }
        }
    }
}

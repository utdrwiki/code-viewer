if (buffer > -5)
    buffer--
if (timer < 999)
    timer++
if (mytimer > 0)
    mytimer--
left = 0
right = 0
down = 0
if (rotate == 1)
{
    global.interact = 1
    if (down_p() && controlled.moving == false && (!d_ex()) && mytimer <= 0 && (!i_ex(obj_holemouse)) && buffer < 0)
    {
        mytimer = 20
        buffer = 3
        with (obj_holemouse_generator)
        {
            cooldown = 10
            other.controlled.move = 0
            other.down = 1
            mousecreate = 1
            gentimer = 20
        }
    }
    if (obj_holemouse_generator.image_index == 5 && (!d_ex()) && mytimer <= 0)
    {
        if left_h()
        {
            buffer = 3
            controlled.move = -1
        }
        if right_h()
        {
            buffer = 3
            controlled.move = 1
        }
    }
    if (instance_exists(obj_holemouse) || d_ex() || mytimer > 0)
        controlled.move = 0
    if ((left_h() && right_h()) || ((!left_h()) && (!right_h())))
    {
        left = 0
        right = 0
        controlled.move = 0
    }
    if ((button1_p() || button2_p()) && timer > 1 && mytimer <= 0 && (!i_ex(obj_holemouse)) && (!d_ex()) && buffer < 0)
    {
        buffer = 3
        rotate = 0
        controlled.move = 0
        global.interact = 0
    }
}
if (controlled.move == 1)
    right = 1
if (controlled.move == -1)
    left = 1
controlled.image_index = rotate
with (obj_holemouse_generator)
{
    if (gentimer > 0)
        other.down = 1
}

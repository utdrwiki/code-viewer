if (buffer < 0 && init)
{
    myinteract = 3;
    global.interact = 1;
    image_index = 1;
    if (skip == false)
    {
        writer = instance_create(x, y, obj_board_writer);
        writer.side = textside;
    }
    else
    {
        myinteract = 0;
    }
    read++;
    buffer = 5;
}

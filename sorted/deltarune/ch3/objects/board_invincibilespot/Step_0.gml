if (active)
{
    var inst = instance_place(x, y, obj_mainchara_board);
    with (inst)
    {
        if (myhealth < 0)
            myhealth = 1;
    }
}

for (i = 0; i < wonmax; i += 1)
{
    with (block[i])
        instance_destroy();
    block[i] = instance_create(1200 + (i * 40), 1120, obj_soliddark);
    block[i].image_yscale = 2;
    with (spike1[i])
        image_index = 0;
    with (spike2[i])
        image_index = 0;
}
wonamt = 0;

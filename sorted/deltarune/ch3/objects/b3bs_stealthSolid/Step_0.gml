if (init == 0)
{
    init = 1;
    left = instance_create(x + 40, y + 28, obj_solidblock_diagonal_32);
    left.image_xscale = -1.25;
    left.image_yscale = 0.375;
    body = instance_create(x + 40, y + 28, obj_solidblocksized);
    body.image_xscale = image_xscale - 2;
    body.image_yscale = 0.3;
    right = instance_create((x + (40 * image_xscale)) - 40, y + 28, obj_solidblock_diagonal_32);
    right.image_xscale = 1.25;
    right.image_yscale = 0.375;
}

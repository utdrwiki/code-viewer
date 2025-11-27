image_speed = 0;
change_palette = false;
palette_index = 0;
palette_siner = 0;
image_xscale = 2;
image_yscale = 2;

create_block = function()
{
    var block = instance_create(x, y + 100, obj_solidblocksized);
    with (block)
        image_xscale = 8;
};

break_stairs = function()
{
    image_index = 4;
    create_block();
};

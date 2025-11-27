image_xscale = 2;
image_yscale = 2;
image_speed = 0;
scr_depth(undefined, 20);
can_hat = true;
xoff = 0;
yoff = 0;
act = 0;
linked_char = -1;
type = 0;
scale = 1;
pickable = true;
spritestack = [];
indexstack = [];

stack_hat = function(arg0, arg1)
{
    array_push(spritestack, arg0);
    array_push(indexstack, arg1);
};

unstack_hat = function()
{
    if (array_length(spritestack) > 0)
    {
        var hat = instance_create(x, y, obj_mouse_hat);
        var idx = array_length(spritestack) - 1;
        hat.sprite_index = spritestack[idx];
        hat.image_index = indexstack[idx];
        array_delete(spritestack, idx, 1);
        array_delete(indexstack, idx, 1);
        return hat;
    }
    else
    {
        return self;
    }
};

event_inherited();
can_interact = true;
target_actor = -4;
actor_name = "";
basement_parent = instance_find(obj_noellehouse_basement, 0);

init_actor = function(arg0, arg1)
{
    target_actor = arg0;
    actor_name = arg1;
    sprite_index = target_actor.sprite_index;
    image_index = target_actor.image_index;
    image_speed = target_actor.image_speed;
    x = target_actor.x;
    y = target_actor.y;
    depth = target_actor.depth - 10;
};

trigger = function()
{
    can_interact = false;
    var _actor_name = actor_name;
    with (basement_parent)
        freak_out(_actor_name);
};

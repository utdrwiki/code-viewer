if (obj_chefs_game.gameover)
    exit;
if (caught || thrown || on_fire)
    exit;
var _other = other;
var _me = id;
if (_other.caught && !_other.on_fire && !_other.thrown)
{
    with (obj_chefs_kris)
    {
        if (instance_exists(food[stack_height - 1]))
            add_to_stack(_me);
    }
}

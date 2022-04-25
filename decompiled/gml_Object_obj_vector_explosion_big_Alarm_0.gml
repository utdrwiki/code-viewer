if (instance_exists(o_boxingcontroller) && o_boxingcontroller.dead == true)
{
    o_boxingcontroller.dead = 2
    instance_create(320, 240, obj_vector_queen_face)
}
instance_destroy()

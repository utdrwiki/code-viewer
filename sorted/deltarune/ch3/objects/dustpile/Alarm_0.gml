if (bust == 0)
{
    var dustball = instance_create(x + 60, y + 20, obj_dustball);
    dustball.depth = depth - 5;
    alarm[0] = 10;
}

function scr_freezeval(arg0 = id, arg1, arg2, arg3 = -1)
{
    var freezeval = instance_create_depth(0, 0, 0, obj_freezeval);
    freezeval.variablename = arg1;
    freezeval.val = arg2;
    freezeval.lifetime = arg3;
    return freezeval;
}

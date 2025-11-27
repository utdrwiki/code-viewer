function scr_tennabubble()
{
    var __lifetime = -1;
    var __clear = true;
    var __tennaObj = -1;
    var __taillength = -1;
    var __tailwidth = 8;
    if (argument_count >= 4)
        __lifetime = argument3;
    if (argument_count >= 5)
        __clear = argument4;
    if (argument_count >= 6)
        __tennaObj = argument5;
    if (argument_count >= 7)
        __taillength = argument6;
    if (argument_count >= 8)
        __tailwidth = argument7;
    var tennaBubble = instance_create(argument1, argument2, obj_tennatalkbubble);
    tennaBubble.text = argument0;
    tennaBubble.clear = __clear;
    tennaBubble.lifetime = __lifetime;
    tennaBubble.tenna = __tennaObj;
    tennaBubble.taillength = __taillength;
    tennaBubble.tailwidth = __tailwidth;
    tennaBubble.bubbletype = 0;
    return tennaBubble;
}

function scr_tennabubble_angle()
{
    var __lifetime = -1;
    var __clear = true;
    var __tailwidth = 8;
    if (argument_count >= 6)
        __lifetime = argument5;
    if (argument_count >= 7)
        __clear = argument6;
    if (argument_count >= 8)
        __tailwidth = argument7;
    var tennaBubble = instance_create(argument1, argument2, obj_tennatalkbubble);
    tennaBubble.text = argument0;
    tennaBubble.clear = __clear;
    tennaBubble.lifetime = __lifetime;
    tennaBubble.tailwidth = __tailwidth;
    tennaBubble.bubbletype = 1;
    tennaBubble.type1direction = argument3 - 90;
    tennaBubble.taillength = argument4;
    return tennaBubble;
}

function scr_tennabubble_xytail()
{
    var __lifetime = -1;
    var __clear = true;
    var __taillength = -1;
    var __tailwidth = 8;
    if (argument_count >= 6)
        __lifetime = argument5;
    if (argument_count >= 7)
        __clear = argument6;
    if (argument_count >= 8)
        __tailwidth = argument7;
    var tennaBubble = instance_create(argument1, argument2, obj_tennatalkbubble);
    tennaBubble.text = argument0;
    tennaBubble.clear = __clear;
    tennaBubble.lifetime = __lifetime;
    tennaBubble.tailwidth = __tailwidth;
    tennaBubble.bubbletype = 2;
    tennaBubble.t2x = argument3;
    tennaBubble.t2y = argument4;
    return tennaBubble;
}

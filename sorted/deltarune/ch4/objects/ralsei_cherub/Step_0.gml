if (!init)
{
    var _char = global.char[target];
    target_char = global.charinstance[target];
    alive = global.hp[_char] > 0;
    if (alive)
    {
        xoff -= 6;
        yoff -= 20;
    }
    depth = target_char.depth - 20;
    xstart = target_char.x + 20;
    ystart = target_char.y + 10;
    init = true;
}

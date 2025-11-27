function instance_create_board(arg0, arg1, arg2)
{
    boardInstance = instance_create(128 + (32 * arg0), 64 + (32 * arg1), arg2);
    return boardInstance;
}

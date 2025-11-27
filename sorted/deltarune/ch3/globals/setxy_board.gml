function setxy_board(arg0 = x, arg1 = y)
{
    var __tileLayer = layer_get_id("BOARD_Tiles");
    var __originX = layer_get_x(__tileLayer);
    var __originY = layer_get_y(__tileLayer);
    setxy(arg0 + __originX, arg1 + __originY);
}

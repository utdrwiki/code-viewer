init = false;
board = "";
rank = "";
tx = 0;
ty = 0;
txt = "";
kern = 5;
tox = tx;

init_sign = function(arg0, arg1)
{
    board = arg0;
    rank = arg1;
    tx = x;
    ty = y;
    txt = stringsetsubloc("BOARD ~1", board, "obj_dw_ranking_hub_sign_slash_Create_0_gml_21_0");
    init = true;
};

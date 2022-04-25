scr_itemcheck_inventory_and_pocket = function(argument0) //gml_Script_scr_itemcheck_inventory_and_pocket
{
    var _haveeither = false
    var itemcounttotal = 0
    scr_itemcheck(argument0)
    if (haveit == true)
        _haveeither = true
    itemcounttotal += itemcount
    scr_itemcheck_pocket(argument0)
    if (haveit == true)
        _haveeither = 1
    itemcounttotal += itemcount
    haveit = _haveeither
    itemcount = itemcounttotal
    return haveit;
}


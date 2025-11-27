function scr_armorcheck_equipped_any(arg0)
{
    var __totalwearing = 0;
    for (var __weari = 0; __weari < array_length_1d(global.chararmor1); __weari++)
        __totalwearing += scr_armorcheck_equipped(__weari, arg0);
    return __totalwearing;
}

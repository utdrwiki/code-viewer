scr_smallface_reset = function(argument0) //gml_Script_scr_smallface_reset
{
    global.smalarm[argument0] = 5
    global.smyy[argument0] = 70
    global.smxx[argument0] = 170
    global.smdir[argument0] = 180
    global.smspeed[argument0] = 10
    global.smtype[argument0] = 3
    global.smimage[argument0] = global.fe
    global.smimagespeed[argument0] = 0
    global.smsprite[argument0] = spr_face_s6
    global.smcolor[argument0] = c_white
    global.smstring[argument0] = stringsetloc("* ... what?", "scr_smallface_reset_slash_scr_smallface_reset_gml_12_0")
    return;
}


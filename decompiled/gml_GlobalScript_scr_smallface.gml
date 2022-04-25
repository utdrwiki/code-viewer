scr_smallface = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_smallface
{
    scr_smallface_reset(argument0)
    global.smsprite[argument0] = spr_face_susie_alt
    if is_string(argument1)
    {
        if (argument1 == "susie")
            global.smsprite[argument0] = spr_face_susie_alt
        if (argument1 == "ralsei")
            global.smsprite[argument0] = spr_face_r_nohat
        if (argument1 == "lancer")
            global.smsprite[argument0] = spr_face_l0
        if (argument1 == "noelle")
            global.smsprite[argument0] = spr_face_n_matome
        if (argument1 == "noelle_cropped")
            global.smsprite[argument0] = spr_face_n_matome_cropped
        if (argument1 == "queen")
            global.smsprite[argument0] = scr_84_get_sprite("spr_face_queen")
        if (argument1 == "rouxls")
            global.smsprite[argument0] = spr_face_rurus
        if (argument1 == "berdly")
            global.smsprite[argument0] = spr_face_berdly_dark
        if (argument1 == "rudy")
            global.smsprite[argument0] = spr_face_rudy
        if (argument1 == "none" || argument1 == "empty")
            global.smsprite[argument0] = spr_empty
    }
    else
    {
        global.smsprite[argument0] = argument1
        if (argument1 == IMAGE_LOGO)
            global.smsprite[argument0] = spr_empty
    }
    global.smimage[argument0] = argument2
    if is_string(argument3)
    {
        if (global.fighting == true)
        {
            if (argument3 == "left")
                global.smxx[argument0] = 60
            if (argument3 == "leftmid")
                global.smxx[argument0] = 160
            if (argument3 == "mid" || argument3 == "middle")
                global.smxx[argument0] = 260
            if (argument3 == "rightmid")
                global.smxx[argument0] = 360
            if (argument3 == "right")
                global.smxx[argument0] = 460
        }
        else
        {
            if (argument3 == "left")
                global.smxx[argument0] = 70
            if (argument3 == "leftmid")
                global.smxx[argument0] = 160
            if (argument3 == "mid" || argument3 == "middle")
                global.smxx[argument0] = 260
            if (argument3 == "rightmid")
                global.smxx[argument0] = 360
            if (argument3 == "right")
                global.smxx[argument0] = 400
        }
    }
    else
        global.smxx[argument0] = argument3
    if is_string(argument4)
    {
        if (global.fighting == true)
        {
            if (argument4 == "top")
                global.smyy[argument0] = -10
            if (argument4 == "mid" || argument4 == "middle")
                global.smyy[argument0] = 30
            if (argument4 == "bottommid")
                global.smyy[argument0] = 45
            if (argument4 == "bottom")
                global.smyy[argument0] = 56
            if (argument4 == "bottom" || argument4 == "bottommid")
            {
                global.smdir[argument0] = 90
                global.smspeed[argument0] = 4
                global.smalarm[argument0] = 10
                global.smyy[argument0] += 40
                global.smxx[argument0] -= 40
            }
        }
        else
        {
            if (argument4 == "top")
                global.smyy[argument0] = -10
            if (argument4 == "mid" || argument4 == "middle")
                global.smyy[argument0] = 30
            if (argument4 == "bottommid")
                global.smyy[argument0] = 50
            if (argument4 == "bottom")
                global.smyy[argument0] = 68
            if (global.darkzone == false)
            {
                if (argument4 == "top")
                    global.smyy[argument0] = 160
                if (argument4 == "mid" || argument4 == "middle")
                    global.smyy[argument0] = 200
                if (argument4 == "bottommid")
                    global.smyy[argument0] = 240
                if (argument4 == "bottom")
                    global.smyy[argument0] = 240
            }
        }
    }
    else
        global.smyy[argument0] = argument4
    global.smstring[argument0] = argument5
    return;
}


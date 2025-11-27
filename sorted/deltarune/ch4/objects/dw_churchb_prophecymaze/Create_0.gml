timer = 0;
con = 0;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("FOLLOWER_SPRITES", 0);
followerinit = 0;
followers = [];
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
}
talked = 0;
folcon = 0;
sucon = 0;
show = false;
racon = 0;
ra1 = 0;
ra2 = 0;
makera = 2;
scr_walkntalk_create();

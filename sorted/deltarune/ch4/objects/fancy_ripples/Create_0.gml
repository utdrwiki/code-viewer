u_center = shader_get_uniform(shd_ripple, "rippleCenter");
u_rad = shader_get_uniform(shd_ripple, "rippleRad");
ripples = [];

MakeRipple = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    var _ripple = 
    {
        x: arg0,
        y: arg1,
        rad: arg3,
        radstart: arg3,
        life: arg9,
        lifemax: arg9,
        radmax: arg2,
        col: arg5,
        hsp: arg6,
        vsp: arg7,
        fric: arg8,
        thickness: arg4,
        curve: arg10
    };
    array_push(ripples, _ripple);
};

surf_ripples = -4;
curves = [animcurve_get_channel(1, "norm"), animcurve_get_channel(1, "slow")];

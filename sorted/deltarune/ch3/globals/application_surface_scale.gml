function application_surface_scale()
{
    var appsurf = application_get_position();
    var appsurfscale = (appsurf[2] - appsurf[0]) / (320 + (320 * global.darkzone));
    debug_message("Application Surface Scale=" + string(appsurfscale));
    return appsurfscale;
}

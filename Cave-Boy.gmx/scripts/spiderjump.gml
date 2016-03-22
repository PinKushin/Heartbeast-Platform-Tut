///spiderjump()
image_index = image_number - 1;

//apply gravity
if !place_meeting (x, y + 1, oSolid) {
    vspd += grav;
}else{
    vspd = 0
    
    //use friction
    applyfriction (acc);
    
    //check for idle state
    if hspd == 00 && vspd == 0 {
        state = spideridle;
        alarm[idle] = 15;
        image_speed = 0;
        image_index = 0;
    }
}

if hspd != 0 { image_xscale = sign(hspd)};

///move
horizontalmovebounce(oSolid)

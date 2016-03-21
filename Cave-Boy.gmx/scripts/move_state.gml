///move_state()

///player control
var right = keyboard_check (ord ("D"));
var left = keyboard_check (ord ("A"));
var up = keyboard_check_pressed (vk_space);
var up_release = keyboard_check_released (vk_space)

if !place_meeting (x, y+1, oSolid) {
    vspd += grav;
    
    //control jump height
    if up_release && vspd < -6 {
        vspd = -6;
    }
}else{
    vspd = 0;
    
    //Jump
    if up {
        vspd = -12;
    }
}

if right {
    hspd = spd;
}
if left {
    hspd = -spd;
}
//friction
if !right && !left {
    hspd = 0;;
}

move(oSolid);

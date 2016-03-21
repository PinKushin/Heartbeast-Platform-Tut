///snakemoveleft
var wallatleft = position_meeting (bbox_left - 1, y, oSolid)
var ledgeatleft = !position_meeting (bbox_left - 1, bbox_bottom + 1, oSolid);

if wallatleft || ledgeatleft {
    state = snakemoveright;
}

///control sprite
image_xscale = -1;

///move the snake
x -= 1;


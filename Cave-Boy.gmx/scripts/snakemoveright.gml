///snakemoveright()
var wallatright = position_meeting (bbox_right + 1, y, oSolid)
var ledgeatright = !position_meeting (bbox_right + 1, bbox_bottom + 1, oSolid);

if wallatright || ledgeatright {
    state = snakemoveleft;
}

///control sprite
image_xscale = 1;

///move the snake
x += 1;


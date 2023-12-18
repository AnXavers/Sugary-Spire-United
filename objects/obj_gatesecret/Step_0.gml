sprite_index = cardspr
var _x = x
x = wave(xorigin - 120, xorigin + 120, 4, 0, current_time + cardtimer)
y = yorigin - 100
if ((x - _x) < 0)
	depth = dorigin + 10
else
	depth = dorigin - 10
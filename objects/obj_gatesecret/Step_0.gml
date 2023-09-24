sprite_index = cardspr
cardtimer += 20
var _x = x
x = wave(xorigin - 100, xorigin + 100, 4, 0, cardtimer)
y = yorigin - 100
if ((x - _x) < 0)
	depth = dorigin + 10
else
	depth = dorigin - 10
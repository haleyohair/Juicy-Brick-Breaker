extends ColorRect

var c = 0
var tween

var colors = [
	Color8(0,0,0,255)     
	,Color8(160,60,50,255)   
	,Color8(50,60,160,255)   
	,Color8(160,60,50,255)  
	,Color8(50,60,160,255)  
	,Color8(34,38,42,255)  
]

func _ready():
	update_color()

func update_color():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "color", colors[c], 2.0)
	tween.tween_callback(_tween_completed)

func _tween_completed():
	c = wrapi(c+1, 0, colors.size())
	update_color()

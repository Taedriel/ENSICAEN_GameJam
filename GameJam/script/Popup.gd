extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var growing = false

export (Vector2) var maxsize = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	rect_scale = Vector2(0,0)
	pass


func grow(delta, maxsize):
	if maxsize.x > rect_scale.x:
		rect_scale.x += maxsize.x * delta
	if maxsize.y > rect_scale.y:
		rect_scale.y += maxsize.y * delta
	if maxsize.y/2 <= rect_scale.y and maxsize.x/2 <= rect_scale.x :
		popup()
		
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		growing = true
	
func _process(delta):
	if growing:
		grow(delta, maxsize)

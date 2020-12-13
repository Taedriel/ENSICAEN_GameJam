extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maxsize = Vector2(0.8, 0.8)

func _ready():
#	rect_scale = Vector2(0,0)
	connect("about_to_show", self, "_on_Popup_about_to_show")
	connect("popup_hide", self, "_on_Popup_about_to_hide")
	visible = true

func _on_Popup_about_to_show():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "modulate:a", 0.0, 1.0, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _on_Popup_about_to_hide():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "modulate:a", 1.0, 0.0, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		var rect = get_parent().get_global_position()
#		var rect = Vector2()
		rect.x -= 150
		rect.y -= 300
		rect_position = rect
		set_as_toplevel(true)
		var r = Rect2(rect, rect_size)
		
		popup()
		show()
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		hide()
		emit_signal("popup_hide")

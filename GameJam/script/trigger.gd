extends "Event.gd"

signal trigger(status)


# Called when the node enters the scene tree for the first time.
func _ready():
	# La variable c'est juste pour enlever un warning
	var _warn = self.connect("body_entered", self, "_on_body_entered")
	_warn = self.connect("body_exited", self, "_on_body_exited")

	for child in get_parent().get_children():
			if child == self:
				continue
			else:
				if child.has_method("_on_trigger"):
					_warn = self.connect("trigger", child, "_on_trigger")
					

func _on_body_entered(_body):
	emit_signal("trigger", true)

func _on_body_exited(_body):
	emit_signal("trigger", false)

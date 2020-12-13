extends StaticBody2D

export(String, MULTILINE) var text


func _ready():
	$Sprite/Label/Popup/TextureRect/RichTextLabel.text = text

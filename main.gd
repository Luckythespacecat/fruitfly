extends Node2D
const PreSliders = preload("res://object_controls.tscn")

func _process(delta: float) -> void:
	RenderingServer.set_default_clear_color(global.BackgroundColor)
	

func _new_object_sliders() -> void:
	var Sliders = PreSliders.instantiate()
	add_child(Sliders)

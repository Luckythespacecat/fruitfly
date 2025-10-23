extends Node2D


func _process(delta: float) -> void:
	pass


func _on_bounds_width_drag_started() -> void:
	global.ColorAdjustDone = false

func _on_bounds_height_drag_started() -> void:
	global.ColorAdjustDone = false


func _on_bounds_width_drag_ended(value_changed: bool) -> void:
	global.ColorAdjustDone = true


func _on_bounds_height_drag_ended(value_changed: bool) -> void:
	global.ColorAdjustDone = true

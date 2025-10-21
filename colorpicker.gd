extends Node2D

func _ready() -> void:
	$ColorPicker.visible = false

func _process(delta: float) -> void:
	if global.LeftPanel == 0 :
		$ColorPicker.visible = false
		
	if $ColorPicker.visible == true:
		global.LeftPanel = 0
		await Engine.get_main_loop().process_frame
		await Engine.get_main_loop().process_frame
		global.LeftPanel = 1

func _on_texture_button_pressed() -> void:
	$ColorPicker.visible = not $ColorPicker.visible

func _on_color_picker_color_changed(color: Color) -> void:
	global.BackgroundColor = color

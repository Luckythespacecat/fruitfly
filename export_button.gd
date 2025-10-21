extends Node2D

var frametosave 

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_SaveDialog_file_selected(path):
	frametosave.save_png(path)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
func _on_close_please():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
func get_frame():
	$Camera2D.zoom = Vector2(1.67,1.67)
	await Engine.get_main_loop().process_frame
	await Engine.get_main_loop().process_frame
	await Engine.get_main_loop().process_frame
	var image = $Camera2D.get_viewport().get_texture().get_image()
	await Engine.get_main_loop().process_frame
	await Engine.get_main_loop().process_frame
	$Camera2D.zoom = Vector2(1,1)
	return image

func _on_texture_button_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	frametosave = await get_frame()
	var file_dialog = FileDialog.new()
	add_child(file_dialog)
	file_dialog.title = "Save the Image"
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	file_dialog.filters = ["*.png,*.jpg,*.jpeg,*.bmp ; Image Files"]
	file_dialog.file_selected.connect(_on_SaveDialog_file_selected)
	file_dialog.close_requested.connect(_on_close_please)
	file_dialog.canceled.connect(_on_close_please)
	file_dialog.popup_centered()

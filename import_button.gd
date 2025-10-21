extends Node2D

@onready var import_button = $TextureButton # Assuming ImportButton is a child
const TextureRectNew = preload("res://texture_rect.tscn")

func _ready():
	import_button.pressed.connect(_on_texture_button_pressed)

func _on_FileDialog_file_selected(path: String):
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	var image = Image.new()
	var error = image.load(path)
	if error == OK:
		var texture = ImageTexture.create_from_image(image)
		var new_texture_rect = TextureRect.new()
		var ImageTextureNew = TextureRectNew.instantiate()
		add_child(ImageTextureNew)
		ImageTextureNew.texture = texture
	else:
		print("Error loading image: ", error)

func _on_close_please():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _on_texture_button_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var file_dialog = FileDialog.new()
	add_child(file_dialog)
	file_dialog.title = "Select an Image"
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.filters = ["*.png,*.jpg,*.jpeg,*.bmp ; Image Files"]
	file_dialog.file_selected.connect(_on_FileDialog_file_selected)
	file_dialog.close_requested.connect(_on_close_please)
	file_dialog.canceled.connect(_on_close_please)
	file_dialog.popup_centered()

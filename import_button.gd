extends Node2D

@onready var import_button = $Button # Assuming ImportButton is a child
const TextureRectNew = preload("res://texture_rect.tscn")

func _ready():
	import_button.pressed.connect(_on_ImportButton_pressed)

func _on_ImportButton_pressed():
	var file_dialog = FileDialog.new()
	add_child(file_dialog)
	file_dialog.title = "Select an Image"
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.filters = ["*.png,*.jpg,*.jpeg,*.bmp ; Image Files"]
	file_dialog.file_selected.connect(_on_FileDialog_file_selected)
	file_dialog.popup_centered()

func _on_FileDialog_file_selected(path: String):
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

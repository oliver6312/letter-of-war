extends Area2D
class_name CenterToken

enum SwornTo {
	NONE,
	ASHTON,
	BELLARI,
	CARVANO,
	DRAVIN,
	TAURUS
}

@export_group("Basic Token Info")

@export var token_name: String = ""
@onready var name_label: Label = %NameLabel

@export var sworn_to: SwornTo = SwornTo.NONE:
	set(value):
		sworn_to = value
		if is_node_ready():
			update_sworn_icon()

@export var misc_list: Array[String] = []

@export_group("Production")

@export var steel_production: int = 0
@export var gold_production: int = 0
@export var food_production: int = 0

@export_group("Sworn Icons")

@export var ashton_texture: Texture2D
@export var bellari_texture: Texture2D
@export var carvano_texture: Texture2D
@export var dravin_texture: Texture2D
@export var taurus_texture: Texture2D
@export var unsworn_texture: Texture2D

@onready var sworn_icon: Sprite2D = %SwornIcon
@onready var info_popup: PopupPanel = %InfoPopup
@onready var info_text: RichTextLabel = %InfoPopupText

func _ready() -> void:
	update_name_label()
	update_sworn_icon()

func update_name_label() -> void:
	name_label.text = token_name

func update_sworn_icon() -> void:
	var texture := get_sworn_texture()

	if texture == null:
#		sworn_icon.visible = false
#		sworn_icon.texture = null
		return
	else:
		sworn_icon.visible = true
		sworn_icon.texture = texture

func get_sworn_texture() -> Texture2D:
	match sworn_to:
		SwornTo.ASHTON:
			return ashton_texture
		SwornTo.BELLARI:
			return bellari_texture
		SwornTo.CARVANO:
			return carvano_texture
		SwornTo.DRAVIN:
			return dravin_texture
		SwornTo.TAURUS:
			return taurus_texture

		_:
			return null

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			open_info_menu()

func open_info_menu() -> void:
	info_text.text = get_info_text()
	info_popup.popup_centered()

func get_info_text() -> String:
	var text := ""

	text += "Name:" + token_name + "\n"
	text += "Sworn To: " + get_sworn_name() + "\n"

	text += "Misc Notes\n"

	if misc_list.is_empty():
		text += "- None\n"
	else:
		for note in misc_list:
			text += "- " + note + "\n"

	return text

func get_sworn_name() -> String:
	match sworn_to:
		SwornTo.ASHTON:
			return "Ashton"
		SwornTo.BELLARI:
			return "Bellari"
		SwornTo.CARVANO:
			return "Carvano"
		SwornTo.DRAVIN:
			return "Dravin"
		SwornTo.TAURUS:
			return "Taurus"

		_:
			return "None"

func get_display_name() -> String:
	return token_name if token_name != "" else name

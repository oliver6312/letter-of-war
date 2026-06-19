extends Area2D
class_name BaseToken

enum SwornTo {
	NONE,
	BELLARI,
	VAUTIER,
	VISTARO,
	ARKAN,
	DRAVIN,
	KYRR,
	CARVANO
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

@export_group("Sworn Icons")

@export var bellari_texture: Texture2D
@export var vautier_texture: Texture2D
@export var vistaro_texture: Texture2D
@export var arkan_texture: Texture2D
@export var dravin_texture: Texture2D
@export var kyrr_texture: Texture2D
@export var carvano_texture: Texture2D

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
		sworn_icon.visible = false
		sworn_icon.texture = null
	else:
		sworn_icon.visible = true
		sworn_icon.texture = texture

func get_sworn_texture() -> Texture2D:
	match sworn_to:
		SwornTo.BELLARI:
			return bellari_texture
		SwornTo.VAUTIER:
			return vautier_texture
		SwornTo.VISTARO:
			return vistaro_texture
		SwornTo.ARKAN:
			return arkan_texture
		SwornTo.DRAVIN:
			return dravin_texture
		SwornTo.KYRR:
			return kyrr_texture
		SwornTo.CARVANO:
			return carvano_texture
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

	text += "[b]Name:[/b] " + token_name + "\n"
	text += "[b]Sworn To:[/b] " + get_sworn_name() + "\n"

	text += "\n[b]Misc Notes:[/b]\n"

	if misc_list.is_empty():
		text += "- None\n"
	else:
		for note in misc_list:
			text += "- " + note + "\n"

	return text

func get_sworn_name() -> String:
	match sworn_to:
		SwornTo.BELLARI:
			return "Bellari"
		SwornTo.VAUTIER:
			return "Vautier"
		SwornTo.VISTARO:
			return "Vistaro"
		SwornTo.ARKAN:
			return "Arkan"
		SwornTo.DRAVIN:
			return "Dravin"
		SwornTo.KYRR:
			return "Kyrr"
		SwornTo.CARVANO:
			return "Carvano"
		_:
			return "None"

extends HBoxContainer
class_name MainButtons

signal dance_clicked
signal observe_clicked
signal item_clicked

func appear():
	set_visibility(true)

func set_visibility(is_visible: bool):
	if is_visible:
		mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	visible = is_visible
	


func _on_dance_pressed() -> void:
	dance_clicked.emit()
	set_visibility(false)

func _on_observe_pressed() -> void:
	observe_clicked.emit()
	set_visibility(false)


func _on_item_pressed() -> void:
	item_clicked.emit()
	set_visibility(false)

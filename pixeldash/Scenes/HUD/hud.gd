class_name HUD
extends CanvasLayer

@onready var kiwiCountLabel := $KiwiPanel/Label
@onready var pineappleCountLabel := $PineapplePanel/Label

func update_kiwi_count(count:int, total:int) -> void:
	kiwiCountLabel.text = "%d/%d" % [count, total]

func update_pineapple_count(count:int, total:int) -> void:
	pineappleCountLabel.text = "%d/%d" % [count, total]

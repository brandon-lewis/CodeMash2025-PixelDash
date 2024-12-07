extends Node2D

var fruit_totals := {
	"Kiwi": 0,
	"Pineapple": 0
}

var fruit_maximums := {
	"Kiwi": 0,
	"Pineapple": 0
}

@onready var hud : HUD = $HUD

func _ready() -> void:
	for child in $FruitContainer.get_children():
		if child is Fruit:
			fruit_maximums[child.fruit] += 1
			child.collected.connect(handleFruitCollected)
	hud.update_kiwi_count(0, fruit_maximums["Kiwi"])
	hud.update_pineapple_count(0, fruit_maximums["Pineapple"])


# When any of the fruit emit their collected signal, we handle that signal by updating our fruit
# totals count and send the total for that fruit to the HUD for updating the UI/control components.
func handleFruitCollected(fruitName:String) -> void:
	fruit_totals[fruitName] += 1
	hud.update_kiwi_count(fruit_totals['Kiwi'], fruit_maximums["Kiwi"])
	hud.update_pineapple_count(fruit_totals['Pineapple'], fruit_maximums["Pineapple"])


func _on_level_music_finished() -> void:
	$LevelMusic.play()
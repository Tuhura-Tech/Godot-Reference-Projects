extends Control

const UI_HEART_EMPTY = preload("res://Assets/frames/ui_heart_empty.png")
const UI_HEART_FULL = preload("res://Assets/frames/ui_heart_full.png")
const UI_HEART_HALF = preload("res://Assets/frames/ui_heart_half.png")

@onready var health_cont = $healthCont
var hearts : Array
var maxHealth : int = 0

#believe it for NOT. this is the best way to design this without overengineering or creating a large amount of other scripts/nodes
func changedHealth(newHealth : int):
	for img in hearts:
		img.queue_free()
		
	for full in newHealth/2:
		addHeart(UI_HEART_FULL)
		
	if newHealth%2:
		addHeart(UI_HEART_HALF)
		
	if newHealth < maxHealth:
		for dif in (maxHealth - newHealth)/2:
			addHeart(UI_HEART_EMPTY)
	else:	
		maxHealth = newHealth
		
		

func addHeart(image):
	var img : TextureRect = TextureRect.new()
	img.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	img.texture = image
	health_cont.add_child(img)
	hearts.append(img)

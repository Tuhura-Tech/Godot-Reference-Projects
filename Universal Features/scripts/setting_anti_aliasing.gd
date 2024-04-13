extends HBoxContainer


func _on_msaa_2d_item_selected(index):
	RenderingServer.viewport_set_msaa_2d(get_viewport().get_viewport_rid(), index)


func _on_msaa_3d_item_selected(index):
	RenderingServer.viewport_set_msaa_3d(get_viewport().get_viewport_rid(), index)


func _on_fxaa_toggled(toggled_on):
	RenderingServer.viewport_set_screen_space_aa(get_viewport().get_viewport_rid(), int(toggled_on))


func _on_taa_toggled(toggled_on):
	RenderingServer.viewport_set_use_taa(get_viewport().get_viewport_rid(), toggled_on)

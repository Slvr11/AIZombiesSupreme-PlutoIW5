function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("settings_recipe_choosetype_standard")
	
    -- Add menu button for AIZ
    -- button = Menu_AddButton(menu, 10, "@MPUI_AIZ_CAPS",
	-- function(menu,button)
		-- Game.SetDvar("g_gametype", "aiz")
		-- Game.SetDvar("ui_gametype", "aiz")
	-- end
    -- )
    button = UI.Item.new()
    button:SetRect(-110, 270, 305, 20, 0, 0)
    button:SetTextScale(0.375)
    button:SetTextOffset(103, 18)
    button:SetTextInvertX(true)
    button:SetType(UI.ItemType.Button)
    button:SetFont(UI.Fonts.NormalFont)
    button:SetTextOffset(280, 18)
    button:SetText("@MPUI_AIZ_CAPS")
    button:OnFocus(
        function(menu,button)
		button:SetMaterial("navbar_selection_bar")
		Game.PlaySound("mouse_over")
		Game.SetLocalVarString("ui_modes_gametype", "aiz")
		Game.SetLocalVarString("ui_info_name", "@MPUI_AIZ")
		Game.SetLocalVarString("ui_info_desc", "@MENU_AIZ_DESC")
		Game.SetLocalVarString("ui_info_icon", "weapon_missing_image")
		if onfocuscb ~= nil then
                	onfocuscb(menu, button)
            	end
        end
    )
    button:OnLeaveFocus(
        function(menu,button)
            button:SetMaterial("")
        end
    )
    button:IsVisible(
	isvisiblecb
    )
    button:IsEnabled(
	isenabledcb
    )
    button:OnClick(
        function(menu,button)
        	Game.PlaySound("mouse_click")
		Game.SetDvar("g_gametype", "aiz")
		Game.SetDvar("ui_gametype", "aiz")
		Game.CloseMenu("settings_recipe_choosetype_standard")
        	if onclickcb ~= nil then
                	onclickcb(menu, button)
            	end
	end
    )
    menu:AddItem(button)

end

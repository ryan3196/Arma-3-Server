class infiSTAR_KeyBinds
{
	idd = 55;
	
	class ControlsBackground
	{
		class infiSTAR_KeyBinds_Background
		{
			type = 0;
			idc = 100;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.39444445;
			w = safeZoneW * 0.413125;
			h = safeZoneH * 0.55555556;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.6};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class infiSTAR_KeyBinds_Title
		{
			type = 0;
			idc = 101;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.39333334;
			w = safeZoneW * 0.413125;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "infiSTAR.de Keybinds";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35);
			
		};
		
	};
	class Controls
	{
		class infiSTAR_KeyBinds_Actionlist
		{
			type = 5;
			idc = 102;
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.18625;
			h = safeZoneH * 0.51;
			style = 16;
			colorBackground[] = {0.1,0.1,0.1,0.6};
			colorDisabled[] = {0.1,0.1,0.1,0.6};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onLBSelChanged = "_this call fn_infiSTAR_keyBinds_lbSelChanged";
			onLoad = "(_this select 0) call fn_infiSTAR_keyBinds_initListbox";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class infiSTAR_KeyBinds_currentKey
		{
			type = 0;
			idc = 103;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.03;
			style = 0;
			text = "ASSIGNED KEY";
			colorBackground[] = {0.1,0.1,0.1,0.6};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
			
		};
		class infiSTAR_KeyBinds_currentKeyEdit
		{
			type = 2;
			idc = 104;
			x = safeZoneX + safeZoneW * 0.5 + (safeZoneW * 0.08);
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.10625;
			h = safeZoneH * 0.03;
			style = 0;
			text = "";
			autocomplete = "";
			colorBackground[] = {0,0,0,0.6};
			colorDisabled[] = {0,0,0,0.6};
			colorSelection[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2);
			onKeyDown = "_this call fn_infiSTAR_keyBinds_edit_KeyDown;";
			onLoad = "uiNameSpace setVariable ['infiSTAR_keyBinds_edit',_this select 0];";
			
		};
		class infiSTAR_KeyBinds_save
		{
			type = 1;
			idc = 105;
			x = safeZoneX + safeZoneW * 0.605;
			y = safeZoneX + safeZoneW * 0.5;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.04555556;
			style = 0+2;
			text = "Save";
			borderSize = 0;
			colorBackground[] = {0.1,0.1,0.1,0.6};
			colorBackgroundActive[] = {0.2,0.2,0.2,0.6};
			colorBackgroundDisabled[] = {0,0,0,0.6};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			action = "[] call fn_infiSTAR_keyBinds_btnSave;";
			
		};
		class infiSTAR_KeyBinds_reset
		{
			type = 1;
			idc = 106;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneX + safeZoneW * 0.5;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.04555556;
			style = 0+2;
			text = "Reset";
			borderSize = 0;
			colorBackground[] = {0.1,0.1,0.1,0.6};
			colorBackgroundActive[] = {0.2,0.2,0.2,0.6};
			colorBackgroundDisabled[] = {0,0,0,0.6};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			action = "[] call fn_infiSTAR_keyBinds_btnReset;";
			
		};
		class infiSTAR_KeyBinds_resetAll
		{
			type = 1;
			idc = 107;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneX + safeZoneW * 0.55;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.04555556;
			style = 0+2;
			text = "Reset All";
			borderSize = 0;
			colorBackground[] = {0.1,0.1,0.1,0.6};
			colorBackgroundActive[] = {0.2,0.2,0.2,0.6};
			colorBackgroundDisabled[] = {0,0,0,0.6};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			action = "[] call fn_infiSTAR_keyBinds_btnResetAll;";
			
		};
		
	};
	
};

class infiSTAR_CHAT
{
	idd=-1340;
	movingenable=false;
	onKeyDown="call fnc_chat_onKeyDown;";
	class controls
	{
		class RscListbox_1500:RscListBox_infiSTAR
		{
			idc = 1500;
			x = 0.133846 * safezoneW + safezoneX;
			y = 0.0929318 * safezoneH + safezoneY;
			w = 0.165027 * safezoneW;
			h = 0.792133 * safezoneH;
			onLoad="uiNamespace setVariable ['chat_playerlist', _this select 0];call fnc_fill_chat_playerlist;(_this select 0) lbSetCurSel 0;";
			onLBSelChanged="call fnc_chat_onLBSelChanged;";
		};
		class RscListbox_1501:RscListBox_infiSTAR
		{
			idc = 1501;
			x = 0.298873 * safezoneW + safezoneX;
			y = 0.0929318 * safezoneH + safezoneY;
			w = 0.505396 * safezoneW;
			h = 0.71512 * safezoneH;
			sizeEx=0.03;
			onLoad="uiNamespace setVariable ['chat_msgbox', _this select 0];call fnc_fill_chat_history;";
		};
		class RscEdit_1401:RscEdit_infiSTAR_multi
		{
			idc = 1401;
			x = 0.298873 * safezoneW + safezoneX;
			y = 0.808052 * safezoneH + safezoneY;
			w = 0.505396 * safezoneW;
			h = 0.0770129 * safezoneH;
			onLoad="uiNamespace setVariable ['chat_inputfield', _this select 0];";
		};
		class RscButton_1600:RscButton_infiSTAR
		{
			idc = 1600;
			text = "close";
			x = 0.752 * safezoneW + safezoneX;
			y = 0.885064 * safezoneH + safezoneY;
			w = 0.051571 * safezoneW;
			h = 0.0330055 * safezoneH;
			colorBackground[]={0.6,0,0,0.6};
			style = 2;
			action = "(findDisplay -1340) closeDisplay 0;";
		};
		class RscButton_1601:RscButton_infiSTAR
		{
			idc = 1601;
			text = "send";
			x = (0.752 * safezoneW + safezoneX)-((0.051571 * safezoneW)*1.1);
			y = 0.885064 * safezoneH + safezoneY;
			w = 0.051571 * safezoneW;
			h = 0.0330055 * safezoneH;
			colorBackground[]={0.6,0,0,0.6};
			style = 2;
			action = "call fnc_chat_send;";
		};
		class RscButton_1602:RscButton_infiSTAR
		{
			idc = 1602;
			text = "refresh list";
			x = 0.133846 * safezoneW + safezoneX;
			y = 0.885064 * safezoneH + safezoneY;
			w = 0.051571 * safezoneW;
			h = 0.0330055 * safezoneH;
			colorBackground[]={0.6,0,0,0.6};
			style = 2;
			action = "call fnc_fill_chat_playerlist;";
		};
		class RscText_1000:RscText_infiSTAR
		{
			idc = 1000;
			x = 0.133846 * safezoneW + safezoneX;
			y = 0.0599262 * safezoneH + safezoneY;
			w = 0.670423 * safezoneW;
			h = 0.0330055 * safezoneH;
			colorText[]={1,1,1,0.9};
			colorBackground[]={0.6,0,0,0.6};
			text = "Chatpartner";
			onLoad="uiNamespace setVariable ['chat_text1', _this select 0];";
		};
	};
};

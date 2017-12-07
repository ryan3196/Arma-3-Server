/*
Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de
#15028
*/
class infiSTAR_AdminMenu
{
	idd=-1338;
	movingenable=false;
	controls[]=
	{
		infi_TXT2,
		infi_BTN10,
		infi_BTN11,
		infi_BTN12,
		infi_LIST1500,
		infi_LIST1501,
		infi_BTN20,
		infi_BTN21,
		infi_BTN23,
		infi_BTN24,
		infi_BTN25,
		infi_EDIT1,
		infi_EDIT2,
		infi_BTN36,
		infi_BTN37,
		infi_BTN38,
		infi_HTML_1
	};
	class infi_LIST1500:RscListBox_infiSTAR
	{
		idc=1500;
		x=4.99852e-005 * safezoneW + safezoneX;
		y=0.0617197 * safezoneH + safezoneY;
		w=0.189063 * safezoneW;
		h=0.938333 * safezoneH;
	};
	class infi_LIST1501:RscListBox_infiSTAR
	{
		idc=1501;
		x=0.188975 * safezoneW + safezoneX;
		y=0.0617197 * safezoneH + safezoneY;
		w=0.344271 * safezoneW;
		h=0.945999 * safezoneH;
	};
	class infi_EDIT1:RscEdit_infiSTAR
	{
		idc=100;
		text="";
		x=0.1964 * safezoneW + safezoneX;
		y=0.125933 * safezoneH + safezoneY;
		w=0.326563 * safezoneW;
		h=0.044 * safezoneH;
	};
	class infi_EDIT2:RscEdit_infiSTAR_multi
	{
		idc=103;
		show=0;
	};
	class infi_TXT2:RscText_infiSTAR
	{
		idc=2;
		text="infiSTAR.de";
		x=-5.31323e-005 * safezoneW + safezoneX;
		y=-7.50085e-005 * safezoneH + safezoneY;
		w=1 * safezoneW;
		h=0.0341667 * safezoneH;
		colorText[]={1,1,1,0.9};
		colorBackground[]={0.56,0.04,0.04,1};
	};
	class infi_HTML_1:RscHTML_infiSTAR
	{
		idc=1;
		x=0.535 * safezoneW + safezoneX;
		y=0.06 * safezoneH + safezoneY;
		w=0.40 * safezoneW;
		h=0.35 * safezoneH;
		onLoad="uiNamespace setVariable ['RscHTML_infiSTAR_Admin', _this select 0]";
		onUnload="uiNamespace setVariable ['RscHTML_infiSTAR_Admin', displayNull]";
	};
	class infi_BTN10:RscButton_infiSTAR
	{
		idc=10;
		text="Alphabet";
		x=0.005 + safezoneX;
		y=0.0379694 * safezoneH + safezoneY;
		w=0.06 * safezoneW;
		h=0.02 * safezoneH;
		action="SortRangePlease=nil;SortAlphaPlease=true;SortGroupsPlease=nil;[] call fnc_fill_infiSTAR_Player;[] call fnc_setFocus;";
	};
	class infi_BTN11:RscButton_infiSTAR
	{
		idc=11;
		text="Groups";
		x=0.01 + safezoneX + (0.06 * safezoneW);
		y=0.0379694 * safezoneH + safezoneY;
		w=0.06 * safezoneW;
		h=0.02 * safezoneH;
		action="SortAlphaPlease=nil;SortRangePlease=nil;SortGroupsPlease=true;[] call fnc_fill_infiSTAR_Player;[] call fnc_setFocus;";
	};
	class infi_BTN12:RscButton_infiSTAR
	{
		idc=12;
		text="Range";
		x=0.015 + safezoneX + (0.06 * safezoneW)*2;
		y=0.0379694 * safezoneH + safezoneY;
		w=0.06 * safezoneW;
		h=0.02 * safezoneH;
		action="SortAlphaPlease=nil;SortRangePlease=true;SortGroupsPlease=nil;[] call fnc_fill_infiSTAR_Player;[] call fnc_setFocus;";
	};
	class infi_BTN20:RscButton_infiSTAR
	{
		idc=20;
		default="true";
		text="MainMenu";
		x=0.202072 * safezoneW + safezoneX;
		y=0.0379694 * safezoneH + safezoneY;
		w=0.0625001 * safezoneW;
		h=0.02 * safezoneH;
	};
	class infi_BTN21:RscButton_infiSTAR
	{
		idc=21;
		text="SpawnMenu";
		x=0.287975 * safezoneW + safezoneX;
		y=0.0379694 * safezoneH + safezoneY;
		w=0.0625001 * safezoneW;
		h=0.02 * safezoneH;
	};
	class infi_BTN23:RscButton_infiSTAR
	{
		idc=23;
		text="AHLog";
		x=0.373981 * safezoneW + safezoneX;
		y=0.0379694 * safezoneH + safezoneY;
		w=0.0625001 * safezoneW;
		h=0.02 * safezoneH;
	};
	class infi_BTN24:RscButton_infiSTAR
	{
		idc=24;
		text="AdminLog";
		x=0.459884 * safezoneW + safezoneX;
		y=0.0379694 * safezoneH + safezoneY;
		w=0.0625001 * safezoneW;
		h=0.02 * safezoneH;
	};
	class infi_BTN25:RscButton_infiSTAR
	{
		idc=25;
		x=0.535 * safezoneW + safezoneX + (0.15 * safezoneW);
		y=0.0379694 * safezoneH + safezoneY;
		w=0.0625001 * safezoneW;
		h=0.02 * safezoneH;
		action="call fnc_btn_html";
	};
	class infi_BTN36:RscButton_infiSTAR
	{
		idc=36;
		text="Items";
		x=0.219294 * safezoneW + safezoneX;
		y=0.0819514 * safezoneH + safezoneY;
		w=0.0916667 * safezoneW;
		h=0.0329999 * safezoneH;
	};
	class infi_BTN37:RscButton_infiSTAR
	{
		idc=37;
		text="Vehicles";
		x=0.316644 * safezoneW + safezoneX;
		y=0.0819514 * safezoneH + safezoneY;
		w=0.0916667 * safezoneW;
		h=0.0329999 * safezoneH;
	};
	class infi_BTN38:RscButton_infiSTAR
	{
		idc=38;
		text="Trader";
		x=0.414097 * safezoneW + safezoneX;
		y=0.0819514 * safezoneH + safezoneY;
		w=0.0916667 * safezoneW;
		h=0.0329999 * safezoneH;
	};
};

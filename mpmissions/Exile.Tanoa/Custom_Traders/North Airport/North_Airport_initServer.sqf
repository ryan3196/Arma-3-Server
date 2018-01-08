/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 34 Vehicles
private _vehicles = [
["Exile_Sign_Hardware", [7985.56, 12432.2, 124.068], [0.161405, 0.986888, 0], [0, 0, 1], true],
["TK_WarfareBVehicleServicePoint_Base_EP1", [7949.4, 12416.3, 122.414], [0.468294, 0.883335, -0.0204805], [-0.0266571, 0.0372931, 0.998949], true],
["TK_WarfareBVehicleServicePoint_Base_EP1", [12170.5, 8173.9, 52.2027], [0.0571907, -0.998295, 0.0116368], [0.0293221, 0.0133304, 0.999481], true],
["Exile_Locker", [11623.1, 13127.3, 7.10529], [-0.937255, 0.348645, 0.000646973], [0.000690285, 0, 1], true],
["Exile_Sign_Locker", [11620.8, 13117.5, 8.14806], [0.315756, 0.94884, 0], [0, 0, 1], true],
["Exile_Sign_Locker", [11625.5, 13132.8, 8.14482], [0.307342, -0.951599, 0], [0, 0, 1], true],
["Exile_Locker", [11621.6, 13122.7, 7.10639], [-0.937255, 0.348645, 0.000646973], [0.000690285, 0, 1], true],
["Exile_Locker", [11628, 13118.5, 7.10231], [0.948189, -0.317706, -0.000654521], [0.000690285, 0, 1], true],
["Exile_Locker", [11629.8, 13123.9, 7.10073], [0.948189, -0.317706, -0.000654521], [0.000690285, 0, 1], true],
["Exile_Sign_WasteDump", [11594.2, 13123.7, 7.99105], [0.265966, 0.963983, 0], [0, 0, 1], true],
["Land_ScrapHeap_2_F", [11593.7, 13133.3, 7.87219], [0, 1, 0], [0, 0, 1], true],
["Land_Crash_barrier_F", [11587.3, 13136.9, 7.3], [0.943026, -0.33272, 0], [0, 0, 1], true],
["Land_Crash_barrier_F", [11584.9, 13130.4, 7.3], [0.943026, -0.33272, 0], [0, 0, 1], true],
["Land_PartyTent_01_F", [11591.2, 13131.9, 9.28013], [-0.324286, -0.945959, 0], [0, 0, 1], true],
["Land_BarGate_F", [11587.1, 13125.8, 11.0003], [-0.252019, -0.967722, 0], [0, 0, 1], true],
["Land_MedicalTent_01_white_IDAP_outer_F", [11544.1, 13154.1, 8.32456], [0.337688, 0.941258, 0], [0, 0, 1], true],
["Exile_Sign_Hardware_Small", [11542.8, 13155.1, 8.09147], [0.504042, 0.863679, 0], [0, 0, 1], true],
["Exile_Sign_Equipment_Small", [11544.5, 13155.1, 8.09147], [0.409121, 0.91248, 0], [0, 0, 1], true],
["Exile_Sign_Armory_Small", [11545.8, 13154.1, 8.09147], [0.446227, 0.89492, 0], [0, 0, 1], true],
["FoldTable", [11545.2, 13152.2, 7.3501], [0.300564, 0.953762, 0], [0, 0, 1], true],
["FoldTable", [11542.1, 13153.2, 7.3501], [0.300564, 0.953762, 0], [0, 0, 1], true],
["SmallTable", [11543.6, 13152.6, 7.35075], [0.365843, 0.930677, 0], [0, 0, 1], true],
["Heli_H_civil", [11556.1, 13170.7, 6.95], [0.3173, 0.948325, 0], [0, 0, 1], true],
["Heli_H_civil", [11573, 13165.4, 6.95], [0.3173, 0.948325, 0], [0, 0, 1], true],
["Heli_H_civil", [11606.8, 13154.7, 6.95], [0.3173, 0.948325, 0], [0, 0, 1], true],
["Heli_H_civil", [11590.5, 13159.8, 6.95], [0.3173, 0.948325, 0], [0, 0, 1], true],
["TK_WarfareBVehicleServicePoint_Base_EP1", [11492.5, 13239.3, 8.28088], [0, 1, 0], [0, 0, 1], true],
["TK_WarfareBVehicleServicePoint_Base_EP1", [11489.2, 13234.6, 8.28088], [-0.263534, -0.96465, 0], [0, 0, 1], true],
["TK_WarfareBVehicleServicePoint_Base_EP1", [11879.8, 13125.2, 8.28088], [0, 1, 0], [0, 0, 1], true],
["TK_WarfareBVehicleServicePoint_Base_EP1", [11876.5, 13120.4, 8.28088], [-0.263534, -0.96465, 0], [0, 0, 1], true],
["Land_Wreck_BRDM2_F", [11584.9, 13138.7, 7.49733], [0, 1, 0], [0, 0, 1], true],
["Land_SignM_forSale_F", [11575.1, 13130.4, 7.98996], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [11578.5, 13130.5, 7.99105], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Office", [11613, 13119.8, 8.15342], [0, 1, 0], [0, 0, 1], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

// 6 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["a3\soft_f_gamma\offroad_01\offroad_01_hmg_f.p3d", [11590.3, 13130.7, 9.05813], [0, 1, 0], [0, 0, 1]],
["a3\soft_f\mrap_01\mrap_01_unarmed_f.p3d", [11571.7, 13141.9, 9.12258], [0, 1, 0], [0, 0, 1]],
["a3\soft_f\mrap_01\mrap_01_unarmed_f.p3d", [11575.2, 13141.6, 9.15594], [0, 1, 0], [0, 0, 1]],
["a3\soft_f_gamma\truck_01\truck_01_fuel_f.p3d", [11578.8, 13136.7, 8.81956], [0, 1, 0], [0, 0, 1]],
["a3\soft_f\mrap_01\mrap_01_unarmed_f.p3d", [11575.2, 13133.9, 9.15594], [0, 1, 0], [0, 0, 1]],
["a3\soft_f_exp\lsv_01\lsv_01_f.p3d", [11571.6, 13135.7, 9.12615], [0, 1, 0], [0, 0, 1]]
];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;
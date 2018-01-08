/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 76 Vehicles
private _vehicles = [
["Exile_Sign_Office_Small", [6850.44, 7485.16, 4.10006], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Office", [6856.84, 7487.25, 3.70105], [-0.981857, 0.189624, 0], [0, 0, 1], true],
["Exile_Sign_TraderCity", [6951.31, 7497.88, 4.40319], [-0.833495, 0.552527, 0], [0, 0, 1], true],
["Exile_Sign_TraderCity", [6903.49, 7454.19, 4.40319], [-0.998216, -0.0597131, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [6899.25, 7471.2, 3.70105], [-0.999156, -0.041087, 0], [0, 0, 1], true],
["Exile_Sign_WasteDump", [6872.48, 7473.69, 3.81105], [0.0484212, -0.998827, 0], [0, 0, 1], true],
["Exile_Sign_TraderCity", [6854.09, 7467.41, 4.51468], [0.706803, 0.70741, 0], [0, 0, 1], true],
["Exile_Sign_WasteDump", [6856.58, 7469.82, 3.70105], [0.723336, -0.690497, 6.67013e-006], [0.0265022, 0.0277723, 0.999263], true],
["Land_Wreck_BMP2_F", [6872.46, 7453.69, 3.50953], [0, 1, 0], [0, 0, 1], true],
["Land_Wreck_BRDM2_F", [6869.8, 7455.35, 3.20733], [0, 1, 0], [0, 0, 1], true],
["Land_Wreck_Car2_F", [6872.54, 7460.16, 3.61287], [0, 1, 0], [0, 0, 1], true],
["Land_Wreck_Offroad_F", [6870.14, 7461.57, 3.59481], [0, 1, 0], [0, 0, 1], true],
["Land_Wreck_Ural_F", [6866.94, 7460.35, 3.84751], [-0.0618155, -0.998088, 0], [0, 0, 1], true],
["Land_Wreck_Truck_dropside_F", [6859.88, 7465.95, 3.83392], [-0.0277065, -0.999616, 0], [0, 0, 1], true],
["Land_Wreck_Truck_dropside_F", [6870.79, 7468.07, 3.94386], [0, 1, 0], [0, 0, 1], true],
["Land_Bulldozer_01_abandoned_F", [6867.71, 7467.35, 4.21249], [0, 1, 0], [0, 0, 1], true],
["Land_Wreck_Slammer_hull_F", [6863.7, 7465.66, 3.37802], [0, 1, 0], [0, 0, 1], true],
["Mi8Wreck", [6878.07, 7461.36, 9.16372], [0.0841261, -0.996406, -0.00993725], [-0.103995, -0.0186975, 0.994402], true],
["Land_PlasticNetFence_01_long_d_F", [6862.09, 7470.37, 3.15709], [-0.117769, 0.993041, 0], [0, 0, 1], true],
["Land_EngineCrane_01_F", [6866.73, 7471.09, 3.6784], [0, 1, 0], [0, 0, 1], true],
["Land_Crane_F", [6861.99, 7481.26, 20.9466], [0.997751, 0.0670366, 0], [0, 0, 1], true],
["Land_Wreck_Offroad_F", [6900.01, 7438.03, 3.7093], [-0.997335, -0.0729508, -0.000843474], [-0.000845728, 0, 1], true],
["Land_Wreck_Van_F", [6907.24, 7454.83, 3.66897], [0, 1, 0], [0, 0, 1], true],
["Land_EngineCrane_01_F", [6853.86, 7490.99, 3.77364], [0, 1, 0], [0, 0, 1], true],
["TargetPopUpTarget", [6875.04, 7497.89, 3.81512], [-0.0552067, 0.998475, 0], [0, 0, 1], true],
["TargetE", [6873.74, 7497.83, 3.83332], [0.206125, -0.978526, 0], [0, 0, 1], true],
["TargetPopup_ACR", [6872.82, 7497.61, 2.93756], [-0.228574, 0.973526, 0], [0, 0, 1], true],
["Exile_Sign_Armory", [6879.9, 7488.41, 3.70105], [-0.77832, 0.627868, 0], [0, 0, 1], true],
["Exile_Sign_Equipment", [6867.91, 7496.76, 3.97861], [-0.744452, 0.667676, 0], [0, 0, 1], true],
["Exile_Sign_Armory", [6877.04, 7498.13, 3.97861], [0.397979, 0.917394, 0], [0, 0, 1], true],
["Land_WeldingTrolley_01_F", [6886.96, 7473.84, 3.46198], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GasTank_02_F", [6888.38, 7472.74, 3.63458], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GasTank_02_F", [6887.86, 7472.73, 3.63101], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_IronPipes_F", [6885.92, 7469.9, 3.46226], [-0.963645, -0.267186, 0], [0, 0, 1], true],
["Land_CinderBlocks_01_F", [6884.51, 7474.73, 3.61985], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_IronPipes_F", [6885.31, 7469.05, 3.46226], [-0.978404, -0.206701, 0], [0, 0, 1], true],
["Land_CinderBlocks_01_F", [6884.52, 7473, 3.61985], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_MobileScafolding_01_F", [6890.6, 7474.55, 4.01772], [-0.190571, 0.981673, 9.30189e-005], [0.000488106, 0, 1], true],
["Land_GasTank_02_F", [6887.87, 7473.61, 3.63483], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GasTank_02_F", [6888.39, 7473.63, 3.63457], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GasTank_02_F", [6887.84, 7474.33, 3.63484], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GasTank_02_F", [6888.37, 7474.34, 3.63458], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GarbageBarrel_01_F", [6889.8, 7474.27, 3.3827], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_GarbageBarrel_01_english_F", [6891.05, 7474.5, 3.38209], [0, 1, 0], [0.000488106, 0, 1], true],
["Land_Tyre_01_line_x5_F", [6868.82, 7472.44, 2.77923], [0.843079, 0.53779, 0], [0, 0, 1], true],
["Exile_Sign_Hardware", [6884.22, 7474.51, 3.80881], [-0.10954, -0.993982, 0], [0, 0, 1], true],
["Land_Wall_IndCnc_Pole_F", [6913.35, 7439.02, 6.87731], [0, 1, 0], [0, 0, 1], true],
["Land_Wall_IndCnc_Pole_F", [6913.35, 7439.02, 3.65981], [0, 1, 0], [0, 0, 1], true],
["Land_Wall_IndCnc_Pole_F", [6913.2, 7429.91, 6.54752], [0, 1, 0], [0, 0, 1], true],
["Land_Wall_IndCnc_Pole_F", [6913.2, 7429.91, 3.38497], [0, 1, 0], [0, 0, 1], true],
["Land_Wall_IndCnc_Pole_F", [6919.93, 7428.6, 3.69479], [0, 1, 0], [0, 0, 1], true],
["B_Plane_Fighter_01_Stealth_F", [6914.59, 7431.68, 9.03855], [-0.121683, 0.990183, 0.0687751], [0.492044, 0, 0.87057], false],
["Land_Wall_IndCnc_Pole_F", [6914.27, 7424.96, 6.54752], [0, 1, 0], [0, 0, 1], true],
["Land_Wall_IndCnc_Pole_F", [6914.27, 7424.96, 3.38497], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Aircraft", [6914.44, 7429.78, 3.70105], [-0.864763, -0.50218, 0], [0, 0, 1], true],
["Exile_Sign_AircraftCustoms", [6913, 7433.94, 3.70105], [-0.816877, -0.576812, 0], [0, 0, 1], true],
["Land_JetEngineStarter_01_F", [6911.71, 7426.33, 3.82452], [0, 1, 0], [0, 0, 1], true],
["Land_HistoricalPlaneDebris_02_F", [6907.47, 7432.43, 3.03268], [0, 1, 0], [0, 0, 1], true],
["Land_HistoricalPlaneWreck_02_rear_F", [6906.87, 7428.62, 4.83871], [0, 1, 0], [0, 0, 1], true],
["Land_HistoricalPlaneDebris_04_F", [6910.45, 7433.42, 2.86417], [0, 1, 0], [0, 0, 1], true],
["Land_HistoricalPlaneDebris_03_F", [6908.61, 7425.56, 3.02522], [0, 1, 0], [0, 0, 1], true],
["Land_HistoricalPlaneDebris_01_F", [6907.73, 7435.16, 2.84683], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_Locker", [6897.79, 7474.77, 3.70105], [-0.0862475, -0.996274, 0], [0, 0, 1], true],
["Exile_Locker", [6887.67, 7470.94, 2.8054], [-0.979834, -0.199812, -0.000828673], [-0.000845728, 0, 1], true],
["Land_MapBoard_01_Wall_Tanoa_F", [6867.09, 7493.32, 5.43101], [-0.998477, -0.0551678, 0], [0, 0, 1], true],
["Exile_Sign_Food", [6867.53, 7491.3, 3.97861], [-0.980752, -0.195259, 0], [0, 0, 1], true],
["Exile_RussianRouletteChair", [6869.87, 7489.15, 2.93756], [-0.910388, -0.413755, 0], [0, 0, 1], true],
["LADAWreck", [6862.46, 7473.01, 21.6587], [0, 0.0311687, 0.999514], [0, -0.999514, 0.0311687], true],
["Map_for_briefing_EP1", [6850.05, 7491.91, 4.47196], [0, 1, 0], [0, 0, 1], true],
["Notice_board", [6850.77, 7491.02, 3.66362], [0.695961, 0.718079, 0], [0, 0, 1], true],
["CUP_Dhangar_knihovna", [6847.33, 7491.69, 2.75525], [0, 1, 0], [0, 0, 1], true],
["CUP_ch_office_B", [6848.45, 7491.52, 2.75525], [0, 1, 0], [0, 0, 1], true],
["CUP_conference_table_a", [6848.69, 7489.65, 3.09757], [-0.0790522, 0.99687, 0], [0, 0, 1], true],
["Land_Sofa_01_F", [6850.75, 7487.25, 3.25335], [-0.995414, -0.0956634, 0], [0, 0, 1], true],
["Land_TableSmall_01_F", [6850.94, 7485.76, 2.9712], [-0.999044, -0.0437082, 0], [0, 0, 1], true],
["Land_TableSmall_01_F", [6850.63, 7488.87, 2.9712], [-0.999044, -0.0437082, 0], [0, 0, 1], true]
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

// 29 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["", [6869.02, 7491.78, 3.89755], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\cerealsbox_f.p3d", [6869.31, 7491.8, 4.05614], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\items\food\can_rusty_f.p3d", [6869.02, 7491.46, 3.93759], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\items\food\can_v3_f.p3d", [6869.34, 7491.57, 3.93856], [0, 1, 0], [0, 0, 1]],
["exile_assets\model\exile_item_emre.p3d", [6869.03, 7491.1, 3.89755], [0, 1, 0], [0, 0, 1]],
["exile_assets\model\exile_item_emre.p3d", [6869.36, 7491.13, 3.89755], [0, 1, 0], [0, 0, 1]],
["exile_assets\model\exile_item_emre.p3d", [6869.31, 7491.34, 3.89755], [0, 1, 0], [0, 0, 1]],
["exile_assets\model\exile_item_emre.p3d", [6868.97, 7491.3, 3.89755], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\items\food\can_v3_f.p3d", [6869.35, 7491.5, 3.93856], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\items\food\can_v3_f.p3d", [6869.23, 7491.69, 3.93856], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\items\food\can_rusty_f.p3d", [6868.9, 7491.65, 3.93759], [0, 1, 0], [0, 0, 1]],
["a3\structures_f\items\food\can_rusty_f.p3d", [6869.02, 7491.55, 3.93759], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\cerealsbox_f.p3d", [6869.26, 7491.91, 4.05614], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6868.72, 7492.76, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6868.78, 7492.97, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6868.88, 7492.77, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6868.87, 7492.95, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6868.96, 7492.78, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6868.97, 7492.95, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6869.06, 7492.79, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6869.05, 7492.95, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6869.14, 7492.79, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6869.16, 7492.99, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d", [6869.22, 7492.8, 4.0284], [0, 1, 0], [0, 0, 1]],
["a3\props_f_exp\commercial\market\woodencounter_01_f.p3d", [6869.14, 7492.18, 3.41341], [-0.992401, -0.123047, 0], [0, 0, 1]],
["a3\props_f_exp\commercial\market\woodencounter_01_f.p3d", [6870.41, 7497.2, 3.41341], [-0.460033, 0.887902, 0], [0, 0, 1]],
["cup\wheeledvehicles\cup_wheeledvehicles_ural\cup_ural_repair.p3d", [6908.88, 7447.76, 4.62713], [-0.971604, -0.236612, 0], [0, 0, 1]],
["cup\wheeledvehicles\cup_wheeledvehicles_hmmwv\model\cup_m998a2_sov.p3d", [6894.66, 7466.11, 4.86867], [-0.988632, -0.150355, -4.8778e-006], [0.000613991, -0.00406962, 0.999992]],
["cup\wheeledvehicles\cup_wheeledvehicles_hmmwv\model\cup_m998_crows_mk19.p3d", [6896.62, 7459.27, 5.34879], [-0.985368, -0.17044, 0.000139289], [-4.70377e-006, 0.000844425, 1]]
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
private["_animalbody","_qty","_rawfoodtype","_ehLoc"];
_animalbody = _this select 0;
_qty = _this select 1;
_rawfoodtype =   getText (configFile >> "CfgSurvival" >> "Meat" >> typeOf _animalbody >> "rawfoodtype");

    	_item = createVehicle ["WeaponHolder", position _animalbody, [], 0, "CAN_COLLIDE"];
	for "_x" from 1 to _qty do {
			_item addMagazineCargoGlobal [_rawfoodtype, 1];
		};
    deleteVehicle _animalbody;

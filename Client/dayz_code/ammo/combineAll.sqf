
    #define Break_Display 2551
    #define Combine_Display 2552
    #define b1_list 2501
    #define b2_list 2502
    #define c1_list 2503
    #define c2_list 2504
    disableSerialization;
    
    fnc_inString = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_inString.sqf";
    _cbArray = ["5Rnd_762x51_M24","30Rnd_556x45_Stanag","6Rnd_45ACP","17Rnd_9x19_glock17","WoodenArrow","2Rnd_shotgun_74Slug","2Rnd_shotgun_74Pellets","15Rnd_9x19_M9SD","15Rnd_9x19_M9","9Rnd_45ACP_Mag","7Rnd_45ACP_1911"];
    _cbArray2 = ["20Rnd_762x51_DMR","20Rnd_762x51_FNFAL","7Rnd_45ACP_1911","200Rnd_556x45_M249","30Rnd_9x19_UZI","Quiver","8Rnd_B_Beneli_Pellets","8Rnd_B_Beneli_74Slug","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","64Rnd_9x19_SD_Bizon","16Rnd_9x21_Mag","17Rnd_9x19_glock17","9Rnd_45ACP_Mag","15Rnd_9x19_M9SD","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_StanagSD"];

    _createPile = {
        _mag = _this select 0;
        _amount = _this select 1;
        _input = _this select 2;
        _required = _this select 3;
        if (_amount <= 0) exitWith { cutText ["[SYSTEM] Not enough to combine!","PLAIN DOWN"]; };
        if (player getVariable["combattimeout", 0] >= time) exitWith { cutText ["[SYSTEM] Wait until you are out of combat!","PLAIN DOWN"]; };
        
        player playActionNow "putDown";
        
        for "_x" from 1 to _required do {
            player removeMagazine _input;
            sleep 0.01;
        };
    	_nearBy = nearestObjects [getPosATL player, ["WeaponHolder","WeaponHolderBase"], 2];
        
        if (count _nearBy == 0) then {
    		_pile = createVehicle ["WeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE"];
            _pile addMagazineCargoGlobal [_mag,_amount];
            player reveal _pile;
        } else {
            _pile = _nearBy select 0;
            _pile addMagazineCargoGlobal [_mag,_amount];
            player reveal _pile;
        };
    };
    
    
	_animState = animationState player;
	_busy = ["putDown",_animState] call fnc_inString;
    
    _input = lbData [c1_list, (lbCurSel c1_list)];
    _output = lbData [c2_list, (lbCurSel c2_list)];
    if ((_input in _cbArray) and (_output in _cbArray2) and !(_busy)) then {
        switch (_output) do {
            case "200Rnd_556x45_M249":
            {
                _result = "200Rnd_556x45_M249";
                _required = 6;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "20Rnd_762x51_DMR":
            {
                _result = "20Rnd_762x51_DMR";
                _required = 4;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "20Rnd_762x51_FNFAL":
            {
                _result = "20Rnd_762x51_FNFAL";
                _required = 4;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "7Rnd_45ACP_1911":
            {
                _result = "7Rnd_45ACP_1911";
                _required = 1;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "30Rnd_9x19_UZI":
            {
                _result = "30Rnd_9x19_UZI";
                _required = 2;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "30Rnd_9x19_MP5":
            {
                _result = "30Rnd_9x19_MP5";
                _required = 2;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "64Rnd_9x19_SD_Bizon":
            {
                _result = "64Rnd_9x19_SD_Bizon";
                _required = 4;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "17Rnd_9x19_glock17":
            {
                _result = "17Rnd_9x19_glock17";
                _required = 1;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "15Rnd_9x19_M9SD":
            {
                _result = "15Rnd_9x19_M9SD";
                _required = 1;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "16Rnd_9x21_Mag":
            {
                _result = "16Rnd_9x21_Mag";
                _required = 2;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "9Rnd_45ACP_Mag":
            {
                _result = "9Rnd_45ACP_Mag";
                _required = 1;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "8Rnd_B_Beneli_Pellets":
            {
                _result = "8Rnd_B_Beneli_Pellets";
                _required = 4;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "8Rnd_B_Beneli_74Slug":
            {
                _result = "8Rnd_B_Beneli_74Slug";
                _required = 4;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
            case "Quiver":
            {
                _result = "Quiver";
                _required = 6;
                _amount = 1;
                
                _count = ({_x == _input} count ((vestItems player) + (backpackItems player)));
                if ((_count % _required) == 0) then {
                    _amount = (_count / _required);
                } else {
                    _amount =  floor (_count / _required);
                };
                _required = _required * _amount;
                [_result, _amount, _input, _required] call _createPile;
            };
        };
    };
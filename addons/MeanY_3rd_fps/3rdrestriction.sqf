		while {TRUE} do 
	{
				waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};
			if (((vehicle player) == player) && (currentWeapon player != '')) then 
		{
			player switchCamera "INTERNAL";			 
		};		
		sleep 0.5;	
	};

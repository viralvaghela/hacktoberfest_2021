var i=0,j=0;
var EOP;
function checkCornur(){
	switch(i){
		case 0:{
			if(sectionSpace[0] == 0){
				IsCornurEmpty = true;
				return IsCornurEmpty;
			}
			else{
				i++;
				IsCornurEmpty = false;
				checkCornur();
			}
		}
		case 1:{
			if(sectionSpace[2] == 0){
				IsCornurEmpty = true;
				return IsCornurEmpty;
			}
			else{
				i++;
				IsCornurEmpty = false;
				checkCornur();
			}
		}
		case 2:{
			if(sectionSpace[6] == 0){
				IsCornurEmpty = true;
				return IsCornurEmpty;
			}
			else{
				i++;
				IsCornurEmpty = false;
				checkCornur();
			}
		}
		case 3:{
			if(sectionSpace[8] == 0){
				IsCornurEmpty = true;
				return IsCornurEmpty;
			}
			else{
				i++;
				IsCornurEmpty = false;
				checkCornur();
			}
		}
	}	
}
function checkSides(){
	switch(j){
		case 0:{
			if(sectionSpace[0] == 0){
				IsSideEmpty = true;
				return IsSideEmpty;
			}
			else{
				j++;
				IsSideEmpty = false;
				checkSides();
			}
		}
		case 1:{
			if(sectionSpace[2] == 0){
				IsSideEmpty = true;
				return IsSideEmpty;
			}
			else{
				j++;
				IsSideEmpty = false;
				checkSides();
			}
		}
		case 2:{
			if(sectionSpace[6] == 0){
				IsSideEmpty = true;
				return IsSideEmpty;
			}
			else{
				j++;
				IsSideEmpty = false;
				checkSides();
			}
		}
		case 3:{
			if(sectionSpace[8] == 0){
				IsSideEmpty = true;
				return IsSideEmpty;
			}
			else{
				j++;
				IsSideEmpty = false;
				checkSides();
			}
		}
	}
}
function checkCentur(){
	if(sectionSpace[4] == 0){
		IsCenterEmpty = true;
		addCircle(4);
		return IsCenterEmpty;
	}
	else{
		IsCenterEmpty = false;
		return IsCenterEmpty;
	}
}

function checkUserPrb(){
	var filled = [
		0,0,0,0,0,0,0,0,0
	];
	var lopp=0,filledCount=0;
	//check which are filled with cross
	while(lopp <= 8){
		if(sectionSpaceString[lopp] == "cross"){
			filled[lopp] = sectionSpace[lopp];
			lopp++;
			filledCount++;
		} 
		else{
			lopp++;
		}
	}

	cornerize();
	function cornerize(){	
		if(filledCount == 1 && IsCornurEmpty){
			switch(corner){
				case 0:{
					if(sectionSpace[0] == 0){
						addCircle(0);
					}
					else{
						randomise();
						cornerize();
					}
					break;
				}
				case 1:{
					if(sectionSpace[2] == 0){
						addCircle(2);
					}
					else{
						randomise();
						cornerize();
					}
					break;
				}
				case 2:{
					if(sectionSpace[6] == 0){
						addCircle(6);
					}
					else{
						randomise();
						cornerize();
					}
					break;
				}
				case 3:{
					if(sectionSpace[8] == 0){
						addCircle(8);
					}
					else{
						randomise
						cornerize();
					}
					break;
				}
			}
		}

		if(filledCount > 1){
			//check for possibility 
			dimaag();
			EOPcall();
		}
	}
	function EOPcall(){
		if(EOP == true){
			checkCornur();
			checkSides();
			checkCentur();

			if(IsSideEmpty == true){
				addCircle(j);
			}
			if(IsCornurEmpty == true){
				addCircle(i);
			}
			if(IsCenterEmpty == true){
				addCircle(4);
			}
		}
	}
}

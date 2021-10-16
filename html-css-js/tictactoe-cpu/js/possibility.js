function dimaag(){
	var applied = false;
	//check diagonal

	//check for own
	if(sectionSpaceString[0] == "empty"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[8] == "circle"){
				addCircle(0);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "empty"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[8] == "cross"){
				addCircle(0);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[0] == "circle"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[8] == "circle"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "cross"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[8] == "cross"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[0] == "circle"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[8] == "empty"){
				addCircle(8);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "cross"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[8] == "empty"){
				addCircle(8);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[2] == "circle"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[6] == "circle"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[2] == "cross"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[6] == "cross"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[2] == "circle"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[6] == "empty"){
				addCircle(6);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[2] == "cross"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[6] == "empty"){
				addCircle(6);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[2] == "empty"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[6] == "circle"){
				addCircle(2);
				applied = true;
				EOP = false;
			}
		}
		
	}
	//block user
	if(sectionSpaceString[2] == "empty"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[6] == "cross"){
				addCircle(2);
				applied = true;
				EOP = false;
			}
		}
	}



	//check for horizontal
	//check for own
	if(sectionSpaceString[0] == "circle"){
		if(sectionSpaceString[1] == "circle"){
			if(sectionSpaceString[2] == "empty"){
				addCircle(2);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "cross"){
		if(sectionSpaceString[1] == "cross"){
			if(sectionSpaceString[2] == "empty"){
				addCircle(2);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[0] == "circle"){
		if(sectionSpaceString[1] == "empty"){
			if(sectionSpaceString[2] == "circle"){
				addCircle(1);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "cross"){
		if(sectionSpaceString[1] == "empty"){
			if(sectionSpaceString[2] == "cross"){
				addCircle(1);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[0] == "empty"){
		if(sectionSpaceString[1] == "circle"){
			if(sectionSpaceString[2] == "circle"){
				addCircle(0);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "empty"){
		if(sectionSpaceString[1] == "cross"){
			if(sectionSpaceString[2] == "cross"){
				addCircle(0);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[3] == "circle"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[5] == "empty"){
				addCircle(5);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[3] == "cross"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[5] == "empty"){
				addCircle(5);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[3] == "circle"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[5] == "circle"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[3] == "cross"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[5] == "cross"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[3] == "empty"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[5] == "circle"){
				addCircle(3);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[3] == "empty"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[5] == "cross"){
				addCircle(3);
				applied = true;
				EOP = false;
			}
		}
	}
	 

	//check for own
	if(sectionSpaceString[6] == "circle"){
		if(sectionSpaceString[7] == "circle"){
			if(sectionSpaceString[8] == "empty"){
				addCircle(8);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[6] == "cross"){
		if(sectionSpaceString[7] == "cross"){
			if(sectionSpaceString[8] == "empty"){
				addCircle(8);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[6] == "circle"){
		if(sectionSpaceString[7] == "empty"){
			if(sectionSpaceString[8] == "circle"){
				addCircle(7);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[6] == "cross"){
		if(sectionSpaceString[7] == "empty"){
			if(sectionSpaceString[8] == "cross"){
				addCircle(7);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[6] == "empty"){
		if(sectionSpaceString[7] == "circle"){
			if(sectionSpaceString[8] == "circle"){
				addCircle(6);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[6] == "empty"){
		if(sectionSpaceString[7] == "cross"){
			if(sectionSpaceString[8] == "cross"){
				addCircle(6);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for vertical
	//check for own
	if(sectionSpaceString[0] == "circle"){
		if(sectionSpaceString[3] == "circle"){
			if(sectionSpaceString[6] == "empty"){
				addCircle(6);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "cross"){
		if(sectionSpaceString[3] == "cross"){
			if(sectionSpaceString[6] == "empty"){
				addCircle(6);
				applied = true;
				EOP = false;
			}
		}
	}
	



	//check for own
	if(sectionSpaceString[0] == "circle"){
		if(sectionSpaceString[3] == "empty"){
			if(sectionSpaceString[6] == "circle"){
				addCircle(3);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "cross"){
		if(sectionSpaceString[3] == "empty"){
			if(sectionSpaceString[6] == "cross"){
				addCircle(3);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[0] == "empty"){
		if(sectionSpaceString[3] == "circle"){
			if(sectionSpaceString[6] == "circle"){
				addCircle(0);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[0] == "empty"){
		if(sectionSpaceString[3] == "cross"){
			if(sectionSpaceString[6] == "cross"){
				addCircle(0);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[1] == "circle"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[7] == "empty"){
				addCircle(7);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[1] == "cross"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[7] == "empty"){
				addCircle(7);
				applied = true;
				EOP = false;
			}
		}
	}
	


	//check for own
	if(sectionSpaceString[1] == "circle"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[7] == "circle"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[1] == "cross"){
		if(sectionSpaceString[4] == "empty"){
			if(sectionSpaceString[7] == "cross"){
				addCircle(4);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[1] == "empty"){
		if(sectionSpaceString[4] == "circle"){
			if(sectionSpaceString[7] == "circle"){
				addCircle(1);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[1] == "empty"){
		if(sectionSpaceString[4] == "cross"){
			if(sectionSpaceString[7] == "cross"){
				addCircle(1);
				applied = true;
				EOP = false;
			}
		}
	}
	 

	//check for own
	if(sectionSpaceString[2] == "circle"){
		if(sectionSpaceString[5] == "circle"){
			if(sectionSpaceString[8] == "empty"){
				addCircle(8);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[2] == "cross"){
		if(sectionSpaceString[5] == "cross"){
			if(sectionSpaceString[8] == "empty"){
				addCircle(8);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[2] == "circle"){
		if(sectionSpaceString[5] == "empty"){
			if(sectionSpaceString[8] == "circle"){
				addCircle(5);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[2] == "cross"){
		if(sectionSpaceString[5] == "empty"){
			if(sectionSpaceString[8] == "cross"){
				addCircle(5);
				applied = true;
				EOP = false;
			}
		}
	}
	

	//check for own
	if(sectionSpaceString[2] == "empty"){
		if(sectionSpaceString[5] == "circle"){
			if(sectionSpaceString[8] == "circle"){
				addCircle(2);
				applied = true;
				EOP = false;
			}
		}
	}
	//block user
	if(sectionSpaceString[2] == "empty"){
		if(sectionSpaceString[5] == "cross"){
			if(sectionSpaceString[8] == "cross"){
				addCircle(2);
				applied = true;
				EOP = false;
			}
		}
	}
	

	if(applied == false){
		console.log("reached EOP");
		EOP = true;
	}
}
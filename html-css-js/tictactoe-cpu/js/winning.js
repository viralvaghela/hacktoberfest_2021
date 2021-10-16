//condition checking AI
let btns = document.querySelectorAll('button')
btns = Array.from(btns)
function highlightBtns(btnIDXs){
	btnIDXs.map(idx => btns[idx].style.backgroundColor = 'orange')
}
		function checkHorizontalCross()
		{
			//for user 
			if(sectionSpace[0] == 1 && sectionSpaceString[0] == "cross"){
				if(sectionSpace[1] == 1 && sectionSpaceString[1] == "cross"){
					if(sectionSpace[2] == 1 && sectionSpaceString[2] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([0,1,2])
					}
				}
			}

			if(sectionSpace[3] == 1 && sectionSpaceString[3] == "cross"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "cross"){
					if(sectionSpace[5] == 1 && sectionSpaceString[5] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([3,4,5])
					}
				}
			}

			if(sectionSpace[6] == 1 && sectionSpaceString[6] == "cross"){
				if(sectionSpace[7] == 1 && sectionSpaceString[7] == "cross"){
					if(sectionSpace[8] == 1 && sectionSpaceString[8] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([6,7,8])
					}
				}
			}

		}
			//for cpu
		function checkHorizontalCircle(){
			if(sectionSpace[0] == 1 && sectionSpaceString[0] == "circle"){
				if(sectionSpace[1] == 1 && sectionSpaceString[1] == "circle"){
					if(sectionSpace[2] == 1 && sectionSpaceString[2] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([0,1,2])
					}
				}
			}

			if(sectionSpace[3] == 1 && sectionSpaceString[3] == "circle"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "circle"){
					if(sectionSpace[5] == 1 && sectionSpaceString[5] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([3,4,5])
					}
				}
			}

			if(sectionSpace[6] == 1 && sectionSpaceString[6] == "circle"){
				if(sectionSpace[7] == 1 && sectionSpaceString[7] == "circle"){
					if(sectionSpace[8] == 1 && sectionSpaceString[8] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([6,7,8])
					}
				}
			}
		}
		 // for user
		function checkVerticalCross(){
			if(sectionSpace[0] == 1 && sectionSpaceString[0] == "cross"){
				if(sectionSpace[3] == 1 && sectionSpaceString[3] == "cross"){
					if(sectionSpace[6] == 1 && sectionSpaceString[6] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([0,3,6])
					}
				}
			}

			if(sectionSpace[1] == 1 && sectionSpaceString[1] == "cross"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "cross"){
					if(sectionSpace[7] == 1 && sectionSpaceString[7] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([1,4,7])
					}
				}
			}

			if(sectionSpace[2] == 1 && sectionSpaceString[2] == "cross"){
				if(sectionSpace[5] == 1 && sectionSpaceString[5] == "cross"){
					if(sectionSpace[8] == 1 && sectionSpaceString[8] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([2,5,8])
					}
				}
			}
		}
		 //for cpu
		 function checkVerticalCircle(){
			if(sectionSpace[0] == 1 && sectionSpaceString[0] == "circle"){
				if(sectionSpace[3] == 1 && sectionSpaceString[3] == "circle"){
					if(sectionSpace[6] == 1 && sectionSpaceString[6] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([0,3,6])
					}
				}
			}

			if(sectionSpace[1] == 1 && sectionSpaceString[1] == "circle"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "circle"){
					if(sectionSpace[7] == 1 && sectionSpaceString[7] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([1,4,7])
					}
				}
			}

			if(sectionSpace[2] == 1 && sectionSpaceString[2] == "circle"){
				if(sectionSpace[5] == 1 && sectionSpaceString[5] == "circle"){
					if(sectionSpace[8] == 1 && sectionSpaceString[8] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([2,5,8])
					}
				}
			}
		}
		// for user
		function checkDiagCross(){
			if(sectionSpace[0] == 1 && sectionSpaceString[0] == "cross"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "cross"){
					if(sectionSpace[8] == 1 && sectionSpaceString[8] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([0,4,8])
					}
				}
			}

			if(sectionSpace[2] == 1 && sectionSpaceString[2] == "cross"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "cross"){
					if(sectionSpace[6] == 1 && sectionSpaceString[6] == "cross"){
						document.getElementById('results').innerHTML = "You won!";
						highlightBtns([2,4,6])
					}
				}
			}

		}
		// for cpu
		function checkDiagCircle(){
			if(sectionSpace[0] == 1 && sectionSpaceString[0] == "circle"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "circle"){
					if(sectionSpace[8] == 1 && sectionSpaceString[8] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([0,4,8])
					}
				}
			}

			if(sectionSpace[2] == 1 && sectionSpaceString[2] == "circle"){
				if(sectionSpace[4] == 1 && sectionSpaceString[4] == "circle"){
					if(sectionSpace[6] == 1 && sectionSpaceString[6] == "circle"){
						document.getElementById('results').innerHTML = "You Lost!";
						highlightBtns([2,4,6])
					}
				}
			}
		}
		function checkDraw(){
			if(sectionSpace[0] == 1){
				if(sectionSpace[1] == 1){
					if(sectionSpace[2] == 1){
						if(sectionSpace[3] == 1){
							if(sectionSpace[4] == 1){
								if(sectionSpace[5] == 1){
									if(sectionSpace[6] == 1){
										if(sectionSpace[7] == 1){
											if(sectionSpace[8] == 1){
												document.getElementById('results').innerHTML = "Its a Tie!";
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		
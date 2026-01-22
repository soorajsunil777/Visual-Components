PROGRAM PLC_PRG
VAR
	S10: BOOL; // Main Section Part In Stopper
	S11: BOOL; // Main Section Part After Stopper
	S6: BOOL; // Branch Part In Stopper
	S7: BOOL; // Branch Part After Stopper
	S8: BOOL; //LTU Part Middle Signal
	Y5: BOOL; // Main section Stop gate release part signal 
	Y4: BOOL; // Branch  Stop gate release part signal 
	Y3_1: BOOL; // LTU Lift Up Y3.1
	Y3_2: BOOL; // LTU Lift Down Y3.2
	Y2Inverted: BOOL; // LTU Lift Up Y2 inverted
	powerOnBelt: BOOL; // Transverse belt 
	powerOnRolls: BOOL; // Straight belt
	beltDirection: BOOL; //FALSE: Left, TRUE: Right
	initFlag: BOOL;
	step: INT;
	P10: BOOL; // TRUE: Straight priority, FALSE: Branch priority
	StraightPriority : BOOL; // From Simulation
	tonDelay: TON;
END_VAR

IF initFlag = FALSE THEN  //Initialization
	initFlag:= TRUE;
	step := 1;
	
END_IF

IF StraightPriority = TRUE THEN
	P10 := TRUE;
ELSE
	P10 := FALSE;
END_IF

CASE step OF
    1: 
		Y3_1 := FALSE;
		Y3_2 := FALSE;
		powerOnBelt := FALSE;
		tonDelay(IN := FALSE); // Reset timer
		IF S10 = TRUE AND S6 = TRUE THEN
   			 // Both sections have parts – use priority
   			 IF P10 = TRUE THEN
       			 step := 2; // Straight (Main) Priority
   			 ELSE
       			 step := 3; // Branch Priority
   		 	 END_IF
		ELSIF S10 = TRUE THEN
   			 // Only main section has part
  			  step := 2;
		ELSIF S6 = TRUE THEN
   		 // Only branch section has part
   			 step := 3;
		END_IF
		
    2:  //Main Section
		IF S11 = FALSE AND S10 = TRUE THEN
			step := 4;
		END_IF	
		
	3:	// Branch section
		IF S7 = FALSE AND S6 = TRUE THEN
			step := 8;
		END_IF
	
	4:	// Straight Route
		Y5 := TRUE;  // Main Section SG Open
	    //P10 := FALSE; // Reset Priority to Branch
		Y3_2 := TRUE; // Lift Down
		step := 5;
	
	5:	IF S11 = TRUE  THEN // Part after Main section SG
			Y5 := FALSE; // Close Main section SG
			step := 6;
		END_IF
	
	6:	IF S8 = TRUE  THEN // Part at Lift middle
			step := 7;
		END_IF
		
	7:	IF S8 = FALSE  THEN // Part left Lift Middle
			Y3_2 := FALSE; // Move lift to Middle
			step := 1;
		END_IF
		
	8:	// Branch Route
		Y3_1 := TRUE; // Lift Up
		Y4 := TRUE;  // Branch Section SG Open
		//P10 := FALSE; // Reset Priority to Main
		step := 9;
	
	9:	IF S7 = TRUE  THEN // Part after Branch section SG
			Y4 := FALSE; // Close Branch section SG
			powerOnBelt := TRUE;
			step := 10;
		END_IF
	
	10:	IF S8 = TRUE  THEN // Part at Lift middle
			Y3_1 := FALSE;
			Y3_2 := TRUE; // Move Lift Down
			step := 11;
		END_IF
	
	11:	IF S8 = FALSE  THEN // Part left Lift Middle
			Y3_2 := FALSE; // Move lift to Middle
			step := 1;
		END_IF
		
END_CASE
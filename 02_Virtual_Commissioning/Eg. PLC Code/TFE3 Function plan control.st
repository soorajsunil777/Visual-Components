PROGRAM PLC_PRG
VAR
	S1: BOOL; // Part In Stopper
	S2: BOOL; // Part After Stopper
	S3: BOOL; //LTU Part Middle Signal
	S5: BOOL; //LTU Part Exit Left Signal
	Y1: BOOL; // Stop gate release part signal Y1
	Y2_1: BOOL; // LTU Lift Up Y2.1
	Y2_2: BOOL; // LTU Lift Down Y2.2
	Y2Inverted: BOOL; // LTU Lift Up Y2 inverted
	liftDown: BOOL; // LTU Lift down
	powerOnBelt: BOOL; // Transverse belt 
	powerOnRolls: BOOL; // Straight belt
	beltDirection: BOOL; //FALSE: Left, TRUE: Right
	initFlag: BOOL;
	step: INT;
	A1: BOOL; // TRUE: Straight priority, FALSE: Branch priority
	StraightPriority : BOOL; // From Simulation
	tonDelay: TON;
END_VAR

IF initFlag = FALSE THEN  //Initialization
	initFlag:= TRUE;
	step := 1;
	
END_IF

IF StraightPriority = TRUE THEN
	A1 := TRUE;
ELSE
	A1 := FALSE;
END_IF

CASE step OF
    1: 
		Y2_1 := FALSE;
		Y2_2 := FALSE;
		powerOnBelt := FALSE;
		tonDelay(IN := FALSE); // Reset timer
		//powerOnRolls := FALSE;
		IF S1 = TRUE AND S2 = FALSE AND S3 = FALSE AND S5 = FALSE THEN
			step := 2;
		END_IF	
    2: 
		Y1 := TRUE; //Stop gate is opened
		IF S2 = TRUE THEN
			step := 3;
		END_IF	
		
	3:	Y1 := FALSE; // Stop gate is closed
		IF A1 = TRUE THEN
			step := 4; // Straight route
		ELSE
			step := 7; // Branch Route
		END_IF
	
	4:	IF A1 = TRUE AND S3 = FALSE AND S2 =FALSE  THEN // Straight route
			step := 5;
		END_IF	
		
		
	5:	IF S3 = TRUE  THEN
			tonDelay(IN:=TRUE,PT:=T#50ms);
			IF tonDelay.Q THEN
				Y2_2 := TRUE;
				step:= 6;
			END_IF
		END_IF
		
		
	6:	
		IF S3 = FALSE  THEN 
			//powerOnRolls := FALSE;
			step := 1;
		END_IF
		
	7:	//powerOnRolls := TRUE; // Branch Route
		IF S3 = TRUE THEN
			powerOnRolls := FALSE;
			step := 8;
		END_IF
		
	8:	Y2_1 := TRUE; // Lift Up
		powerOnBelt := TRUE; // Route Left
		IF S5 = TRUE THEN
			step := 1;
		END_IF
		
END_CASE
PROGRAM PLC_PRG
VAR
	S1: BOOL; // Part In Stopper
	S2: BOOL; // Part After Stopper
	S3: BOOL; //LTU Part Middle Signal
	S5: BOOL; //LTU Part Exit Left Signal
	Y1: BOOL; // Stop gate release part signal Y1
	Y2: BOOL; // LTU Lift Up Y2
	liftDown: BOOL; // LTU Lift down
	powerOnBelt: BOOL; // Transverse belt 
	powerOnRolls: BOOL; // Straight belt
	beltDirection: BOOL; //FALSE: Left, TRUE: Right
	initFlag: BOOL;
	step: INT;
END_VAR


IF initFlag = FALSE THEN  //Initialization
	initFlag:= TRUE;
	step := 1;
END_IF

CASE step OF
    1: 
		Y2 := FALSE;
		powerOnBelt := FALSE;
		powerOnRolls := FALSE;
		IF S1 = TRUE AND S2 = FALSE AND S3 = FALSE AND S5 = FALSE THEN
			step := 2;
		END_IF	
    2: 
		Y1 := TRUE; //Stop gate is opened
		IF S2 = TRUE THEN
			step := 3;
		END_IF	
		
	3:	Y1 := FALSE; // Stop gate is closed
		step := 4;
		
	4:	powerOnRolls := TRUE; // Part in the middle of LTU
		IF S3 = TRUE THEN
			powerOnRolls := FALSE;
			step := 5;
		END_IF
		
	5:	Y2 := TRUE; // Routing to LEFT
		powerOnBelt := TRUE;
		IF S5 = TRUE THEN
			step := 1;
		END_IF
		
END_CASE

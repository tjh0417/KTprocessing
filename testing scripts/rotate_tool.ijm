
//TOOL TO QUICKLY ROTATE SPINDLE 
//uses the angle tool to draw the axis of KT movement and connect to the horizontal
//will then just rotate the entire stack

setTool("angle");
waitForUser("Make angle selection");
run("Measure");
variable= getResultString ("Angle")
run("Rotate... ", "angle=variable grid=0 interpolation=Bilinear stack");



//trackmate use mean Z of all detectable Z stacks to align with the center of Z stacks of extract track stacks 3D 


dir1_inputtwochannel = getDirectory("Choose a cell ");
folderslisttwochannel = getFileList(dir1_inputtwochannel);

for (nn = 0; nn < folderslisttwochannel.length; nn++) {
	print("nn");
	print(nn);
	print(folderslisttwochannel[nn]);
		if(endsWith(folderslisttwochannel[nn], "/")){
dir1_inputallalot = dir1_inputtwochannel + folderslisttwochannel[nn];					
folderslistalot = getFileList(dir1_inputallalot);
	print(folderslisttwochannel[nn]);


//for (m = 0; m < folderslistalot.length; m++) {
for (m = 0; m < folderslistalot.length; m++) {
	if(endsWith(folderslistalot[m], "/")){
	print(folderslistalot[m]);
dir1_inputallx2 =  dir1_inputallalot + folderslistalot[m];
//print(dir1_inputallx2);
//
//print(dir1_inputallx2);
//

folderslistx2 = getFileList(dir1_inputallx2);

////
//for (jqk = 0; jqk < 50; jqk++) {
//print(folderslistx2[jqk]);
//};		
////
//print(dir1_inputallx2);


movieslist = getFileList(dir1_inputallalot);


//for (jqk = 0; jqk < 25; jqk++) {
//print(movieslist[jqk]);
//};		


for (ii = 0; ii < folderslistx2.length; ii++) {
print(folderslistx2[ii]);	
	
	if(endsWith(folderslistx2[ii], "/")){  

folderktname = folderslistx2[ii];
ktindex = folderktname.substring(0, lengthOf(folderktname)-1);
print("ktindex");
print(ktindex);

for (jj = 0; jj < movieslist.length; jj++) {
	
	if(endsWith(movieslist[jj], "_" + ktindex + ".tif")){  

print("_" + ktindex +".tif");





inputdir = dir1_inputallx2;
outputdir = inputdir + File.separator + ktindex + File.separator;

print(inputdir);
print("outputdir");
print(outputdir);

//print(movieslist[ii]);



//

//for (ii = 0; ii < movieslist.length; ii++) {
////	print(movieslist[ii]);
//	if(endsWith(movieslist[ii], "tif")){

moviepath = dir1_inputallalot + movieslist[jj];

print(moviepath);

File.makeDirectory(outputdir);
//File.makeDirectory(outputdir+"/(allZ)");
File.makeDirectory(outputdir+"/(+-1)");

open(moviepath);




originalimagename = getTitle();
getDimensions(width, height, channels, slices, frames);
fl=Math.floor((slices)/2);
ce= Math.ceil((slices+1+1)/2);


run("Duplicate...", "duplicate slices=fl-ce"); // cut center slides +-1
imagename1 = getTitle();

print("imagename1");
print(imagename1);

save(outputdir+File.separator+"(+-1).tif");

print("output");
print(outputdir+File.separator+"(+-1).tif");


run("Z Project...", "projection=[Sum Slices] all");



//

// First, replace all occurrences of "a" with ".".
interimString = replace(movieslist[jj], "_", ".");
// Then, split the interim string by ".".

print(interimString);

outputArray =  split(interimString, "[.-/]");

print(outputArray[1]);
angleindex = outputArray[2];
print(outputArray[2]);
//






anglepath = inputdir + "kkAngle" + angleindex + "..csv" ;



inputpath = anglepath;

print(anglepath);


angledata = Table.open(inputpath);
getDimensions(x, y, channels, slices, frames);



nR=Table.size;

				
for (r=1; r<nR+1; r=r+1) { 

	rotatedegree = Table.get("C1", r-1);

	imagename = getTitle();

	
	run("Duplicate...", "duplicate range=" + r + "-" + r);
	
	
	
	
	
	run("Rotate... ", "angle=rotatedegree grid=0 interpolation=Bilinear stack");
	
	
	
	saveAs("Tiff", outputdir+"/(+-1)/"+ imagename+"_"+r); // save the croped moives (tiffs)
	
////
//print(imagename);
////
	
	
	close();
	
	
print("imagename");
print(imagename);
close("SUM_" + imagename + "-1.tif");


}

selectWindow(originalimagename);





close(imagename1);

close("kkAngle" + angleindex + "..csv");

close("(+-1).tif");

close(movieslist[jj]);


close(imagename1 + "-1.tif");
close("SUM_" + imagename1 + "-1.tif");
close("SUM_" + imagename1);
print("SUM_" + imagename1);






	}}




////
//print(moviepath);
////
	

}




////+-2 z stacks of center
//selectWindow(originalimagename);
//getDimensions(width, height, channels, slices, frames);
//fl2=Math.floor(slices/2)-1;
//ce2= Math.ceil(slices/2)+1;
//run("Duplicate...", "duplicate slices=fl2-ce2"); // cut center slides +-2
//imagename2 = getTitle();
//
//save(outputdir+File.separator+"(+-2).tif");
//
//imagename21 = getTitle();
//
//run("Z Project...", "projection=[Sum Slices] all");
//
//imagename22 = getTitle();
//
//getDimensions(x, y, channels, slices, frames);
//
//
//
//nR=Table.size;
//
//				
//for (r=1; r<nR+1; r=r+1) { 
//
//	rotatedegree = Table.get("C1", r-1);
//
//	imagename = getTitle();
//
//	
//	run("Duplicate...", "duplicate range=" + r + "-" + r);
//	
//	
//	run("Rotate... ", "angle=rotatedegree grid=0 interpolation=Bilinear stack");
//	
//	
//	
//	saveAs("Tiff", outputdir+"/(+-2)/" + imagename+"_"+r); // save the croped moives (tiffs), named by frame number to keep track of order
//	
//	
//	close(imagename+"_"+ r +".tif");
//
//}
//close();
//selectWindow(imagename2);
//close(imagename2);
//close(imagename21);
//close(imagename22);
//close(outputdir+File.separator+"(+-2).tif");


//all z stacks

//selectWindow(originalimagename);
//getDimensions(width, height, channels, slices, frames);
//
//
//run("Z Project...", "projection=[Sum Slices] all");
//
//save(inputdir+File.separator+"Zsum.tif");
//
//getDimensions(x, y, channels, slices, frames);
//
//
//
//nR=Table.size;
//
//				
//for (r=1; r<nR+1; r=r+1) { 
//
//	rotatedegree = Table.get("C1", r-1);
//
//	imagename = getTitle();
//
//	
//	run("Duplicate...", "duplicate range=" + r + "-" + r);
//	
//	
//	
//	run("Rotate... ", "angle=rotatedegree grid=0 interpolation=Bilinear stack");
//	
//	
//	
//	saveAs("Tiff", outputdir+"/(allZ)/"+ imagename+"_"+r); // save the croped moives (tiffs)
//	
//	
//	close();
//
//}

//selectWindow(originalimagename);





//close(imagename1);
//
//close("kkAngle" + angleindex + "..csv");
//
//close("(+-1).tif");
//
//close(movieslist[ii]);

}

}

}}

}

	


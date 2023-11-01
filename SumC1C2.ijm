title = getTitle();

// Split the channels into separate images
run("Split Channels");

// Image names will be title + "-1", title + "-2", title + "-3"
// for a typical RGB image. Adjust these names as needed for your specific image.

// Define the two channels you want to sum
image1 = "C1-" + title;
image2 = "C2-" + title;

imageCalculator("Add create stack", image1,image2);


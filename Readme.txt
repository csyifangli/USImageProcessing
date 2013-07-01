Folders:

D:\Ultrasound_Images\MATLAB\
a) 20130523 NOT USED
	a.1) maximums.m: Script. Obtain an UNIQUE grid with the position of the features which correlates most. It computes the mean previously to obtain the position, and then, by undoing the mean, gets the different features.
	
	a.2) newgrid.m: Function. Creates a grid for HALCON with the maximums obtained in maximums.m.
		Input: 	defaultRow: 	X-positions in the analysis in Halcon
				defaultColumn: 	Y-positions in the analysis in Halcon
				grid_length:	distance between points
				numberPoints: 	of the small grid obtained.
		Output: stringrow: 		String with the position of the new rows.
				stringcolumn: 	String with the position of the new columns.
				
				
				
b) 20130524	ANALYSIS OF APPROACH 1 & EXPERIMENT 1(Change in grid_length and radius_circle)
	b.1) createDataCell0524.m: Script. Analysis of different grid_length&circle_radius in different subjects. Create the cell and analyzes the data (plotting)
	
	b.2) getNewFeat.m: Function. Creates a features.mat file with the features obtained in obtainMaximum.m, undoing the mean.
		Input:	dataset: 	Data of the subject
				maximum:	vector with the most correlated points.
				exp:		number of the experiment in the subject (1 or 2)
		Output:	newFeat: 	features.mat file for the training.
		
	b.3) obtainMaximum.m: Function. Obtain an UNIQUE grid with the position of the features which correlates most. It computes the mean previously to obtain the position. Removes the duplicate maximum (in an unique grid, they are overlapped)
		Input: 	dataset:	Data of the subject
				n:			Number of maximums to be obtained
				exp:		number of the experiment in the subject (1 or 2)
		Output:	maximumWDup:	Position of the maximums after removing the duplicates.
				vectorRow:		X-positions of the maximums
				vectorColumn:	Y-positions of the maximums
				finalRow:		String with the position of the new rows.
				finalColumn:	String with the position of the new columns.
				
	b.4) test0524.m: Function. Training to obtain the nmse of the stimulus and force. Tuned for loading a bunch of features obtained in falcon, compute the nmse and store it in a nmseanalysis{subject}.mat file
	
	b.5) nmseanalysis0527caophan2.mat: Analysis of caophan2 dataset
	
	b.6) nmseanalysis0527max2.mat: Analysis of max2 dataset
	
	b.7) nmseanalysis0527rashida.mat: Analysis of rashida dataset
	
	b.8) nmsecaophan2.fig: Figure generated with MATLAB plotting the nmse for different grid_lengths and radius_circles in caophan2 dataset
	
	b.9) nmsemax2.fig: Figure generated with MATLAB plotting the nmse for different grid_lengths and radius_circles in max2 dataset
	
	b.10) nmserashida.fig: Figure generated with MATLAB plotting the nmse for different grid_lengths and radius_circles in rashida dataset
	
	
	
c) 20130527 ANALYSIS OF APPROACH 2
	c.1) getNewFeat.m: Function. Creates a features.mat file with the features obtained in obtainMaximum.m.
		Input:	dataset: 	Data of the subject
				maximum:	vector with the most correlated points.
				exp:		number of the experiment in the subject (1 or 2)
		Output:	newFeat: 	features.mat file for the training.
		
	c.2) obtainMaximum.m: Function. Obtain an UNIQUE grid with the position of the features which correlates the most. It does not compute the mean this time, treating each feature separately (faster and more accurate).
		Input: 	dataset:	Data of the subject
				n:			Number of maximums to be obtained
				exp:		number of the experiment in the subject (1 or 2)
		Output:	maximumWDup:	Position of the maximums after removing the duplicates.
				vectorRow:		X-positions of the maximums
				vectorColumn:	Y-positions of the maximums
				finalRow:		String with the position of the new rows.
				finalColumn:	String with the position of the new columns.
				Parameters: 	Number of alpha, beta, gamma.



d) 20130603 ANALYSIS OF APPROACH 3
	d.1) imdisp.m: Function. From MATLAB Central File Exchange. Substitutes imdisp (we don't have Image Processing Toolbox!!)
	
	d.2) obtainMaximum.m: Function. Obtain the position in the grid of the features which correlates most FOR EACH finger.
		Input: 	dataset:		Data of the subject
				n:				number of maximums to be obtained
				exp:			number of the experiment in the subject (1 or 2)
		Output:	maximum:		5xn array with the position of the features for each finger.
	
	d.3) plotMaximums.m: Function. Load the maximums saved and plots it over the first image of the dataset.
		Input: 	dataset:	Directory of the data ob the subject
				exp:		number of the experiment in the subject (1 or 2)
				maximum: 	file maximumsXX.mat where the maximums in the grid are stored
		Output:	points:		points demeaned (not necessary, only for debugging!)
		
	d.4) plotFig.m: Function. Plot all the plots for one finger (in the different subjects) together
		Input:	path:	Folder where the single images of one finger for different experiments are stored.



e) 20130604 ANALYSIS OF APPROACH 3
	e.1) imageSequenceMaximums.m. Function: Plots the maximum correlated points over the sequence of images in the background.
		Input:	dataset:		Data of the subject (improved, parses the complete directory, we have to input only the name of the subject. Good only for this computer though!)
				exp:			number of the experiment in the subject (1 or 2)
				finger:			number of the finger to show (1 is thumb - 5 is little)
				freq:			frequency of the images to be shown
				nrOfMaximums:	number of maximums to be plotted. From 50 to 400.
	
		
	e.2) imdisp.m: Function. From MATLAB Central File Exchange. Substitutes imdisp (we don't have Image Processing Toolbox!!)
	
	
	
f) 20130610 ANALYSIS OF APPROACH 3 
	e.1) videoSequenceMaximums.m. Function: Plots the maximum correlated points over the sequence of images in the background and records an avi.
		Input:	dataset:		Data of the subject (improved, parses the complete directory, we have to input only the name of the subject. Good only for this computer though!)
				exp:			number of the experiment in the subject (1 or 2)
				finger:			number of the finger to show (1 is thumb - 5 is little)
				freq:			frequency of the images to be shown
				nrOfMaximums:	number of maximums to be plotted. From 50 to 400.
				nameVideo:		name of the video to be recorded
	
		
	e.2) imdisp.m: Function. From MATLAB Central File Exchange. Substitutes imdisp (we don't have Image Processing Toolbox!!)
	
	e.3) Max2Exp1Finger4.avi: Video recorded for presentation, from the script videoSequenceMaximums. Correponds to the ring in max2 dataset, experiment1
	
	

g) 20130614 ANALYSIS OF APPROACH 3
	g.1) scriptloadmaximums.m. Script. Calls the obtainMaximum function for all the subjects in the experiments. IMPORTANT: The folder has to be switched to the path where obtainMaximum.m is (since we are not working with adding the complete path)

	
h) 20130618 ANALYSIS OF APPROACH 3 + RADIUS
	h.1) FingerVariation.m. Function: Load the Excel sheet e) and plots different graphs showing the variation in the error for number of features and the method of selecting the features.
		Input:	xlsfile:	Excel file with the information of the NMSE computed with MATLAB
	
	
i) 20130624 ANALYSIS OF APPROACH 3 + RADIUS
	i.1) obtainMaximum.m: Function. Obtain the position in the grid of the features which correlates most FOR EACH finger. Avoids the same features repeated on different fingers
		Input: 	dataset:		Data of the subject
				n:				number of maximums to be obtained
				exp:			number of the experiment in the subject (1 or 2)
		Output:	maximum:		5xn array with the position of the features for each finger.
		
		
h) 20130618 ANALYSIS OF APPROACH 3 + RADIUS
	h.1) FingerVariation.m. Function: Load an Excel sheet and plots different graphs showing the variation in the error for number of features and the method of selecting the features. Valid for the last set of experiments (zeros-nonzeros) and separated fingers.
		Input:	xlsfile:	Excel file with the information of the NMSE computed with MATLAB

	


	
	
	
	
	
	
D:\Ultrasound_Images\EXCEL\
a) 0513-Initial values dataset claudio.xls. NMSE of each finger in a grid which changes the grid_length and the radius_circle. NOT NORMALISED.
b) 0524-Initial values comparing datasets.xls. Mean NMSE for different subjects. NOT NORMALISED.
c) 0604-Analysis of different number of features.xls. NMSE comparison of Approaches 1, 2, 3 for different datasets.
d) 0606-Analysis of different lambdas.xls. NMSE comparison of a dataset for different values of the regularization term.
e) 0611-Analysis different radius selection-noselection. NMSE comparison of a different selected and uniform number of features, used in h.1)
f) 0619-Analysis different radius selection-noselection sepTraining.xls. NMSE comparison of a different selected and uniform number of features, separating each fingers. Analysis of the non-zero region.
g) 0620-Analysis different radius selection-noselection sepTraining zeros.xls. NMSE comparison of a different selected and uniform number of features, separating each fingers. Analysis of the zero region.








D:\Ultrasound_Images\Finger_images\
a) 1-Little: Folder. Contains the single images of the little (1.fig to 8.fig)
b) 2-Ring: Folder. Contains the single images of the ring (1.fig to 8.fig)
c) 3-Middle: Folder. Contains the single images of the middle (1.fig to 8.fig)
d) 4-Index: Folder. Contains the single images of the index (1.fig to 8.fig)
e) 5-Thumb: Folder. Contains the single images of the thumb (1.fig to 8.fig)
f) 1-Little.fig: MATLAB figure of the little in the 8 experiments
g) 2-Ring.fig: MATLAB figure of the ring in the 8 experiments
h) 3-Middle.fig: MATLAB figure of the middle in the 8 experiments
i) 4-Index.fig: MATLAB figure of the index in the 8 experiments
j) 5-Thumb.fig: MATLAB figure of the thumb in the 8 experiments








C:\datasets\{nameDataset}\			INFO OF TXT FILES WITH THE EXPERIMENT RESULTS (AND ANY OTHER POSSIBLE MAT FILE) IS SKIPPED, BECAUSE THEY ARE LOADED BEFORE THE OPERATION
	{nameDataset} = {caophan2, claudio, max2, rashida}
	
a) 1\: Folder. Contains the first experiment on that subject
	a.1) features\: Folder. Contains the features obtained with HALCON. The format is GridXXXCircleYY.txt, where XXX is the number of features and YY is the radius of the circle.
	
	a.2) halcon\: Folder. Contains the HALCON files. The format is openingFilesXXX, where XXX is the number of features.
		a.2.i) names.txt: File with the name of the images to be loaded (needed in HALCON). Created with MATLAB.
		
	a.3) images\: Folder. Contain the images gathered by the framegrabber. Named from 000001.png till the end of the experiment.
	
	a.4) maximums\: Folder. Contain the maximums computed with the highest correlation for each finger. Folders are named either XX, with YY the radius of the circle, or YYsingle, with YY the radius of the circle and excluding features in one finger to the other analysis.

b) 2\: Folder. Contains the second experiment on that subject
	b.1) features\: Folder. Contains the features obtained with HALCON. The format is GridXXXCircleYY.txt, where XXX is the number of features and YY is the radius of the circle.
	
	b.2) halcon\: Folder. Contains the HALCON files. The format is openingFilesXXX, where XXX is the number of features.
		b.2.i) names.txt: File with the name of the images to be loaded (needed in HALCON). Created with MATLAB.
		
	b.3) images\: Folder. Contain the images gathered by the framegrabber. Named from 000001.png to the end of the experiment.
	
	b.4) maximums\: Folder. Contain the maximums computed with the highest correlation for each finger. Folders are named either YY, with YY the radius of the circle, or YYsingle, with YY the radius of the circle and excluding features in one finger to the other analysis.

c) claudio.mat: MAT-file. Contains all the info loaded and saved of both experiments.

d) savedatamat.m: Script. Load all the info of the subject and stores on claudio.mat.

e) test.m: Function. Performs the original NMSE calculation.

f) testV12.m: Function. Load the 543 features features for different radii, and computes the NMSE for every finger. Non-zero analysis

g) testV13.m: Function. Load the 543 features features for different radii, and computes the NMSE for every finger. Zero analysis

h) testV2.m: Function. Computes the NMSE for the individually selected maximums in the global dataset.

i) testV3.m: Function. Computes the NMSE for different values of normalization (parameter "lambda") in the global dataset.

j) testV4.m: Function. Computes the NMSE for different maximums (selected features analysis) obtained at several number of features in the global dataset.

k) testV42.m: Function. Computes the NMSE for different maximums (selected features analysis) obtained at several number of features. Non-zero analysis.

l) testV43.m: Function. Computes the NMSE for different maximums (selected features analysis) obtained at several number of features. Zero analysis.

m) testV5.m: Function. Computes the NMSE for uniform points (uniform features analysis) obtained at several number of features. Global dataset

n) testV52.m: Function. Computes the NMSE for uniform points (uniform features analysis) obtained at several number of features. Zero analysis

o) testV53.m: Function. Computes the NMSE for uniform points (uniform features analysis) obtained at several number of features. Non-zero analysis
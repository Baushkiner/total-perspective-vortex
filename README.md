# Project total-perspective-vortex
This subject aims to create a brain computer interface based on electroencephalographic data (EEG data provided by PhysioNet and MNE) with the help of machine learning algorithms. Using a subject’s EEG reading, you’ll have to infer what he or she is thinking about (imagination) or doing (motion) A or B in a t0 to tn timeframe. In this implementation, A and B are actions of both hands or both feet, respectively.

This project was made as a part of education at School 21 in Moscow (Russian branch of French Ecole 42 and American 42 Silicon Valley)

# Requirements
The jupyter notebook use python 3.8 and the following package (matplotlib, seaborn, mne, sklearn, numpy, notebook, PyQt5).

In order to install required version of it use this command:
#### pip install -U -r requirements.txt

# What does the project do?

### Preprocessing, parsing and formating
Any number of subjects can be loaded. But use only runs = [5, 6, 9, 10, 13, 14]. Included ch_names standardization.
### Example of Filter and ICA
I have done filtering the data with range (5. , 40.) according to Tutorial: EEG Independent Component Labeling.

And there is an example of mne.ICA, that detects EEG related components using correlation (in my case with ch_name='Fpz').
### Converting to EPOCHS
Converting Raws to Epochs (5 sec.) and one dynamic graph.
### Treatment pipeline
Creating 6 pipelines ([CSP, SPoC] @ [LinearDiscriminantAnalysis, LogisticRegression, RandomForestClassifier]) and calculating Accuracy with cross_val_score.
### Best model

### Implement PCA

# Usefull links
1) https://physionet.org/content/eegmmidb/1.0.0/ - General information about the dataset
2) https://labeling.ucsd.edu/tutorial/labels - Tutorial: EEG Independent Component Labeling. This detailed guide is useful for detecting artifacts in EEG data.

# Evaluation score
![alt text](https://github.com/loloroshlo/total-perspective-vortex/blob/main/Score_of_project.png)

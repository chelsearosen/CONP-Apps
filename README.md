# Diagnosing Pneumonia from X-ray Images
## Team Information
* Team Name: CONP Apps
* Team Members: Chelsea Rosen, Omar Zermeno, Nico de Jong, and Peyton Warp
* Course: BME 3053C Computer Applications for BME, Fall 2020
* J. Crayton Pruitt Family Department of Biomedical Engineering, University of Florida
## Project Description
The aim of this project is to create a machine learning model that can predict whether an x-ray image shows signs of pneumonia. 
With the COVID-19 pandemic, there has been a large uptake of patients in hospitals that have signs of pneumonia. This program could 
quickly make a prediction of a diagnosis for hundreds, if not thousands, of x-ray images, quicker than a doctor could. 
#### Data Source
Chest x-ray images were pulled from the ["Chest X-Ray Images (Pneumonia)"][1] dataset from Kaggle. We pulled 80 .jpeg images total from this dataset 
for our project. We used 40 images to train the models and 40 images to test the models. In each set of data, we had 20 x-ray images of normal lungs and 20 x-ray 
images of lungs with pneumonia. The exact images used can be found in the 'Training Data' and 'Testing Data' folders uploaded. 

## Functions
The team created three different functions to pull features from the x-ray images to create the machine learning models. A description of each function follows. 
### LungScan
text
### Sml2Lrg
text
### ChestInt
text

## Pulling Features from X-ray Images
The uploaded script, PropertiesLung.m, is used to pull appropriate features from the x-ray images in order to create the machine learning model. To use this script,
load the Training Data and Testing Data folders into MATLAB and then run the script accordingly. The output will be two .mat files, TrainData.mat and TestData.mat. 

## Machine Learning Models
We created three different models in order to see which would be the most accurate. A description of the decision tree, k-nearest neighbors, and linear discriminant analysis models created follows. 

### Decision Tree (DT) Model
### K-Nearest Neighbors (kNN) Model
### Linear Discriminant Analysis (LDA) Model
### LungModels

[1]:https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia

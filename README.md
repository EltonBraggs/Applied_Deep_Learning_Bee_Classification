 # Applied Deep Learning
 
 ## Contents
 * Bee Classification Introduction
 * Dataset
 * Data Preprocessing
 * Building the model
 * Fine tuning the model
 * Visualization of the features
 * Transfer Learning
 * Comparing evaluation results of the models
 * Prediction
 * References
 
 ## Bee Classification Introduction
   In this task, a bee dataset [2] is used to find the subspecies of the bees. There are 7 classes.
 For most of the subtasks, data is referred from Honey Bee Subspecies Classification by Gabriel Preda https://www.kaggle.com/gpreda/honey-bee-subspecies-classification. [1]
 ### General layout of the repository
 The dataset downloaded (full directory bee_imgs/bee_images/{images_files}) must be saved in the current directory.The model, after training, saves its checkpoints in the checkpoint folder. During training, the loss and accuracy called during Tensorboard callback function is  saved in the correspoinding model´s log folder. For example :model2 to logs2 folder. 
 After training of every model, using history function, loss and accuracy against the number of epochs is plotted and the inference is drawn.
 
## Dataset
The dataset is taken from the The BeeImage Dataset: Annotated Honey Bee Images [https://www.kaggle.com/jenny18/honey-bee-annotated-images]. It consists of 5172 bee images. It is a multi class dataset, main of which are location, subspecies, health, pollen carrying, caste , each class have multiple labels. It is a small dataset having an average pixel size of 100 x 100 and having 3 channels.

## Data Preprocessing
For the task , subspecies class is taken. It has 7 labels '-1': Not defined , 'Mixed local stock ', 'Carniolan honey bee','Italian honey bee', 'Russian honey bee', 'VSH Italian honey bee','Western honey bee'. The dataset is split into train (60%) , validation (20 %) and test (20%). This is done for cross validation process to prevent high bias and high variance during training.

## Building the model
### model1
The input image of shape (100 x 100 x3), is passed into the 2 layer CNN. Both layers have 16 filters and a 3 x 3 kernel is passed onto each filter. The activation function is set to **relu**, which is optimal for a small network, and converges faster [4]. After the first convolution layer, max pooling of 2 x 2 is passed, which averages the feature values and reduces filter size. The features are flattened after the second CNN , and passes to the Fully connected dense network, with a **softmax activation** fucńction, which is relatively better than sigmoid for classification tasks. The backpropagation is done using **adam** optimizer. The loss function is the "categorical_crossentropy" for the entire task, since the classification is between 7 labels.
#### Training
The batch size is set to 16 and number of epochs are set to 5. The training and validation accuracy after 5 epochs.
- training accuracy: 0.8574 
- validation accuracy: 0.8225
**Inference:** There is convergence between training and validation , but the accuracy can be improved.
#### Evaluation
Here the F1 score is used to evaluate each label in the subspecies class . F1 score is the harmonic mean of the precision and recall values of the predicted and ground truth images.  **Mean F1 score:** 0.82.
 
## Fine tuning the model 
### model3
- Increasing the batch size (48) and no. of epochs (30).
#### Training results: 
 - Training accuracy: 0.9178  - validation accuracy: 0.8998
**Inference:** Increase of Batch size  gives better validation accuracy  and still keeping the train and val convergence. 
### model2
- Changing filter dimensions of the second convolution layer and adding another CNN layer
- Adding two Dropout layers , with a probabilty to keep the layer to 0.4. This is done to prevent the model from overfitting, since an additional CNN layer is added.
- Using RMSprop optimizer (learning rate of 0.001)
#### Training results: 
 - Batch size 64 ; No. of Epochs 100
 - Training accuracy: 0.9368  - validation accuracy: 0.9432
**Inference:** Better accuracy, with better loss values , keeping training and validation convergence.
### model4
- Using **early stopping** method: It is a method to reduce computation time, the parameter checks whether there is significant change in the training and validation loss parameters given the **patience** parameter in keras API.  
- Since, the model2 has given good results compared to others, this fine tuning is performed on it.
#### Training results:
 - Training accuracy: 0.8985  - validation accuracy: 0.8768
**Inference**: Model stopped training at Epoch 28, which reduces large computation time as compared to model2 for 100 epochs.

## Visualization of the features
The second convolution layer of the model4 is  visualized [3]. The weights are retrieved in an array and the filter pixel values are plotted in both 3 channels and grayscale.
## Transfer Learning
### model5
The model2 , which has given better overall results is compared with the vgg16 model, which is pre-trained on ImageNet dataset, is used for transfer learning. To not tamper with the weights , all the layers are frozen. The last layer is added as a sequential addition to the frozen model  to a average pooling layer for flattening the features and a Fully Connected Layer having 7 neurons, as per the number of Layers, with the softmax activation function. The number of epochs are set to 100, to give equal advantage as model4, but early stopping is not implemented. The optimizer and the loss function is kept as model2.
#### Training results:
 - Training accuracy: 0.8770  - validation accuracy: 0.8756
**Inference**: For a large model, still shows less accuracy. The results could have been improved if some layers of the vgg16 network were made trainable.
## Comparing evaluation results of the models:
Since there are 7 labels to classify, it is better to compare the models, with the weighted F1 score.

| Model      | Weighted F1 score | Test loss | Test accuracy  |
| :---        |    :----:   |          ---: |            ---: 
| model1      | 0.82       | 0.449   | 0.827
| model2   | 0.95       | 0.164    | 0.948
| model3   | 0.91        | 0.199      |0.905
| model4   | 0.92       | 0.218     | 0.917
| model5   | 0.87        | 0.377      | 0.877

**Inference**:model2 has the best results among the others.

## Prediction
Here a random image from the test set is taken and the models predict the label with the probabilty. From all the models, model2 , which was inferred as the best of the rest in training , gave the best results.

| Model      | Predicted Label  | Probability 
| :---        |    :----:   |          ---: |             
| model1      | True Positive      | 0.999844   
| model2   | True Positive         |  1.000000       
| model3   | True Positive         | 0.998871       
| model4   | True Positive         | 0.999199      
| model5   | True Positive         | 0.999977      


## References
<a id="1">[1]</a> 
Gabriel Preda  , Honey Bee Subspecies Classification, https://www.kaggle.com/gpreda/honey-bee-subspecies-classification \
<a id="1">[2]</a> 
Jenny Yang ,The BeeImage Dataset: Annotated Honey Bee Images, https://www.kaggle.com/jenny18/honey-bee-annotated-images \
<a id="1">[3]</a>
Jason Brownlee , How to Visualize Filters and Feature Maps in Convolutional Neural Networks, https://machinelearningmastery.com/how-to-visualize-filters-and-feature-maps-in-convolutional-neural-networks/ \
<a id="1">[3]</a>
Mark Shutera, Applied Deep Learning , 
urls: https://github.com/schutera/DeepLearningLecture_Schutera
  https://elearning.rwu.de/course/view.php?id=2345
<a id="1">[4]</a>
 Danqing Liu , A Practical Guide to ReLU, https://medium.com/@danqing/a-practical-guide-to-relu-b83ca804f1f7
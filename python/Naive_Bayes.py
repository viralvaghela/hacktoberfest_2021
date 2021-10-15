# -*- coding: utf-8 -*-
"""
# Naive Bayes Classifier

## Problem Statement
In this problem, you will implement a simple Naive Bayes classifier to detect the sentiment of product reviews. You will need to create a 7-fold cross validation to train and test your model. You may choose to discard various stop words, commas, fullstops, numbers, hyphens, brackets, exclamation marks and any other single/double letter words (such as a, an, the, be etc) which do not contribute to the sentiment of the text.
Use laplace smoothening to avoid the problem of divison by zero.

Try to vectorize your code as much as possible to make your computations faster and efficient. Do not hard code any parts of the implementation unless it is absolutely necessary.

## Implementation

Here is a brief description of the steps performed to implement the Naive Bayes model to classify the sentiment of product reviews:

1. **Converting the text file**: The dataset text file is converted to a pandas dataframe. Each sentence in the dataset goes through some preprocessing steps.
2. **7-fold Cross Validation**: Next, the dataframe is divided into 7 folds. For each of the 7 iterations, one of the set is considered as the testing set and the rest of the data is used in training.
3. **Count Vectorization**: An array of unique words is derived from the training data. Each sentence in the training set is now fitted onto this array of unique words, giving is a matrix that will be used for training.
4. **Fitting and evaluating the model**: Once we have a matrix representation for our training and testing data, we can fit the data into our model and use the Bayes theorem formula to derive the probabilities that a certain product review in our testing set is of positive sentiment. The predictions are compared to the actual labels for the testing data and accuracy is reported.
5. **Deriving the final accuracy**: Once we have the accuracies for each of the 7 folds (testing sets), we can take their mean and report it. This will be the accuracy of our model.

### Package Imports
The following python packages have been used:
1. **Numpy**: To represent data in a matrix form and to make vectorize mathematical operations to make them easier and faster.
2. **Pandas**: To represent the dataset in an easy format (dataframe) and to simplify operations like splitting, merging, etc.
"""

import numpy as np
import pandas as pd

"""### File Imports
The dataset and stop words are read from their corresponding text files in the current directory. 
"""

raw_data = np.array(open('dataset_NB.txt', 'r').read().split('\n'))#returns a file object// mode read//default .read()-1 which reads the whole file//\n is the seperator
stop_words = set(np.array(open('stop_words.txt', 'r').read().split('\n')))

# Example review present in the dataset
print('Example:', raw_data[0])
# Number of reviews in the dataset
count = len(raw_data)
print('Number of reviews:', count)
# Number of folds the data must be divided into
FOLD_COUNT = 7

"""### Data preprocessing functions
The following functions are used to preprocess the data being given in the dataset. An explanation of what each function does is given alongside the code.

#### Note
Since we noticed that the training data had a lot of spelling mistakes, we included some commented code that would use the "autocorrect" Python library to fix spelling mistakes (commented because libraries other than Numpy and Pandas are not allowed). Doing so increases the accuracy of the model.
"""

# !pip install autocorrect
# from autocorrect import Speller
# spell = Speller(lang = 'en')

def remove_label(sentence):
  """
  Input: A sentence picked out from the dataset with the label at the end.
  Output: A tuple (sentence, label)
  """
  return (sentence.strip()[: -1].strip(), sentence.strip()[-1])#slicing doesn't include the last term

def preprocess_text(sentence):
  """
  Input: A sentence obtained after removing the label.
  Output: An array consisting of words of the sentence after converting to lowercase and removing punctuations and stop words.
  """
  # convert the sentence to lowercase
  sentence = sentence.lower()
  # remove punctuations
  punc = '''!()-[]{};:'"\,<>./?@#$%^&+*_~0123456789'''
  for element in sentence:  
    if element in punc:
      sentence = sentence.replace(element, ' ')
  # split the sentence into an array of words
  words = sentence.split()
  sentence = []
  # remove the stop words
  for word in words:
    # word = spell(word) # this would have corrected spelling in case of incorrect spelling
    if word not in stop_words:
      sentence.append(word)
  return sentence

"""Now, let us utilize the functions that we have made above to initialize the data obtained from the txt file into a Pandas dataframe."""

# Initialize empty array that will store our data
data = []

for i in range(count):
  # Extract the sentence and label from raw data
  sentence, label = remove_label(raw_data[i])
  # Remove stop words, numbers and punctuations and convert to array
  sentence = preprocess_text(sentence)
  data.append([sentence, label])

# Convert the data obtained to a Pandas dataframe
df = pd.DataFrame(data, columns = ['Sentence', 'Label'])

# Show the first few entries in our dataframe
df.head()

"""### Functions for Count Vectorization and calculating Accuracy
The following functions have been declared in the next code cell that help in the formation fo a count vector for a sentence. The description for each function has been given alongside the code.
"""

def get_unique_words(sentences):
  """
  Input: An array of sentences(array of words) obtained after preprocessing
  Output: A dictionary of unique words, each with an assigned index to define the order
  """
  # A dictionary to track whether a word has been seen before or not
  dic = {}
  # Initialize an empty set of unique words
  unique_words = {}
  index = 0
  for sentence in sentences:
    for word in sentence:
      if word not in dic:
        dic[word] = 1
        unique_words[word] = index
        index += 1
  return unique_words

def get_matrix_for_sentences(unique_words, sentences):
  """
  Input: The dictionary of unique words obtained from get_unique_words() (above),
          an array of preprocessed sentences (each sentence is an array of words)
  Output: A D x N matrix consisting of vector representation where each column is the vector representation of each sentence
          (D: Number of unique words/Dimension of vector for each sentence, N: Number of sentences in input)
  """
  matrix_data = np.array([])
  for sentence in sentences:
    vectorized_sentence = np.zeros(len(unique_words), dtype = int)# creates an array filled with zero of the length unique words
    for word in sentence:
      if word in unique_words.keys():
        vectorized_sentence[unique_words[word]] += 1 #array[index]++
    matrix_data = np.append(matrix_data, vectorized_sentence)#appends n times
  return matrix_data.reshape([-1, len(unique_words)]).T #corrects the shape

def create_training_testing_data(testing_fold):
  """
  Input: A 0-indexed integer representing the index of fold to make the testing data from (range 0...6)
  Output: A tuple consisting of (testing_df, training_df, unique_words),
          where testing_df and training_df represent the testing and training data respectively after partitioning df
          and unique_words is a dictionary consisting of the unique words for the corresponding training data.
  """
  # Get testing_fold th fold from the df
  testing_df = df.iloc[count*(testing_fold)//FOLD_COUNT:count*(testing_fold+1)//FOLD_COUNT, :] #indexes of the testing data
  # Training data will be the rest of the data in df, but not in testing_df
  training_df = df[~df.index.isin(testing_df.index)] 

  # Get the sentences in the training_df
  sentences = list(training_df.Sentence)
  # Get the unique words in the training_df
  unique_words = get_unique_words(sentences)
  
  return (testing_df, training_df, unique_words)

def evaluate_accuracy(labels, predictions):
  """
  Input: Arrays of labels and predictions, each containing either '0' or '1'
  Output: The fraction of predictions that correctly match the label
  """
  # Make sure that the lengths of both arrays is equal
  assert(len(labels) == len(predictions))
  # Score will count how many predictions are correct
  score = 0
  for i in range(len(labels)):
    label = labels[i]
    prediction = predictions[i]
    if label == prediction:
      # If prediction is correct, increment score
      score += 1
  # Return accuracy
  return (float(score) / float(len(labels)))

"""### Function for fitting and evaluating the model
The following function loops through the 7 different folds, creates and fits the training data and evaluates the accuracy for each fold. Finally, it takes the mean of all the accuracies and reports it as the final accuracy of the model.

One major assumption of the model (and using count vectorization) is that words occur in product reviews conditionally independent of each other.

"""

def fit_and_evaluate(laplace_k):

  # Sum of accuracies to divide later to find mean
  accuracies_sum = 0.
  for i in range(FOLD_COUNT):

    print(f"Building and evaluating model with testing fold: {i + 1}/{FOLD_COUNT}")

    # Obtain the testing, training data and unique words for the given fold index
    testing_df, training_df, unique_words = create_training_testing_data(i)

    # Number of unique words will be the number of words in our vocabulary
    n_vocabulary = len(unique_words)

    # Separate the positive and negative vectors into two separate dataframes
    training_positive_df = training_df.loc[training_df['Label'] == '1']
    training_negative_df = training_df.loc[training_df['Label'] == '0']

    # Get only the sentences from the positive and negative dataframes
    sentences_positive = list(training_positive_df.Sentence)
    sentences_negative = list(training_negative_df.Sentence)


    # Get a count vectorization matrix for positive and negative sentences over the unique_words
    vectors_positive = get_matrix_for_sentences(unique_words, sentences_positive)
    vectors_negative = get_matrix_for_sentences(unique_words, sentences_negative)

    # Get the total number of positive and negative sentences in training
    n_positive = np.sum(vectors_positive)
    n_negative = np.sum(vectors_negative)

    # Get the prior probabilities for use in the Bayes theorem formula
    p_pos = n_positive / (n_positive + n_negative)
    p_neg = n_negative / (n_positive + n_negative)

    # Get the testing sentences and labels from the testing dataframe
    testing_sentences = list(testing_df.Sentence) 
    testing_labels = list(testing_df.Label)

    # Get the matrix represenation for testing sentences
    testing_sent_vectors = get_matrix_for_sentences(unique_words, testing_sentences)

    # Get a list of probabilities that a word in the training set appears in positive or negative sentences
    # This basically goes over every single word from unique_words and calculates the probability
    # that that word appears in positive and negative training data
    # We utilize the Laplace smoothing formula
    prob_pos_words = ((np.sum(vectors_positive, axis = 1) + laplace_k) / (n_positive + laplace_k * n_vocabulary)).reshape([-1, 1])
    prob_neg_words = ((np.sum(vectors_negative, axis = 1) + laplace_k) / (n_negative + laplace_k * n_vocabulary)).reshape([-1, 1])
    
    # Now that we have obtained probabilies for each word given the class, we can multiply that
    # with the testing vector to obtain probabilities that each word in testing set occurs in the corresponding class
    # Next we will need to multiply all the words in the testing sentences together (because of our assumption)
    # To do so, we must replace all the 0s in the testing sentences to 1 to prevent the absence of certain words
    # from turning our probility that a testing sentence occurs in a particular class to 0.
    prob_words_pos_testing = prob_pos_words * testing_sent_vectors
    prob_words_pos_testing[prob_words_pos_testing == 0] = 1
    prob_sentence_pos = np.prod(prob_words_pos_testing, axis = 0)
    prob_words_neg_testing = prob_neg_words * testing_sent_vectors
    prob_words_neg_testing[prob_words_neg_testing == 0] = 1
    prob_sentence_neg = np.prod(prob_words_neg_testing, axis = 0)

    # Now we apply the Bayes Theorem formula to obtain the probability that the sentences in testing class
    # are of positive sentiment
    prob_pos_sentence = (prob_sentence_pos * p_pos) / ((prob_sentence_pos * p_pos) + (prob_sentence_neg * p_neg))

    # Get a result array to store either '1' or '0' depending on the probability obtained
    result = []
    for val in prob_pos_sentence:
      if val >= 0.5:
        result.append('1')
      else:
        result.append('0')
      
    # Now, let us evaluate the accuracy obtained for this fold
    accuracy = evaluate_accuracy(testing_labels, result)

    print(f'Completed for testing fold {i + 1} with accuracy: {accuracy}')

    # Add the accuracy to the total sum
    accuracies_sum += accuracy
  
  # Report the final mean accuracy of the model
  print(f'\n\nMean Accuracy = {accuracies_sum / FOLD_COUNT}')

"""Now that we have written the ```fit_and_evaluate``` function, let us call it and evaluate our model."""

fit_and_evaluate(1)

"""
## Limitations of Naive Bayes Classifier:
- We have made the assumption that the occurence of words is conditionally independent of each other. However, in real life, this isn't always true as the occurence of some words may depend on the occurence of other words.
- If the model encounters a word in the testing set that wasn't a part of the training data, it will not be able to make a proper prediction. This is known as the **Zero Frequency Problem**.
- Naive Bayes requires a relatively larger training dataset to make accurate predictions.
- Using generative models like Naive Bayes is usually more complex than using a discriminative model as we have to learn how the data is formed and what makes the data part of a particular class instead of just learning what differentiates the classes.

## Extra: Building a model with all data as training data and user-provided reviews
The code given below uses the same method provided above to fit the Naive Bayes classifier model with all the data provided as training data. It can be used to evaluate user-provided reviews and tries to classify them.
"""

# Building a model with all training data
def get_optimized_params():
    unique_words = get_unique_words(list(df.Sentence))
    n_vocabulary = len(unique_words)
    training_positive_df = df.loc[df['Label'] == '1']
    training_negative_df = df.loc[df['Label'] == '0']
    sentences_positive = list(training_positive_df.Sentence)
    sentences_negative = list(training_negative_df.Sentence)
    vectors_positive = get_matrix_for_sentences(unique_words, sentences_positive)
    vectors_negative = get_matrix_for_sentences(unique_words, sentences_negative)
    n_positive = np.sum(vectors_positive)
    n_negative = np.sum(vectors_negative)
    p_pos = n_positive / (n_positive + n_negative)
    p_neg = n_negative / (n_positive + n_negative)
    return (vectors_positive, vectors_negative, n_positive, n_negative, n_vocabulary, unique_words, p_pos, p_neg)

vectors_positive, vectors_negative, n_positive, n_negative, n_vocabulary, unique_words, p_pos, p_neg = get_optimized_params()

def evaluate(sentences):

  testing_sentences = []
  for sentence in sentences:
    testing_sentences.append(preprocess_text(sentence))

  testing_sent_vectors = get_matrix_for_sentences(unique_words, testing_sentences)
  prob_pos_words = ((np.sum(vectors_positive, axis = 1) + 1) / (n_positive + 1 * n_vocabulary)).reshape([-1, 1])
  prob_neg_words = ((np.sum(vectors_negative, axis = 1) + 1) / (n_negative + 1 * n_vocabulary)).reshape([-1, 1])
  prob_words_pos_testing = prob_pos_words * testing_sent_vectors
  prob_words_pos_testing[prob_words_pos_testing == 0] = 1
  prob_sentence_pos = np.prod(prob_words_pos_testing, axis = 0)
  prob_words_neg_testing = prob_neg_words * testing_sent_vectors
  prob_words_neg_testing[prob_words_neg_testing == 0] = 1
  prob_sentence_neg = np.prod(prob_words_neg_testing, axis = 0)

  prob_pos_sentence = (prob_sentence_pos * p_pos) / ((prob_sentence_pos * p_pos) + (prob_sentence_neg * p_neg))
  result = []
  for val in prob_pos_sentence:
    if val >= 0.5:
      result.append('1')
    else:
      result.append('0')
  return result

"""Now that we have the ```evaluate``` function, let us test it with some reviews."""

print(evaluate(["Easy to use", "i dont like it", "Money wasted", "I like it"]))

"""As we can see, the model has correctly identified the class of the reviews."""
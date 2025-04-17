# Customer-Churn-Prediction-Using-Optimization-Methods

## 📘 Project Overview

This project investigates the use of optimization algorithms to predict customer churn in the banking industry. With customer retention being a critical component of profitability, especially in a highly competitive financial market, this study aims to develop predictive models that can identify clients likely to leave a bank. The models combine traditional classification techniques with advanced optimization strategies to improve accuracy and avoid issues like overfitting.

## ❗ Problem Definition

Customer churn — when clients leave a service provider — poses a significant threat to long-term business sustainability, especially in sectors like banking where acquiring new customers is more expensive than retaining existing ones. The goal of this study is to build a system that can predict churn based on customer attributes using machine learning models enhanced by optimization techniques. The core objective is to **maximize the F1 score** of predictions, balancing precision and recall for optimal model effectiveness.

## 🗂️ Dataset

The dataset used was sourced from Kaggle and is based on the article *“Machine Learning Based Customer Churn Prediction in Banking.”* It includes anonymized customer-level data, such as credit score, geography, tenure, and account activity, with the target variable indicating whether the customer churned or not. Initially, the data was highly imbalanced (1:4 churn to non-churn ratio), so **undersampling** was applied to create a balanced dataset for fair training and evaluation.

## 🧪 Techniques and Tools Used

### Genetic Algorithm (GA)
The project applies Genetic Algorithms to search for optimal combinations of features that best predict churn. Chromosomes are constructed from binary feature encodings representing customer attributes such as tenure, balance, and activity level.

### Random Forest Classifier
An ensemble learning method that combines multiple decision trees, chosen for its high performance in classification tasks. RF was used as the core predictive model, optimized using different crossover methods from GA.

### Crossover Techniques
To evolve better feature combinations, three crossover techniques were tested:
- **Blend Crossover**: Mixes parental genes based on a range of values.
- **Single-point Crossover**: Swaps gene segments at a randomly chosen point.
- **Uniform Crossover**: Randomly selects each gene from either parent with equal probability.

### Data Preprocessing
- Feature selection and encoding of categorical variables
- Dataset balancing using undersampling
- F1 score used as the objective function:
  

F1 Score = 2 * (Precision * Recall) / (Precision + Recall)


## 🔍 Key Findings

The Genetic Algorithm combined with Random Forest proved to be an effective approach for feature optimization in churn prediction. While **Blend Crossover** seemed to show better performance on the error plot, further analysis suggested possible overfitting. **Uniform Crossover** demonstrated consistent and balanced performance without overfitting, making it the most reliable method overall. This approach successfully identified high-impact variables and improved the prediction capability of the Random Forest model.

## 📈 Results

- **Uniform Crossover** emerged as the most stable and effective crossover strategy.
- Blend crossover showed lower error but exhibited signs of overfitting.
- Single-point crossover performed comparably after multiple generations.
- The final model trained with optimized features via GA showed improved prediction accuracy and robustness on balanced data.

## 🚀 Conclusion and Future Scope

This study successfully demonstrates the integration of genetic algorithms with machine learning models to improve churn prediction in the banking sector. The combination of GA with Random Forest and various crossover techniques allowed us to identify the most influential features and avoid overfitting. 

In future research:
- **Larger and real-time datasets** should be explored to simulate commercial-scale operations.
- Integration of **Big Data technologies** could enable more efficient real-time churn prediction.
- More adaptive models could be developed to reflect **economic and behavioral trends** in customer data.

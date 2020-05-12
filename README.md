# Coronavirus-Calculator

## About
COVID-19 (Coronavirus Disease) has recently caused a global pandemic resulting in over 700,000 infected and more than 30,000 deaths worldwide. As this situation poses a serious public health risk to anyone and everyone, the federal government including the public health department (nurses, doctors) has been working nonstop to help treat and care for the infected. To assist in this battle for survival, the coronavirus calculator has been created to accurately predict the chance of having the virus and give patients a sense of reassurance. 

## Technologies/Frameworks/Libraries Used
* Python
* Numpy
* Pandas
* Sklearn
* Django
* Swift

## How it works
A user is approached with a coronavirus testing form asking over 20 different questions. Each of these questions are different features used in training the ML model. This data is then sent back to a custom-made API using Django. Using clinical data from testing done over the nation, the machine learning model is then trained through two different methods: extreme and light gradient boosting. When provided a test input (which is the user data), the model combines the chances of the two methods to result in one weighted probability. The probability is then stored in a SQLite database where it is sent back and presented to the user in a tidy format.

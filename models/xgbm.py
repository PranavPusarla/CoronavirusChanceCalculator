from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import numpy as np
import pandas as pd
import xgboost as xgb
import matplotlib.pyplot as plt

def xgbmodel():
    csv_file = 'processed_data.csv'
    dataframe = pd.read_csv(csv_file, index_col=0)

    y = dataframe['covid19_test_results'].values

    dataframe = dataframe.drop(columns=['covid19_test_results'])
    X = dataframe.values

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=1)

    model = xgb.XGBClassifier()
    model.fit(X_train, y_train)

    y_pred = model.predict_proba(X_test)
    probabilities = y_pred*100

    # for i in probabilities:
    #     print('Probability of having COVID19: {:.2f}%'.format(i[1]))
    return model

xgbmodel()
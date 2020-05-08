from xgbm import xgbmodel
from lgbm import lgbmodel
import numpy as np

def predict_covid(params):
    xgb = xgbmodel()
    lgb = lgbmodel()

    xgb_pred = xgb.predict_proba(params)
    xgb_prob = xgb_pred*100

    lgb_pred = lgb.predict_proba(params)
    lgb_prob = lgb_pred*100

    xgb_weight = 0.75
    lgb_weight = 0.25

    weighted_average = xgb_weight*xgb_prob + lgb_weight*lgb_prob
    return weighted_average

params = np.array([[29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36.65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]])
print('Probability of having COVID-19 is {:.2f}%'.format(predict_covid(params)[0][1]))



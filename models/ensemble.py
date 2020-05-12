from .xgbm import xgbmodel
from .lgbm import lgbmodel
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
    chance_of_covid = weighted_average[0][1]
    return chance_of_covid



import lightgbm as lgb
from sklearn.model_selection import train_test_split
import pandas as pd

def lgbmodel():
    csv_file = 'processed_data.csv'
    dataframe = pd.read_csv(csv_file, index_col=0)

    y = dataframe['covid19_test_results'].values
    dataframe = dataframe.drop(columns=['covid19_test_results'])
    X = dataframe.values

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=1)

    # train_dataset = lgb.Dataset(X_train, label=y_train)
    # param = {'num_leaves':150, 'objective':'binary','max_depth':7,'learning_rate':.05,'max_bin':200}
    # param['metric'] = ['auc', 'binary_logloss']
    # model = lgb.train(param, train_dataset, 100)

    model = lgb.LGBMClassifier()
    model.fit(X_train, y_train)

    y_pred = model.predict_proba(X_test)
    probabilities = y_pred*100

    # for i in probabilities:
    #     print('Probability of having COVID19: {:.2f}%'.format(i[1]))
    return model
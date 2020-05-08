import pandas as pd

dataframe_14 = pd.read_csv('processed_data14.csv', index_col=0)
dataframe_21 = pd.read_csv('processed_data21.csv', index_col=0)

dataframe = pd.concat([dataframe_14, dataframe_21])
dataframe.to_csv('processed_data.csv')


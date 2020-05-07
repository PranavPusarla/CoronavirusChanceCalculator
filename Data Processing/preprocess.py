import pandas as pd
import io
import requests

url = 'https://raw.githubusercontent.com/mdcollab/covidclinicaldata/master/data/04-21_carbonhealth_and_braidhealth.csv'
response_data = requests.get(url).content
dataframe = pd.read_csv(io.StringIO(response_data.decode('utf-8')))

dataframe = dataframe.drop(columns=['cxr_findings','cxr_impression','cxr_link', 'er_referral'], axis=1)
dataframe = dataframe.drop(columns=['date_published', 'clinic_state', 'test_name', 'swab_type'])
dataframe = dataframe.drop(columns=['rapid_flu_results', 'rapid_strep_results', 'days_since_symptom_onset'])
dataframe = dataframe.drop(columns=['cough_severity', 'sob', 'sob_severity', 'temperature', 'pulse', 'sys', 'dia', 'rr', 'sats', 'ctab'])
dataframe = dataframe.fillna(0)
dataframe = dataframe*1
dataframe['covid19_test_results'] = dataframe['covid19_test_results'].eq('Positive').mul(1)
dataframe.to_csv('processed_data.csv')
print(dataframe)
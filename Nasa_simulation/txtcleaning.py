import pandas as pd

# Headers Based on the Nasa Documentation
col_names = ['unit_id','cycle','setting_1','setting_2','setting_3']
col_names += [f's{i}' for i in range(1,22)]
print(col_names)

# Load the space separated file
df = pd.read_csv('train_FD001.txt', sep="\s+", header=None,names=col_names)
print(df.head(10))

df.to_csv('cleaned_engine_data.csv', index=False)
print("File 'cleaned_engine_data.csv' created successfully!")
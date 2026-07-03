import pandas as pd
import numpy as np

df = pd.read_csv("diabetes.csv")
df.info()
df.describe()

# remove null values
print(df.isnull().sum())
df = df.dropna()
# remove duplicate values
df = df.drop_duplicates()

print("Total records after removing duplicates:",
      len(df))

# Min,Max,Mean 
# For BMI
print("Minimum BMI:", df["BMI"].min())
print("Maximum BMI:", df["BMI"].max())
print("Average BMI:", df["BMI"].mean())

# For Age
print("Minimum Age:", df["Age"].min())
print("Maximum Age:", df["Age"].max())
print("Average Age:", df["Age"].mean())

# Create PatientID
df["PatientID"] = range(1, len(df)+
                        1)

# Create Risk Category
def risk_category(glucose):

    if glucose < 100:
        return "Normal"

    elif glucose < 126:
        return "Pre-Diabetic"

    else:
        return "High Risk"

df["Risk_Category"] = df["Glucose"].apply(risk_category)

# Check columns
print(df.columns.tolist())
for col in df.columns:
    print(col)

df = df[
    [
        "PatientID",
        "Age",
        "BMI",
        "Glucose",
        "Outcome",
        "Risk_Category"
    ]
]

print(df.shape)
print(df.head())
print(df.tail())

df.to_csv("cleaned_patient_data.csv", index=False)

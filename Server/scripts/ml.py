import os
import json

def pathJSON(fileName):
    return os.path.join("scripts", "JSON", f"{fileName}.json")

json_data = open(pathJSON("ml"))   
data = json.load(json_data) # deserialises it
json_data.close()

ml_data = []
aya = 1
for row in data:
    ml_data.append(
        {
            "model": "Languages.AyaLanguage",
            "fields": {
            "language": 4,
            "sora": row["chapter"],
            "aya": aya,
            "text": row["text"],
            }
        }
    )
    aya +=1

jsonString = json.dumps(ml_data)
jsonFile = open("Languages/fixtures/ml.json", "w")
jsonFile.write(jsonString)
jsonFile.close()
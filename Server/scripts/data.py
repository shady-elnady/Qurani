import os
import json

def pathJSON(fileName):
    return os.path.join("scripts", "JSON", f"{fileName}.json")

json_data = open(pathJSON("audio"))   
data = json.load(json_data)["rows"] # deserialises it
json_data.close()

aya_data = [
  {
    "model": "Aya.Aya",
    "fields": {
      "soraid": row[0],
      "ayaid": row[1],
      "page": row[2],
      "quarter": row[3],
      "hezb": row[4],
      "joza": row[5],
      "sajda": row[6],
      "text": row[7],
      "uthmanitext": row[8],
      "searchtext": row[9],
      "quarterstart": row[10]
    }
  }
  for row in data 
]
jsonString = json.dumps(aya_data)
jsonFile = open("Aya/fixtures/aya.json", "w")
jsonFile.write(jsonString)
jsonFile.close()
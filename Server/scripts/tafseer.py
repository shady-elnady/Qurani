import os
import json

def pathJSON(fileName):
    return os.path.join("scripts", "JSON", f"{fileName}.json")

json_data = open(pathJSON("tafaseer"))   
data = json.load(json_data)["rows"] # deserialises it
json_data.close()

aya_data = [
  {
    "model": "Tafseer.Tafseer",
    "fields": {
      "id": row[0],
      "title": row[1],
      "info": row[2],
      "type": f"{row[3]}",
      "is_download": row[4],
    }
  }
  for row in data 
]
jsonString = json.dumps(aya_data)
jsonFile = open("Tafseer/fixtures/tafaseer.json", "w")
jsonFile.write(jsonString)
jsonFile.close()
import os
import json

def pathJSON(fileName):
    return os.path.join("scripts", "JSON", f"{fileName}.json")

json_data = open(pathJSON("audio"))   
data = json.load(json_data)["rows"] # deserialises it
json_data.close()

qari_data = []
audio_data = []
for row in data:
  qari_data.append(
    {
        "model": "Qaria.Qaria",
        "fields": {
        "name": row[2],
        "native": row[1],
        }
    }
  )
  audio_data.append(
    {
        "model": "Audio.Audio",
        "fields": {
        "qaria": row[0],
        "type": row[3],
        "audio_url": row[4],
        }
    }     
  )

qariJsonString = json.dumps(qari_data)
jsonFileQaria = open("Qaria/fixtures/qaria.json", "w")
jsonFileQaria.write(qariJsonString)
jsonFileQaria.close()

audioJsonString = json.dumps(audio_data)
jsonFileAudio = open("Audio/fixtures/audio.json", "w")
jsonFileAudio.write(audioJsonString)
jsonFileAudio.close()
import json
import yaml

# Load the JSON data from TopPrompts.json
with open("TopPrompts.json", "r") as f:
    json_data = json.load(f)

# Convert JSON to YAML
yaml_data = yaml.dump({"prompts": [{"name": d["handle"], "description": d["description"], "system": d["prompt"]} for d in json_data]}, allow_unicode=True)

# Write the YAML data to openprompt.co.yaml
with open("openprompt.co.yaml", "w") as f:
    f.write(yaml_data)
import csv
import yaml

# Open the CSV file and read its contents
with open('prompts.csv', 'r') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    # Create a dictionary to hold the YAML data
    yaml_data = {
        'version': 'v0',
        'prompts': []
    }

    # Loop through each row in the CSV file
    for row in csv_reader:
        # Create a dictionary for the prompt data
        prompt_data = {
            'name': row['act'].lower().replace(' ', '-'),
            'description': row['act'],
            'system': row['prompt']
        }

        # Add the prompt data to the YAML data
        yaml_data['prompts'].append(prompt_data)

    # Write the YAML data to a file
    with open('awesome-chatgpt-prompts.yaml', 'w') as yaml_file:
        yaml.dump(yaml_data, yaml_file)

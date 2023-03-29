#!/bin/bash

# Set the input and output file paths
input_file="prompts.csv"
output_file="awesome-chatgpt-prompts.yaml"

# Write the YAML file header
echo "version: v0" > "$output_file"
echo "prompts:" >> "$output_file"

# Loop through each line in the CSV file
while IFS=',' read -r act prompt; do
  # Convert the act column to kebab case
  name=$(echo "$act" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  # Wrap the prompt column in double quotes if it contains multiple lines
  if [[ "$prompt" == *$'\n'* ]]; then
    prompt=$(echo "$prompt" | sed 's/^/"/;s/$/"/')
  fi
  # Escape curly braces in the prompt column
  prompt=$(echo "$prompt" | sed 's/{/\\{/g; s/}/\\}/g')
  # Write the YAML entry for this line
  echo "  - name: $name" >> "$output_file"
  echo "    description: $act" >> "$output_file"
  echo "    system: $prompt" >> "$output_file"
done < "$input_file"


.PHONY: build
build:
	wget https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv -O awesome-chatgpt-prompts/prompts.csv
	cd awesome-chatgpt-prompts && python3 convert.py
	wget https://raw.githubusercontent.com/timqian/openprompt.co/main/TopPrompts.json -O openprompt.co/TopPrompts.json
	cd openprompt.co && python3 convert.py

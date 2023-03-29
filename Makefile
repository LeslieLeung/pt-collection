.PHONY: build
build:
	wget https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv -O awesome-chatgpt-prompts/prompts.csv
	cd awesome-chatgpt-prompts && python3 convert.py

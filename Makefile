

# Command for the initial run of the bot, scrapes Documentation and then starts.
firstrun:
	echo "Scraping documentation data..."
	scrape
	echo "Installing requirements..."
	python3 -m pip install -r requirements.txt
	echo "Starting Bot..."
	python3 src/bot/run.py

# Simple shortcut for starting the bot.
run: 
	python3 src/bot/run.py

# Run all scraping spiders and put their results into the doc/ directory
scrape:
	mkdir -p doc/
	rm -rf doc/*
	cd src/ && \
	scrapy crawl cpp-symbols --loglevel INFO -o ../doc/cpp_symbols.json && \
	scrapy crawl cpp-stubs   --loglevel INFO -o ../doc/cpp_stubs.json

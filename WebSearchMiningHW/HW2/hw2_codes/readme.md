# directory structure
.
├── data
│   ├── ChineseStopwords.txt
│   ├── EnglishNews
│   ├── EnglishStopwords.txt
│   ├── News
│   └── english.stop
└── main.py

# Dependency



# How to start main.py
- options:
  -  `--query` : Input a query string, remember to add double quote
  - `-d, --display` : Input the amount of display results
  - `--chinese` : Turn on this to rank Chinese|English documents
  -  `--no-chinese` : Turn on this to rank only English documents

- e.g.: Rank Chinese Document and show 15 results
  - `python main.py --chinese -d 15 --query "烏克蘭 大選"`
- e.g.: Rank only English Document and show 20 results
  - `python main.py --no-chinese -d 20 --query "Taiwan Trump Biden"`

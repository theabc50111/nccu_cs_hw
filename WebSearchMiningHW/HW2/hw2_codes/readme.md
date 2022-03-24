# HW2 of WSM 
## Directory structure
.
├── data
│   ├── ChineseStopwords.txt
│   ├── EnglishNews
│   ├── english.stop
│   ├── EnglishStopwords.txt
│   └── News
├── main.py
├── readme.md
└── requirements.txt

## Dependency

- stored dependency in `requirements.txt`
  - execute : `pip install -r requirements.txt`


<details markdown="1">
<summary> depnedency list </summary>

| Package       | Version   |
| ------------- | --------- |
| click         | 8.0.4     |
| jieba         | 0.42.1    |
| joblib        | 1.1.0     |
| nltk          | 3.7       |
| numpy         | 1.22.3    |
| pip           | 20.0.2    |
| pkg-resources | 0.0.0     |
| regex         | 2022.3.15 |
| scikit-learn  | 1.0.2     |
| scipy         | 1.8.0     |
| setuptools    | 44.0.0    |
| threadpoolctl | 3.1.0     |
| tqdm          | 4.63.1    |

</details>


## How to start main.py
- options:
  -  `--query` : Input a query string, remember to add double quote
  - `-d, --display` : Input the amount of display results
  - `--chinese` : Turn on this to rank Chinese|English documents
  -  `--no-chinese` : Turn on this to rank only English documents

- e.g.-- Rank Chinese Document and show 15 results
  - `python main.py --chinese -d 15 --query "烏克蘭 大選"`
- e.g.-- Rank English Document only and show 20 results
  - `python main.py --no-chinese -d 20 --query "Taiwan Trump Biden"`
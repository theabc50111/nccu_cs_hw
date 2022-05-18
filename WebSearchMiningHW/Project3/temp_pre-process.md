- 從 `item_features.csv` 可以得知總共有73 種 feature_category
    - `less item_features.csv | awk -F "," '{print $2}'|sort|uniq| wc -l`
- 同一個item中 該feature_category 會有複數值 的 feature_category 列表:
    - `less item_features.csv | awk -F "," '{print $1, $2}'|sort|uniq -D|awk -F " " '{print $2}'|sort|uniq`
    - 列表：
    1
    28
    30
    4
    46
    53
- feature_category 最大的重複次數(該feature_category 在同一個item中  會有複數值)
    - `less item_features.csv | awk -F "," '{print $1, $2}'|sort|uniq -d -c|awk -F " " '{if ($3==1) {print $1, $3}}'|sort|uniq`
        - 將綠色的部份改成1 | 28 | 30 | 4 | 46 | 53
        - feature_category :  max number of multiple value
            - 1 : 2
            - 28 : 3
            - 30 : 8
            - 4 : 4
            - 46 : 2
            - 53 : 2

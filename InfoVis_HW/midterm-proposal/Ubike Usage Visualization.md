# Ubike Usage Visualization
## 組員姓名
- 資科計一 110753202 何彥南
- 資科計一 110753207 林依樺
- 資科碩一 110753201 曹昱維
- 資科碩二 109753207 謝政彥


## 引言
### BBS系統
公共自行車（或稱共享腳踏車，英語：Bicycle Sharing System，又作：Public Bicycle System，簡稱：PBS），是一種提供大眾免費或是便宜的方式租借腳踏車。讓大眾可以腳踏車取代中短程的移動。以減少交通壅塞、噪音和空氣汙染問題。常常會結合大眾運輸使用，所以火車、捷運與公車站附近常常會有站點。此外，腳踏車還具有運動、休閒等價值，也有助於大眾的身心健康。也因為如此，現在的都市區都可以看到共享單車的蹤跡。
資料上主要分成 station-base、trip-base 和 card-base 三種資料，
- 主要研究的項目

(參考: [wikipedia](https://zh.wikipedia.org/zh-tw/%E5%85%AC%E5%85%B1%E8%87%AA%E8%A1%8C%E8%BB%8A))

### 時間序列資料
時間序列是只一連串隨著時間變化的量化狀態，像是溫度、人流量。通常會以固定的時間區間去觀察此狀態的變化，像是每秒、每分、每小時、每天...。在時間序列中可以分析一段時間的趨勢、週期變化或是做時間序列預測。
(參考: [MBA 智庫](https://wiki.mbalib.com/zh-tw/%E6%97%B6%E9%97%B4%E6%95%B0%E5%88%97)、[wikipedia](https://zh.wikipedia.org/zh-tw/%E6%99%82%E9%96%93%E5%BA%8F%E5%88%97))

### 地理資訊
地理參照資料描述地球表面（包括大氣層和較淺的地表下空間）空間要素的位置和屬性，在GIS中的兩種地理資料成分：空間資料，與空間要素幾何特性有關；屬性資料，提供空間要素的資訊。
(參考: [wikipedia](https://zh.wikipedia.org/wiki/%E5%9C%B0%E7%90%86%E4%BF%A1%E6%81%AF%E7%B3%BB%E7%BB%9F))

## 資料集簡介
### 資料屬性說明
#### 1. 台北市 Youbike 行車租借資料
- **來源**: [政府開放資料 - 臺北市公共自行車租借紀錄](https://data.gov.tw/dataset/139301)
- **說明**: 包含台北市 2016.1 ~ 2021.11 所有站點的 trip base 的資訊(借還站點、時間)
- **補充**:
    - 指選取現在有在使用的站點(spot_info 中的站點)。
    - 不包含進(出)台北市外的 trip。
- **欄位**:
    - date: 日期(yyyy-mm-dd)
    - hour: 第幾小時發生的(0-23)
    - trip_duration: 借用到歸還的的時間
    - rent_sno: 借用的站點編號
    - return_sno: 歸還的站點編號

#### 2. 台北市 Youbike 站點資訊
- **來源**: [政府開放資料 - YouBike臺北市公共自行車即時資訊](https://data.gov.tw/dataset/128706)
- **說明**: 台北市 YouBike 即時的存量狀態 api，其中包含經緯度與區域資訊
- **欄位**:
    - sno: 站點編號
    - sna: 站點名稱
    - tot: 腳踏車位的數量
    - sarea: 區域名
    - lat: 緯度
    - lng: 經度
    - ar: 地址
    - sareaen: 區域名(英文)
    - snaen: 站點名稱(英文)
    - aren: 地址(英文)

### Data abstraction 分析
- data types: 
  - items: 借到還的trip
  - attribute: 借車站點、還車站點、租借時間、借車時間點（1小時區間）、還車時間點（1小時區間）
  - link: 借到還車的站點
  - position: 站點經緯度
- dataset type
  - tables: 以trip 為 items （記錄每筆trip的開始結束時間與地點）、以固定時間與站點為items（記錄每固定時間各站點的借、還變化量）
  - network：每次 trip  link、每個站點為 node、attribute 為一段時間該有多少 trip 通過對應的 link 
  - geometry: 每個站點包含經緯度，在地圖上顯示各站點的位置，也可以結合 network 使用。


## 動機背景 & 預期任務
### 動機背景
共享單車ubike從2012年推行至今已有十年，儼然成為臺北市的城市風景，舉凡通勤、休閒，ubike已是市民的生活的一部分。站點、借還車資料除了系統維護的需求，也可一窺市民對生活中「行」的需要與人流移動、地理空間資訊。
而我們希望透過上課所學到的這些知識與技巧將這些資料視覺化，提供一個能夠快速瀏覽相關資訊的平台

- 透過蒐集臺北市UBIKE自行車站點存量及租借起迄資料，藉由資訊視覺化技術，並結合地理資訊，呈現站點存量時序變化、借還車事件之Heatmap變化，再輔以社群運算技術分析不同community在地圖上的時間序變化，以**dashboard的視覺化形式**呈現出來，可以對這些資訊做一個快速瀏覽
- 透過這些將這些基礎資訊進行統整處理後，做出一些**資訊分析**，如時間內的站點事件共線關係，因果關係...等


### 預期任務

#### 基礎任務 
- **task 1 abstraction: 站點的借還車事件隨著時間以Heatmap方式呈現(試著觀察看看是否有pattern存在)**
  - <details  markdown="1">
      <summary style="font-weight: bold;">(action,target) = (Present,features )</summary>
      
      - Action/Analyze
        - Present： 呈現站點的車輛個小時總體變化為減少會增加或借鑾車事件數量
      - Target/All Data
        - features: 
            - 可能的特徵為:
                - 還車數量-借車數量，若<0 站點的總體車輛減少;反之則增加。
                - 單純還車數量或借車數量 
      - 預期呈現方法：
        - 程式碼範例:
        - https://observablehq.com/@mbostock/electric-usage-2019
      <p>
          <img src="https://i.imgur.com/2WSPw5S.png" alt="範例圖">

    - 範例圖來源：[A Visualization Based Analysis to Assist Rebalancing Issues Related to Last Mile Problem for Bike Sharing Programs in China: A Big-Data Case Study on Mobike](https://www.researchgate.net/profile/Ercument-Gorgul/publication/334261011_A_Visualization_Based_Analysis_to_Assist_Rebalancing_Issues_Related_to_Last_Mile_Problem_for_Bike_Sharing_Programs_in_China_A_Big-Data_Case_Study_on_Mobike/links/5ebbf455299bf1c09ab9fd56/A-Visualization-Based-Analysis-to-Assist-Rebalancing-Issues-Related-to-Last-Mile-Problem-for-Bike-Sharing-Programs-in-China-A-Big-Data-Case-Study-on-Mobike.pdf?origin=publication_detail)
     </details>
     
- **task 2 abstraction: 站點的借還車事件隨著時間以折線圖方式呈現**
  - <details  markdown="1">
      <summary style="font-weight: bold;">(action,target) = (Present,features )</summary>
      
      - Action/Analyze
        - Present： 
      - Target/All Data 
        - features: 
      - 預期呈現方法：
        - 程式碼範例:https://plnkr.co/edit/RJk5vmROVAJGPHIPutVR?p=preview&preview
      <p>
          <img src="https://i.imgur.com/Zjl9hGq.png" alt="範例圖">

    - 範例圖來源：[A Visualization Based Analysis to Assist Rebalancing Issues Related to Last Mile Problem for Bike Sharing Programs in China: A Big-Data Case Study on Mobike](https://www.researchgate.net/profile/Ercument-Gorgul/publication/334261011_A_Visualization_Based_Analysis_to_Assist_Rebalancing_Issues_Related_to_Last_Mile_Problem_for_Bike_Sharing_Programs_in_China_A_Big-Data_Case_Study_on_Mobike/links/5ebbf455299bf1c09ab9fd56/A-Visualization-Based-Analysis-to-Assist-Rebalancing-Issues-Related-to-Last-Mile-Problem-for-Bike-Sharing-Programs-in-China-A-Big-Data-Case-Study-on-Mobike.pdf?origin=publication_detail)
     </details>
     
- **task 3 abstraction: 以社群運算技術分析並呈現起迄站點之community在地圖上的時間序變化**
  - <details  markdown="1">
      <summary style="font-weight: bold;">(action,target) = (derive,shape)</summary>
      
      - Action/Analyze -> Produce
        - derive: 以起迄站點建立graph，再運用社群運算技術產出站點間community資料
      - Target/Spatial data 
        - shape: 將community資料，以bubble map方式在地圖上呈現每小時的變化
      - 預期呈現方法：
        - 程式碼範例:
        - https://observablehq.com/@d3/bubble-map
      <p>
          <img src="https://imgur.com/dTPvG8n.png" alt="範例圖">

    - 範例圖來源：[臺北市公共自行車站點需求分析之研究](http://thesis.lib.nccu.edu.tw/cgi-bin/gs32/gsweb.cgi/login?o=dstdcdr&s=id=%22G0104257010%22.&searchmode=basic)
     </details>
     
- **task 4 abstraction: 將站點存量的時序圖結合地理地圖的方式呈現**
  - <details  markdown="1">
      <summary style="font-weight: bold;">(action,target) = (Present, All data-features)</summary>
      
      - Action/Analyze
        - Present： 呈現站點的存量
      - Target/All Data
        - features: 個別站點上所有時間點的存量(如果是以trip-based的資料為主的話，就改成進出口量)
      - 預期呈現方法：
        - 程式碼範例： https://leafletjs.com/SlavaUkraini/examples/quick-start/
      <p>
          <img src="https://i.imgur.com/gjVIFVe.png" alt="範例圖">
          <em>範例圖, 來源：https://airbox.edimaxcloud.com/</em>
      </p>

#### 進階任務
- **task 1 abstraction: 使用 Correlogram 的方式呈現一段時間內事件共線關係** 
  - 可以配合地圖上站點連線的方式呈現，像是點下面的原點可以把那條 link 在地圖上顯示出來。可以解決在地圖上把所有關聯都畫出來太亂的問題，還有對量的感覺上，原點大小會比現更明確。

  - <details  markdown="1"><summary style="font-weight: bold;">(action,target) = (Present, features)</summary>

    - Action/Analyze
        - Present： 呈現在一個時間區間內各站點間的關係。關係可以用 [[2]](#ref-2) 事件偵測方式 -> 計算不同站點間前、同時、後的事件強度關係。
    - Target/All Data 
        - features: 站點間事件關係
    - 預期呈現方法：
        - 程式碼範例:https://observablehq.com/@d3/multi-line-chart
          <img src="https://i.imgur.com/ByxgwUb.png" alt="範例圖">
         - [地圖上畫線](https://stackoverflow.com/questions/18493505/straight-lines-on-map-in-d3-js)
         - D3 + leaflet
             - https://observablehq.com/@sfu-iat355/intro-to-leaflet-d3-interactivity
             - https://d3-graph-gallery.com/graph/bubblemap_leaflet_basic.html

    </details>

- **task 2 abstraction: 在地圖上同時呈現不同時間區間，以站點為中心不同流量的方向** 
  - <details  markdown="1">
      <summary style="font-weight: bold;">(action,target) = (Present, features)</summary>
      
      - Action/Analyze
        - Present： 參考 [[3]](#ref-3) 做的圖，可以在地圖上顯示各站點的在不同時間的流量方向
      - Target/All Data 
        - features: 不同時區的站點流量方向資訊
      - 預期呈現方法：
          - 原圖: [[3]](#ref-3)

          <br><a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0137922"><img src="https://i.imgur.com/8w8f96Y.jpg" alt="範例圖"></a>
            
        - 程式碼範例:

        <br><a href="https://observablehq.com/@d3/radial-stacked-bar-chart"><img src="https://i.imgur.com/jQQkbxz.png" alt="範例圖"></a>
        <br><a href="https://d3-graph-gallery.com/graph/bubblemap_leaflet_basic.html"><img src="https://i.imgur.com/Ecb6pI0.png" alt="範例圖"></a>
        
    </details>


## 預期呈現方法

![](https://i.imgur.com/A74G5aH.png)
![](https://i.imgur.com/Pp3vBtz.png)
![](https://i.imgur.com/Mpgdl2z.png)
![](https://i.imgur.com/u4yTABF.png)


## 參考文獻
[1] Z. Deng et al., "Compass: Towards Better Causal Analysis of Urban Time Series," in IEEE Transactions on Visualization and Computer Graphics, vol. 28, no. 1, pp. 1051-1061, Jan. 2022, doi: 10.1109/TVCG.2021.3114875. <a id="ref-1"></a>

[2] J. Li, S. Chen, K. Zhang, G. Andrienko and N. Andrienko, "COPE: Interactive Exploration of Co-Occurrence Patterns in Spatial Time Series," in IEEE Transactions on Visualization and Computer Graphics, vol. 25, no. 8, pp. 2554-2567, 1 Aug. 2019, doi: 10.1109/TVCG.2018.2851227. <a id="ref-2"></a>

[3] Zhou, Xiaolu. "Understanding spatiotemporal patterns of biking behavior by analyzing massive bike sharing data in Chicago." PloS one 10.10 (2015): e0137922. <a id="ref-3"></a>

[4] Yan, Y., Tao, Y., Xu, J. et al. Visual analytics of bike-sharing data based on tensor factorization. J Vis 21, 495–509 (2018). https://doi.org/10.1007/s12650-017-0463-1 <a id="ref-4"></a>

[5] Mao, Dianhui, et al. "A novel dynamic dispatching method for bicycle-sharing system." ISPRS International Journal of Geo-Information 8.3 (2019): 117. <a id="ref-5"></a>

[6] Zhang, Xiaoyi, Yurong Chen, and Yang Zhong. "Spatial and Temporal Characteristic Analysis of Imbalance Usage in the Hangzhou Public Bicycle System." ISPRS International Journal of Geo-Information 10.10 (2021): 637. <a id="ref-6"></a>

[7] Boufidis, Neofytos, et al. "Development of a station-level demand prediction and visualization tool to support bike-sharing systems’ operators." Transportation Research Procedia 47 (2020): 51-58.<a id="ref-7"></a>

[8] Mesbah, Mahmoud, et al. "Spatial and temporal visualization of transit operations performance data at a network level." Journal of Transport Geography 25 (2012): 15-26. <a id="ref-"></a>

[9] Gorgul, Ercument, and Chaoran Chen. "A visualization based analysis to assist rebalancing issues related to last mile problem for bike sharing programs in China: a big-data case study on mobike." The International Conference on Computational Design and Robotic Fabrication. Springer, Singapore, 2019.<a id="ref-9"></a>

[10] Krueger, Robert, et al. "Bird's‐Eye‐Large‐Scale Visual Analytics of City Dynamics using Social Location Data." Computer Graphics Forum. Vol. 38. No. 3. 2019. <a id="ref-10"></a>

[11] <a id="ref-11"></a>  [臺北市公共自行車站點需求分析之研究](http://thesis.lib.nccu.edu.tw/cgi-bin/gs32/gsweb.cgi/login?o=dstdcdr&s=id=%22G0104257010%22.&searchmode=basic)

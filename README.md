PageRank (PR) example using NVIDIA's Graph Library nvGraph.

```bash
## Setup log file, unlimited stack
$ export out="/path/to/nvgraph.log"
$ ulimit -s unlimited
$ printf "" > "$out"

## Download program
## nvGraph can be installed from conda
$ rm -rf pagerank-nvgraph
$ git clone https://github.com/cudaf/pagerank-nvgraph
$ cd pagerank-nvgraph

## Run on graphs, write log
$ nvcc -Xcompiler -fopenmp -lnvgraph -O3 main.cu
$ stdbuf --output=L ./a.out ~/data/web-Stanford.mtx | tee -a "$out"
...
```

```bash
Loading graph /home/subhajit/data/web-Stanford.mtx ...
order: 281903 size: 2312497 {}
order: 281903 size: 2312497 {}
[11.099 ms] pageRank

Loading graph /home/subhajit/data/web-BerkStan.mtx ...
order: 685230 size: 7600595 {}
order: 685230 size: 7600595 {}
[16.417 ms] pageRank

Loading graph /home/subhajit/data/web-Google.mtx ...
order: 875713 size: 5105039 {}
order: 875713 size: 5105039 {}
[19.134 ms] pageRank

Loading graph /home/subhajit/data/web-NotreDame.mtx ...
order: 325729 size: 1497134 {}
order: 325729 size: 1497134 {}
[8.540 ms] pageRank

Loading graph /home/subhajit/data/indochina-2004.mtx ...
order: 7414768 size: 194109311 {}
order: 7414768 size: 194109311 {}
[193.386 ms] pageRank

Loading graph /home/subhajit/data/soc-Slashdot0811.mtx ...
order: 77360 size: 905468 {}
order: 77360 size: 905468 {}
[6.919 ms] pageRank

Loading graph /home/subhajit/data/soc-Slashdot0902.mtx ...
order: 82168 size: 948464 {}
order: 82168 size: 948464 {}
[6.700 ms] pageRank

Loading graph /home/subhajit/data/soc-Epinions1.mtx ...
order: 75879 size: 508837 {}
order: 75879 size: 508837 {}
[6.588 ms] pageRank

Loading graph /home/subhajit/data/soc-LiveJournal1.mtx ...
order: 4847571 size: 68993773 {}
order: 4847571 size: 68993773 {}
[167.682 ms] pageRank

Loading graph /home/subhajit/data/coAuthorsDBLP.mtx ...
order: 299067 size: 977676 {}
order: 299067 size: 977676 {}
[3.473 ms] pageRank

Loading graph /home/subhajit/data/coAuthorsCiteseer.mtx ...
order: 227320 size: 814134 {}
order: 227320 size: 814134 {}
[3.703 ms] pageRank

Loading graph /home/subhajit/data/coPapersCiteseer.mtx ...
order: 434102 size: 16036720 {}
order: 434102 size: 16036720 {}
[11.320 ms] pageRank

Loading graph /home/subhajit/data/coPapersDBLP.mtx ...
order: 540486 size: 15245729 {}
order: 540486 size: 15245729 {}
[11.295 ms] pageRank

Loading graph /home/subhajit/data/italy_osm.mtx ...
order: 6686493 size: 7013978 {}
order: 6686493 size: 7013978 {}
[58.791 ms] pageRank

Loading graph /home/subhajit/data/great-britain_osm.mtx ...
order: 7733822 size: 8156517 {}
order: 7733822 size: 8156517 {}
[68.087 ms] pageRank

Loading graph /home/subhajit/data/germany_osm.mtx ...
order: 11548845 size: 12369181 {}
order: 11548845 size: 12369181 {}
[101.705 ms] pageRank

Loading graph /home/subhajit/data/asia_osm.mtx ...
order: 11950757 size: 12711603 {}
order: 11950757 size: 12711603 {}
[102.428 ms] pageRank
```

<br>
<br>


## References

- [nvGraph pagerank example, EN605.617, JHU-EP-Intro2GPU](https://github.com/JHU-EP-Intro2GPU/EN605.617/blob/master/module9/nvgraph_examples/nvgraph_Pagerank.cpp)
- [nvGraph pagerank example, CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/archive/10.0/nvgraph/index.html#nvgraph-pagerank-example)
- [nvGraph, CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/archive/10.0/nvgraph/index.html#introduction)
- [RAPIDS nvGraph NVIDIA graph library](https://github.com/rapidsai/nvgraph)

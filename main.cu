#include <stdio.h>
#include <nvgraph.h>
#include "src/main.h"

using namespace std;




int main(int argc, char **argv) {
  printf("Loading graph ...\n");
  DiGraph<> g;
  readMtx(argv[1], g);
  print(g);

  DiGraph<int, float, float> h;
  transposeForNvgraph(g, h);
  print(h);

  // runPageRank(h);
  return 0;
}

#include <vector>
#include <stdio.h>
#include "src/main.h"

using namespace std;




template <class G>
void runPageRank(G& x, float p=0.85f, float E=1e-6f) {
  nvgraphHandle_t     h;
  nvgraphGraphDescr_t g;
  struct nvgraphCSCTopology32I_st csc;
  vector<cudaDataType_t> vtype {CUDA_R_32F, CUDA_R_32F};
  vector<cudaDataType_t> etype {CUDA_R_32F};
  vector<float> ranks(x.order());
  auto vfrom = x.sourceOffsets();
  auto efrom = x.destinationIndices();
  auto vdata = x.vertexData();
  auto edata = x.edgeData();

  TRY( nvgraphCreate(&h) );
  TRY( nvgraphCreateGraphDescr(h, &g) );

  csc.nvertices = x.order();
  csc.nedges    = x.size();
  csc.destination_offsets = vfrom.data();
  csc.source_indices      = efrom.data();
  TRY( nvgraphSetGraphStructure(h, g, &csc, NVGRAPH_CSC_32) );

  TRY( nvgraphAllocateVertexData(h, g, vtype.size(), vtype.data()) );
  TRY( nvgraphAllocateEdgeData(h, g, etype.size(), etype.data()) );
  TRY( nvgraphSetVertexData(h, g, vdata.data(), 0) );
  TRY( nvgraphSetVertexData(h, g, ranks.data(), 1) );
  TRY( nvgraphSetEdgeData(h, g, edata.data(), 0) );

  float t = measureDuration([&]() { TRY( nvgraphPagerank(h, g, 0, &p, 0, 0, 1, E, 0) ); });
  TRY( nvgraphGetVertexData(h, g, ranks.data(), 1) );
  printf("[%07.1f ms] pageRank\n", t); print(ranks);

  TRY( nvgraphDestroyGraphDescr(h, g) );
  TRY( nvgraphDestroy(h) );
}


int main(int argc, char **argv) {
  printf("Loading graph ...\n");
  DiGraph<> g;
  readMtx(argv[1], g);
  print(g);

  DiGraph<int, float, float> h;
  transposeForNvgraph(g, h);
  print(h);

  runPageRank(h);
  return 0;
}

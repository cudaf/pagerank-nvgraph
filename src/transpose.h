#pragma once




// Reverses all links.
template <class G, class H>
auto& transpose(G& x, H& a) {
  for (auto u : x.vertices())
    a.addVertex(u, x.vertexData(u));
  for (auto u : x.vertices()) {
    for (auto v : x.edges(u))
      a.addEdge(v, u, x.edgeData(u, v));
  }
  return a;
}




template <class G, class H>
auto& transposeForNvgraph(G& x, H& a) {
  using V = typename H::TVertex;
  using E = typename H::TEdge;
  for (auto u : x.vertices())
    a.addVertex(u, x.degree(u) == 0? V(1) : V(0));
  for (auto u : x.vertices()) {
    for (auto v : x.edges(u))
      a.addEdge(v, u, E(1)/x.degree(u));
  }
  return a;
}

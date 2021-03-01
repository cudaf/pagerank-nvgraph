PageRank (PR) example using NVIDIA's Graph Library nvGraph.

```bash
Loading graph ...
order: 29008 size: 38416 {}
order: 29008 size: 38416 {}
[00004.8 ms] pageRank


==14161== NVPROF is profiling process 14161, command: ./a.out data/aug2d.mtx
==14161== Profiling application: ./a.out data/aug2d.mtx
==14161== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   36.35%  778.81us       102  7.6350us  7.2960us  9.4720us  void nrm2_kernel<float, float, float, int=1, int=0, int=128>(cublasNrm2Params<float, float>)
                   10.78%  231.04us        25  9.2410us  9.1200us  9.5360us  void nvgraph::DeviceSpmvKernel<nvgraph::SpmvBlockThread<int=128, int=4>, int, float, nvgraph::PlusTimesSemiring<float>, bool=0, bool=0>(nvgraph::CsrMvParams<int=4, nvgraph::SpmvBlockThread<int=128, int=4>>, int const &, nvgraph::Coord<nvgraph::CsrMvParams>*, nvgraph::CsrMvParams*, int=4*, int)
                   10.00%  214.24us        25  8.5690us  8.5120us  8.9600us  void nvgraph::DeviceSpmvSearchKernel<nvgraph::SpmvBlockThread<int=128, int=4>, int, float>(int, nvgraph::Coord<int=4>*, nvgraph::CsrMvParams<nvgraph::Coord, nvgraph::SpmvBlockThread<int=128, int=4>>)
                    7.60%  162.91us        50  3.2580us  3.0400us  3.5520us  void axpy_kernel_val<float, float>(cublasAxpyParamsVal<float, float, float>)
                    6.72%  143.90us        52  2.7670us  2.5920us  3.1680us  void scal_kernel_val<float, float>(cublasScalParamsVal<float, float>)
                    6.70%  143.52us        57  2.5170us  1.4390us  15.264us  [CUDA memcpy HtoD]
                    6.57%  140.80us        25  5.6320us  5.5360us  6.1120us  void dot_kernel<float, int=128, int=0, cublasDotParams<cublasGemvTensor<float const >, cublasGemvTensorStridedBatched<float>>>(float const )
                    6.28%  134.53us        78  1.7240us  1.5680us  10.240us  [CUDA memcpy DtoH]
                    4.70%  100.64us        25  4.0250us  3.9680us  4.6710us  void reduce_1Block_kernel<float, int=128, int=7, cublasGemvTensorStridedBatched<float>, cublasGemvTensorStridedBatched<float>>(float const *, float, float, int, float const *, float, cublasGemvTensorStridedBatched<float>, cublasPointerMode_t)
                    3.27%  70.080us        25  2.8030us  2.7520us  3.1040us  void nvgraph::DeviceSegmentReductionByKeyKernel<nvgraph::SpmvBlockThread<int=128, int=3>, int, float, nvgraph::PlusTimesSemiring<float>>(int=3*, nvgraph::SpmvBlockThread<int=128, int=3>*, nvgraph::SpmvBlockThread<int=128, int=3>, nvgraph::DeviceSegmentReductionByKeyKernel<nvgraph::SpmvBlockThread<int=128, int=3>, int, float, nvgraph::PlusTimesSemiring<float>>, int, int)
                    0.24%  5.2480us         1  5.2480us  5.2480us  5.2480us  void thrust::cuda_cub::cub::DeviceReduceKernel<thrust::cuda_cub::cub::DeviceReducePolicy<float, int, thrust::plus<float>>::Policy600, thrust::device_ptr<float>, float*, int, thrust::plus<float>>(int, float, thrust::plus<float>, thrust::cuda_cub::cub::GridEvenShare<float>, thrust::cuda_cub::cub::DeviceReducePolicy<float, int, thrust::plus<float>>::Policy600)
                    0.24%  5.2160us         1  5.2160us  5.2160us  5.2160us  void thrust::cuda_cub::cub::DeviceReduceSingleTileKernel<thrust::cuda_cub::cub::DeviceReducePolicy<float, int, thrust::plus<float>>::Policy600, float*, float*, int, thrust::plus<float>, float>(int, float, thrust::plus<float>, thrust::cuda_cub::cub::DeviceReducePolicy<float, int, thrust::plus<float>>::Policy600, float*)
                    0.23%  4.9920us         2  2.4960us  2.1440us  2.8480us  void thrust::cuda_cub::core::_kernel_agent<thrust::cuda_cub::__parallel_for::ParallelForAgent<thrust::cuda_cub::__fill::functor<thrust::device_ptr<float>, float>, long>, thrust::cuda_cub::__fill::functor<thrust::device_ptr<float>, float>, long>(thrust::device_ptr<float>, float)
                    0.16%  3.5200us         1  3.5200us  3.5200us  3.5200us  void thrust::cuda_cub::core::_kernel_agent<thrust::cuda_cub::__parallel_for::ParallelForAgent<thrust::cuda_cub::__transform::unary_transform_f<thrust::device_ptr<float>, thrust::device_ptr<float>, thrust::cuda_cub::__transform::no_stencil_tag, thrust::identity<float>, thrust::cuda_cub::__transform::always_true_predicate>, long>, thrust::cuda_cub::__transform::unary_transform_f<thrust::device_ptr<float>, thrust::device_ptr<float>, thrust::cuda_cub::__transform::no_stencil_tag, thrust::identity<float>, thrust::cuda_cub::__transform::always_true_predicate>, long>(thrust::device_ptr<float>, thrust::device_ptr<float>)
                    0.14%  3.0720us         1  3.0720us  3.0720us  3.0720us  void nvgraph::update_dn_kernel<float>(int, float*, nvgraph::update_dn_kernel<float>)
      API calls:   99.30%  787.67ms        21  37.508ms     415ns  787.38ms  cudaFree
                    0.23%  1.8080ms       128  14.124us  3.2400us  32.069us  cudaMemcpyAsync
                    0.22%  1.7731ms       335  5.2920us  4.0010us  31.874us  cudaLaunchKernel
                    0.04%  343.27us         1  343.27us  343.27us  343.27us  cuDeviceTotalMem
                    0.04%  303.57us         7  43.366us  20.991us  54.147us  cudaMemcpy
                    0.03%  223.44us        16  13.964us  1.9250us  165.41us  cudaMalloc
                    0.02%  190.99us        81  2.3570us  2.0160us  12.431us  cudaFuncGetAttributes
                    0.02%  168.44us        97  1.7360us     126ns  69.657us  cuDeviceGetAttribute
                    0.02%  142.76us        77  1.8540us  1.2290us  6.9890us  cudaStreamSynchronize
                    0.01%  112.98us        76  1.4860us  1.3830us  2.2710us  cudaEventQuery
                    0.01%  94.195us       169     557ns     360ns  7.6520us  cudaFuncSetAttribute
                    0.01%  92.981us       596     156ns     116ns  11.663us  cudaGetLastError
                    0.01%  78.227us       199     393ns     276ns  8.2230us  cudaGetDevice
                    0.01%  56.445us        76     742ns     671ns  2.3570us  cudaEventRecord
                    0.01%  45.630us         7  6.5180us  1.7040us  17.773us  cudaDeviceSynchronize
                    0.01%  42.304us       126     335ns     274ns  1.8240us  cudaDeviceGetAttribute
                    0.00%  30.048us         1  30.048us  30.048us  30.048us  cuDeviceGetName
                    0.00%  14.344us        16     896ns     567ns  3.6990us  cudaEventDestroy
                    0.00%  11.679us        16     729ns     370ns  3.9970us  cudaEventCreateWithFlags
                    0.00%  7.7430us         1  7.7430us  7.7430us  7.7430us  cuDeviceGetPCIBusId
                    0.00%  6.8960us         5  1.3790us     565ns  2.1020us  cudaSetDevice
                    0.00%  2.4000us         2  1.2000us     553ns  1.8470us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
                    0.00%  2.2450us         3     748ns     131ns  1.7210us  cuDeviceGetCount
                    0.00%  1.3920us         2     696ns     340ns  1.0520us  cuDeviceGet
                    0.00%  1.2560us         8     157ns     116ns     212ns  cudaPeekAtLastError
                    0.00%     228ns         1     228ns     228ns     228ns  cuDeviceGetUuid
```

<br>
<br>


## Usage

```bash
# Download program & install nvGraph
rm -rf pagerank-nvgraph
git clone https://github.com/cudaf/pagerank-nvgraph
cd pagerank-nvgraph && chmod 777 *.sh
cd pagerank-nvgraph && ./install.sh
```

```bash
# Run program
!cd pagerank-nvgraph && nvcc -Xcompiler -fopenmp -lnvgraph -O3 main.cu && nvprof ./a.out data/aug2d.mtx
```

<br>
<br>


## References

- [nvGraph pagerank example, EN605.617, JHU-EP-Intro2GPU](https://github.com/JHU-EP-Intro2GPU/EN605.617/blob/master/module9/nvgraph_examples/nvgraph_Pagerank.cpp)
- [nvGraph pagerank example, CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/archive/10.0/nvgraph/index.html#nvgraph-pagerank-example)
- [nvGraph, CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/archive/10.0/nvgraph/index.html#introduction)
- [RAPIDS nvGraph NVIDIA graph library](https://github.com/rapidsai/nvgraph)
- [pagerank, libcugraph Documentation](https://docs.rapids.ai/api/libcugraph/legacy/namespacecugraph.html#a8e07829e671204ff42aa226f40ff92d5)
- [RAPIDS cuGraph GPU Graph Analytics Library](https://github.com/rapidsai/cugraph)
- [RAPIDS CUDA DataFrame Internals for C++ Developers - S91043](https://developer.download.nvidia.com/video/gputechconf/gtc/2019/presentation/s91043-rapids-cuda-dataframe-internals-for-c++-developers.pdf)

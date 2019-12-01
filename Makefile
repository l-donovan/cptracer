CUDA_LIB64_LOC = /usr/local/pacerepov1/cuda/9.1/lib64
CUDA_INCLUDE_LOC = /usr/local/pacerepov1/cuda/9.1/include

CPP_SOURCE = src
CUDA_SOURCE = src/cuda
BUILD_DIR = build
EXEC_NAME = cptracer

all:
	mkdir -p $(BUILD_DIR)
	nvcc -o $(BUILD_DIR)/*.o -c $(CUDA_SOURCE)/*.cu -std=c++11
	g++ -o $(EXEC_NAME) $(CPP_SOURCE)/*.cpp $(BUILD_DIR)/*.o -L$(CUDA_LIB64_LOC) -I$(CUDA_INCLUDE_LOC) -lcudart -std=c++11

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(EXEC_NAME)


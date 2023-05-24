# Alias helper
source .env
GPU_ARGS="--gpus all"
alias llama.cpp="docker run ${GPU_ARGS} -v ${LOCAL_MODEL_DIR}:/models localagi/llama.cpp:${LLAMA_CPP_VERSION}${LLAMA_CPP_FLAVOR}"
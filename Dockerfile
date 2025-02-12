FROM pytorch/pytorch:2.6.0-cuda12.4-cudnn9-devel
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple uv

RUN apt update && \
    apt install -y espeak-ng && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . ./

RUN uv pip install --system --index-url https://pypi.tuna.tsinghua.edu.cn/simple -e . && uv pip install --system --index-url https://pypi.tuna.tsinghua.edu.cn/simple -e .[compile]

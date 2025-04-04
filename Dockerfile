FROM debian:bookworm-slim
COPY custombenchmarkmodels.yml .
RUN apt update && apt install -y curl python3 python3-pip && pip install llm-benchmark --break-system-packages
RUN curl -L https://ollama.com/download/ollama-linux-amd64.tgz -o ollama-linux-amd64.tgz && tar -C /usr -xzf ollama-linux-amd64.tgz && rm ollama-linux-amd64.tgz

ENTRYPOINT ["/usr/bin/bash", "-c", "/bin/ollama serve & sleep 5; ollama pull deepseek-r1:1.5b && llm_benchmark run --custombenchmark custombenchmarkmodels.yml"]

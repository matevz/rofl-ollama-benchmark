# Oasis ROFL ollama benchmark tool

A simple tool to measure how fast is a ROFL instance executing LLMs
based on https://github.com/aidatatools/ollama-benchmark.


## To launch a new ROFL benchmark instance on your node

Adapt `rofl.yaml` to fit your needs. The tokens/s is usually what you want to
measure in combination with the number of CPUs (tested with up to 16 CPUs).

Then build the ROFL bundle with the [Oasis CLI].

```shell
oasis rofl build
```

And push it on-chain:

```shell
oasis rofl update
oasis rofl deploy
```

Check the logs of your provider machine for the benchmark results.

[Oasis CLI]: https://github.com/oasisprotocol/cli

## Preliminary results

Some results can be found in `results/` folder. Plain benchmarks were executed
with:

```shell
podman run -it --cpus 16 --memory 8g docker.io/matevz/ollama-benchmark
docker run -it --cpus 16 --memory 8g docker.io/matevz/ollama-benchmark
```

And then passing various number of the `--cpus` parameter.


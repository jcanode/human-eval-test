from python:3.9-slim


# RUN apt-get update

# RUN apt-get install git -y

WORKDIR /app

COPY /human-eval /app/human-eval

# RUN git clone https://github.com/openai/human-eval

RUN pip install -e human-eval

COPY samples.jsonl /app/samples.jsonl
# COPY samples-WC-2b.jsonl /app/samples.jsonl
# WORKDIR /app/human-eval/ 
# ENTRYPOINT [ "/bin/bash" ]

ENTRYPOINT ["python", "/app/human-eval/human_eval/evaluate_functional_correctness.py", "--sample_file", "/app/samples.jsonl"]
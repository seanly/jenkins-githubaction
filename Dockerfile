FROM python:3.7.13-slim AS builder
ADD . /app
WORKDIR /app

RUN <<EOF
pip install --target=/app git+https://github.com/seanly/api4jenkins.git@opsbox
pip install --target=/app requests==2.28.1
EOF

# A distroless container image with Python and some basics like SSL certificates
# https://github.com/GoogleContainerTools/distroless
FROM gcr.io/distroless/python3-debian10
COPY --from=builder /app /app
WORKDIR /app
ENV PYTHONPATH=/app
CMD ["/app/main.py"]

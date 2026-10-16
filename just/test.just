# Run all unit, integration, binary, and documentation tests.
[group('test')]
test args="" doc_args="":
  cargo nextest run --all-targets {{ args }}
  cargo test --doc {{ doc_args }}

# Generate an LCOV coverage report.
[group('test')]
coverage output="lcov.info":
  cargo llvm-cov nextest --all-targets --lcov --output-path {{ output }}

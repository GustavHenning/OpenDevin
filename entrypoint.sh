#!/bin/bash

# List of required environment variables
required_vars=("OPENAI_API_KEY" "LLM_MODEL" "LLM_API_KEY" "LLM_BASE_URL" "LLM_EMBEDDING_MODEL")

missing_counter=0

for var in "${required_vars[@]}"; do
  if [ -z "${!var}" ]; then
    echo "Error: $var is not set."
    ((missing_counter++))
  fi
done

if [ $missing_counter -ne 0 ]; then
  echo "Please ensure all required environment variables are set in the .env file."
  exit 1
fi

# Proceed to execute the main container command
exec "$@"

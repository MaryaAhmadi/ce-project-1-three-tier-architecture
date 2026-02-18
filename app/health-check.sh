#!/bin/bash

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/health)

if [ "$STATUS" -eq 200 ]; then
  echo "Health check PASSED"
  exit 0
else
  echo "Health check FAILED"
  exit 1
fi

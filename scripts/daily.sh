#!/bin/bash 

echo "Beginning contributions update for $(date)"
YEAR=$(date +%Y)
SECRET_API_KEY=$(grep '^SECRET_API_KEY=' .env | cut -d '=' -f2-)
curl -X POST "http://localhost:3000/contributions?year=$YEAR" -H "X-API-Key: $SECRET_API_KEY"

#!/bin/bash

# Prompt the user for a number
read -p "Enter a number to generate its multiplication table: " number

# Check if the number is a valid integer
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

# Ask the user for the table range choice
read -p "Do you want a full table (1 to 10) or a custom range? Type 'full' or 'custom': " choice

# Logic for full table (1 to 10)
if [[ "$choice" == "full" ]]; then
  echo "Multiplication Table for $number (1 to 10):"
  for i in {1..10}; do
    echo "$number x $i = $((number * i))"
  done

# Logic for custom range
elif [[ "$choice" == "custom" ]]; then
  read -p "Enter the start of the range: " start
  read -p "Enter the end of the range: " end

  # Validate that start and end are valid numbers
  if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ ]]; then
    echo "Invalid range input. Please enter valid numbers."
    exit 1
  fi

  # Validate range order
  if (( start > end )); then
    echo "Invalid range. Start must be less than or equal to end."
    exit 1
  fi

  echo "Multiplication Table for $number ($start to $end):"
  for ((i=start; i<=end; i++)); do
    echo "$number x $i = $((number * i))"
  done

else
  echo "Invalid choice. Please type 'full' or 'custom'."
  exit 1
fi


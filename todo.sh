#!/bin/bash

TODO_FILE="todo.txt"

# Function to add a task
add_task() {
  echo "$1" >> $TODO_FILE
  echo "Task added: $1"
}

# Function to list all tasks
list_tasks() {
  if [[ -f $TODO_FILE && -s $TODO_FILE ]]; then
    echo "To-Do List:"
    cat $TODO_FILE
  else
    echo "No tasks in the to-do list."
  fi
}

# Function to remove a task by number
remove_task() {
  if [[ -f $TODO_FILE && -s $TODO_FILE ]]; then
    sed -i "${1}d" $TODO_FILE
    echo "Task $1 removed."
  else
    echo "No tasks to remove."
  fi
}

# Main menu
echo "To-Do List Manager"
echo "1. Add Task"
echo "2. List Tasks"
echo "3. Remove Task"
echo "4. Exit"
read -p "Choose an option (1-4): " option

case $option in
  1)
    read -p "Enter task description: " task
    add_task "$task"
    ;;
  2)
    list_tasks
    ;;
  3)
    read -p "Enter task number to remove: " task_number
    remove_task $task_number
    ;;
  4)
    echo "Exiting To-Do List Manager."
    exit 0
    ;;
  *)
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac

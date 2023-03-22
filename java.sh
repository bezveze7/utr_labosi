#!/bin/bash


read -p "Unesite PID procesa kojem želite poslati signal: " pid


while true
do

  echo " Odaberi signal:"
  echo "1. SIGTERM"
  echo "2. SIGUSR1"
  echo "3. SIGINT"
  

  read -p "Unesite opciju: " opcija


  case $opcija in
    1)
      echo "Slanje SIGTERM signala procesu s PID-om (CTRL + Z za kraj) $pid"
      kill -s term $pid
      ;;
    2)
      echo "Slanje SIGUSR1 signala procesu s PID-om (CTRL + Z za kraj) $pid"
      kill -s USR1 $pid
      ;;
    3)
      echo "Slanje SIGINT signala procesu s PID-om (CTRL + Z za kraj) $pid"
      kill -s INT $pid
      ;;
    *)
      echo "Pogrešna opcija. Molimo odaberite 1, 2 ili 3."
      ;;
  esac

done


#!/bin/bash

./ipinfo.sh | sed -n '/IP Adress:/ p'


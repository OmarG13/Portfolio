#!/bin/bash

./passwordcheck.sh

if test $? -eq 0
then 
    echo " 1. Create a folder "
    echo " 2. Copy a folder "
    echo " 3. Set a password "
else 
    exit 1
fi

read choice
case $choice in

1)
./foldercreator.sh
;;
2)
./foldercopier.sh
;;
3)
./setpassword.sh
;;
*)
echo invalid selection
;;
esac

echo "Thank you for using menu.sh"

exit 0